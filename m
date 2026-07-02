Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97F3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=; b=Foaqc++ixR67Wg00XVmXqNeLHj
	EYoqKJUubipql5X+cl2Cm05U5PdsnwB5axDDHanduQkDhmVxwK/QZZ98iOCJwyDtSac8FtXlovzV5
	0Ogcn2WdFOTFzMi+BjKrlIiKDvqJtEAIxDg9TPZzRCQy5P2rcYF+/QblMiZ6Wx8tN/52Se46emjYf
	M9+1ZGxev44/UBXaQ6YgcoTDNaTTBRYBdZ/re3Gjnk0WE+OLEDaYEal5Uf4GBn+tW854HSbc6rt2r
	JGer+a4LOnblOd8ngNKuKABMWP6I7o6g4XAWd2n2Tq+/1XcMb4b1tFd85SkWAah+jJrY/YshiENG8
	HmRk8uTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvl-00000003tXb-3qhO;
	Thu, 02 Jul 2026 08:37:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvi-00000003tWW-2rIj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:37:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so17910825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782981473; x=1783586273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=;
        b=bzeuw8c3wbB/3cyjhduRlyozdr46hKi/wBM3QZq0d4mYgz7MIc4GoRE3zI9dfaE40W
         a25BSQtuKCmSmvd80WGkG0R4e9XHvcrX5qZHEo2yDUVJ/q0PBp0N5ay3RMdljp0UBNYE
         Z18Hf6BJ5iJ264XliTkdTZrTkbpgYujaQ9kqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981473; x=1783586273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=;
        b=AZ5PDSTDsNcuINo5eGI6gzCQRgY/wLuFGbgCzzoL4lOs5Y8uhg3Yqt20QcGh5Mr0QA
         KOGP/cUp2FCE+C3MQe413AjRFNihFONHtmoQhr4LdN7C44yNbT4QGhXGwsSMc+hjhcTx
         6crWfEAoIhNE99KhYgnUqXKn5pYdUvu3E1v4RwQeqCxF8ENV3WGGvXbgR/mhJD8upFbq
         sJGSHIx9LLrx+EtIOi1Jz+T8K+gKpUegWjZrCKbIrKns8Sbe/S2WOFmdwDzcR9ca9T6N
         zXaD11YA5mh6LXxrU/hWOp7boDjFdPm7f0J6bvtnkZIh0E80JEdMI5UQjrA33DjN5Ww9
         ZWIw==
X-Forwarded-Encrypted: i=1; AHgh+RryJSseEYNQHWMQ0F/y3QUU5SusVg8PouS3eBZZSxyxEEUU/JJkMeSKBdoQfTH3AEKrevVmlmsl7dfeVgLcTU6C@lists.infradead.org
X-Gm-Message-State: AOJu0YxEzNl4FBbT/weZnah5JqqJF8fbbLX+7l1GNlCOMP2oqQvYu8TO
	H/xFB7vpov7PWbEJ7WB/9OkFJt3kBWwJloJEA7BFcINuR65pnF+W0/QIVlvkyVOvkTlp2auc0v9
	KW68=
X-Gm-Gg: AfdE7ckKJ1oog6krBljZmiLQ4Sg45CRsF7seg/2bcgBSeW33dY2pnicR9rojTPQ6ubG
	gnbzgoGMximNHytYOEV8JJiTaw/FHAw50IV5OSDo/BMQ3atUi+dfRBt+63XN5Jwpro5uGNZfwx8
	6raZ8LYbpc4NYohL8XANiH/TE8mDkIKcUJMHDmrailLAaR5LBsbAemsHRiODRwDKh7BgK2sOta6
	2ZOcGluspU60yG+lvVtkYAac0g6eeQd7xRzTqgJpa6J0pkjF9CQt9zme1z4qWdC1Q68qMAj3/lU
	WFDBaJ/5qP3KJ48NOAXC5phBQr+AR8ABIvOFav8EKmeeUzrJ8fFOKzFuR+gAK+M/pA2Ylo9XJ0c
	O/XQu/++FP2EKJmiMGLbm7yHbdqwhCRp8uRSuJAeRCDQDz3hMIPg2sG0aU/CL0pktL1jzMExLr0
	xhxNDqMrgS8AZe1e/L7azFF/uH8MZjj/Rn4BVHY1izwg4yB5GtuVFfHj7SfmdNnZIlj616hLOZH
	9dwMCWS
X-Received: by 2002:a17:903:22ca:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2ca7e706861mr54959555ad.21.1782981473366;
        Thu, 02 Jul 2026 01:37:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7869:7870:7da3:7288])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8fac27sm10102495ad.20.2026.07.02.01.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:37:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: Add supply for SPI NOR flash
Date: Thu,  2 Jul 2026 16:37:45 +0800
Message-ID: <20260702083746.578461-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013754_733986_3336ADCB 
X-CRM114-Status: GOOD (  11.26  )
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

The SPI NOR flash is powered from the always on 1.8V power rail through
a load switch that is controlled by the security chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b8d261b375d4..ed552f023cb4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -980,6 +980,8 @@ w25q64dw: flash@0 {
 		compatible = "winbond,w25q64dw", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <25000000>;
+		/* Power actually controlled by security chip */
+		vcc-supply = <&pp1800_alw>;
 	};
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


