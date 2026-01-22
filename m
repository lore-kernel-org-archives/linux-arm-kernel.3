Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6ED3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaHFN8cnGxfr99b/VM8kqTekaA++spz7M2pGUmAiVCY=; b=G6jcbPQSoYRSlDzWvV+vzjLV/m
	rq7A9M/gWksoV8Zj8ied58nJl0XcCsP3l51l8N5ioltpqLMAyIjpCJXCDOeR+8+ss4cjgCAqMeFTc
	fFzHgPfCcELGG5QHXi+L0MRHLB0OF6rzBMAlby6s3TMxq/E0IaJHNGHHLt9r9JPYuRVB+dHGhzlib
	AYgbrFcyokzeaVEYMrMLYb5XNLXPjk8KKteQ+0FA0P4KbIsmQ+dNuf/KdOSA7wQzu4BZw1Iuink2Y
	UfU7BMMH4LxSbpvNqy3nmWwn1xX8pLOdcNKE87M++9xN9S2E/08T1+1Qmaa5LdkgDrUHqfxup+yej
	o5zLQzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw9K-00000007HLH-2NTG;
	Thu, 22 Jan 2026 14:59:06 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw9F-00000007HKn-2Po1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769093941; x=1800629941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oyBYVx2rxUgDxsxWHuGCigCnNM9b0fNxSCX++nnttu8=;
  b=Do1iAlBpzM4ujwZ+QAZYinf/FGx0c7huzygqA4CfWVheaVdtUIYAtAOu
   a1eTXw8UpSmSpCqWJY7T4XdzWuqwXb2JWmTQ0LDUmVsNq+/QVE/nFylPR
   h612LaWrKTutkkdgnuH9v2npQzZd3fbX0bza/6uz4ibPkVe/vBFoF2O91
   M7jJmhOYf9rCGXD53Rdl3K1ZA938MogxqOlsvvBdzqE32eTkjE2Adm2u3
   ybwBx0LhLpfcBqLOqmLvnlWlrK4GXJmxGWOx0nbKpr8Yk78yPNKzfZxMh
   GZthteBJ7DnCODAArFwgWFAwcOqJnAngGoWOse+zpHHtem2YXfAM/Wuza
   g==;
X-CSE-ConnectionGUID: QIf6EdnYSKiFyQpMuGjG3g==
X-CSE-MsgGUID: hoUsqlnYRRqW2o3VqXoZjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70502580"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70502580"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:59:00 -0800
X-CSE-ConnectionGUID: onz+BkllTjeppd7SmTHZzw==
X-CSE-MsgGUID: ilFgMdaOQo6AaamBHD+l2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="229719256"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:58:56 -0800
Date: Thu, 22 Jan 2026 16:58:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] ASoC: pxa2xx-ac97: Remove platform_data
Message-ID: <aXI7LlXOiLSD2K1a@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-3-0a91901609b8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-3-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_065901_774048_B3E6787E 
X-CRM114-Status: GOOD (  13.50  )
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

On Thu, Jan 22, 2026 at 08:44:59PM +0800, Peng Fan (OSS) wrote:

> Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
> has been no in-tree user to create the device with platform data. So remove
> them.

I like the changes for PXA27x, but one important comment below.

...

> +	if (dev->dev.of_node) {
> +		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
> +		if (reset_gpio == -ENOENT)
> +			reset_gpio = -1;
> +		else if (reset_gpio < 0)
> +			return reset_gpio;

No, please convert to devm_gpiod_get*() or even better to use reset-gpio driver.
TL;DR: no (reinstantiated) of_get_named_gpio() or alike must be in the kernel.

>  	} else {
>  		if (cpu_is_pxa27x())
>  			reset_gpio = 113;

-- 
With Best Regards,
Andy Shevchenko



