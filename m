Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1125FCD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=; b=Fg4PY2bTZf5rQiN7Xhx4HhikYJ
	DHIlb+bOmU+NmdENrCbgvkPT2HuphujuxkvOAnNL8gZ++OYZgNCUkP3ZF2saf9xK4qZxgywAv3e3a
	oI2ZBcc0O1hwezGM9KJ0kYrVB1TtjMRoUkrR+xSn0YTu+datBg7aRLr2/UD06O/rw156eUn1aguXd
	vi55pSt0xGIul2698In5u0RdbyhQPYF8K7W5zF+4VLI5RpwoqE8VJl3qTgOIzHiDYxhphNntA9Hno
	2RKZgEXtLaEo2K08fQYk0UtJKcxSL//oV7MkhAtutgw0HR4p66gtP4E64GvHD+GpSxYLtp8d3N6ON
	kL0EzJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlw-00000005ua4-3mwI;
	Mon, 10 Nov 2025 17:33:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVls-00000005uWu-2fIP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:33:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477775d3728so17036655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 09:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796019; x=1763400819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=fY15wDqXxtkfeZ+ZF8DvuINunRsfOCfPuGxOW7YRniMNcGelDX2IOY5cMydNgni3Js
         YaDCvJdulQpHfZ0p9faIzp5BQ6tTi5SfB09er1cdu5REcldSckeABz9wdsXm65IbRrCP
         GgaqVRKf/7+yIyOZ+xyRpLrgRySiWjgBe4L4YG+wdYnKFvZUKpMFa+wiuSOsp9l5CFFB
         3uWR0hll7T9r0laoNF1Xc4gxp9FTIbQOYhkEdC5pT5ODKFccbwEUbwcCGPEfMCpRcEBm
         BkCQszzTZq7pS6MWAbYJcXilRWT4Bx8zdMi6p/wbrZTyZCNWdXSk2yqR0R9SEPeMgEvX
         TFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796019; x=1763400819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=DR+VyZqNttrUzO1eO+qfrbYqlsLMIs/pm3QyFVNUWGczBRb7afoSFbNB5sVc//RDoB
         XfKYSEXe13U1T+plYcfKYoNvZG1DzRSinb9Wjoa8s06XUWuumPsZ1c7rVNDKHgVMnC9t
         YE7idbn7Ppa2BAeMYUVXaQO2rY95KXRBSC2VlrFvw0yGKd0vLf/lHlrJ64i+Q/2WNV0H
         05Sjjn+0N7wpztCLon4Car+ZKf/rwvRxC/6a7am21sY9vIKs9/e+86kbbfavFOdh0S1R
         feNb5pZo/0htqR/Xjx5i/5gbHmc2AWTQE3Oj0pLeHYdm8/WwNivEC+kwXH/SZU7g3dUG
         csIw==
X-Forwarded-Encrypted: i=1; AJvYcCUx0cE193zFUHA98bXRMor5FeUw7bfOIikea2hv2qxezW5nxsn3XIZM2DYmMYiS9MVd5Os9BGrDFzSLGlk0SfWD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvy+gXXBa49PomThu2w2ajQE2mqGjumaksYxGq49y4fzXHDLyf
	2tkHexwUtHYYXMDiPQAyxpCCjQcv8+QyhRW6gw5uvKvozhiPFVCEm6lkzLErKqGxAbA=
X-Gm-Gg: ASbGncsByav+gVl8xNZJ5JSG+5FVGc5aSRZLpjpg4xMQFBElLTHJ5hcmyl8QUmWL029
	R94K7fjNJrkcgmTb6G1LSsSpJ3RFy/0irfpiTsJzRO7Na/tlBFsnkTD1GRP9JBFDL2CtbQOrw/O
	qrImvW+aairch4IfUYYGZK+3OT1u7UVelwCogAJrOzxjfRbjKsL4raqVi4U/z0LjxJ5j9VBfsV8
	7VRLZzXzMK7nxQGXDXn8Up3lfkIG9p/WdRY79sK9TD3roJIIHZH5M28u/Sn5YYU07nWZPxXuF3w
	ndnXqEoGRKfPU8T5deqf9/QsTE2ans738ppTz4BSGQti/piQCwvbPCFKXdVdR54pTn8J9/ese4u
	EQHzrN24BpOPEZT2mSzl9Uah8jtQSapZDHK20bnVmddwRRJcyB8Em9Vs/bgRfJgX+Hs6sWzQfC7
	FLMBzFAgCDiPlunsT5StU=
X-Google-Smtp-Source: AGHT+IF4B3dSxsq/6aCmBGqen4lFZOQM6R9kmpQqCIpNgVB5XME58ogi9bfcWf65NAevay4coklcXg==
X-Received: by 2002:a05:600c:840f:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-47773271943mr83366585e9.21.1762796018775;
        Mon, 10 Nov 2025 09:33:38 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:37 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 2/4 v4] PCI: dw: Add more registers and bitfield definition
Date: Mon, 10 Nov 2025 18:33:32 +0100
Message-ID: <20251110173334.234303-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110173334.234303-1-vincent.guittot@linaro.org>
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_093340_700610_F433A7AD 
X-CRM114-Status: UNSURE (   9.16  )
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

Add new registers and bitfield definition:
- GEN3_RELATED_OFF_EQ_PHASE_2_3 field of GEN3_RELATED_OFF
- 3 Coherency control registers

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ec..e60b77f1b5e6 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -121,6 +121,7 @@
 
 #define GEN3_RELATED_OFF			0x890
 #define GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL	BIT(0)
+#define GEN3_RELATED_OFF_EQ_PHASE_2_3		BIT(9)
 #define GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS	BIT(13)
 #define GEN3_RELATED_OFF_GEN3_EQ_DISABLE	BIT(16)
 #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT	24
@@ -138,6 +139,13 @@
 #define GEN3_EQ_FMDC_MAX_PRE_CURSOR_DELTA	GENMASK(13, 10)
 #define GEN3_EQ_FMDC_MAX_POST_CURSOR_DELTA	GENMASK(17, 14)
 
+#define COHERENCY_CONTROL_1_OFF			0x8E0
+#define CFG_MEMTYPE_BOUNDARY_LOW_ADDR_MASK	GENMASK(31, 2)
+#define CFG_MEMTYPE_VALUE			BIT(0)
+
+#define COHERENCY_CONTROL_2_OFF			0x8E4
+#define COHERENCY_CONTROL_3_OFF			0x8E8
+
 #define PCIE_PORT_MULTI_LANE_CTRL	0x8C0
 #define PORT_MLTI_UPCFG_SUPPORT		BIT(7)
 
-- 
2.43.0


