Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A586DD13585
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWS15QnLh8O/pmcxZpugihX6efkJsc+3ZtDwRi+DctM=; b=ohUvTGexwxZFNAAgQTeswBltKl
	9OEclccqhVm7lnYluA/x82zJQGCOtABHe6fLSgrOY2c+WpvZh5CeKhy+ZdtKmdKemy2sw/2MXitXV
	+fRLLzFQiQX5jy+q8SG0XW7LvQyRcar+6eqOGwQrnNGeiyjyh9IkO+k2tECQjI84Nzau2X73fbbBC
	0Ha49j9LO6nK4ZWxiG+iZ8Tr13Vc0o15bzAeJHHLKxzF9Dv+PY5GHlqNGvsTxG5PKwRYgIFfswm1O
	/SweZuBpt1326ZND305YE7Qop4tUOIYDw/HCQECaII1Bc42ICAm6/3VXR0gjAKD3wn4PHPV/olxWt
	Tp2v3+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A7T-00000008s8d-3lD3;
	Sun, 27 Oct 2024 20:44:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A5V-00000008rYP-0qN7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B7935C5814;
	Sun, 27 Oct 2024 20:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878AFC4CEC7;
	Sun, 27 Oct 2024 20:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730061732;
	bh=TlirieVOeoCI7ASR7CcbZmiCUaE3lt5vbX64fy8rlco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yp4LVjvaUZS3b8aTxrtglH2gFy/HjfkX+6t6JlasaRbx/nm/b5n+rY6wfMjl1YR9E
	 Z4zQaQf9/MmBWWRy5iKi3gy0s4alRlVX88ko70636P9+YL4bb4hvgedX2lBaOPLFqx
	 tuxmVG6TPvGLXafUJj3hVKDsCIjHidHEbjX9up7l5ev9PEyYPINYU7T9pl1JR5+wZe
	 +dNDcMWN9UkvgtI4jD3FztgIZ2aIVwZH4yFZIHIXOkM4lUI5ZxcYj20UqyHlbBeBzP
	 B4FDlxKonncinwwKCrPhtqUxq5eBdQfn8Upi8p38+LHEfjswAnH97iD2XLV3gEE78D
	 a3hzmGYzUrwqw==
Date: Sun, 27 Oct 2024 21:42:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?Q3PDs2vDoXMs?= Bence <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 02/10] dma-engine: sun4i: Add has_reset option to quirk
Message-ID: <nlhsxigg3rbfvua76ekmub4p6df2asps2ihueouuk6zkbn56zl@xdj6jzzt4gfb>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
 <20241027091440.1913863-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241027091440.1913863-2-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_134213_306337_994D770B 
X-CRM114-Status: GOOD (  12.93  )
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

On Sun, Oct 27, 2024 at 10:14:32AM +0100, Cs=C3=B3k=C3=A1s, Bence wrote:
> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
> has this bit but in order to support suniv we need to add it. So add
> support for reset bit.
> =20
>  static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
> @@ -1215,6 +1218,15 @@ static int sun4i_dma_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(priv->clk);
>  	}
> =20
> +	if (priv->cfg->has_reset) {
> +		priv->rst =3D devm_reset_control_get_exclusive(&pdev->dev,
> +							     NULL);
> +		if (IS_ERR(priv->rst)) {
> +			dev_err_probe(&pdev->dev, "Failed to get reset control\n");

syntax is: return dev_err_probe()

Best regards,
Krzysztof


