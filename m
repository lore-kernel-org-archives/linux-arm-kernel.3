Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BC2F8E4B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8VYutXWUS0/Ljz4V4OKySPUTUnL8mhsVw2lKA4P2Pk=; b=IyqL3OXK4ylZTgJ1/m9qh/To2n
	oSkAAomITODMEGi/CJXw4TZmWRCn7RFkvyYNcMCIkn9vIRxCkk++xtjlkks98HO29matsgwqodeQD
	XSzTtNDM12U2/fNeSOYxeJYrKEO2/LaNiBPsJRGhA2yEUtU4cXc9yzUeZq4cmCIC+TZ+hO0W+qfyt
	pfpWJ+ACvvWoYAvMIMTh67w5Fwd9PVNTI32zGQgwl7kiM6q8jjQavPS6o7Rixed4zQXhW6uJApvol
	i85linAyneUPILJOkT+IqqDfqRPW5a99fIJmYcwxau3322XtzRTcTbkTenV+Y/2gKh8QDAeKRniH4
	RzmgtJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdhj-00000003af2-1N5a;
	Fri, 17 Apr 2026 07:33:31 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdhg-00000003aeU-1ygW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776411209; x=1807947209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0y/r0BPgfQrMIEgn+iiajBjp+LB9k0B/72E03JTlTDY=;
  b=TWfXOmLHS/dsO/DPH/PTm9pTpq4wumZw+lSfhi1fvkRSVKZ9pbGqW+9L
   QP7m0Wua6odXbKJuMkOzVKtTx0PXstBtqU9eCVR+uawpmnOetzZH4IhQa
   9he+AUv1gCM/pjlAx1dTWctuAEDxHo3IxFwrrclQiDP8BpuHYKRIdmhnE
   AdsV307XXF/UMQ1aL0UV/wjI++/xZxbkuKz/cK79hl0v3A7iQ5tTyoBBB
   SISgXEJ/T+SG1JWyOXeODemurK1cLqjiQLJqy6XzokV2cm6lpy/+UPc9I
   uOZ4f8Vt+gUkf2pB3FX/S2pjmAtPeftcaQsPAVEKhTsTheeptVSGDDSwd
   w==;
X-CSE-ConnectionGUID: aeobcDxjTEugEOOy9OFlsw==
X-CSE-MsgGUID: t4e2VH9lRSSxbEz4cqDSsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77332044"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77332044"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:33:26 -0700
X-CSE-ConnectionGUID: GKlm/5d3SL+NJtdbR5rOAw==
X-CSE-MsgGUID: KbXWwPcaQQKeZaZiDooZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="230109306"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:33:23 -0700
Date: Fri, 17 Apr 2026 10:33:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] gpio: drop bitmap_complement() where feasible
Message-ID: <aeHiQJa93I6RgkUg@ashevche-desk.local>
References: <20260417033439.318930-1-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417033439.318930-1-ynorov@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_003328_552069_CE2AC199 
X-CRM114-Status: UNSURE (   7.89  )
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

On Thu, Apr 16, 2026 at 11:34:38PM -0400, Yury Norov wrote:
> The gpio drivers reproduce the following pattern:
> 
> 	bitmap_complement(tmp, data1, nbits);
> 	bitmap_and(dst, data2, tmp, nbits);
> 
> This can be done in a single pass:
> 
> 	bitmap_andnot(dst, data2, data1t, nbits);

Split on per-driver basis.
With this being done,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



