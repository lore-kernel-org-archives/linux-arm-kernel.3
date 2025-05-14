Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA64C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w1IXmBwcoCNdfVytxCpPnkBeS3slD+FNJFUtWVMkEE=; b=2c6hsItDpsoBQ4ASzufE9tsOP1
	/4EMFKBAJAeyZOFpFgx+Lj9VVwZ5hqmWXSQBoenkB3ImCck2yhz1KKOMcjaR4ef5OiedIysR9c1l5
	Dq6f5Y4t2jTFsflWiVAufThgfsB5hphXLIXUYa2kTbL9v6TJdiGN7wEDEnVDSUFEb0M1EVKBF0vvP
	r9pgrMDhRCmhcI7dkRW48OZwxAMX1Xcy8lGy2zcm+z9/RgE/AQ3sH7OmqXibo4kQ8NsXZEASsP/ry
	GHhoVl0CS0xSWFtWRA672j9uAaYohCNurN2VEIbr3U1vXo2vsa08LBVccuCp5gIlsibyVz0/Ox7t3
	w/0uMWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6iP-0000000EN2r-0SAy;
	Wed, 14 May 2025 07:39:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6gO-0000000EMjE-0fkG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 610B943E6E;
	Wed, 14 May 2025 07:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A39C4CEF4;
	Wed, 14 May 2025 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747208259;
	bh=F0y7ofSa6UIPn9c0w+nXpRMsY1EP8Pck94HcAtDu9x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBqJlo1FN2MYi6K+ntxiI8tL0a4PCqvFQ0MAxaC8jOfEbHzXNGbLO9eqXIHMXwWqd
	 GI4UieoUdXBW1HI/h1zlAqvmWQ8x1xichmOcwL3CS+8Ec1ImwRSZH61/jCxV0+YboF
	 LODSFDaVioCXpIC8XNzmBKj7k4X06lnDbSGf4fi8=
Date: Wed, 14 May 2025 09:35:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Judith Mendez <jm@ti.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Davis <afd@ti.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/7] Introduce PRU UART driver
Message-ID: <2025051449-scarily-evaluator-0e03@gregkh>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_003740_218074_A88121F0 
X-CRM114-Status: GOOD (  12.31  )
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

On Tue, May 13, 2025 at 04:59:27PM -0500, Judith Mendez wrote:
> The PRU_ICSSG subsystems in am64x SoC, the PRU subsystem in am62 SoC, and
> PRU_ICSS subsystem in am335x SoC include a UART sub-module. This patch
> series introduces the driver and the corresponding binding documentation
> for this UART sub-module.
> 
> The DTS patches for adding PRU UART nodes and enabling PRU UART is added
> in this v1 version, but marked as DONOTMERGE since the patches only add
> context to this series.

This prevents the series from being merged as our tools want to take the
whole series :(

So please, submit this in a format that we can handle.  As-is, this just
makes me want to ignore it totally and focus on patch series that can be
applied.  In other words, what would you do if you were in the position
of attempting to review this?

thanks,

greg k-h

