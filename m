Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B88EF99EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKS8xJV1QdyVnftGMy2JSixvrd8X2u5EdxEk+v2UwKk=; b=SQKj5Me5jS3zMmAMAM4EhgEfFq
	1MaOU2KajD73CbLq7lEVtCd9hZIh/0Crh078Qm8bp8gRT85WSIRca+sEzR76zYf8owGZtOSGGr47P
	NseIc2UWjPR6nhU75ApUGY16ofXiY7Y59WXByfJUwBmTSsRJJuHIb8zCNUCddhTAVVwmvjDlAUBBE
	9fkuahKIY1dAmK+3psZHQqkQ17SwbhoniuuZ6r89bGuEwSxwCr31rq+CcDXoKf4xJP6N/kDgTs/Ch
	1E87Zwh2wMUSStVWiXJkZiVEblPVuuKLY2XqBj7uTulARLGzioQmIUXXr06zMojhc98z9tEWX3+Ll
	yUUww5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr45T-000000046Qt-3Gqe;
	Sat, 14 Feb 2026 01:04:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr45S-000000046Q9-3nVI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 01:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4678F60140;
	Sat, 14 Feb 2026 01:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD802C19424;
	Sat, 14 Feb 2026 01:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031082;
	bh=lR0EcdqMlWvvA5jNcysPjb3oxsAOoV8NqBkIPRIFeqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uiYOuHwjAI+UUvqFU/vXWNnbZpvYQrt6DNFNeeNXfO1HSYtsllP0oduuL9oFmlG4S
	 yiHQ494CFy26H/ZNkQ4MZUWBNH9rwGxaQ+YPMGC7V/wxoOBl3WtdvAdNFQZF0ybdHu
	 kmFC21O8SNo2FaoEX+Ll+DIKShzFPDc6xRuUkU/KcrDRND7ZiJ7tBvAHCBIehL3xHu
	 E6DsKhcyE8SS6lz04ut4/b9xlB1oMZyOU5SaJkqA5T0qAQzkEuYZiqUbFocVtFbz4Q
	 aNN4+6p99XxntJ45TUBXW3HGo93lzoLdotgONbQ0tmn6FiOo11GwULY6iKE112YpAB
	 z942pLpBZarQg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Sasha Levin <sashal@kernel.org>,
	dharma.b@microchip.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-5.15] drm/atmel-hlcdc: don't reject the commit if the src rect has fractional parts
Date: Fri, 13 Feb 2026 19:58:54 -0500
Message-ID: <20260214010245.3671907-54-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
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

From: Ludovic Desroches <ludovic.desroches@microchip.com>

[ Upstream commit 06682206e2a1883354ed758c09efeb51f435adbd ]

Don’t reject the commit when the source rectangle has fractional parts.
This can occur due to scaling: drm_atomic_helper_check_plane_state() calls
drm_rect_clip_scaled(), which may introduce fractional parts while
computing the clipped source rectangle. This does not imply the commit is
invalid, so we should accept it instead of discarding it.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Link: https://patch.msgid.link/20251120-lcd_scaling_fix-v1-1-5ffc98557923@microchip.com
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of drm/atmel-hlcdc: don't reject the commit if the src rect
has fractional parts

### 1. COMMIT MESSAGE ANALYSIS

The commit message clearly describes a bug fix: the driver was
incorrectly rejecting valid plane configurations when the source
rectangle had fractional (subpixel) parts. The fractional parts are
legitimately introduced by `drm_rect_clip_scaled()` during the atomic
check process, but the driver was treating them as invalid input and
returning `-EINVAL`.

Keywords: "don't reject" — this is fixing a false rejection of valid
display configurations.

### 2. CODE CHANGE ANALYSIS

The change is straightforward and well-contained:

**What was happening before:**
1. `hstate->src_x/y/w/h` were assigned the raw 16.16 fixed-point values
   from `s->src`
2. A check was performed: if any of these values had bits set in the
   lower 16 bits (fractional part, via `SUBPIXEL_MASK = 0xffff`), the
   function returned `-EINVAL`
3. Only after passing that check were the values right-shifted by 16 to
   get integer pixel coordinates

**What happens now:**
1. `hstate->src_x/y/w/h` are assigned the values right-shifted by 16
   immediately (converting to integer pixels)
2. The subpixel mask check is completely removed
3. The `SUBPIXEL_MASK` macro definition is removed as it's no longer
   needed

**The bug:** `drm_atomic_helper_check_plane_state()` calls
`drm_rect_clip_scaled()`, which can introduce fractional parts when
computing clipped source rectangles during scaling operations. This is
normal DRM behavior — the fractional parts represent subpixel precision
in the scaling calculation. The Atmel HLCDC hardware doesn't support
subpixel addressing, so the correct behavior is to truncate (>> 16) and
use integer coordinates, not reject the entire configuration.

**Impact of the bug:** When scaling is involved and clipping produces
fractional coordinates, display operations would fail with `-EINVAL`.
This means users would see display failures (plane updates rejected) in
legitimate scaling scenarios. This is a real user-visible bug — display
output fails when it shouldn't.

### 3. CLASSIFICATION

This is a **bug fix**. The driver was incorrectly rejecting valid atomic
commits, causing display failures during scaling operations. No new
features are added, no new APIs introduced.

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed:** ~15 lines removed, ~4 lines modified — very small
- **Files touched:** 1 file (`atmel_hlcdc_plane.c`)
- **Subsystem:** DRM driver for Atmel HLCDC (embedded ARM display
  controller)
- **Risk:** Very low. The change simply truncates subpixel precision
  instead of rejecting it. The hardware can only address whole pixels
  anyway, so truncation is the correct behavior. The integer parts of
  the coordinates are unchanged.
- **Could it break something?** Extremely unlikely. The only behavioral
  change is accepting configurations that were previously rejected. The
  pixel coordinates used are identical (same >> 16 operation, just done
  earlier).

### 5. USER IMPACT

This affects users of Atmel/Microchip SAM9/SAMA5 SoC-based embedded
systems that use the HLCDC display controller with plane scaling. When
scaling is active and clipping occurs, display updates would fail. This
is a real-world scenario for embedded display applications.

### 6. STABILITY INDICATORS

- **Reviewed-by:** Manikandan Muralidharan (subsystem maintainer)
- **Author:** Ludovic Desroches (Microchip engineer, familiar with the
  hardware)
- The fix is logically sound — truncating subpixel coordinates is
  standard practice in DRM drivers that don't support subpixel precision

### 7. DEPENDENCY CHECK

The commit is self-contained. It doesn't depend on any other changes.
The code it modifies (`atmel_hlcdc_plane_atomic_check`) has been present
in stable trees for a long time. The functions it interacts with
(`drm_atomic_helper_check_plane_state`, `drm_rect_width/height`) are
standard DRM helpers available in all stable trees.

### Summary

This is a small, well-understood bug fix for an incorrect rejection of
valid display configurations in the Atmel HLCDC driver. The fix is
surgical (removes an overly strict validation check and shifts the
coordinate conversion earlier), has been reviewed by the subsystem
maintainer, and carries minimal risk of regression. It fixes a real
user-visible bug (display failures during scaling with clipping) that
affects embedded systems using this display controller.

**YES**

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index c0075894dc422..ec1fb5f9549a2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -79,8 +79,6 @@ drm_plane_state_to_atmel_hlcdc_plane_state(struct drm_plane_state *s)
 	return container_of(s, struct atmel_hlcdc_plane_state, base);
 }
 
-#define SUBPIXEL_MASK			0xffff
-
 static uint32_t rgb_formats[] = {
 	DRM_FORMAT_C8,
 	DRM_FORMAT_XRGB4444,
@@ -745,24 +743,15 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	if (ret || !s->visible)
 		return ret;
 
-	hstate->src_x = s->src.x1;
-	hstate->src_y = s->src.y1;
-	hstate->src_w = drm_rect_width(&s->src);
-	hstate->src_h = drm_rect_height(&s->src);
+	hstate->src_x = s->src.x1 >> 16;
+	hstate->src_y = s->src.y1 >> 16;
+	hstate->src_w = drm_rect_width(&s->src) >> 16;
+	hstate->src_h = drm_rect_height(&s->src) >> 16;
 	hstate->crtc_x = s->dst.x1;
 	hstate->crtc_y = s->dst.y1;
 	hstate->crtc_w = drm_rect_width(&s->dst);
 	hstate->crtc_h = drm_rect_height(&s->dst);
 
-	if ((hstate->src_x | hstate->src_y | hstate->src_w | hstate->src_h) &
-	    SUBPIXEL_MASK)
-		return -EINVAL;
-
-	hstate->src_x >>= 16;
-	hstate->src_y >>= 16;
-	hstate->src_w >>= 16;
-	hstate->src_h >>= 16;
-
 	hstate->nplanes = fb->format->num_planes;
 	if (hstate->nplanes > ATMEL_HLCDC_LAYER_MAX_PLANES)
 		return -EINVAL;
-- 
2.51.0


