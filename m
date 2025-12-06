Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5C4D3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hMd2qjLx7cglllnLbc3H8d4IjTaB84wHOVz7jbKnT/M=; b=TdarLddGVSI+id
	GKyYZ+TWIU7ptThRMy2tANzkF0i4qs/sxGAuon92H7TqGEO3NqJ3tmVkt883LDc8CpKhsqrIWonfC
	02S7tR1ZTWl9gQDvI6oecT8RSXJzHA0sNm2Vs6hGexQoG3hmttMs4TpWXT7/YegBSap9CY6kZa01x
	E8hgcCIUlFdqe+H/MQZe8gsqcUA9mVtQqYbPKWHiZBpzGcEiNi0/teFJl+ViitLIsNeA7ONyyUSLU
	kzdbx5u0rkemMxXgZ4i+ZJeWZgrc4qY9NbOHZ0WL7tbFFUagc8QOm+NoyxyiCfAkH4Pgb5QwxJ53k
	4/Vo/NE4hNti+GN1IiBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAK-0000000BDA8-481K;
	Sat, 06 Dec 2025 20:46:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAG-0000000BD8R-41oW;
	Sat, 06 Dec 2025 20:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053938; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=McpnMZ3g6srBKJX4QgtATUGJs8usElb7WQXSX4d0PNk3hKEUCfqbx9z0CgIBEUEwTTXUIbYYJmmb303szDLbPoywWs2bJnFfvN0jn8EpK/p+qdn3sHZzt0+bNYYuJ1/47XBGNyTlnFvRjP6xbVDVYQihJy6wPVPS2O63sSamiqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053938; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hMd2qjLx7cglllnLbc3H8d4IjTaB84wHOVz7jbKnT/M=; 
	b=Sf+Bsujg2eBZkSXAJkUKv1KNS2AwCO6va9s9y2sH3LA/5JdCbN1XtWzVPxFqdzoBc3U+8b5FK52M49aba0uPHjw83vgezH0jgLi/VfCj0V0surBBIc393B1MrGoSIIIAvewdihSRr+j6shsxW9QmYtA24L3ADApoGQDxezWZLtc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053938;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=hMd2qjLx7cglllnLbc3H8d4IjTaB84wHOVz7jbKnT/M=;
	b=WTbea3rcl/gTKZdT42njcEBec62chKv1Q4pLIZDaKZ+/VYgkeD5yAN92/qL+x/FY
	AxaM6x+QbnLya1gm66sXuetG11y1s4mb1My7RrTd+rUESrI722LlswAF3CBj8/rXwjy
	gfU/+Ot7CtvlokS/MnJmmaPRmpF7W60DigZATHU8=
Received: by mx.zohomail.com with SMTPS id 1765053938276420.2919722066067;
	Sat, 6 Dec 2025 12:45:38 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/8] drm/rockchip: No more post-atomic_check fixups
Date: Sat, 06 Dec 2025 21:45:10 +0100
Message-Id: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANaVNGkC/y2Myw6CMBBFf6WZtZOMNTXIrxgWtQw6iz5sCyEh/
 DuNuDz35pwNCmfhAr3aIPMiRWJooC8K3MeGN6OMjUGTNldNd1xi0mhr9OJwknVOBcndiOnR0dQ
 ZaGLK3J5f9DmcnPk7t3Y9R3jZwuii91J7FXit+O8bGPb9AIv6YpqVAAAA
X-Change-ID: 20251206-vop2-atomic-fixups-0c30e0980f85
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_124601_044883_C162E5D4 
X-CRM114-Status: GOOD (  18.92  )
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

I'm taking over this series to get it across the finish line. Original
cover letter from Daniel Stone on v1:

> Hi,
> This series is a pretty small and consistent one for VOP2. The atomic
> uAPI very clearly specifies that drivers should either do what userspace
> requested (on a successful commit), or fail atomic_check if it is not
> for any reason possible to do what userspace requested.
> 
> VOP2 is unfortunately littered with a bunch of cases where it will apply
> fixups after atomic_check - doing something different to what userspace
> requested, e.g. clipping or aligning regions - or throw error messages
> into the log when userspace does request a condition which can't be met.
> 
> Doing something different to what was requested is bad because it
> results in unexpected visual output which can look like artifacts.
> Throwing errors into the log is bad because generic userspace will
> reasonably attempt to try any configuration it can. For example,
> throwing an error message on a plane not being aligned to a 16 pixel
> boundary can result in 15 frames' worth of error output in the log when
> a window is being animated across a screen.
> 
> This series removes all post-check fixups - failing the check if the
> configuration cannot be applied - and also demotes all messages about
> unsupported configurations to DEBUG_KMS.
> 
> Cheers,
> Daniel

Changes in v2:
- Dropped patches [1, 5] as they were already applied.
- Changed the patch subject to use prefix "drm/rockchip: vop2:" for the
  remaining ones.
- Fixed a checkpatch nag about commenting style in "Switch impossible
  pos conditional to WARN_ON".
- Reworded "eSmart" to "Esmart" for consistency, and to avoid drawing
  Tim Apple's ire.
- Make the hopefully impossible WARN_ON format conditional in
  vop2_plane_atomic_check still bubble the error up to userspace,
  instead of continuing on.
- Use dest_w instead of dsp_w in patch "Enforce scaling workaround
  in plane_check", to avoid a compiler error.
- Only reject non-multiple-of-4-pixel-wide framebuffers on
  RK3566/RK3568, as the other SoCs have no such limitation. (Thank you
  to Andy Yan for doing the research to confirm this!)
- Consequently also only WARN_ON if this condition is violated in
  atomic_update on those SoCs.
- Link to v1: https://lore.kernel.org/dri-devel/20251015110042.41273-1-daniels@collabora.com/

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Daniel Stone (8):
      drm/rockchip: vop2: Switch impossible format conditional to WARN_ON
      drm/rockchip: vop2: Switch impossible pos conditional to WARN_ON
      drm/rockchip: vop2: Fix Esmart test condition
      drm/rockchip: vop2: Enforce scaling workaround in plane_check
      drm/rockchip: vop2: Enforce AFBC source alignment in plane_check
      drm/rockchip: vop2: Enforce AFBC transform stride align in plane_check
      drm/rockchip: vop2: Use drm_is_afbc helper function
      drm/rockchip: vop2: Simplify format_mod_supported

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 137 ++++++++++++---------------
 1 file changed, 62 insertions(+), 75 deletions(-)
---
base-commit: 4e5a9b630580faea139e9837b4fba666db6bd728
change-id: 20251206-vop2-atomic-fixups-0c30e0980f85

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


