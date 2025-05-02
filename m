Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C75C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU+vLEzCOakbcsmDsPdUFYxLvGv6Cuo8GOdp8ADOnoE=; b=IduBKs7VT1B+4Ad5mVcN3i+gE1
	9mhozRqzdJ87Ve8JZUSyYkz3SI15d7BiC3W8Y2lddtzUqxQvp1DYJh7PJVckVzly/CHMR2vNewmtl
	dmgX1SL77o9ogR3JbJQ0AnyrMem5GspDPxc+Btgf7whtQerp4/sc2Z0Mse74impwIii6BSPjWDVHw
	r1bZkdGRFaT+mnqxGIXxmBfkC2rcrGIpxDFalqd5mQZweX1kLLb2h6JFxZduvhmznvs8j2vXII5Xk
	rJ/x/zx+23WqK4x930Bh9RNjptS7YfLpT8ekRinP4sRI9HMWFZBWPtkagjpWBvBapfUrDr/chYMdk
	kTivA+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAr9C-000000029cT-12qa;
	Fri, 02 May 2025 14:13:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAr7E-000000029Ix-3Hwx;
	Fri, 02 May 2025 14:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195109; x=1777731109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YX5K9W8SlvAErcT4KDiQHr82LNYtHxZsOutAoTNilCI=;
  b=ZBVRzCkzXlDK/XxjSxBtpC2Sq9ganRW5vVhiCMva1b2JE2tDUiu3bD+A
   Tr7gqkLsONFvJJbzxM5EWrtJEWLN3ZDrcD7HhjAonrXrFXleRxCvrTjeH
   j/Q5S5IvDX0LTiT+kNv0zHFHcoLjs9T4jKBexwGO7llwI0mVJtmyIeaeV
   bmZbrFARFOQsQ7IF7pWhaYcIryVEtYIJmCqFcl49bAUy+oJKpP0k//beL
   Gah2Q/wyVHPA+JXDMh0kTBTnznTxRgM6GymKUC4LcbbYGVKyEM+v+dIZg
   e+qZudpNmjKPyk2XMyNl41IRVI4ZGYnfxmvIxQlKOVzAc7ol30YbUGIVe
   g==;
X-CSE-ConnectionGUID: aSzLVeDRS0KDClRFNmc/AA==
X-CSE-MsgGUID: 4GmGJxrsTFaRhP/I3pd4Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48019983"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="48019983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:11:48 -0700
X-CSE-ConnectionGUID: O2cAMrm+RmStsBngfky0Cg==
X-CSE-MsgGUID: S5bc+TXhSame8+YbhwCHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135608569"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:11:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr79-00000002Did-0njo;
	Fri, 02 May 2025 17:11:43 +0300
Date: Fri, 2 May 2025 17:11:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH v1 1/1] media: raspberrypi: rp1-cfe: Remove (explicitly)
 unused header
Message-ID: <aBTSnv5buH7AZp1X@smile.fi.intel.com>
References: <20250331072136.3987653-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331072136.3987653-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_071148_831924_8A69F053 
X-CRM114-Status: GOOD (  10.88  )
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

On Mon, Mar 31, 2025 at 10:21:36AM +0300, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Note, that fwnode API for drivers is provided in property.h
> which is included here.

Any comments? Can it be applied?

-- 
With Best Regards,
Andy Shevchenko



