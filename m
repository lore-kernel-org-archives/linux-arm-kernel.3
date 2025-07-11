Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EF3C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB3nLqeWt+qguptVCdAOuCrM7R4ZMkMuyw2GtOCjbFU=; b=GqitGPN0p9RLAPIIZtn9OIV/pz
	/zZWasA7MmsCHrQwYhLDysnSRmtJQPx656hkE16dr+OVrIksmbZkOaK/u9F2+eubU7w5dGjWGvCxZ
	FZqr+LY929x8fg7+MCfgIT7GXbDzfE9JqqYUlq+mBKC3OOAAJBWVhOVWoKlrP0VpWycb3MggWp6wC
	H3uL3QCKbFJChw1xdtvSHBUIVrvZIBzO42FoAdpBaHDEY6LE5k48v2AQDTChL26tmeEVcojQbUjHI
	eAnSj+mXZPwbLLYRK0Y+My8Lm7I7ywslCvpdL1G+TefN3UA8lTunL6A4yim+iniL7zuAD1Z3j2Fy9
	6B0yH9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKHB-0000000FmWJ-3HYE;
	Fri, 11 Jul 2025 20:23:21 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIw6-0000000Fakr-2o5Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752260251; x=1783796251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Gc88Na8gcluHywQcvviPDhvVUUkPoMZ9NE3iFFxsTI=;
  b=NT6nfkFPGVTbywMFw3cphwIcAYSrdCynfC9HybeKuBVRaADHdlEe1aEF
   BkYyIjHxMefW26OHv6ZvrlPfQpocbbCmiJcslZPOiCvtTn2hEhBupkXSe
   5fY9itKBRLJ/xvL4O38sgLAJSSx0/DgUh/gFNr3PlLwdS4DIp6MpSaBd7
   n2/N7HPUUb6KxVnVPG/5ZwQhanUCarq1p+v4FXvac8+Z7U2y95pWcWpeq
   5kh9YzOrnO2eR0mMOkbYneDDJJAlX48gYVY4tGUx5IH4SYesfPrSDK8IG
   YHH7fHa+RfaOBU4Jq/beEjuK+iysSpB9/RvpLXZt5JXOHk+DQtI3oedag
   w==;
X-CSE-ConnectionGUID: 6au0jusfRqO0t0DthvdtfQ==
X-CSE-MsgGUID: 2GJ+NhiUQdu9IiKJcPYgnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66009059"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="66009059"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 11:57:29 -0700
X-CSE-ConnectionGUID: 3A+5pspgS4+KsV6bdhFhow==
X-CSE-MsgGUID: 6Yx/7JndQue2UoQSnaIVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="193632104"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2025 11:57:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8CE2E1A1; Fri, 11 Jul 2025 21:57:24 +0300 (EEST)
Date: Fri, 11 Jul 2025 21:57:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <aHFelLqnfsuaeh2Q@black.fi.intel.com>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709042347.550993-1-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_115730_747579_CD16C347 
X-CRM114-Status: GOOD (  10.68  )
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

On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.

...

>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/minmax.h>

Do not blindly add a new inclusion to the end of the list. The list as you may
notice even on this small context suggests that it's ordered. Please, keep
things in order.

Andi, if you don't mind, please fix this.

-- 
With Best Regards,
Andy Shevchenko



