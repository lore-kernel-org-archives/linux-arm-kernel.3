Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC603FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2siy8AgvZkarnaqQ1iRlbYdPe6np7TX5Kc2BXRw5Y4=; b=yF8kg356+adWp5QrDwO8lDigxg
	KrZfnGSjJTn+Pc80oZYnkYCVy/pE5ze4lVoKFHVTaIjnIK8HWMg7JvQBdCiNuOVhCD1QEiLi0zI3H
	O2nTXsykaNe58UJSMYVRvs6BRbDt5mjo57/nFTyClfDT1XK6WsTC6QJeRQJBMAepktSKNySe5xfD/
	GE+t1AVJD2xxDTeOlvKM41V7Gv7unFerbvy//BkzXfrv1Pl/uToWnrf4cl+trbkwD/ttS8qXiBZr1
	qSIPvojlnNM2fxcFE5K8Rcpbh4J60UYhdZQka4IonAbLInIxF3O3aSeWBnC5h2unR1BQK5ywO6taG
	LwxDtLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPV-0000000E1fO-3B6Q;
	Sat, 25 Apr 2026 03:10:25 +0000
Received: from mail-dy1-x1361.google.com ([2607:f8b0:4864:20::1361])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPS-0000000E1cK-0kgn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 03:10:23 +0000
Received: by mail-dy1-x1361.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so2123201eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 20:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086621; x=1777691421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2siy8AgvZkarnaqQ1iRlbYdPe6np7TX5Kc2BXRw5Y4=;
        b=B7NxkdzdYrgKmjjYAtd42TOs4LvPB6FA/Laaji1xTsaWKQP2MN+TogHWNlu2E/4S9s
         Z8DAlznnsIX0jNH/Y5XA1LPZighbiNu3nKi2ck9/+/fYSsoHmHs9hl1wFMc6qAiB0uhi
         lsPv8lsRFhaYRb2LvvYn109cgpN7lpHCR2JHJBdH3tkDD3MMtrto/6lTvr8w4N41Qm20
         rfF1tMV0pITJ315yLeqZBlHGIX9odxC74HfzdcZgSe6nzgwY3VV4u6gIxCTUbEnwBbh6
         QJngqUs2D/EVFDFjuYNqQbIGupKy+mguDfiVWd8iXzk7ZgGw8Kn0Bm06NmMpKmaL5Oiz
         FlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086621; x=1777691421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2siy8AgvZkarnaqQ1iRlbYdPe6np7TX5Kc2BXRw5Y4=;
        b=B3J5bodncAObysXdaE1O/EXfqc//ZnrMcPqMWJsYVgAerzB3PQODGkQlXRYp8i5khI
         FmXgy+9RMqggb1RIhCK5wG3svgO2aheX0eizE9dxpatlCn8w+VBcDPiawoxf7oApmOAi
         6Qvq11jLpf37YT2Dndqiv/YI/0b7dubInBuZnVNQaSvjHHxjftQqgR9Bvuu/DHEgdE0C
         M3x2hKMeD1lBaPyJmO4CW2CPl2/svraf6eJkAh6DMRHWY2MW4C1kfvM0FnYEQyiaORF/
         H8vJiyqQz1vjU44QK2SLCrQU2ZMcucARwPUPJUBcZpVK3Fme6/oIcnw8TaCLva4xazsS
         JmGw==
X-Forwarded-Encrypted: i=1; AFNElJ/PtKRPz+9wolk3cVHRYAtiA0ZHUIX8qPKvXi5tVn3Ql9aRQu7jcPY5WloVttXuKeM57mAtpMi5LpSkIV9YMOyA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6UT4NIgfMmS9ls7EvSIpbim84C3WoDsl4ytWbVIETfgJorub7
	7t0hxbHEpWCQJRa/awIvTP4UVCbnwX5ln15A+U6sYYmkfEPVNEjrt+EqbwKLRFMkV8uGmIZNdH3
	A7nzrLWWuekg0u/F+3wALZaC7hKnYnOWyM67e
X-Gm-Gg: AeBDievjpxcLz7UCa+Ppw6x6cmzVUvgCSGvGJY94YTqyoL7g/B2f6/Q5uxTKvADPOIc
	Jd5P4rmagE54NgTU8hyvVx0VA+/HrslLTdCJX3dlURWyEY4azYclu6rxJh5t4KrhWOF8dlR8oJz
	Lxyyiu+ZYP8bEZ7G3CeLe1BDyQc98pwaRiNryNh0UrtJS8l49BUvowKcDYipkSHgUKm4IcvAkzz
	/+ZZMufsAkectZbbVB93nJl+Y8TeaIROI70SMF1omWAx0NoV18zVjxnu5gEaJqDYuYdGdlh8aCK
	90CknPpd7k2Mxxr/IdgMcE+V7Ek1CEH7IX2FFQ+sBBL3pXffm7Rl5KAH0BgL4xWL4wqQ9b72F0c
	zR8cslPgWPhCAF+Sa/kaRgGqSQdqsSVtoyXTVrUq/5n2Hbzkbfb7eN1g=
X-Received: by 2002:a05:7301:1693:b0:2d2:129a:1682 with SMTP id 5a478bee46e88-2e4786460f9mr18795386eec.16.1777086621591;
        Fri, 24 Apr 2026 20:10:21 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:21 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
Date: Fri, 24 Apr 2026 22:10:08 -0500
Message-ID: <20260425031011.2529364-4-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_201022_236231_6C904E75 
X-CRM114-Status: GOOD (  10.58  )
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

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or
a DP1.4 source to an HDMI2.0 sink.

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
2.53.0


