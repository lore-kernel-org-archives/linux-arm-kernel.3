Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2150C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=; b=B7pEuLmGgLAGuVgmqh7q4+EE8m
	uAufD3epbEdFlunLCwWPiYh85lXq+sYpOlGj6pbezbtDquK+24hCOMuEZITOvSRDte6SJ1weXuDV3
	ArcEgIhnVqhVZgw0SaTHpXhrdtEyk/0tdxJt8z0zok3+63r+R8JACccWHSy28/lfnuQ313aMoi+AH
	RMF1VbpMPY1D4HeZ3kv3FQ+3GwmV2IMbWMEoMvCkHYz0qyHv4XhBGQBbieOemdBmMGY0+OHEHkpbi
	GPavlM1OtjHTQbu0hw5TR0zvFmvAgpK9X828e5/g+ECPpbhE5IS6mpMhxaiQlWoZDN7gFG5P+g/Go
	6kdDU1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAtJ-0000000AzYH-2IWV;
	Thu, 06 Mar 2025 13:03:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9R0-0000000Amhy-2oky
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so4666405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260637; x=1741865437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=GukDdMRVqkJZOOG51SANnhA07ddBSj8kckd9x3XqsbUlWUHmZe2Niam75tJ9AKMo7H
         UDq//UgFuZKVgdG2SiiaVH36380Nz9kG+ZWMCnf4a/Uo8W8kGAdhUiYjRCnb1OpQQ1yD
         inaWY0g+0jVi7C8YKIZlZGEwr3id0gh2qJNDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260637; x=1741865437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=gZPDyjvIdlObDYTCG4F2m+O+PD/IFkDt8MGEXqKSdwLwATRgTddID3OYkbqzJKan8d
         n4zgc4d9JQcp+y89JQTqaDiFKNXE///91ib6fC2RejiUUkCl8z7K6vqTFMzTqb8Fhuq5
         gwdyMIJ9TJaMgue6h3KpqZGvNAgvu5hEEx6fKFfQJ4AyNjGZRIlE1t61ctzp0Y465rnW
         ospCrYPah/LdQHmdKGIdWoqviUyy2jRQBatdIBkx5M0XwmEJg6oSqZrIsqgfxtETidtN
         /j5m2G9opQO7gofqzP6XlsLPlF52Xy2dRx9F1ZBADmm9gbxByS5LInDE2uXSSKDuK1m8
         +hVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhKa6z82cTuTPAQbU8pDpu9rPE64tWAav9C1S/NIVfv312ZZk2oUMGOE+WkJR+QyEZiIk4soPb4801tQ3Hq46h@lists.infradead.org
X-Gm-Message-State: AOJu0YyjfYq9vz0O6LWPe40a0zkRtft5aVJO1Zavd5ilknd2eef+G7Of
	qp+ok4S0Xgz8VxEMPwpRAGgFeUdSfg6iGkrozc2RILyzKKpIhyHAvQ7eid0tjic=
X-Gm-Gg: ASbGncty4fy91/ySNwcpcXPxz8yOUTj5c7UmT+zIvnjcRTm381mVRNcaX0/Ui8/4vnK
	gNxVlRyYDqkBT6n8iORE+LHJrpSNsit75KQ3TgpBXrMspWWOw6om/o4rPapS5E2AwxnyaKMWDmg
	+b4KY9vHKQxwd4nOq03a6NetGwBppU767ox/6ftmOiPylc8/aB89l2L7lD78h9U9UZ5Lg83ocpJ
	7p0qHogyBT9wgnop32y/jNwUPCQVgo7Qwd4jiCBNnq+/pKlFpB8oPhRsP8mmgohZ3sgxQwBT7nk
	WcJxfBG0QO7bvgjrxwrrZrqhR8oW/Vcee5zcq0ALaycbDkKHdZ5akloB6wkUqscwjBNw7VBzOZO
	KC0FgCw==
X-Google-Smtp-Source: AGHT+IGnwsNJxAKDrbK2kKQUMvhybDoBV/jgl1/I/PSi+Fn1DxAEWp8gH/c4FLNEhP/j536e3/gNkw==
X-Received: by 2002:a05:6000:2cd:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3911f7bd651mr6196780f8f.47.1741260636943;
        Thu, 06 Mar 2025 03:30:36 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Thu,  6 Mar 2025 12:27:52 +0100
Message-ID: <20250306112959.242131-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033038_766055_EAEFC577 
X-CRM114-Status: GOOD (  11.72  )
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0


