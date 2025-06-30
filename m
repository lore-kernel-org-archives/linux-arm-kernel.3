Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B93C8302E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgWIHqT7HWFTTqggaQAeOkip+YQ1Fa7noLjkHylqjkA=; b=bbdYt7rm9npDdjnibzJcDW5S6z
	VIAK9gLg6gNLuTmlaxX2ddClqK+PJQKyBQAMvna41IGOKMZvTjy/zI7EENmx9clCneK6v2JhOLI3k
	A2s153RMY7xai70M56KYT8KkQwq28MBLkR+0p736EliP6AeAlI9KG2BIzzjankGeGRggnfqdSa3RA
	XeXul4+0YblmPYSrBhu8BJwEu1PGbJbXlmTWkAjBPhOK4ZWdma8t1P+c4NzyzS0fstjjq/cm+Ncpp
	FCd3wXQv4Ca4t/cdyKJBmcGXIoYAQVkEiPBkPlIxZlM6dz0QZveSe2KVLGa+l8pZ9LOnweA71UHMp
	Uz7Fn+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCA6-00000001x0X-1usW;
	Mon, 30 Jun 2025 10:54:58 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBlP-00000001tJO-49Yc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751279368; x=1782815368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c+T0z6vmgvFtL7s+LJmro6chHSYZizv5ACOfjzHN4Po=;
  b=DBpvm2F7VAHEaCjfBmOnpqRKfMRM2a8sFsOUp4hsZ4XDhm9zjUNJe94N
   QopeifDGjL599r3wlWec1XSUegIxwjY7pUcA02DdnXU9xA+YbAeX+t0fF
   PfrwicUOtnnj5mPWd5iMDNz6fSplqfe83esRBgczrcsVw3LfXR/PWjY28
   V4PmJovUt7Al9hw3EYhkyWjPhPYc9sOeBDBIaCsxU6lHwA1HSv5qmC3Wq
   iTX/RyOmAcZHOKlb8q1cj0GwIkHPnjCZc8X2WVkl7y2yWKteatulUO0vx
   bcD/UuqWhA/0Fltndp03+95V9zZrKzkpZf0AWtytGJinCyAOpKj+3DNyh
   w==;
X-CSE-ConnectionGUID: I/M8QghYT3GnoyC72+WtYA==
X-CSE-MsgGUID: vC2+K1EgRw6bGVDQMx0f/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="56121984"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="56121984"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:29:26 -0700
X-CSE-ConnectionGUID: YKnJEFZHQMafMZ8GhxSE7w==
X-CSE-MsgGUID: FZFeZ0x9TUSom137M5AEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152806613"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:29:22 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id CAC06423E2;
	Mon, 30 Jun 2025 13:29:18 +0300 (EEST)
Date: Mon, 30 Jun 2025 13:29:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v10 07/17] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <aGJm/BphvAyKDZA2@svinhufvud>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-7-54f3d4196990@ideasonboard.com>
 <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
 <20250629183547.GF6260@pendragon.ideasonboard.com>
 <aGI+y4sOlPAQMzWI@svinhufvud>
 <20250630083519.GC24861@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630083519.GC24861@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_032928_043536_14FA2769 
X-CRM114-Status: GOOD (  10.82  )
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

On Mon, Jun 30, 2025 at 11:35:19AM +0300, Laurent Pinchart wrote:
> > > > > +#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK		GENMASK(9, 8)
> > > > > +#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS		(2 << 8)
> > > > > +#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS		(1 << 8)
> > > > 
> > > > BIT() or make these unsigned.
> > > 
> > > It's a 2 bits field, BIT() isn't appropriate.
> > 
> > That leaves us with the other alternative, doesn't it?
> 
> Absolutely, although unsigned is unnecessary in this case as we're not
> approaching bit 31.

I agree with that, but what I really meant was that the pattern of using
signed integers while shifting left itself is bad. Not everyone is aware
of the problem and if we can steer them to use a different pattern, we can
avoid bugs.

-- 
Sakari Ailus

