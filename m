Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DF0C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUQPqHUkoxXQgvCGjRkgQw4Th5QpfxwKkCZfKsruz9s=; b=Jtd3vOOTZoFjPJeF53uxNvP8AL
	64bBMGXvaTLP8WmBPs8GeWLDkWElRtKypkJivfNFlPhRaY4FTlWhYtyWMvFFA5BcV1HHoD6IFqUMr
	myA2hnufsuseLDwjScGpZmHahpx/tA0lloaTV5dzgnsgJNepUEL8X5SLNYA40mMBCWy/tTIeztqEk
	elKfBZIYSEA5PkKfF4Ja3/YnE+FexE8S6wCisZ9Dbcib7TFOVFqgTLQcslDXbJgXX3SIq0Cj1HnF0
	TzBQrAfCL07mQwvE6nXr25WkowlFQ/g1WxTQpTGx4C1Nmj54NXJXek3X/RW/vGX3+Mh4hOYXciGx8
	jatF7nHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrdc-0000000GhOK-0GOT;
	Tue, 25 Feb 2025 09:54:04 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrFd-0000000Gaiy-1fUy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D798A61239
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA28BC4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740475755;
	bh=5QI9uHnbKrXRYGECovSmXyJvXB7auSAuhh+3htNO7DE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nuV7oYqOqcFYUbXxbNP3rUkXVAa8592p3HxdihLdC5kXmWBKKZR3WqKQQendCNaV/
	 oENz2v5D7A9JKyUOf1uodJmLm1dwCSf8wP9Z8AP/kNQM8sDn99CZQi/ZJHDXpPb4Xb
	 d3PsLgO8xvfl7+lTWEKmbzenhWL8/jbbFC1E00x79diKhjTnwZcyo/4ktVzkaBvZ/j
	 OMGrPyQUPqBO+cQUWzk+7fFfEfSclBkWkxYrXRneYbAli5NQXMgr0v5DJ6YHwiQglV
	 QNPmFR5o+111CjBJYMXitgSeAeKXxONTPS5aQt0+JCNGA5357tdKC38UIqcBMLjBoR
	 GEGMFWKIGIpXg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abec925a135so147614266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaiZ9kCTDvITMxSEq/wnP3AjJkP7Ebwcvy91DXuNYFcuiCuEvkTt93c9MJcvRHBOayrKN7eWI07A1kx4zSTD62@lists.infradead.org
X-Gm-Message-State: AOJu0YwoEFNLECi4JPTTBujP21e1pDd3TBhghZb6u0QKGJPV5zM4l8Q3
	Hr40jtDGdvn6IgTnyh9PFTi3tT44y9eA5olAZZG+++NsUIwf9o0SWZ6J600VB6X9jSaVUIZzUQU
	4ai8aGvMCPa3d9FnVyRD948+6VuM=
X-Google-Smtp-Source: AGHT+IEOq0At6zPT+OpiunH+4BSketgcPR98DlixUCXVccfuLEsVE/TVTjLEJE+pZxuYrZTPiI+ADoAS4DNWkmoERiQ=
X-Received: by 2002:a17:907:9406:b0:aaf:c259:7f6 with SMTP id
 a640c23a62f3a-abc09d35ecfmr1620078166b.45.1740475754321; Tue, 25 Feb 2025
 01:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20250224135321.36603-2-phasta@kernel.org> <20250224135321.36603-4-phasta@kernel.org>
In-Reply-To: <20250224135321.36603-4-phasta@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Feb 2025 17:29:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Eu3VNO615wMdMT2bbeSurACwyR9uJmSGHErdyVu950Q@mail.gmail.com>
X-Gm-Features: AQ5f1JpaEC4JuCS1MMY9EZYHmlHgtkdETZGtwE5y_2Q9kz7yTyHXXJLQzlO9aME
Message-ID: <CAAhV-H4Eu3VNO615wMdMT2bbeSurACwyR9uJmSGHErdyVu950Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/4] stmmac: loongson: Remove surplus loop
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
> loongson_dwmac_probe() contains a loop which doesn't have an effect,
> because it tries to call pcim_iomap_regions() with the same parameters
> several times. The break statement at the loop's end furthermore ensures
> that the loop only runs once anyways.
>
> Remove the surplus loop.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index 73a6715a93e6..e3cacd085b3f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -554,14 +554,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev=
, const struct pci_device_id
>         pci_set_master(pdev);
>
>         /* Get the base address of device */
> -       for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> -               if (pci_resource_len(pdev, i) =3D=3D 0)
> -                       continue;
> -               ret =3D pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
> -               if (ret)
> -                       goto err_disable_device;
> -               break;
> -       }
> +       ret =3D pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
> +       if (ret)
> +               goto err_disable_device;
>
>         memset(&res, 0, sizeof(res));
>         res.addr =3D pcim_iomap_table(pdev)[0];
> --
> 2.48.1
>

