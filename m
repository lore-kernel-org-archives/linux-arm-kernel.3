Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E7CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20owZPyvCqdzO67jL6iAj7bGP8jkca0HcDebvg0pgwc=; b=yvgzV5kENXLhDv/xqwASwhIJiO
	7HXbAU6gUtKydc148dHuqcfmeCGiTCKdEd9g9XcQlUAeQmXhHMwpdEtbvib3pTeXPwHojg795cj5g
	CesASI6un0roXSDSyPGTzHiZzAOjwIqsIwyGg0T4Rcp0JwiffDY7pys+lhPWZnWNe+vnhvPdGUblo
	m7pXufPsN7xoWzw/6ZFYcvKzB/vRVDWcHI+amoxhllfYa7O5BWUCFOG9C9QZ1xw1jLxYhEAoQjuvW
	+EiC+rWTKDeEcgAlwTAf/ANyDdpNuSJtJEaI7DcaCKTycaERWJCG84O2ca/PXdofZ7Lh+JkGMe9oM
	LYo9WDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqzD-0000000GX4D-2ehl;
	Tue, 25 Feb 2025 09:12:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqkq-0000000GU7N-0TKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:57:29 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7jf7w018116;
	Tue, 25 Feb 2025 09:57:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	20owZPyvCqdzO67jL6iAj7bGP8jkca0HcDebvg0pgwc=; b=L5l6jviacu61kees
	gmuQAzj44Wv1uU1hXNRC4tdmrJzs69SjLDcpOxCsNHw7R1TVPFMAi5qwtrJ08hD6
	fUEKAxySxmBP3P45t7Rkrr55xaTDyeRY0euFdEd3J8uaTby5lMhkLyOOqa1pdkj2
	JZ9UmxD8W0XDLy19MF7qO7b4PvIkihC+0+Vl86MZ8QDKgeqG0JKsKaieM2B7162z
	FXsilfzu5CJXet5Bsu6z1/6+/i3OH83YERGyc5ujDUzSM0GFfC56/FAI4+J2FEYB
	ojr6Nt3hHvS3bJg97iuLKELzHr6LdW91VQFXf+VVEzGce0sG3g+0b8jztx4WkoTa
	DJ1fyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sqsssk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:57:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 792D84008D;
	Tue, 25 Feb 2025 09:56:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5AA647D0EE;
	Tue, 25 Feb 2025 09:54:31 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:54:31 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 25 Feb 2025 09:54:06 +0100
Subject: [PATCH v2 03/10] arm64: Kconfig: expand STM32 Armv8 SoC with
 STM32MP21/STM32MP23 SoCs family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250225-b4-stm32mp2_new_dts-v2-3-1a628c1580c7@foss.st.com>
References: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
In-Reply-To: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
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
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_005728_442107_0C9F00D0 
X-CRM114-Status: UNSURE (   9.05  )
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

Expand config ARCH_STM32 with two new SoCs families:
- STM32MP21 SoCs family, which is composed of STM32MP211, STM32MP213 and
  STM32MP215 SoCs;
- STM32MP23 SoCs family, which is composed of STM32MP231, STM32MP233 and
  STM32MP235 SoCs.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

---
Changes in v2:
- STM32MP21 and STM32MP23 added in a single patch
---
 arch/arm64/Kconfig.platforms | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84da36619ddb8dac55a4bfd96d65e3..6b7ca916c9c1e21d4fb2d7edf444780745c8d926 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -321,6 +321,10 @@ config ARCH_STM32
 	help
 	  This enables support for ARMv8 based STMicroelectronics
 	  STM32 family, including:
+		- STM32MP21:
+			- STM32MP211, STM32MP213, STM32MP215.
+		- STM32MP23:
+			- STM32MP231, STM32MP233, STM32MP235.
 		- STM32MP25:
 			- STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
 

-- 
2.25.1


