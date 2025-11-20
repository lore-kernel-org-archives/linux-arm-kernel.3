Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947EECF8553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 08:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+mMCG61WSoAjSvym+aJjwhpfOlX712D0ign1mUzgLQ=; b=pBmmURQUiSPV7B9hhxeIqHg9xF
	/ZenjcvQ4fRGt/qYMLLE4wYjLP/uB6ivfCJzJuk7t4q2dijA5ZngW+SHIuesc4JHDyOnW3jeD4EVt
	dabaEqr/iME1MHj+zqOzDP2Y021yk/qLuGvLA2hlkmlkKuyT+BNEofOq5KsJKTPVNfWfZ1qkWLUrt
	jORUL4S2jwb+KOZBKXjtEDBgjNOhL5fJcGPD0wgGb8lTFDxgNSBo0tsxbWNIkZivMjkEKVelzeAND
	6+0Bk/mvDFAxpDqO94FDHtQSQVVCQxT0QhTciWkrkhDXxO7T8PkdFPToxFH14g6PyAPIfk3xGAynP
	oyfUr+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLztc-00000006LLk-0OWA;
	Thu, 20 Nov 2025 08:20:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLztb-00000006LLd-0ngT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 08:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F5206014E;
	Thu, 20 Nov 2025 08:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7375BC19421;
	Thu, 20 Nov 2025 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626802;
	bh=RxDPhffDV0KuCg3hXM9CfYPba4pq906fwuxIATPJd8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umYwHn6CRlilYb8aMdKWhMEJQa306xmvRmsWa79Q9xX7ZwhQMTNJkUwJ6hKM15zUA
	 f8AfdljMxB/G20HFoeb4FcyjYbANQCj7fp5tdgsakizQDvwBUy3H1G6OizZHqVRoed
	 l/xRPXwgMxqjLM4te8Uiua5HJajKGT2b50J0vEYVTrR9yxDIOsBWb5nRl0qfRYg/1x
	 ii2jxHRk7XZd+Qb9vekFe94pfIanHDecO7kUv5jIOMUNjwtVGIbGa5V0QWYn5CPheD
	 vJzUGa+vO39NojfxiSjrzX9jMGCL2KHHEe07H4eGWqZdLsEhISlB6fy816X3m5ueFc
	 OUg8bTXpQNqZw==
Date: Thu, 20 Nov 2025 09:19:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com, 
	p.zabel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 3/3] usb: dwc3: xilinx: Add support to program MMI USB TX
 deemphasis
Message-ID: <20251120-polite-ginger-tarantula-08c98c@kuoka>
References: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
 <20251119193036.2666877-4-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119193036.2666877-4-radhey.shyam.pandey@amd.com>
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

On Thu, Nov 20, 2025 at 01:00:36AM +0530, Radhey Shyam Pandey wrote:
>  struct dwc3_xlnx {
>  	int				num_clocks;
> @@ -306,7 +307,7 @@ MODULE_DEVICE_TABLE(of, dwc3_xlnx_of_match);
>  static int dwc3_set_swnode(struct device *dev)
>  {
>  	struct device_node *np = dev->of_node, *dwc3_np;
> -	struct property_entry props[2];
> +	struct property_entry props[3];
>  	int prop_idx = 0, ret = 0;
>  
>  	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
> @@ -320,6 +321,10 @@ static int dwc3_set_swnode(struct device *dev)
>  	if (of_dma_is_coherent(dwc3_np))
>  		props[prop_idx++] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo",
>  						       0xffff);
> +	if (of_device_is_compatible(np, "xlnx,versal2-mmi-dwc3"))

Don't sprinkle compatibles all over the code - it does not scale. You
have driver match data for that.

Best regards,
Krzysztof


