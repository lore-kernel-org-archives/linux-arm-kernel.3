Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B97FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 03:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HihunxX0kG7LRmd3HrgFHUgeqCV95GWNLs7fwLAUqXc=; b=xdLwMPDxjpCGGLZreJDfA0OOHE
	i7q3+mJXMTNU389t26ddk7UVNuHVnLfFN4dVz8X680VzbQ5WtfYKVnq2fK/WgkoBuj06eMq+0AtN2
	bhqe/1fK4euLjWlMIRdqcfy4jPYtjdi0TNEE/39pCeIqKj2Q6REEHeImvJJ2Vhv7U4UGOkzoS6B4D
	rn4Ojj/wAkWZBbGW5J654Xnr5WYMIzREaw2kI3y/EumeOH3A3y93mzPLgfhe5DD43BBuDXZ6AiCG7
	hzmRjOQOLpUmretE6v8Rq9Qa2tey0R6bQ5etw6Cq4cZfkuT57da+wkABTI7PyNu+4FPVM/WcRAmdE
	GYQGc8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZYa-00000000W7p-0ODw;
	Tue, 28 Apr 2026 03:56:20 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZYX-00000000W7T-0ZqV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 03:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777348577; x=1808884577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xqcaIUX8QLlEguWmxNfjx0KBxYjMkol7RCbc5o2EAsU=;
  b=Uo2WH9eQMMqpfpLlROe0OSOjuzg9QVm0jxIj5X3UGd8CWWkgQDjgx8u1
   b3wlNdmco4F77XXA4OBOo8Vz5QyEfg5aRJVyoG3VPInq8R3qTph9LzthA
   B+Rp1z7M808c0U1XfqW7il/b2PfqMKufIAVOMR3BQu5WiEHUhNX7uX2kj
   +lasgU7y99bVK5P7a+GaJjsq46U4n/c/8uWkLJO8i4ivCjZpCs8c9n4Ro
   C5mC00oFWKDx+RtSBlUNbiCxr8yuh67GN5zBZVhr4NtVpPqNq8l7hFWXd
   pYIqlWsVN+BIRGugOl1kTRYXLQUwnuyUJd0k5+bht2PqMydqFuHXhPpbb
   w==;
X-CSE-ConnectionGUID: wIrdFTxYRJWOWRFL2/mPzA==
X-CSE-MsgGUID: q/U0fF29Sxa3ABP9EFdPgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88847365"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="88847365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 20:56:14 -0700
X-CSE-ConnectionGUID: 3nKhigtTTJGCsyK/LoClIg==
X-CSE-MsgGUID: CQbrqSW3RcGMpUchpv+whg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229469506"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 27 Apr 2026 20:56:08 -0700
Date: Tue, 28 Apr 2026 11:33:37 +0800
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
Message-ID: <afAqkfe8iOU1cUyQ@yilunxu-OptiPlex-7050>
References: <20260303200842.124996-1-ynorov@nvidia.com>
 <20260303200842.124996-6-ynorov@nvidia.com>
 <acJWNRb1t96yu/H6@yilunxu-OptiPlex-7050>
 <acLaDFuCzt0d33Q_@yury>
 <acON/EU/GFvxRO1e@yilunxu-OptiPlex-7050>
 <afAh1hq_mkRN3q2t@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afAh1hq_mkRN3q2t@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_205617_217384_894EFCAA 
X-CRM114-Status: GOOD (  24.19  )
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

On Mon, Apr 27, 2026 at 10:56:22PM -0400, Yury Norov wrote:
> On Wed, Mar 25, 2026 at 03:25:48PM +0800, Xu Yilun wrote:
> > On Tue, Mar 24, 2026 at 02:38:04PM -0400, Yury Norov wrote:
> > > On Tue, Mar 24, 2026 at 05:15:33PM +0800, Xu Yilun wrote:
> > > > On Tue, Mar 03, 2026 at 03:08:41PM -0500, Yury Norov wrote:
> > > > > Switch show_canceled_csk() to use the proper sysfs_emit("%*pbl").
> > > > > 
> > > > > Reviewed-by: Russ Weight <russ.weight@linux.dev>
> > > > > Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > > Signed-off-by: Yury Norov <ynorov@nvidia.com>
> > > > > ---
> > > > >  drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
> > > > > index 10f678b9ed36..ae364c6636eb 100644
> > > > > --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> > > > > +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> > > > > @@ -10,6 +10,7 @@
> > > > >  #include <linux/firmware.h>
> > > > >  #include <linux/mfd/intel-m10-bmc.h>
> > > > >  #include <linux/mod_devicetable.h>
> > > > > +#include <linux/mm.h>
> > > > 
> > > > Why add this header file?
> > > 
> > > When I was preparing the series, I had build issues without this. But
> > > now I checked it against -rc5, and it's clean. Would you like me to
> > > resend?
> > 
> > No need. Given that I'll pick this patch alone to fpga for-next with the
> > fix.
> > 
> > Reviewed-by: Xu Yilun <yilun.xu@intel.com>
> 
> Hi Xu,
> 
> This patch is still not applied. This is the last non-lib user of

I see it is already in v7.1-rc1, what's your expectation?

> the bitmap_print_to_pagebuf(), and it blocks me from removing the
> function.
> 
> Are you still going to pick it yourself? I can move the patch with
> bitmap-for-next if you prefer.
> 
> Thanks,
> Yury

