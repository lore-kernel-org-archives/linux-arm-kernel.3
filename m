Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66906C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=; b=ahBF9yIjxtFSwvZbeHYgGam0Fw
	Ytwfb7YfVad992YbysUm9KTnsFCE47+RyoeBXUJqW2P3WpyQZIhh6gNV/gjP5BTsyfCD7/O5aDdnv
	vf4m1uhKlCy9RFylezjZGeP+OR4Pg+6c4tAzcNk4Dj7Xx1gCWedhpzmkHqV7sU7Yvc83FQggUntr5
	9TrBbbgiB2v3Wk/U6PNF6RMsdd7RdUfdYKVJEXT6942t3cPDBDMhoNbuKUtzRkWdbT98kTudBuVOR
	ITtZZASdo7kwkkGnYUT3qvwWuybpi6JtPaX/bvk/ztU0e+ojlXEjP8GEFpEtlo98/mNXFFdULfCde
	rUf9F/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUuF-0000000EDmw-0dNl;
	Tue, 20 May 2025 21:53:51 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUs5-0000000ED9O-137h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 21:51:38 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-550ee1cb0a3so6420883e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 14:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777895; x=1748382695; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=tslrQ2lW5So/yCWf1YVJva6Lf1IZVLBkfipCuP327ZlS6rChb5436XqwsSzy3jZmvH
         SK9qVbk0RHpzQea0tUhahtP+J80pFc5y38GToPJYPKCpV+MR3qZedNMszxO/68pZSZIH
         B/q4KFXvvqvSaBfRS8KWgtoJW5LWxWYDEpbA3m7oPWncSmvJpScvmGnmCNohDDY5UKur
         TZ1ig5hMhZSnDwlvKvktFibivqnyUJqlz452FDCUDIio7guU+C2cCVPjx4dOyUVJQqJC
         n+ZpTXtRft5hmgDpkB5FeaguTtd1Jt6NW68R/0095LCzJFzWq7yL/8fDtj80QRXYe+Yv
         zujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777895; x=1748382695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=jqBaV0qFio1k7FWxDH1JWxiJPjXnjWQKIEHZqTOgDWb/l9YktrQG7/ak+UIE5uie0E
         NK1si+k7hZwaNxwZ250i+zHyDRN4bJbZDV4nKrLtcar/AW9oQpd15K/DAvS3PwfljV1y
         FbfSdHJj7EoUiPcr4mHQi3sRndoB1JmwsYbDRS537SccHeR7SoHyD5UeAi9zms0iM+0j
         inseSdEfqx2vKoL/khf8PZlEPWgX/ZnPAzotyyCo2zIEO7T+pPGmw8JoKZIa1zxB+7qe
         FgNkcsRoEtgDJIwD3Y9cMzDq8hqpRxH6m7onUbL1Sy4h8/ltWi99YJ2qNWX1Xj25fNsK
         4eKA==
X-Forwarded-Encrypted: i=1; AJvYcCUfm1tlUbBLGp/FcspYpfBeo465rhwLRi74Ua5pERlaYjNVZWq1sAfFmWn5MKsnouzaXxavBU6v3PUsqQd4JSmQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwaaLx/B2dZ2D4FcyifYGEr3yQa1tJNutuXJqcXHmEwK45bDNwp
	DVFkbJpnX0RlpfuKyFUqWrFIOpS1AC4AWi8jmcu3PmHP/Fpfx7VsqkBoDcdeMPRobk6IQniOFPn
	cUMsTFwbaHx+XY/Ef49tR88COt01kpXGJ780/HEog0Q==
X-Gm-Gg: ASbGncvtTetChEMeyxQgJorwomhLvpnzcoJMyrQXTCStKo4KZM9jy/BGju7G3IJw81N
	t5CxEj38P3zCRp/tYr7pCrzbuotPVPk8S+vfh+qSRH+ujmsD4TuhDNxbHTdv1CriXPggMqZQRDd
	rz7qL94y9/bmhMOvYMj0ngDpNtvTbeFsBk
X-Google-Smtp-Source: AGHT+IFVkq4h2CinjfVO4g88kIBTXBbAWFl5Mto0qgQ5kuq3Zs33wt1FkBPYSfQEYVpZKmi9mKF3laDdRT+6Oo5QVNI=
X-Received: by 2002:a05:6512:6081:b0:550:e648:182a with SMTP id
 2adb3069b0e04-550e7248117mr5466218e87.55.1747777894769; Tue, 20 May 2025
 14:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:51:23 +0200
X-Gm-Features: AX0GCFstJNfbhxP8OvAOpZb2VTNEUaus21faETIiRrX0PcV1DOJb07Ynai4P9Vs
Message-ID: <CACRpkdbXfNs8a+YEwsxROpUT16S9m7NxYXnTsOJNpi3ds0wKDg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_145137_291241_98E35DDD 
X-CRM114-Status: GOOD (  12.33  )
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

On Fri, May 16, 2025 at 12:02=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:

> The i.MX943 System Manager (SM) firmware supports the System Control
> Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
> The base offset for the i.MX943 IOMUXC Daisy input register differs from
> that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
> i.MX943.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would merge it... but you also need a patch adding fsl,imx94 to
Documentation/devicetree/bindings/arm/fsl.yaml
do you not?

Yours,
Linus Walleij

