Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA94CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcbKy5tNqR5XvaRJ/EYUruL2pTPsg2ZXQfdQqcxcATY=; b=wBpGd4dRxR7HxC3mCauP7otWen
	+/EHw5PjD9Z74WtRvsqTTQg68Tv+vEGK4IYIPMnu9Pa8+ME2ueL7wXm2jlhF7IdbiwzHxI8MzorBb
	GCZ4SseTk+aMlKO7Hkt6PDt8gUyBxJiH+tkhY15hnMG5FMJNWwJVQw8PbbT7CaFQIRxXoqKPJ38NG
	qk9hJaI6GWbYUzq0q5I8tWnmbvzqm7F2ozdpFoZitHXoRCBS8n6zagZELV0btRrrdvpai3S/63FD4
	nZNJpZPJerhVU1bt/feeYfyNMG0WHGNfhB+sz8vz7SmMHVAW9lD1KZw8fan8QU81zHSk+ycQRJFdB
	D2HIOWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDwU-0000000HRRR-0kNz;
	Tue, 21 Oct 2025 15:06:30 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDwR-0000000HRR4-2ie6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761059188; x=1792595188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kaQgFgAUjXn571ByFw9JlPd7Orioww62gS7ZpKn0Vvg=;
  b=fowwPqLrpp4ojCIW7I1pDPnnCTJfF5xMoB1YsSJ4r8BiCQFG5+LhvyEZ
   HtXQ3VYh/7O0UO/s8NM/j8unj9fgt424Z7w4VsWulhIEDi6W2cHQoBYp9
   ydiyvy5lziWEexpFqzIDaKDGp+1Menpv+FFkhtoyYgJ8kbs/oHVyJhWFF
   WHBKBsQu0hQOrLFZwUHl6eYKvBwiar9y6iygvkBzG5fMAMwu96FkBKLdn
   sUKCrHvvJujZI5SQj1HJuqjB3ax3cNuIvfdU5g8FSnPh8qwX9rokUIRvh
   smjFTiVSmOKLktBhEwcYVUB3fqomf758TMkflbzifFzRNDktZkLWOJ1tB
   w==;
X-CSE-ConnectionGUID: ZInAVoHTTMO8P+lG1h3gGg==
X-CSE-MsgGUID: A9IoIdZ/SpCp8ppIVsTqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63283168"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63283168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:06:27 -0700
X-CSE-ConnectionGUID: tQQvw3RuTnWZ506CmALQMg==
X-CSE-MsgGUID: jOhEaA77R5WgldYhSU3alw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="207285933"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:06:24 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBDwL-00000001We0-1IEe;
	Tue, 21 Oct 2025 18:06:21 +0300
Date: Tue, 21 Oct 2025 18:06:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iio: adc: clear reference voltage bits before
 configuring vref
Message-ID: <aPehbXMDP5xBBSS-@smile.fi.intel.com>
References: <20251021053918.3008654-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021053918.3008654-1-billy_tsai@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_080627_695927_0C228B9D 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 21, 2025 at 01:39:18PM +0800, Billy Tsai wrote:
> Ensures the reference voltage bits are cleared in the ADC engine
> control register before configuring the voltage reference. This
> avoids potential misconfigurations caused by residual bits.

> Change-Id: I03c036436f376ced8a19fa5d407b7bbb377ae721

What is this?

...

Shouldn't be a Fixes tag provided?

-- 
With Best Regards,
Andy Shevchenko



