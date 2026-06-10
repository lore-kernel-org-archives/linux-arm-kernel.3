Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB5ACD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAJDDg6sLdLKDB7ztOgob1tvyndYDuO7ML5xQQkViGg=; b=mUlsVvHim5QG4YU3RT9FXtsE/y
	HLFGjNryBJL4aj+REMAt68CGR1BL8CAtECR9TrWaZ+T18CdJn3rxPaF/jQnmfpY84VAakxIlbMC7u
	hS+FOC5CvzU8qUpIRyMod4RtcmjXpwYvCwj5hVMhoZvkjfsuu1mO7UKhlvjORQy11kkoSwGKXo9j6
	i2jPUrDTq7JovyiZRcNfjiNZBfM3rKBJ4fA1h9CPcKYZvApGBwn3B6Zs71lYZHVXk5boBZ9LiRU0v
	o1Ql5hHMGLk6kwQqZAv4YrVrkZX651Gm50/nd9YHlwhjKVkNMUCzbyzDrkWRTeuOssbA6FVyTwOWh
	kxs34/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHWB-00000007ZnD-1Yvz;
	Wed, 10 Jun 2026 11:54:47 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHW8-00000007ZmL-46Ui;
	Wed, 10 Jun 2026 11:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781092485; x=1812628485;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=IBdSvbniv45jCKX2cc9fNGt2KfPPluvYcMxmenPPBM0=;
  b=a8m9eQ+PQeVhlZTCMjGLPcA2Y9U2Aw912dTp4B+8MOslLy51AuWkbKtU
   MBow95YbLgz+BaMoPWLBeB7YmLCbYg1wbbfOVynoBb84fkXCanK+SIJfr
   XGasThfEMrSvY/sDXk4w7zw+rn29XUHFEpqVtkGYWFBug1XM4P0jjJpHU
   1JShHhInuxRKbxhmAs6R7cnNKx21NcO1R90rPZwEm5xPK+bs77TnyeWkS
   3UvzjdUJQrBQ1FaqMokDLsZllB0zyEBHZ0hGkEHfR6sUN5gGjrTgM7AC+
   alGy5IvFrcbRAhaGiSNLEjkHq+OUHzx4xv4KYo/zD7jm58rrRv6sF3WkE
   A==;
X-CSE-ConnectionGUID: fv3yDIPSQtiAKeRLygFznQ==
X-CSE-MsgGUID: Yz7DSu7XT0yE/+mQ1DWYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81789863"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81789863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:54:44 -0700
X-CSE-ConnectionGUID: YLk1Sbj9TlyqNzCagqc0RQ==
X-CSE-MsgGUID: /M4SHBnES7ybbKKuTAV9eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250439091"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:54:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Daniel Stone
 <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v17 21/28] drm/tests: bridge: Add KUnit tests for bridge
 chain format selection
In-Reply-To: <gnicb4WkT1S4aQIC2G_naw@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
 <20260609-color-format-v17-21-35739b5782cc@collabora.com>
 <04ff70850213ae0f75486b1a27a7edb6fb4e71c3@intel.com>
 <gnicb4WkT1S4aQIC2G_naw@collabora.com>
Date: Wed, 10 Jun 2026 14:54:29 +0300
Message-ID: <596f0f063d6ef2ffb4c6640e3df5ed89d95b11dd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_045445_055387_D62A671B 
X-CRM114-Status: GOOD (  10.27  )
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

On Wed, 10 Jun 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> If you don't want __maybe_unused, then sure, I'll move them into a new
> .c file. Though I think the two are roughly equivalent in that I don't
> think anyone is really trying to minimise the size of their KUnit
> binaries.

I think placing arrays in headers is bad practice, and we shouldn't set
that example, kunit or not.

> I'll send a patch to move them to a .c

Thanks.

BR,
Jani.


-- 
Jani Nikula, Intel

