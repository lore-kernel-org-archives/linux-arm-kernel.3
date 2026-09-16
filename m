Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A67C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08PC1Zy0osrxD5uEEq52omja9Cyu6/fzLf/OJPTukEs=; b=yx1NGn5wzHTrcY2jHcz95GS6Sk
	LazhNYuvALqMDWydY6E8gPYQOx3RGbOruy74pGqZZarruKEEGRVps7z18G8++139gHzlgM1itD6dO
	5OwxCHR36115g/99CZpl0cBeLpowYp6R0/QDUyOSPtKtCdsc4tnbprmbOj+mwpKNzIXIFbmpWKnXd
	dCvsiYEc6XqLobIBuIUF+syxrBvJRMo2v+vF0rpfFIDME1YMdFkBrFP6ImBUtQIrR7FMddQ7fi+OW
	ENfHyVAMUx4cAA2/OU9FdHAXMz9/+luvgGoNPaXpiWJ1M4k4upoo17vvuvkPO4vvjIajhJYbiuany
	ojEdFv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mwf-00000008yvU-3oF6;
	Wed, 16 Sep 2026 10:32:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mwe-00000008yvK-1PYD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:32:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5E31401F8;
	Wed, 16 Sep 2026 10:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268951F00898;
	Wed, 16 Sep 2026 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789554771;
	bh=08PC1Zy0osrxD5uEEq52omja9Cyu6/fzLf/OJPTukEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tbywcfMnjR9YbGgjGoowoWtoypFwkV04/m0T075x2cdlw9JNqAq64HWPaf0Ohm/MZ
	 luOknS14HacrIaIWw5qRZgHVabt0VQBt+nhPjnhMa3JT15e5lbIKna3i7eHjypHE9p
	 3oCBhYdbi4A7ucwJ2UOq7epdMiLyPmYfllsvdQyk=
Date: Wed, 16 Sep 2026 10:44:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alistair@popple.id.au, andrew@codeconstruct.com.au,
	eajames@linux.ibm.com, joel@jms.id.au,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-fsi@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	ninad@linux.ibm.com, stable@vger.kernel.org
Subject: Re: [PATCH] fsi: master-aspeed: Fix of_node reference leak in
 fsi_master_aspeed_probe()
Message-ID: <2026091644-equipment-landlady-c1c0@gregkh>
References: <20260916093914.2005582-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916093914.2005582-1-vulab@iscas.ac.cn>
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

On Wed, Sep 16, 2026 at 09:39:14AM +0000, Wentao Liang wrote:
> In fsi_master_aspeed_probe(), a reference to the device tree node is
> taken with of_node_get() and stored in master.dev.of_node.  If
> fsi_master_register() fails, the error path frees the master without
> putting that reference, leaking it.
> 
> Put the device node reference before returning on the error path.
> of_node_put() tolerates a NULL node, so the earlier err_release path
> via opb_readl() is unaffected.
> 
> Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/fsi/fsi-master-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index aa1380cdff33..7c7f30c2b8e6 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -640,6 +640,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_release:
> +	of_node_put(aspeed->master.dev.of_node);
>  	clk_disable_unprepare(aspeed->clk);
>  err_free_aspeed:
>  	kfree(aspeed);
> -- 
> 2.34.1
> 
> 

did you forget an Assisted-by: tag?

