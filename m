Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED7F33A92
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vxe/0TVFmxaf8mHBTWsMLG13SrpPSU1L6Aa1bLInUCs=; b=jxY3k9mRFJ8NNh+vEmzTHIcazT
	Rl5IJ4WRYPwZ6a0hjsS0BActfteSTMlfzd3Wo4lLS7S22UJHcqWph1kJqiu1zGhQpS2d4kamH/8es
	N3PQfSQpEIxF4N9PXaYlG8H0bq+l+G7moweL7mzNvGSM8NQJv7rIzhHLhZePj/+ge5iWKRIPKnYG/
	26C5U8IW0Ess3NX9YRl925h9ZowFI9ouJXwiTVfMvxqW0w1rRgOG20w4d90iR0g9Mt5uUK0WRTN07
	P2KLzZ20ZSZLbXdMV8uS8I33hI1U3nqmL8uCoPU6yrVGZXsHGEaJkclBwDQh93MXDutL9MxnroI4s
	6ZAWkqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWAv-00000003ub8-1jbt;
	Fri, 06 Mar 2026 14:29:09 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWAq-00000003uaa-0EPI;
	Fri, 06 Mar 2026 14:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772807345; x=1804343345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hKQUf5WDJPETTYg6XgZVG0XAdpM/T+JEq/CFscr1Cys=;
  b=WH1t20P1vdLsd9hntlbAQrywomREUiMG0KHKpGvMwukYTvKiko9Jvmf/
   4BubcwVADtamXGTm09L2c7A0hJEN71eBGMWlhn6w8oAcqfI5/WqGne0Ou
   YkYwq01FUKezmPEAvcfzZ029CJQcSlPIPGZnPA/yKUS/1O4uGloPEdaEJ
   sXshgQNba9LHOU4PY3ehC6O6BnmBSfp+TGh24/pwPiIBwzyDWRksHA8g1
   I21FutR0kbV0s6vndZLlmdpBYmr4D9DPf/Q7v/pMFlxFyIwk/LAo4WMuI
   2bg7Y8VlCfdbKkFz1Oo8xhf67WkVX9+bQf5RXkHDMtmipcD3CO918YnUu
   g==;
X-CSE-ConnectionGUID: 7n4m+NhTTbSfMGDSaHVTZw==
X-CSE-MsgGUID: B9g5IH/rSQClhE7Ix4kRYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73788751"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73788751"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:29:03 -0800
X-CSE-ConnectionGUID: MTr7+eJASyulE9m7KCUGvw==
X-CSE-MsgGUID: CljKMFE5RsuatuijuZIEVg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:28:56 -0800
Date: Fri, 6 Mar 2026 16:28:54 +0200
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
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 00/10] workqueue / drivers: Add device-managed
 allocate workqueue
Message-ID: <aarkpqHShro9kE6-@ashevche-desk.local>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_062904_166053_8EAE4D0C 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, Mar 05, 2026 at 10:45:39PM +0100, Krzysztof Kozlowski wrote:
> Merging / Dependency
> ====================
> All further patches depend on the first one, thus this probably should
> go via one tree, e.g. power supply.  The first patch might be needed for
> other trees as well, e.g. if more drivers are discovered, so the best if
> it is on dedicated branch in case it has to be shared.
> 
> Changes in v2:
> ==============
> - See individual patches
> - Link to v1: https://patch.msgid.link/20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com
> 
> Description
> ===========
> Add a Resource-managed version of alloc_workqueue() to fix common
> problem of drivers mixing devm() calls with destroy_workqueue.  Such
> naive and discouraged driver approach leads to difficult to debug bugs
> when the driver:
> 
> 1. Allocates workqueue in standard way and destroys it in driver
> remove() callback,
> 2. Sets work struct with devm_work_autocancel(),
> 3. Registers interrupt handler with devm_request_threaded_irq().
> 
> Which leads to following unbind/removal path:
> 
> 1. destroy_workqueue() via driver remove(),
> Any interrupt coming now would still execute the interrupt handler,
> which queues work on destroyed workqueue.
> 2. devm_irq_release(),
> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
> 
> devm_alloc_workqueue() has two benefits:
> 1. Solves above problem of mix-and-match devres and non-devres code in
> driver,
> 2. Simplify any sane drivers which were correctly using
> alloc_workqueue() + devm_add_action_or_reset().

Thanks, this version LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


-- 
With Best Regards,
Andy Shevchenko



