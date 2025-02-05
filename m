Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77495C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYbH4/bFbW9UoIMhwmMoZk4arwPiz3TqZyIYG3eL8oo=; b=xGn199Kogxqd/JBC+h9D3351Bb
	o/iJXOXCBK5HzUwSrR7obQqlLYY0ttbJ/HE2LcSTVHahQe86BWqv7GWPTnpD4RBdvUX1sibzNMavG
	BWSf28YmXi77eD6iD48F4DCNXHbwa0oLmNEXqqNo2sGOv1MvMrZroZXXhuvNyPQHYRZmMKC/Qwzw+
	jbB9RXHLjwl9FPnDIFaQIy9gIs76sWtbV7MClUsk+SMeuoZVUC0VtH3mY21iVOCXFw3YZl5GaRn7p
	BRGrxX6wDA/CYpeOMKbXi6wbgOzMnjyL3myR0jgSJqMcgz9wQ+1N5uRD7RURDskxXlJ9HOWhqmpIu
	K5w25BWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbzF-00000002jra-126m;
	Wed, 05 Feb 2025 09:46:25 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbxr-00000002jO1-2OZA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738748699; x=1770284699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RGt9by5OF1ibBjUOCxac7nIzMILjF1azzQF42QP/cE8=;
  b=WHUthJBzIi7+/mpBjzMx+TJDV49sJZjR7clGMbhw09jC7slpo8JxFACh
   wl+EqBMMBHhimc0nS/d8R/cFNJE9CFZMWLLgx3wG0hSezXpN5p5DH2lQU
   zrnvvWjgGHKX0K9aGIcsOywyq6qpABhkQbvRjfRHesbBy5JZNMVQlNgC0
   MIC5EgHEojV1XxoNwiB2FNPjbtimwn0p+ArRLmRjq0jNbv9UgWIp2uEsy
   JSsnWDTuZNXVyVRG7ck3FJlcZOAQ+fH5B3r9603zimFkztB6HIWpd91uz
   LmxWIab/EzJ19vicvYdSVI9eqZ1DEdD0D6wgSLfzHjDqBfomWs/m8AtFA
   A==;
X-CSE-ConnectionGUID: U/7v/zybQL+BQCc52m1OIA==
X-CSE-MsgGUID: I44vp7BIQ6iccZxsx4lWog==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43225700"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="43225700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:44:58 -0800
X-CSE-ConnectionGUID: 5BIQZlN9TqKjZXBctn9/Zg==
X-CSE-MsgGUID: LZvEaLh5R26ShhVJP8CvUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115845952"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:44:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfbxj-00000008RX6-22T6;
	Wed, 05 Feb 2025 11:44:51 +0200
Date: Wed, 5 Feb 2025 11:44:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Message-ID: <Z6MzExQFcIz9HlkN@smile.fi.intel.com>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_014459_651871_27E2A56F 
X-CRM114-Status: GOOD (  11.81  )
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

+Cc: Yury

On Wed, Feb 05, 2025 at 11:31:09AM +0200, Andy Shevchenko wrote:
> Relatively recently bitmap APIs gain a few new calls which may help
> to convert the GPIO Xilinx driver to use them and become shorter and
> nicer. This mini-series does exactly that.
> 
> Changelog v2:
> - fixed a regression in patch 2
> 
> Andy Shevchenko (2):
>   gpio: xilinx: Use better bitmap APIs where appropriate
>   gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()

Yury, just FYI, after this series, if applied, the bitmap_remap() and
bitmap_bitremap() may be moved to the NUMA only APIs. Or i.o.w. the
commit cde3d0f81e67 ("bitmap: Make bitmap_remap() and bitmap_bitremap()
available to users") may be reverted.

-- 
With Best Regards,
Andy Shevchenko



