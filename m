Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17F1C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ie2WYSBT3Vb3/RLr/kVYn30UdEBVb+2bXcwDKP51ids=; b=X4xpxUdIqTE0T1dw7UnlY+8hEG
	QnxVlyBIUINlrFKpnCCYXmfCql3zWzQWhAk9maj8+6+JVwfU2Y75/H3cVTA842+LqaFlY14D4n+D2
	bzR4jLRKPeVY1KTvH9zL/QO7S4WovOVmXNcJLtcTDSav2dOuPfYw+1sAWoP/uR1ZcGUuvXzno1tEK
	ijf/EV4kpE9LdWxw2j6Evyf3OXgZXbPp8Fcn6VWGfIPEtimfOpmhc6bLWteu1HchAR+llxJ7bTNfn
	6nPvSQWhekyvhIFa7GEyTn3o4TPsFNsvuCFuoWZOUVtr5uQtDvZR6426xzg1m99J/S3GyD+5+HmRf
	2N/HdgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sBr-0000000AiTa-0IQy;
	Thu, 10 Apr 2025 13:43:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2k-0000000AgSl-32ap;
	Thu, 10 Apr 2025 13:34:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-226185948ffso7990835ad.0;
        Thu, 10 Apr 2025 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292050; x=1744896850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie2WYSBT3Vb3/RLr/kVYn30UdEBVb+2bXcwDKP51ids=;
        b=Z0uTLtKMfp2KJZCjgE2Z0HIRDLx8rDn/RvDEKQcHLCiAuGdz3KxBiw2nzuF2DrN0fe
         RVJA34PitYCZjKKFGDmtlFHJVs5guHguTxEI840e6HbDYpdZ2FCE1xwNO0q5PD6j4AG6
         c3cI7CcjU2YIfQaq+lftDucrOzgTqz9yQTdNf7lUAnZCUVkwk5lOi9ztke3tFBXp5/72
         PJsjf/DLrUoaQiAKQMIY1XBeZCABTmZG0mm8ntpE0HIVkwTjVJaeeK6O9tQ/cQHdrmJT
         KwubOPpCLr6EYmXrpxlKJwpT31IyUNq+30REiH0VtEtl5iu4wOXscrFNHkXbITJMrHPc
         mkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292050; x=1744896850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ie2WYSBT3Vb3/RLr/kVYn30UdEBVb+2bXcwDKP51ids=;
        b=E1AkkoEy6invfKRo2EqPBGg6GTjUzC32ikxnI3E5TOtTvBggR+0M+Wm8SjQer57t4x
         hnAUFG2yfPftNt1VS8lP3oJJ2zEkD8kBazrAQIzluLkAcZdo0OO3tymmqcwHP+yjCoi1
         omeRuljI8FNReq2GEEWovUAwtGB9HNAPVjvI6DagSeA1xch6oeKe0mYNREkNJCUjtpK+
         hDPlqqRV89x4Ba2GJSct7HaK9aPQcUrnNNoRGk/BgcFtPLF/3+W8HODj2w+OizsH15E1
         QDeIb+vDF65pkzjKKrus0LbohTMu39qcl5eQJJUyQL+OoCcerb8crQTvJLXruvOU5nMe
         W1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW+NLLujsZzxCn77DSss8oUJEB+zNsy4uP/G7z98avrR69XePCO8aoQuCxqCxt3tyCN3CQjy/rF/wxgWDH3@lists.infradead.org, AJvYcCW9CbNZoK7av/92zaribcsJKEde5e9yc44wBKI37DiyEs7vvOzg99gRqQQCw5xOjvVHkV5eEpIxA8He@lists.infradead.org, AJvYcCXsiWlf+oBBCAPL2JVPVOfdVW+0+AHxj58602e+pjkuorve78s6Zz1Ni2MeKKQxz32WjMqr9yQ5y0aTG+sfvZ47xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYfV5PxHMf5ATl30ArZ+avraK2oZdvcSgBhnNRPvr3jswfXv5n
	gmcyBM88wq8XHqjGnvywxrhbFS7DaGG352sEonAqMFyOC+1PxWES
X-Gm-Gg: ASbGncvv693ACKDOHlCatYbg8pA399UqH2U2YTJensWLqPSnVnc1Ygcvtfe18EjzTXa
	Tfi8ICftgIllpIxRI9Px5em7ffeu3D7i9L8OcObQdBCyxAQdetjOtDvY6UqAZR46PBO+A/Pz++P
	86ESlAANIcl3qmrA1ZSu/t6S+i32h21TdtY8HIQW0OYWM1RZGK+zSIx2SnVu5RBJGjTLzvQVnoR
	Rpoj2k5MZbv0/aC+FSYK36W+9MUcIgjI4OeMVHx/tJe8WDQCPfaXdS+DeNaLyNBBwC/Dlbm6NmB
	SUSyb+92PWrJZXQJnn8/+O7aZ6N8t6h29/NFaWc1/wZkSYVp52uzvA8=
X-Google-Smtp-Source: AGHT+IFebE9GR8x4kSqiJ5cenp/8FxgShjyDitPJ8W8qx7xYFtufybCnsYQR0VTIIrJFw2c46H3Qfg==
X-Received: by 2002:a17:902:d2ca:b0:224:c46:d167 with SMTP id d9443c01a7336-22b2edceda8mr42616955ad.16.1744292049826;
        Thu, 10 Apr 2025 06:34:09 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:09 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 4/6] phy: amlogic: phy-meson-axg-mipi-dphy: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:19 +0530
Message-ID: <20250410133332.294556-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063410_760165_A0CBD138 
X-CRM114-Status: GOOD (  11.69  )
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

Use dev_err_probe() for phy resources to indicate the deferral
reason when waiting for the resource to come up.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index 08a86962d9492..c4a56b9d32897 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -377,13 +377,9 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
 		return ret;
 
 	phy = devm_phy_create(dev, NULL, &phy_meson_axg_mipi_dphy_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-
-		return ret;
-	}
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
 
 	phy_set_drvdata(phy, priv);
 
-- 
2.49.0


