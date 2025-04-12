Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20846C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=; b=stHoJYA1Z3OamJJkq2GKFHD8S3
	CDwvSFpQHfDZvF4ON62S8gZxm2eV3hqf1hnrH02d3CMb5akh97Edo1f7CjAp7AXCOUwog90xd9IjZ
	l6Cb6J41AhchSuVqzkOUA+ppZLY12GtjC/D4myt+vs7Q8e9emhprnjcLZFZODyp7Skp3nZ8xsEmdK
	TogHXg7cqJDJkKKs8j7WCoGFiHMFiaKToHVHYnjAVal21lXuxqF6ul9tbXNzFEPQAsNVEt28U3v0E
	NTL6KS/EYrIoPLAqTrThsyRWZRZe4w96FIyx2/RG5+jWx/6oDs43cgutIlPkQqfqDU5xmyDhHF7UO
	HlPCdsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hfi-0000000GQpm-04bn;
	Sat, 12 Apr 2025 20:41:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRT-0000000GP44-1SqT;
	Sat, 12 Apr 2025 20:27:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so14700185e9.1;
        Sat, 12 Apr 2025 13:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489626; x=1745094426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=U9AcA8uKf7rP7W/Z8brPJxhbGJ5LYn/+oYbrwPkLcYD9+SSjqBrLaGvo+56BL9a5Ae
         ywB++aTnmNf60swL3Qozk8CEDUfKO3bBwYydmoV2Sr6zdny4DEQrBvn1k/1OKj5P8KfZ
         CY/23jxFB/WbB9k0hNSw0aYGi913W4jXIdxfnivtjDv2pWgTXMvRDI2EmUIwwMmMRK9b
         PR3jsoKhRGxUyQdboVF12deLKUEOB6w8nYeE8sw5pjIEo5UqQgarZHZwCjqn/oHENO70
         yuqrPeZi0oDbce15pCgLtNf3FaqPSAFSoQeEd4egltCX3svgY7EyPeK3gE2aOarXoKOb
         tBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489626; x=1745094426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=sTfZHwyylKmNlQ+yp5MDWhjg3hBD7GCmGxV6qUbXlQrFDPkCDQmnVBdQTSiLEYZF2K
         bi0LiNdTIHxCEc13UE28CpmJ+CXIFaQ9Vxht7jAP6GqayYOD3N1JNDnomIb5Cs2mHO19
         RC17lN3vZT4Owg/5j4TOFgk9i09P5P/9tBVkhpRf1Hd8y5ATHpOHnHTk2WLocqhGugZK
         SU9vrANWLTQVqI7h+Zt6R4IU1sI0haa7XEv+z9CjW8bctgKBUevTgXGgWQ7J8it3c+Zl
         dB0zaJm+kgHH6ZsovKQyl8uSqFF4Pg7m9kRpYlomUDxWfuw6MpREoYXWHwYNqHVDgH54
         6EFg==
X-Forwarded-Encrypted: i=1; AJvYcCXOLnndbaV/svqVfc5Yl2dVV+B5EYz2U8M540zHe+h22s8yiQaDIiIs7FeDYNyzio+hV1cRdw14w36M/YZyuRqd@lists.infradead.org, AJvYcCXYGKgXEUlawsj6XvhMIE9JCG0iP0dA2zoN2W8xy2Nl03SXvHVjRMsg5IHLUAHqlKetga83eVEw8EH+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq9rg4FFy171yFhksADo+TLxlX/CIs8acC6fO4AREOF1GECtkZ
	jYUUGH4V+z8U6tszIUo1Mn6YlkOZzZLTQE+X5G9MUQuEXlQcWbMi
X-Gm-Gg: ASbGncsOfydh2f94TAv2Ou7k4ZeWn7s26XR3YSoz7cl30hBQrE+BYAcdRswHtnFkPQV
	mw3aDjsG2IICt4DqA6vX/GaGRcQTftyugkC/ih9dHjjPDq+dijJU4ZmB7/seMppLXphmEpvt6aW
	m0oRBbNbsaMxh5c5dcQt/xfIzfOTja6vC/O92VUCYDM04jisSs8uBVjPehoodsJTR0BzX/KqDbA
	TooHCZBJHo+iuB0rXYraviDyoxAwz5KB+fDtVJ4oNGBk5WJiuC7IM/1d9FgKFh3rakGAmYz/QoE
	Vkw9o1YmexIZN9y1TgxIcm0pgBW5yaHhi82GiZxvU6bwF1iwsNcdz2fgvrFU39kapHZ+NTl0epO
	DUJjOmgicOY/axIm3
X-Google-Smtp-Source: AGHT+IF7eQA+y8Lqvzil16h/BZ20xtsseNQHcX3MasiH+W36JGiRILYfIiYVwPVlNIgUn3fdc+Vv5Q==
X-Received: by 2002:a05:600c:3ac6:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43f3a925e28mr71377265e9.4.1744489625722;
        Sat, 12 Apr 2025 13:27:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:05 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 07/10] phy: phy-snps-eusb2: make reset control optional
Date: Sat, 12 Apr 2025 23:26:17 +0300
Message-ID: <20250412202620.738150-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132707_386638_09165FB4 
X-CRM114-Status: GOOD (  11.72  )
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


