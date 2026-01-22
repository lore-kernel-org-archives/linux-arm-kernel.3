Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762DAC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pq6uks1JqjBqnUIrGOu61LJf3eXEJj5qpucLo0iEi1g=; b=dOBvRUKPXmM9ZAaNp3hkYr8pU6
	wLwEDJI3HgpF23lye16EHpSPLJDiIlzk4I4gSWQlKuMees6g7w+XiZIWuEb1TEXvVRUv5U6OgPDz5
	J3RUyvMmU3Bdy85VB8dUP+uV1KBe7as8zm6/hJtMknG7LifZgnv13Nvfg8WY9HbM0q4ek3QNQogvh
	yPDww2V/QftbypzYk0vSVvpm7hsKa7/EPsOVBpBBdP2OTSHczQ9Skfx5mlMLXUqkHUmx9O+YvL+e7
	ClKdS7h6PRuYvik21zdnY9zPpzSTtTEwcq36ohfUI5OGmh4l26c4iK1J9Ny60rRZmW1W24F46AZ+V
	M2nYNaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqXt-00000006hEM-0Wv6;
	Thu, 22 Jan 2026 09:00:05 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqXr-00000006hDz-2Iz7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769072404; x=1800608404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LLmeG593shN9Q59lrWBA8eb94dOcapiaOJUE9SxHrzU=;
  b=CSqynQv8vm8rr4GQoHNaufqn8ISAAdLY2YS1pJscKz/P0Qiix8JYhIef
   9TYJWvXfcDN+zTMxvIH5THOJOxZZnZ30zmRWjiXsYl4kqwZSixQUPXeyV
   ly1eVhWBKnZFL7jbUA67l3WVLm+iXFOIDdHBYp01R4R7sRX3RZb78qUc1
   ywHTYLbizTCbF9iTvPS+Y/1ggJqZWlhEn1tOc9aEOGbGcvMMVRqWLJfKQ
   +v11peqsTxqrSM2b25aFS3+xe01VbL1IT3/M3wYoCs/mY+BE1178rnIiC
   bnM+OELkaKZLQZIVqns5yl8E8kNneH8T9tYPj1jd0hox/Ozrt0p8kMgxB
   w==;
X-CSE-ConnectionGUID: KtbEv9VoTeanW6Zesel8BA==
X-CSE-MsgGUID: VXi6VjE3TmmEVTzaPcY1cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70217606"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="70217606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:00:02 -0800
X-CSE-ConnectionGUID: 6Ekd8WSKRaeslsOMQjP6Fw==
X-CSE-MsgGUID: 8n2W5K7cRAWIz2oBvoJ5TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206741545"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:00:00 -0800
Date: Thu, 22 Jan 2026 10:59:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: xiic: switch to generic device property
 accessors
Message-ID: <aXHnDXHfjEnKpRmg@smile.fi.intel.com>
References: <20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai>
 <20260122-i2c-xiic-v2-1-134f5d743e8b@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-i2c-xiic-v2-1-134f5d743e8b@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_010003_636000_70A033CB 
X-CRM114-Status: GOOD (  11.94  )
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

On Thu, Jan 22, 2026 at 08:32:31AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Use generic device property accessors.

...

> -	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>  	if (!i2c)
>  		return -ENOMEM;

This type of changes should go in a separate patch after this one.

...

>  	mutex_init(&i2c->lock);

Please, consider also switching this (in yet another separate patch) to
devm_mutex_init().

...

> -	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> -					xiic_process, IRQF_ONESHOT,
> -					pdev->name, i2c);
> +	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
> +					IRQF_ONESHOT, pdev->name, i2c);
>  
>  	if (ret < 0) {

> -		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
> +		dev_err_probe(dev, ret, "Cannot claim IRQ\n");
>  		goto err_pm_disable;

Before doing it, just kill the message, it is a dup since devm_request_*irq*()
already prints the similar one on the error cases.

>  	}

...

So, this patch should be transformed to three
- removing a dup message
- converting to device propries
- utilising the temporary 'dev' variable elsewhere

-- 
With Best Regards,
Andy Shevchenko



