Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B7EF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmkRZcWCgnTFKDNVH9nVtr8QZKiG8kO+upmrrBlNbW4=; b=UsHmRDYG2LzekTAHH+ZlxHDUzH
	4r6ySJEaV9XBhww0W26gjK1xBaQV+Am2ywPvMs19YrGTJyWp6WdUqhbq+k/PWsabNmAmU4oYboJrc
	ju8rZ3MZwczrNK8ydaSBhQ9lCkn2t8yCxKDAouNezSGQwRH+e/wM1lNEtHPsMIkZFN3E8qpBR05py
	SPDtN15Vf2G/tX/fMKksCaMYfjNrJHD5vns/FcylYlLsqPudaQm5pY+QlQuVhIrqDHxdRhz/nnhRL
	cTHA9PPQktypwPsXKnc/PcgRX9/OLRK+RytlfLCDQjLbhwBOfjdgjv4Ac3kSYBE61W4UStZS1VRcN
	0f7RfnIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKRx-00000004r5R-0Yn3;
	Sat, 14 Feb 2026 18:33:01 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKRu-00000004r54-04Jl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771093978; x=1802629978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N4/bk8+svUrebupVSkwmiRPlxY1iPpvPlmx+utG0ym8=;
  b=Tms3QiiSKZNqsJH79J7mxbpX7d/8o8vh3F2gj6g5pGSiEwCQY+kmmzej
   LXo+dZL1czxKlhUtzq7JwI3S2TaTSekz97hS4otQaR3LMa9LHsi6Lwt9n
   Xx3ugpKW1fK0uyTxFXiewJLTafZjnN18RkbNfNQ5AxN7xEzAdh1B1jJH/
   eo/E8bh4znil+129Qmce6fWqncJYMHxJj1V+WL89ljyEXiVHgRx6s0ufR
   HFbR2eHiQMhpzFHITQmnXwbokz2how3mUEkoCt65mSOfL3GTtjdWBvAK0
   CG8xzuSqBF2nAcfiKqAp8wtJ2tGyYL7MYqbkwgUjp4W8zh0UcCw8yWgqU
   A==;
X-CSE-ConnectionGUID: h/IIS/q5Qhy5dh90K4odQg==
X-CSE-MsgGUID: 6aWhjm4nRKK7lbg7XRt9wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="83611133"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="83611133"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 10:32:55 -0800
X-CSE-ConnectionGUID: uF0XpDBaRImge3nwrqTBFw==
X-CSE-MsgGUID: pKmM8qGGQ8mjl0QmwYYTXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="250880493"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 10:32:52 -0800
Date: Sat, 14 Feb 2026 20:32:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aZC_0g_r3YETI4MR@smile.fi.intel.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
 <20260213-i2c-mux-v5-2-fb2cbf9979b3@gmail.com>
 <aY8JRikJpM4v5BcM@black.igk.intel.com>
 <aZBq5QGHFcQYAONv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZBq5QGHFcQYAONv@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_103258_090342_310DB94F 
X-CRM114-Status: UNSURE (   9.86  )
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

On Sat, Feb 14, 2026 at 01:30:29PM +0100, Marcus Folkesson wrote:
> On Fri, Feb 13, 2026 at 12:21:42PM +0100, Andy Shevchenko wrote:

[...]

> > > +		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
> > 
> > Why OF-centric APIs? Muxes may and do appear on other systems as well.
> > Okay, this function seems fully OF-centric :-(
> 
> :-/

Yeah, this is unfortunate, and probably in the future we can also have similar
stuff for all.

-- 
With Best Regards,
Andy Shevchenko



