Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C50AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJU74uGBRgJrBWsLNGKktTljQMQBbf8PGSIW5mHzcHE=; b=eE6wXR+Bp11q0TzQdjVVtcl1Yw
	kyKe3anUSuEqo6TNC5rGww6D6J9UFqPoW5GT5P4sh1JRKbqP+AzU+8RtW6pVBQgJMWhmfG5nHz6m7
	x/NQgU+0POZ9X9JCEQWyRJBxY6kcPa+gx8M6mjKi7w9i4ywiUNoAxYTqJqOBDaIEKVeKb2Ud1OJWE
	acizS7I9QJCqMwbW9f/dR9J68L798eKEjHxxS98CHhprqqlHfJfwMgAJvAl1K9P1ud2Rbb2y6x291
	29Gm1jBLeZNKqFh8eGyLT2rSZO9ZsnzFkqW83A2B7ZitJZ4RHxRu4XzwL7wVtq8QwXxID6C6lxLlQ
	sG/n4JSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqbf-00000006iDs-0GIJ;
	Thu, 22 Jan 2026 09:03:59 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqbc-00000006iCr-3srM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769072637; x=1800608637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ohGY88eWkGMmFgVvnuEy0jhbn8Jw1vVAxE6b2ba4dM=;
  b=kWzC2YIYc9tlm0e4E1NFmvbS7eLyDddqoncLX1xOPk3qkuM815teUttG
   YOA4mMZZvV8lblA+n1G6so8vYmu/LkKFxZTRbCtXEpeEU8kTw5+vZJ+os
   oE7tiKIsyV+n75bGn4ECSKodl9g7LLgihPsTLr50gqsTLsgn4cHdPpn1w
   VU8+ZsXxS4ff0x7mtBFH11vSXnlemDpebXInx2aUiDt8LbKF01zOJj8cG
   5hmxsoitwqY9KsjwQ5jF5+C+M189pKq5+IL4tB3TW7JuAWEQ24WfSYO4W
   GFcVCcbWGqjQ1Qbp23im8saOSbjoirP/ueWHNB9PuxhvqTxKDZvydWpwj
   g==;
X-CSE-ConnectionGUID: /UppbpK0Tm22YJuX1W9Hpw==
X-CSE-MsgGUID: 6RrXY+zsRFaam0egUNsf8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57873876"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="57873876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:03:56 -0800
X-CSE-ConnectionGUID: 4XmMHhiLTv+BOKI/lEXCsg==
X-CSE-MsgGUID: SAcLZZBOTEKZrMnpfQ/UzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="244284372"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:03:54 -0800
Date: Thu, 22 Jan 2026 11:03:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: xiic: switch to generic device property
 accessors
Message-ID: <aXHn9g_aYmfJ-2ak@smile.fi.intel.com>
References: <20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai>
 <20260122-i2c-xiic-v2-1-134f5d743e8b@nexthop.ai>
 <aXHnDXHfjEnKpRmg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXHnDXHfjEnKpRmg@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_010356_984533_989A6341 
X-CRM114-Status: GOOD (  16.00  )
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

On Thu, Jan 22, 2026 at 11:00:01AM +0200, Andy Shevchenko wrote:
> On Thu, Jan 22, 2026 at 08:32:31AM +0000, Abdurrahman Hussain via B4 Relay wrote:

...

> > -	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> > +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> >  	if (!i2c)
> >  		return -ENOMEM;
> 
> This type of changes should go in a separate patch after this one.

...

> >  	mutex_init(&i2c->lock);
> 
> Please, consider also switching this (in yet another separate patch) to
> devm_mutex_init().

...

> > -	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> > -					xiic_process, IRQF_ONESHOT,
> > -					pdev->name, i2c);
> > +	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
> > +					IRQF_ONESHOT, pdev->name, i2c);
> >  
> >  	if (ret < 0) {
> 
> > -		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
> > +		dev_err_probe(dev, ret, "Cannot claim IRQ\n");
> >  		goto err_pm_disable;
> 
> Before doing it, just kill the message, it is a dup since devm_request_*irq*()
> already prints the similar one on the error cases.
> 
> >  	}

...

> So, this patch should be transformed to three

Ah, to four!

(in the following order)

- convert to devm_mutex_init()

> - removing a dup message
> - converting to device propries
> - utilising the temporary 'dev' variable elsewhere

-- 
With Best Regards,
Andy Shevchenko



