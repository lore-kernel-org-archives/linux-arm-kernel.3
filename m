Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556A1F54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=; b=4eq4X2q+rn+lSy4NIRrdgEfYp6
	/mtRQQvVuIVekCBeCZ1sF//gxTG+Yw/IhdlQeGr9nb8xMTuqC2oxMnoaeSoMG5TkivkIO0vHsHR+Q
	0N2c3muhIri+vTUD+bjGIX8A9ecqqWODe9scNlwBOHjtcJ/bcJneACeb1KKN2pPeUlKK6a1Es61yj
	Iqp93IW5onb5q7MqPTin4ykWEYtfFN/M8Fvo3675KH3TK24EFWptA3wCHOh+P4h0riznAYCAGOhh/
	Csv0cE68+2tDuVlxv4M3VcFoHErBxCLrENj1RfI599B9PUrE+1D7+gpBOcSdj8DKSuQm7Tx3nsdO7
	MEpxxJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54DN-00000001nz5-1HrX;
	Tue, 24 Mar 2026 16:02:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54DI-00000001nud-0tUF;
	Tue, 24 Mar 2026 16:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774368115; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gs08Bykwix8N+aOEMavV30rEtPtSY/Ije5NV9VZltQJvU5U7gD9/cfA83NdXi6LTwZtxuj9FMTtpEELDYmZwc2PDlo9JSBO0pFfXq8bh8xA525bBj7BeAAYVEBHwq8qwJkNht9qSH339PinYRTh7vPbmfuEgJfpRZ72A37BAdl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774368115; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=; 
	b=VcgOPifWwYAxSd1ILFQ7Nh2a+HMl0D/qoJIYqZAHyBLtLsG+Li0d77Z8hOAVNu6HHJH+OlsT5hZ8pC7fC5gXR6uMnyR+6kmmPFWvTILJBtzWp28lfE6R18RnXhkSnM8pieTrk/nTpvHGlPkbJSwUAKemVWIpLzu1RWAEyf2Dc4Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774368115;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=;
	b=LJlyLDFOboPVcRcYEGH9QS+kXdKpsKBZnrWfWQSfvg1CmeIETrG4ifEjy3kSFHUr
	StobU+HeJhDAD8e/8fb5QHJuTV4xlLxTexfjXZ66OufbcVGLzjM569qWeinVeNEniaf
	GXZ3SvTawPCQctgJDgqIwmgd0EByvSwJ/De8DFgM=
Received: by mx.zohomail.com with SMTPS id 17743681130400.836362593438821;
	Tue, 24 Mar 2026 09:01:53 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 24 Mar 2026 17:01:06 +0100
Subject: [PATCH v11 02/22] drm/display: hdmi-state-helper: Use default case
 for unsupported formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-color-format-v11-2-605559af4fb4@collabora.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
In-Reply-To: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
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
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090240_310177_1BD8EB6A 
X-CRM114-Status: UNSURE (   9.96  )
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

Switch statements that do not handle all possible values of an
enumeration will generate a warning during compilation. In preparation
for adding a COUNT value to the end of the enum, this needs to be dealt
with.

Add a default case to sink_supports_format_bpc's DRM_OUTPUT_COLOR_FORMAT
switch statement, and move the log-and-return unknown pixel format
handling into it.

No functional change.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9f3b696aceeb..a0d88701d236 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -541,10 +541,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		drm_dbg_kms(dev, "YUV444 format supported in that configuration.\n");
 
 		return true;
-	}
 
-	drm_dbg_kms(dev, "Unsupported pixel format.\n");
-	return false;
+	default:
+		drm_dbg_kms(dev, "Unsupported pixel format.\n");
+		return false;
+	}
 }
 
 static enum drm_mode_status

-- 
2.53.0


