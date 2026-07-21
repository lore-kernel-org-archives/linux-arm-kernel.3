Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177E4C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OU/pIBsRvbIkQ1OV1rvDNcbOpmPOvf+Ap8wDnEvNDs8=; b=3tngSKUhFIgnDlp90yHWYMS86E
	gExhfKgzMTpQpBPQkKrjNLLkLAYIsOtOU9KoJlEz6blsHUa3QjQcEG+j7DQmhCayQE9G6vm9pjaV1
	zWHYkzYtSe0dC0XW5xypmJxUXPCT/HvfqILx/ChsO8pfaulgdpTDwItKfa3b+Az6wIZ14fs69A6Sc
	E4bXUZ66FMcMinIJ7QM81+DNN9L3fKikXS3/lEmxF6c1hL02yjllXQ87K31BptGaa/pPk3+VGZ8x1
	zAkjvwbxaKsvVmxgsdwg1bJd4oyal8mW0qM4wQ7HAQgAYIsFtxpyVc/h4nhoPvxChsqSPZ7OnFvbu
	qGcbYJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7dz-000000097Dd-0Czd;
	Tue, 21 Jul 2026 10:24:11 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7dw-000000097CT-1VPk;
	Tue, 21 Jul 2026 10:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784629448; x=1816165448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VMK1c+/vKVbSVeoy8U+5qlX4JI006aD0Z1nIkGcjxis=;
  b=Ygq7rvjSiZpKuk+uGBRQykJJVUkm7roajMqO7JECC27rA6I0ABT3PVHz
   kNc0i1pNMQkOIToQ5hmW+PLTss/QR7YC12ua7+0DvTFCMn4tfXVKpRXdx
   mE7fcVF0tNAtohRs/zNfXKE6OVC71tJ0WWyM94oTpAlTGqzd/c3M91k6l
   kMLi5xJBj5LvosZ8O2VzCTj6YI3HEavWe9fMIyKZWyzawHpqo7/kfsKUW
   gcWKPiNPapL62gjobDzOBLnRLRNOtXWxxlWPA1GVjqw5MJEYMdkuzQbOs
   hhnV8dH1U7RTZSSBzJPBhw0OQoaQY4yPIJB899BfUlj54BEN1kfCLJESH
   A==;
X-CSE-ConnectionGUID: 7nnrONyHRjylOmoJl2lVFw==
X-CSE-MsgGUID: LY4r4S+nRPqA3PYGSjKSyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85263563"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="85263563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:24:06 -0700
X-CSE-ConnectionGUID: /9LtnjzdQa6SVnzQ5fbYLQ==
X-CSE-MsgGUID: Zn8wz1zZSvOS4lf+f8rYAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="262662523"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:24:03 -0700
Date: Tue, 21 Jul 2026 13:24:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on
 successful probe in simple helper
Message-ID: <al9IwVR7Whw2DiXU@ashevche-desk.local>
References: <20260721075226.2347933-1-wenst@chromium.org>
 <20260721075226.2347933-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721075226.2347933-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032408_416809_B597488A 
X-CRM114-Status: GOOD (  23.77  )
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

On Tue, Jul 21, 2026 at 03:52:20PM +0800, Chen-Yu Tsai wrote:
> When a I2C component is found, it's device node is immediately enabled.
> This triggers device creation and driver binding. The prober will hold
> the regulator enable reference across this part. If the driver probes
> synchronously, then it happens within this window. On the other hand,
> if the driver probes asynchronously, there is high chance that it
> happens after the prober's cleanup function was called, in which case
> the regulator would have been disabled when the driver's probe function
> is called. This would then require the driver to wait 100 ms for the
> hardware to reinitialize, even if the probe function was just a split
> second late and the regulator was disabled a few milliseconds ago.
> 
> Recently, some of the drivers for the component that are targeted by the
> I2C OF component prober gained the ability to skip waiting for hardware
> initialization if the regulator was left enabled. This happens when the
> PMIC has them on by default, or if the component prober left them on
> after probing the component.
> 
> Wait a bit of time before dropping the enable refcount on our end so
> that the actual driver has the opportunity to catch and increase the
> refcount on their end. The 100 ms delay was arbitrarily chosen.

...

> +	/*
> +	 * Wait a bit of time for async drivers to probe and increase the
> +	 * regulator enable count. This allows the drivers to check and
> +	 * skip waiting for re-initialization.
> +	 */
> +	if (defer_disable) {
> +		dev_dbg(dev, "Deferring regulator disable\n");
> +		msleep(100);

How was this value chosen?

> +	}

-- 
With Best Regards,
Andy Shevchenko



