Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C165CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HsbPG1hM4cDOntTcBmV/JBGBT4YKc3N+I+tTErEYG4=; b=iVT2PIBS5nDORBsJq8bK8Dq1ve
	z7En1DJ05KdLff4Jju2GxpLZhu+rm9qPWLCjL33jTZ5okGNApJlMyDgV+zt4GONjbvBYkavxGoDhx
	DlSSirWFgeCUF21Fioi4DwscQ46hrfDXjDwnPjQILnepJtCqUe/AumrcxoKOiiXq/PsfaOxJKS/Xm
	gFCk+VEBBMo8aCwb8the+y26ajLOot8ZybV9i+dqsV2kiJA4Big3LLws+MNWfMsKc+wzSREc2vh1Z
	5Hg/9OCQaXK79zMFyIpiZsoyUbDK7NY5NghL9X1JuvV7PuvILAUtGHpxUW+kabsuS8/Bbrv+ytL0z
	Ep579Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVDH-0000000EoTj-2VgG;
	Mon, 27 Oct 2025 21:57:15 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVDC-0000000EoQ5-1svO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:57:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-376466f1280so78736781fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 14:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602228; x=1762207028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HsbPG1hM4cDOntTcBmV/JBGBT4YKc3N+I+tTErEYG4=;
        b=mZYzItOlPBZ61j4ysKd6dJVusio8tvGNy1wbn8avDzfPZ1oosgf8Zz23eRVmlXLi4e
         QlPJCkFc8FtvmBqgWzlWrXTN93j2HvOsGzd0i1eADMRr5gD/5VhOeuvwUZTfx2d1iv2r
         oCdBkB9X3rhUiCrcDG5gNpgB1a6YZ4wkEst3fJe1TAYWslVe6nFzu5xCvs+cXZKJcyYL
         zU4zvmH3u6gxl1l6IdaM/DwdY/Mt8yHs5HrM47odcdGjaK0fjqkV//o0wvjMHVs1x9AO
         gtTS+KJGa+/HfzoOxYfXXqBpGU8KVw1XWYazGMNrn8Ibg+0g7htiHGH658hUrV+QOm1h
         xABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602228; x=1762207028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HsbPG1hM4cDOntTcBmV/JBGBT4YKc3N+I+tTErEYG4=;
        b=NgKRudJoSTisdUFi9niadCn7Q2Fy6wCDCOsj0T3p1gjFuSjNNYhVLOb5YWkcpIMjAB
         YcISmVwjKC13uQShLnBSlbYPL4VkoNwYp6lUb6LUTTtpGIhRML6qKeoflIalOTnILnv/
         ucjLOS2jFI17dGy7DNFHiL+rhMZZgilt+5A/+fbhG/HYbbspEzXQlrFBkJXugTudrs58
         HKPkZRb6/lehKDCy9AHZSZ0jZBPYvPyqixpSEqd7gs8XoJDO1ToWT8LXQsLmOla9wss+
         FSOqUi/tCCDL8dO46rcXm3sNFx/ZZ51qdiujWjG9xqw65dLm/RNm/vEa6yk9pJrTt3w5
         I0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXKTNtciOkEGZMnC9KOKBpr+BwIXv+2yP+m44R3Oowq90HNXz1l8awGB7H3R7gTnem5IiRWMiz47TXfbGbRYbMg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ZtlsfICzIQzQAXND2tdDKpaLOXALNSnXor+bvdDtH/Ig0Afi
	a5XDrvoca0KQ/xRG5CyevK0xT4sg8BQQ75NjtUn1olKhy1JSI0H5uEAgYgc+Hjz2w5R8PDkvuci
	05jkMJyTFHtZgWENkiKDexP3Ha1v4lxlRg47ecmC56w==
X-Gm-Gg: ASbGncv2Si84s2sVOHV+Cx1e4PjMB/YKh4H2OL3IUQAuWrVfzJ2iLMpyDiApmqUo5jb
	q/5U7jvrYua955he8dW6aTnYZB9evHp0KbivvAbPaeNgY6aurjCt8ngttNvPG32/Mi8Uwu9Tm0Y
	UrDhm9GgLso/qhQwsuiCcjQ9qCopzRVUPvLiXIGfXirAq+LtYCwg8sIfsd+SUQcc+vWWO/IQQg5
	jpPVe5DygELFoLmSHHw3MCUd+TWonZPPqrIlxhFBule3RNI0GCekv8AptDyN7/Q83SodoI=
X-Google-Smtp-Source: AGHT+IEjLIfgc64R5us95+fFPO8BWmx3IOi8cmIKmJ8GeDaDyGf81wbf02WQ2hQUkaBk66OHmS0+B2OIi4naaYvPItc=
X-Received: by 2002:a05:651c:4356:10b0:36b:631e:2aee with SMTP id
 38308e7fff4ca-379076daf0cmr3058091fa.21.1761602227957; Mon, 27 Oct 2025
 14:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
In-Reply-To: <20251021070410.3585997-1-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:56:56 +0100
X-Gm-Features: AWmQ_bm-rkyY9e4T7v9WO6_vxIZ23JzEk1iQHKpy0OXLbJlzhTYiKf9B8Mvl6g8
Message-ID: <CACRpkdZAaEim0yJLkXNctJA0jBFj7LGyTGVvy7_mMf5G+vUWOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add pinctrl support for Sky1
To: Gary Yang <gary.yang@cixtech.com>, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_145710_526306_26600736 
X-CRM114-Status: GOOD (  11.19  )
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

Hi Gary,

On Tue, Oct 21, 2025 at 9:04=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> Gary Yang (3):
>   dt-bindings: pinctrl: Add cix,sky1-pinctrl
>   pinctrl: cix: Add pin-controller support for sky1

Patches 1 & 2 applied to the pin control tree for v6.19!

>   arm64: dts: cix: Add pinctrl nodes for sky1

This third patch should be applied to the SoC tree, Peter Chen or
Fugang Duan takes care of that I think? Not sure.

Good work with the pin controller, now is a good time to just
go on from here and fix the GPIO controllers using the pin
controller as back-end too :)

Yours,
Linus Walleij

