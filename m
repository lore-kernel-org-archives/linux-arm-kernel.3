Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E690103A9BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUAy8s02wS3Trmoq70WZRMKMzjnhYHFa8Dc06TKwEQQ=; b=L9cKqw5ajSvu7Td67dr46MtIsh
	1kl0Tkzj7T9uV7iIXiELeY49EGZpngjaMfCPqsFYIGLWloNxv4xQ4dE1iy9BSHVxJeTgkFByHmaV6
	m3wqQWKj0Ln6uZ3o0HQdBYt4Wrf2oeWm455Gr/TEDTqQIISKOJ/GTzVrHV3xwW3GAMvJMK2hbwuIv
	tgtmnub+v6WS39F+5C6ghvjChoGYw4FoNhkz4L+Y+1clcL4eTyl6wvXZx+tIoucT/xH6sYXCCTD1p
	vKKjZhhFO2dqNihxpMF2xEoLnkIeUmkgHhsOa862fy5f72zBah2Tb7NA4yIRfCCMbuhsFtSpCJshx
	R7sXBVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mhj-00000003IVd-2E6v;
	Wed, 25 Mar 2026 11:47:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mhi-00000003IVD-1awG;
	Wed, 25 Mar 2026 11:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBF996012A;
	Wed, 25 Mar 2026 11:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F861C4CEF7;
	Wed, 25 Mar 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439237;
	bh=y936NOWTs6b5YhJhBErZqpVXv+esdC30kXVHTCEe41w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrBx0I7Nyosru9NgIWUbAmyJS/R5CjCob0QUBLA9PBtVpIfkKPEhUvTJvbb+eGUUO
	 VnPgoK9Dj4v8TFzcsG54XhOjpjbYpnAfamuzcpOhCuBNgpPwS1WQ11fARXfPRloItj
	 hRknKp16nduw0k/lRMjR3dw373uF6CSnNzbT9zng3C760estZyQ6U77W66Ybhmeipp
	 ISbpJTWU6FXFkQ11ejuP3LpeBon3fpmJnfq3Wua2L8BIUvu9zaPzVXbKXuYrcYhwkl
	 JFd0dD/WRCVmL/pkpdrowekpcu7ohrw2sccFaamxmP9C6nYhAPumDgdja8NDdCbVlU
	 J8UtymH1HHQKQ==
Date: Wed, 25 Mar 2026 12:47:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bayi Cheng <bayi.cheng@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] spi: spi-mtk-nor: add new clock support
Message-ID: <20260325-amiable-jerboa-of-democracy-5c10dd@quoll>
References: <20260325031900.2099969-1-ot_meiker.gao@mediatek.com>
 <20260325031900.2099969-3-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325031900.2099969-3-ot_meiker.gao@mediatek.com>
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

On Wed, Mar 25, 2026 at 11:18:55AM +0800, Meiker Gao wrote:
> one more clock gate need to be added.

Your patch removes clock, not adds. Write useful commit msgs, because
this is completely useless one.

...

> @@ -828,13 +839,17 @@ static int mtk_nor_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctlr_clk))
>  		return PTR_ERR(ctlr_clk);
>  
> -	axi_clk = devm_clk_get_optional(&pdev->dev, "axi");

NAK, ABI break. Read guides about writing bindings.

Best regards,
Krzysztof


