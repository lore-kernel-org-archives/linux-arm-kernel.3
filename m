Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F31BEA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHLq2sRIA9Oa0qhEIlNeL7MJz4s3RrwVavRtqq/yDvU=; b=Ywjp8fI8jb70LPdHBkVz1poUTw
	ovIsOt6RxScR+BG1cmLQCyM+gXRFIWazMdiDlxRM0Bz8CvXOQWLFjXLqsWtGvo3HuaYfpXS9H5q1J
	HqB8Let0CNT7TjX/gTUmD2Kq41Hm8a4+lOkjB1/p8gNBnZVGTfa77UvorJcYo407swV79wn4cJK6m
	I+z80vRejV20CSXcqTK1yWyg6/NutX89v8YUgR8bTLtfpDDxVsB33Z1gRCxWg2MM3b5TqJf5wP1un
	xh/MqJFyVbu6GB/a2hBfSaJL4QOXPzkMQ8gw8GrA7mMlIJTTERhYTjh9nilQZ6S79ESY/jj5qt0TT
	neVRP97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUCl-00000000By0-0Emz;
	Mon, 23 Feb 2026 11:34:23 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUCj-00000000Bxc-1Zoc;
	Mon, 23 Feb 2026 11:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771846462; x=1803382462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iDAMs2by9bj1uD5GcOuSsqTjHpLUeMUMQVPtg7eI0dY=;
  b=MZRTNCQ0Yz5fEbLTwoOFqmwRj8zjzSDg8LntklI2y0mTpCk6BVihJuSZ
   liOXGjcyGFLIXOHo/8gDu3caA6F6EjWCzCHGntSg/nOQtGM7eLa26BwbL
   FkaLaYc4AjtsnXxmP0EaPp7bwIVTO4o/e7lXDRXvIrZ40CT1F/tu6oWoQ
   W7Ac0MHMLp6X3tQcA1+Jok7PeqxOrJX4b62IPzpesxc+JbCA+eJBcL+3Z
   E9dM7QBvFiNBXYrEAAwbxqvZ4TVqLVHjH2FUvKn1pX6MyvAe7raSvTH6Z
   GK8Gt1KYXugi51ud3n5dUifvN42TJ6k0el5LDU5Q1sxQPb7/XwtzUjyBf
   w==;
X-CSE-ConnectionGUID: hbHTUx8gQk65gQynMUQXLQ==
X-CSE-MsgGUID: Pn7gFIDpR/CXpIjirvQCgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="95455007"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="95455007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:34:21 -0800
X-CSE-ConnectionGUID: uc81lelzRSaazTvmw9TItg==
X-CSE-MsgGUID: 8/jJ6qoATta4FcN19+4Fig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="246140516"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:34:15 -0800
Date: Mon, 23 Feb 2026 13:34:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <aZw7NJOhkq6DlyZA@smile.fi.intel.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
 <aZwWMiYEvr3DXi3E@smile.fi.intel.com>
 <534a9d0f-600e-4162-a48c-f9797241dacd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <534a9d0f-600e-4162-a48c-f9797241dacd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_033421_536956_A1C639D1 
X-CRM114-Status: GOOD (  17.07  )
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

On Mon, Feb 23, 2026 at 11:18:41AM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2026 09:56, Andy Shevchenko wrote:
> > On Mon, Feb 23, 2026 at 08:27:29AM +0100, Krzysztof Kozlowski wrote:

...

> >> +	ptr = devres_alloc(devm_destroy_workqueue, sizeof(*ptr), GFP_KERNEL);
> >> +	if (!ptr)
> >> +		return NULL;
> >> +
> >> +	va_start(args, max_active);
> >> +	wq = alloc_workqueue(fmt, flags, max_active, args);
> >> +	va_end(args);
> >> +	if (wq) {
> >> +		*ptr = wq;
> >> +		devres_add(dev, ptr);
> >> +	} else {
> >> +		devres_free(ptr);
> >> +	}
> > 
> > Why not using devm_add_action_or_reset()?
> 
> Where? Here? How the code would be simpler, exactly?

static void devm_workqueue(struct device *dev, void *wq)
{
	destroy_workqueue(wq);
}
...
{
	...

	va_start(args, max_active);
	wq = alloc_workqueue(fmt, flags, max_active, args);
	va_end(args);
	if (!wq)
		return NULL; // or ERR_PTR(-ENOMEM) on your choice

	ret = devm_add_action_or_reset(dev, ..., wq);
	if (ret)
		return NULL; // ERR_PTR(ret) on your choice

	return wq;
}

Compare to yours :-)

...

> >> +void devm_destroy_workqueue(struct device *dev, void *res)
> >> +{
> >> +	destroy_workqueue(*(struct workqueue_struct **)res);
> >> +}
> >> +EXPORT_SYMBOL_GPL(devm_destroy_workqueue);
> > 
> > Is this going to be used?
> 
> It is not used in this patchset, but most of devm-allocators have the
> cleanup.

-- 
With Best Regards,
Andy Shevchenko



