Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43054D49780
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vpGtyZ0NLJqQmHQubdh3p8VNW8Gv2lh2Riw5LPZEts=; b=H19rMNgkdte9pInv84HgiWbo73
	laQKA6zUWCTKPiU48BhpcEnnxsUKujgpsIH6wzgi2vvKgKmyyfNmnSKU/EjyanOTYipO0VTyhob1w
	dF+wGHl2nitKj0i6mFy0asmJgszilnOtx7Lv+kDZQ9pzaxDKWGO/TD3B6tiwhLsUbuSkxKN46CZv2
	DGgtfvnkdqoG3JbRW9OGK4h/T6PqEoMYnN0B6bHk9CzbJHQ8miliFwputyhlGUyB9a63HFLZ7m6LA
	WWsmjCBfzUuhBPQDwz4FECPV6RqHIKQEf6cNYaf4MB3ELaQesjcdecZR4l1pXGHBudBYtCRmbBjp/
	i79tJpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoB7-00000004A97-09bf;
	Sun, 01 Dec 2024 17:56:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2e-000000048UD-3l2x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:34 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa5366d3b47so567777566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075251; x=1733680051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vpGtyZ0NLJqQmHQubdh3p8VNW8Gv2lh2Riw5LPZEts=;
        b=m6WnYWE+xR/t/9NI5rvu9I35ZChS2icq6wN3BNAB31SShVMjeZMMggrJkIunsdIpmy
         NJlB0eN0ePcLvKfKKQKxp27ricWbslji6GejP/qZR7Z0LAGfYbxwSzg9a7vBF0QsESeT
         oc1eNYpSo/DYUd2LjeJjY3XETLH3I7v3MgLZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075251; x=1733680051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vpGtyZ0NLJqQmHQubdh3p8VNW8Gv2lh2Riw5LPZEts=;
        b=ndnRyxOr2L+ghfofqRmX4MdKaWK+RiVzFj8DYEKLfmhYyFtBoDw0PunEk52MV1N86d
         tZB9srNBQ55tNHdfIFtVdF4qE5aHZqDKAImLj8rjHsR3oKLHGvLn8h5cB/ZSkQ9j1CbD
         bl9p4efNQ2lKwIptOlHHAIWg9MR0ZC8ps92n8WtOcv2wlD0yaVTpzvgKsGsS4qrjov/l
         AEqfbq8Dig6nou4nTm23+ulxPSvcBT2MFc6xt9Q6ab+IX4XeI0oL2C56Rd2nQczkTGBu
         DeXup39E3xA9QL7vn4Bi5BMDXUbats8EjH2i5ou/V3FMixG2phq1XRyvIS1vlSLDzBLq
         UEdg==
X-Forwarded-Encrypted: i=1; AJvYcCUEfD2zkqIbOL7ss/VVWToq9/5vKFKYCK6qIsqLuwrDH/46q945vtpQW4t+3vs08+VHYTEJMX4DxuxGhUUrQl4v@lists.infradead.org
X-Gm-Message-State: AOJu0YwxOErmAuf4wKxk9jVG1PJSu0L2PqykE7ZPT92GH3G5kJDaPbVY
	uWe8x6/SkPSgY0dfyNkRMV5cx06uk5GfXEFXydeEy5MjDJ7jn6udxe8lWVuQYJ0=
X-Gm-Gg: ASbGncuWQakTJwA2YSW+NTo9BU+xBAlrzje8quaprRvy+OuTc60mJoSzIubm4EgfeK9
	6ZBbCP6R1JnYeT1R+RrZ/cebqeG7SGrZb+nojumcCtfN+sH0WuqTws+5sDI/O05Zyr3O1D9r89t
	lckyIhz6b6djCbgt0ptkYh2ibArX8Hug4nMqSssfrV8r7WfvKJ7vkIqtfFiF/0kmXUJRbrXvZEe
	EkTPTLjs3hnPIXH1NMpf3Xcveto9pwFVG9nmOWp/8ZWJM0cZcZxlo7s9pkYpaB0T8110G8x9DUV
	82SNk2mIk5i8uWVw82Th14B4RiA+Mfd6h+M4BQRh4Z7xSjkaNNBI1QAyTXmf7kvqlE70lsXA6/c
	AV7/yqcRJ0hzNhULO
X-Google-Smtp-Source: AGHT+IH6kOma2DObSZmZth2XtVd8Da7MknZR6nKDqDOJ+2Riopq+leVAbUkamxADzB83IjOAlOgwqg==
X-Received: by 2002:a17:906:23ea:b0:a9a:10c9:f4b8 with SMTP id a640c23a62f3a-aa58109dc28mr1664550866b.61.1733075251568;
        Sun, 01 Dec 2024 09:47:31 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v4 08/18] dt-bindings: clock: imx8mm: add binding definitions for anatop
Date: Sun,  1 Dec 2024 18:46:08 +0100
Message-ID: <20241201174639.742000-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094732_933516_3B188258 
X-CRM114-Status: UNSURE (   9.14  )
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

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 include/dt-bindings/clock/imx8mm-clock.h | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 102d8a6cdb55..1962b0a1e732 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -287,4 +287,70 @@
 
 #define IMX8MM_CLK_END				258
 
+#define IMX8MM_ANATOP_CLK_DUMMY			0
+#define IMX8MM_ANATOP_CLK_32K			1
+#define IMX8MM_ANATOP_CLK_24M			2
+#define IMX8MM_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MM_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MM_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MM_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MM_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MM_ANATOP_VPU_PLL_REF_SEL		8
+#define IMX8MM_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MM_ANATOP_SYS_PLL3_REF_SEL		10
+#define IMX8MM_ANATOP_AUDIO_PLL1		11
+#define IMX8MM_ANATOP_AUDIO_PLL2		12
+#define IMX8MM_ANATOP_VIDEO_PLL			13
+#define IMX8MM_ANATOP_DRAM_PLL			14
+#define IMX8MM_ANATOP_GPU_PLL			15
+#define IMX8MM_ANATOP_VPU_PLL			16
+#define IMX8MM_ANATOP_ARM_PLL			17
+#define IMX8MM_ANATOP_SYS_PLL1			18
+#define IMX8MM_ANATOP_SYS_PLL2			19
+#define IMX8MM_ANATOP_SYS_PLL3			20
+#define IMX8MM_ANATOP_AUDIO_PLL1_BYPASS		21
+#define IMX8MM_ANATOP_AUDIO_PLL2_BYPASS		22
+#define IMX8MM_ANATOP_VIDEO_PLL_BYPASS		23
+#define IMX8MM_ANATOP_DRAM_PLL_BYPASS		24
+#define IMX8MM_ANATOP_GPU_PLL_BYPASS		25
+#define IMX8MM_ANATOP_VPU_PLL_BYPASS		26
+#define IMX8MM_ANATOP_ARM_PLL_BYPASS		27
+#define IMX8MM_ANATOP_SYS_PLL3_BYPASS		28
+#define IMX8MM_ANATOP_AUDIO_PLL1_OUT		29
+#define IMX8MM_ANATOP_AUDIO_PLL2_OUT		30
+#define IMX8MM_ANATOP_VIDEO_PLL_OUT		31
+#define IMX8MM_ANATOP_DRAM_PLL_OUT		32
+#define IMX8MM_ANATOP_GPU_PLL_OUT		33
+#define IMX8MM_ANATOP_VPU_PLL_OUT		34
+#define IMX8MM_ANATOP_ARM_PLL_OUT		35
+#define IMX8MM_ANATOP_SYS_PLL3_OUT		36
+#define IMX8MM_ANATOP_SYS_PLL1_OUT		37
+#define IMX8MM_ANATOP_SYS_PLL1_40M		38
+#define IMX8MM_ANATOP_SYS_PLL1_80M		39
+#define IMX8MM_ANATOP_SYS_PLL1_100M		40
+#define IMX8MM_ANATOP_SYS_PLL1_133M		41
+#define IMX8MM_ANATOP_SYS_PLL1_160M		42
+#define IMX8MM_ANATOP_SYS_PLL1_200M		43
+#define IMX8MM_ANATOP_SYS_PLL1_266M		44
+#define IMX8MM_ANATOP_SYS_PLL1_400M		45
+#define IMX8MM_ANATOP_SYS_PLL1_800M		46
+#define IMX8MM_ANATOP_SYS_PLL2_OUT		47
+#define IMX8MM_ANATOP_SYS_PLL2_50M		48
+#define IMX8MM_ANATOP_SYS_PLL2_100M		49
+#define IMX8MM_ANATOP_SYS_PLL2_125M		50
+#define IMX8MM_ANATOP_SYS_PLL2_166M		51
+#define IMX8MM_ANATOP_SYS_PLL2_200M		52
+#define IMX8MM_ANATOP_SYS_PLL2_250M		53
+#define IMX8MM_ANATOP_SYS_PLL2_333M		54
+#define IMX8MM_ANATOP_SYS_PLL2_500M		55
+#define IMX8MM_ANATOP_SYS_PLL2_1000M		56
+#define IMX8MM_ANATOP_CLK_CLKOUT1_SEL		57
+#define IMX8MM_ANATOP_CLK_CLKOUT1_DIV		58
+#define IMX8MM_ANATOP_CLK_CLKOUT1		59
+#define IMX8MM_ANATOP_CLK_CLKOUT2_SEL		60
+#define IMX8MM_ANATOP_CLK_CLKOUT2_DIV		61
+#define IMX8MM_ANATOP_CLK_CLKOUT2		62
+
+#define IMX8MM_ANATOP_CLK_END			63
+
 #endif
-- 
2.43.0


