Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BC3D2E033
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujJ4oLac9g0afJ+xDbcOvTG1+w2apfAzFkZUFjxOHx8=; b=uPJsjDevaNNt5LO/z9ws3p0WUo
	LDYLp238NtYCA/1ksJtjbyfNxLPUcdPv+2dp/CIMhqYAvAHdOodi8nN9iKLUGiFiEjVYKlHzYaLRh
	95/blkY/kO4hDtTwLHAvvUgcLDOz3b/1SGZkpCdHRJZXf0svoSfRTmQ+/zG1+Ie5t833xLJ2dG2LA
	q7tasu2D//CEHjOPlhWIca733Ioi6LQFBXmPTLiB9sIa3ao4mENcvKoVIptoRAD3XwadN9HBozlQm
	23OUxGHQRBMVQMPypw/1iLCGnb7qc+GbGGEQETbOc8oO+Lwi9ZLWaYrFXkgDyaD+iXDKqhhvH9kn+
	QEqyv9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xla-0000000Dowj-4484;
	Wed, 23 Oct 2024 09:34:58 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XMg-0000000Diou-2TBT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:09:15 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2fc968b3545so16168191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674553; x=1730279353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujJ4oLac9g0afJ+xDbcOvTG1+w2apfAzFkZUFjxOHx8=;
        b=R7lqSp86q7vFapTqb4Jyv4Smd9eu/1QlZgtgRDwVW4tfEKZttJal7PK2VfzH6N8ogm
         QY/ZcqUVbbz1n0gqEP1jjW1NTiyYRn9Al3rO6HkZ0o1LPzLXWAJ57LA4f18pC8b7t2fQ
         E3B+1n61ZSW/GSZAQa0TezT6N8Zv0UDd6qNqxk8TrASBGKHOTMQEv1r9Qct1twq6TtVq
         qyJgqbalSdF2iveDB9+zwfXKO1CVmL0tOkB04Vr8UMta8ksF8WHdJQj6ZQX7aRjNeLoT
         0sp/iEVirFVTV+UcCXlpLtxVYyuhZmKn74AWq+MCowNXxEsVbVpXoGpQhaIvwear2BQn
         5f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674553; x=1730279353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujJ4oLac9g0afJ+xDbcOvTG1+w2apfAzFkZUFjxOHx8=;
        b=CrmotAXQAiN/4SrHCfR207dYyk7fwIEtlROybDuAiF6SSX/srA25W7LD2iXc6Q3JHK
         bVaL2qcACJ/6lSIdKGy25T0VUF0LsO7c1CBmE+BreZ+1TffG5yqWEejAMKeywCk0jDiv
         i/MK8FRbOrwKfuRg8H81SG1FvpjZRDbvQfkIvqVuRF1dN7iNmgQCbahnB6YxM9/k8yLb
         L/m/QncrGKQx1CtcZFdWz4mo+zITFh9M4m1kkAxke50/y7+QnDsRF7mEX76rS2S9RkQj
         VGxf55L6qQT5U8E9uAYmcr0ruYYXuJc0QjnJIRltSjCFPKG1TWdhPrHLx5d8rhy4Fcp8
         /gdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaauMgGNxcISEd9PENgGGo1D/XCvRGLrC39QFlN3tQCjcfvRtGjpxmKAbSVS8z1Mc3s4ysyW7XeUXizM/7rRMD@lists.infradead.org
X-Gm-Message-State: AOJu0YyrNxalj3+4If7Z54tqj4uHRcy5qO56R4Ivco7BstdH3enDxzr3
	1ljYvEHvvytS3dUR7y2YuNd7TfLpIR9wQPCkODC2d6oczhX3ADVz
X-Google-Smtp-Source: AGHT+IGo5t/YGqOG95+HxnpFXmcZcZV08248fLElKYVYfbislpYCQJusFoz71CRdRKvzJm3CtGqcAw==
X-Received: by 2002:a2e:4619:0:b0:2fb:5b23:edba with SMTP id 38308e7fff4ca-2fc9d32fd88mr7586791fa.23.1729674552286;
        Wed, 23 Oct 2024 02:09:12 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a8efsm4133058a12.52.2024.10.23.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:09:11 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] tty: serial: samsung: Add Exynos8895 compatible
Date: Wed, 23 Oct 2024 12:09:02 +0300
Message-ID: <20241023090902.538040-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_020914_652845_145651C8 
X-CRM114-Status: GOOD (  13.62  )
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

Add serial driver data for Exynos8895 SoC. The main difference from
other platforms is that fifosize is only specified via the
samsung,uart-fifosize DT property.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 0d184ee2f..ce3c3ec34 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2498,6 +2498,12 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	.fifosize = { 256, 64, 64, 64 },
 };
 
+static const struct s3c24xx_serial_drv_data exynos8895_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA,
+	/* samsung,uart-fifosize must be specified in the device tree. */
+	.fifosize = { 0 },
+};
+
 static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
 	.info = {
 		.name		= "Google GS101 UART",
@@ -2528,12 +2534,14 @@ static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
 #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
 #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
+#define EXYNOS8895_SERIAL_DRV_DATA (&exynos8895_serial_drv_data)
 #define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
 
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA NULL
 #define EXYNOS5433_SERIAL_DRV_DATA NULL
 #define EXYNOS850_SERIAL_DRV_DATA NULL
+#define EXYNOS8895_SERIAL_DRV_DATA NULL
 #define GS101_SERIAL_DRV_DATA NULL
 #endif
 
@@ -2623,6 +2631,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "gs101-uart",
 		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
+	}, {
+		.name		= "exynos8895-uart",
+		.driver_data	= (kernel_ulong_t)EXYNOS8895_SERIAL_DRV_DATA,
 	},
 	{ },
 };
@@ -2646,6 +2657,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = ARTPEC8_SERIAL_DRV_DATA },
 	{ .compatible = "google,gs101-uart",
 		.data = GS101_SERIAL_DRV_DATA },
+	{ .compatible = "samsung,exynos8895-uart",
+		.data = EXYNOS8895_SERIAL_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.43.0


