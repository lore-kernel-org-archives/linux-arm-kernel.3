Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205FDEBFD36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=; b=gaxbChmkuuW2rC4GJVpwhOSZ32
	AE3jUgooyqZZ/bwSm6z2n1oruOPvfTWx4qNjcJZCaE4WZ9bxJnIAafmZLdnulS4+yhBAU5fe93X4J
	cQIl+L8n0xnnopgCCT5tJfU4D5ujSdxohUaOcPG0s28WahBHdjtGmkbD0knjYoMn++oFliUabN9hW
	X26jB7gdMndC+AQxMJ/8OyamVQIu82x+H/VsnH/unvj5panOgHzsas7GIlHH42QWNPYDTfbsAjP11
	Qt3S8gW0SUqoypKhfZd5LoulESZz26Zjvplkcew1XLZeef1qHy9SQDXWort8is3itnF/HCB0rrKPl
	kp5Gc0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEFR-0000000FRLz-2zwM;
	Mon, 13 Apr 2026 10:10:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEFQ-0000000FRKw-06tP;
	Mon, 13 Apr 2026 10:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=; b=HrYayWcCMpzpAYKfOxmXlY+bhE
	+zqaSlofgtCXv5zGQsBADv8R02EuLjzfKgUIjEKVBe4kTXBueBPtbRf6LyAqlkZTXdHqA6Q6GvXRE
	OALUjLv0Qsx5dDHWF7ingEqtgKAM2HC66QbjMvxiFrvIPupeRZ1MFaNkVY2V29xYuI8LZN2InA0Yl
	g9EVkrQSVZJvWx5AsvQOyUL0DVZXu4+mUZXd/OZ01Bx2l1MBW03eakcsjPWu8UPSgN7Cv0OzqkJ59
	hbxHC5AaJWGflvHeF6zGG0VWjgfq7tQH+H2PNYBvVxQujUawesCvbxZaAnYpArBOxh1YbmmxGe5/H
	ugc8ozUA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEFM-0000000GYni-2lCr;
	Mon, 13 Apr 2026 10:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776074987; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K1LLumz/jjy7kqNhzry+i2DoTVTKu5c5rIEl2WDwBTk6wZpgA+azTM74wqKjduhmEgWheFEMnpGeIO5dganB1UGxtfadYZEQSnXvSj/wHRdpy7BABB21+eOZVV07H9KNi77XLDxKDud+DHLk5XBj9wfojd+PJMZskC8/8HXZx8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776074987; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=; 
	b=iH9HjPvnc6Os+7zD6xv+lRiS/+91N6XMi5D1Tg+IEthHMrpao88NEU2nnbqw4crjQtxhZ7IRMvNeVlnYzmtkqGYN/mGqomR3Y7u0IAKCSnAnVn1xv+JvSkQn7Ky5M9yimlTPPk6AXgVo/HK9rtui2/rspW5SpA8oMBH6pU4C7oU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776074987;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=;
	b=hoUI/x9cNkPLCqkIX/g1di89WDyFdQEmm81aoqLRg7XnPNM8BF7rryjAyI6t7yU2
	O3yxdWC+BbYiisGa1besZaT95LPiJLy9n2diHDQTbqJSVjzmvH9ElwpPWlvaPNatpyu
	iXHaa+yk4Ntd48nYYgpglICMNHqzZR0xBeeik9zc=
Received: by mx.zohomail.com with SMTPS id 177607498551644.72557562529357;
	Mon, 13 Apr 2026 03:09:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:28 +0200
Subject: [PATCH v13 14/27] drm/rockchip: Add YUV422 output mode constants
 for VOP2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-14-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111025_158065_46ECEC3B 
X-CRM114-Status: UNSURE (   9.38  )
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

The Rockchip display controller has a general YUV422 output mode, and
some SoC-specific connector-specific output modes for RK3576.

Add them, based on the values in downstream and the TRM (dsp_out_mode in
RK3576 TRM Part 2, register POST*_CTRL_POST_DSP_CTRL).

Reviewed-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 2e86ad00979c..4705dc6b8bd7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -30,10 +30,14 @@
 #define ROCKCHIP_OUT_MODE_P565		2
 #define ROCKCHIP_OUT_MODE_BT656		5
 #define ROCKCHIP_OUT_MODE_S888		8
+#define ROCKCHIP_OUT_MODE_YUV422	9
 #define ROCKCHIP_OUT_MODE_S888_DUMMY	12
 #define ROCKCHIP_OUT_MODE_YUV420	14
 /* for use special outface */
 #define ROCKCHIP_OUT_MODE_AAAA		15
+/* SoC specific output modes */
+#define ROCKCHIP_OUT_MODE_YUV422_RK3576_DP	12
+#define ROCKCHIP_OUT_MODE_YUV422_RK3576_HDMI	13
 
 /* output flags */
 #define ROCKCHIP_OUTPUT_DSI_DUAL	BIT(0)

-- 
2.53.0


