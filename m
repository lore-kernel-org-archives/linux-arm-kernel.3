Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AE4C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 01:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mlWn7On6mtDyUyW8xiNB9TSuIFhA67fSgyfU5pNabg=; b=jfK2/0ot0dTz9vpFD8zkHbc/ef
	JBuTrAFrPCaEGmSViwLpuPPaqYJP3HuO7EFn3UygIgs3T/VU1q32hDl3cQ/SvkLtfl/WDgYxL2tPA
	wTZqN+Prd2a7KdQ8g0V1815q3sUEwIk+6zZRWB3YBWj8xHu6kbOK98MiXPgQBh5MB/qxvfJFEYogG
	1BmqNRqIibBtZxqoByyO62wkcWyzaE5CF/IIHuIvvO382jJO2m1DsNxJfdhpH3uVj9QlHuSFAOB3I
	aglkDk0CdT+cehR7zSv4gozUYm8Oq7Zrh4Bb+FcrauXqe9YmVpIb8Inqrr+DjzJL2+Gn0MWPpN36A
	M/Peq6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMznR-0000000EXYV-1lx8;
	Thu, 05 Jun 2025 01:53:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzlG-0000000EXLD-1wEf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 01:51:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553245cad29so404186e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 18:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749088276; x=1749693076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mlWn7On6mtDyUyW8xiNB9TSuIFhA67fSgyfU5pNabg=;
        b=VHntel/aKjJIJJj20zucIdh484tM7pnPbejuL3nrsicV3vlMwNM3fUfgkfq0ZNAaBN
         6DDwsVsSQjueMqBWfQ+OfMR12awP65fC4JMQfPLAVWMedHknc7VOImzjLooQVA0fYwx6
         oPvPQriUbLB1XjfCJtGl1xddvAWCbPXzcQFk/sKkvy5K1Piw/wA6C36n2PEN3fNZioGV
         SuwS/q5duIjQGfqoVierHhhRiPnVdud0lrSn8Q7Ejllmzs/YasW/yd2vQcOEKfp7+MpP
         8TziG0WrHBmODoX3uTkD96FavCxS3ZaXlWaiCDaHD9Mu9L0Ziy+uLLYv9aSIwdW20yEl
         bheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088276; x=1749693076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mlWn7On6mtDyUyW8xiNB9TSuIFhA67fSgyfU5pNabg=;
        b=lH9EQ3uRNGukykPhven6jrpvpTLnJbeHNg1loLkkzmEqTTZtW0wf5gA64AfNW6vJWb
         JUbgptjrpt0CTAVQUteUfQoOCkAx95/zlqQuRqUyZmBedKF+EodRGK+caZIXqz86JVT8
         2N9S4b/uWf9NR9i6iFYSUgj/u4wZhet8v7r0AaBLT1vrsvtChCJgpPrjIHFG4sKvX6j8
         pBpEN0EtBIvEue5BTrg6goEdx4r5WEXeX37Mvxy+jxncYIeojnHTFjenH5Z6JSlBuOUY
         Fdb++MBwj+sRdeVOtRhKrICtIRZjKWAqckTlaIXZ3n6jG9nELVzs75D57H5h91/s9bfa
         1XFw==
X-Forwarded-Encrypted: i=1; AJvYcCX/SSYxlMQl3BDru3oL1jtK/KlelEuNTQ17ieL6Qqq7EajPt+zPxAJMWsrE7DMS8OSB68oADqmLff9DkXKspotI@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg39JJDtgr3qcFxnOngD1yzlcupXhpaJIeoXkcZ3vGX4k7PJcE
	JEU9eleSlo1KasyGB4jcaKu/v0yvRJG/sopnlLDuoOsu5eA82yr/YLRmDM/YTkxjhqd/72gJJ7Z
	8UKFIHFvLB9p3TSwovH6iZUa6RldtlnQ=
X-Gm-Gg: ASbGnctlvBWj2D5LD8YwYFLmxbSHCyhBISEHlDeTpGwC6inb/nhIaUCenmGAd7fMyUq
	U+4dZB5K/83QwR8pggbOdvq0BA8G12HYxlc21R4yaXxdSbF6aWxgry/Y2JHk/ptGWf7If0F0UhH
	sG5ygRg6HRn5HTytt1i43+u72zxgsh+3rW6OmFlu9pz5GxS5/0Hco5xgqs5VEjrpoKZIFjfTtVH
	X0eQMtcNHz7mA==
X-Google-Smtp-Source: AGHT+IEk5Zzw6tHETC9Olgqf21/GWZkYciJCw0USM5fgKHPvApi5DG0a0gN6WZoczUuRV0vhQDc7Mouv0C1rm4TpyHg=
X-Received: by 2002:a05:6512:e9e:b0:553:302b:85ce with SMTP id
 2adb3069b0e04-55356ae0fb3mr1520607e87.7.1749088276083; Wed, 04 Jun 2025
 18:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250604200301.1192096-1-Frank.Li@nxp.com>
In-Reply-To: <20250604200301.1192096-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Jun 2025 22:51:04 -0300
X-Gm-Features: AX0GCFvVFxob8EVb6NLsa3nj-286Crhe1GjgNqXQ3KjHN84Y-NY38GeprMrasXw
Message-ID: <CAOMZO5B4QQmZ3evum871m8AF36UTckbaPCwVyKF8QVN4-Z5=iw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2]
 i2c[2,3] uart5 spi3 and tpm3
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_185118_504060_C77AA032 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 4, 2025 at 5:03=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +       spidev0: spi@0 {
> +               reg =3D <0>;
> +               compatible =3D "lwn,bk4-spi";

This is wrong.

I'm pretty sure there is no "Liebherr's BK4 external SPI controller"
on this board.

