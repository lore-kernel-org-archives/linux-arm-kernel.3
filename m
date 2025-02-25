Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBE7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C46osKrXZVq3r3yVpJRublwwcNpJOpo3wjx4ImElbUA=; b=Bk0ajIS1U5hOLR8Ib3Jzu67A41
	A0/ECCAUSQtg2Rsw053/q2lxMEmCE0K8+tBDZrWgDi9I2Kvu2JuNUQP8BSqzcz5xz3uOw77fmkcw4
	4S7GJkxW9lSPssJN9IjCEGg7niq/JkRKSgof3QUiPSPxoL33EQxVI4B6xaMui/W35vz1HoDSZneR/
	HCVtqbjLAxGAY3XkrsXMn4MR72Icx2mEeCc808DbpzMc+SVG30zRB84oYAE/H7hTPnIg5crRM6mSS
	84oeNdJecNZ8h+MF7x/jBxCDKXBmz4DWmLHiH/p3BJgDsqqHSy0ngC4h0H/oaSmcgVg63/rMzw9Yb
	nMGWP+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrc5-0000000Gh6B-4Aoy;
	Tue, 25 Feb 2025 09:52:29 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmr6V-0000000GZ3o-0JEu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2AB461135
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1B4C4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740475189;
	bh=WV/BQQjSklg+inxqIej//MnYL20DO4u7FlUKUcFIGv8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lA/bVmVMetzwiXqOeUGtVR6F7uarRXY90zqUe77HzmH4qj17klWRTgsVjoMCzpxwE
	 FZBeUAoTGULiEycBEtA7qscYuNc8ZZGSxGn0AVhbb/6lSDHTUN28lzRPUtBhgzs4aE
	 h5TTj9iZBkrJfSdQa6AUlcIckpRF39PLJkx5ou8ZO2uP8xO1pR2eN0guGWgX6FmJYA
	 Tu2g9lC9dR6hVaLwOggCLm36NZrFaye2bmRV1STrjrOIJtwuAzRZyvqgm34tmVV0m9
	 n+2UJ1hz/a1FDAO2nLCFqjpCTOlqxwxwNwrQKsMjsL5BzVIzOH3kUxMQIYY+wiWwBc
	 vLa/f5TGa0onw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab744d5e567so907763566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:19:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9k9JM0KUiTwuImjkmVz2pHF8uXMmL0hnO3KXAWa89mGEraYrN/OFm6rZIbOvni2dDmQBDhpufJsfSeekRDL5D@lists.infradead.org
X-Gm-Message-State: AOJu0YyNWiV5zUm8nsLsO45Jtx5TuQEyHrnlvYssfImJr0LXl95SQtlh
	53gPUdlbf2dX1c+wGZN//lNUnWVxYIbU4VRvz59Kqh3IP2Ss0CSdAsPShkcnbkyJbn+Px7u8SWp
	arEcLLjaZcSzQ8oFJwDEAHYznXqc=
X-Google-Smtp-Source: AGHT+IHH5/lZpNbRGSgruDA194J8Wu4I6GsbEXWL0O7Bhszg4FzraJyCq1ptOSxW6ZjsuQkpHhmLCFX1Z/wZ9UNOce0=
X-Received: by 2002:a17:907:7a88:b0:ab6:fe30:f49e with SMTP id
 a640c23a62f3a-abc0b0e5fcdmr1785569066b.28.1740475188509; Tue, 25 Feb 2025
 01:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20250224135321.36603-2-phasta@kernel.org> <20250224135321.36603-5-phasta@kernel.org>
 <425215fb-8fb5-4412-87e7-1d29c4ac0b7f@linux.dev>
In-Reply-To: <425215fb-8fb5-4412-87e7-1d29c4ac0b7f@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Feb 2025 17:19:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6yVX_tgdiDP+vVB3K-dbRm-ejF0ngmN8UgFD8eRVaTJg@mail.gmail.com>
X-Gm-Features: AQ5f1Josz9kykUlq72YeUoErSStI-rKm3nm-tjAtPbfVHHpD6td2eL_df52t8Dk
Message-ID: <CAAhV-H6yVX_tgdiDP+vVB3K-dbRm-ejF0ngmN8UgFD8eRVaTJg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/4] stmmac: Remove pcim_* functions for
 driver detach
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yinggang Gu <guyinggang@loongson.cn>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	Philipp Stanner <pstanner@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Qing Zhang <zhangqing@loongson.cn>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 25, 2025 at 5:11=E2=80=AFPM Yanteng Si <si.yanteng@linux.dev> w=
rote:
>
>
> =E5=9C=A8 2/24/25 9:53 PM, Philipp Stanner =E5=86=99=E9=81=93:
> > Functions prefixed with "pcim_" are managed devres functions which
> > perform automatic cleanup once the driver unloads. It is, thus, not
> > necessary to call any cleanup functions in remove() callbacks.
> >
> > Remove the pcim_ cleanup function calls in the remove() callbacks.
> >
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  7 -------
> >   drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     | 10 ----------
> >   2 files changed, 17 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/dri=
vers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > index e3cacd085b3f..f3ea6016be68 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > @@ -614,13 +614,6 @@ static void loongson_dwmac_remove(struct pci_dev *=
pdev)
> >       if (ld->loongson_id =3D=3D DWMAC_CORE_LS_MULTICHAN)
> >               loongson_dwmac_msi_clear(pdev);
> >
> > -     for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > -             if (pci_resource_len(pdev, i) =3D=3D 0)
> > -                     continue;
> > -             pcim_iounmap_regions(pdev, BIT(i));
> > -             break;
> > -     }
> > -
> >       pci_disable_device(pdev);
> >   }
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_pci.c
> > index 352b01678c22..91ff6c15f977 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> > @@ -227,20 +227,10 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
> >    *
> >    * @pdev: platform device pointer
>
> >    * Description: this function calls the main to free the net resource=
s
>
> There is a missing full stop. You commented on the next email,
>
> and it seems that you are already preparing for v4.  With this
>
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Thanks,
> Yanteng
>
> > - * and releases the PCI resources.
> >    */
> >   static void stmmac_pci_remove(struct pci_dev *pdev)
> >   {
> > -     int i;
> > -
> >       stmmac_dvr_remove(&pdev->dev);
> > -
> > -     for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > -             if (pci_resource_len(pdev, i) =3D=3D 0)
> > -                     continue;
> > -             pcim_iounmap_regions(pdev, BIT(i));
> > -             break;
> > -     }
> >   }
> >
> >   static int __maybe_unused stmmac_pci_suspend(struct device *dev)

