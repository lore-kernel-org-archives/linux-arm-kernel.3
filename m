Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2946C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 21:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VN5k51y2li1dFiSa/XiXB0RMZog90x+lHlEBgkLXKmo=; b=law2pgW+fli+7kbI6h6XIxw+75
	9AVObEiKTJRb2/zXCbzEh2C/ItZkc351sGi2lXP4/ca62E0YweIZ4kc8SYcWgnXgmdIgueQ/JXkrk
	gQhPlAW0hCm7F0jySqiIKekRMGs/vvjPwMq5DNprgJh4FJn5fMt8uWDPt+hCKRFXZXvB56VR9bjRs
	Bo4eYlLkzr/6Q04bvnfEJZHV9NxmPwvphEx89Sahdxcb5nmUN5GK4lvIOaEx2xpd998TsJCMByxz+
	yBzfk7jqSrgDtpAbfQRaPy1gyRM2rI5NwyXk1YjjHr4Q0vzJhTjt56Y/6mUpQZsxyS+UJZrJVXAF7
	b+J3ogmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbwG-0000000HN9O-1UHS;
	Thu, 01 May 2025 21:59:28 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbuK-0000000HM2Z-3T3h;
	Thu, 01 May 2025 21:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746136649; x=1777672649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zWcnDLE5VTMy5WKRBj0IgzuPoGG7eGMUv76ZlXgPRDg=;
  b=i5ulbcVZgwSv/YujoyFZ05cf9At7IehOJUUE+HiCfk6sp3pnIQqs6NgY
   iCQphNS3BcILsPOoKArPCMt9Wnev6aR46XSKsGh1JEkS4Vi34V7wGeXKD
   hKIBMTOh9j93iZ4ySK8eycIXue4Wa7/Jatv9HGF/YPpQ0+4gssTomHcLm
   MEZ+LgNzAZDtPTprLWdHffZV8klrnDStfFGhFeIy7/PCk+bU3u1lgaenU
   YxK5qkyp62WphiPKU6OHCUu+tgLrikpW97cCjVOzt3p/29a4weLpIi6Q0
   nwYXJABBn5U8Ya9NnjFrnGfkxycAVu0QtwtnHbwN+GbDufQyLRRVO6GkQ
   Q==;
X-CSE-ConnectionGUID: RV8wNcJTR62OhYdwE5y35g==
X-CSE-MsgGUID: i6X0YeYdSBeylLqeHkG/8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47536276"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47536276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:57:25 -0700
X-CSE-ConnectionGUID: gQXAToqySNCoS87O/jrCWA==
X-CSE-MsgGUID: uoquiMHcSzC+zHBill9Nqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="135015910"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.38])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:57:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 49E991201E4;
	Fri,  2 May 2025 00:57:16 +0300 (EEST)
Date: Thu, 1 May 2025 21:57:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v6 07/13] media: rockchip: rkcif: add driver for mipi
 csi-2 receiver
Message-ID: <aBPuPGM-YBZo5AbI@kekkonen.localdomain>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-7-d2f5fbee1551@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v6-7-d2f5fbee1551@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_145728_905987_61F7697E 
X-CRM114-Status: UNSURE (   8.75  )
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

Hi Michael,

On Wed, Apr 30, 2025 at 11:15:56AM +0200, Michael Riesch via B4 Relay wrote:
> +	link_freq = v4l2_get_link_freq(csi_dev->source_sd->ctrl_handler, 0, 0);

Use the source pad for this, the control handler is there just for
compatibility and will be removed soon.

-- 
Sakari Ailus

