Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449DDC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+DEC/Wm/x+1UpGftu70dJQzMWdvcnYAg9wxuhWZrzI=; b=yVatmDGVaOE69aP3IFDR7BVPYl
	qT3NZ+SFUETKWxLuHYybZQ7ZZtmBn8vbeA/3Q6vCk9l3IOh9c7EonWAM/tBwKKpVVOM3KutHNDjIi
	GkaZbp8xxkAFGDkw/vd5k8HwduPY/tqABZD5ZMi22pOWcYzuEEmrqxM7wfpFtDNSkO61z3qp8ZaTB
	hOixMaj+UwSTiapLpOhQVG4jAVaZC6XEQa/zEMW52x2si4CsETVRVRwziGNrHwc6iwAO73FDKF61t
	y9wGAc9HVQVLROcTpLhbTlMwobnudSgT7f2TuYHN8kdM+S6pmWOMjRWTKqE+KQbRhkw612fvhMsnA
	Aq0meq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gOj-00000008tTk-3U4z;
	Thu, 10 Apr 2025 01:08:05 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGT-00000008s9f-3GlP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:35 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c53b9d66fdso39629085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246772; x=1744851572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+DEC/Wm/x+1UpGftu70dJQzMWdvcnYAg9wxuhWZrzI=;
        b=nXpW5PJzFvFIuqu3bOkr/CRnbe4j9QfFtND60LjxOoP/87h63TBURH8TJxnCbJHWeG
         lBUp8rZLu/CfL1LmoUgQ/FxPJI64ynjpe6qvGnYAqMw3jnx5lbejrmUZ9Bb9GsuHfIjw
         sT5nz84D9WfpprjJsBRMxgy/a7/hPoL0SZ4eafOzgoRUsiTJn9zKEior2c/3y+zXrQnD
         yKvX4cfA0JLiR6wQy6NHOxDqBry/acyow7RlOdePykhhK2YjTXhV0tId82PcoaV3gQYq
         2fxk13ZSOMefKXpVaJ7SZ22NgcHSgTykawufn7z5FI5wamKH8ep1uaVCPqCmp1Rf8OiT
         KVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246772; x=1744851572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+DEC/Wm/x+1UpGftu70dJQzMWdvcnYAg9wxuhWZrzI=;
        b=CzmGoYyNyKYJi/1niWo1TzBJezyZY1k/Oi09zKSrLhjWgvDwOk2sYYFosP900xuCBK
         bSm+lF2J42YjYWqH128xT6ojIvQMZEoj9uVMhFmFAG/dOmGnA393dGr/NCmsQt5kVH6c
         kdQOkW/8jO61HOsioprspvT1zMxU/mZ1cJTxV37quCm+0H/aFfzDugVGtw7K7Jm/JlZL
         AF05qTGV4P77K5qe1yS/xIt82+AsHzgsUWaMCKbAI6tcCoGsV6UKvVJ4rY/zWbIful7k
         F9Dd+k7qGzkFR6SAwnDgyLydc/nsThGg4EBbcgyqSR7LqGv8VS2qi4UVziIE60bGPQxn
         yzfg==
X-Gm-Message-State: AOJu0YxyYVamQhS8XmYugEWv5QPmr96lw8otVaSqjqpkyDkVHr1VBtRy
	SnyIBJEgbbboHfEvfAopY/nsDjU/mcBRTMckViueTGifHMQtvIUYRFPryQ==
X-Gm-Gg: ASbGncsCHQDTAZyioyMMK3Uo3wZR4E0FQLI/R0efG7YqJHVW8l7u9sWthPFYZYXj9/3
	5yjjts1Hzz1QM4Na9chfLbM9gYIusfrZwA6dgg68iCxto5lceKHky58HzCMTkQaG7FmvXIQhTYq
	TzXud0mJkuBjLA+GZ12Wl0j80eRJ3d4UJp8ePSHqluBK3nbjRwPhf6/+u9JCXvi1LiPQEz7/bs1
	cDVxF06tvU0xdAIKd+xFGwByKLJ/X1eY6fVOVa59NNq/Vvw5zd7RYvn+B0fjP/FAPSq5868RCVb
	4xMgytaKeRabb0PMdD8ck3Taxf99aM+7V9cNIIOzYqpSFP7fZMOFGuNymrtvB7+v2ni3On5nFDe
	0snymcMEe2DhRZP0=
X-Google-Smtp-Source: AGHT+IFs5AeucnU/5qe1FBFgBALYzHV57xEbna05f87jL2wZRYoAR+pVlqKCzbG62FhrCzvkoYc8Xg==
X-Received: by 2002:a05:620a:1915:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c7a76d154dmr129648385a.53.1744246771975;
        Wed, 09 Apr 2025 17:59:31 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:31 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: imx8mm-beacon: Fix HDMI sound output
Date: Wed,  9 Apr 2025 19:58:58 -0500
Message-ID: <20250410005912.118732-4-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175933_839011_899CC46C 
X-CRM114-Status: GOOD (  10.94  )
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

The HDMI bridge chip's sound card enumerates, but it does not generate
sound. This is because the sai5 node is missing the flag telling it
to set the mclk as output.

Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
index 97ff1ddd6318..734a75198f06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1


