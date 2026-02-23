Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE1DEA4FB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKq+XqD9UzrJQDDajsTTYQd2m6O1yzr282dV5geroQA=; b=jJesLs6dzVmzrKcIdCuAWyTMVz
	cWtssBSR6jV4RVqvheZWJnsN1ZxmWhY9MRJy8V9g/ZSYKL/H4JfPDH3kIgCi3eOvBw4KteBVJ44g7
	snFHS9JWc7dUVj3kxt8sWa8PoTwumgmrivHpdkgfYh+ADD0n3Ho1gxf/CZLQfIsKXTRYHpcvUAk8F
	XWZluCDBzknDnSbQvourz82uMD+rExCQCpurCAl0Iy4IpVxII3TF5IA4BZ+rlZSwsUVJx3+Wopkje
	7JetWM2vWBlW2nNxXsGvU+Fqc9CY2sBhrVBa4Gb6WLHF5tZ+6kPkDchWdPpTs3OOIXhvvhCMmvPO/
	8H/RBaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUoM-00000000G7L-2mWe;
	Mon, 23 Feb 2026 12:13:14 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUoI-00000000G6s-1iXa;
	Mon, 23 Feb 2026 12:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771848790; x=1803384790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3n9HI5ycnkli5W6BGGU+azDBkZ+AMvJ95kVejaXce4U=;
  b=LMho2JiNrHf6p8ctMWS90OYrCBaOoyPwqH3sTC/I9xVcUuCACnkc08RO
   oM5Vp08wHDdAnZ3xBb7vf7u0n0a+GH8s4m8rodWQN+8C5PcbsYFjh+o/S
   zwlef4/pfaYAa1dHCyn/fncIkm0nIDqZ7bDf6u4eTDQZXvqfLZ+kEKGSV
   Gy4RxgSGI5H4Mp81/e23TEaZEaqoXaZBIx6/Lm4B6WcFNbs+z+k/tuKiC
   qQZHH430NV9sWcqoZT03oC1XCxdCThj5xUAz0e1n/Gp/pPGie6ruFcuZ8
   r20HfJ9N7CtFYbWq5FQU70PjTiOJ9lLbuwn7x7LEyemRLvQZToXkUClvK
   g==;
X-CSE-ConnectionGUID: 9LJQVzwKTWWTp/byEmUZqA==
X-CSE-MsgGUID: fqp5JqKHTKymtuuHxICC4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90247552"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="90247552"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 04:13:08 -0800
X-CSE-ConnectionGUID: K2itwqXdR8a5WDW9LgYZPw==
X-CSE-MsgGUID: 63CQjMeZR761DzImy1sYWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="220091804"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 04:13:02 -0800
Date: Mon, 23 Feb 2026 14:12:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Lee Jones <lee@kernel.org>,
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
Message-ID: <aZxES35K3hSX4KEx@smile.fi.intel.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
 <aZwWMiYEvr3DXi3E@smile.fi.intel.com>
 <9dd377f6-3565-4c0c-8c98-1b5ac4982f5b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dd377f6-3565-4c0c-8c98-1b5ac4982f5b@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_041310_502404_1E02B133 
X-CRM114-Status: GOOD (  21.74  )
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

+Cc: devm-helpers maintainers/reviewers

On Mon, Feb 23, 2026 at 12:52:14PM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2026 09:56, Andy Shevchenko wrote:
> > On Mon, Feb 23, 2026 at 08:27:29AM +0100, Krzysztof Kozlowski wrote:
> >> Add a Resource-managed version of alloc_workqueue() to fix common
> >> problem of drivers mixing devm() calls with destroy_workqueue.  Such
> >> naive and discouraged driver approach leads to difficult to debug bugs
> >> when the driver:
> >>
> >> 1. Allocates workqueue in standard way and destroys it in driver
> >>    remove() callback,
> >> 2. Sets work struct with devm_work_autocancel(),
> >> 3. Registers interrupt handler with devm_request_threaded_irq().
> >>
> >> Which leads to following unbind/removal path:
> >>
> >> 1. destroy_workqueue() via driver remove(),
> >>    Any interrupt coming now would still execute the interrupt handler,
> >>    which queues work on destroyed workqueue.
> >> 2. devm_irq_release(),
> >> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
> >>
> >> devm_alloc_workqueue() has two benefits:
> >> 1. Solves above problem of mix-and-match devres and non-devres code in
> >>    driver,
> >> 2. Simplify any sane drivers which were correctly using
> >>    alloc_workqueue() + devm_add_action_or_reset().
> > 
> >>  include/linux/workqueue.h                        | 32 ++++++++++++++++++++++++
> >>  kernel/workqueue.c                               | 32 ++++++++++++++++++++++++
> > 
> > Hmm... We have devm-helpers.h. Why the new one is in workqueue.h?
> > Can we have some consistency here?
> 
> Answering with update:
> I don't think this should go to devm-helpers.h. The definition is in
> workqueue.c, thus the declaration should be in corresponding header.
> It's logical and consistent.
> 
> Otherwise, I could move it entirely - definition and declaration - to
> devm-helpers.h, but then the release (devm_destroy_workqueue()) will be
> essentially exported to everyone through the header.
> 
> So kind of conflicting choices.

Hmm... An alternative I see is more intrusive but should make it less
inconsistent: Treat the devm-helpers as devres like header for workqueue
and collect there all devm_*wq* related stuff with maybe something putting
back to / holding in the c-file.

OTOH we may leave devm_destroy_workqueue() visible for now with a comment
saying do not use, it's internal or something like that.

Hans, what would be your opinion as you IIRC is the author of devm-helpers.h?

Matti, I also Cc'ed to you, you have usually non-standard thinkig and
insightful solutions (besides being reviewer of devm-helpers).

-- 
With Best Regards,
Andy Shevchenko



