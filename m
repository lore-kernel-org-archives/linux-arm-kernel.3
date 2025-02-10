Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81876C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0uBt0qdfbgPaSAU+tmuCzWxGHoEweyEWa0O3H5K8Hw=; b=JmmoVWcqwxdHZuH4uw2nP+eA6S
	ryyJNvO1qu8uzYunGYses8O5MI4gKH43ch44qKXEGiYv8bG7zRJnWfpguCWkNsAhxKHhhS2MTflLp
	xduJz6UrgMQ1rJhHu3ySHA60SZaqV6LhsO/cR8xkWAQY6IKddcHMKPdfobEXnCAoshjoN/Q2teUTM
	dROJvkF8pMLkpzSEGJFXnVJVfAW9dGbG/AWkf+u2WWFSCquJXm8LiKHrstJ2DW/9RQHDXNBAgVaYd
	Ihc7STyumVL8OFPI6o/XJukiK+vp42AnfT1BqZLUOiCoRvU0P2yiBwLHYutq8HqVR7C7jFxJr+Cj7
	3z0tj1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVhV-00000000JH8-2pnw;
	Mon, 10 Feb 2025 15:27:57 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVeC-00000000IIq-2PPT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:24:34 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF0qsq032479;
	Mon, 10 Feb 2025 16:24:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	E0uBt0qdfbgPaSAU+tmuCzWxGHoEweyEWa0O3H5K8Hw=; b=gZVpkvhVJIVbC7dh
	Ihd9CFt1OoRaj1t9D5cNbjQDnnijPt0sHyiWWDXIiKRbtyAEgy38qMyftgyXmWHW
	h60dXMge38XiAo+kCI0vKYEdjyHT6QhPUIl97iP22Nl7rzcaR0+BwimerJEKMJGN
	gxQrsf9J8mr5zS3722Zu6spbhua9sjFx4Qe7ajjn64YYf5OqNDtLsRTbgGUfqq9e
	htH7Rn46hU4w3YlbszqwBhbWrCiaht7Vb+GRoJX8jmVr1JfkwUUiH76FaoFwUYhZ
	wL9bc2XitKxEzLcghCLGZvay9EfHnSb8G+fMKGGGveJRXy812ClYHhE6AndzymQI
	cLXlkQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0wsxy6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:24:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 042E24004D;
	Mon, 10 Feb 2025 16:23:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09B71295250;
	Mon, 10 Feb 2025 16:21:39 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 16:21:38 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 10 Feb 2025 16:20:57 +0100
Subject: [PATCH 03/10] arm64: Kconfig: expand STM32 Armv8 SoC with
 STM32MP23 SoCs family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-b4-stm32mp2_new_dts-v1-3-e8ef1e666c5e@foss.st.com>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_072432_905800_604E88A8 
X-CRM114-Status: UNSURE (   7.53  )
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

Expand config ARCH_STM32 with the new STM32MP23 SoCs family which is
composed of STM32MP231, STM32MP233 and STM32MP235 SoCs.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/Kconfig.platforms | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84da36619ddb8dac55a4bfd96d65e3..844a39620cfea8bfc031a545d85e33894ef20994 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -323,6 +323,8 @@ config ARCH_STM32
 	  STM32 family, including:
 		- STM32MP25:
 			- STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
+		- STM32MP23:
+			- STM32MP231, STM32MP233, STM32MP235.
 
 config ARCH_SYNQUACER
 	bool "Socionext SynQuacer SoC Family"

-- 
2.25.1


