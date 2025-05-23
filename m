Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE6C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jHv3PmM//9SAbvQ/ymuXc7lSwPjHHcb/twyK5VurVoo=; b=1uD0lWYG9fQ5cuYfLGhZOxjgiB
	qBEYJYoSc1lxq1lDmWbX555TGVdnz6acJTuda+oSSwG+p9kNuOb6n26cvwXxU/HTJM2LeS9/NFI9r
	mCzgak2FafnRzJFfwfB9EIUoQZOFzOFxyKjsjWdty3b5G0Ap2piHqYbwyIP+qvTU5TxIxEhdjA2gS
	ew3XnSbQzWoV/LaYd4cEclzPCOSfWXHBEPVG66Xdm+Xf41DMIuMppag6NXplDoIWLAIJwI2v1y8a5
	Yyf5cU+zAX7hPNgHwY3jRU4xcC6AlylZFO3Sy/CGBsO3lxPYU3Hn47rPedKJTDVGpLpyYP1zfL5wc
	c8xSMwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIR9s-00000003lx2-1sZD;
	Fri, 23 May 2025 12:05:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIR1X-00000003lDO-3uH3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:57:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a37535646aso621892f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748001434; x=1748606234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHv3PmM//9SAbvQ/ymuXc7lSwPjHHcb/twyK5VurVoo=;
        b=vKCAHxTra0YsbRrGueHqrGiCpumAWFgPY8mulF5k840kD8aQecKt6yxgewRfh+rVdk
         NSjmLhqgYNrW4Q2/5YBvXVVlK3nnVY/+4wKJfX85WJzsrgVVEOU/Wv15hOvlgvNdsTIS
         Shsp4J2aJ+Ml0TFctjKt80AbHN4dfzii0DeQLE5p6qj/uI8+YysdHpWyqK9kkzcKbSFx
         YdVyIvD0wEaA7jK3RrovHbr7pfQjdVSxMar7q/5C3Xcd7u35XDbZZq6OelDhwFa4kWcx
         z0Hp/XjF5KbuuU33NRjiLOSLZ8AbzFH/T4h4ejsNP9UblJFTA9Q9HNpJcVzx7MHYsEhG
         immA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748001434; x=1748606234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHv3PmM//9SAbvQ/ymuXc7lSwPjHHcb/twyK5VurVoo=;
        b=vTRsmIxqwm6Gb4OWxPu0CIyp/5G1AgJkcWYBnL8qTAIyV7GHFyLnrConAjzOvYq9aP
         li4iu6G3v+uVrY39pAzyrWP/Q4ZVv0KzpSX4mPi659nWlPoia7NLr8/g4SP5urJpqFpt
         EnpjnFPFtfyyDSe6iNS8DoRalbW2E/D/6sgPaQLYsUPC8x/A1gWtyvw75dJ6jR2K8q7Y
         gljs6cJhTaB7g+xTi2HlWca9p0KzTQQKZ8ZV4i8/+MYACyzcbEoquqvH1bL2DEtCvvH0
         4TkyVIdAUxwdQxZ1owUUqrbH+F4ddv5D67B1rfEH3xWrudZ7O++sQH5Pu9ISFVtjpN02
         n6ug==
X-Forwarded-Encrypted: i=1; AJvYcCWkc7Q7qEtQ3FUsfE6D3fmlgqISvAczlNZ+0afayrhc/0EtMNmDoTtpca1eav32toxSIKWYXA4kWK00RznTeaWj@lists.infradead.org
X-Gm-Message-State: AOJu0YwWU2FGueM8XfSUwaWZPy0eWAfLg0R4S4Du18bALw9RkYFLQX8F
	wGU3jbVyasQqpsEOP3G1MKWF2RSbXFxGY7Qi+yqQzbS6BsOaDEhuJazNr/4Tdd7ftfw=
X-Gm-Gg: ASbGncuHikuvHNQi3Sw2pJavZ8i5PuSdS7i1losJCVJag2fx/iaCzvjSw3BV+FfiQyT
	F8DcgIAUzoPnJ1QHJyKQHV1yZJHX/O39FTYALBpqYxgtEVxUK1kSVdWSYxEPCjEdynKKG3RJPhL
	200m1hSkJk+79weU9hyxVyeCMnKBLCg96gkDnwRxDrNwXx0/arHuIGIuWiTGzsGhFGAo7VdNMl9
	g2aTCypRErc329NJu/gD9VGsrZgqEqhe5IynXHzBLn4Vv25RPBxpul4c5noQybPGqOd8sVEnSZ3
	rWOJoZF8CdhTRRCu7AwgHW4vGJBvjGKp8GlCpc2zGWEyUWZCzI7N3Lv3OjAwgkTXSszaJp9OMo9
	2g/L/KLFWgNXeGapn7HA=
X-Google-Smtp-Source: AGHT+IFNrvccAlUMqw8s3fI0AfxthWK2WloBf38YsDtOvp9eZ2IIkUyBeD4AiDDkZoSs+CcivTfhrQ==
X-Received: by 2002:a05:6000:2584:b0:3a3:7465:7e60 with SMTP id ffacd0b85a97d-3a4c15589c4mr3501435f8f.26.1748001434253;
        Fri, 23 May 2025 04:57:14 -0700 (PDT)
Received: from toyger.tail248178.ts.net (i5E863BE1.versanet.de. [94.134.59.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88978sm26836364f8f.65.2025.05.23.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 04:57:13 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Nishanth Menon <nm@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] arm64: defconfig: update renamed PHY_SNPS_EUSB2
Date: Fri, 23 May 2025 13:55:34 +0200
Message-ID: <20250523115630.459249-3-casey.connolly@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_045715_972495_B6A5A6DC 
X-CRM114-Status: GOOD (  10.29  )
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

This config option was renamed, update the defconfig to match.

Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
Resend to correct Fixes tag

Cc: linux-arm-msm@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..7e04a2905ce4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1572,8 +1572,9 @@ CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
+CONFIG_PHY_SNPS_EUSB2=m
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
@@ -1596,9 +1597,8 @@ CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
-CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
-- 
2.49.0


