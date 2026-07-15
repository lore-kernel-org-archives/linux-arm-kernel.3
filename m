Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mY2zSWg1aNRjDRgnHgWnHyOuWTG9nVHKJK+qD70fIw=; b=oCM9hrme3RBP4orocQG8+f9+BJ
	mXRBWSVWx/lxNyltFEwvB334t81iz5uKwawIrLPjM9bEug8PsHbZ4anoJz1cmAcAVBe+xR0M2bpFV
	0RZwjbA/6LMmlxRg/XSO5OKRxrcbMDi0NpZQI5rfa6APoUZcwEz7lD7O6cWuoB76vL++CpbeX+dZ+
	XvmBGyMIw4eB65oFfQnJ3R+xmBTg5aeWVo9MvajcK0QsBWjsM06VlG0f3oK8qf/RFs5ZHj3bWkUMH
	IlveU0FAp1htPgpzXAStFB8dlsx1Om3vRbYyEE2z0zk1eCCU5o6tPRHjRQOZbXlI7ElpAEmFb1xHk
	DkCR8QUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvvW-0000000EKCn-1O6Q;
	Wed, 15 Jul 2026 09:29:14 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvvS-0000000EKBE-3Mc3;
	Wed, 15 Jul 2026 09:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784107751; x=1815643751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/5aaAsVdQN0eiTG/66eGgXteBugptKLohzhJXhN02NU=;
  b=CRbNMu8MLuQAJaO5Qbuu56DDzuGxvLsLdYU4lFELL6MtRKomF+nGrc3p
   x5/mAUbIQWdoEAcVD0e1ngfV+irN8bMe9B0mronc0TMXvfLRgpp83PUmi
   vF/gUTE2LMA6rqpRbSkolkdkFwEHIQUO5K5WUQCjtWb9vrpmuLCBy2frQ
   I0Cg8gKfHaFV7q/eSLVmC/3FE7riJVoI4zEbV3VFAyshkxBxnp4XrgBe+
   cjeTn2CYkKDzS0QP/NWLUbnFKvFn1WEoIUOhdoziILcfznu4Ct9LtGWmz
   jydulsHPtpXhgrOmuqxdtmA2na4BZ2daXUxyT3wMidYQgabJhGp7WT0U0
   g==;
X-CSE-ConnectionGUID: lpA1cZWtTcO2xp4/TcPYPA==
X-CSE-MsgGUID: MZw2L4hsRzmE3H5aGOQ+4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84830141"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84830141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:29:10 -0700
X-CSE-ConnectionGUID: t3nl7JS5TxCiXiLKm/nhqQ==
X-CSE-MsgGUID: BfWSW46GSw+l5U7M4cVNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="286203001"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:29:05 -0700
Date: Wed, 15 Jul 2026 12:29:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
Message-ID: <aldS3qTympJuVXYj@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715085348.3457359-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_022910_887379_57CA56EB 
X-CRM114-Status: GOOD (  12.25  )
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

On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_power_is_on()
> so that they don't have to reimplement it locally.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +/**
> + * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * This returns the last requested state of the power sequencer.
> + *
> + * Returns:
> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> + * negative error number on failure.

I would rephrase it a bit.

 * On success, 1 for on and 0 for off; negative error number on failure.
 * If desc is NULL (means optional) return 1.

And this rises a question: why 1? Shouldn't it be some "unknown" state?
(But since Bart Acked this, this doesn't prevent the patch to go, you
 got my tag above.)

> + */

-- 
With Best Regards,
Andy Shevchenko



