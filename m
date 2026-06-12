Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4124CCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXHehhzB4/pCnHpMmxg30pmzTBOAo5i3f5cizkPGk2k=; b=qiuZz3h9qzF44NeVt2lVT495R6
	RlNE35n5rxFPqM5WgE0eHSzsMkNdzwGAm6NPtC4IhXmbjZUUz7GLq6Pu0Ep9T3KO2WeNIYalsqkQd
	xG/+GxSQ450t4CHkSqBMm/s7yTgC+ru4ObosmoVy33jnZ5Q+BHLZJvEajvMdlploelCUr7b/XWSHc
	enAreKu9B6ppn6yFkRr19cDqlUtYRzKXoG+d5K+DpmzlziQZsxqPxl39PpPEbRlH8LQ9KpA+5pr/T
	lmGPDDWQTkPIxxWVQoSEpdek3woHCVc88P3PSfuojHbB+EU5+cn9PSd60YSjaVJ8CJdcrnUzhi606
	Ms2DyH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY5NQ-0000000BKSt-3WTp;
	Fri, 12 Jun 2026 17:09:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY5NQ-0000000BKSk-0okS;
	Fri, 12 Jun 2026 17:09:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8FE402FE;
	Fri, 12 Jun 2026 17:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA65B1F000E9;
	Fri, 12 Jun 2026 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781284143;
	bh=mXHehhzB4/pCnHpMmxg30pmzTBOAo5i3f5cizkPGk2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SxqB5cRLYHsqodxhM9r7MVPqGGUkg8EdMYMdy0jHQD4jV+AghgDrxcTTdSVwQ224r
	 tMS4MA/AWJGsoCyBKQzKMmbFCphPn5fjtKCtDltoxEvHkiYhUQRmLJD5ytS1RdPGM3
	 pir0p7p4yJNBq4navfhhaVRBzN/albmg9vUDMwSo+E++g9pnetCjyhZDTcdUlXrlSl
	 tUjV0Z8p126g/HpkqZGVd0ZOvnQqtwykxsuWt31xqJXqLmYAFuInOVKsIbF/GCOuu8
	 ry1cSeQlscHRaaI08xZcK3vTJymSJpNmAhc4pB+GtepcZyjstIqDLeIPeQldU+tIxb
	 Gls0cCBKkryzQ==
Date: Fri, 12 Jun 2026 18:08:59 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH net-next] net: airoha: better handle MIBs for GDM ports
 with multiple devs attached
Message-ID: <20260612170859.GJ671640@horms.kernel.org>
References: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
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

On Thu, Jun 11, 2026 at 12:43:00PM +0200, Lorenzo Bianconi wrote:
> In the context of a GDM port that can have multiple net_devices attached
> (GDM3 and GDM4), the HW counters (MIBs) are global for the GDM port.
> This cause duplicated stats reported to the kernel for the related
> net_device.
> The SoC supports a split MIB feature where each counter is tracked based
> on the relevant HW channel (NBQ) to account for this scenario and
> provide a way to select the related counter on accessing the MIB
> registers.
> Enable this feature for GDM3 and GDM4 and configure the relevant HW
> channel before updating the HW stats to report correct HW counter to the
> kernel for the related interface.
> Move the stats struct from port to dev since HW counter are now specific
> to the network device instead of the GDM port. Refactor
> airoha_update_hw_stats() to take airoha_eth and airoha_gdm_port
> parameters since the function operates on the entire port.
> 
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


