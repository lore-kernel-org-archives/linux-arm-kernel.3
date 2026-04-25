Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2316FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 03:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzwyg+Q8PpdccnVWRF49NDrMOdX2e/qspSUaU1qJfGA=; b=V92aw7abzf5ojcwbfXIAyRbWAG
	yy7mR2rQrPnBMASnQqKoGcFAHsr1Kx2o5HVw1ozfMmDQIk25Qn2nxaWYOcN9J6uoRmzwSqVIy0AGJ
	ke955XMLlqfMk9lB1cDj41Ca13+wGzuMhQ6DyrumxKXAhlMc+9omr5H7sXfrt+8DB6RVGyfXmBUZO
	Xcd0CYTvtY5cArotboNPMbXJK6YCbBkJ8zrdswOfQFHbTj2nut/3Qpn+sQ90GSf2Qs9NOs0m2l7JD
	YS136feD7j3YEUxt/gYE42PlZNUhBheGusLCu+J2PToAuAoFMspqOPRoOWh0B8pss5gVOmVu/xEFq
	HY0U6oIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPV-0000000E1eS-0eF3;
	Sat, 25 Apr 2026 03:10:25 +0000
Received: from mail-dy1-x1363.google.com ([2607:f8b0:4864:20::1363])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPQ-0000000E1bL-2sP8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 03:10:21 +0000
Received: by mail-dy1-x1363.google.com with SMTP id 5a478bee46e88-2d96243c91fso13406653eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 20:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086620; x=1777691420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzwyg+Q8PpdccnVWRF49NDrMOdX2e/qspSUaU1qJfGA=;
        b=izXD3xNkioLXJ4dyy3bF2LhcmaWWO2diS56OL1w34TtapvKVHshpIV0k8vLSrGxPKk
         rirWGscdEInuEj57AUNVyU4E19Arq3+OttcwSqsanblWqJM6ti3E6JVlFb131/AKgqQA
         VLox0GwCCuRYbUoc9Kj4q8CK3+cbUu1tR90jwHIxKi7u6sU+AsAA0/nIq4ekhAVuZ+XR
         XBDz2g/F5hDMdHf59YpwQndK4Hit1H8TE0lv+wqKIKZMUfIeYNFakHcTOsGoKN45YtCJ
         Cj2uEy9gFosBljaAXkZxDDHqSHInKFZGAv1+kP4kyJxDJdRdy6Uv1CwlLy4CtCntuZjh
         1ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086620; x=1777691420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzwyg+Q8PpdccnVWRF49NDrMOdX2e/qspSUaU1qJfGA=;
        b=Xl8SPwZv8gEh1LMS27cGqtgPieD8Y53duafwYWzRi6wYRkr0pZUwwuoba6D/TIP8l2
         uIjyWm0PrSz62QrMOYjzNJ4P+FlKN9PCFBET8Pixve/qBQ54eWzyXavxPSfnIq+xlI6w
         UyMcZ3c3rwpRdD7dtY5RAf3AZgb8FDyjY23n5BmGz6XlvJyS75kB1pJIPWtIYr44+Y7A
         xfxQaJh00VOrqoAN68chLxaj177riRY5mfV37+M59YoxQyN/XlbxJGfsJ2MhmOTcIVNf
         3CGzZr5G8fkbt3wr+GT4ZFjAmTULJQvpiq8i86y07a17BmlTFWg330ckIglr9YfbDhz7
         g0ag==
X-Forwarded-Encrypted: i=1; AFNElJ8ie8WNWvXUK1YDDgCR/sdp37Jtkw+0khf5d5bW2UoqgUnaeeCod9BFU5AzemWJIXM25OgE3Ssc1zy46nbKXBva@lists.infradead.org
X-Gm-Message-State: AOJu0YwbNUXTtE2CaNscex5tfrhRXO8ilU29jJlzwCRtra9ldGrxPRYQ
	qG4+ziYoS56rjxllGKwKl+W3yVoNCqBPtjtxmIUCr3Nh1/30/qr87bwrfSvAnVrIjHPAKsBuYbw
	Rw/gdeeu5ZpM/Qj0/9Y9H6clpLh3U8uVOC+0+
X-Gm-Gg: AeBDieurrTrKmRphbERfMFkK2u2c5vLiw99LCs9H3rkvsRMEr8SGN3SC3QOSMuIX5m3
	cuc5GcXY70yjr81jq5GoiXLyXY6QUJNp2m5qdkGKftA/4K6kvjaWuyDzh2F8duljxZLa4zN2YWf
	wAQ1Ra/e4N3GVD0N0+L0WEpQ+hP6f0VD66LHEZFs53wWCNze8oyYJjDpok1zTpHIJefdZ3eDf6C
	VfMNVsacXZqMWh7XKwLpIhYX0O2UbLgMT1rNEeE8DsxkFBsgKyxaXw88GCVANujOsSR4kNDwfE1
	K5rcTMUOnd3p8JEvs0oURwFsZb3Dr/8mdvYOnQMsOlWyfrkwG4TvFKq32nIR4IXIeYo1lUmRxOX
	eLOoQvfyy55e2GCqqtkeMBc/3GyQkSjHzRD4qF/DKnIJDhUlf+f6Grmg=
X-Received: by 2002:a05:7301:3808:b0:2d8:7302:d21 with SMTP id 5a478bee46e88-2e479724538mr19046348eec.16.1777086619649;
        Fri, 24 Apr 2026 20:10:19 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:19 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 2/6] dt-bindings: display: bridge: simple: document the Lontium LT8711UXD DP-to-HDMI bridge
Date: Fri, 24 Apr 2026 22:10:07 -0500
Message-ID: <20260425031011.2529364-3-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_201020_723612_A3CE9AD5 
X-CRM114-Status: UNSURE (   8.47  )
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

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or
a DP1.4 source to an HDMI2.0 sink.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index e6808419f625..752c736c8f85 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,6 +30,7 @@ properties:
           - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
+          - lontium,lt8711uxd
           - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
-- 
2.53.0


