Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70803C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 01:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dtL6bOxO5qHs+QF6jriizna7ttJ8SGK3f5tUylWokY=; b=Rl7IKolSRoGaysG1vQ5mRXeyk1
	KdyiceUw/LPMuQSix5YfRj1Up6P0FikbNuAas4qYvuBH+OSeCw9h8xb/VIl7g7Y5+lrd4DS0hnRz0
	1e9LJwtUvYlf4uZxFrmfMpH12znIzy+SsOVXFgdo/OQ2m/atEDZg5aEZxwJXpDmQP4FmzitCeg5sN
	Y2h8YgLXQq8Trf0JgdeSXyOh3OImdWcNG1kj++J2GV/9ure+dOm2TeaCl5ik+ET1QGNR4Xhu6MEfd
	iY23BVTzK3VGv3ifjfJAPzmOOb/65xYzY+AQ8IuaUYuv9sS4zl9ghAAAv/AP72gBG8KrjFe8+uOQF
	bBY8W2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugYs-00000001nQx-2JWg;
	Fri, 14 Aug 2026 01:18:18 +0000
Received: from mail-m25479.xmail.ntesmail.com ([103.129.254.79])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugYp-00000001nQA-2GBA;
	Fri, 14 Aug 2026 01:18:17 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49ef6fdfd;
	Fri, 14 Aug 2026 09:18:03 +0800 (GMT+08:00)
Message-ID: <8d521014-3202-4f62-ba1a-ebe126506048@rock-chips.com>
Date: Fri, 14 Aug 2026 09:18:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rockchip: vop2: Scale the AXI clock to the
 bandwidth the mode needs
To: Igor Paunovic <royalnet026@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@flipper.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260813094614.9072-1-royalnet026@gmail.com>
 <20260813100027.349761F000E9@smtp.kernel.org>
 <20260813101307.10945-1-royalnet026@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260813101307.10945-1-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ffdd8f94d03a7kunm270703397b358
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSBpIVh5MSEJCH00eQx4aSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jy6NpMPIEbDZlGuNoX291gdYX0VQAcedLCzPYKreLEEpWtqzIYmDm0pR0//ONnM54d4pMnpnGBoyvyiHJ5BPbJ13C2dSPm2V1dB7rQI+u5nFnOKVqmuCURDhrQfFdoMoI6oh1VncTFxhFe76lXnVXqMeRS3loQA0rLwFLLGC+6o=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=3dtL6bOxO5qHs+QF6jriizna7ttJ8SGK3f5tUylWokY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_181816_131185_E498B6E0 
X-CRM114-Status: GOOD (  25.90  )
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

Hi Igor,

On 8/13/2026 6:13 PM, Igor Paunovic wrote:
> The review bot found three things on v2 and all three are right. I am
> answering rather than sending a v3 straight away, because the fix for
> the two High ones is a single change that touches a file shared by
> every Rockchip SoC, and I would rather ask about that than guess.
> 
> Both High findings come from the same shortcut. v2 keeps the
> requirement in a global atomic state object, which I still think is the
> right container, but it applies the rate from vop2_crtc_atomic_enable()
> and _disable() rather than from the commit tail:
> 
>   - Out of order commits. Two non-blocking commits on different CRTCs
>     share only the private object, and nothing orders them, so a commit
>     that took its snapshot before another CRTC raised the rate can land
>     after it and lower it again.
> 
>   - Multi-CRTC disable. atomic_disable() runs once per CRTC, and the
>     first one already sees a state in which every participating CRTC is
>     off, so the rate drops while the others are still scanning out and
>     waiting for dsp_hold_completion.
> 
> vc4 solves both of these for its core clock, and what I did was take
> half of that pattern instead of all of it:
> 
>   - vc4_atomic_commit_setup() records a pending commit per channel in
>     the private state and the next commit waits on it with
>     drm_crtc_commit_wait(). That is the ordering v2 has no equivalent
>     of.
> 
>   - vc4_atomic_commit_tail() holds max(old, new) for the length of the
>     commit and only drops to the new rate after
>     drm_atomic_helper_wait_for_flip_done(). That is exactly the window
>     the second finding describes.
> 
> Hence the question. Doing the same in rockchip means adding both
> .atomic_commit_setup and .atomic_commit_tail to
> rockchip_mode_config_helpers in rockchip_drm_fb.c, which today carries
> only .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm and is
> shared by every SoC this driver supports, VOP as well as VOP2. The
> commit tail would be a thin wrapper around the rpm helper with the
> clock work on either side of it, and both hooks would do nothing on
> anything that is not RK3588.
>

As you said, placing it in atomic_commit_tail is precisely because
atomic_flush is insufficient to handle multiple CRTC cases. 
So it's okay for me. Let's see if others have any comments. 

> Is that acceptable, or would you rather this stayed inside vop2 in some
> other shape? I am happy to write it either way, but I would rather find
> that out before than after.
> 
> The Medium finding needs no discussion: if
> drm_atomic_private_obj_init() fails, the jump to err_crtcs does not
> undo rockchip_rgb_init(). It is also new in this patch, since before it
> nothing after rockchip_rgb_init() could fail, so it is mine and it will
> be fixed in the next version whatever shape the rest takes.
> 
> Igor
> 
> 

-- 
Best, 
Chaoyi

