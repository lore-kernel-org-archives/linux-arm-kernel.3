Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D739ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMfe/1pq+OlxwXSMepCY97jqsV7w44DfRMtiM5C5ElQ=; b=fvpUF3kp5NYu4Hdv6e+vcK7kps
	3i+a9ZRshR2P+nLvFp2Fd/N4UIU5WDS1MmvcYn0LmA1UbGPSK0xnDTpZMlVjFQXUVBcnmHiFZF4ku
	8RD6C9aD2kRfWB/Bgbe2FIazIyib6f1ucCzcmIlKFOd5t7ZPVJe7FWBz6X1x0aEZKb+Xz0ZSjHFP+
	3FDQeOvl7oV+4HWTbTytBxyO1k+i8/69sdUWsEbt9XNe3+qdkbfn3PzsfxUnaGMdCasvaJy3zgi+n
	I6E+yXHn4QpvYZ1z0FCQ9zqlLuqwK9eCBtbc+/5iHHKBvxFg666i968/w4A/hC2rc1IPPqXv7Ce+l
	m2PmqDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojw5-0000000E6lc-0fyT;
	Wed, 20 Aug 2025 14:37:09 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj6m-0000000DsBT-0Nmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755697448; x=1787233448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ccW4DJ+w5B0tvFfy06eJzbjKks79ZjN2ZpCdAnZH4Ak=;
  b=n+niXZTaP8gHIc5QcLpemeHcez9QOY6oX143hodzDE2oAllgKuos39xG
   usVqmk99mjLUFF4xAdX35RUjZgFYIYsH1EfuCJLCSj6LlhcA6nMlO3ZlY
   PvIwSdZtZbQSjm3fwsLRkgFK0uA83gMmDhH2UZkU891xPDXFra64By/GN
   N/DFV+NRNX2D7ZLo7JoVO3wr17FEcVTEfniwdbEKMhuPZeX+JRwWdguuA
   pYJsmxNiJTkkVI1dGuhghk0wucPYA0dDogrMZsIYAJ3y8OaZQx0XX6LBN
   RNQwSe8dxw07NU9/P4mNEry9UcEumZMrffE4FcVse/pUHcD1m/NOqDei1
   g==;
X-CSE-ConnectionGUID: /WtkIbWpSfWfoY0D2ao6rA==
X-CSE-MsgGUID: j6ixKsjQSGOrW+F3GRTtyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75413014"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="75413014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:44:07 -0700
X-CSE-ConnectionGUID: 4QaIxjvgQ0aK7kjMmX1XtQ==
X-CSE-MsgGUID: q2Qzs15iR/Wyot4b2RKPmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168481230"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:44:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uoj6a-00000006wmS-3DCw;
	Wed, 20 Aug 2025 16:43:56 +0300
Date: Wed, 20 Aug 2025 16:43:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
 <20250814183609.3788a6df@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814183609.3788a6df@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_064408_175949_29D15520 
X-CRM114-Status: GOOD (  20.48  )
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

On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
> On Wed, 6 Aug 2025 00:55:02 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:
> > > Add an equivalent of list_first_entry_or_null() to obtain the last element
> > > of a list.  
> > 
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks Andy!
> 
> However I'm not sure when and where this should be applied.
> 
> Except for this one patch, all patches in the series are for
> drm-misc-next. Also, patch 1 is currently not needed by any other
> series AFAIK.
> 
> Based on the above, is it correct to assume that the whole series can
> be applied on drm-misc-next? (when other patches will have a
> R-by/Ack-by of course)
> 
> Also, is Andy's A-by enough to apply this patch?

The list.h is common for many, I think going via DRM with my Ack is enough
based on the Git history of my changes in this file. But if you want more
reliable source, get an Ack from Andrew Morton.

-- 
With Best Regards,
Andy Shevchenko



