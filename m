Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745DCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=; b=gOrWsSg0ePLxFkIw61GiVUUMhO
	F6EsfXZ+4Z2/Gr7SZCr0o+6LlJnLGzmlX2WhQhjQmfZOIXjDZSsA1XJfTmGItBncwIeJjv9Z/YA05
	FEXakIuKBDn2Hl9tUP7RdgaVTow4gtxQw9wv5+RiOIhQjyoMIpfc+cORBtcnha2VdX5jvrgWPvAlL
	h+X5GeNdVL4MYnoRslapjniS2gizdikKSTRJKrUEjksC1OaOk0vsCqJX4pkzWHUfJDqMF69gz/teU
	VOfC+oN6nEE+1uQLWrWI3Slc3ul0/nmKT4QHLs6atQ72XgGwmXwnbAy3NTuqBSO+2gy3RqwKPvSDO
	Rty2EhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDj1-00000000fdc-1MAz;
	Fri, 27 Dec 2024 17:02:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDeV-00000000eSt-0y3v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1083951366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318649; x=1735923449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=k5BRriaNg3EVHsRYbBRPzEPBlp1N9PWL3ayL1KGYNhvkZvilwr0m2X7qUPQIC5cm93
         QO6jbfLSwEB4sPfiwBs+7rqVm5dvReVI8oeVLdS+cN1goBqJEV4Qjpf9suTtBkHQIG4S
         4vrxRT/UL7aloa4hd+WUuP0b9A6hjl/5jo9bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318649; x=1735923449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=Y2xnMQ33BwWcOWDBF/bYvEO58hgDW+FqzZCFwy2XPiMGX3nTeV7fUuiwF0tiNzP7N3
         e1dnbq5ydmE7T9z6mJOH8VoLI1BuNT7KWVdnAETYzYJ4VWheSkUYk/VrbW3LoQFDmdej
         xIIDlOEK4sf5kjzn+7h3FitPeNPdgAMtMBwJP4I304MvO5SLN3XLq1p/qcfCVxoU0nzx
         s3icZpVVjuDmtCC9lrLJNO/BakdTpx2I7TyPuhG+OYhlixaJbg9bPkX6CY9atfTKSWh9
         OyXZK5EtaVaNt0Vz9rAbRbrQVUeuL57+/FGWqfK/sRWPOhlhojeMhbEqROT5WT6m3hPy
         s15Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQnCF55I/EDfPGZAukgJakVaDfCReRWAWq3f0MwbP3ah/DDVpw7jt9Jb9P9Nkrz04nv1NeGcfu6ZyqrSDqtFM3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4SsuuCYK3va9nG1PI6KIJfSAVwRM1rbRxrl3yZtqvfo1CVYDb
	TZqcO1VFJFzt1cc/WLxDshHyHVMEgcNJS8qvgamXnCkOm8toWCF0YqWzoHnsK6Q=
X-Gm-Gg: ASbGncumvurmmII0SnoTALVNR+YV1jDqSNuyUMCyR2jDZKk4/AhRKxQijFWQWafA4Td
	NkNKnEs+eztF8vPQ7e8g03qlr9/cUL1l7gSJErk5pIZjTwXk6g8qb6uXR2OUb2TR9pVVioNfoYu
	IOEY29srG94R3E0QDpm7ZqurJ0NETS5uOzTR/9lXuqK1nJKejTd1r2vfntyTiBrpTLVWpon7idR
	mPVZlPRlTQXSZwldr2AhD86G1xo68i7RvHGAQR93xKBXx644zeROJOH1OoH4BeEAQjcKF/oHWO+
	Pbic2v2jy5dBEkMUeg5WhQ==
X-Google-Smtp-Source: AGHT+IFx+qy8M9nbBtV4lkWk1CHCAzysU4JJGTIU9Blyy6kuVAhYju8xODoJ5uqYIFLq0x7fFfprVQ==
X-Received: by 2002:a17:906:7312:b0:aa6:9461:a186 with SMTP id a640c23a62f3a-aac33549f50mr2397618866b.46.1735318649395;
        Fri, 27 Dec 2024 08:57:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:29 -0800 (PST)
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
Subject: [PATCH v7 03/23] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Fri, 27 Dec 2024 17:56:06 +0100
Message-ID: <20241227165719.3902388-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085731_269113_FF93C05A 
X-CRM114-Status: GOOD (  11.25  )
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


