Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AD1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 07:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXXY3hCS9dJ1Ur2pQC/iJ+uAm9WAz2sQ3CodAQOx9jA=; b=yeXm+TEgmCz/C+r99GJ20WVAUL
	xQHjntkv8Ymtp8jcTsYSegCbf28LyDfSUvqRBWLtzVvU17xlkj2j2FkRsgPP07j5l5RWFfIx+g1m8
	VFPdB9Wbj+kFR1uiXf6ILrydYrN6f3tUlrD+zpMiwKLI8XSI1deloSxZZYpV3F3TtaiEaff0aLmVL
	9SRRV9bwptJ7KmWL7tKKTKBPcxFwdMMAbAP2abNnAZxeUADHzKtIuRmSrBYGDDKNp6yphISK/kxA5
	CuxTs8xddMjCIozS4PWB8O47F5ZfyR1uX1/9vZd3Sv0+g5fSJuWcVeO5BgvOHk7kPPLMDOVoxm5zF
	QhATX7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpCn-0000000GBE4-32aE;
	Tue, 25 Feb 2025 07:18:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpB6-0000000GAwo-1Jzj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 07:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740467786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iXXY3hCS9dJ1Ur2pQC/iJ+uAm9WAz2sQ3CodAQOx9jA=;
	b=gZRa/MXs3CAazeGzE6Vh85zgxkal3vA+BtgBr2HHYGHooiiYN7W087LCwZZ84kqc9b65+g
	ru5U0sg7qsZmda6r391oa4fcbVKeLGtUddxAGlk244DSnWE8PKM2S11qAfIcsxjlWvN0lg
	qSHzVy4G11+ESqbEYgGHJP4NasB1SYY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-LG3kzbSwNRW-FslqIz4CAg-1; Tue, 25 Feb 2025 02:16:22 -0500
X-MC-Unique: LG3kzbSwNRW-FslqIz4CAg-1
X-Mimecast-MFC-AGG-ID: LG3kzbSwNRW-FslqIz4CAg_1740467781
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4399c5ba9e4so28848275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 23:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740467781; x=1741072581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQ8ganHFrjZwdAsNJKERIzeXH5APWE2/FMGZlEN7QT0=;
        b=hTAT+gxGLwe6sjBXQRpzLNJtBzjaLYnvZXjJ1j1FMQjSY/F+Qqa7puZsFGJwi4yNcP
         kKg1vmDZ1Ol6HdMxWEjhfNd6ZmX1y0vYZpbXUhny1NjcSOiPon1X0pOiVIEZMeJq01b8
         LCLqidfk3ImMfMrGjAbNLGnR1UYyzdV+RPeZF6NMXhD/ecZMt/iLXcqW1q8TpzjC9Nl6
         sUi68NTXunozzzNh9eUrJzilvUsrq6aCTrdhOPSVxHLEQjFKvBXxAH0WeaCCmff/3AG5
         vh11i5xibmSI2J0tfU/Ft8Ve27CwnpAvr2bgJ8J36noJq2fekaz2gTEIjgdhjahjH+mI
         HRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9rqIKmngtpBGQAogHrML8BwUepVUF1DrCld8okYv8VihJNEWLzLvRF80hDzcClwcutSjOVP5N8fs5IJ8p0UYF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk2ZPbEW9QZVj0Gy1MB4pZ3MzGUZPgTDFCPxvkvhPubUa/giGh
	rAO6kGZ2+xYk/Z3dynQmcTFyXPfgMLWM3LLcPcqwHWzMgRGEoys0OPskH7eHLis+qm7E0hPCoXc
	/r5Qhbj0P+1S+D6VVrhwPt+IxX7gPcGD3PSNFIUAXIz0tcMmUwACWTHMibFTQfCRqnOc4p2aj
X-Gm-Gg: ASbGncvxuYeLf8lNvqThcma9+A8rae+eSRs2HH1uQc3UOvjVvbXsONyAPqGsbcXw7Bm
	2KNufM1fYLu/O1Q+DtJ0crb1LTqKj2Pr3AfIQCMpNr4+/5a0Kwnv7z1UipmkHmM1RSGhfjcEUiQ
	taRytrgRaHBa0+HhRIJZmdNKPMIerqGM5upUEemk4O+KE8eLpiaforazBvOOeTSOuMDV7sbuDRO
	03dVnoDTObjzwnDB7kmdJ+H2++Zv5njxez53a6NFXNSrznE1RGJGnN6Fcw+YCjszmfJ3/g74a3p
	G+ols/0Rbhf0DA4WhivoXMngpKjt34WbkHHnXR5FHQ==
X-Received: by 2002:a05:600c:4e8b:b0:439:9eba:939a with SMTP id 5b1f17b1804b1-43ab0f8b68bmr15347835e9.26.1740467781033;
        Mon, 24 Feb 2025 23:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKAYIbDeUkxN/sPOdOh9dmDT/KC44JigW8G4nDwTJ+erWGkxMnzLVafhwjP4Cz13s3tIx2WQ==
X-Received: by 2002:a05:600c:4e8b:b0:439:9eba:939a with SMTP id 5b1f17b1804b1-43ab0f8b68bmr15347625e9.26.1740467780642;
        Mon, 24 Feb 2025 23:16:20 -0800 (PST)
Received: from [10.32.64.164] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1539da5sm15328505e9.10.2025.02.24.23.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:16:20 -0800 (PST)
Message-ID: <f1c3e538e19aca7fd46dd7f10da190d691bace83.camel@redhat.com>
Subject: Re: [PATCH net-next v3 4/4] stmmac: Replace deprecated PCI functions
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Huacai Chen
 <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Yinggang Gu
 <guyinggang@loongson.cn>, Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Feb 2025 08:16:18 +0100
In-Reply-To: <20250224135321.36603-6-phasta@kernel.org>
References: <20250224135321.36603-2-phasta@kernel.org>
	 <20250224135321.36603-6-phasta@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iol1jqbxsmsNTYoMiSKVp7yMwX5XRBqa74pbMm9wKI4_1740467781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_231628_425648_CDC9E5CE 
X-CRM114-Status: GOOD (  17.77  )
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

On Mon, 2025-02-24 at 14:53 +0100, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
>=20
> The PCI functions
> =C2=A0 - pcim_iomap_regions() and
> =C2=A0 - pcim_iomap_table()
> have been deprecated.
>=20
> Replace them with their successor function, pcim_iomap_region().
>=20
> Make variable declaration order at closeby places comply with reverse
> christmas tree order.
>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0.../net/ethernet/stmicro/stmmac/dwmac-loongson.c=C2=A0=C2=A0 | 11 +=
+++-------
> =C2=A0drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c=C2=A0=C2=A0 | 14 +=
+++++------
> --
> =C2=A02 files changed, 10 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index f3ea6016be68..25ef7b9c5dce 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -521,10 +521,10 @@ static int loongson_dwmac_acpi_config(struct
> pci_dev *pdev,
> =C2=A0static int loongson_dwmac_probe(struct pci_dev *pdev, const struct
> pci_device_id *id)
> =C2=A0{
> =C2=A0=09struct plat_stmmacenet_data *plat;
> +=09struct stmmac_resources res =3D {};
> =C2=A0=09struct stmmac_pci_info *info;
> -=09struct stmmac_resources res;
> =C2=A0=09struct loongson_data *ld;
> -=09int ret, i;
> +=09int ret;
> =C2=A0
> =C2=A0=09plat =3D devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> =C2=A0=09if (!plat)
> @@ -554,13 +554,11 @@ static int loongson_dwmac_probe(struct pci_dev
> *pdev, const struct pci_device_id
> =C2=A0=09pci_set_master(pdev);
> =C2=A0
> =C2=A0=09/* Get the base address of device */
> -=09ret =3D pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
> +=09res.addr =3D pcim_iomap_region(pdev, 0, DRIVER_NAME);
> +=09ret =3D PTR_ERR_OR_ZERO(res.addr);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto err_disable_device;
> =C2=A0
> -=09memset(&res, 0, sizeof(res));
> -=09res.addr =3D pcim_iomap_table(pdev)[0];
> -
> =C2=A0=09plat->bsp_priv =3D ld;
> =C2=A0=09plat->setup =3D loongson_dwmac_setup;
> =C2=A0=09ld->dev =3D &pdev->dev;
> @@ -603,7 +601,6 @@ static void loongson_dwmac_remove(struct pci_dev
> *pdev)
> =C2=A0=09struct net_device *ndev =3D dev_get_drvdata(&pdev->dev);
> =C2=A0=09struct stmmac_priv *priv =3D netdev_priv(ndev);
> =C2=A0=09struct loongson_data *ld;
> -=09int i;

Just saw that this is a left-over that actually should be in patch 3.
Will fix.


P.

> =C2=A0
> =C2=A0=09ld =3D priv->plat->bsp_priv;
> =C2=A0=09stmmac_dvr_remove(&pdev->dev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> index 91ff6c15f977..37fc7f55a7e4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> @@ -155,9 +155,9 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
> =C2=A0{
> =C2=A0=09struct stmmac_pci_info *info =3D (struct stmmac_pci_info *)id-
> >driver_data;
> =C2=A0=09struct plat_stmmacenet_data *plat;
> -=09struct stmmac_resources res;
> -=09int i;
> +=09struct stmmac_resources res =3D {};
> =C2=A0=09int ret;
> +=09int i;
> =C2=A0
> =C2=A0=09plat =3D devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> =C2=A0=09if (!plat)
> @@ -188,13 +188,13 @@ static int stmmac_pci_probe(struct pci_dev
> *pdev,
> =C2=A0=09=09return ret;
> =C2=A0=09}
> =C2=A0
> -=09/* Get the base address of device */
> +=09/* The first BAR > 0 is the base IO addr of our device. */
> =C2=A0=09for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> =C2=A0=09=09if (pci_resource_len(pdev, i) =3D=3D 0)
> =C2=A0=09=09=09continue;
> -=09=09ret =3D pcim_iomap_regions(pdev, BIT(i),
> pci_name(pdev));
> -=09=09if (ret)
> -=09=09=09return ret;
> +=09=09res.addr =3D pcim_iomap_region(pdev, i,
> STMMAC_RESOURCE_NAME);
> +=09=09if (IS_ERR(res.addr))
> +=09=09=09return PTR_ERR(res.addr);
> =C2=A0=09=09break;
> =C2=A0=09}
> =C2=A0
> @@ -204,8 +204,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
> =C2=A0=09if (ret)
> =C2=A0=09=09return ret;
> =C2=A0
> -=09memset(&res, 0, sizeof(res));
> -=09res.addr =3D pcim_iomap_table(pdev)[i];
> =C2=A0=09res.wol_irq =3D pdev->irq;
> =C2=A0=09res.irq =3D pdev->irq;
> =C2=A0


