Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F416CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOrKWDaB0ZFkgmsKOd1YksUh3/RLEW4Ywg0Vwyt3LTQ=; b=Xk5DaNpRvaR+UH423vgt083xtM
	eoHMaF2i7ZYsRK50l13LpxT3PTGZ5R1Z7hZvrrTJRpdehQo9Nc6/SI+eDJ/DEDgtwERzQy1mdq6I4
	ZVGs4DJ8+A/ATkd3j+ksH4kC4DpIzzO8vIGSY8la9C1Ofl7z/m33Eu9rbw7ZFxnnM0Cti8ovjxwPo
	/DHFnl6BrGdb+VQwMvKfGBqjugaWLh1JymMH59n8otu7wXIhPe6chic+qwsyW8wJ0dfsxGCo+WLk/
	zqpxzyAqKIVrTLpHzQ8Ghq410sJmL3js+kRBYmjRuuKBrzCqbKofBD5nPmJVR0dDg20Q7oePE/4Db
	ELqP5ySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ2D-000000084W2-3I1D;
	Wed, 24 Jun 2026 16:01:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ2B-000000084V0-3sPn;
	Wed, 24 Jun 2026 16:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kOrKWDaB0ZFkgmsKOd1YksUh3/RLEW4Ywg0Vwyt3LTQ=; b=ZUc4z5ZXtx1jvccJBmBq3UZOb1
	WbhuofMPjZd5cEDAwo7pqeCRVSZwhzokghQXuizOfCMoyADHgEcluAdE4rZS0RTFXtMrs5vFOXDFE
	/W1i798WxkuTbfSktXxznpIynENGmvaNs0eIIwnl8QBBhL8bw1ujfJqo1dcDdHEu0Rjc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wcQ1r-00974o-MQ; Wed, 24 Jun 2026 18:00:43 +0200
Date: Wed, 24 Jun 2026 18:00:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jackbb_wu@compal.com
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
	Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
	Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/7] net: wwan: t9xx: Add control plane transaction
 layer
Message-ID: <2a90ae6b-2b6d-4340-b557-915252cc3488@lunn.ch>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
 <20260624-t9xx_driver_v1-v3-2-73ff03f60c48@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-t9xx_driver_v1-v3-2-73ff03f60c48@compal.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_090103_963373_3444642C 
X-CRM114-Status: GOOD (  12.64  )
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

> +static int __init mtk_common_drv_init(void)
> +{
> +	return 0;
> +}
> +module_init(mtk_common_drv_init);
> +
> +static void __exit mtk_common_drv_exit(void)
> +{
> +}
> +module_exit(mtk_common_drv_exit);

Since these don't do anything, they should not be needed.

> @@ -467,6 +468,7 @@ static u32 mtk_pci_ext_h2d_evt_hw_bits(u32 chs)
>  
>  	SET_HW_BITS(hw_bits, chs, MHCCIF_RC2EP_EVT_DEVICE_RESET,
>  		    DEV_EVT_H2D_DEVICE_RESET);
> +
>  	return LE32_TO_U32(cpu_to_le32(hw_bits));

Please don't add white space like this. I assume a previous patch
added this code, so move this to that patch.

> @@ -908,13 +910,11 @@ static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct mtk_md_dev *mdev;
>  	int ret;
>  
> -	mdev = devm_kzalloc(dev, sizeof(*mdev), GFP_KERNEL);
> +	mdev = mtk_dev_alloc(dev, &pci_hw_ops);
>  	if (!mdev) {
>  		ret = -ENOMEM;
>  		goto log_err;
>  	}
> -	mdev->dev_ops = &pci_hw_ops;
> -	mdev->dev = dev;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv) {
> @@ -991,7 +991,7 @@ static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  free_priv_data:
>  	devm_kfree(dev, priv);
>  free_cntx_data:
> -	devm_kfree(dev, mdev);
> +	mtk_dev_free(mdev);

Why are you removing devm_ calls?

	Andrew

