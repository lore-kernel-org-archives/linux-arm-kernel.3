Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045D0CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIdMCX/7miz3UaxuOAluByBJBcbvqPa5ytYJtMpTpqM=; b=aCas6PeQucb+bJHOgwGhZ7mOX2
	v4ZJSBBF4QiYgPClYtrDmy36M+ADL4xw7Ll4UimQ920kNvbhLv5tckhcemvXCrB95Y7UkizkxIQYS
	izDYQqe8JSVn1RZHuEITS6UAY+A+G/MOJtg1cTFvesHlshjBQsBDFR+pCjC/58hyhuyB/GcYDn3Mf
	2vPcoBUOGdFG301pEuu59abm0Qa6T8DNFy2a0OhiiSjGWa86a5/o8EuaKGc0TtHTtYDixstyql0Ls
	vAwh+mxZtLNfCzfrI28xDv90bkANxDm4JpNaYy/BXKLymYC/XB2bugxmsac5umjg0zGAXvTnnwA6X
	7mvuCkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTMc-00000000oHz-1y8t;
	Tue, 02 Sep 2025 15:56:06 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPqH-0000000H8Qv-1wTB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756815030; x=1788351030;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=EIhkVcqZh7xoh6EwQB0Ef5Yl6j+ZOHuN2tJZwCUV8XM=;
  b=mzK3rGoOlMk/7f/ZvHBKQ09aM6kx8AYRFI3t4Qr0UxOlmu3gIPU+UuZi
   51e5kapK6CVLbvNzF5929VcAkRjcbWOHcvZ9Bfx7JnHvShMuEsoIYv6Xb
   Z5ED7Tlo105WrpxG0wi/6ADeysTMCPrAfmCchFW1cx42bRybZ+PPV1W1N
   /BuERdr1qIn3hB8Q2wrHRs8umH5hpTN3SCwJ52p3uc8sgRmNkbmbsHUOb
   RAztqeHH8R2r3Q/uyLMg0PJemqwSY2dNgK116871nheH9ZWO4lnPWEBZv
   OCHGjLWvO4nGoLLeNquHF7HOUzpgaqLndjWkR2E8Nq1WPjZti2qvi6SNo
   A==;
X-CSE-ConnectionGUID: 0wLx6YrVQ6ujGwHInUWwZw==
X-CSE-MsgGUID: 6dR7jmn0QQqSnGkHRgMR3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62916789"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62916789"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:10:28 -0700
X-CSE-ConnectionGUID: sqCCoMu9QZOFalIu441odg==
X-CSE-MsgGUID: TeSFeNUGQKyxcCnu6WSKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="172104612"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.193])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:10:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
In-Reply-To: <20250902135709.19e1ef54@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com> <20250814183609.3788a6df@booty>
 <aKXRHAyfPHPpZmMs@smile.fi.intel.com> <20250902135709.19e1ef54@booty>
Date: Tue, 02 Sep 2025 15:10:14 +0300
Message-ID: <2f156cf6c57d0054c20b10f931ceef9a575d533f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051029_538745_60EEA5ED 
X-CRM114-Status: GOOD (  27.82  )
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

On Tue, 02 Sep 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Hello DRM maintainers,
>
> On Wed, 20 Aug 2025 16:43:56 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
>> On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
>> > On Wed, 6 Aug 2025 00:55:02 +0300
>> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> >   
>> > > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:  
>> > > > Add an equivalent of list_first_entry_or_null() to obtain the last element
>> > > > of a list.    
>> > > 
>> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
>> > 
>> > Thanks Andy!
>> > 
>> > However I'm not sure when and where this should be applied.
>> > 
>> > Except for this one patch, all patches in the series are for
>> > drm-misc-next. Also, patch 1 is currently not needed by any other
>> > series AFAIK.
>> > 
>> > Based on the above, is it correct to assume that the whole series can
>> > be applied on drm-misc-next? (when other patches will have a
>> > R-by/Ack-by of course)
>> > 
>> > Also, is Andy's A-by enough to apply this patch?  
>> 
>> The list.h is common for many, I think going via DRM with my Ack is enough
>> based on the Git history of my changes in this file. But if you want more
>> reliable source, get an Ack from Andrew Morton.
>
> While applying this patch with dim on drm-misc-next, dim push-branch
> failed because:
>
>   dim: ERROR: cb86408b1fc2 ("list: add list_last_entry_or_null()"): Mandatory Maintainer Acked-by missing., aborting
>
> Looking at the dim code, it is looking for a Reviewed- or Acked-by from
> people listed by `scripts/get_maintainer.pl --no-git-fallback -m --nol
> --norolestats`. but that command returns an empty string, so it will
> never allow me to push.
>
> How can I get that commit pushed to drm-misc-next?
>
> I think `dim push-branch -f` would work: am I supposed to use it?

Try 'dim -f push-branch'. The parameters after push-branch go to git,
and you don't want that.

BR,
Jani.

>
> (not sure my committer rights allow that)
>
> Luca

-- 
Jani Nikula, Intel

