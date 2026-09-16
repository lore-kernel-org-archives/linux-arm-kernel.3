Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F2FC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=; b=HrN16fyhPLr7IaYj2FKbs0l3jO
	xsD4OodfFsakt3TLKoWtCRN+izNPHLnBdxtj2MkDjcvWNoq9jxz82RtSqnn0dV8W/6K4+iG0VbWKJ
	wYivaEkZ7+BpBi/RQ6/DHwwSIOheu3W2oIYPIximCfMxRdIsfUtRWJ8b7jFoRwfV11suMwiPBOzuZ
	Pg86PxAnVdlINoewJqPYlVNZOa8uIvInAct43xrZ9C+bAlmPQxzhZYbggRPdLjpGi1R7CsMgfIZ47
	o409Vp+7kj9B8ijjf39G8X+J90PO0zqAsWh0OnJGt9WXni9FO3GEH9I7hEteJt2+ps6YZCo9FZUgB
	74+niyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYQ-00000009aAt-0bIi;
	Wed, 16 Sep 2026 15:28:10 +0000
Received: from mail-wr2-f12.google.com ([74.125.225.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYK-00000009a83-44qq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:28:06 +0000
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso835491f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572483; x=1790177283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=Qxlaf5J25rP7dqJ1e2JG4O1jnirIthdkEgPYZhaD7o5mCr22SvBdDB2i34So1fHfWZ
         N3tgd7Pc7uQqTKBDMo/TsfepUHYMwUxRm+0P6cKICRHRLsD4gcIEh86qwFz1XRoS9uyi
         UWpzqZTkQQBJr8oxY0auR5YHE3msXDM5R9Xj+Ajk2iUMLJKGBLuiai7th4ZToyYJFNDl
         XDE2qsSTF08/zXDt5AlkrZQYPF2RRSI9vYFY5h/k1aWF8OhrrtXBVHnI1hrX1Gpu3/J2
         ECcUEPDI+Reb1Mmt+HErLJRQsFXbQWWRlUJ1KpykSmZeIe3zopICojMdIkRW6i1ox8Os
         8SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572483; x=1790177283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=ZNSuQDMCB4YrLArWGLUJQPBU5k49Xp7MPz0a05RzdN9II4IDbldqHyJuk6bxJExYdD
         xxr96sOIAeVHKRSPUeBn25QdjP+slzhZupF/sM/GnhXyL+Q1AAAglxu0T9Xx0RxNP+gj
         +TjuABc8EttrrH4vXQimsIDtZuTNdAoBUxMnDPvHZPEWoScZthXa8EmxiuR+zToHrTYs
         D0FTCghwFBc6k5jDAQkNfV8sQr/zKT5xP26JBx4a3XFpeOyvwxD4k3mE0nOoPZdz+VND
         fX1ytbyNoaiOOttwUFa6+aYBHcJPqndeNH73e1tA5TFr8IA/6eYCoVugiEXDH9cigsBH
         xAkw==
X-Forwarded-Encrypted: i=1; AKwUvBy/eHrOkQnjqwK7KHMQ9OO8YNBW+Ri+Hnn2N8DuL7MWGydc2JEhuGNkYZ1B+oqWQblE4dS7b+0j+R4jF9AP5pe8@lists.infradead.org
X-Gm-Message-State: AFuF++n4LvNlY2YP+xiSfaSML3Xl/m2d2UVWCBc1iwildSqkmGK5Bbxe
	wOUOg/z2hDvtmOLE62zqijyqUgUT2Ys2veU3uKy+o4Dp5XEE7UhWd8Zd6OADDeQq6/I=
X-Gm-Gg: AYBFou22klqN7kbZYwc/k5IbjWNQPZi6AvUTcS09nQC+YI5moZCDp9vTXmrDUy9+V7o
	MzZuJ2fg1hXZ+F24MJmoG33AMpE86Bm9gFNDbQWfzi/ZIpm6IPecjhAjC3Y65tuanxZMS+Zqd31
	EW9b594U3VnAG8Yf1aLACJAibcNogVDvKaNiT8AdpBu6AWAG7F0a9cu+0RhHj+LhpZSCkv4WnKW
	C+1BsI0+vwACtaknNI3J7sIaFOKwHD/z7vvBPquXJA6svPZtIEiXJ6p5qYgIzarwQF07jywSEGU
	pDc7x+cv7OgE8AkNtGsEhQDcIm7+o9aFF7Hj/+Fjujhe66fzbt2pOjsnIeDaQicMAN8kDL7tsR1
	X30wuxAkuLNtQZdt2np2rXt/LvwhyYFRKTUKQx6vuST6MECIbhAZW4T70MVEIN/RbpZjiCRNHuY
	GwS9nWPZg5Kzxm9OtkJVNnIc0tOahpEwy/CN2bGOea6fbEpWVhYqsDUl4e19vm3bK0iZtz93dwl
	t17nf8ZXlCvUMpu3DBxkAhlaw==
X-Received: by 2002:a05:6000:4b12:b0:487:360:f17e with SMTP id ffacd0b85a97d-4870cef4138mr4081357f8f.17.1789572482988;
        Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:56 +0100
Subject: [PATCH v3 3/4] dmaengine: qcom: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-3-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1191;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
 b=RW7pP3MLxPosAiOITUM/7+vTicyGJZOPaExp0aJS5Zz/uedQ9Algz0ACDi+XTpXlvnH3IwPMZ
 zhk1eWRwV1QCsFVQsfSEBCIhKPp93+ZLpiA0+Il3hN17LG3DMcI23MP
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082805_038118_845340E3 
X-CRM114-Status: GOOD (  12.69  )
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

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/qcom/hidma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..1349066b1544 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id hidma_acpi_ids[] = {
-	{"QCOM8061"},
-	{"QCOM8062", HIDMA_MSI_CAP},
-	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
-	{},
+	{ .id = "QCOM8061" },
+	{ .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
+	{ .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
 #endif

-- 
2.43.0


