Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D99CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBgZ5OtYg07NCXp61kXr/BSbIWhE2fs8T+/yOfxFjCU=; b=mFhXQvCYkGHeCT0A04hfn2Od3y
	jjB+tBUB1/k1raHj41y+jsjaoHkUnNB42X9QKAgBd1jIlvNS76e/Oyd3ixadC3xY12racQH5OigSq
	4ROKV5o89ZQ/hpcL+0YR5jv48F9JUMSb7SXMuEhQBK6aA43bfFhfRffHnJEk/imyjwMiUgl9OgCFG
	TyRop159vOCCiYgu0GsspXl/YX2YS0ZCO2DrcCO7YDZe0zia2d+ktdAzdqTkEiJ2R676UH6tbu7Fe
	zeg/kroRNGg1J9Vj+vRo9GUvrvzTX7ziCp5vXRHvwVhtpbJUjtnrc4Zwk+zhj9TD6qTqf36VHZkDT
	bkwwqZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcru-00000003pw0-1nV0;
	Wed, 22 Oct 2025 17:43:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcro-00000003pqz-0ACy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:43:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso812151f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154998; x=1761759798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBgZ5OtYg07NCXp61kXr/BSbIWhE2fs8T+/yOfxFjCU=;
        b=RQ98VXo3uUXSkovwwQRLLjbcnM+ckDyRzgiI3wUhPT+Yjodp+k1CBLd/jCClmZ4YnK
         1ditxHpU8qx/lPYQAXQnBJa/5mX6Oe5M06lyvFFXdTxNfBtxCBQYJrd1JXM+6uB3IuSC
         ALwWcv/Fx4O1FMFI7EFTXNP8f8KMXJiEB6mF4kldtw8KFQo+8N9vY6tR5KEa7jxVXrqg
         Wk+/bXxAaxBLspZtEKj3Gv0a98wiP38accqlsUK3+zB14mVOBMw0p8/x4kVrXMVi2pPU
         spjjfDzcE/dMxMbQNcfRlW5AyaB4+0ONJu7t235qeiXmV+5PF+zsi3yroedHpXdmULLC
         w8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154998; x=1761759798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBgZ5OtYg07NCXp61kXr/BSbIWhE2fs8T+/yOfxFjCU=;
        b=A5WEp/fTfjd9Ok2PEG14gPTGG2agFv0DNM7SpnQpWO30HQ1GBtU3kpz5AmSZB9VbHd
         Tr8x9KB4o56OiUdwU7/FXi+xwmlbS+qEoZUbBvfJ/AM4vo2bUP0bkpVq03drEsxzGHl3
         uSiQPF8KJd3aIgIU/8zlARlQEpyL+honKjl8aTRhIIF6PzbD3c7xCa12h/HXhYz8xXYS
         r95QIboQkr56raTtUPDfWSLnMlCbEAKy353v5OnMkP4/o9JrlNKkZpoDgrsgm8U64rmO
         SDMhyr6jIUHXFy2NP6U0595W7dlgHD6v9TlHjKTLNFdXiOc3xnFx9F9RRHqER1aawbAD
         Z2uw==
X-Forwarded-Encrypted: i=1; AJvYcCWgyzE/Iujod2Vw1q95KKM5LisJXQcT6vDStBVvNSgP3QerSh2HBZ5546wVAa0x6PToZn0Y7OEDySvEEykVfJH7@lists.infradead.org
X-Gm-Message-State: AOJu0YzEs9+9UclajBzlawVafxb9zOj+jXPEwC7a8IY7SbTl0c9OP45u
	a8D1FCirb7AvvkiZ4tm2Tdx+ggEekAO8rXrzVpt8TkZr7HjXySzfQhnDIq0KMP5s5F8=
X-Gm-Gg: ASbGncuvHrB/Lq2Meh3QTJeaOAa3wldmPpCaeOb3oaVRH08a5X7KU7UWHY0C1CcVovk
	QwN04byCzz4OwtCtsd1jSLhHL2lT7gwHdcaOkz94zU7OpoA/2SwKvrxaNxjEjR/Ej0qlxm8Egod
	QutbAW6A5Au7WkAfAbG1uJ0FWtfi8USKEWovrz1F9yci47dFx2r/yhbeUht2rsIy/zCOXB8xnwM
	2RSk1WG7bjKQLgjUTWrsC435CpqcYiOXCfD66RjlmEr/F4qk32u1riC0NkLjboA0FGLMlzZH29O
	AiO1VkhM8ksyp8J4pJM0DhGLcwhP23V9T1L9cQ5IxRSMyTZVVW17cY4CYJa7khH49jXdC69ofFx
	j7j47IqaCXiReW48cOCa1/AFFSKiy0r2VbP5KZRhO663WXs3fONJytgwDdnqwWDX48QYotElLYL
	kPms2uXNSV
X-Google-Smtp-Source: AGHT+IFjziwUg1Dl3LOqBcFgSgns22D4G3uLdqScO3DNYkyYm03zLF/NNOMCJcEGGUm1q7BfvTYL1w==
X-Received: by 2002:a05:6000:2289:b0:427:84a:6db1 with SMTP id ffacd0b85a97d-42856a8c525mr2170414f8f.31.1761154998227;
        Wed, 22 Oct 2025 10:43:18 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:edfc:89e3:4805:d8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm43434755e9.2.2025.10.22.10.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:43:16 -0700 (PDT)
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
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 4/4 v3] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Wed, 22 Oct 2025 19:43:09 +0200
Message-ID: <20251022174309.1180931-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022174309.1180931-1-vincent.guittot@linaro.org>
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_104320_082425_6C9E1E78 
X-CRM114-Status: UNSURE (   9.85  )
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

Add a new entry for S32G PCIe driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545a4776795e..e542aae55556 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3132,6 +3132,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
 
+ARM/NXP S32G PCIE CONTROLLER DRIVER
+M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com
-- 
2.43.0


