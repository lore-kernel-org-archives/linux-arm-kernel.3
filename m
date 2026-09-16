Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E96C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=; b=uCkeGGWZrIdLBUvAbfvpwJEont
	0LNrT4fGhJIzrKP6CTU8AvDMJNAJv4IkqlZ5cfVwTqa2VoP6AAHUIUhK2Rfh0k4HB7472gqJJt81j
	iz+OH6RS3x8m1c8lOcAQ90PyjSVWJDQNMulUrAHXoWTNoMyFAJKW8qEdekNQLyrWzhlqy3YL3rgFl
	0fmfxnbGMdiAIB0rm9EayYg1ZuGcyqAH/BYOA93gFIWsIkEgrhecixh/F1mEIXsAdmukFbVv+lNA4
	4TCHPohrQ6TVfW5l+Cd+Ud3q8QY2JNf2tz3FjGusX4qRzIuPmbfQhL0jPSIrRDhe4S30glGh94652
	QSzZSacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYP-00000009aAm-44Hy;
	Wed, 16 Sep 2026 15:28:09 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYI-00000009a6t-1Qub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:28:03 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e66390995so6618335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572480; x=1790177280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=gXjJkGSsf+SyApyIFV00dL1YjzZ4Kj0kw9pq3dK6KZhIUoDD5Am5grD6sKCraqK77b
         a40fJ8GCaAgfJYnK+hKp7MBNbXne6nK4AoxGz3O6f75ig1nkUjYVZpizbdhtHJaxzxuT
         QRKqZpfYmooFThI5eVvJ6zyWXl5zzgYkaphOTMzxKMVD8lrLG6sphy8X9LJHtlQGf4Hv
         XgoxEsrAb5S/hFjisSlF7Sf2rJRU4RpyE4PqAXIGK3Xo1hCglXhDRw2tQajkmFQL7k64
         47wNm8rpU23ygUy19LUxYRScTuJpSX94yBu9NqYGZYQ5Uogrmpqoa+ND6omnPU7YC4M4
         52iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572480; x=1790177280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=kQVbS5vZTYIEEGVepD0cyw1jgQqZesDTMt9gRhzmAuxTOCd+Sy7y74uGDXWsAIpGT5
         PBYEaXrlgfJERhW9uTi1YzlL5mp71LVBig6dqip1j+INJaVOFGaJwbd0wq0Yc29zbili
         AcIrzc///H+kXPdxGyd5Yk/rA20fr6/CgeFBCrk5Pwt642WYtipF19J68SohB1RJvv/I
         O9UZMvKgTGvijLjMDfzKsAWmGSVDXSObkYdxE3EteCSVRCdKbvgiY5/QYGJXZhTgurx+
         4S47mufxRoChCJzVjBTUXazaxvv3qxzJF/MLp7TCvNLOPjy7G/2w1AFmmQKZNf9Her2g
         VPZg==
X-Forwarded-Encrypted: i=1; AKwUvByMEnOzhpa0EuSIS6Uvfh2jldnmtT3S1fP+56KfTQq5jfIWL35o1usEzj/k8ScJtW3uXSHB+ZAMefBUq0Ts/qLx@lists.infradead.org
X-Gm-Message-State: AFuF++kyqB5gPIn+eOso/1qHxHH/Pc7hJCwGbu3ungaiOM9y4qodl+fx
	piEWgfLYAS5KcBZZBI2rjvzqHSaR37Aj0wshav3lvvAP49ON5xDCQRr3nHrhTZ0UgYY=
X-Gm-Gg: AYBFou2w8yN0YbIdNTA9uvu9fUdgguC7Cza9RC1s/5awCTQiX1HIzuETMwLwE4BM33n
	3Sh0HSUNLr/SA4BwsR4rBKZqOJolLAmJHj3kM8OLES8TiAeC2lL1CQbdqDIAXemzqcUtZ5jTu7f
	wGNaMLP0UjwiRRpEDirFCbpJA3kDerxtGDi5xWeX0ijP10mSiROXbg7XXdZHqf3EPvfTDm7OsKH
	FqXsWmdM+TxgdgYZ8vQQ33jIUMnOejxHZbhmXeayyKqtamwciqMIxULxjh1sNukyyvQIHLSBQ26
	p//MIh8vmvDVN7T/Pu7xfBdCZn6vti4qlp9ZM0MmSGG9yDF7zxR9GlswkFaxR6uEWD2sRbwVaBL
	f/MB8VvR6dhAXXGCj0xDFJeyASuWsNR1Y3S2pc4c8DJ2qurzu/rqoN+x775kn6cK6SKKQwMtpqY
	TKe6wClVFrHHeNgtrgeV2QfczVc4926Y2jYY8HH8IFh71UPgxLW08+DIfDkR3q9PqxZRa3cDv2B
	cCTTc3l5ALqT3Y=
X-Received: by 2002:a05:600c:8011:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49eac45c233mr34194015e9.3.1789572480413;
        Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:27:59 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:54 +0100
Subject: [PATCH v3 1/4] dmaengine: dw: use designated initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-1-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1636;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=/JpbrBR+OVjJpbG1LD4MSanTICNv4h/sWdJw0dgCPcI=;
 b=TI2PRLu+PWJwKb49U1K2vwZ2j85bEZfhXEHR8NJ+d63p/wSMy7K3t4wGWHCvZRvfhjdfwrpJj
 mt4OqQOoSpSBmb96hvLhHcQlKlhLNCaAB/spt580AE9pnNsSg/0wgfv
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082802_398477_D3B6BDD9 
X-CRM114-Status: GOOD (  11.78  )
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

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dw/platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index c63fa52036d7f..5c1c97eb28a4a 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_dma_acpi_id_table[] = {
-	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	{ }
 };

-- 
2.43.0


