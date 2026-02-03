Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D1E8B385
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYGJl9M6Oj5ps42Ajunkmicm+93ZEJYnZZHZdB0GDfY=; b=zEcc/fNx2L4KfBb/RDv/wIKXGE
	k6CmtwnuPR1bWcVodwks3UR9deqG0p6VsJJIpaWg6Q8ve73HEAzJ/HGRdgcBUBqannTB1elR8L93N
	Rm9KF5qsCzOUI5Jh6/oydZMkF0JggGK3Wtl6qNXU0fz/xMhxxOjYJ1Cs461oJbwnUS7Oy9Do+cxQy
	dmFq9dEP+CaBJJ3xEzXMWStqPBxBWva7CJGkQvCLhHBP8Wb7k9O845W/KW4XhjWT0fUtbQ5yHNVMX
	AlXo+Vn+c+IKz6hV2di3CK4wkR8Zgop74ONbFPI6D/uFT3OdrZ98N5s5COFLJKTfxoaEi0aIRe+Vl
	4rcLVtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPyS-00000007ZhX-30IJ;
	Tue, 03 Feb 2026 23:38:24 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPyP-00000007ZhC-37BR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770161902; x=1801697902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VUA7xPz2k2DqTILvSG8MJrzRqVcjkXmJKeKSnbJhE8c=;
  b=NnQBOqWxOS45NSYwDP+xhLKX29CwPGgVToFOiSqEJZhN6AtJ4WxPJAtB
   jdtcX6D2yCbW66mu+LYc4n6Sx9Q2hqLvM1yPRAIJxHNWIkXRgZ4I1h00A
   XWtIg8sluWb1s/WjO9VIjwLeM+QYNd4B2xS1pOaq7B09DD+DfFs6Iwv1K
   T2UW3kjNpk5Io5xvzO5FqAMyWbEM4R9AqVeS+oqxzG4waEC390IdkG5cT
   4W4umSHKeJItMkz12AX63MiFwSsqBawDSE9de1t/D5uQwapBAvzdvKvtA
   WYK+woEqBXuNbVT3PHbE2Nb/U/jeV7u7Klr87a2WimDX2T6z7WPFWxfSz
   Q==;
X-CSE-ConnectionGUID: 0tG3zdwYRy2VScl3qo4xMQ==
X-CSE-MsgGUID: e2mvt8/yQB6fVRrV2k6xVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71065831"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71065831"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 15:38:19 -0800
X-CSE-ConnectionGUID: u2/E/qW7S8KctZQwAD6OFA==
X-CSE-MsgGUID: Gj/xUhl9RSSVJf+5vGhJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209100278"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 15:38:17 -0800
Date: Wed, 4 Feb 2026 01:38:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 7/7] i2c: xiic: skip input clock setup on non-OF
 systems
Message-ID: <aYKG5k5-6ll_RzQz@smile.fi.intel.com>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-7-ce4695f5267d@nexthop.ai>
 <aYIYUNejGCVdekx7@smile.fi.intel.com>
 <9F7815FA-80D8-4C96-B61F-5CA6CB405F7A@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9F7815FA-80D8-4C96-B61F-5CA6CB405F7A@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_153821_878006_3DFB758C 
X-CRM114-Status: GOOD (  13.52  )
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

On Tue, Feb 03, 2026 at 10:38:51AM -0800, Abdurrahman Hussain wrote:
> > On Feb 3, 2026, at 7:46 AM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Mon, Feb 02, 2026 at 08:37:24PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> >> Currently Linux does not implement ACPI ClockInput to describe clock
> > 
> > ClockInput() resource
> > 
> >> resources, unlike DT. However the xiic driver is happy if something
> >> magically enables the clock before the driver probes, and does not
> >> turn it off again. The clock should always be considered optional for
> >> ACPI.
> 
> I just used the wording provided earlier by Andrew verbatim. But can change
> to the following if you insist:

I do not alter the wording, I correct the mention of the respective resource.
And yes, I insist.

-- 
With Best Regards,
Andy Shevchenko



