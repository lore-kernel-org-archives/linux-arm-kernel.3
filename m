Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4B4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=; b=czdFxnSbApWT7KK+EVOsgW78cJ
	hp+f+gTAwW2ZKDWGr34JneSK9vtA06uSBxpQxzdWIJ0CpuTJNjSSxOkw6rDo0vpqfYzAuIxQ+yRzc
	T5Nm5ofaEiK8Hm93PZFAtQyhMwJuCPgo/JrjvpJHblnIR8nZ/Pf0fYlBHMGLg09oWIf7713J406OK
	q0oyls3BF9wAWKn38ON4IJ07YE1nX1CFd5UMwkKHCg3lpEYmiqjBH0F0rYSe+0L54xH+Nu0Rf2UzU
	e+nDvo/66lSandsP4qiK/vW5PWz1jwt3tnuVhJLdh/B5k5zd4zJl7Nf8C7PIqSFqI0fxTUoXZd6YT
	fpyv4DCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaqE-00000005RwS-3fI2;
	Sun, 04 May 2025 15:01:18 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBabF-00000005PSC-1fjV;
	Sun, 04 May 2025 14:45:50 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso5155382a12.2;
        Sun, 04 May 2025 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369948; x=1746974748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=FYLGJ3GnhAYdLc64GBOa2vZzhE2WNkNmVDAAr1GQGk3m1hgFFKusnJyaZCLwS9bYEX
         4MpfrhK4piL9Bio2wVNbmWuhEJJR7TCZp0i2InaYr5YjdKMDpMG92dLt7JH1iAt5nFQU
         voP3s7T4sk0x3nzZtUq9t9Fhhtw+oVP7fHsY46RxMDkK9tJkA5+vR3DcrW+QxwAXrIKv
         YMdCU7PwR0ftp3b3Ne3TRiRTw3IxGsPYK41x2F50A0r3wZerOlEyz0kUYtDzP1YgSpI3
         //1YiqxJPwcr2lSn9EfeBQ5O+nT55BaOD7dKwIUyngADo7JY+0HVd/pizB19731Cb4TK
         lmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369948; x=1746974748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=U4T+18kgUnO3BCIllVMPUe6L92DSQN58C01xwI6ioOdHSo6/nC5i2DHU/6NLyYEwho
         e74nkSu0gyg3ZhrUtE6es6Hy9F2Wu09PN/+9q+5JCZhgLVHyadGgLMj1mHKrCRk65yEQ
         6DFRCQifTJZ2pII4FxXSBnZtbsjM0CulQsqg2xy/Ofei82NSig2J3Ow0dPfQWxWvHRcG
         1QTL0TIc1VwEr9al3vGpHXhvqKf8zh+sTkvsd97hk8O7wDJkoZXI9n1ynj4FjUdAJ3/y
         OeTa4eq6TtjywmQFdRaFsAkJmlGGQTf5DS3zuI6qJb9SQdyGJBJ/EE+EnmMX3+AQaZZj
         BEow==
X-Forwarded-Encrypted: i=1; AJvYcCVPSwFEtvYH3Hg/RRH3QrhdB9JyVUTjqtMC9cOo75e2y6IZA3RGL0HzbUzrVOk5eQb3Sasf1PI/2SGcI6WSM7iG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/FMecCQeXR9fnThJ0vN/jIx7bEBI06KBJlNoI1wSbUhkXY76r
	+5hsnVlS+FHjP6Mg5WFp9YacJLNgD1dGPdnyrlNFJy9tHKylcPxD6L15NQ==
X-Gm-Gg: ASbGncvCtdEpq7vogz2r7s9hZ0GC5Cru1axvloObrQxemSXXU+HK2GF3aUHcm8SY24I
	WvKEOCp0OEjjKvPIKnbWLzEQfkH33GF9p/yMxwn9wLMo+K1PZ6xOSOvs5KdenvsRLaVmIxiPNWa
	Ikh6c99IM+pccgkHNWZU7MPJjzh3dGAKytOLgYFkV75cKozStz7KJLV9GmIblM3J5Ca1Uq0iQvk
	qn5evUlrCsNb5/xdiOSBQdV9P060pl21gx0MetQNkEridhcEeEiKxlZOLGr+G4P2Tgt4fLzmEZx
	Fuebifq6BcTXxO6O5sfX1it3dzWlA7F8qMTLy+bmscFngMX+umAEZT3sFZ6wCGtJ87m/L4B+XnI
	lhall7KfMOvWea+kH
X-Google-Smtp-Source: AGHT+IE7vTq91Ziy5tdSjRautreu12/lKKGXLd23gtOnTMb42Z27SvBFllDzeWoPOC2edcZgczXudQ==
X-Received: by 2002:a05:6402:5250:b0:5fa:afe9:848 with SMTP id 4fb4d7f45d1cf-5fab0576388mr3103899a12.9.1746369947837;
        Sun, 04 May 2025 07:45:47 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:47 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/10] phy: phy-snps-eusb2: make reset control optional
Date: Sun,  4 May 2025 17:45:24 +0300
Message-ID: <20250504144527.1723980-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074549_433588_11C60BF0 
X-CRM114-Status: GOOD (  11.00  )
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

Not all SoCs expose the reset line controls to the kernel, so make them
optional.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 4094786d2..f05333901 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -408,7 +408,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-- 
2.43.0


