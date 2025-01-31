Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4A9C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yinOq3BvFm8pbS0HIBonp/WO0nQAo4BYehd8oFIVqaA=; b=E1WtUK3oWcWlEhD1pz9juSYEBJ
	zW+IncaE7DifSZHsFqhW9wdo491ke8PrnfCjBgSBWsBUbJ3pvjxg+dZYtd9vdtsybb3UvJLAbLFKZ
	zQ+sTWIZb4+qU/hzB9jH7ioXcBCVZ2PD3OnyqlO6UO1r73rAcluHrwltch7AAS5qyjoYvb/0f4ARC
	K0/nrGKBZh103TcnZ4QHmzw0z68nenJVaXs+iCYCOnjGCJ6870GGvzz+KzxO0zawn7doRXPM8Ozdu
	XPj0GgMLDv9/eKgeg6RC6TL9LXpr/44C0fjUOadZvQ9Un83c86uYKXI47YJJUhwtlRYaifZaZdMfN
	HTnZH1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtXc-0000000AvGA-39lE;
	Fri, 31 Jan 2025 16:06:48 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtWJ-0000000Av03-2wkS;
	Fri, 31 Jan 2025 16:05:28 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so576133241.3;
        Fri, 31 Jan 2025 08:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738339526; x=1738944326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yinOq3BvFm8pbS0HIBonp/WO0nQAo4BYehd8oFIVqaA=;
        b=R6Q/AO6UFZywqPxi/M93oTV5/MyRH4YXd0+4a8IQ2WXxU/aDRT+Gn74DFCIYjgBn+f
         PN+b6ipstqtlOfaRT+cuUmc/6hmNnBdjFZttfAFEC5pg9dpEohk8TOZGbHJxq3MlA5Ia
         8Xl/guvfsCdJkP4uv1Hs1pTSHga9463lG0O5AQ4is+cvz9iAGv+KzQsLjow5JbTKQUYB
         lk+A2OM4sAP0/idHQyzpJ/R925YRQsnZgySZyAkpa80+OJTiEl+G2yXjOgrWHDp616tA
         P3xwiEpbhSFXVgeuLBIghPAat4iUtXS/DLRAjivwhDjO7vLA7iPytF/CNEgXlx+82PkR
         WakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738339526; x=1738944326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yinOq3BvFm8pbS0HIBonp/WO0nQAo4BYehd8oFIVqaA=;
        b=VhxLEeQgSxBH1MQId+oY7+u3nmbw4T7f22hGfPS8Y/lbnCXnPZzxeXDnrmFvUFJP2k
         FIt+MwTxAUmpyZL7RwiqSe7TvHn7u1O3wnS3zO53hZji6qjmGHxNOEbO1rV5B4h298Ou
         fFEMy6u5xh+QjtoKKeNmZK0QSHtNxd4iNtElQgf1Swd/VFRWgrcj9xkeFanRitGSrp0C
         CDFB9o8jPJa8+vcFr1OfebOYIdH9JqMVk8l3KZIftTHkbQQMwIzaxHz1271jtTCRG44/
         OaDDgzxRWJF7XDzE0akdHkGIoWlUllQtADPGXcEcKafS24Yt39pRhdsESYQC4BUx7PBm
         nAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ55o4adTvq2MZRck39camEAV3w1loCw8SFO4P21FhQfWjurYPza9aV6ear2dqzdbDfXX8ubfyrritLQDL+MdU@lists.infradead.org, AJvYcCXPBcGOFbdE17eTcaOcVTALP3DRSDNxC0pkswMcUdwDcItf5ELUh9ccUm0w52KAbSrtUAD6hwgb/ttqJIJbn+So3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHi6PmSUudsZHs3JTlb7gRnaL3yELQ2I1M0QUnrkdpe/vj4SyR
	Cbqd9epe1txeRIcI/I4WcZpdOq2W63nRc1OgjDs301YpjkpCEY3S8ZC1T9FS2ZyvEjQBJxWi1vw
	o+davuR5obdrrqnOC9mZ4CfdWQ1g=
X-Gm-Gg: ASbGncsVbGG00ZXClQl8PpGme/vIDO+fbgxFE/7MlYZ/PeP+3L4lb16MZeL1PwUdab/
	VqwBDuynqm5ttQUVSWmxSlUoo67M+WAG8LAiduwNV4Wj7BUFBfes/EkJWJvZxrZmfbpNSJTcaIg
	==
X-Google-Smtp-Source: AGHT+IEp7MtYTu6aLHmfoRZMuQIhdDIIlMcvFCUzckw2uCT/3cjD28n2Uuo9tiMWgYBKq7vRQxgRKyFa2i4Ck0/Q8yw=
X-Received: by 2002:a05:6122:1826:b0:515:daa7:ed07 with SMTP id
 71dfb90a1353d-51e9e28a51amr9180667e0c.0.1738339526468; Fri, 31 Jan 2025
 08:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20250120130119.671119-1-svarbanov@suse.de> <20250120130119.671119-7-svarbanov@suse.de>
In-Reply-To: <20250120130119.671119-7-svarbanov@suse.de>
From: Jim Quinlan <jim2101024@gmail.com>
Date: Fri, 31 Jan 2025 11:05:14 -0500
X-Gm-Features: AWEUYZlLglIi2jugpqje-hAPwOESpNgNxOWzCPUmbm1viKS3V0vfFHVWucL5CCE
Message-ID: <CANCKTBtG14B7mqW3vjv557kHLfYkJtJiL+xu8f2siZ9_BuWPHg@mail.gmail.com>
Subject: Re: [PATCH v5 -next 06/11] PCI: brcmstb: Add bcm2712 support
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_080527_739698_C7DE64AA 
X-CRM114-Status: GOOD (  23.71  )
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

On Mon, Jan 20, 2025 at 8:01=E2=80=AFAM Stanimir Varbanov <svarbanov@suse.d=
e> wrote:
>
> Add bare minimum amount of changes in order to support PCIe RC hardware
> IP found on RPi5. The PCIe controller on bcm2712 is based on bcm7712 and
> as such it inherits register offsets, perst, bridge_reset ops and inbound
> windows count.
> Although, the implementation for bcm2712 needs a workaround related to th=
e
> control of the bridge_reset where turning off of the root port must not
> shutdown the bridge_reset and this must be avoided. To implement this
> workaround a quirks field is introduced in pcie_cfg_data struct.
>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
> v4 -> v5:
>  - No changes.
>
>  drivers/pci/controller/pcie-brcmstb.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controll=
er/pcie-brcmstb.c
> index 59190d8be0fb..50607df34a66 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -234,10 +234,20 @@ struct inbound_win {
>         u64 cpu_addr;
>  };
>
> +/*
> + * The RESCAL block is tied to PCIe controller #1, regardless of the num=
ber of
> + * controllers, and turning off PCIe controller #1 prevents access to th=
e RESCAL
> + * register blocks, therefore no other controller can access this regist=
er
> + * space, and depending upon the bus fabric we may get a timeout (UBUS/G=
ISB),
> + * or a hang (AXI).
> + */
> +#define CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN                BIT(0)
> +
>  struct pcie_cfg_data {
>         const int *offsets;
>         const enum pcie_soc_base soc_base;
>         const bool has_phy;
> +       const u32 quirks;
>         u8 num_inbound_wins;
>         int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>         int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
> @@ -1488,8 +1498,9 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pci=
e)
>         u32p_replace_bits(&tmp, 1, PCIE_MISC_HARD_PCIE_HARD_DEBUG_SERDES_=
IDDQ_MASK);
>         writel(tmp, base + HARD_DEBUG(pcie));
>
> -       /* Shutdown PCIe bridge */
> -       ret =3D pcie->bridge_sw_init_set(pcie, 1);
> +       if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
> +               /* Shutdown PCIe bridge */
> +               ret =3D pcie->cfg->bridge_sw_init_set(pcie, 1);
>
>         return ret;
>  }
> @@ -1699,6 +1710,15 @@ static const struct pcie_cfg_data bcm2711_cfg =3D =
{
>         .num_inbound_wins =3D 3,
>  };
>
> +static const struct pcie_cfg_data bcm2712_cfg =3D {
> +       .offsets        =3D pcie_offsets_bcm7712,
> +       .soc_base       =3D BCM7712,
> +       .perst_set      =3D brcm_pcie_perst_set_7278,
> +       .bridge_sw_init_set =3D brcm_pcie_bridge_sw_init_set_generic,
> +       .quirks         =3D CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN,
> +       .num_inbound_wins =3D 10,
> +};
> +
>  static const struct pcie_cfg_data bcm4908_cfg =3D {
>         .offsets        =3D pcie_offsets,
>         .soc_base       =3D BCM4908,
> @@ -1750,6 +1770,7 @@ static const struct pcie_cfg_data bcm7712_cfg =3D {
>
>  static const struct of_device_id brcm_pcie_match[] =3D {
>         { .compatible =3D "brcm,bcm2711-pcie", .data =3D &bcm2711_cfg },
> +       { .compatible =3D "brcm,bcm2712-pcie", .data =3D &bcm2712_cfg },
>         { .compatible =3D "brcm,bcm4908-pcie", .data =3D &bcm4908_cfg },
>         { .compatible =3D "brcm,bcm7211-pcie", .data =3D &generic_cfg },
>         { .compatible =3D "brcm,bcm7216-pcie", .data =3D &bcm7216_cfg },
Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>
> --
> 2.47.0
>

