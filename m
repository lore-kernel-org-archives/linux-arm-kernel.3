Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80174E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8SU2g1cyJY/YhurmsY4xoxi+5SPo4QoddhIipRwE9k=; b=AENv6rR1d2Guz4nK/ijhodJHm5
	a1lGyU6vb66thkRrB/2BQc+Ked5v8iPEe4Ka/svg8hqJEuNzxLZ2z3lLu2Hj/Y9VUtiEtOBZYYt1k
	h4qFAiOkc69jAifzQzZjSmwU7eW74Hv97/e1rY6aluHV9/diH9Oq4pkIAIfq8wvjMT2o4US4Ow8Is
	3tmu6yKmPEj7ZgtBYv5rY7TtVk82XYpuGTSrVSMF3vYDT/yQW3Fj18sN4+ZJ6xg+VLZsPbVIrArrM
	EBHWP0bPqJEqMbS+NLoPxCkRDNd528L1VBOGnVYUp2kk0noBVIuI1QzQZ1fLyNOvVzNQvec3tATpY
	lDl/cUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE2J-00000000i1q-45lb;
	Fri, 27 Dec 2024 17:22:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDev-00000000ecX-0iye
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aabfb33aff8so1295474766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318676; x=1735923476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8SU2g1cyJY/YhurmsY4xoxi+5SPo4QoddhIipRwE9k=;
        b=ryZ8VkwsRAe44z8xahMqbuB7+FxgDnrpY2A6YeN6vnYWSRzfxGlMQFUFhqkhFh2qpj
         c6ePiqUcI1CwI1twPYG4ykg4IUizWbX7I1LJR1synAG9rKf0JUB9yIwjfraCHKQSTEd3
         Ywur6jSInN0IQSLe7RPbBmBobaxSWNPR/JU8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318676; x=1735923476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8SU2g1cyJY/YhurmsY4xoxi+5SPo4QoddhIipRwE9k=;
        b=p5mxMQOMHl36tpC+1pRA8MuQlvMli2yPeO4v4NUN5oSlX7gGNR77WT5q/Xv07jFsyI
         M+Nz9BrNjg7jqyK3S/x2AgiqZGpyI/ONvSI8sberm/yvzshuOjh7VSFH51UkuZMdwEbt
         a4sVVIPUgt7UzSdlfbytKI8N8MhQrc+XmzyD1Sm1kCeq9Kcnw1UkDxU9GJ4JDJEkWUvm
         b7z43OjMlAtkbs00Ets5rfmrklXJrCZ0SxOatPi2J/sWojbaP8K+LIfFD5Yq0okgKOQc
         1x5z9Y0cASO0Kf2q0Fm/35ja3GBxNMuJB4QdUL2xwqcJ2G55CKBC+bLWmJeuT5D0Vze0
         YxYw==
X-Forwarded-Encrypted: i=1; AJvYcCUBeXVqj/W30/nXhUV2hBJ2eG+mfw3dJwsd/SeWoj1u/yEyVuemcBmW8lGLVH9tzJZeIv7Ucw/sJEG5nxlnMOrw@lists.infradead.org
X-Gm-Message-State: AOJu0YxjYay6D27/tUZqqNoKlgUGtATxEaU1C9VDRkYgIZKo/MaEQKjg
	slJmw2CYZKIdQl+jVQc1d+ErrK+Rn6rcJTCnd57GhF2BHh7P1IJQnTLkSROS5Gs=
X-Gm-Gg: ASbGnctERg2XPeU7He/NUopzzZnapGihcu9zdw1N6qWSuL4VE+Y86+Yn7vD/RGY9dWb
	ypc3lDmDC94YE8b55rrFLc9NOzKbx0eKgtBomcX4jOyTVhHjsAMAAnpnoEfbUFzNLLgIEnUm2ku
	gE30ZWUMToQzXOTTE3I9SS6zgBNOLBTFFEHTt5iePA5lt4ipS0lHnDXINHN6jSHVs8WsgkADqqH
	eHiv682INFh2ToLRAEjeCy+Yp4fjHaM1LZbR4HX9FBZdzyHQuu3CpKa8ciWCitkAIy+1rQJsjoa
	N+4ikOlinn1wL2+FlC/XUA==
X-Google-Smtp-Source: AGHT+IH0lWPZ7CSr63+Pe3YNPdP7iCVlRpFAQ9r8ey6JfEjfuzqQLJzkM3y+9Wa7RLtt+3lup5Nlpg==
X-Received: by 2002:a17:907:969e:b0:aa6:938a:3c40 with SMTP id a640c23a62f3a-aac08228246mr2206907566b.24.1735318675830;
        Fri, 27 Dec 2024 08:57:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 20/23] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Fri, 27 Dec 2024 17:56:23 +0100
Message-ID: <20241227165719.3902388-21-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085757_212295_E8332522 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a1872b5d6e2e..ccf990a63372 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
-- 
2.43.0


