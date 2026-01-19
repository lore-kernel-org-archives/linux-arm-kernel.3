Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097A7D29C27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQv1Bt+G0WvcxIzZAxYj6/Y3EZBw/e5lmYGYAAkBhgs=; b=hXCc0QLNfN9HPNNhoTguuC/lBs
	PRzP2kC4Q9fCZ7tbvn0Oo7d4R8WILV039Q1VcdsjLsMIeLXUURAjbQwAjsoyv2cHcuoriFw4QeMto
	bVE+2Uy7VTcnVhArsJhzyTAaniXg666HajEcWOYAouP5CsQP7H83mFtgwqD5tYwqaU2Hp9Udvlc4z
	nW4MkacM0G3pYMVuELiM7rvhE6qPylzdViwsl/NyYLQSkuf1R52Pji+KhZqt9VBtQOODdRkE+P4Xs
	nJVaruq8ovV2grtlgaw03NwBaqWMWKKhmqPnpvgm6BYEWO8m4KjSzVNDvK3uPq0oi04Rm94puIt3q
	Sv7kApmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp2C-000000028bc-35R4;
	Mon, 19 Jan 2026 13:11:08 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp1i-000000028ZI-0gZi;
	Mon, 19 Jan 2026 13:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768828238; x=1800364238;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=aUXeE8chL4wN6frCncEOZhkvGcfHvgnI/l4mL6mm1mU=;
  b=Cux/pO+I2BzJfABLuzNaPLdz7WGwMNwXvP2b+4UScGUPnhFp4ZIWv+ag
   IIbz7jtcIqJ1lOSPhbUve9zHV89ZIQBlM6YJqhNWU8CGHSwPC0qWY9jTd
   J0aRMd7bc+3btpaOrWpR4hZX1jHcDTX/6uHXyRSeZrwh+YT7XHAqdrLbo
   kmtAKeOM/J+b8qyMIOQXXgjApNpKw2h/a3hkJ1jHl40sHHin8/y+AXNM3
   rJLxCzhzXa48TS3hlTnF1AaE+Eu9AzbUrRbryoz7GQqe4rAxb6HAzh8r7
   +e4oovG08rlBo7vDieKUtuLKrqok7AJygSoMg9SLpAVEo2/BLdv1kuTkK
   Q==;
X-CSE-ConnectionGUID: bb4h+/r9QoetODSRGVBQlQ==
X-CSE-MsgGUID: ZEQp+xjnRg6whVi+yYFJ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="92707770"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="92707770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:10:36 -0800
X-CSE-ConnectionGUID: rMJSlhZAQa+O5hVQha3jIw==
X-CSE-MsgGUID: e/WXSfj9TQWN8Yd2qyFdig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206123498"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.12])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:10:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maxime Ripard
 <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jessica Zhang
 <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Neil Armstrong
 <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, Sean Paul
 <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
In-Reply-To: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
 <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
Date: Mon, 19 Jan 2026 15:10:21 +0200
Message-ID: <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_051038_268890_7CCC14A3 
X-CRM114-Status: GOOD (  13.86  )
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

On Mon, 19 Jan 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
>> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
>> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
>> > unsupported doesn't result in a commit error. Also check that HDR and
>> > Audio InfoFrames are not triggered if corresponding features are not
>> > enabled.
>> > 
>> > 
>> > [ ... ]
>> 
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> Thanks for all the discussions and the reviews!

Your commit ca59e33f5a1f ("drm/atomic: add max_size check to
drm_property_replace_blob_from_id()") added a new parameter and this
commit 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
still uses the old number of parameters, breaking the build.

When applying patches, please make sure to build the code before
pushing.


Thanks,
Jani.


-- 
Jani Nikula, Intel

