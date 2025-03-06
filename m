Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E218AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=; b=Fykf+EX4Xwi2L8APQwV4l2qP+7
	n/MFElgiuUsc+koG7dvKDPQZc6iE1k2JmJT+th8N1s++r8Z+S/6ELAX+2XM7kR3PME95t3LK2UQ2w
	ic5uAM8FZJHd7puOfXW4bf6w6heV61FGbW3hmFv6SnhsiSdW2fKmGJoaVLNXCfJvDcuJmlzllUQVl
	LBzIZNeOuncHTXOgrBYlme22OMRDsdLivx9GGYviqxx1IYhgi3TpcxJZfkax3b3t/SQ39cES2OMbS
	PtwFfGneXjzmxk0GMc/iRf+BsD4Mhrt3KrakY7tGI3z/IGAVLtzt+Xnu69PKF0j1hwlACLlLEYzZ3
	THZOdPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAtI-0000000AzXy-3Rvt;
	Thu, 06 Mar 2025 13:03:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Qx-0000000Amh9-3ob0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f403edb4eso309130f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260634; x=1741865434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=NVLAMYMNvoMtzrjj9r2nVqeBnNDi5vO4oZky0jG6zuCbTvmtXB4gkuik2mRuZauDVS
         lN0E8+lvKrrrgkZ5vkTb6r+EYuNzmayLx6F/0wvfkkSqOMFBc8CjfWM6aBi7lp8gtk4h
         npeoX2nVhi4YKVrFSpjPEkPRpXAKZB3LnIVTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260634; x=1741865434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=nNsjyobV8U0PAQ2W2FD2ksJOFKLUyuic0T2I5jG0CIinKYA0dlXvG+zrtJfZ22ni4H
         A66er7UnP+SqyPBooiFZ6MunkdikxVpD9WSfjLgH17TFqcPjafihyYaRBWH/vDqY97yq
         MIt84EUJFmL7biriqbReDafdRZi2TomIZLcwfd/Qm+NthP/uHtU2ElvpcVtL6OFgFqkI
         dcrdCV0QZIq7cPkKQeJWgDwvApuQehARnk1oO8pV2FRlhwpTHaI17a81Os4xLtmdma/D
         V0sdU1hUb00FD6/9mkPlnuZauxKRI9K/fA2eoumqK3QwZeiYGz6tpHGrT51TowLiWDlY
         CNXA==
X-Forwarded-Encrypted: i=1; AJvYcCV/3JgjC/XQMSHROC8X3H1xXxAeufwN8Q03xGtafWDANpp3OjyiHYwvJXadUI0RqnUli+hHcNAkznLl9KjEeQEd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9sAb5HoT3simm0PoCafe0stkWpIsp+6lxnGD7PC8NPduDyIlm
	0UJd8E+I6obCfs06dmhCelc2fdK97JlsYMcoZAPl3rF5VxrpYIECfv7rlBV65i4=
X-Gm-Gg: ASbGnctaib58s7WRMZ+r91lawYW4F01KrvPIt7Ibv3tztxWNWjAm3NKHudOyYw/SOWi
	R5o0Ce2C7G304hPCfQHNnNSJjgtiFDo47F2DE32SRalQ2h6LKBQvFmoSNtcwobnU/GPS+JwQB4d
	7u+TwvWjSrBojcr1ynu8a+O3iIiMWy6yim4eZZlEra9v+Ti/XQ5VdBn8ZnR9L+azSmCTKv/QWai
	KgowGVDrAutf6IWO1Fq0C3wQwvpn2cVKhGvluAAE5S6hR+PHwx+Cm/TdhbStlz9lnBfTJpkr9l3
	Fp3hVHzu4+oPju+AsCNHE34xSOebiOQd/X7j2orcaRYJbv8AzFSK7/hMqIoTPYmrcTp1Sg7J3fj
	zfGi6cQ==
X-Google-Smtp-Source: AGHT+IE/gkxbTJgrx5WsPeKouxumhVaFZMtJX0zav5Vxl8++ByMzD32+sUdGSHcbzM+0gAmJx3MEGQ==
X-Received: by 2002:a5d:64cb:0:b0:390:df75:ddc4 with SMTP id ffacd0b85a97d-3911f7cba2amr6815821f8f.44.1741260634196;
        Thu, 06 Mar 2025 03:30:34 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:33 -0800 (PST)
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
Subject: [PATCH v10 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu,  6 Mar 2025 12:27:50 +0100
Message-ID: <20250306112959.242131-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033035_944913_F5E481EF 
X-CRM114-Status: GOOD (  11.82  )
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


