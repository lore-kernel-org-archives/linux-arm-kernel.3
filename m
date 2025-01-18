Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13402C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eC562IGNdsBslKvrHku3T+cv3/NWv0Sm/Mud6kF3qcU=; b=sUsRQozBgliOKzYYDKAXg78bQX
	F0rmsP3r8k/dky2jCS6ExQJuccZWlvjSWN2oVMWPJX2toffmHh/TEUZk7mj0ZVLHm1e9WfIPqZiZP
	N4LBjEia/lSo283K+Ve/1CDUBEeWb9ZAlbrCdHXCTOT9J9ozPavqhWfjc1cdJfGQEYmhTaBssenLz
	fvkU6YVFX+ybvHxzuHG2JT8m9bQXGE1MRUvAsW01/Mtg1AE4zFvtlB0ycSoQuvv2lkzHLCki16me3
	milREjD9lRf0OYTfW1GfK08ZLBtY2iEpw724BT1sypWrVVX1UCkn8DRNxOv13lkqiioLEpAmGE7hN
	z+uYbKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ63E-00000002BkA-3CBt;
	Sat, 18 Jan 2025 10:27:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5yU-00000002B6F-2clj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 10:22:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa69107179cso573432366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195761; x=1737800561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC562IGNdsBslKvrHku3T+cv3/NWv0Sm/Mud6kF3qcU=;
        b=ETvo2iCRR7CyDLYO0WuOV/zE9fjLp1BkSqfq6BoDjVVDQUP6iqIkm2Njb7pOOzr4kH
         2B1FLxGbFBSxEVKQo30JFK37YqWTdr6ychUMWlEGq5oVt9NdfzU58dRL9AscQ0YG8AUI
         isWTdYwD3UQqZleW5CuyaQdWNlVL07BAFpKhS8t40qSkVNLVvV7LIRA0IHHrycbuSeYZ
         zFBuOWgwjWJJFwO+xF1IxTjAEsijcyBmDr3XKsv12FW9XkeZ0eA4UBS2g9rZFtda9/SB
         kwYS5zBloEtkfxlRd2GSOl9ExmYoNxA2Qvg9DrBUPYwEuWt0qtU+RCrIPQo559a+4iFl
         7GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195761; x=1737800561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC562IGNdsBslKvrHku3T+cv3/NWv0Sm/Mud6kF3qcU=;
        b=b/sMdnRURrUp+rDfW0wBG98SC2QM0PXyW/hIYcsteVOVG6vkPPlJPVkZNlZVh1Sq4W
         kH5J5cBhmoWaVCb0nOID8Xxnl6ua4YNKRYLbHIXhDZCD8VpM9Q4s0ZCLXAoX6ONAOUFT
         v84SNRJatMcg2H0+0imHAJPvRuyC29jk6NoiPMrjARhtTee64S8Dy6kTPal/AE2k0m3G
         uDJfhakq4/K6BkW5lPdNo/wWSuKV3+O1DnHVI1lMmajB7AWX0FGTSZy/LXl95XId59rR
         y1ehER1DUZQlj1L7yezVNcyh2v8X5qSBlfn2I6vom3jYjOA1kQMUdcoeDUJ9xoa/tnaB
         FwhA==
X-Forwarded-Encrypted: i=1; AJvYcCWvr9JIMrWgwRFzGUVfHXt9O2BTCaxLCrC3eobpJrKuAm4Hupvsc6YJ4qESuEe8iEkbDup1pAlaoB13tKtcWCth@lists.infradead.org
X-Gm-Message-State: AOJu0YzaUpYKsesMoRPO1/ozRMnR2dobmEuyepQCxKvdJ3qiBUseK2Wb
	b5hFmQzE22l4f90UqV+k2MEqjwlwl6kzxcJPhrEWDeRp1qQSwlVgPKhfcA==
X-Gm-Gg: ASbGncufWhelZTmAvOorGV7IjsHL2aVjjjnKbwaSr7ENa3WuC7Coo9IOIidN0lSaNMd
	Ds8g79+kbGsDA8WIvX57NZd+2wvBkGTvvleOK5X1h6dJZfM0K4lGC//Qo1RKBJWINIG+zlwIBOB
	LFI/MQ+KevPQ9pz0mkal5teYfb/UrmicU0IeOJqnRP9+G4ohRhRwNYptRAfJtEcJPVyZ5KbqQ/G
	4sAptPqBBy5AegidegrJ7q1yiHi5n3X5oLto0LT977DobW3b7WfRUZFHJRXacGGP74Ox4MZq484
	giYrHkFdxnSpWbI=
X-Google-Smtp-Source: AGHT+IE+y1gp+riQD30Inb1lrysJjHeJCu6/sl+o+LPW+5g5AYkhktPoEz8aolwvSzUCLAkf/TSzCQ==
X-Received: by 2002:a17:907:d87:b0:aa5:b1b9:5d6a with SMTP id a640c23a62f3a-ab38b3d6d1cmr587932766b.54.1737195760645;
        Sat, 18 Jan 2025 02:22:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86206sm311092166b.134.2025.01.18.02.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Philippe Simons <simons.philippe@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [PATCH v2] irqchip/sunxi-nmi: add missing flag
Date: Sat, 18 Jan 2025 11:22:39 +0100
Message-ID: <2220251.Icojqenx9y@jernej-laptop>
In-Reply-To: <20250112123402.388520-1-simons.philippe@gmail.com>
References: <20250112123402.388520-1-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_022242_660901_34834F4A 
X-CRM114-Status: GOOD (  16.95  )
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

Dne nedelja, 12. januar 2025 ob 13:34:02 Srednjeevropski standardni =C4=8Da=
s je Philippe Simons napisal(a):
> Some boards with Allwinner SoCs connect the PMIC's IRQ pin to the SoC's
> NMI pin instead of a normal GPIO. Since the power key is connected
> to the PMIC, and people expect to wake up a suspended system via
> this key, the NMI IRQ controller must stay alive when the
> system goes into suspend.
>=20
> Add the flag to prevent the sunxi NMI controller from going to sleep,
> so that the power key can wake up those systems.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---

Please provide changelog here.

>  drivers/irqchip/irq-sunxi-nmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-=
nmi.c
> index bb92fd85e..8dda0a85e 100644
> --- a/drivers/irqchip/irq-sunxi-nmi.c
> +++ b/drivers/irqchip/irq-sunxi-nmi.c
> @@ -186,7 +186,9 @@ static int __init sunxi_sc_nmi_irq_init(struct device=
_node *node,
>  	gc->chip_types[0].chip.irq_unmask	=3D irq_gc_mask_set_bit;
>  	gc->chip_types[0].chip.irq_eoi		=3D irq_gc_ack_set_bit;
>  	gc->chip_types[0].chip.irq_set_type	=3D sunxi_sc_nmi_set_type;
> -	gc->chip_types[0].chip.flags		=3D IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF=
_HANDLED;
> +	gc->chip_types[0].chip.flags		=3D IRQCHIP_EOI_THREADED |
> +											IRQCHIP_EOI_IF_HANDLED |
> +											IRQCHIP_SKIP_SET_WAKE;

Alignment seems off. With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com

Best regards,
Jernej

>  	gc->chip_types[0].regs.ack		=3D reg_offs->pend;
>  	gc->chip_types[0].regs.mask		=3D reg_offs->enable;
>  	gc->chip_types[0].regs.type		=3D reg_offs->ctrl;
>=20





