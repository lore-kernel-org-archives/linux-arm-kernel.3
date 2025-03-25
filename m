Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F89C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLUx6uZbLuQvp80OcZt+x2raF8dm3zOwH28xriUwoFg=; b=GCL5uWRcfF8psUh/qxeOJuTKBH
	p0vmVWDfAvU3bphGIWVpWg4mAiujg8Pa8zSCI3QEwot07ZvRfJ8/UH1X61oaAIMD3M6pmBM2i2gTn
	PLdfsCevBIBL/hzGP7TJp+fanAswsoDTH89l1lxFMdEWiLT0k89Hy4J4A7VN6GciJTn/F5lNDBapS
	tF4heddE1q9mfs4KdrSb6wAqzXDZrPaKIjTDVVlqSRGSEhKxdX3IJ9pGHBs/ge/6AlbZvcZMODlZB
	yrGhbmqe4SvrUrA0MP80X3ttH93Zgiv3SItqrxCjQ1Dkkgd9MbzFvic6232BTJ2BkKFkBpIfo+yHk
	KvGwHAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8Eb-00000006djZ-0mUe;
	Tue, 25 Mar 2025 17:38:41 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx76U-00000006Tyt-1OAu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742919974; x=1774455974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zLF1T+Svm2nyklPUfhrXKb/s3OtiLT/we109JVFOEz8=;
  b=eMs9epD+oGtINmn9H8GRd9VKx+jOgsy4hRfX5WnPWc7fsj3FFPDOs10M
   pa/RSsdHzxRp7I3FAZ15uFS3K/peplCklzwILOiogMBwOqfT9oWIRdRHP
   Kex9XlBolkSc9KXCazJjK99Xj5uxkT7okRuwJF3VwuDv7XcnGd8/0jioD
   PsosVTSfCWaCR1sCE2hT16EJ8EMzGjYLv2mBNvU2ma+GZCKP+mW/8A6HE
   1BIoJdpGMR8Tm7efV25eFnPptSd39oj5oPhbrX9/P++jVrXnwqbBXz0Am
   hyo1rV5aOx/qgG8SeNnt24Uw2UyCGxKeDUG9iDTyWbsagHBmyLg/vpa46
   Q==;
X-CSE-ConnectionGUID: 1JM85LZxR2u1aFcQDQZRvw==
X-CSE-MsgGUID: 43r0NZaWSnSjaU8xfSARcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43332915"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="43332915"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:26:13 -0700
X-CSE-ConnectionGUID: 5lFr19JRTeWxFDbZy+SCqA==
X-CSE-MsgGUID: /wrgWLZpSzWFt4lXGFYYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="125362586"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:26:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tx76L-00000005nkX-0spP;
	Tue, 25 Mar 2025 18:26:05 +0200
Date: Tue, 25 Mar 2025 18:26:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: mailhol.vincent@wanadoo.fr
Cc: Yury Norov <yury.norov@gmail.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 5/6] test_bits: add tests for GENMASK_U*()
Message-ID: <Z-LZHD7sxiOImzu3@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-5-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-5-24afed16ca00@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_092614_385422_E5A34EBA 
X-CRM114-Status: GOOD (  11.63  )
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

On Wed, Mar 26, 2025 at 01:00:00AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Add some additional tests in lib/tests/test_bits.c to cover the
> expected/non-expected values of the fixed-type GENMASK_U*() macros.
> 
> Also check that the result value matches the expected type. Since
> those are known at build time, use static_assert() instead of normal
> kunit tests.

New tests always have a green light to go from my point of view,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



