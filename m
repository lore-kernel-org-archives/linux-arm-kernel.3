Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB933EA8128
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJnopLx1NUcVGbgJn5MGIPYrOs+dZVkks5wJtix007U=; b=yQjl98f7B/6vjI5z8hPgcFaigH
	9+lUzNjOeEk+pAGXgi3A5vuIUUEmBDm2Qec8aw9Lp9zDjW946pPobfp81LHw8TEGShM8Q7A2i6hC5
	yvSk4B9yKqGsqpEBgRRYkmaUVueLS5rPe811i9EL1IlOS/GGOVuD/HfnAZvzLz03I7ViqjuJnCDST
	nzZNbx2SaDz/ekdTLuifgGp8a+59s2+Y+GdKOM3+jiThmJWO61F8ne/SqoGJxkmwDnUKisFZgveNL
	fCF3MuNA3azR1/DM3FdGLHwl26Hz//Tahgmrh5zRHCtAL2c0kvkGFIS+XJdA4tBFSWg1mcSImJzqk
	4PMbUUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppAJ-0000000H53k-0w0c;
	Tue, 10 Feb 2026 14:56:35 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppAG-0000000H53N-2DjV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770735392; x=1802271392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3z0RieF2cpVQuvDYOlXn/wI309BIjZMJC8vZ6UgamE=;
  b=caPMy6GwCMCFKb7eYdPbs+n4ROoM/RD71SVaefHNneEC4v7KVSr2p9KD
   jrNop2vJrLfEvOWGOeFu0w3w5+vyOfyXBRnVmMOQ59aJaciTye7NifgRw
   ZcSRcn8NS+i0RErfiD69AyJLphAF7qIttR1cjVnRzXnS0n6grzi8H8dHb
   72hPUkVoKga1ONwHerP+sw+UnuGyJg7qnb0bjqOHaHh3JSupw+n7AxpL4
   VUX5tPxSjnQDRSiLlADv2ZdO+xvnrmLWjeBu65zTHAV8ktQakq9g7XXDn
   DcyqExUTcDBy1FcwPxrOIc6WOUQ2cjq3KBuzuft+JIdL+wx0Zk8XUtSXx
   A==;
X-CSE-ConnectionGUID: uMjstpa0TTmKEXGZCm8BsQ==
X-CSE-MsgGUID: ZVIlMWyFRxSkEez6niCfbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71850483"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71850483"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:56:32 -0800
X-CSE-ConnectionGUID: JOwfHkBGRJWeYxsxBLTXjA==
X-CSE-MsgGUID: gX7C/LNTTpCkGpsrFp64ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216474198"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:56:30 -0800
Date: Tue, 10 Feb 2026 16:56:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Message-ID: <aYtHG2m61D8fc4vd@smile.fi.intel.com>
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_065632_630362_61601796 
X-CRM114-Status: UNSURE (   9.63  )
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

On Tue, Feb 10, 2026 at 12:00:54PM +0100, Wolfram Sang wrote:
> As stated in patch 1, the U8500 driver is clearly unused for more than a
> decade. Removing it allows us to remove generic platform_data support.
> Both removals make the upcoming refactoring (headers and lock
> allocation) in the hwspinlock subsystem easier.

What I like the most is the patches with zero + statistics :-)
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



