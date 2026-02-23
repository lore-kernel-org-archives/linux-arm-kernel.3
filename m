Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D04DE98E0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp6hzmp+LTp3vjMQe5MwQV5z+ZO1M6imfAXHQSpg4cQ=; b=RXKsBxztdhph9iGSN0gNwc1s5F
	Ky3+9GvxrHqcZNMNBCtHL+wwZ6Hdfjw25KbZMHt6zfbDHAxqapLABBYhdiQ0kGXIozGQzvpcxbD68
	U8BEjQIIYXvvzpSAncPDJ0eIhBAox0UabM2/JIs9uQw0iSjxybf1SogpbD7igN5S5/xGE2GQ+gnMJ
	/Qj6yvZ3ZodqlpmLV8bIUZomTPPm0wjE+IJ4vIZ7Tu3qn0dg6bRaNLKSlagG6YYwCwLX5wfpMh1UE
	2zz+LD1zWrWDdZb10IswpHGTLpwCVVolqojiL7y6jV6PwYwGG2WA0mukC/Qnbre4PjlmMx+fk4kcY
	b1dQzhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRk3-0000000HRkC-0kaN;
	Mon, 23 Feb 2026 08:56:35 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRjz-0000000HRjM-2pdG;
	Mon, 23 Feb 2026 08:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771836991; x=1803372991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vTxb26YHC2bRnF15WcUVg9+N/0yuey9uzbRSyk1F6sA=;
  b=U37uPR6U+A8B5V7z3+NcoRT9Sd0pEgvT0p8nr+Hkqdz8C/Rm8hY62ude
   WL+XXb9XNAq3XT0oGu5uUTrys2O+ejeNPao4wQdMXs9/4+SWMYBdg9PCo
   FD2/JXaPO02+dqjlE1iy6XC867Zf96KGBEMvb7fVzcEk9y7Xs5RQMim52
   X/WrxvW6rvT9BH2SinE0dUNMEwSTmOgG9CsyRTzOvme1TztzQkWp/Yj8j
   uys+Py1UwQAvnxo2G5yHyzsd4klz7uHIvwBORAKRnMBMim3BQ8lqY6Xnz
   FrT2ZmJKjWWD72LwkQCn8qB4HDAwTelEWf9+PoHkZHx1vmo75aYMtsrdV
   A==;
X-CSE-ConnectionGUID: 7J2hPYYQTEaYEOCzXew39A==
X-CSE-MsgGUID: 0hQqGR7nRJGhJBxvmqquug==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="95443378"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="95443378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 00:56:26 -0800
X-CSE-ConnectionGUID: ChybxgAWQCaFwtRmsXad8A==
X-CSE-MsgGUID: weYH3rz0QoGnqBoexHAGNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214581172"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 00:56:21 -0800
Date: Mon, 23 Feb 2026 10:56:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 1/9] workqueue: devres: Add device-managed allocate
 workqueue
Message-ID: <aZwWMiYEvr3DXi3E@smile.fi.intel.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_005631_806840_07B2AFCD 
X-CRM114-Status: GOOD (  18.73  )
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

On Mon, Feb 23, 2026 at 08:27:29AM +0100, Krzysztof Kozlowski wrote:
> Add a Resource-managed version of alloc_workqueue() to fix common
> problem of drivers mixing devm() calls with destroy_workqueue.  Such
> naive and discouraged driver approach leads to difficult to debug bugs
> when the driver:
> 
> 1. Allocates workqueue in standard way and destroys it in driver
>    remove() callback,
> 2. Sets work struct with devm_work_autocancel(),
> 3. Registers interrupt handler with devm_request_threaded_irq().
> 
> Which leads to following unbind/removal path:
> 
> 1. destroy_workqueue() via driver remove(),
>    Any interrupt coming now would still execute the interrupt handler,
>    which queues work on destroyed workqueue.
> 2. devm_irq_release(),
> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
> 
> devm_alloc_workqueue() has two benefits:
> 1. Solves above problem of mix-and-match devres and non-devres code in
>    driver,
> 2. Simplify any sane drivers which were correctly using
>    alloc_workqueue() + devm_add_action_or_reset().

>  include/linux/workqueue.h                        | 32 ++++++++++++++++++++++++
>  kernel/workqueue.c                               | 32 ++++++++++++++++++++++++

Hmm... We have devm-helpers.h. Why the new one is in workqueue.h?
Can we have some consistency here?

...

> +	ptr = devres_alloc(devm_destroy_workqueue, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return NULL;
> +
> +	va_start(args, max_active);
> +	wq = alloc_workqueue(fmt, flags, max_active, args);
> +	va_end(args);
> +	if (wq) {
> +		*ptr = wq;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}

Why not using devm_add_action_or_reset()?

...

> +void devm_destroy_workqueue(struct device *dev, void *res)
> +{
> +	destroy_workqueue(*(struct workqueue_struct **)res);
> +}
> +EXPORT_SYMBOL_GPL(devm_destroy_workqueue);

Is this going to be used?

-- 
With Best Regards,
Andy Shevchenko



