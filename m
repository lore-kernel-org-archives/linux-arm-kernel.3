Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68598D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06VngU2PD/ZJ152CdUiTirhp6wSspB2EDGFd62QfJ8Y=; b=3SNcY6gys8GXdHFzXumWmWV0dr
	Ko5soJyPdaszWrtdRCFkmLfKdEmxwTgT5LF1LTFumX05HxkaNCL4fbMpWfeMlAqe52KEwWNRRwtbS
	z6ODJOkv39BF/fSjuZfSu1tGaVzjrZn4Tk9PKv/kjNOTaAQW5eklmoCW0PpKX3vW4/2pgaegUI634
	nr2B+4fjj6FdCbNBl0EMXZjyp0s40k9DY2kUOKPrjq2XPoa9Qrr6jBb0xgq3UNEIZI7rHJhTG7VeR
	+MLfzq59NjitsKJpNicALZG0aBrH8l17JoKwX/9pCj0WZ37r6J/ImQDxtuCalqKxd2NCrfOA2cc9w
	NyzXugdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iz-0000000GTM1-1BEj;
	Wed, 28 Jan 2026 17:26:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Is-0000000GTGk-0HQi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:08 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 602EF201D;
	Wed, 28 Jan 2026 18:25:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621127;
	bh=sF5+oYbYzyUPP7tFx7dJc3c1T2SamT2+gdps+UfjNec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cN6mlN3K1dT1dZr7Wsrzc8cosC/0kz2uBzoX4VxNxktO9DQgwJbfHS43R6i3BzJDf
	 XfKAwz88Tp7v4q3fHyQonp315xUfb9mf8RncpPwLDS15v4LX9iCdi604ZzQwPADUEY
	 Snl8fk+kPMEUD2Oi/ETS5p5VPdXX8STUsveZuKFo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:29 +0200
Subject: [PATCH v8 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-4-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=sF5+oYbYzyUPP7tFx7dJc3c1T2SamT2+gdps+UfjNec=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekakgvyhVlQpxHfOILA+b7bz6W6t2uzJjMtAF
 rV8WTugbNSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpAAKCRD6PaqMvJYe
 9aIUEACPlXQ0BT6UD935vf1L83CQptTfgwN8o5cCkdmz2qPEomjGDDU/lU5K9eZTtNjty+uDUtA
 jhgT+8OX76NC1G670Tx0aLFNppC1BYkPl7Mtqn1FSUsGACOUXRK+9K8CMqriYeBSepUEJKDYaH6
 zoXZWDjgEYaWfskGZfwYr+atmoCNe7OSbc3eexSqk8pAVDpEY6KttIsby0AtHXY9RsyyIUwwf8j
 qu5sW/8o459yWdO8r6pL0CohN24QoJSq3yuCkjs52cppiSJi7kialC6iFD5oFR8OFzzZA0bUOec
 uLP+rZGswp+3K9cHrZufZMFUMjHsd5rRZAEjS4ApJwG8jZUFSS+kNlmKhbyHDsDtI3fPCnaHU/7
 LHqaimTOZB0+qXcg8DfntxXMUcR/Yz650X6VoGwuLKWzcPFbcMuu40nAWdqBfTnctorwtV4rw5e
 nqmSDdSjNwguj+fGS9/3VscE5m9BD5G6Q/epsWBEPPTtcEKW1HKePZWHVDK3mpJyxauHDVwT7ml
 IHDXXtjV+UUQr3/Xd1LO/N4WkAnu7e6w4A0UweKu6Qw45McuVPrvSZaUJGSs40O11e4wnwn2TUg
 TC2IN6BbgRCz65xDnsWEPTl8fkNgCXwrsE6h1Plr4CESd7LtFm8tUumclb0oLpBVSbAokZPHnXd
 MeKy4PgI5JdVhXw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092607_155063_585338E7 
X-CRM114-Status: GOOD (  10.80  )
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

Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
32-bit container.

The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
packed, A - 10 (as in 0xA), 4 - 4 bytes.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index a39b9d7a5b62..0d222f6c1a30 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -388,6 +388,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
+		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e4451668499a..bf6a41462af5 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -468,6 +468,7 @@ extern "C" {
  */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0


