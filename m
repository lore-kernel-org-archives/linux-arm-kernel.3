Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJ9MgFSULarwNi5dDlhiRBkOq+9uURLlupFAhkLYoIk=; b=oTl+JDZs/76ib9f1I3sHY59K/9
	TcS4ZReqk1+XQigeZLK36UpGz03BvpAB54hHttPE6sKlWTPrJlR0BGK7GM1BgHKYfxW8q2g/drEB2
	gYnar12D5xRB5bkaSP3UVYiMvy8c2aRuWJD44yhBoZzWVV6VqbGSGNgvRW7ltFPBOeqPSukeoAwT2
	zEWinsnYNuBuNJqebs5nF+xoxwnMMhgS//eLQcjqILVKTzn/Gbrf1dvJe8+vOnIbXQq7gY6X1YzMG
	XwpQ7I+YDATMtPregcbDbb5nAef9jv3HmPi7CjLodg1bhuRH3+NV3x582URHGTnHOglKkwfGuzQli
	HoRcDHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrf8-0000000Ghrp-39LY;
	Tue, 25 Feb 2025 09:55:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrHR-0000000Gb00-1B3r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1660F5C6D08
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674F3C4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740475867;
	bh=VhqhUEKJybMC5Ioqu2TlM8kjWfRxkvh6hF8HPB9/5wA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EXfIAagzfTqvwWsRGznCUK3ZkWhLbD7NPhK4kB6yq1P7xsid+Jxuj9M05vjK46gYk
	 3xEUD5L4kt7jgVgmhutEnYpZy/x04g+8QzkG9TZZOLMuynarF+R4825SDG6/c16yWv
	 hugaeESVhquFZn7pAzz5jzYhh1gM6Bu4HVuyfgKmSUhPEdwvzHkwfFrW+h+HU5Zb+s
	 7lXaIemT3IQisCddKoSlWBBoIwSZW/ViiyJKSS7+eTLmA8Jvsp1ZfGzwyn5cq4Gvhq
	 WQ7cfRa0RC2dTKKnz3yQYWeTrLaQsjneKUhDcP3nEkLI3YI3iCiE/iMat4+B60vNTN
	 woaslJT0QpaYg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abb7520028bso714996666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:31:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/IXYChhyjwz6t7XR5eKLgGTxZdLmU/SgUuuUzrIsYkUFra/uSYOBwGVCEytvlov72EJarzRxZi47papks+l4e@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp7rywyROQ0Sx2yw18ctLu9jkKV4i2QhysP+XesPR15iZk1QDM
	GJCM8Y22oFRBlgFCT3eKojmNzjLhZPyFUhW/gYCurv8QUrnqv2M0YEUdQNk0pIkj0VkyG7SDjdy
	os56Eau82RPfkRXgTqzbufHDLeqE=
X-Google-Smtp-Source: AGHT+IGLJYv/e1oxPDxFKFsKBaEaUHmq0pFseR1OcvNHLehzMt/+mZLqCUb2pCHMmsax354c1CbJrvmsMW+1OBmxUh8=
X-Received: by 2002:a17:906:3151:b0:aba:5e50:6984 with SMTP id
 a640c23a62f3a-abc099ead3amr1554594166b.2.1740475865854; Tue, 25 Feb 2025
 01:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20250224135321.36603-2-phasta@kernel.org> <20250224135321.36603-6-phasta@kernel.org>
In-Reply-To: <20250224135321.36603-6-phasta@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Feb 2025 17:30:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5OH7JLUUCjDAP=qfzGUVLt1HfiAYtc6Hr0oHURM0Pa9A@mail.gmail.com>
X-Gm-Features: AQ5f1Jrr8qZL58Do6GOisELNPoK9P0OBrnmwiGAX3q4INVgQhFafk3UcjXTs7oU
Message-ID: <CAAhV-H5OH7JLUUCjDAP=qfzGUVLt1HfiAYtc6Hr0oHURM0Pa9A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/4] stmmac: Replace deprecated PCI functions
To: Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yanteng Si <si.yanteng@linux.dev>, Yinggang Gu <guyinggang@loongson.cn>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Philipp Stanner <pstanner@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_013109_442103_BB996BE6 
X-CRM114-Status: GOOD (  22.64  )
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

On Mon, Feb 24, 2025 at 9:53=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> From: Philipp Stanner <pstanner@redhat.com>
>
> The PCI functions
>   - pcim_iomap_regions() and
>   - pcim_iomap_table()
> have been deprecated.
>
> Replace them with their successor function, pcim_iomap_region().
>
> Make variable declaration order at closeby places comply with reverse
> christmas tree order.
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 11 ++++-------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 14 ++++++--------
>  2 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index f3ea6016be68..25ef7b9c5dce 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -521,10 +521,10 @@ static int loongson_dwmac_acpi_config(struct pci_de=
v *pdev,
>  static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_d=
evice_id *id)
>  {
>         struct plat_stmmacenet_data *plat;
> +       struct stmmac_resources res =3D {};
>         struct stmmac_pci_info *info;
> -       struct stmmac_resources res;
>         struct loongson_data *ld;
> -       int ret, i;
> +       int ret;
>
>         plat =3D devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
>         if (!plat)
> @@ -554,13 +554,11 @@ static int loongson_dwmac_probe(struct pci_dev *pde=
v, const struct pci_device_id
>         pci_set_master(pdev);
>
>         /* Get the base address of device */
> -       ret =3D pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
> +       res.addr =3D pcim_iomap_region(pdev, 0, DRIVER_NAME);
> +       ret =3D PTR_ERR_OR_ZERO(res.addr);
>         if (ret)
>                 goto err_disable_device;
>
> -       memset(&res, 0, sizeof(res));
> -       res.addr =3D pcim_iomap_table(pdev)[0];
> -
>         plat->bsp_priv =3D ld;
>         plat->setup =3D loongson_dwmac_setup;
>         ld->dev =3D &pdev->dev;
> @@ -603,7 +601,6 @@ static void loongson_dwmac_remove(struct pci_dev *pde=
v)
>         struct net_device *ndev =3D dev_get_drvdata(&pdev->dev);
>         struct stmmac_priv *priv =3D netdev_priv(ndev);
>         struct loongson_data *ld;
> -       int i;
>
>         ld =3D priv->plat->bsp_priv;
>         stmmac_dvr_remove(&pdev->dev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/n=
et/ethernet/stmicro/stmmac/stmmac_pci.c
> index 91ff6c15f977..37fc7f55a7e4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> @@ -155,9 +155,9 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>  {
>         struct stmmac_pci_info *info =3D (struct stmmac_pci_info *)id->dr=
iver_data;
>         struct plat_stmmacenet_data *plat;
> -       struct stmmac_resources res;
> -       int i;
> +       struct stmmac_resources res =3D {};
>         int ret;
> +       int i;
>
>         plat =3D devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
>         if (!plat)
> @@ -188,13 +188,13 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>                 return ret;
>         }
>
> -       /* Get the base address of device */
> +       /* The first BAR > 0 is the base IO addr of our device. */
>         for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
>                 if (pci_resource_len(pdev, i) =3D=3D 0)
>                         continue;
> -               ret =3D pcim_iomap_regions(pdev, BIT(i), pci_name(pdev));
> -               if (ret)
> -                       return ret;
> +               res.addr =3D pcim_iomap_region(pdev, i, STMMAC_RESOURCE_N=
AME);
> +               if (IS_ERR(res.addr))
> +                       return PTR_ERR(res.addr);
>                 break;
>         }
>
> @@ -204,8 +204,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 return ret;
>
> -       memset(&res, 0, sizeof(res));
> -       res.addr =3D pcim_iomap_table(pdev)[i];
>         res.wol_irq =3D pdev->irq;
>         res.irq =3D pdev->irq;
>
> --
> 2.48.1
>

