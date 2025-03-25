Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C833C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRo4+1VM9w+TirMJjIGbimduXPxgktsFOOfRw5kxQ+I=; b=IFijk4RPu4L/sEv0No7mMObvzJ
	P+xDC6zxs30tE5Si28OmRdKRJznrp3XUBBlM8Nn4tx0QCcc1XkJP8F+G9umBxg2VdHB7PtgVYArTm
	35xFc/y7+Wp4IWDJJ81R2/7OkpEzkBo9V+w86S2vrdQq9NJlCK/Zvux5XLL34J2lcysQSuCoc4SdP
	CtLBYYWITOMPbfMj8JIgu4fPRAq0MEVhGgRvuSKKPqt5iXixlfah42/cgsjbPflaT74bcFgVdrknq
	NmWEbrWPYjk9RtWsYF5HEy8GEwdYeHanazLndOQoS3eWa3axmrzEONOuZDiFr4BF3oeDZ2D79rw4d
	Cm6Atj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8Ea-00000006djV-1qp8;
	Tue, 25 Mar 2025 17:38:40 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx71Q-00000006Svb-11Va
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742919661; x=1774455661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GjYkRvObWlrImE4cQ7gUuIKV1Cu2lgGMbmIy+oWECk0=;
  b=N2fJNYuT4j3MmuCgBGtuF4u1bUATohoptlq7fWVkgAQsy4GlSplSTdqm
   R+QXZXWYafoSs52KxBTWRra8gcG1gHupjSY35GDpbjq5zwf289+45o4Ju
   daAsDC3MDagSZnTKVJ0pPRzAnit70hxBkzz6/1U5txFwgZ6PSFQ2Bhy/q
   0lOi8OamMi2pUjgy5XxpXCcYi4yAAwBsTiSecTbhqxzMptBrhEZd1WyY4
   FtNaaAexg65zaYK0K4lSdecBkw3v7X59rM7jtPlav8Rh4IfehLfvcuCdD
   Kv8nIVdOeFjFBQLEEh2k3rEPwUnTpPCFREbdVzc6AvARyxVdEye9x3fhD
   Q==;
X-CSE-ConnectionGUID: jYHZWEIZTnWvjSYtB2Rg6g==
X-CSE-MsgGUID: zOaRCQPCR/ORRbHqbqsLoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43904454"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="43904454"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:21:00 -0700
X-CSE-ConnectionGUID: YfDEOEvTTumX1d8yEn9lKg==
X-CSE-MsgGUID: Iu6cG0pzTUGMZM0z5IvoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="128579110"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:20:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tx71H-00000005ngL-40Jm;
	Tue, 25 Mar 2025 18:20:51 +0200
Date: Tue, 25 Mar 2025 18:20:51 +0200
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
Subject: Re: [PATCH v8 1/6] bits: add comments and newlines to #if, #else and
 #endif directives
Message-ID: <Z-LX4y1pw54C_H78@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-1-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-1-24afed16ca00@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_092100_327105_B70826F7 
X-CRM114-Status: GOOD (  11.60  )
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

On Wed, Mar 26, 2025 at 12:59:56AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> This is a preparation for the upcoming GENMASK_U*() and BIT_U*()
> changes. After introducing those new macros, there will be a lot of
> scrolling between the #if, #else and #endif.
> 
> Add a comment to the #else and #endif preprocessor macros to help keep
> track of which context we are in. Also, add new lines to better
> visually separate the non-asm and asm sections.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks!

-- 
With Best Regards,
Andy Shevchenko



