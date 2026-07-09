Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C918BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhCCe4HvvORcJNzIfHp85TRwW/SuH0ulRAOR5yRi62U=; b=REp6SfsSwm3Grf0oHTwg868Eyz
	tzv4WLlO77+JYH2vKBF56Btngn1Ypb/rUWJa0IQZmq/0xCF0dMCRpFUq+M2XdvgKu3vaECMoA3AE0
	2gAxEHW0HQBXCkjpScnwZhBfOyOWvbJy8nO1DdNVkEbvyABBIAAj4VGz2Az1bo14dFBhVlaX+jdM4
	vECvh7BolDoRdL8Rl/721crYdX97s/HwbronkldnUuvajYny/3xPfCjK7YTSCVeRO7hh0nmOmQmsc
	2DnmcGc+VNY6P9WnAD6x4NVa+DyiI4lLuZ7MiMzOoWt+WQsjbtXKFJk2HtaNN73WwNETYO2is4uh6
	JSS7crvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjGY-00000001J3X-16E9;
	Thu, 09 Jul 2026 07:33:50 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjGV-00000001J2T-0XR2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783582427; x=1815118427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z7l+gvXk3JDQmEUoKIVr9+b9SPFOlR8x569miOzasGQ=;
  b=jfdVb2gBP7/Ttmnx0ZufdqOeMMIWUbAiH3RO099rlaPzIeks2j60Ck5D
   FecSmpKS27MwF/NVACRd4JZ+n2r8UrogN+G9dTeBK/mFCK/G7p89ygHdT
   96a8eAmiEC07jr8CPY7I+gj3EmNtuoDe56EtIXb550yeBnWvUT6kkIadb
   3LP0M6ax3kGUNTvmTUmfzdCxss5gaOenRKmIpYiJDhi0fSkUek4cgt5y5
   hVHt62zOL5zhWlnM0sS4W7hmhyXqnoQ6pvDyMnrdqTBXTCSiO8u2CTlSW
   4G/C7ZDkGgsHOlQ4RDTsLK9p/CVn8W6zk8e4aQ6e4pfVKqXIqofY12WaM
   g==;
X-CSE-ConnectionGUID: cu7FY//+QI2E7R6Yc9loiQ==
X-CSE-MsgGUID: Q+Nez7x3TsatDWvY5RzFcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83367139"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83367139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:33:46 -0700
X-CSE-ConnectionGUID: EN5Bw27PRyOtBsvhIkOV8A==
X-CSE-MsgGUID: zHTCZuw2SR6j4VFc8OGiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254024272"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:33:43 -0700
Date: Thu, 9 Jul 2026 10:33:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"open list:THERMAL" <linux-pm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 16/18] thermal/drivers/st: Remove redundant dev_err()
Message-ID: <ak9O1eHHS60r15nU@ashevche-desk.local>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <20260709023048.599150-17-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709023048.599150-17-panchuang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003347_182645_4186087F 
X-CRM114-Status: UNSURE (   6.81  )
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

On Thu, Jul 09, 2026 at 10:30:19AM +0800, Pan Chuang wrote:
> The devm_request_threaded_irq() now automatically logs detailed error
> messages on failure. This eliminates the need for driver-specific
> dev_err() calls that previously printed generic messages.

Correct.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



