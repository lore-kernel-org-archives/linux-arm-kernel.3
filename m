Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F276AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mvcb0QHcMv6UaG/PLGLNNDsQkV2IC4+2Y3SRh51umwg=; b=U5kv9yDh7IYA8gCqBlzI1SgSVu
	ulZkHBfLpJM3enO8uG2OniemD3L01q/iHYRXZc+aCL/9q6R3dvbXlIYxFLBm4PAp9FM1kDXOPcTZh
	rAtHGo5Fbj2BYnU+7QEBYuZXJPgOKc2G61BJTzUbxFweeYK6YP235jZBUwB64ce7DI9tTJhz9G4lA
	BvNsYQTdaGav6ub7j8PF+vRsv9TtpC8fIMPy8Xa9kban2PW7wwZ5p8EthKmWqOM9cXu2k9SIxkAXy
	bMW95GgKLQWXAbXoEBnbMhEDniEJmo3NmgeJZ7Gg66ExcRYMNqtWdXbSEJU5nAqzQdzjv8mtSh6wg
	Jk2bXMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7CU-00000006UiK-1qri;
	Tue, 25 Mar 2025 16:32:26 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx74m-00000006TTw-0L9K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742919868; x=1774455868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6zgiQy9PurDUfDFlX9BIxqNQbwiYYtsMkbmcnI3ETA=;
  b=BUv0ibgUtpRMZO6T77dLnnqTslL5W4M9PL20HjNYkwR8DWZuOK4EgzI1
   z7gkp5KjRizM2bGr17E5dyqqpjX0lef9dk0U2VQEmydUemjvORNHxdk5L
   AVNhGvEUVzUu/G2s//Qm8xAzUhssRQj5EwgQ9vyM7uED7OFgQQMnPJo5T
   lKjlxJVg5nzwHTmXB8w7OzvPtN7H6ytiQxRV99oVGQ2eoqE2i2Pt4H1KH
   UalBegz4/FWYWYHwVMeHSF2AKclTrgnVEm0YK10SVkTcnQ5VX4zS3FpIP
   Zy2BaCDW062QDlmdIscvLdYg3qq8oCj2P5RBkOAE/HpS3sIShucIvSI+i
   Q==;
X-CSE-ConnectionGUID: 81u/R7UhTyikq/eompxTjg==
X-CSE-MsgGUID: PGsck5gZSQ6DRVl/nj6C4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54825759"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="54825759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:24:26 -0700
X-CSE-ConnectionGUID: nzc9vcrxQ/+kqPwoeiOqSw==
X-CSE-MsgGUID: gCtk4bmRQT+ihdrBce7azg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124897126"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:24:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tx74d-00000005njC-1USU;
	Tue, 25 Mar 2025 18:24:19 +0200
Date: Tue, 25 Mar 2025 18:24:19 +0200
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
Subject: Re: [PATCH v8 2/6] bits: introduce fixed-type GENMASK_U*()
Message-ID: <Z-LYs9D8_Q76bDQk@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-2-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-2-24afed16ca00@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_092428_158776_9275228B 
X-CRM114-Status: GOOD (  19.47  )
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

On Wed, Mar 26, 2025 at 12:59:57AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> Add GENMASK_TYPE() which generalizes __GENMASK() to support different
> types, and implement fixed-types versions of GENMASK() based on it.
> The fixed-type version allows more strict checks to the min/max values
> accepted, which is useful for defining registers like implemented by
> i915 and xe drivers with their REG_GENMASK*() macros.
> 
> The strict checks rely on shift-count-overflow compiler check to fail

-Wshift-count-overflow

but it's not so important here. It's good that it's fixed in the comment.
In any case if Yury wants/can do the change, it might be done when applying.
(I.o.w. no need to resend)

> the build if a number outside of the range allowed is passed.
> Example:
> 
>   #define FOO_MASK GENMASK_U32(33, 4)
> 
> will generate a warning like:
> 
>   include/linux/bits.h:51:27: error: right shift count >= width of type [-Werror=shift-count-overflow]
>      51 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
>         |                           ^~
> 
> The result is casted to the corresponding fixed width type. For
> example, GENMASK_U8() returns an u8. Note that because of the C
> promotion rules, GENMASK_U8() and GENMASK_U16() will immediately be
> promoted to int if used in an expression. Regardless, the main goal is
> not to get the correct type, but rather to enforce more checks at
> compile time.
> 
> While GENMASK_TYPE() is crafted to cover all variants, including the
> already existing GENMASK(), GENMASK_ULL() and GENMASK_U128(), for the
> moment, only use it for the newly introduced GENMASK_U*(). The
> consolidation will be done in a separate change.

The change LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



