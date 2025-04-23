Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870D6C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14ZqHQPZMVfQlPcnLTBveA7LAsUS1zFKePSiP6uAia8=; b=YLFdWRcJy2T1SFqfy4JAmH1S8j
	XMpSWmosQJZMjPZdPXBGZP+oY2goAB0pEmZN159+21MD28J+IfCyjtGmnknqTOH9sLypENtLqO4D0
	ZbT7mWdiZA9pqClF9jQnVauycsgzUSOEn07PZb0M53AAQOqET1EqldWbTsHlvKeH85R7cuDfz/DGZ
	O9hwK0NEkvAMFPmRLOEZo0XkzSW3fVe5GqcgPU5/0Yg0qTnTSuHrv2dUELglClqPR1mot6LymL7/D
	2W+17yLDdCEE3zJwTar/m5pz9npVxptUiEfjsYwvDzsk67Swhkwb7f7SAr3VxpcIuRtL0WyUiTF/v
	/jmOCctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7V1Y-00000009bkY-3XND;
	Wed, 23 Apr 2025 08:00:04 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UWt-00000009W6R-16AM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745393303; x=1776929303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wTnwK7o8uegywRLEmUdj8ibpoPv/EFkeYiSplsAtMI=;
  b=UxhCTxsBXhXsbM1tsNLGCiKT7BBpXxImB/YovZxVPsSiaz878l30DUQj
   f9tE9+BHGAo4D8D4UEe9t9BRNJN+Eh0o17MxKBXvTQbFXSho9Ze2pV3Gy
   ptosh4j3hxBYacT6pZ8ZTW/ACs/DYOiSs71gOBc+OX2Gm0LOnk1+6h2M/
   n/Fn2xlgQX9+HXrSnYLHvjV4rTIBeQConEUaqAr6gP29rCwWX9tHOOaZU
   vUGlqRibQKjDP00s8s5nUOwU5MYKEKbF36cudc000pRcubuQl4ZdogyU6
   QlNTgyU5oo9aPN3jLamr/u14nXkABxteVR+d5jQ2oqjYwdr9Elnj7JVhA
   g==;
X-CSE-ConnectionGUID: j7eVRbbCSG+YAAgALq73DA==
X-CSE-MsgGUID: kgIKysFUQoi+0N1OApolnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47072324"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47072324"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:28:21 -0700
X-CSE-ConnectionGUID: gMtjzeN7RMKoxzuh9aGefQ==
X-CSE-MsgGUID: WX3s9Va4SCKJaRqAFfR4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137314255"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:28:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4648411FC44;
	Wed, 23 Apr 2025 10:28:15 +0300 (EEST)
Date: Wed, 23 Apr 2025 07:28:15 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 08/12] gpio: ljca: use new line value setter callbacks
Message-ID: <aAiWj7QFQMtzjLww@kekkonen.localdomain>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-8-b22245cde81a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-8-b22245cde81a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_002823_354793_C13FA5BB 
X-CRM114-Status: UNSURE (   8.22  )
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

On Wed, Apr 23, 2025 at 09:15:10AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks, Bartosz!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

