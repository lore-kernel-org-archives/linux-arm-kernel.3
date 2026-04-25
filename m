Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AE2FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=; b=ms0YqLfw5Lwk+h/jwdChza/74c
	OqlIGwGthPXvmbGQuQlNltzoOOGfHQdoqxBNleejatFwZizpiYJocLdBifsbU5SGFYHSx+tPdm6tY
	JDCKVGUtDtrJ0hm5N1EwSooEzIQpvdaFxqB3NZIyERgOLaJG1sqUSGfbcUn7DjKyI1/3CCig6+Use
	0XXzy3Zq8E5/jdJAGxas2Ki57cbWLHCT38GyZ50B9XURnVPhUAO3fNN6XzxS0OisDpX6IT2986hL0
	IDpx2AHn95HVpi7L+b3O7rwJKeUlIjvyBWOxb9G3aL3DCfpgDHLrdxKAikgTUKYnjLDtn38wsFZlf
	zup/Kq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPU-0000000E1eA-3PWi;
	Sat, 25 Apr 2026 03:10:24 +0000
Received: from mail-dy1-x1361.google.com ([2607:f8b0:4864:20::1361])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPO-0000000E1aV-1aMj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 03:10:20 +0000
Received: by mail-dy1-x1361.google.com with SMTP id 5a478bee46e88-2dee127b3c5so12160573eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 20:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086618; x=1777691418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=;
        b=JQgNipXkYhobsKq6XBO0RHxl+DeUE/p90ed+vppeYcMKJdxm8dgf7ipIxdSoU+CWO1
         FxpzC2BiYrOb2uCzaaNXaYGFK88N5zG0xNC24upM9HnXTqmr5W5n4+AihNYpU4Sd9eHA
         zyMca7xP0d/hFl7ejRAtnuP9qBGRxydkVSsHAzPa75XInErzuJXYwVdfo4X4G0b+CHnH
         /0oYnz2FmQe5faa8sVLEartXDAKlND8+rIylLc0EwVQqhp5xxxeaqHTUwao/WmvNPtmR
         KpqTI7nC0tW9nwRX0RYbGhZ4+rj1T/q4vAV/cPLg2DdCktJsAV00+/FvpA741/55q7L2
         ExKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086618; x=1777691418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=;
        b=IvrEG1xG6AwamBAhBG/FPfUGaIbE0hu8jVJuHV57Pqzmuq5Ve758exoOlJYrHGAVVG
         AQbAyRAPE4p3+xgHoDlnyWozP2ysMUnk+AOVipV//VDo+qECAx5d+5E98r4dhyGoGYcr
         JCdhsHnbIhR2j3GOkVrFdP3BKoK1BuGN3sfhJhyfN08R0I1pgKMXDbq+ByMcfm88Bq04
         V3ttTbOdoN/LnhBqtm8WCHvgU+QPWL9esSApClcGkakIZbLN+BttGRXk0Qgo1gXQKApU
         Na0WBNYHIXubRAKvBglnEDI1NF/dWuOD9gY4gTIcCrlph6xsszIU4NhE288ZlBdolpe2
         cp0g==
X-Forwarded-Encrypted: i=1; AFNElJ8N8eCVmkUqYUJxz9v5hP9NpK1iYIXSUZ5Q5tOuqnQrqdd9TOSQLs2vCvxPPodwzTVJGb4dhxChhTsbhzZ+Zybu@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZIaK3FMWRPJxwlSQqdrm7C+wQChilFlcc4CxHHt9Uaggoo2v
	6dGPs9Mvh034fHmn/ekZng7qWHXDQ1AF53B9WPETdAyp0l5xwBPxV10DYV8kxLzYOKCXInnvYWl
	Vtk0Ym+E0LJzLVZiDzuRJem5ockGbmAei8VJT
X-Gm-Gg: AeBDietmDBlb5PIBeBN71q2upoLh4KbeDVN+9/aZuHcBDP3WkpKuk1IVlr6W08SAEI6
	zUouacmP4eyoMMN+diYWhxFyTB1AbrMMNRNTV+9rZyUHlTBIrb6pR6cITWatZn46huxip2w+gBh
	xD7r1rPgJQTj/NgpX2dHI4LOcXWte0pKkhAny2Dl3PaG5452StVSNrdv5r+5wNIDSfQRp2IiSER
	Qhu5Pw3AuEHftXVfNBitktkNDxl7LP9YNBTrjxMe4FlAa+3c2iwwczRIm+Aj/PiOXJcXox8Xpya
	5BNvu5fBaXat3p3AjtJadgFl5M6EY/GLtQ0x+seJvOmM34dj7nKX2pjwl2I8JwBlzZB98DSaCvw
	8rcgjR0k4KYpkx9VQBOS/JqrHa1MOAJpB/T0mf69DZDPLov1r/oHS8S0=
X-Received: by 2002:a05:7301:578e:b0:2d9:6373:ad1d with SMTP id 5a478bee46e88-2e478c1f833mr20475128eec.20.1777086617724;
        Fri, 24 Apr 2026 20:10:17 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:17 -0700 (PDT)
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
Subject: [PATCH v8 1/6] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Fri, 24 Apr 2026 22:10:06 -0500
Message-ID: <20260425031011.2529364-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_201018_419787_DF34C573 
X-CRM114-Status: UNSURE (   8.20  )
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

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..3c6b83a84463 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1320,6 +1320,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.53.0


