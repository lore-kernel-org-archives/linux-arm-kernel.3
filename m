Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBB5D12683
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByW08ySkPEAjMOPrL9vkTGYx/BAnS4D/BIPWSkRdVSY=; b=fUBt8ZHJjX7l8sEzVvao1B1jh+
	d1PiJImf11YHbhv4pbUxIH5N7G7Ct/+rg+dq3c40PVg2fMW6ObDKzBpIYh223F6ciVFQFWR8j7y8L
	31DQPEK6HsBFZ4msTc8tJGkxjBVnT+/HTKagaNxgGA4cPbMkvnzeGsD+jfIrZDdDCvzJexR3W54Oo
	J0tbzxl+bQlDNkumTU+aYQcRSfVaqd4Oop06wrX0IJEQainLOWsUrhd46ELQijwCIcMyQFB9lGglr
	MIbQVOzw4sapfzP9WzfTLJRmTW+iyW1f2RL8o7/tVb0+teexH7Q6qn+Xzki+nwJfmmclJGZSEsc8E
	l85gGhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HEL-0000000Gjr6-04Cv;
	Tue, 05 Nov 2024 10:56:13 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HBR-0000000Gj9K-0XfU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730803993; x=1762339993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVvcpQ5F/M9q98s+qccoETOvBMw6mTVjp58jf47uN90=;
  b=gBlk8Hf3U8O3ABIu9XeNFqo2qwLPokFbP1+EVPg0TaLQQMFJUNh65xfe
   YKBcquJvnJfJnxWCf+qiJ1V7xdsIrgYCVn6tQVWYrG2VAmX8c8Js70KZ1
   aKvqHip5jpWP3QOLcK7ABn7+iFxNcfG4dGFDGsoo2YI9YApDok8YUfWhK
   0iDOJM8PdhBBIQAA1ltJ6rQif4tsxR9npuaq+YbMkSj9D+SD9fEmPCW3L
   d/xOBU+mAJoVDdfadkZG1qetLzhUYqzwshsjCBwZEmS0fCPOZGMgaHvJn
   wK6vzBzAXnZuPYRAVX8VOo373u1FPaz/BugcTe7oSaHRY5U6rtFSwJm0p
   g==;
X-CSE-ConnectionGUID: ZP0ZeE0/SvqZz2Ns+4UrAA==
X-CSE-MsgGUID: 411riTKhRDSQr6RRqe6Gjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30653528"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30653528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:53:11 -0800
X-CSE-ConnectionGUID: h4i639knRvOKyDrJl0aW8w==
X-CSE-MsgGUID: dV0VB4bERsKTIxQsQJPO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88741763"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:53:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F131411F9C3;
	Tue,  5 Nov 2024 12:52:58 +0200 (EET)
Date: Tue, 5 Nov 2024 10:52:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
	nfraprado@collabora.com, thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org,
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 04/13] media: uapi: Add
 MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Message-ID: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-5-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_025313_237498_BDC28B12 
X-CRM114-Status: UNSURE (   8.00  )
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

Hi Ying,

On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> Add two media bus formats that identify 30-bit RGB pixels transmitted
> by a LVDS link with five differential data pairs, serialized into 7
> time slots, using standard SPWG/VESA or JEIDA data mapping.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

It's fine to merge this via another tree, too.

-- 
Regards,

Sakari Ailus

