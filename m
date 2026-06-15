Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC1FCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=; b=areqtIhoU3QE35XreEe73u2Cjk
	kSDJSGTdEG2+gnKfVVbjRb3GZSCFCE/4lcNF9ljUW/ZciLYm3rsJQGhibOBHAUBy1qgLmTcQ/d8+Z
	jYtVhS2Q0OuuE9zJ1lLS4hGdScxzLiml46IZALOKJ2PzGZ15Xsi7dDkCJ4o8YYKtk1qS85C4KXqo2
	OFMb7Zx5Okgq2unt3nm3Hn0J6jbULwwGKARpHdgNdk/XJdTi2TAuetPzppKAA9jgnxeQ/h7Ph/oH+
	KfDKhwp2PWwoEYlltS3LIfjFN+YyxKdDKLlC9qVmaqafgpxBnBOzC/r0Exxnrqm+mMmcCePtq+X5c
	LIaLOUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAou-0000000Ecyr-0xrR;
	Mon, 15 Jun 2026 17:09:56 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAor-0000000Ecxm-0OKc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:09:54 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6912f4acca4so6311991a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781543391; cv=none;
        d=google.com; s=arc-20240605;
        b=au/2dRfOIe7r3w3P/7HQthXBsN5WpWz8FkAOY6xTZONilx1OLTINwzOIph+apU+l98
         4pzei2k10WlpvTmyI36q/0G40+LAYkFb4Gg8hzAHp1TudBcI0UElFRdbcTsXY9xNx+vO
         MqDcah4GTrGNy6cQ6qzXv2+dZkZXpux8fMz0x2GHszRwft3vd18N1467Y7jOaxg6T9H8
         CWsDHP5MD5Vyj5QM+6rrvvrhJUPy/3g9oV3yYlWGuHutLxjfq4SxSVbr63X9uxPQkGlO
         YBl67s+UWOrkFYtUWtPiyh52VZSNe64FHmKqCH5so+fV9V21SCWv+uuZFcoT2Ikjio9/
         b7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        fh=6EzKcdoadH9zdBOdz6dG/tl8uQqRo0zQFO6wcP1SwIA=;
        b=KF63dVHP4Bf7xpAUcjFb+OAne88rBJURp7zatSfype0GWeTNmfFWSrEwpPCyRuB4bN
         UpNQOLNEWuPaGe0yEp656VOBtYWhF+cCQci6sc7EMBUjSiJOiKNq9OezDMivxladCA4c
         K2TYFIV8RJ6SXs9I9lGegACXK5ikdDqz4lGPou4ocMimM8pye1dLALs1PFA81M/JRLEx
         WODQDcQYN14/hYRPpYS+gOB1BUsrUtxkrfvsHiOoQJRlBPgH/k8RrP9QdcUV5EMBouoQ
         IgZFd7bBDc3b4up4lnurGC4uwYgbNtvEtlTRv8nk3LUZ/+Dfa9yjE4qFH8XEKenZOvMu
         vUnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781543391; x=1782148191; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        b=paS1r+rIS6x7k5XuwuMP6x8OglWqB75bpNhzwdXcU36jhS8rSVyJ7K20fEO9KSI6jT
         p8M7xOaRXLqCxTc1NzkSfpq4M5lLBsKy7qZIalljgTSuxEUynzNwjaFTl+h3yfFzCiHo
         72cbSELTRDFDmFCBG+Zf2mIoWyQQCbygnlyMZNQmJoqnTzxcykX9dK9maX7KZ/ddnGQN
         iUKTHzPsTJpZ8qZ2HbNFh1uScGYawjWPuQ8gRYFnuKbGzLC9ztDFejF4+0TwTAHkqR49
         +TGJ5GkLFeprZloXyl1bvPcK+xuZYa0B5eIKAV24tJaUZI1j9V+zVvyKzfiis1RabHmf
         FcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781543391; x=1782148191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        b=nEw/5g9Wq0Gq0UPP7lAPGlHpIFf90xejUoWcIdlbZBp3d5sXIqt18ejCVcY8hxT2ex
         EH+Jt1SvaeDybogAIsSwHr2XcC4mnGXaYsbRWuComOsa0klrcDFow/SmvdfRbdoXIC2l
         W/4pzKQyBcSuKnu7c9de/yUbZSoBnS+OPFA8xBRadhZeoeYnQlq9qW5VGk4aNAzn+eDH
         0VhxVImTOcXa6Kb/gsIiXJxJq+CEZtRgMhjH8XWfZ5HEiDgKiiEHXD9vfTH8oKKn0dB+
         pKaGzM4/Ac3XEKAzUk7FHgdpvdwcfyIlcJPmuUN/9NU7nE74eI2TruUucEmArA0XjVw8
         ttzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bOucdq/4qHfUv9Shv20cAMl1XWOL5WqyPYgf2MlS+2JYZgcy5ZFbS92Qi3Hz8+3lXxblKFa9zYcSS9UE/K0l6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6tkuptO32hm+g45wigOAnVxtDDFK3JrD/wi/oK/WxXteB0KtE
	2JK4J0sgvi21O1brhfZpauorqsIIvjuNb5JCpuEyJM/rpIV5r8yCXWKddiJvwE3otlPGyOQSSyP
	T13NQ+irpxiwMxRug7CaiJ03bD4aSylA=
X-Gm-Gg: Acq92OG3U86Fk0C+FjiPBafbX4BE7XPDbg337YvV8/de/GIv5txe7/PLAq/rwTbN8rL
	C7LA5TJ31sl4Uh/nb4Hpz6eoHnUSgLQWh2TBA1QQXNadzIvNUFABxs1mfMnDrUAPNIoUEUWvlwT
	gw0Zj36f+VMXoOy82d93ZmxMrFTcCxBc7IXjWMNoyOjy90qJpON0IsDjCxjeilxNgDN79PkkGzT
	zNY5v08yvDetZbVRPjuIBaxLaoZgZTKhWQ+gvUwViVn9Oc8F4TvuP8isei8pkPwl4tec+oXDpUN
	cwfsfWiaqjYCvFtC
X-Received: by 2002:a17:907:3f8d:b0:bed:2a8b:3e73 with SMTP id
 a640c23a62f3a-bff4cddd831mr594131266b.41.1781543390991; Mon, 15 Jun 2026
 10:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260612200717.361018-1-l.scorcia@gmail.com> <20260612200717.361018-2-l.scorcia@gmail.com>
 <20260615-palatable-aerobics-3091229b6ada@spud>
In-Reply-To: <20260615-palatable-aerobics-3091229b6ada@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 15 Jun 2026 19:09:39 +0200
X-Gm-Features: AVVi8CcgapzCFj6cwsB094FQLtSSMmdLrOP26pKMcjV8D9cFGpyiqQvrj10_jjw
Message-ID: <CAORyz2+4EquYcUHEnoq0N_p7vCmDpPONEhVrmAfO1eX_RNMYbQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_100953_168422_D7EDEC6A 
X-CRM114-Status: GOOD (  11.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,
yes, sorry about that, series v6 has been superseded by v7 (I replied
to the thread and marked it as archived in patchwork, please let me
know if I have to do something else to mark it as obsolete).
Sashiko was correct, the regulators node is required for this device.

Sashiko also has suggestions for v7, a few pre existing issues and a
few nits here and there but some are actual improvements. One bit that
caught my eye is the use of the modeset register in the
mt6392_ldo_get_mode function. I have to double check that with the
data sheet and the android kernel sources. Not sure if I can do that
before next week though.

Is there any way I can trigger a Sashiko review before sending patches
to the ML?

Thank you,
Luca

