Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CEB106FD6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hoVNRCYACXUZYxUReRsznqMgq400FeHzmP65Ts9QAVk=; b=oT4wkQEhZsEX/Y5XEEvA8K+8re
	sal8A5yBcZnMs15C9xK1aNsVp3qJ6B4S8Ibt1W4p5YP4iqNPh+6JcUCNbAyjTmtwSbqLHnUBMJunZ
	EuwCA6cYAqyGDsVWis8ymJQwu9KKKUrguAGy7AIwagHq9SdAccpoDIawI3kXZiP5nJhREt5qIqdQF
	TvpIvrQWez3VY/hmta3wc/OhJefIh7seilasgdIq7cUU3fIax7DCtDl/7r4b+UsvRWG4U8tlQ8dme
	XcXfOkkWcRWf5N9uESB4H+qBcmffECTn/O+HkMgc+K6QSAfGMSEBVlnSpBD0+fhdOHP+cD7u7v8/X
	ySvxlb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sWT-0000000GHaP-3upA;
	Fri, 13 Mar 2026 02:45:09 +0000
Received: from mail-dy1-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sWO-0000000GHXh-1sMm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:45:08 +0000
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be4781d2baso4837885eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773369903; x=1773974703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hoVNRCYACXUZYxUReRsznqMgq400FeHzmP65Ts9QAVk=;
        b=LRrr4hQJi7gvQbPJM028b5srDc8C5P02cdE+kzcnM2SMiqxRTiBNEDJq8cONaxg5VG
         ftkSPvQqc+c9ZePNzOE5kbdRfAnzpaRkvv+Pgxs4DQc4IYdpHN3cV7tVrbUIOc8gNZnF
         fuiGCWVHDWmoOX66vn2IHbH8VP1R8xF1xZ4AxDEop6p3NRynjdkY5adg+Fe3071m9iwV
         AixfVZa2/OkS5c7xzdfWrpnmQ7G9pvgTRIQtrlOVdpFPqKk6q/U95kH13D+yGFYr233Y
         +eXDYOgBkoCRRowPK5N+ei/VwTfmHsSn2X0qMz9JT0Hu64CKWms9zqFKKE7Tp7y4hNQj
         TxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369903; x=1773974703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoVNRCYACXUZYxUReRsznqMgq400FeHzmP65Ts9QAVk=;
        b=KR1CY4kGE4+ThHAz01CMScjTVVKk0D3wcanzT2g/Gq9QhYcSWC9jZ7nrBFJWaFJvLy
         FzUPlYg8vniNE4gQGg2eieu52UvCvyspeC2ZXfD4FdloAnetmgKoWadrCkmTWAAHro3G
         8Dup0ehwVdcztI+iYRwwCOnqsLkCzQIuZ3b1SjUnU85H04I/vmg7BjFz0VNGAbAY0wgi
         8dcRsx9lJzCSzefOGKAU7rPgsflWgM/ixHOw/+0/Jg2BB41nJNA0EM4uQWEVcSRtqscT
         3ymRrEBeE67vkLYdgnI8pGiTjPFzEbTdBNK/dxsl3chDqhoMXNsvvDBLUpJ4bwY+sCJT
         3d8A==
X-Forwarded-Encrypted: i=1; AJvYcCV1jZd5USCvGkX6wNVERqIwOXdumqGwxwD1EhvKBn8pN1x/4U2j1r3L5LFn+DIVvt3yBs8lSQyUKIGR0f4PkB9m@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv8gTlJbyrq/6bD594iH8y2jtzExg5HPAbKZw+3jcNWivsCSxx
	NLHw6cLPFzqZOJGJAVabzKEnL5gIdEVO/0mxoznsW0VlGOVfc/yS6iAC
X-Gm-Gg: ATEYQzxs3RXhlOYkG6N9g6euFQO/+S7M6VDwqiOUhiby8GjTNGjZiKIjFstw4O1bFy7
	rMDV0wAzUC9NMjkVMuGhuWIY4b5g9PpaeHJoYn3iIfkvr6TS4bqRiLxL60SnXmFpMULslYOw4Mb
	zplOVD0QdX3HQJI/LH+J3VRNbtAiOzZiuWDARFzD7+VHHA81qqJ6kalkd9S3C/9/HDt2/4cEPFk
	iGA+aDRVdDenm/9unNU1DahfQ2taXYgzMiIDx8g6fWPq4PgYr/5HExR1gDjIgbq+u4lgy9gP0yE
	YMAl3Jxlzp4wOW/PBF9Vluy7iXP48/YK7LLQrVOGyYDx/8qaX5avwCtH/K4vH2IEhiwbrtI/11b
	hSRVgGxkReqX1XP/Qqhv9mBELToxuEyxG5QR9m6gkKb+0Q5GScqWLJwA270fP5JDFQ23pkzoTbO
	Mm2HXKestubeH3N2W7D+kkrmIiZ6rqZcm1Dv6kP3lyFb67SY4a8uE9T6NF4oZ17JW7Qtu9
X-Received: by 2002:a05:7300:e887:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2bea55561b2mr1021031eec.19.1773369902671;
        Thu, 12 Mar 2026 19:45:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:148f:62cd:a5bc:7e0f:18c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526db0sm947919eec.20.2026.03.12.19.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:45:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Thu, 12 Mar 2026 23:44:48 -0300
Message-ID: <20260313024452.625064-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_194504_482975_8C9B65EB 
X-CRM114-Status: UNSURE (   8.79  )
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

From: Fabio Estevam <festevam@nabladev.com>

Add the PMU GRF and IOC compatible strings for the RV1103B SoC.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v5:
- None.

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 0b8e3294c83e..2cc43742b8e3 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -63,6 +63,7 @@ properties:
               - rockchip,rk3588-vo0-grf
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
+              - rockchip,rv1103b-ioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -98,6 +99,7 @@ properties:
               - rockchip,rk3576-pmu0-grf
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
+              - rockchip,rv1103b-pmu-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
@@ -231,6 +233,7 @@ allOf:
               - rockchip,rk3036-grf
               - rockchip,rk3308-grf
               - rockchip,rk3368-pmugrf
+              - rockchip,rv1103b-pmu-grf
 
     then:
       properties:
-- 
2.43.0


