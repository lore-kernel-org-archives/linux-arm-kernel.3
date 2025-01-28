Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E88C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS6ZeKcFwjwbaWEG9rRFMoxEuRqmhsJrtzj8awJZDYo=; b=Vx5QgjNMvwhjloETlLpgiVFuEA
	WVnfh0U4f4hOzbWBSjsoyWJwL/SFCFmHDEmhJq97gq4K0SP45gNyRihieYLH25zhltAaln0sKUpF4
	3EtNyjBKhHcECEKi5Xzq/7z9hIjmfhQmym/5G2Q2CzWIOsZ8zt8urwalyRpBR2aMzFvB9gQ0yEjyL
	UvSa5ks5hwVuhFo19TtzFRqgql5sKM9Ue8dzFP6h/fMyO2YD30rWOg5Q5S0T/X+yIvg4oZJBZxWbd
	jl7uj4waXhCfF1IXh+6sOEo0cyA0+EuOZ9xYmgdzR799Ib6ImnHPAVonHIlZW8+ers9Rzcpp12CjR
	CdoiDehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgvb-00000004Nm4-15S3;
	Tue, 28 Jan 2025 08:26:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgr2-00000004Mvg-27BR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jan 2025 08:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HS6ZeKcFwjwbaWEG9rRFMoxEuRqmhsJrtzj8awJZDYo=; b=pqVsHOZdkvi8/VA5+FTcwRDxfC
	qDqWE/kIIrYHrGWoKR9aVydcEV5y6V8lJf8jiu+uF6PNxnRkyp72VeR769VMblZMC1HaBesuCdP90
	A7sljiSTBywm3xQ9e/tUAJsrEdEeVM75RA3eI5iU0OOVAlFwwfx4cXUSRBJKfo3TKnwpezJt2tooM
	Pp9PnRulVILA0o6kuuX+VWD+b6oXOLRNzQPMtVOaVQgcdyNu70Ifi5V2EbHs9Vnpz98D4iN+PNxCr
	aZ90y8MGvdVkDZ0k+YgjFUp9dlLFVVvKaOJsUAElnQFHRH+7ndC36PSpCOgGfQ2Zfz8w74xasM1zK
	mTnQAwIg==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgqy-0000000EsRD-4BFN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 08:21:51 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S214hV017099;
	Tue, 28 Jan 2025 09:21:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	HS6ZeKcFwjwbaWEG9rRFMoxEuRqmhsJrtzj8awJZDYo=; b=hwCGBd1CloWVywIS
	qZ9i6dhgkpwfNq68eHKwQgSyd2cKyOnp7JupGYnQEwn5+FagTVVNoHXF6KTjHZhY
	+dhiBnXXLsTvHb7QPrIRXuPKkj2p4D65K4nZYJbRPwDud2vc2GtApgAC4r3TBhZP
	id5JfBffsW+Vb/IGysTvf1fOVjan7UmhJzyGsLx7XvXkxOPHe87N10l1rd8Bql7P
	YdcOe7l7cxi/px8WIi4PSf+GCZOmfAAWbdWxX/Pk4oLEOrXOPJo/C44lxVnHOb8X
	QhMU7xprDcK6fQeDMBuCTyVEjkqsRDgVyuP8L/Kx3VIf3PpoeDUzeerO5pyl9XKZ
	Nijgtw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ebcbjruq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:21:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 57F2E40056;
	Tue, 28 Jan 2025 09:20:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8F8629C61E;
	Tue, 28 Jan 2025 09:17:48 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 28 Jan
 2025 09:17:48 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>, <patrice.chotard@foss.st.com>
Subject: [PATCH v2 9/9] arm64: defconfig: Enable STM32 OctoSPI driver
Date: Tue, 28 Jan 2025 09:17:31 +0100
Message-ID: <20250128081731.2284457-10-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_082149_558538_927378E9 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Enable the STM32 OctoSPI driver.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bbbaf9a91d6f..b089cf4b90a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -577,6 +577,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
-- 
2.25.1


