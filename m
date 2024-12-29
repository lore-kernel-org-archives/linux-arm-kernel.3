Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7478FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=; b=tLZ1KELFCqkVp6sc1rbLIldDUl
	+bcRkNVi8/RiHHFPgdfkWpEYTFWBmjbWxwMtNwToEDxRKVc2mPETbrtqToVdmfH7IC6DgGE6LdzPQ
	QORSAbz+cngFZifIOwdEbw//bJ237YKT2dCfqMYF9SxwHoALfW2D1mC0jN6T2qPhm/gbox5jFSV8w
	/EclJow1ogpC7yfnk2H5QXXgDLkBWox8TBVuHK15C387R7Ca52R4UZ9Z8nQotpZL0MRSskqD/bJZe
	jLzD7FtQJXB+hoD5Y0pD0JNCa+WdunfAetiehdBPam8STVJPRswAWpTO5jzvSpBsXbOX6akeG4RVb
	W/ZQdN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuhU-00000003X3U-08gK;
	Sun, 29 Dec 2024 14:55:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuco-00000003VvU-0pQN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaeef97ff02so714197766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483836; x=1736088636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=U6jUJuCOJtWMCJWhQn8+BKsoESMmRH8TyndlNbPpf3IP3CXxj9Jh2jQeQJowAwcBe9
         0eHrUZM4pO/VuD5Eh51NrQ/iNbW8oyuitctHF2RNf5qlr74mzXHNxfT3UzW/iJsSI3/Z
         fVJYwqjvqQ1GhIjz/OrLUSrBCrqD54oJjHrXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483836; x=1736088636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=PnaGNx1stCEPjg8xKJg/aqBu8qJMyNG0Fz3h/b7T8JLLGJH5bcpfqWJLxXshlcguNv
         nXzsAPSmQT7PtvbW8Y92u+ZiyAWhhwhtWbHf7ZyklS2edag8uuD9e9uaLRHXoudq/Ra3
         d8Bfx9Si8qYjmj7YNJRSku3rPmkhuar72Y31P21H8QJ99ruc5jNBrS0x7epRdq3KhH9i
         xfdFkiZMFADFIssa2lpKYlMLLq3wEnayyfqOMv554TbZGQ46o3sNex0aeQSVeYjYfZEv
         cAKiyVoLbBTGrgs+omPV2Qdu6IZaMd5y2WQTA+XttPvPdb87tQ9oM5YpXXLPAawBDv9F
         DocQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdVjUf/05k5Qiw3R49yykeVjzJoH5yHGgd9l4ByNjns96lGd+/AmQZhBqYZOpcQ03O3hkNsrb03r75IA77QiS6@lists.infradead.org
X-Gm-Message-State: AOJu0YzyoM9Bk1p48zGTaxUEI9n+8AyoyGxL18DZJ8TdzocpIFh6rS69
	LTKJupLbGHMklO4nmLmlCHmdw6zcCBnBt+nzdFjkxiEH0/Dbqg0e+BHj09NbcVI=
X-Gm-Gg: ASbGncsmT/zarqtzkl10uTWaWe0GVLFE8tPw4pGo0YIn5AqMuYmgTxxnqEKWDBetnsC
	kioQv2QQk33JndsjHZ9ogqYl42YtQLchKVOVeiDxbbCYTYvHc0gZYqaIYiXywLsGYt8wU9+2PTr
	TVtPlEKoJLGY/o76L/6zE2TjpGKoHsoQNzMNANW9JTjdyqf4QJj/YsHTY1uUqMMNqUjG9WRJoCI
	LTKrDVvsUxB3YCZRTaYvVIPPqFI0aSEk1YXVho43BAeNXZHaEIF8MZvKD47ODXk61EGQlYFMzDD
	bovjnISp4uSU3ZfBlAKJYw==
X-Google-Smtp-Source: AGHT+IFnuv6eSrJEFnSGoJ55pW6N8ZEy/aXetue0XOxKvCv2upMLBhB089HmsyjDVf6iCwLAHcCppg==
X-Received: by 2002:a17:907:3f89:b0:aa6:9624:78fd with SMTP id a640c23a62f3a-aac3444eb22mr3253470566b.48.1735483836473;
        Sun, 29 Dec 2024 06:50:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:36 -0800 (PST)
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
Subject: [PATCH v8 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Sun, 29 Dec 2024 15:49:27 +0100
Message-ID: <20241229145027.3984542-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065038_263221_65F59436 
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


