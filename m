Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B410D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BrGq34DSgZzEGAjhyTFeF9OFKrRHfm7+y6zzR9S4rh4=; b=me1Nj15tVo9jpA
	j60jTthzaUspn6pemKsReFTXDOlX/+sn+LuZ68oQlw7EYefyOGRZfCFfKTGi8jDIZ/Kw54x0R43to
	uDUoGRmoumc5KnEQqpZOEu114CKJLrIbNmkYWhDbk/lD2Z0dmwB+E41y85Oo4GShxF8CGwxHCAViG
	FphUc0A/A94P+MQHw/a6fU7MTnier+fqU1E+a4GQfyz/Lbz5SpTkSFRyIZLnbkhol8NKxYvO4cfCa
	IRl0vEk0ymrbQXQzJtrRhpSDIIJ22gMhqLlLY8y+6WPvYIDns0XGaG5QVhWeysA8zTA5uaUVmo/ge
	caUn2jyZpIQkUGSzyj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9HN-00000003kQP-3gdA;
	Mon, 15 Dec 2025 14:10:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9HK-00000003kPV-0g8K;
	Mon, 15 Dec 2025 14:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765807798; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U3j+KSwEDnsAZ3iJ9Ct2fsoDFC8pJpo974PQdZPUMdU22Vd1XnMQLUNHQ0tq3opTKd5R7MjiRd8e9Awk1veEei2BuX1KfH/ufYV03Z4bz7pWblQhBKCvIbzwNgoe2l5qqLdh5phae5tWclkXg5tOVhJP52/ZJtJSMLCt/zCfI00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765807798; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BrGq34DSgZzEGAjhyTFeF9OFKrRHfm7+y6zzR9S4rh4=; 
	b=OEH8DH9qirfT9gIjUbd0c/RFC3Ua5uzF7O8tnuwayVpwIFn63DbOYN3w3wxPUl8Rl+GqapAHQJhxu+fbJK4m7L/SjDF9mQoYPwXYhkJammnKlVV/Ncm19EPmXKx2iuDw2bUE7we8MSLCiO6O+MSmEUab7YGTumkmdQ2+YHelLzM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807798;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=BrGq34DSgZzEGAjhyTFeF9OFKrRHfm7+y6zzR9S4rh4=;
	b=elwnEnMvKSYWqv7eRBmCYrwf+lN6oeH+ccFZA5jhFKVXGL9TSxPIo1OhiJB9Q5ML
	sdcS3xhZJYDQlWCHZnwlCX7ajbuc8a/qNG3Ac42j+XybN2G16YdqBWfJN0WscMZrjZH
	MPZptSioWi66oNx/W+3vRlG8NJN50w1Uh44KP4qs=
Received: by mx.zohomail.com with SMTPS id 1765807791521712.4981457029588;
	Mon, 15 Dec 2025 06:09:51 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v5 0/8] drm/rockchip: No more post-atomic_check fixups
Date: Mon, 15 Dec 2025 15:09:16 +0100
Message-Id: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIwWQGkC/33OSw7CIBAG4Ks0rB0z0FJbV97DuAA6KImVCpVoT
 O8u1o0xjct/Ht/Mk0UKjiLbFk8WKLno/CUHuSqYOanLkcB1OTOBQnKBNSQ/CFCj750B6+63IQK
 aEgnbBm0jWV4cAuXOjO4Pnxzoesv2+CkyrSKB8X3vxm2R6jVvIRjO3sMnF0cfHvNDSczT/24nA
 QgbqyuptdWku53x57PSPqh1PjCTqfxm2kWmzAxuTNVYtNziIlN9MZwvMlVmZCeROiVqbZtfZpq
 mFxDOEXxzAQAA
X-Change-ID: 20251206-vop2-atomic-fixups-0c30e0980f85
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061022_250259_43B5277F 
X-CRM114-Status: GOOD (  21.99  )
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

---
Changes in v5:
- Reword message in "Switch impossible format conditional to WARN_ON" to
  remove the reference to "staggering on", as it previously didn't do
  that either.
- Return from atomic_update if any of the WARN_ON conditionals came
  true.
- Link to v4: https://lore.kernel.org/r/20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com

Changes in v4:
- s/64-byte/64-pixel/
- Link to v3: https://lore.kernel.org/r/20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com

Changes in v3:
- Change the AFBC source rectangle debug message to talk about 4-pixel
  alignment instead of 4-byte alignment.
- Fix another eSmart->Esmart casing case in a debug message
- Link to v2: https://lore.kernel.org/r/20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com

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
Cc: Daniel Stone <daniels@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>
To: Heiko Stübner <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel@collabora.com
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
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251206-vop2-atomic-fixups-0c30e0980f85

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


