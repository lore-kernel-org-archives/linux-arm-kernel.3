Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D89FB3CEA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=; b=F/aEJBKs5e/cBxT32WXR8TWJ0G
	XMJqh0RJLV7oq0rP/aOJ0s4uE+4vlUXb0EpH0FKe4X39VaAYUYhtmlcr8Ls7isU9BArX1bcooNnKT
	cGTTBWtxifv65aKkT9u1XhvfPV5WvjyWrw0LuNUlaVl3FLd0i/vfqqJ2V4QAgT/tbT8vR3D2eJOdn
	Yl91Fx/+a7W2IGU6QasUFZURpVy3hq0BwaXZ8tQDR6pL2LV2tyNvO0sVMO0szoMVtxUhaYph9tNdN
	OjSzfzoK7ERLLpp4Mu8vSyLGMmKPgCCkJyf3kAMuOMT34+zdXbrHYoGpz+Gf1I9dSrjA6isyBkucr
	TWVrHUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w792b-0000000AySq-3PLe;
	Mon, 30 Mar 2026 09:36:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w792a-0000000AyS3-3KuJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 09:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=; b=YfDArPY/jziKlFzUM3ZvEVxJEq
	7h5ofJ9mHit8ePhoajrF4H9emWmdy0x26RgGwN+kXxbAlCTILLahEHvZQm0RcQH8Xha5UjEDidwzK
	obz+q32h4j0JC9VQc9DxddI7CpllKRNsqCORSY2Oy9gyVuzr1Uw/bTBHojNfFvVC6vqL4V4do5F/1
	sFNEg7y2uceUulwPW49hfZteAY0lNVg1AJw3ssZHWPtOvI/2OvhD0xhZicXzasaX+pRjauH41iCoM
	PiMO28OrZkJINe44sSxxO4ywfoUNGRvSb5Dv3pYFZEwVvcCAMRj5T5gES5bl0m/V+KBu59euCsjNN
	dqbgxMQw==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w792W-0000000DSHD-22LK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:36:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a2a70bb69eso4401048e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 02:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774863366; cv=none;
        d=google.com; s=arc-20240605;
        b=DxFy3gY2xXSGq5YoA38VJwhLgXMk0aapOc28yteGkXt7b+ASzaEN0yD+Mp03CKDfAd
         Cq2LLq1t3++FbCjpLKepnsMZD1BLhDDWWO6kcqxFivH2+F2wkqulp0cmMk8Fz39nw1s2
         Z8N0szHnpX1D0vPc6V86sUdZrhRcdENATK3cDBWPUkEOVJg/mOSr2Qxb14TqEnvEf+YW
         xw14iajN/MeVi96QybFOZCDd1+jt7YVCG42ce/ugPyzHLHJJC94LxTcZh1fRKelE+gek
         72pWqmBQWUMcMj5la8h9iPjN6SJJMm0HpPnb9FZ9GxIPPdAVQJohcRuCPbTTwKQvrhpQ
         bu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        fh=sNtRfHEfwb9gEQ5uDwoTyCmNBwFyAj57SDDT+h3oD1o=;
        b=DYlbeREl6tb4LGsrRg7MydQgpynEOCVmYKtQMPjReoL7XHoOWqbf/wzl+McK5N0BcM
         PQWy7shN9OOvfxNwFHDHbiZCjbASPzVFPE3xorLITkYs0C6YlTp/Vl5c/J952Rpbnjy2
         rEHyFEknFH40TdkLIyreeiRZwe1vaC0m9lcmqPY5JBjfx8bS2AWxdRdUSH3vMNIyLyWB
         sSrXyk0mzhoT71Z2c7fsQCXDiWUfqbJLJcth30flzjI+mpEGF2NYsfKQdFVp4LJizNTQ
         TY1IeKWdu05pJurt61+teWrEQHqwuew61O0DjDUKuKwkK+r0unq/1vulkaaEtHqlGTR5
         k5qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774863366; x=1775468166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=Y9zGQ15zM9CQoO59R0MGHvzGQlFcuFPPfFvFwLUF7zQUZAfXYMDUChMyfR6YJVcHmp
         uxCtDCjjAQV0+A1p9EdH2NtbVdyfmLdjfcaBsS79L/xuWyKY9ZCY5ahI02YxA3mdHCJT
         uOEgRRWBJCpTqsqMrE4QSJ3M3sYhUSJF1X6Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863366; x=1775468166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=CaR18L/kXBuaqDfPWIdwOiLYkB3eYt2rf7mSi/3XYV2GnxPuZQDWu6kRHcWn2uqvGy
         n0YztWUlmT+x7w6TF71vUYKKBRITIEtzeA3oLvdFeIhsyP05uwYNrGsC7pPYVIXIDaYP
         jhfnsi35YjcYrvniZbg0uYedoqF56mA0VFqUhOciqJvQzejSqWAjtD4cZ5DuWSuf3jz4
         6F/WuZgvRTNFwuTufvtH+C6g9NP4+kgcDFXmf6Wu80yVdg+JJSiW9yCgL8ywBmN5oqO+
         +8iY63r7IJijmlFMVmO5aGv8M/ZHfrr6VC8Pa2uJP8QxMn6RJMldorI+Xunx5FyC5YPq
         IsgA==
X-Forwarded-Encrypted: i=1; AJvYcCVBzUkIwb1lrRBnla5R/C6jVQMznTjHV7/1C4sVf2+2pW9yN3h6/8LCamiX9tzVez8N5tTKixge+p8rUDX37DaO@lists.infradead.org
X-Gm-Message-State: AOJu0YxDHiF26QJD27mfholDERyoLm9sDYS4fk3lep4tOYZu6mX/wv5/
	rxHHeTtvMS2GZS1ajIUukhaojTAf6wxfva/lx3RdFVb6mIsw0Jtq84MEJcXzcOLQuxJMAvUs0gR
	IL0CM4Jf8KM534LQIPvRjOb6AzOCwGnap8Al5jK/v
X-Gm-Gg: ATEYQzy+fxl+BpkSIaY/rWL/7oHc41CV3AU4zQtw5B+pyk7KdS0JNSMJSfgNXh60N3Q
	tHUkRNQjVQFQ6fPC2T4dFcJZ9HqVpJDXuCrlSvUjLeyPTXnQqbXRdpxt2RJ9xNYnsZNstiQRbkS
	eFGwa5Pr10lEh7Ssr70NQfGjDEVnT04ZorYchUhIZSgDFIFSoIf3bAkHOligPSJRc9h11CO7IHu
	q484BR7kt9WFybRIo0sEV/TksbAEbQer/tx3apdHxuJqIFVvUAQCv8noJjm3rkBBwOZwNCY/iqW
	4Fiec+VWZxPPS0KJpUKNeZQt4UGyIXLeOUob
X-Received: by 2002:a05:6512:3f12:b0:5a2:7aeb:e7b3 with SMTP id
 2adb3069b0e04-5a2ab92ae11mr5011592e87.29.1774863365955; Mon, 30 Mar 2026
 02:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com> <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
In-Reply-To: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Mar 2026 17:35:54 +0800
X-Gm-Features: AQROBzDDuO289B2CM0DmVnpmaCFifXhpUymo-5rQ6aPBkZTqTiIMBWQIo9x2VA8
Message-ID: <CAGXv+5HRWRW=+Mk2z4qCPrF7zFax9zQJ70Q4ihR6PkWJP0OUrg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_103608_697236_16446506 
X-CRM114-Status: GOOD (  26.99  )
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

On Mon, Mar 30, 2026 at 3:39=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
> <wenst@chromium.org> ha scritto:
>
> > If this PMIC is anything like the MT6358, then it has 0.01V fine
> > tuning for most if not all the LDOs. It is sometimes needed as
> > a rail may have a 0.04V boost that would otherwise be invisible
> > to the system. And then if you have something like 3.04V set in
> > the DT constraints, you end up with something the regulator driver
> > doesn't support, but the hardware does.
> >
> > Please see how it's done in the MT6358 driver. I spent a lot of
> > time on that driver to make it actually support the full range
> > of voltages, and describing the supplies.
> >
>
> I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
> 2016) and unfortunately I did not see any fine tuning option in there.
> I'm sure this data sheet is not perfect as it's missing some regulator
> registers that are clearly used in the Android sources, but there's no
> mention of fine tuning in that code either. I guess it does not have
> that capability.

Well, thanks for looking. FWIW on the MT6358 / MT6366, the main voltage
control and the fine tuning are mostly in the same register. The fine
tuning is described as "calibrates output voltage" from +00mV to +100mV.

I looked into this because the LDO table shows some of the default voltages
with 0.01V precision, but the main voltage controls only have 0.1V precisio=
n.


ChenYu

> I will shortly submit v4 that hopefully addresses the rest of the comment=
s.
>
> Thanks for your help!
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com

