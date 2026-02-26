Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42062FC590A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45JsBOPCFZIuEnMHMmIEK6FxJ6Vmoi6JWlGzfgTlKd0=; b=C9EioN/01et6dunye5f0esRrYv
	chZq1KXLe8dxTshE8UWAssxfl2O67aCvFXSDudeoefHZSQiLImCkWeK2hC+s7oxobsIP4EUf2hMp6
	eboUgFYjRoPYAPncguF/EB43XvrqeDJrYjSur9POrBx3pDbNYM7aFpX09wRirsM4HVagXoeYJ+Fez
	Nsbx2NqcsA72uE2FoFrqHsLqICMkb9RcDkCkemoFVQbgNSvO1/hGay3bKCLxsuA2vLu7Muj1kkNz+
	s9lsnniUSlPR6RYotZJTDM/FZMazSZaiFz8oplmNHyObe6LpHTJfz0Q7oxYo08i/4D0ilAYjPTFf/
	/1jbyurg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWHV-00000005bu0-0krx;
	Thu, 26 Feb 2026 07:59:33 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWHS-00000005btW-43pG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772092771; x=1803628771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rs0qEAZbdxZqApzkbG0FHEalQVhLZ+XgQWmJpEIvOnc=;
  b=BGCKaC/4Y/7r2QjozsOIM8/GJiwHkczy4z1Pyq74VsATwUzok/6mjejx
   lg0Rt/7dpletnSQsY3UQs4ZEqOhzIwFSk7zA/EntThZ29XZJQxAtooTTL
   ozy/d8EdYtfLsc90h1Eq1yV+CzCEj8K8GhzkW+h/8WGXQbjKggmHyjPmN
   FoRfqH6aIp94d9PcU/fRLfmoJDWYvxRIRyj++aDb/MOQFw9HN0n1JGnIG
   pcDT1Yagj9oRLqIIuaGiWyJ9NRRyVdZqpO9sgGpGNb6XqAmnP5lPKwvYS
   QUO9SrIerbfPxinuXGcf+pXvXD9kWq2tqsi39XHZDoaZDGuYBynyCyFsB
   g==;
X-CSE-ConnectionGUID: s2MTakUORM6gfMAcZEzVgQ==
X-CSE-MsgGUID: KDtaeXuVSEW+XJvPqnBAFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73018076"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73018076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:59:30 -0800
X-CSE-ConnectionGUID: HXHY4jaTS763fk0dqYE34Q==
X-CSE-MsgGUID: n89NMNHmQ2uMu7evv5CMDQ==
X-ExtLoop1: 1
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 23:59:20 -0800
Date: Thu, 26 Feb 2026 15:39:46 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>, Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 09/12] fpga: m10bmc-sec: switch show_canceled_csk() to
 using scnprintf()
Message-ID: <aZ/4whL40HHi/85Z@yilunxu-OptiPlex-7050>
References: <20260219181407.290201-1-ynorov@nvidia.com>
 <20260219181407.290201-10-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219181407.290201-10-ynorov@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_235931_092526_B4459165 
X-CRM114-Status: GOOD (  13.35  )
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

On Thu, Feb 19, 2026 at 01:14:01PM -0500, Yury Norov wrote:
> Switch show_canceled_csk() to use a more common scnprintf("%*pbl").
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
> index 10f678b9ed36..5ae76b8ece18 100644
> --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> @@ -10,6 +10,7 @@
>  #include <linux/firmware.h>
>  #include <linux/mfd/intel-m10-bmc.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -183,7 +184,7 @@ show_canceled_csk(struct device *dev, u32 addr, char *buf)
>  
>  	bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
>  	bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
> -	return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_LEN);
> +	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", CSK_BIT_LEN, csk_map);

As Thomas mentioned, use sysfs_emit()

>  }
>  
>  #define DEVICE_ATTR_SEC_CSK_RO(_name)						\
> -- 
> 2.43.0
> 
> 

