Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05E0C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqjoA6PH5k+n5iS3Bnxj5iNHBxQQiU7tceS8UyudLn0=; b=WGAW0BK0N9uZ66eKhypJDASrgz
	elsAVKD7LNIiLHruV8do7VCPjricyM7oPRF2WYdYmeFD9xwJmeNbaA1UFHYqB3kDsB7ZP/7/wghHd
	LenlmTyRbXUid59xQ3b3ldbPt4LvReAvRD1sjyXrQOeC5swcwRCpZC8Nr03V1rbaBMgwrC5+mcmdr
	jLtDOxWjBh591PERyArN9SCVtIG59SyTEYU1TKtpY46Ty9/Dj0ZN2VLM+gpEmxTxyYcH22ZJIR0sA
	8jcJCvz+Mg2L64vMkqc18J+ffV8CCGNU1fwY9yGsne3BWt9jTZgMZIO17fsOd8prb0Z/RaFsdo3y6
	Oc/+RmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArB7-00000002A5Y-0uJe;
	Fri, 02 May 2025 14:15:49 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAr7s-000000029PY-2E7F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195148; x=1777731148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6IiN64pMdETTKuBoZ6KIahbYP1bxXL+nvOO7V81IoLA=;
  b=HCyZCe12NylHTIJa6FFiNBCGNzul1kBoCsdCRZmYaymtVa7YEYutnjmK
   lbRRiJtSjfvUBb5n1a4GzELMHW9OQC3h4Fma6lidgVs/XHLuuOEmmXGQC
   ZhHma99qgFN5aYNVr22E4dGQ5vlhnS/JfzPSrFlinDf7V7f/ATvuGKMBz
   bStAXlcAIBi0B4XQTqJWfe3fZfOBo+1HjDMd2GyjxsosZESOZwwGPJcYm
   Q8A8hCHJ2ygJPJL4HVefaxZBrj6t+cVl8gOyBzIajs90cc97UHoHEwfn5
   299PyQCFHz92t0pEE48uibrSZtCUY1j03Z/OeO3LtNJuhVuld0sYG29DD
   Q==;
X-CSE-ConnectionGUID: uR+8pgiXQdSBne7zf4NFZw==
X-CSE-MsgGUID: eDRzSU6RQ0mIB8nucIFtRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="50533609"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="50533609"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:12:28 -0700
X-CSE-ConnectionGUID: dRbbnPvAS2qfiOETG/r39g==
X-CSE-MsgGUID: TVhQzDj3TzWWANPp4OevBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135161349"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:12:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr7m-00000002DjA-3C1Q;
	Fri, 02 May 2025 17:12:22 +0300
Date: Fri, 2 May 2025 17:12:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
Message-ID: <aBTSxhSoin-AOz44@smile.fi.intel.com>
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
 <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
 <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
 <34488e3a-9d59-4774-94e3-6369ab3c235d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34488e3a-9d59-4774-94e3-6369ab3c235d@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_071228_588913_EA25DC7A 
X-CRM114-Status: GOOD (  11.12  )
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

On Mon, Apr 14, 2025 at 12:00:49PM +0100, Suzuki K Poulose wrote:
> On 14/04/2025 11:06, Andy Shevchenko wrote:
> > On Mon, Mar 31, 2025 at 02:40:51PM +0100, James Clark wrote:
> > > On 31/03/2025 8:14 am, Andy Shevchenko wrote:
> > 
> > > Reviewed-by: James Clark <james.clark@linaro.org>
> > 
> > Thank you! Can it be applied now?
> 
> I will queue this via coresight tree, for v6.16

I still don't see it in Linux Next, what did I miss?

-- 
With Best Regards,
Andy Shevchenko



