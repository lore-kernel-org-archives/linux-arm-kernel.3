Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D46D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7r+KOhk72oCIseNLwLS7ExpfzV3F/ZLl5NOg862qTg=; b=3TZCGWUtRxaT7OSdKZjPIuVaEW
	2kkPTQRZcDVk47lIYmOaAdgqtWQfxiV1xpLdYPF4XE7pPxD9a5T1LRpId+vYNWx7gg12IxA/pHswG
	Ob2KkNVhd9pxuPNbzfFOH9hukyuDr0CT2T7EN2Dn9YAE4xIJIb2+1vjPibmKJoZEH+erxxg4QiWJJ
	ktp8da10vX6Y0wAWsUBpoikkYg7AmazMBGwg1KStUfb58PsuIFeBLMb4E98dIxD45wm2ZzOUzDC7U
	A89GTxkLj0jleYS1BbK6dkpTChKgBoGoVAxZ7WEX5f1vpz+LTPbM5mu6d/dOJAP2typjX95ucmj9M
	CvULGDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvJU-00000000hfM-3CYW;
	Thu, 08 Jan 2026 19:04:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvJS-00000000heJ-0cjn;
	Thu, 08 Jan 2026 19:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+7r+KOhk72oCIseNLwLS7ExpfzV3F/ZLl5NOg862qTg=; b=zO5tlMjczGyTg0YSiQbS5bt1au
	2jmpmWf5Bp/oN9GoydHgaDg0QTWmkUfgrVCV4zTAYcaEtx6ogrGb9ErpB32FM+bacHalQnUXqRbah
	jn0D2wjN3KuWG+0GEfgUtHfeDUSWWUV037qYLYJXWmZERmjUXY2oo4fMyxv6Eb3e1qfauz59SaNmP
	LJ0CXicMCAeQ1VKhvVYujcCkIBBdUxJcfBa7CvWqBAD+hWrHqrIcXNAmkYiVBRys0LFLLcCEyCzXC
	liYhqVadFMqIv2M6W1F+LUB3STjT+nUve34TeXvg47fMEDzUoRtOQtVa3WfRX7MdIpKUJO1q1y5KD
	acUCol9g==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdvJI-001XT5-So; Thu, 08 Jan 2026 20:04:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	David Laight <david.laight.linux@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Stone <daniels@collabora.com>,
	kernel@collabora.com
Subject: Re: [PATCH v5 0/8] drm/rockchip: No more post-atomic_check fixups
Date: Thu,  8 Jan 2026 20:04:37 +0100
Message-ID: <176789904481.3303270.4157084512307461486.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
References: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_110450_187271_3860B83A 
X-CRM114-Status: GOOD (  23.25  )
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


On Mon, 15 Dec 2025 15:09:16 +0100, Nicolas Frattaroli wrote:
> I'm taking over this series to get it across the finish line. Original
> cover letter from Daniel Stone on v1:
> 
> > Hi,
> > This series is a pretty small and consistent one for VOP2. The atomic
> > uAPI very clearly specifies that drivers should either do what userspace
> > requested (on a successful commit), or fail atomic_check if it is not
> > for any reason possible to do what userspace requested.
> >
> > VOP2 is unfortunately littered with a bunch of cases where it will apply
> > fixups after atomic_check - doing something different to what userspace
> > requested, e.g. clipping or aligning regions - or throw error messages
> > into the log when userspace does request a condition which can't be met.
> >
> > Doing something different to what was requested is bad because it
> > results in unexpected visual output which can look like artifacts.
> > Throwing errors into the log is bad because generic userspace will
> > reasonably attempt to try any configuration it can. For example,
> > throwing an error message on a plane not being aligned to a 16 pixel
> > boundary can result in 15 frames' worth of error output in the log when
> > a window is being animated across a screen.
> >
> > This series removes all post-check fixups - failing the check if the
> > configuration cannot be applied - and also demotes all messages about
> > unsupported configurations to DEBUG_KMS.
> >
> > Cheers,
> > Daniel
> 
> [...]

Applied, thanks!

[1/8] drm/rockchip: vop2: Switch impossible format conditional to WARN_ON
      commit: 78de5d28d7207f816565fa43ec44e6735c319ddf
[2/8] drm/rockchip: vop2: Switch impossible pos conditional to WARN_ON
      commit: 2f4e3f2bef45d1eb4d8204c5f204cf274e8a6ca6
[3/8] drm/rockchip: vop2: Fix Esmart test condition
      commit: f403945d240417761d404cb1ce8fa2c1ec02daf5
[4/8] drm/rockchip: vop2: Enforce scaling workaround in plane_check
      commit: dfb673c71fc0039a6495731d0c0fcefa8a97541d
[5/8] drm/rockchip: vop2: Enforce AFBC source alignment in plane_check
      commit: 8cdd4d858d7aaeb583ae2b4e5a0378936b18f0f0
[6/8] drm/rockchip: vop2: Enforce AFBC transform stride align in plane_check
      commit: 081676de4a22341a877ce81c4d5364737d167859
[7/8] drm/rockchip: vop2: Use drm_is_afbc helper function
      commit: c8c85c0a7fc2a545749da1ab8dc866de025c2314
[8/8] drm/rockchip: vop2: Simplify format_mod_supported
      commit: 28c2490458ca935b2d793ec0e6c22265855255a2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

