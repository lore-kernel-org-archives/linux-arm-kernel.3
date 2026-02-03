Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146DBE87842
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07tUvBOKXbS6yFB9hr7ffTw+htZcPb3Y4NmpI57Agg4=; b=MWT9wwNfysJRy2aAqN5eQAdfZr
	N0UGfWe1b+qiMDpfSxea3PKU36uottgrWuOTbGXuBtfDpLOPQtKs57YtCHn56KLbHGWVEYBTXsRuL
	3ASLkf5yNq07IHhgl4fJMt5w3yFepLsEWBllrwhFSG2HtpgmksWWvybGDoZVHBblqRYivLZ0X+Rcq
	0gOeKNCh0GD46tXQm5PGFJXoPc2u7aHb5KKigiLhzWLtJL2SCBKQWgGo0iimQsCUPNEs9hpGdUFIo
	yjUhFWKnuELXHFZtLH0RhCF/HJlZ877vSd46M/w1yVk86cPg93EFn8yjVA67ef/ichBHEAua+VvNe
	cxe7XDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIY9-00000006qsS-1BaH;
	Tue, 03 Feb 2026 15:42:45 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIY6-00000006qrS-13C2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770133362; x=1801669362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y8zb4k44kGjEq4eI7aYH/3XMRYBq7D6e7FdgxUk7G90=;
  b=FLLwjgc3QesMlR2UKGthVn5+ltXC30UmU/tMIYSKRir3gOI/S2ndUXag
   CrA2Q81prtMDA0jg9Ki2Aqp22y49awiNExcOeoPvWGemnEUcTylr5peVU
   Bg45bq/eSLxcDPakRb35p0Vzk+nl9CRkkMG0EBS6EdDUAz5wPI8Ws3T/6
   GpLGAyLp1rdCPp12sSNF+LZ8IHZGUkej8xsA2ZFpc6pw7v6fAvjSIBb5H
   cB6GvsB7rZYmY/3ElgNMg/2/n2alAv+8/lwP6L6OkZqaBeV6rQJYf+gqe
   U5hLNFBPuKLw1oJ5xMuVGClEAoZ0urXTCWFRZL6FPllO6kBek4IL/KF3o
   g==;
X-CSE-ConnectionGUID: lmDKFrX+Rui6s8U2F7LTEA==
X-CSE-MsgGUID: dg5qYVuASOOl4rsmHOnCWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71387301"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71387301"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:42:39 -0800
X-CSE-ConnectionGUID: mHT7rsieSUCLxrs6Z6Ezrg==
X-CSE-MsgGUID: wduoLYv6SV6BaZHjoZz6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214413257"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:42:37 -0800
Date: Tue, 3 Feb 2026 17:42:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 4/7] i2c: xiic: cosmetic cleanup
Message-ID: <aYIXagCXYb4DrDLp@smile.fi.intel.com>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-4-ce4695f5267d@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-i2c-xiic-v9-4-ce4695f5267d@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_074242_302959_B2B0CD20 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 02, 2026 at 08:37:21PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Re-use dev pointer instead of referencing &pdev->dev everywhere.

...

> -	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
> +	dev_dbg(dev, "mmio %08lx irq %d scl clock frequency %d\n",
>  		(unsigned long)res->start, irq, i2c->i2c_clk);

No need to do this here as we change the format string afterwards anyway.

But I leave it up to Andi, I won't prevent this to go in, if he agrees.

-- 
With Best Regards,
Andy Shevchenko



