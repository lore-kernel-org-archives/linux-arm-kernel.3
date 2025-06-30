Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B5C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fUjxTU75ZD40DdIr6Z8X8ufn/8WVlq3YFcObITGk6Pg=; b=VZBIAyvSNhtXR6StperQwbEuqj
	nJcIdyd1rJf1vIWRw4XMXMeqYzDjQ895P8tMZ87MzU8+IZUIal/9O8jNGhTLGdvt8tEgDD5zTSoPp
	saCYl4SqzsFhoRkMBcv3P/5/2lqkI+01+eYCrTy9A1lrEFKcJSBRqd366tr6l3qLbf5SULpdBwRi7
	7P6ERdB7/H8EqMdKI7c6gOB3rNk77nTNhS5hMG9T+mUYcaQNy4oSham9FXMUIe/CdOYls4wjBC9Dt
	f+1oWAU7KaW55h5k2xEyFpErIRhiCFVm8ASada7inAnuFNb38Yh1YPb/DSnSj8flwdOymobf9YZF6
	3obVNp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEJ7-00000002KWc-0SLT;
	Mon, 30 Jun 2025 13:12:25 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWE89-00000002H5r-3kAM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:01:10 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAhJQk015201;
	Mon, 30 Jun 2025 15:00:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=fUjxTU75ZD40DdIr6Z8X8u
	fn/8WVlq3YFcObITGk6Pg=; b=ktFywgu01LSZVISgRlLmmzgVOepR5cNYEzOpn2
	zVWxXroIb6x+nogDQQJYqkMi69rDnI3XcnNo8tUAGKw35i4a2EjUO6yfrQKnL++J
	g9mBsNr6bkw3odTJZNAU8gViEKDpJ22NjwPRT5JlnAU6CPn7MTtaa9o3MBlRsCTh
	DaPn57w+QSCmN+fDiu9rRXTHb5vgvGiBa8v0eX+JHAYSvaj3JadwozxtUoj0ytef
	jLpyt0/I9nZ/9n4AR0VT43psrBcpO3lpL2ya97fANVEJHKtCg+4Kpz3zq9pbwbfv
	WIwtQlIWXagJSIHExqRLuVIHxZhyi45rnCdf3hTnU3AELskw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4na14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:00:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F1FCF40045;
	Mon, 30 Jun 2025 14:59:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40FBAB46C86;
	Mon, 30 Jun 2025 14:59:27 +0200 (CEST)
Received: from localhost (10.252.20.7) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:59:26 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 30 Jun 2025 14:59:23 +0200
Subject: [PATCH v2] spi: stm32: fix sram pool free in probe error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
X-B4-Tracking: v=1; b=H4sIACqKYmgC/2WMQQ6CMBAAv0L2bMm2yqqc/IfhIGUre5CSLmk0h
 L9buXqcyWRWUE7CCm21QuIsKnEq4A4V+PExPdnIUBgcugbpiEZnMUHe5kJ4stSH/koDlHpOXPR
 +uneFR9Elps8+zvZn/x/ZGmsc09l6RGLb3EJUrXWpfXxBt23bF1B6QmCgAAAA
X-Change-ID: 20250630-spi-fix-860416bfb96d
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_060106_217306_66305C56 
X-CRM114-Status: GOOD (  11.17  )
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

Add a test to check whether the sram_pool is NULL before freeing it.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Changes in v2:
- Add Alain Volmat's Acked-by.
- Link to v1: https://lore.kernel.org/r/20250630-spi-fix-v1-1-2e671c006e15@foss.st.com
---
 drivers/spi/spi-stm32.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..858470a2cab5 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2486,7 +2486,9 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	if (spi->mdma_rx)
 		dma_release_channel(spi->mdma_rx);
 err_pool_free:
-	gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf, spi->sram_rx_buf_size);
+	if (spi->sram_pool)
+		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
+			      spi->sram_rx_buf_size);
 err_dma_release:
 	if (spi->dma_tx)
 		dma_release_channel(spi->dma_tx);

---
base-commit: 045719b1d0aab98e6abdd7715e8587b997d1cefa
change-id: 20250630-spi-fix-860416bfb96d

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


