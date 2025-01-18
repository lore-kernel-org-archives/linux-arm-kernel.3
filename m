Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5968C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=; b=RdR14NSMWuXlSaY2W2Z08n0l+W
	PCKOzD9CIkFMRQGFbyE/zhU3HTzzpdrMunHfrCpAKfEs1a6ZjZDjfghld6M86XpV4KgbnAnCBt6Q7
	QhV60A/16zdh8KSDJvc4R8d3MThQAbVfIxNF1u7n4VnSRvS4xlRhq50yZU4fMY+C/IW89QHJ9l1uM
	1cQwfvoplcG+C7DFGpaNvr85lEuYaujYcQcY/iLFMRxrMcayE03QWWteX1L43jHvPFv6f7Io+aQUa
	pJPqnf4XThgOBesct8jPkgzGQhKlAmEb8x7AR03ofHyOe9S5onfnSSuPpycL2yDo4yyIdhMpcUkoX
	zTMJlRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Am-00000002Nod-4B5I;
	Sat, 18 Jan 2025 12:43:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88H-00000002N6e-0o69
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:40:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so5559054a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204055; x=1737808855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=Nvf9EUF00lVdZ43PS/3L6CmS9DBEEMr+mLzHat3PgGp1/+y0eOcO5GXl2NvDleXKF8
         cbewhMRfQqdEx6sdKC4zPXBbYynzV9mJi1sFjPLFijTalMyj1tBGnoUfbbwXJcYGCCXl
         GUangdwHZ/G3d6JMq7HEk6k++FrwKHnYkWZ4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204055; x=1737808855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=p7GtuwieJaMsoDSlt52awfKfixi5yaTFdpBsCHrVG3Kk+066I/+qiKh4MAJ2Z8tI5I
         2RIMeY7dH0Q5eS0zf8/681BfEdUplxRAkt5Lfq52BDMqRnG4O+cINqNpc/BGupYsivmG
         2+bYOaiNINETUdoka+y6B4UTyc5v9mGXlQ7NQaaf9fxcIPwI75I7Yo0r0ZbgJS6rG4j3
         iPZ8sXYDM6/qztanT/Z2uIVdkrtfAwTGnvzRcHjDoQkxNZgSHWNbY7L8YjEZhVivMvSt
         E41QSMYutYt6WFC2zQbF91nepOF0FHAGIpITOKoNCvPI4nczzRV3MuX0iG5LsTO00+M8
         JKEA==
X-Forwarded-Encrypted: i=1; AJvYcCUuAtIGvysPRaI7FemEibQ6tTpf5ns/RT10OFYGnFyx7YgEFm+bPIz73xrZ2PX08uPOr3sSnesoD8aRe6IY2qpW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8DF7fH5PNRUBDhKPpR8yP8D9PbWcq4RoAWbdAyp3dYLAlQbNo
	1yXu9EuFSdE3ddA5iMzxdzzbz4MJsx30DBMLky8IRi/Y9RITfoihTuy9h+DVKSM=
X-Gm-Gg: ASbGncu6VHXaSetfyijoqVh2YKXYOD08P4xBo/4R0RJtLnPxFMRT5CoUFSeCNRY6o4b
	OLTwRCLT8rFHHvmVGlfVfVpJ32eatgPnYpLfatJHRWpoU9hykYJejN1hQ4PtcrkmNp2UY0E6FEw
	WYgviBQ3fgbAY98G86petPS0o/aUp7Baq97WaMjd6k4i6Y8jWXWtQYG9uijVtvHIzW+ipo4P7Pt
	BzvyMKUq37vKsEknmGXPcIMvJ6Y+vUp/ENA8nxrXu2zxcPnYi5Lx8tbuePULlpYM7ZPoKfETSLN
	Hd33i1GQV299vZ+LaUHbl35SKh+gfnPu/ooCAu/fUW0OH2a40CdJql9+3lYguVHhZqjauUhg196
	++NEKmJIoNJlSSvUz7tmazAu8uDthfWDGNahD
X-Google-Smtp-Source: AGHT+IFVLDpIcKBwO+dD+xXnPSPpQI/dJgVuL3F3TbrvT19fgtmNV4YfFeh1dKsUSaBkkFqT0HPP/w==
X-Received: by 2002:a17:907:72ce:b0:aa6:7df0:b17a with SMTP id a640c23a62f3a-ab38b29b08dmr748505466b.34.1737204055561;
        Sat, 18 Jan 2025 04:40:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:40:55 -0800 (PST)
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
Subject: [PATCH v9 01/23] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Sat, 18 Jan 2025 13:39:44 +0100
Message-ID: <20250118124044.157308-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044057_229834_CC188EFD 
X-CRM114-Status: GOOD (  11.50  )
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


