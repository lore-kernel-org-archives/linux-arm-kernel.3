Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D162C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khCThNJfiB4uU8Whibyw5n21yqaVaGc+0OhAI0EoB2s=; b=aQ9DSEoEkjnKN2dl9FiPUxtH5I
	VPjT63Eyaq2OctOx1bQwaGeWmmLfOL62mdgUjj+a8rulKAr1MAt52VJUh27UaG7rqk8f1J5yZJMlb
	mCG+1B1QLngISowQOKhCX8IB5R5ee7f9v0+9XYhw+NMO4vsVsZHBFFoGk8J4J/EnowhQZKnTPWpcQ
	Qdz/G/5OJuDjbKRX5PZ9KkOZdkKzRl96tNvYY8ZnQLM+MYrkOh2XlWAjTTpjoKdvwDinzvgg+Qf5T
	62X/nbiKVtecytssK/3juAmeHM1rqZ+t6/DB9cu6QhYeftNNsQCscBlYKV6AonUkD4VSHAyZufUAE
	piGeSlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDd5-000000033rt-0Xfz;
	Wed, 26 Feb 2025 09:22:59 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDA3-00000002y6s-0bSD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740559979; x=1772095979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWyxuVp5GIn2PyGiKOrfhffWXLzuRAsQpL6ER1bVxKA=;
  b=PfV5GWY+rI39VgK05ePqRE4ZQ2x51MHWnacB8jSOVAbHZWBgzD6R30JI
   h3EYF4r77dHRdpXIl1ZfsKifUqVnvpJoBYqNI6br023nrxo63MEnecn98
   lFZrcEjb4fD2GLsp8a7ZUPOAnPXYTGho13utptxZO18r8PC/osHD15elb
   p9Io9nbGnFRz7yIIO/yqyFqr8fr24h33v1oB33JluGabg+5dYa6Cp0v29
   HNWJLMOSF4BWo62NpcplfqJw/GJHv7igDYg+JnVB7iDtO7QSV1xmYaKod
   fsM3bYw2sKtd11q4fnBj+YatQ1KQF07W0FVT9H8VrzsJZEn/WL+0F04uS
   g==;
X-CSE-ConnectionGUID: lcrsyrciQPWQFs1w1uQ2Ew==
X-CSE-MsgGUID: GK0fowKdSxG0MUdp7zcXEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52389685"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52389685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:52:55 -0800
X-CSE-ConnectionGUID: Ij3kjip9SWyZdE5qJLB6Tw==
X-CSE-MsgGUID: Pr4CVODQQOSIt8dTwipeBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="117128677"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:52:52 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF9D911F944;
	Wed, 26 Feb 2025 10:52:49 +0200 (EET)
Date: Wed, 26 Feb 2025 08:52:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: i2c: imx219: Report streams using frame
 descriptors
Message-ID: <Z77WYcoV1MhWrpV3@kekkonen.localdomain>
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-6-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220230818.275262-6-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_005259_229298_20B02BF3 
X-CRM114-Status: GOOD (  13.55  )
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

Hi Cosmin,

On Fri, Feb 21, 2025 at 01:08:13AM +0200, Cosmin Tanislav wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

In addition to this, the idea has been that the set_frame_desc() could be
used to set aspects of the frame descriptor. My thinking has been that you
could modify the entries, up to the degree supported by the driver, but not
add or remove them. This should be properly documented in v4l2-subdev.h.

-- 
Regards,

Sakari Ailus

