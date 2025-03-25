Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1F1C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrI4yF47MjvOHP5dCBcyX7jMNEKFfxwEA1WP07typo0=; b=ibyZwChIoQJPoyRnwzCq6QahAI
	bfvmmdaN45C5YhudUcY6oWq04+KPLxN0Vsc3M5uSUAG3XjjVG/yr9Dq3sAZgrbzjw1HVZBvk+ACFO
	ULmpycxbeOEzZcNS02TLdQ/+2yA2vjgkmSUDGMpJRR3fpmJ6mtGl9J/pltGo9xywceAuk3zhWdJ4V
	3fM0hiYQinnieODs7kxvRsB1Ga3WvGxkwy6tkJ590wfVeCEnYK5m+aawRjje2eEPGIHDftXmiDCrr
	ZlxwLoP8lRX1BOC5QPxHvg/CRz0/AR6WM79H0ewc7y+VbD1K/4LC43NXS7eWJPWA+8Qw0so8L63dT
	b3JftQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7Ha-00000006VJ6-0HcV;
	Tue, 25 Mar 2025 16:37:42 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx77h-00000006U7Y-3zUH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742920050; x=1774456050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DXYLHXiwzIcA/Bj/2td4YqOe2oymYE7jS6LyMPCk+S8=;
  b=IBEG6cXXkrIfdq/0LE8HYuOdRKZ/iibsQzRmFa6mSfqr6Fp0XvZBG4xC
   uz28Pv46/83BXDn952k6fZxZBRnpc5wcc1evjs4/BVOu2BADuifsjxAos
   aoxzfaMNtcK4HsvOQ6NZyy5SmwcM5FPq0kOzsSShA0VZdVZ50TXj6dqOY
   hpdAdm2y7fYul58Ru4JJPq8Pun9qVY9L8xtGmslQwbP5nq3WOQRG62ddI
   zxT597p7nF5ZOujcxmO4ye2r3BXqNGX+q3UQmjw3v7x5e9kY7PWbu0REz
   q7HIOKW9uTJ2C7UovFN0Y6DmuL8uXA70El0g7zT5+MBQ6i2RRNsEHbkau
   w==;
X-CSE-ConnectionGUID: 8OfHyg/JT3u+65ZNIHPSfg==
X-CSE-MsgGUID: buQpLmVaR4uCKvXucpPHdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61570269"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="61570269"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:27:29 -0700
X-CSE-ConnectionGUID: yll9APRVQx63HH74bLC0Wg==
X-CSE-MsgGUID: nY7nGxCqQyGk0UZVVRoCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="125221710"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:27:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tx77Z-00000005nlV-1ZAR;
	Tue, 25 Mar 2025 18:27:21 +0200
Date: Tue, 25 Mar 2025 18:27:21 +0200
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
	linux-arm-kernel@lists.infradead.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v8 3/6] bits: introduce fixed-type BIT_U*()
Message-ID: <Z-LZaSEO0jGw_Q-y@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-3-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-3-24afed16ca00@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_092730_032413_BB5642E9 
X-CRM114-Status: UNSURE (   7.97  )
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

On Wed, Mar 26, 2025 at 12:59:58AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Implement fixed-type BIT_U*() to help drivers add stricter checks,
> like it was done for GENMASK_U*().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



