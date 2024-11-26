Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38D0D59D90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CZcWq+xke43NVtWf3QLiwaFqI+VfqIzgO8JTr3rwz4=; b=OGNGy8r702AiFs9Xrrr9W+0x5z
	bwRI6T7K7eRNc84mEO8Oh9LZDN0XvE2SJcnSq2C1QRxZYxKXaeD2u2NLudasx+VHsrNBAg48KrSYD
	cqBfDSg4F+DB1eRbq/ifwmI4GF5ON2sVaJCVXqGBzInI/ZLpBFdJbs+iQ21EbrMuUjPRxpLD+rn2m
	ySO67Yq3524kDtQRJBo94f6InPN+7fhKVlhc+d26lTXPP4zlQVtb0FkH/Ess6SEGe50kKmxCYNvxE
	eNCAId7NDdBuqibE9I25DLJukdN0MZowfAGPSNEzV6S2hNq+4MsdjGNkSF0hZCc8EcS4ZiX/LSFOd
	EbGLIX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFseV-0000000AHYI-2NDu;
	Tue, 26 Nov 2024 10:18:39 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFscj-0000000AHBS-1og1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732616209; x=1764152209;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=G6ISiKyYNdfCX1O1jSv9YCVzyH3xaVsB7/c5w8mAdLM=;
  b=bGGnnFgPB4hH3jtK3yMNUFaeHicF+hQlp34dcjASUc9oAEw8xuslY72v
   8WR/JunWUrMFEzLUgdfAaW5IdAUbHzdFE+KnMwqZw0RF2LaWbghfxxLEI
   zOj5l7tq3eGo4bRVbjzv5d2XQXm6pXYs6k4h3MkBBRo0sLBqsm5l7u/Td
   ruqM6lvmmuYIoPzHOjkBTMxL2lyrYVHAs9nedy3/VoRfN6N1vj3L8Vz/m
   n9oOO7VuKB/EQ9+6mWo0FL9vA7wnfK025I60JeMy2c/TKal9q2Z5ykFYT
   f+K4fYhpDQbpE967/3+GeTczp59245HPHBr2z4/UYRRm+Q9JQ+WwRoVqB
   Q==;
X-CSE-ConnectionGUID: 7txuEtjyTre4T8kJi4LASA==
X-CSE-MsgGUID: fHcbkrxSQ5KyHi2cPNXkUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36428244"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="36428244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 02:16:43 -0800
X-CSE-ConnectionGUID: UPr7mqOHTa+cmtoDfqjH7w==
X-CSE-MsgGUID: 1LK8FOPvQtWU825GVRcwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="91511370"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.49])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 02:16:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
In-Reply-To: <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
Date: Tue, 26 Nov 2024 12:16:34 +0200
Message-ID: <874j3uxptp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_021649_511873_998D4161 
X-CRM114-Status: GOOD (  10.55  )
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

On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> I wonder about the naming though (and prototype). I doesn't really
> validates a mode, but rather makes sure that a given rate is a good
> approximation of a pixel clock. So maybe something like
> drm_mode_check_pixel_clock?

Quoting myself from a few weeks back:

"""
Random programming thought of the day: "check" is generally a terrible
word in a function name.

Checking stuff is great, but what do you expect to happen if the check
passes/fails? Do you expect the function to return on fail, or throw an
exception? Or just log about it? If you return a value, what should the
return value mean? It's hard to know without looking it up.

Prefer predicates instead, is_stuff_okay() is better than
check_stuff(). Or assert_stuff() if you don't return on failures.
"""


BR,
Jani.


-- 
Jani Nikula, Intel

