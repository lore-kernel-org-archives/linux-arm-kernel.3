Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F20C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3cdAsJK+nbkTIVcp0h2SnQb7eN0LiHi4Y0YJjuzdqw=; b=ZyFVxxbD3YmDmIPh7mct0psXMg
	YScCyfRrSndKMWXsoKx3PFYlTvjVBaIovHvy6ZxSfTPscMT74z4vd2CeWjzRmDZCZOdgd1RWWehtj
	OV2Cni/2eCCNJK+3JSa0hATbib3Yshk4ipaWvjAIacRU6Tox25XuohvfKjjmVX6YhTJMD53liwVu9
	Cczf66egLSukYthfiLeS24AR/Pq7yR6VgdQBxBEZeY8K59m70O2viJol60KpmyqgVd4NM1QCAU8wD
	gyCCV0uvuciMmlE7gKKcCX9ifvdPLO61xpPH09zxpKY8ftdCf8IxkjHoBOFgNIfAhVyv2nfn0/xBd
	paiAKv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cXX-0000000FChR-0BS4;
	Fri, 18 Sep 2026 17:38:23 +0000
Received: from mgamail.intel.com ([192.198.163.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cXT-0000000FCgp-496F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789753100; x=1821289100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J3bYaEWyyYv31Nix/vTbMEEAr9eEVvvLHflmIWHKVJ8=;
  b=DJSZJVeuVlKhFlTETETXy8EOtv/zLmHkUparYq3RcanqM/RMETA8Np8a
   RC6XRbzzI5Gh5jIUvNcSQUX3LIQhuuGbvwQE1jLXBvK42DSvBEkNrtC6W
   aADjVAPhoNY/cddGcfrfgEBvCXsGQMyWj895EahQ3M2DJPCZR+ikTiwSX
   PNQFhznCWa7xq+kpRABS9xLII09SzEVQhYDcUEHfJtVh9zAb/xEzC6eHs
   LiXViQ8xY1JljV2EkzcjLh+TfO6hAKZz2b4HFJEvrNqvYIBTFUjLqAgWA
   +B1ysZC70mEIYx9NAEWeW6fuNlTLEJ2ahV6A2/1cW8l3vEhba0FYdLdbV
   w==;
X-CSE-ConnectionGUID: GIh8U7hcTWO9Rdeid2gnog==
X-CSE-MsgGUID: zDnVaqzGR+iAL7WPfXiFqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="788110"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="788110"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:38:19 -0700
X-CSE-ConnectionGUID: FHUY+oYITFKMtiG9ag3XJw==
X-CSE-MsgGUID: dSSX9EITS2WMVXmCCZaTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270796387"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2026 10:38:16 -0700
Date: Sat, 19 Sep 2026 01:37:51 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Heiko Schocher <hs@nabladev.com>
Cc: linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5] fpga: xilinx-selectmap: control CSI_B and RDWR_B
 during configuration
Message-ID: <aq1270NA95AERKQp@yilunxu-OptiPlex-7050>
References: <20260909112200.13256-1-hs@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909112200.13256-1-hs@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_103820_035653_EBAAEB85 
X-CRM114-Status: GOOD (  14.14  )
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

On Wed, Sep 09, 2026 at 01:21:54PM +0200, Heiko Schocher wrote:
> The driver requests the optional CSI_B and RDWR_B GPIOs with
> GPIOD_OUT_HIGH and never touches them again. That flag carries a
> logical value, so both signals end up asserted from probe on, whatever
> polarity the device tree states, and they stay asserted for the
> lifetime of the device.
> 
> Neither signal belongs to the driver's lifetime. CSI_B (Chip Select)
> selects the device on the SelectMAP port, RDWR_B (Read/Write) selects
> the transfer direction, so both belong to the data transfer. A device
> that is never deselected never lets go of the port, and a port pinned
> to write mode cannot be read back.
> 
> Keep the two descriptors in the driver private data, request them
> deasserted, and assert them only around the configuration data
> transfer. RDWR_B is asserted first, UG470 describes in chapter
> "SelectMAP ABORT" that changing it while the device is selected aborts
> the configuration on the next CCLK.
> 
> Signed-off-by: Heiko Schocher <hs@nabladev.com>

Reviewed-by: Xu Yilun <yilun.xu@intel.com>

Applied to for-next.

