Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA72CC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3743PsDYmw0FuLo/fDLEYDEF4/6D0ibRvsDao899kPc=; b=MHPZJ1aJBDFt5LFoiVbKpwR9gG
	7N1hrRKIwVgbvavFRwcyTimo5Inm8CqyPA9mvGATWOH3+c3gkOOwCHsqzWRmZfurvYiO7HXoMDK6a
	q5e+RSpyNwM/tQP7hwDsfWxr3NCCjXWlEz1GB/qJc4DWubJGQ22tCL61ulkH5lfKvBdGmyZaGAHQ+
	M6zIk7QBuFj9yDahQLmXeeW0H2ga3+ishvFdzN0b8euJirONRvWVdxssz43NP6cCsEKYkDiqjz5vQ
	rPHxlmBQCHOUhBEfqnnbsEvaHRSBcifx+ecDPs53AVYltGjbviemRbJP012U2JmaToWBdo6bkphvM
	60zQz7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAFV-00000001fVB-0SdP;
	Mon, 30 Jun 2025 08:52:25 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWA9a-00000001eSa-338z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 08:46:20 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7kOF8012015;
	Mon, 30 Jun 2025 10:46:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=3743PsDYmw0FuLo/fDLEYD
	EF4/6D0ibRvsDao899kPc=; b=KR7LCM3TpS8rrysblkmnP0SsTAj5hWXjCqEK3k
	Kb84t80ZltEIFeC+UTyns52nSFbgHL4pwMX7YRaPYLwEZQP5shnlHqyytIVYhKn9
	wDIk/549yBVXDkJ29IQCIzvTGbvpMErWqRC72lXguhEtSNcJzZmk/8DMj+mhONpK
	4gT3RUUxQYZkvtDmVDwu36Npc6SRuMBTjbkbzX5V2q6rjUEoo59bDUuuh4KIfZvF
	R88DMLdX8Zpww3/kP//zqRPA2DlBXLxoqjz2hoA079FTBmDZsZEd1oC/gF6EKK9D
	kiQ9DeWEcefHJRA0QMIqSfk3bvtxq5ATTpPL9WmDBQFKU4Vw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4m3w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:46:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E244440045;
	Mon, 30 Jun 2025 10:45:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CF34644565;
	Mon, 30 Jun 2025 10:45:08 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 10:45:08 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 30 Jun 2025 10:44:53 +0200
Subject: [PATCH v11] arm64: defconfig: Enable STM32 Octo Memory Manager and
 OcstoSPI driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250630-upstream_omm_ospi_defconfig-v11-1-6e934fabe698@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIROYmgC/32NQQ6CMBBFr0K6tqStgOLKexhC2mEKs4CSDhIN4
 e5W4trFX7y3eH8TjJGQxS3bRMSVmMKUQOtTJmCwU4+SuiSEUaZUhVbyOfMS0Y5tGNN4prZDD2H
 y1Etw2NkLuLMyVqTCHNHT68g/msQD8RLi+3hb66/9dc31b3etpZZVBdo5C2VR6bsPzDkvOYRRN
 Pu+fwCWCjADyQAAAA==
X-Change-ID: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_014619_062715_EC4803A0 
X-CRM114-Status: UNSURE (   9.33  )
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
Changes in v11:
  - rebase on top of next-20250627.
  - Add Alexandre in recipients.

Changes in v10:
  - rebase on top of next-20250509.
  - Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_defconfig-v9-1-66c1bbac5461@foss.st.com

Changes in v9:
  - split patchset by susbsystem, current one include only defconfig related
    patch.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2211c385195456f8609edfad40202002df0abb5f..978bcd554ee18b0fa1975a984b9eb9058727df81 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -582,6 +582,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
@@ -1528,6 +1529,7 @@ CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_FSL_IFC=y
 CONFIG_RENESAS_RPCIF=m
+CONFIG_STM32_OMM=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_IMX8QXP_ADC=m

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


