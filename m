Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AF5FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhsANxfjmjB7vk5bKYmWUGk+7KV8pJM6GvanWdmMMRI=; b=NljPWeAp1GKkXLBQVlybUPFpSy
	hGLiuoVUHXucyd8AXW+117M7UHTz8H5Cd/9NvDpvSlXZKlUGaug+Ow/8J9qVJWQN4//3mV1Jn7KST
	3coLmPN2XZlmAGUvNMvG51wZAiI6wRbvXUQCdkkiDe5miYXkppg8t2ShAlPllIHBzqatMjoLkxMe/
	MvkKjS4ZFliA+navCXwRifBd70anad/P4hUyvXydtlR4uT/PZVfPxYXBbGT8zSZUfJzSKST8sVEhg
	03TUF7UAOlqVq+ob/zfWix72sfyhCRCrlbvja5+lO/wSscFbmXFO8PtiKFzkFn8+jMbmv7QGzB1qK
	oN52Gukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKu-00000002uGo-3cju;
	Wed, 29 Apr 2026 04:15:44 +0000
Received: from mail-ot1-x364.google.com ([2607:f8b0:4864:20::364])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKo-00000002uDH-2WCn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:15:40 +0000
Received: by mail-ot1-x364.google.com with SMTP id 46e09a7af769-7dbca22dbfeso5183411a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436137; x=1778040937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhsANxfjmjB7vk5bKYmWUGk+7KV8pJM6GvanWdmMMRI=;
        b=fDf9vtQCDwpN2bVC4xy92nLs6w7sapd6XGjkNEtfVFungtjBD646c9d6NAQhCMYEaN
         WG69dRY3kYB5keRAH/3Ane48VcS+Hwv7+vOVyRDHf9mD4f26D6AE4Tni131Nsmgz6lZP
         LHMnn0C2nOuIaOzkzU+ASmD7y33f5+gcfmswV7x00fP+o7IYbb2g4DZXGd9qcv3YJVJU
         OYymubvMhGt1GozgvFVCynpuMr0u/OOYVX2lEVLwFofFajEQY8IjrZB0hS5oJEnao/3T
         idPToCHuMcyToUb6MhZ4e/yFaj3LJkrmIZgx13dzrybfrFC7TaQ3G/ve/wbmOjLOSaVP
         6Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436137; x=1778040937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhsANxfjmjB7vk5bKYmWUGk+7KV8pJM6GvanWdmMMRI=;
        b=PbI5MO+ytwEYvyp56S/67a9K0nFHNzSURTevqcmeFwiOT5kcDFiRlclbmhFpeu5Z78
         oRkKLVvroYj8JgPr/6m7qk0A7ngqPhPlKCVcqRb79EBBnbFbpq4l3sawJfYxcGL5/p/0
         Fd9DMhKpz+535JPI8SEG9hI3/3wNcvFmM6yUSV9Ax8jaud3SkL59S/jcpHXkQn9uSRc6
         e4hQfOMJLj7GtjZ6qTuumHt1MUrd5qavWMSv/DeT94b9LwMS8HwlBnGAXBrozNzcsmrG
         4KKYuWhswsy5LE1S8xuE7ErW1LDSZh6JKccKohu1b7xq/BDUmgiAHD5vu/7dPkPjWghC
         YFvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+amKIZ3tj6Ui5lte13fx3rLmMS3QPhCHi6BOV8ZqqHerf/OEF2iyU2D18oXGPLWYjXuwSko8rbEh0ZC6+ZUsIF@lists.infradead.org
X-Gm-Message-State: AOJu0YzK76ahSMJTCzBmPDT4KvaJjkdY74PMIiNxL7rM0kHVke8SvBos
	uzINN/NWA+l8q7kqiWlupa6uDjVRk8WRI63GU2lpCTB1FlxeUZyYxVkM0PmYq748of4xyIGPtEE
	+0VGd20OmmnPrkwLHI7YBYjo2qJgfcxby9Ok+
X-Gm-Gg: AeBDiev9nlY8C6I/ty9uqziuXfn9yPbiDKXV+jaDLS0NJEUtrnXlR4SVg9IaxKyTmfH
	eo2ca1wlXA9tTEnIYLsyoiExwLxBmMbjGGyBgd6xwElHpt5dVQ02kX0wdxNI38eWQ3VsdVPTZiF
	K9xAuVUwjF0jZX4ZUfSHxIPsqU1kTSPC/z7dUUIV7FGwvQJ2Z8dxnneTcxcqdT0KpNt7O+fj5M5
	n/HgAJlQhnRaG5apLEauqzrspDI75uaWdd4LZUPZU7Jkiw1XXEfUGGqRi7po48dknszHaHhhdva
	HIgP2XZvQcWFytVjGupb7zzef+7altGytkCE8eWTKKklkXUfDvldLfUtlIAgaLwnkDGjyckXn24
	l40h0obG8pahFiUuVw0VlFvvbwoRhfH7Hp6keTWOIAt0ByfPOH/tdMNg=
X-Received: by 2002:a05:6820:4b13:b0:696:1bda:5dbe with SMTP id 006d021491bc7-6965cbce522mr2941455eaf.56.1777436137366;
        Tue, 28 Apr 2026 21:15:37 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:37 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 2/3] drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 28 Apr 2026 23:15:27 -0500
Message-ID: <20260429041528.558254-3-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429041528.558254-1-dennis@ausil.us>
References: <20260429041528.558254-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211538_645934_0A72A013 
X-CRM114-Status: GOOD (  12.88  )
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

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4 to
HDMI2.0 converter, designed to connect a USB Type-C source or a DP1.4
source to an HDMI2.0 sink. The device can be run uncontrolled or it can
be attached over I2C, this supports the uncontrolled mode.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 8aa31ca3c72d..42c1f3d5ba0c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "lontium,lt8711uxd",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "parade,ps185hdm",
 		.data = &(const struct simple_bridge_info) {
-- 
2.54.0


