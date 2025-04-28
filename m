Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F8C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U11p1IY2aK2v6bA7NuFH2Skoo0U6MbsQxOYKzBo9dzc=; b=p+5gKuG7Nls040vOovWV/Lna8m
	TIjOb6N/VEfG8w43M/TE+MhLGY2lrUMunmHPzzNi9lmpEKrn0REW9+QnT7S+8+m5GQOBya0yVRf/G
	ayKvmExQZlh+XMFYvAzvN9l6yJKcrYI18z4HRj0+bEJrpzdYkckXwIyKzJA8lr76QHQjj8/Kul3/5
	ql3zDQcExNSEAzFTEGz4dVaDzwmIyX6fnKP4bbG4rHF0LY+s9leCZIigp4c1UPWOyD7AUunZ0bWWD
	cI2XWOmXjl/Tx71BnFUpUERuJ8cEoFHADJr8V2BHcOwBd9dgu7wgkM8OXZWp4cLvDxVkSWTZ4aJGH
	Dd4lTR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Kcq-00000005ZVN-2Lmm;
	Mon, 28 Apr 2025 09:18:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KBk-00000005VxN-08UE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:50:09 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S10wD1009691;
	Mon, 28 Apr 2025 10:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=U11p1IY2aK2v6bA7NuFH2S
	koo0U6MbsQxOYKzBo9dzc=; b=Rca96GAABPkgMmwgmIBMQrb/IQ1Cv5krsECLbv
	rUneOz0zCUfLj/67KK7Jna7nwOGVQabWLi3O7RQaJI5v4pxD6/locx+iOzZmeH1N
	c8YM0bq8CmYWxkV8rbYlUvIrzfD1NDIQEjam9RtzLYk1/siPSBfJptyg6L7swnkz
	MHRAZuqijtfz/7Xx2nsp/H/7f5poxno9jaS3+3BR1kGA++jSn6ss14p5orJ6CTM4
	1uQpJoiNJqYyZBs2EuqTalCEcZQk7YP+Xnez/YvUC97idlH6rv8Nuv1FW4bLSikj
	XFu5XALQn+3Ybli6cVF3azxuTfH5G7YBlhYfOkCVtQ/dtlLQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg5pda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:49:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E8BDA4005D;
	Mon, 28 Apr 2025 10:49:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00C32A3B91A;
	Mon, 28 Apr 2025 10:47:44 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:47:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 28 Apr 2025 10:47:35 +0200
Subject: [PATCH v9] arm64: defconfig: Enable STM32 Octo Memory Manager and
 OcstoSPI driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-upstream_omm_ospi_defconfig-v9-1-66c1bbac5461@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAKZAD2gC/x3MQQqAIBBA0avErBPMiqirRITpWLNIxakIorsnL
 f7ibf4DjImQYSgeSHgRU/AZfVmA2bRfUZDNBiVVK5tKijPykVDvc9hzHGm26EzwjlZhFrS6M0s
 tlYZ8iAkd3f99nN73A+OtOFttAAAA
X-Change-ID: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_015008_361612_15632ECE 
X-CRM114-Status: UNSURE (   8.42  )
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

Enable STM32 OctoSPI driver.
Enable STM32 Octo Memory Manager (OMM) driver which is needed
for OSPI usage on STM32MP257F-EV1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v9:
  - split patchset by susbsystem, current one include only defconfig related
    patch.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..288b3beff20246c59b497fc869c5f366a21b089a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -580,6 +580,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
@@ -1520,6 +1521,7 @@ CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_FSL_IFC=y
 CONFIG_RENESAS_RPCIF=m
+CONFIG_STM32_OMM=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_IMX8QXP_ADC=m

---
base-commit: 1990c01f0bcc5655596709d0b8cf4e412b4c837c
change-id: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


