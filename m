Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E5FC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5y2+wCq0wEsTuG1GWG6BqNCaShtcw/i1pRTa1elg6k=; b=nv2adhstv3VJpPdQ6X3P4pxSPC
	6mjLFS6yuS8asWZhkTuzkzHgc9k7w+t9Pa/b/+6dR57aAKV9LZ//0OsFUk42uXCBuRowzGDkMcjto
	wtxtLFIwppOy8RFKiGBXBZs3GLhbMpDYS7kBEuc2WebUizZ3bMyw4pD4wFY1iGgzvSCcyWFz36+5R
	GPT4KM255+MeM5d3UkdLX4nKGN7M9abI4Z1Cm+Y9WD67Rf43F9VNwBTIPnvT5zVfSyNto+7i5rTuC
	WxdONxS6Yt9qNkcWSNUMq7F5hu2NO4vpryKJz9N0XgwKkF0elt+y+evm7jJzFkxv20it7Unp5807J
	qFgeEAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q7V-0000000CRAN-2sJt;
	Tue, 01 Sep 2026 15:09:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q7U-0000000CRAE-1wcm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:09:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3D344092B;
	Tue,  1 Sep 2026 15:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBC51F000E9;
	Tue,  1 Sep 2026 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275391;
	bh=S5y2+wCq0wEsTuG1GWG6BqNCaShtcw/i1pRTa1elg6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UBFnG++94zHjCfFoSrnIXkTRrci3p503x8x7rlcaIEiNh9Pa5e07zU80aTbPpa9Bp
	 SrKEZOcC/Sh99xf1JGgR1tyRjNd25uoS+hB3TdHfpPfd+AOBSpvsepXq22RJAm7QVO
	 NadvhoCWQ5Ent+NnwhuwZIhTLdcxY7QZmTFNCQz9xyb6mLddF1UzhfvD94tFMgVL6+
	 Lvd+ZHPhoqVkE0KkCryHFhCdeggwt1wUXruEw5kDSRD55HA4m+ZRS3ITMpr1UmHCnx
	 Iq/6aDPupP5XwpojpafsEn1scRlNbMWXZq3gnU6f5lDaxMXCV+Ot4jN9fldUxBwomp
	 Zy4YLOOlSfNQQ==
Date: Tue, 1 Sep 2026 08:09:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, richardcochran@gmail.com,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 net-next 0/8] net: dsa: netc: add PTP support for
 NETC switch
Message-ID: <20260901080950.63e28bab@kernel.org>
In-Reply-To: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 31 Aug 2026 16:23:27 +0800 wei.fang@oss.nxp.com wrote:
> Subject: [PATCH v3 net-next 0/8] net: dsa: netc: add PTP support for NETC switch

Please be advised that the limit of 15 patches applies across 
the series. You posted 2 large series to net-next at once. 

See "Limit patches outstanding on mailing list" in the docs.
If this happens again we'll be forced to start discarding your patches.

