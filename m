Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F23FEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ldiyv8rNKG7bmOlB8uMzLrCK/6xi87IA/bu3T+K4rJ8=; b=FU1s+jZt20ybnIVthB453fN433
	m0XHLEoy3zWSjuqvR5EoWzCbbrp+RoA86YiAcYL88xYOu7MinfD03K5UkUXuVaFzX36jL9rARB8Js
	GcCwJJQKZJbNd7VLbaRKOXliKiFQtmlQtnMXfIPNtywq1+zffwZT5YmuAy1MiU0S0Is39l1xJaYD2
	JuMCJ9be1tTcM6B5yaaPvlWE9rT5RQK8zITpoDM4xhIqYqs8VTXLhskjs5NbCxS+J71C9sXo2N515
	3YlNr4h8gyYKRpfqxyA13DBBm8/EYyNQ4hskbCD2TVguyU8WnWOOAbbNrtQ8EQVfXzkjjsBR28riK
	aY998bZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ix3-00000002s9Z-3CEg;
	Wed, 25 Mar 2026 07:46:53 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ix0-00000002s9E-44MF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774424811; x=1805960811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4QhcKUHKk5f8eHU20gHK+CrNvm5trqyhWVTA3ToVauo=;
  b=BkTDLEE5XczRP/C3I0Fyro/HaFqs5Ymjx26d4zNQavUCcY5SNsU1t+jg
   EztwHvhlpRcASnG/K6pCr6vUyr3lgs6Ik3Z9z4Xz8HozBE4/ymayyRgf3
   RTP35e7SQaR8LNEUIuie4wZxSQKoCI3IzWRIwNXt8WRT4r56ypQ4HJgC+
   M9PXl5JA9yyW2lMoPZViVGJRU1s0kGfvEC+yrYjyTxjkbY/a1BEZ+Uys8
   T2hdYEJ/qh+xVSQap4y6sw+mzIX0B8m0XWWsvvXtOa8hTq4tuDiT2GNgw
   KTmQS453LRrMgzQifjYYOBhUFO/7rtfHhbR74K386Q4E1VRbqLDzcFYPA
   g==;
X-CSE-ConnectionGUID: 4KqfjH3FRsaHpgyRUnFqdw==
X-CSE-MsgGUID: 6C04Qjk3QB6lYsCJZx9oRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75172555"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75172555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 00:46:46 -0700
X-CSE-ConnectionGUID: G5PNN/E4QiyOvAoi05CTsA==
X-CSE-MsgGUID: sOq0GGDtRp+QhOXKg1GRfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229378652"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 00:46:40 -0700
Date: Wed, 25 Mar 2026 15:25:48 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Russ Weight <russ.weight@linux.dev>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suki K Poulose <suzuki.poulose@arm.com>, Tom Rix <trix@redhat.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Xu Yilun <yilun.xu@intel.com>, Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 5/5] fpga: m10bmc-sec: switch show_canceled_csk() to
 using sysfs_emit()
Message-ID: <acON/EU/GFvxRO1e@yilunxu-OptiPlex-7050>
References: <20260303200842.124996-1-ynorov@nvidia.com>
 <20260303200842.124996-6-ynorov@nvidia.com>
 <acJWNRb1t96yu/H6@yilunxu-OptiPlex-7050>
 <acLaDFuCzt0d33Q_@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acLaDFuCzt0d33Q_@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_004651_099160_DFDDBEFD 
X-CRM114-Status: GOOD (  17.14  )
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

On Tue, Mar 24, 2026 at 02:38:04PM -0400, Yury Norov wrote:
> On Tue, Mar 24, 2026 at 05:15:33PM +0800, Xu Yilun wrote:
> > On Tue, Mar 03, 2026 at 03:08:41PM -0500, Yury Norov wrote:
> > > Switch show_canceled_csk() to use the proper sysfs_emit("%*pbl").
> > > 
> > > Reviewed-by: Russ Weight <russ.weight@linux.dev>
> > > Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> > > Signed-off-by: Yury Norov <ynorov@nvidia.com>
> > > ---
> > >  drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
> > > index 10f678b9ed36..ae364c6636eb 100644
> > > --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> > > +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/firmware.h>
> > >  #include <linux/mfd/intel-m10-bmc.h>
> > >  #include <linux/mod_devicetable.h>
> > > +#include <linux/mm.h>
> > 
> > Why add this header file?
> 
> When I was preparing the series, I had build issues without this. But
> now I checked it against -rc5, and it's clean. Would you like me to
> resend?

No need. Given that I'll pick this patch alone to fpga for-next with the
fix.

Reviewed-by: Xu Yilun <yilun.xu@intel.com>

> 
> > >  #include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/slab.h>
> > > @@ -183,7 +184,7 @@ show_canceled_csk(struct device *dev, u32 addr, char *buf)
> > >  
> > >  	bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
> > >  	bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
> > > -	return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_LEN);
> > > +	return sysfs_emit(buf, "%*pbl\n", CSK_BIT_LEN, csk_map);
> > >  }
> > >  
> > >  #define DEVICE_ATTR_SEC_CSK_RO(_name)						\
> > > -- 
> > > 2.43.0
> > > 
> > > 

