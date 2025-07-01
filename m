Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90365C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TW0XVsdgDWrxwGXky0O5598UlMkqask3eci8kzuyY4g=; b=qYTK+Vv58NflwGo1+UbRz34ATN
	45UrIxWLt14rHNG4ZjlzLw8JnePltwj0n+c7hNw2Q0p27zR1Hnk1GuEpNp4TG/zA6NYaXmYulBxb4
	B6SoHfVKqZFW7rJIpsIvlExNa0gLP/Xb7xo30oz6dtEwg2QRgYZvDrKVPdKJzjppX0/7PK+HOaaYc
	4Py6AAiq0GIHuU6CsduwIJtZ1WqL6/9MRCUeIP+yybnRFm2gRXQ185JwpWK1LRPtNdxStZe+oDbiv
	K0/IamkKZNsc+1lUJC5PJ+d10EJMAHV/sV7CUMOTobCtYc4BRn74bziK2XU2X7F3+h+Evy9jyxX5m
	0eRxFWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVuM-00000004LuY-0GtT;
	Tue, 01 Jul 2025 08:00:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVr3-00000004LNx-3d8c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 07:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751356596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TW0XVsdgDWrxwGXky0O5598UlMkqask3eci8kzuyY4g=;
	b=RHg4+ghdcq6DamAJNYdSbk98qKdihuySeb+t8rFE2scgvjRgbDhQTa73AIb7ia8KnyJfzu
	lq5lX6QU86SPR6jG7C9HHOMQDEQjw9dQh/AUYwzZBF9AizfX9qbgSVydC4bFYwP+8P98Bh
	VWN5UQxjaQgWmdBqhW7vG5jZL0tSlGw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-oKtwaCspMlqRjS0pIcJp8Q-1; Tue, 01 Jul 2025 03:55:07 -0400
X-MC-Unique: oKtwaCspMlqRjS0pIcJp8Q-1
X-Mimecast-MFC-AGG-ID: oKtwaCspMlqRjS0pIcJp8Q_1751356507
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748cf01de06so7093966b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 00:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356506; x=1751961306;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHdMzgFfQJGJTVG/4M9MM8/CUYx5m9feJxrpAo8o1hk=;
        b=kcEljfMhVr5iNVTnR24Be70EG8MtP45WXAB4z5oW8lqZNmn6hSoOH+25Nk0Cxt4mAq
         M5M6AcAYBvkFPwF1bT/YjeOTK3HudJ/tutkAd6jjDlPa5QS3WDRYGut0RBRbjvZDqyLH
         qGN6RG1YGocKrsLEdbSRojaoiST/i2lVmdYQFxOcVGDV5zg4KCre1T8hMzZLNXicIO4/
         Am29Y/VeVGLuzYgom1BR0hzow86jlIRKGemuMTa1p6nsioNaKc3Lt2w9Ni3PyJjBqiGH
         E9W2YCsaP9HqbLC5umn87w75EVwxJZ/MPkcrXe8DDoNH/IZL87Hjcko81Cv0avPi1eok
         A9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqxrBWNlaVtv5WnvZnaRSzEqsfLE1r/kO6dagOUbP/eEW+lcAy4MIzXjTDobmPP0Gl8+9f1XxqLHqZjEYxK6gi@lists.infradead.org
X-Gm-Message-State: AOJu0YyBsuTgq/VJME9ObPY15YyPhGikEW/hJ0flSOScP6cdC6zQdT20
	f3MmcfTaLmdn29DnizfjDsBEZPm59T/mejeo08bi4wZxRnvHVTCQ+nDFi+RHsVAWumfV6sWyym8
	356dkCz/F0UEODwmNi3NIxOcnd/Vv25Yo/Kw24Id64JaZQyfBdfZUPrdQfgstGcCEIzt7wMv2OD
	xR
X-Gm-Gg: ASbGncsb66DiBfyY3dWZVyB1XvoTJ/L6MIbnXU31PvPrUEMwps8owfV3SXLpcT/AkOx
	CNLBZ54N8fbQGsFOpeKi+23N9hIzFDYfV4s2uJSEnPrim37lJ6J0fIjPETj0njcgShsjfTRXlAl
	NPzEyhdcKsqpi2WaddYWLIoELrZHGe3sUNF0o+OlftISBBk0o0c+jNXyr5OcOCeUrx6lFqoB2l4
	U0ld/ms07xu4x5nvim8DlevlxCUTCY4GLJuxS942kQOqDdlSwDBFSabIyuokIixK7eCm0XA4SsS
	/A23cUK83tOqkfmCU7LM55+G8SuyhLklTpQkfVORaj6WmX5K
X-Received: by 2002:a05:6a00:1495:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-74af6ebdffdmr22051628b3a.2.1751356506614;
        Tue, 01 Jul 2025 00:55:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLLY/eKZv2t5yuLjLiXwRD/wN1GO4pT44DogAvkkhU/DiOVmH3mQAj6VLHh0UEaPV5yfZWTg==
X-Received: by 2002:a05:6a00:1495:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-74af6ebdffdmr22051587b3a.2.1751356506152;
        Tue, 01 Jul 2025 00:55:06 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557439csm11016401b3a.80.2025.07.01.00.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:55:05 -0700 (PDT)
Message-ID: <ce0fdbf2753075056c227ce7567a69386a5aa0a3.camel@redhat.com>
Subject: Re: [RESEND PATCH v9 1/4] PCI: rockchip: Use standard PCIe defines
From: Philipp Stanner <pstanner@redhat.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>, 
	linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,  Manivannan Sadhasivam <mani@kernel.org>, Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner
 <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rick wertenbroek <rick.wertenbroek@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Valmantas Paliksa
 <walmis@gmail.com>, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 01 Jul 2025 09:54:51 +0200
In-Reply-To: <e81700ef4b49f584bc8834bfb07b6d8995fc1f42.1751322015.git.geraldogabriel@gmail.com>
References: <cover.1751322015.git.geraldogabriel@gmail.com>
	 <e81700ef4b49f584bc8834bfb07b6d8995fc1f42.1751322015.git.geraldogabriel@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4YpwAQGKoD6nws9oiHOdFYbtmiHVpUASZXXCGaAYBek_1751356507
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_005637_969790_2DFABD96 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, 2025-06-30 at 19:24 -0300, Geraldo Nascimento wrote:
> Current code uses custom-defined register offsets and bitfields for
> standard PCIe registers. Change to using standard PCIe defines. Since
> we are now using standard PCIe defines, drop unused custom-defined
> ones,
> which are now referenced from offset at added Capabilities Register.

This could be phrased a bit more cleanly. At least I don't get exactly
what "from offset" means. You mean you replace the unused custom ones?
But if they're unused, why are they even being replaced?


>=20
> Suggested-By: Bjorn Helgaas <bhelgaas@google.com>

s/By/by


P.

> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
> =C2=A0drivers/pci/controller/pcie-rockchip-ep.c=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0drivers/pci/controller/pcie-rockchip-host.c | 44 ++++++++++--------=
-
> --
> =C2=A0drivers/pci/controller/pcie-rockchip.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 12 +-----
> =C2=A03 files changed, 25 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-rockchip-ep.c
> b/drivers/pci/controller/pcie-rockchip-ep.c
> index 55416b8311dd..300cd85fa035 100644
> --- a/drivers/pci/controller/pcie-rockchip-ep.c
> +++ b/drivers/pci/controller/pcie-rockchip-ep.c
> @@ -518,9 +518,9 @@ static void rockchip_pcie_ep_retrain_link(struct
> rockchip_pcie *rockchip)
> =C2=A0{
> =C2=A0=09u32 status;
> =C2=A0
> -=09status =3D rockchip_pcie_read(rockchip, PCIE_EP_CONFIG_LCS);
> +=09status =3D rockchip_pcie_read(rockchip, PCIE_EP_CONFIG_BASE +
> PCI_EXP_LNKCTL);
> =C2=A0=09status |=3D PCI_EXP_LNKCTL_RL;
> -=09rockchip_pcie_write(rockchip, status, PCIE_EP_CONFIG_LCS);
> +=09rockchip_pcie_write(rockchip, status, PCIE_EP_CONFIG_BASE +
> PCI_EXP_LNKCTL);
> =C2=A0}
> =C2=A0
> =C2=A0static bool rockchip_pcie_ep_link_up(struct rockchip_pcie *rockchip=
)
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c
> b/drivers/pci/controller/pcie-rockchip-host.c
> index b9e7a8710cf0..65653218b9ab 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -40,18 +40,18 @@ static void rockchip_pcie_enable_bw_int(struct
> rockchip_pcie *rockchip)
> =C2=A0{
> =C2=A0=09u32 status;
> =C2=A0
> -=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0=09status |=3D (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
> -=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0}
> =C2=A0
> =C2=A0static void rockchip_pcie_clr_bw_int(struct rockchip_pcie *rockchip=
)
> =C2=A0{
> =C2=A0=09u32 status;
> =C2=A0
> -=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0=09status |=3D (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
> -=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0}
> =C2=A0
> =C2=A0static void rockchip_pcie_update_txcredit_mui(struct rockchip_pcie
> *rockchip)
> @@ -269,7 +269,7 @@ static void rockchip_pcie_set_power_limit(struct
> rockchip_pcie *rockchip)
> =C2=A0=09scale =3D 3; /* 0.001x */
> =C2=A0=09curr =3D curr / 1000; /* convert to mA */
> =C2=A0=09power =3D (curr * 3300) / 1000; /* milliwatt */
> -=09while (power > PCIE_RC_CONFIG_DCR_CSPL_LIMIT) {
> +=09while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
> =C2=A0=09=09if (!scale) {
> =C2=A0=09=09=09dev_warn(rockchip->dev, "invalid power
> supply\n");
> =C2=A0=09=09=09return;
> @@ -278,10 +278,10 @@ static void
> rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
> =C2=A0=09=09power =3D power / 10;
> =C2=A0=09}
> =C2=A0
> -=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCR);
> -=09status |=3D (power << PCIE_RC_CONFIG_DCR_CSPL_SHIFT) |
> -=09=09=C2=A0 (scale << PCIE_RC_CONFIG_DCR_CPLS_SHIFT);
> -=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
> +=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> PCI_EXP_DEVCAP);
> +=09status |=3D FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
> +=09status |=3D FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);
> +=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> PCI_EXP_DEVCAP);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -309,14 +309,14 @@ static int rockchip_pcie_host_init_port(struct
> rockchip_pcie *rockchip)
> =C2=A0=09rockchip_pcie_set_power_limit(rockchip);
> =C2=A0
> =C2=A0=09/* Set RC's clock architecture as common clock */
> -=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0=09status |=3D PCI_EXP_LNKSTA_SLC << 16;
> -=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0
> =C2=A0=09/* Set RC's RCB to 128 */
> -=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0=09status |=3D PCI_EXP_LNKCTL_RCB;
> -=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> =C2=A0
> =C2=A0=09/* Enable Gen1 training */
> =C2=A0=09rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
> @@ -341,9 +341,9 @@ static int rockchip_pcie_host_init_port(struct
> rockchip_pcie *rockchip)
> =C2=A0=09=09 * Enable retrain for gen2. This should be
> configured only after
> =C2=A0=09=09 * gen1 finished.
> =C2=A0=09=09 */
> -=09=09status =3D rockchip_pcie_read(rockchip,
> PCIE_RC_CONFIG_LCS);
> +=09=09status =3D rockchip_pcie_read(rockchip,
> PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
> =C2=A0=09=09status |=3D PCI_EXP_LNKCTL_RL;
> -=09=09rockchip_pcie_write(rockchip, status,
> PCIE_RC_CONFIG_LCS);
> +=09=09rockchip_pcie_write(rockchip, status,
> PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
> =C2=A0
> =C2=A0=09=09err =3D readl_poll_timeout(rockchip->apb_base +
> PCIE_CORE_CTRL,
> =C2=A0=09=09=09=09=09 status,
> PCIE_LINK_IS_GEN2(status), 20,
> @@ -380,15 +380,15 @@ static int rockchip_pcie_host_init_port(struct
> rockchip_pcie *rockchip)
> =C2=A0
> =C2=A0=09/* Clear L0s from RC's link cap */
> =C2=A0=09if (of_property_read_bool(dev->of_node, "aspm-no-l0s")) {
> -=09=09status =3D rockchip_pcie_read(rockchip,
> PCIE_RC_CONFIG_LINK_CAP);
> -=09=09status &=3D ~PCIE_RC_CONFIG_LINK_CAP_L0S;
> -=09=09rockchip_pcie_write(rockchip, status,
> PCIE_RC_CONFIG_LINK_CAP);
> +=09=09status =3D rockchip_pcie_read(rockchip,
> PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
> +=09=09status &=3D ~PCI_EXP_LNKCAP_ASPM_L0S;
> +=09=09rockchip_pcie_write(rockchip, status,
> PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
> =C2=A0=09}
> =C2=A0
> -=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCSR);
> -=09status &=3D ~PCIE_RC_CONFIG_DCSR_MPS_MASK;
> -=09status |=3D PCIE_RC_CONFIG_DCSR_MPS_256;
> -=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCSR);
> +=09status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> PCI_EXP_DEVCTL);
> +=09status &=3D ~PCI_EXP_DEVCTL_PAYLOAD;
> +=09status |=3D PCI_EXP_DEVCTL_PAYLOAD_256B;
> +=09rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> PCI_EXP_DEVCTL);
> =C2=A0
> =C2=A0=09return 0;
> =C2=A0err_power_off_phy:
> diff --git a/drivers/pci/controller/pcie-rockchip.h
> b/drivers/pci/controller/pcie-rockchip.h
> index 5864a20323f2..f5cbf3c9d2d9 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -155,17 +155,7 @@
> =C2=A0#define PCIE_EP_CONFIG_DID_VID=09=09(PCIE_EP_CONFIG_BASE + 0x00)
> =C2=A0#define PCIE_EP_CONFIG_LCS=09=09(PCIE_EP_CONFIG_BASE + 0xd0)
> =C2=A0#define PCIE_RC_CONFIG_RID_CCR=09=09(PCIE_RC_CONFIG_BASE + 0x08)
> -#define PCIE_RC_CONFIG_DCR=09=09(PCIE_RC_CONFIG_BASE + 0xc4)
> -#define=C2=A0=C2=A0 PCIE_RC_CONFIG_DCR_CSPL_SHIFT=09=0918
> -#define=C2=A0=C2=A0 PCIE_RC_CONFIG_DCR_CSPL_LIMIT=09=090xff
> -#define=C2=A0=C2=A0 PCIE_RC_CONFIG_DCR_CPLS_SHIFT=09=0926
> -#define PCIE_RC_CONFIG_DCSR=09=09(PCIE_RC_CONFIG_BASE + 0xc8)
> -#define=C2=A0=C2=A0 PCIE_RC_CONFIG_DCSR_MPS_MASK=09=09GENMASK(7, 5)
> -#define=C2=A0=C2=A0 PCIE_RC_CONFIG_DCSR_MPS_256=09=09(0x1 << 5)
> -#define PCIE_RC_CONFIG_LINK_CAP=09=09(PCIE_RC_CONFIG_BASE
> + 0xcc)
> -#define=C2=A0=C2=A0 PCIE_RC_CONFIG_LINK_CAP_L0S=09=09BIT(10)
> -#define PCIE_RC_CONFIG_LCS=09=09(PCIE_RC_CONFIG_BASE + 0xd0)
> -#define PCIE_EP_CONFIG_LCS=09=09(PCIE_EP_CONFIG_BASE + 0xd0)
> +#define PCIE_RC_CONFIG_CR=09=09(PCIE_RC_CONFIG_BASE + 0xc0)
> =C2=A0#define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE +
> 0x90c)
> =C2=A0#define PCIE_RC_CONFIG_THP_CAP=09=09(PCIE_RC_CONFIG_BASE +
> 0x274)
> =C2=A0#define=C2=A0=C2=A0 PCIE_RC_CONFIG_THP_CAP_NEXT_MASK=09GENMASK(31, =
20)


