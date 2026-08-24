Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEFDC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj5OrcPbUSHUeRrK+Yhe+jiBoqRvGnLexb+l8ZGxfyk=; b=VOOv3eJCuTf7MFyDTD3HS7aVV1
	6WNoKdmTsT5nCn3j+RfFIxU8r/fLgzVifigzk+BS7e6OtkMWqhTdRjgU/0NiUxhcTKUur8IgnRhx1
	MRrVUBFvtgesYErt3CbBSc7WCbrQUVJCFxMTz4aA6WFrspPrU6/6HxU8pfiG+5NjUJBtnbGy2fe2L
	o21wCP5drGW2MNNsqkAtJvYkAxSzc0QaKUfbNuPdQ7QoZ+nA/C6hA6ESS3SwPuwEWuVCuhByJhO7b
	wTVemA89EYuQVkIqDHKMdCPKzmpxCwHJgSNXOG7NELDtjipdustuxx534KoIVul9aV34PLtUTZ3Bx
	8QH8LS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyU7x-0000000Gcv2-1GEX;
	Mon, 24 Aug 2026 12:50:13 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyU7v-0000000Gcub-0jve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:50:12 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5b4747943b8so2861042e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 05:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787575808; cv=none;
        d=google.com; s=arc-20260327;
        b=eeTsU24JdWMKOtdmAwUfepv5lZgI2YKkhuxFXRwdMwJ2bhlevi6E/hTPAORy6dbHZl
         0SeDUsjiSEbVieN+DNLXo11oysqsBpLiVj6ESMNf597MoBBhy7mv8UtdnGp1kbGOMjg5
         qRPHpwTky2Ez/JivQEXAahzWrhLZtLHUw0BksStmbiSgVyav389NkGjWZOr6jdk7nOOn
         t+PPstdkoThmUdwZCQkxS99Sn/ujEE2dvZSa45Go4WpxYFHBjM2Uuan/AynEGZqF99q5
         18WLxNVKyglOFvhxd8oBJGv0CX0QHvaQ0/HcPZtD5rFAUdONTTIDQOzWo8IVchbhsxCM
         v9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rj5OrcPbUSHUeRrK+Yhe+jiBoqRvGnLexb+l8ZGxfyk=;
        fh=vuIZAav61ViUEPd//HJ8SWwCHbMyisrLiNSELrM4wVk=;
        b=lfDxzxQu0idH5orVgSMs9EDnKiLFv5FNUaXAeqIk9UJXKeHo9x35eYwBF1tddEv47U
         Ca/OmFOS3FWpSmWe8DAvM5f97kqOacYWqIlbnV+Jgc214T6KH4wd5ZaVh61w5T4B9ePS
         DBOE8dc89feMOUeTlmsVqTRg3ryHRLcqLFnXUEiQuBNmRN6dNocgESA2Ym73MZyq9PYA
         A1sWc9wFT4SuAfVGscO9fmAA5BMEpUxnQUvMv9IosCT85kUFpwGObYE//Tmj/0MBCpXz
         dT3wt0aEVMsYx5EMX8i/xiThKRmmIzHWHNffJA8+2vN0Ben/ruUezuaLSMebZJ+aIzgW
         FQOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787575808; x=1788180608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rj5OrcPbUSHUeRrK+Yhe+jiBoqRvGnLexb+l8ZGxfyk=;
        b=imifpBqt3m3atkfvHObXUygLYWrREdcU2jLJRArWciOq1IQee7ej+c6DwTfxyJePZO
         kg2IZyrkjibNrSmxJ8qw4QcoXU9pNXJH6IDN/yg4qv2nFqc/qUrMHkZBr02eLF9y92+g
         PY966i0UUVoM6jAXctBb/QiJFHRS9r15yk3PihSSU+h9Qknns8eRyCXcpJ5QBGqNR6lf
         ANdQy3008eWfwctdQG9iaPSCTYIXX5/8orTId/wZKZzmom8iancLE8EmMVMIvA3vYelI
         lDrZUdOBc6mZ25o7WfiNYpKS6GTP2Uv6y4xAZmIC1s65Y3Oet9KTSUmEBi0P4noGagFA
         D9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575808; x=1788180608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rj5OrcPbUSHUeRrK+Yhe+jiBoqRvGnLexb+l8ZGxfyk=;
        b=KKrbqsuDX/on51h/DIXLijvKwF6nuvfEdb+ZilDAOpqcYQI97zQlZQNqAt5s5wE81D
         9fIneK6blP0UlB0jJvbwPaIcyDBb9QMf02VOFdkHDvjue/kZu/8/0VDHRKMlcLGV3wpM
         En6VkwggDv+qd0pKP8SY9LedBKUh5sJdo8lcwLm9t7ca8uuzihx8gY2PLu9p3kA93JGs
         5Xf4gzZJNNbuNCzWJPznqzIr2UHyXTJN+DWt5vMu+V02i3OGo0P+KcvW4kMeeLYF6FmX
         l0JEeZ3h57IxufbS/NPx8KI0RkDeHGBa8VJBb0cjuE6yKQdPHTmCbPmxLkTfSTh4jNGA
         eOAw==
X-Forwarded-Encrypted: i=1; AHgh+Rq74NmDXuHagikR7qcaIBbLmgA0ih9uTGnwDt2hbje2A9CVVq55aUAiBNFTxugbIJNAzELMmGgAixvH/FaRMJw5@lists.infradead.org
X-Gm-Message-State: AFuF++keg937BxhnUgX33sn3kMIEBeWX+nn9/4RwituDq/GagERVLZUa
	5NjQUzPMypD7nv7y42YehWhivkX8mPdgeHCs0YmU6wc4fRgl54+dw8b1tuthzQ/avooIuHUpKA3
	3gApRht+lfUMWMxHQoOxThBBP41mY91Q=
X-Gm-Gg: AR+sD10nIeqZBm361encI4JI8PRaNY/wYLDJ3+xbtyxnnddJBRNHVZceTIb4IJzYVsS
	Ph+u9l540sg/Zx+EM1v7byk2iruFgQmzHiNQWIWb716fFOqfZjgU8GDW9BHQrhJj/jPkSXQ2iKH
	BdoFNUFme5f4tGch9qZcPg3BNFwwTurJ5dj8bNvzCxzTibpbunonI5saAG/MnDL+xPP2Uq7UpXp
	bkrBqUySljw2BCld0DYZIj1yO5hN0O7MAUevxiZO8Fr9g72kkFfvMjOBJ6RhzhEKZvOtVXGLU38
	sQZqo7rg1FJFe5x1ceu4JK72MolDDrJrJJszFw6WXAcNbvJwuQ8xqyP6Ks4XoBAigFZVyl3/J73
	y/c4qBrYLSRtAYHg+Lzwb2G2qF3oQJBuT
X-Received: by 2002:a05:6512:3d09:b0:5b0:cce:da00 with SMTP id
 2adb3069b0e04-5b48b484764mr5090274e87.1.1787575808126; Mon, 24 Aug 2026
 05:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-4-Zhipeng.wang_1@oss.nxp.com> <aohftK95_iDsTPPm@SMW015318>
 <AMBPR04MB12334D1C91BFC42AEDB26E7F2EBA02@AMBPR04MB12334.eurprd04.prod.outlook.com>
In-Reply-To: <AMBPR04MB12334D1C91BFC42AEDB26E7F2EBA02@AMBPR04MB12334.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Aug 2026 09:49:54 -0300
X-Gm-Features: AcwNN1UOE8_YKDKnzMxa-AYkEswtmNEYtfnyPTae-IZsOuoBl4dxSuzeIfXj93w
Message-ID: <CAOMZO5CdZk3oyMpwPcTEeROBWBr70r9J7Vt-MiEA4+Y7abE5Sw@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
To: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
Cc: "Frank Li (OSS)" <frank.li@oss.nxp.com>, Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Frank Li <frank.li@nxp.com>, Radu Rendec <radu@rendec.net>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Jindong Yue <jindong.yue@nxp.com>, Xuegang Liu <xuegang.liu@nxp.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_055011_238180_33FD831C 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Zhipeng,

On Mon, Aug 24, 2026 at 6:38=E2=80=AFAM Zhipeng Wang (OSS)
<zhipeng.wang_1@oss.nxp.com> wrote:

> Hi Frank,
>
> Makes sense, I'll restructure it that way for the next version:
>
>  - Move Fabio's IRQ-count validation up so the count is validated before
>    the domain is created, and add proper error handling there.
>  - Since the invalid count is then rejected before the domain exists,
>    the domain leak can no longer happen, so managing the domain with
>    devm is no longer a fix. I'll drop its Fixes tag and reframe it as an
>    improvement.
>  - Move that devm conversion after the new devm_irq_domain_create_linear(=
)
>    helper, together with the other cleanup.

My motivation for sending [PATCH v4 1/2] irqchip/imx-irqsteer: Convert
to devm_pm_runtime_enable()
https://lore.kernel.org/lkml/aoXZf2z-50H8rimI@lizhi-Precision-Tower-5810/
was the "Unbalanced pm_runtime_enable!"
error during driver unbinding.

This was seen on kernel 6.18, so I would like this error fixed in your
series with a Fixes tag, so stable kernels like 6.18 can be fixed.

Thanks

