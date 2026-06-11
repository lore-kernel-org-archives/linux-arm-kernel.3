Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C98CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z2obxuOlT0K7zT6h2EEIhqYsBu6dly8lQ8sboW2Vpg=; b=F0VbF6vUhlSIxAnnVECiLVu03A
	3ZmBaSjUDVQS0xCfX143aku1w2qt8dfJsEYp/LYahADtvPE+WS2B+7PeLf9DZFSgt1jmnP6LZ65T/
	iN5lCgjHMm8syDkkAki9fwX0DJvIfhuq53cSV3JrdqA5bPoE2jphwyoQhbL5Tk0wLJpzfv1TjSprf
	shThng7rscCXbZow6542eThoRJNYN4Hi4MY7kGcdIzX5vaefMUsD/Gv8h6fWZdxeHiB5YEMpIULQH
	VCOMyvmCsFLtcF/vJHHfNYD4u+IW/wUaecq85Tih6msMzrgvKv7ZJ/ShVUBSJ8IM+VQSsLbwUHU2o
	UGGDDbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhzr-00000009jm8-25pR;
	Thu, 11 Jun 2026 16:11:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhzq-00000009jlr-0IHa;
	Thu, 11 Jun 2026 16:11:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAF2B600AA;
	Thu, 11 Jun 2026 16:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959A81F00893;
	Thu, 11 Jun 2026 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781194267;
	bh=5Z2obxuOlT0K7zT6h2EEIhqYsBu6dly8lQ8sboW2Vpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ogkbxZUc39myVWyZO/P2nkC1S3nQ2/OgknkpsBselFFFzetmAo6fgC8uyExejtM8C
	 yPgr7v1BOMEJdWly48BpVxjszwWo4fxd6yIm/EqpR77LsI860MieNfFRosaQPmNxX2
	 h0tlcUOhDdYUg3eGorT/xVpGr0pk4MbY9RF+ZyyuRBor3CFGq7qxWQdFZCt9Nph0nb
	 wXPCfzJgATb7DrOcZyQI6vXJ+pC+QObxDEjVYao8PD4+hIij6THJIPOqdQtJT7iPUT
	 72oBGdd6O0TsKlJAI9Av0a8oC1b4el2Tu5nafhWn3HCMHdCbzThg0s1EegtUVyzdFT
	 BaI8ZDckVca9Q==
Date: Thu, 11 Jun 2026 17:11:02 +0100
From: Simon Horman <horms@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: mediatek: fix refcount leak in mtk_probe()
Message-ID: <20260611161102.GV3920875@horms.kernel.org>
References: <20260609081300.208168-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609081300.208168-1-vulab@iscas.ac.cn>
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

On Tue, Jun 09, 2026 at 08:13:00AM +0000, Wentao Liang wrote:
> If mtk_sgmii_init() fails after successfully creating some PCS
> instances, it returns an error without cleaning up the partially
> created ones.  mtk_pcs_lynxi_create() increments the fwnode
> refcount for each PCS it creates, but this refcount is never
> released because mtk_probe() uses a plain "return err" instead of
> a goto to the err_destroy_sgmii label.  This leaks both the PCS
> devices and their fwnode references.
> 
> Fix the leak by jumping to the existing err_destroy_sgmii path
> which calls mtk_sgmii_destroy() to safely release all allocated
> resources.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9ffee4a8276c ("net: ethernet: mediatek: Extend SGMII related functions")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

I think that a better approach would be, on error, for mtk_sgmii_init()
to release any resources it has allocated before returning.

Also, I'm not convinced this is stable material
as I'm not sure it's bothering anyone.

...

