Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782ECCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3uaRl/Ti7bLDJ7dnfINDgvy8C+r51xSLwadSiE7s3w=; b=X9PQ0S1YqRUbzgk6JyO9BuGmA1
	Yb517+CWTlhRRRf1OWuj4F+dBsZmPy/P0noLUA+B4SCDNxr9MaebOO3+cwJYaSVg9wKHBxKyTUxna
	JBWkeLCXTz81wr1M9OTfiWnfRQ0X0COxhan/3UD+tfOBuK0YhK+AFG29pBxfRtZ9VbPqA0efOH4mw
	Cx6VteDS0lGuH6uOHDFPydzVvFsSHiW/yZM2YBMPykrFQJ0lZT8Tu8R3+5Bn/NrxMOZIasE/UGaVq
	vCdeQnvfCdhetU9gg/P366jOrTRg1GnfsjHhnU3ZGSoiFI6hzgGStrC+O1BKXgODOeFtVrqHA0QQ1
	t0WdhE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzp4-000000073uo-0x4f;
	Wed, 30 Sep 2026 19:18:34 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzp2-000000073uB-066b;
	Wed, 30 Sep 2026 19:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790795912; x=1822331912;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CyGtyCPmNZniFcfDSReMKCTj4N1SwBDzJ2xIa3sj7uI=;
  b=C8hjNpLd6d810/Fis7Z1RjIYHWKirg7FQ5inN55qYa8vdNdtuFRkOSmi
   yHH9YgHine2bwuSrN549AIh+YVhjwnd3/dy9Lv2e8TvyHlolxYR9TOx8C
   nBF6FQ3jiFTwvvcX7NOr8uKBM7lAsbAeWMOzK1yZ/j67xiXsKnx7jCbYr
   MwgzszSeZGoifO2Y2jIm07W7ghYwmNvvWocuEFQkCACnWHbLSG1kQDorL
   regOJ9Ojgx/iS/tG9Lm2RaA5zFRQBWswDc9jHYR646L4U3AjZPqpKUc4o
   nft/7Owt/2MrU7ZY86aDSnpl2uMgkVUO0FG/45/JuT+Tby4ODRTGT0EAi
   w==;
X-CSE-ConnectionGUID: DrM37d2ET7i7QkmHlxcI0A==
X-CSE-MsgGUID: ODEWA5BZToSuwKaHhZHc/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102218498"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="102218498"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 12:18:30 -0700
X-CSE-ConnectionGUID: BLsley0fRryRnafxe2muKg==
X-CSE-MsgGUID: 955Bc4nlQZCMiHe1JN9npQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275320575"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 12:18:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Benjamin Tissoires
 <bentiss@kernel.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <6c581ae0-2480-47a2-b46e-97afadbc7c1f@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
 <6c581ae0-2480-47a2-b46e-97afadbc7c1f@linaro.org>
Date: Wed, 30 Sep 2026 22:18:21 +0300
Message-ID: <5617389e496cf14a48efb9026b6d19a0fa37e568@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_121832_102306_B5818B31 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, 30 Sep 2026, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Yes we could have a similar panel-simple but with init tables, but
> in reality those panels offers much more features we don't handle because
> the DDIC vendors and panel integrators just don't care exposing those
> features, but they get handled by vendor implementation like for Phones.

...

> I don't think we want this, downstream vendors does that and we don't want
> to go there.

I think those are fair points.

BR,
Jani.


-- 
Jani Nikula, Intel

