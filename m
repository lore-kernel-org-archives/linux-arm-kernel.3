Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C803AEA4FB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4bh72v5m6X/XaG2RYQluknFFsA4hUGepe0h7ZA9nfI=; b=oWFGktqqCuNURKw0EG17szK5eI
	suYuDun0wAfOo+7tv9k8sIuvEp6kCvRNU1DMilpbkERUDWWQ0xY26OBId16rSpO3Pk2GKQera7tWW
	P6Xp/JwHPQvJoGsqN1eTfh7XBXkwfU96tDPqioqlpzQalDoF0cXDbEsnbeJ7vPkVR4DqR1ET7gwX8
	A2qgttatq09wqOj5aWrJjFXWYc4ZXDWqzaxaRNYFg2yb7wmC4MDNUEWmCQTExSEzXhW31nVVOaim5
	PEA3Q0SDtDp1qOKlCGjo0FO19QK6qvFtPvLqBAAauWNL+KLxyc/OWtcMqeKNs/iLaNTucHByaIR3B
	Gt2T+rLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUQu-00000000DTj-01Mk;
	Mon, 23 Feb 2026 11:49:00 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUQq-00000000DTI-0gHE;
	Mon, 23 Feb 2026 11:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771847336; x=1803383336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M88SYq6Q+APDm889xmB2pur2+3zyfmnqVy+OHhkNYfA=;
  b=VwnbndlagNCZGtE0uTIdjTO7gE3dqrDU/74r8F5rzwzxM7ui6gzzMi0x
   p/mzwxDr4PGogHBzQS7FJ7DZhlQxEIgZfwH3JFezbKBGi1p6ZPBhpibYr
   6U+RSkX7awG52ZFo4WGcuy0/IbirWnoesmdoazQYEO17n7svn8gCuXK04
   5l4KZVDJikwr91pdvSvZ/EFek6lrbA+NywHKWlibwsNhq3LO76nOOhh5E
   zbUitCU7z/drHXZaI5/3zlxaNulK8SRiVhssEE3S53cgV16hlVYnV1ARB
   YEwbb9ib/SvWyAcI7mAQsw/zNLvtkSQDAvbyJTNPfEkXFNauksp/xIrz6
   A==;
X-CSE-ConnectionGUID: 32ZW2AenTWSzDWRiNH20uQ==
X-CSE-MsgGUID: npEryWXjTAqPdaKhmrbM/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72817839"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72817839"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:48:53 -0800
X-CSE-ConnectionGUID: rOo1Ih6ERIe7QfxvtUCToQ==
X-CSE-MsgGUID: ch/fVF9uSQK1lIAFQdR+gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="220535346"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:48:48 -0800
Date: Mon, 23 Feb 2026 13:48:45 +0200
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
Message-ID: <aZw-nTtz9WzWHzUh@smile.fi.intel.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
 <aZwWMiYEvr3DXi3E@smile.fi.intel.com>
 <534a9d0f-600e-4162-a48c-f9797241dacd@kernel.org>
 <aZw7NJOhkq6DlyZA@smile.fi.intel.com>
 <2a15919b-6473-49c5-b409-07e63b13d2a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a15919b-6473-49c5-b409-07e63b13d2a6@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_034856_268342_8402E40C 
X-CRM114-Status: GOOD (  14.81  )
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

On Mon, Feb 23, 2026 at 12:43:42PM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2026 12:34, Andy Shevchenko wrote:
> > On Mon, Feb 23, 2026 at 11:18:41AM +0100, Krzysztof Kozlowski wrote:
> >> On 23/02/2026 09:56, Andy Shevchenko wrote:
> >>> On Mon, Feb 23, 2026 at 08:27:29AM +0100, Krzysztof Kozlowski wrote:

...

> >>>> +	ptr = devres_alloc(devm_destroy_workqueue, sizeof(*ptr), GFP_KERNEL);
> >>>> +	if (!ptr)
> >>>> +		return NULL;
> >>>> +
> >>>> +	va_start(args, max_active);
> >>>> +	wq = alloc_workqueue(fmt, flags, max_active, args);
> >>>> +	va_end(args);
> >>>> +	if (wq) {
> >>>> +		*ptr = wq;
> >>>> +		devres_add(dev, ptr);
> >>>> +	} else {
> >>>> +		devres_free(ptr);
> >>>> +	}
> >>>
> >>> Why not using devm_add_action_or_reset()?
> >>
> >> Where? Here? How the code would be simpler, exactly?
> > 
> > static void devm_workqueue_release(void *wq)
> > {
> > 	destroy_workqueue(wq);
> > }
> > ...
> > {
> > 	...
> > 
> > 	va_start(args, max_active);
> > 	wq = alloc_workqueue(fmt, flags, max_active, args);
> > 	va_end(args);
> > 	if (!wq)
> > 		return NULL; // or ERR_PTR(-ENOMEM) on your choice
> > 
> > 	ret = devm_add_action_or_reset(dev, devm_workqueue_release, wq);
> > 	if (ret)
> > 		return NULL; // ERR_PTR(ret) on your choice
> > 
> > 	return wq;
> > }
> > 
> > Compare to yours :-)
> 
> Ah, so dropping the devres_alloc()? Yeah, that would be simpler.

Yep! The side effect is dropping that ugly casting in _release() along with
unused dev.

-- 
With Best Regards,
Andy Shevchenko



