Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43BDE9A74D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz+pLbhFp0S4qTFWWddsgDGaQpvX0q+4gZ+/3kcTYd8=; b=je2d4djJDzfmpFuR4sydz4nPum
	v+8jCiY0JYdfyS//4OFZwrXazbzawjkA3YsX+lMBvGG98wr3a1goFAcess4z1y49w37pfHYq8QkAk
	5cPxXXXx0L6HORg9R+e1bImTuvnDY++jrxhi6vBIgggkmotGjSXOxwfpSO+mmO0YSOSi2RA5NUg6y
	dbmLLBl5UWRiM1PU7sOyWaqIhXEWiO8aAQPi8LHNc6IXaHP7liatRGBbZc9ezeae3NGqLMCqn/MsW
	m6yJLXpFRjfYgzJqypci5GA1wViAGYwn3FQK23WPnMn9LT31cedP+mGsZF2k+ErPSV+V8HtwwhTfD
	Q8U1XPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yBd-000000016PP-260q;
	Tue, 24 Mar 2026 09:36:33 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yBa-000000016P2-2iA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774344991; x=1805880991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cl9Jn50dUXWt3BrXPsUSkT+go0J8MdRhtpKlgBhriss=;
  b=KZKQ1htm63C0NMLc9aXwTdxdtae0RJ/rqEnsbsFAiOeTsKFg74KiYU1/
   yfWVEnZjcfE1fxi+3TmThdIuTFis3TzNc0L+eFX0n9rTrCvsUhpxDtb8Y
   f2C+oGNhpMJCWTe330DeYDM6p/lTD3rO30Z7Jaqg+ZVfYJXC8X+qivkjy
   bZ91mjDgUfrJm9H1OZM23fGsjL4Slg2563Ng6Ylmnsm/Oj2TCW38glYib
   cDBtSmnpIyE9k8fjtfHCdyXtF+LErydhzUI8p7XZHvo4fwEiJgCUhYufd
   hjT1+vGJ4OvRdgw9u2EjJBk5z8ZftfFKF/qI1i2KPZB7k7R2soUhEHR75
   w==;
X-CSE-ConnectionGUID: rztcQL6nRhuthgs8r9OsnQ==
X-CSE-MsgGUID: nNNA33CnRDyjXCoa2MQA/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86725128"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86725128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:36:29 -0700
X-CSE-ConnectionGUID: DmWR8uXHRDSrXII1rchdOA==
X-CSE-MsgGUID: CPrU1x//RC2oHAiWQSJ1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229228806"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 02:36:21 -0700
Date: Tue, 24 Mar 2026 17:15:33 +0800
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
Message-ID: <acJWNRb1t96yu/H6@yilunxu-OptiPlex-7050>
References: <20260303200842.124996-1-ynorov@nvidia.com>
 <20260303200842.124996-6-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303200842.124996-6-ynorov@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023630_705256_322297CA 
X-CRM114-Status: GOOD (  12.95  )
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

On Tue, Mar 03, 2026 at 03:08:41PM -0500, Yury Norov wrote:
> Switch show_canceled_csk() to use the proper sysfs_emit("%*pbl").
> 
> Reviewed-by: Russ Weight <russ.weight@linux.dev>
> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
> index 10f678b9ed36..ae364c6636eb 100644
> --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> @@ -10,6 +10,7 @@
>  #include <linux/firmware.h>
>  #include <linux/mfd/intel-m10-bmc.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/mm.h>

Why add this header file?

Thanks,
Yilun

>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -183,7 +184,7 @@ show_canceled_csk(struct device *dev, u32 addr, char *buf)
>  
>  	bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
>  	bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
> -	return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_LEN);
> +	return sysfs_emit(buf, "%*pbl\n", CSK_BIT_LEN, csk_map);
>  }
>  
>  #define DEVICE_ATTR_SEC_CSK_RO(_name)						\
> -- 
> 2.43.0
> 
> 

