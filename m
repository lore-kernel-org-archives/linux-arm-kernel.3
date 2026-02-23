Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5B4E98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFuaVzPQl4CQPwK6/N1xOrsReRZnToutTgzmjfabsMo=; b=1hihMTCHm4KeCT8n2Yk+za3s9Q
	AKrGHEMc/Wt4MqOmg8TLnuuLyZEhoDnVDVVA4pm86ylyrQNAS5+6XCvzqbsWQkmu77WkF5SEHEcG7
	R48R5ahdVb7lvJr2zyn+EebPbmNXXRgjePcnoUhHGQ9QLxZf520bWo/r41n19/Md8yW3SkcbNPwhN
	cpz0Y3xbuRqZKn8hmsfFuJI65uxcZkZToJ+Ap5dOtYcYTL8XIRjw9mZGTceAuCtyD14utiGdJpUCZ
	VwKeHWHygpVaM6bEjFCxb5XuP2KJwi9Iqky55HBTKh6weqdVXP2Ui1VCd31ENsYpDZm9qFqeCHbKH
	wTutGtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRlb-0000000HS1A-3gwV;
	Mon, 23 Feb 2026 08:58:11 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRlZ-0000000HS0j-0lKX;
	Mon, 23 Feb 2026 08:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771837089; x=1803373089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ngc0//nsKMhxzUW0W1XhdpkPjpuyDMO5L5jYaVXufF8=;
  b=VfT4Z6GnfkciudcbHnfsuotZcM4JyZKdgQI/fv7GhpFyPcWTSA/E9gO9
   KM8o4RQtjVbvhJ/G/rC4jeIsFddMsMznnlWdJkrs3zxHY6yz+zNo9GQfw
   o3RMmWKQH5hr1kuuRXDsi9wT8XPd0g39VrFE+x5IfpnHok0kJhJverzZ2
   Bk1ReoJqBa30LJwaVq4/ZGC+3sT0kA5nTejSm/J8e25Ppy9mIqMpVaMr4
   ESk/X1p1V7TYmA8AhCobkRPOJ+YWBpzMW9msJ0c2GC4/qjc41OzNKcSZF
   EPStrof4M91v0C8YjGxmM4k6Imvd8lHfeyMpjba6o3od0B5aIdIGZULIk
   w==;
X-CSE-ConnectionGUID: EB4bNYAHTV+Y6A/6BfVzew==
X-CSE-MsgGUID: UNPUS+t9TMCiCfJ+YtB+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="84188575"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="84188575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 00:58:08 -0800
X-CSE-ConnectionGUID: 6dbkBlWcQpekmjJk8Yu6Xw==
X-CSE-MsgGUID: LIs0ElR+SfGL2UTDHKAZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="219617271"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 00:58:02 -0800
Date: Mon, 23 Feb 2026 10:57:59 +0200
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
Subject: Re: [PATCH 3/9] power: supply: max77705: Free allocated workqueue
 and fix removal order
Message-ID: <aZwWl57oJln1xH5m@smile.fi.intel.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-3-10b3a6087586@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-workqueue-devm-v1-3-10b3a6087586@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_005809_240709_4BE55419 
X-CRM114-Status: GOOD (  14.70  )
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

On Mon, Feb 23, 2026 at 08:27:31AM +0100, Krzysztof Kozlowski wrote:
> Use devm interface for allocating workqueue to fix two bugs at the same
> time:
> 
> 1. Driver leaks the memory on remove(), because the workqueue is not
>    destroyed.
> 
> 2. Driver allocates workqueue and then registers interrupt handlers
>    with devm interface.  This means that probe error paths will not use a
>    reversed order, but first the destroy workqueue and then, via devm
>    release handlers, free the interrupt.
> 
>    The interrupt handler schedules work on this exact workqueue, thus if
>    interrupt is hit in this short time window - after destroying
>    workqueue, but before devm() frees the interrupt, the work scheduling
>    will lead to use of freed memory.

...

>  	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
>  					NULL, max77705_chgin_irq,
>  					IRQF_TRIGGER_NONE,
>  					"chgin-irq", chg);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
> -		goto destroy_wq;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");

This should be just

		return ret;


devm_*_irq() prints the message. No need to repeat this in the caller(s).

...

>  	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
>  					NULL, max77705_aicl_irq,
>  					IRQF_TRIGGER_NONE,
>  					"aicl-irq", chg);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
> -		goto destroy_wq;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");

Ditto.

-- 
With Best Regards,
Andy Shevchenko



