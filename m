Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAC9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=; b=aZpC43ZF/an0glnmPFdVKERxbR
	ohXFNFm0yFwVGpyAWPsWhO+FXQRYqixDscPsSoQRAzIyzLXRqJmWbo5A1Xr7dP1wbc++i8NRNVMht
	KD75hbpiccPYniXDCCB9UDnPrJbFEFAp+oL1A/ST0PuH2KHA48UPuJX1DnNy0bPIKF7ZPBYz0AztK
	4v5D5pFWJY77lSA0aDV8zKWuoMw5V2qilF1cnMzMt1/dTWPPHU58SSrlQvq5NYw+VjfuH0DKh2Rzi
	hAfJ8yn4SfL3zVpx8rn80UDPrU4+eFSfp3s7mRlQQsv4d2rv3xiJdzIyvFlq3GmSYFaP64lFLwYHF
	gfA9wMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuf7-00000003WWP-2Qot;
	Sun, 29 Dec 2024 14:53:01 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuck-00000003Vuk-35mL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aabfb33aff8so1483795266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483833; x=1736088633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=F4LNh4EnIF/uhjHw8CSjtNy5Llj2UIdyq5GR2lAXpohgNzkXt0Z0ocHu02HwpnjVV4
         hWn4jekHKvXTU0fH3ueONzX7KEJ557hc+JjXoI4Z3dSoe6p6cxsp2yhQY8BM+HvyAZ35
         wF0Yp6YozTDoaFYJJca9FtFeTyBI5qrEv3Ckk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483833; x=1736088633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=AFZf9Zt/cYXX3CQ4dmjJrtSo7Cwm+KqQk7i3VLaC1HZr1nUa/Ajz1/3ipKZlTAepI3
         3+xytuXPTnjsqnNdvRA5vVZ4SRFjPK5wpfXOQxZcFb3EM7UChVMqVCofTKL+ml5TnlM5
         9V2i2RghSDVzs1+R0Xd/jGrlvS3Fy1Lge2K+3wEMKR27L+cDe5I8gYnrZNQpOlieLU9a
         QoyimTdTquqKGlSARgFB2DB4uOiafNnLm7A4+fR2ihezo1PFzHCrE6xLrsakHRlcYWbQ
         0INuAuto8AZ7RFS81JCWm5hZBeuaYKvFqiS1uQbrxAtwoVKoLbG41ChiGR6DTnsPPPjU
         /IQA==
X-Forwarded-Encrypted: i=1; AJvYcCVMBNndQ5RONzvFZODNvhSroRNk8PWaMBfCNit3oytjTcyat34eOqJfg3g5wGSx4Mzh+ecVJJs1Uxzi5d0T+YzI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8o+Pd8ROvw4r3XN6AcFZN+Quvmt40Rn5/0SCJjQJdGPjsXLRc
	c8E6M5yqpLZTkMfyvMuNCE5mHhrxfn7rApUG3/5B6Y778oUygBbd1LX9bQDiJ70=
X-Gm-Gg: ASbGncs4fdaZXEqAScX1Z7+EqJquc7EqMpSwwTBcztVt1v9COKAXG9/yQnbNR7jRTuJ
	YoSpPcDMIMMk59RRRF3L/gSBkiyVwx678boANfIzlZsCDF/6i+JAv6Ondso/ccT2obyKSqtu7rV
	UX4mxN4zGRUt8tO9vbV6tcVZWtvEPSTvvR+lJd3+gu8SVjvJI4veep84FJ8dks2NKR/KuwJBVMk
	JMqI23qcapZ0COvP7HDX6VFt6nCK95HvRtCOaz/Scabt2OJ8yGueLfoH0o93QdP2TF/JQCmu+aU
	vxt8MEfA6Pq+pGlYQnSVRA==
X-Google-Smtp-Source: AGHT+IFV6+DUifWNgtI/l9xv/1AQmyY+vn0i8+uFyhjAZ8e8hW4Xl/fClO119sqnG2ifR6YSa9Jbvw==
X-Received: by 2002:a17:906:415a:b0:aaf:c0:be7e with SMTP id a640c23a62f3a-aaf00c0c9d4mr1166766266b.29.1735483833021;
        Sun, 29 Dec 2024 06:50:33 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v8 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Sun, 29 Dec 2024 15:49:25 +0100
Message-ID: <20241229145027.3984542-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065034_771935_61F53E7C 
X-CRM114-Status: GOOD (  11.34  )
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
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
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

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0


