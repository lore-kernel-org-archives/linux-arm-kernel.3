Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78948C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXzEBs56JYF3kuyf685C5oYk8b4lm1+jJLdzMsHhq2c=; b=wjsQgXZHqXFVtj82NODI+tDnxG
	E7HJ0MA1Gm56nXKSmeX0p3MFifqja9B2nGpaGbdqeV929UAIflg7/2DfRcscCVyFpjLLANfL/OMei
	2lR/9ZPgyfh4vK6s5dUbOHOsLHATB2ps93Xt9wFs/44ifp4sy+yboo7XIu06p3nPG57fvCqK9/QMN
	xHAYEGFzEa5J9QC5vbmTo9DjKJdub1xxhasSdJQ1wTl85zF6W6hsAzdcsYPNAljsm5aXLObALJfAn
	5YN/ea6GOH5yvgxJszVdIeelzkW1E1PTssztmOsn+lB08ZWh09pJ8w0VWOufdAZFEEjmjcJ8vDlef
	E4/8V4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJWl-00000009W27-1NmJ;
	Thu, 17 Jul 2025 07:59:39 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwh-00000009QDS-48E9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrPNFijHkeXdqxT693I78nIPefmfVOXcr1y5wL61WXflWw8lATncS8rEh4BO6e8/ETty/zSiGlk+2dt5SFsWEIiqfvk4Gc5TGPCQMEx5hzHpNLIBASyQasWK9GvdvWSv027AfcJ32/AnCsg3cl89SDsNWpVaWxQ8v5XJaqtrk4fow+gv3sMKwEgvnJewFxPOpNr3VI3WhLh3lOhTxACdHVwTuExFhg6gBMoQEvGCfi3nbOLyH5ptzeQZvl/Sk1W0gdjBbanlD3KcgSTaBAns8BjaAXI2rnqbYBlhWLDC/gCdO9+5PJlQWM5RrcDDsJuXV1ciD8jbBkmfA2aRBdvlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXzEBs56JYF3kuyf685C5oYk8b4lm1+jJLdzMsHhq2c=;
 b=YflRsJuvAOky7KeP5TrHTxdEnlFzUehdt0guCGFlE/hi1jh18tmyXUuRGW0cBCr3XDmKZyx5AuAln54i/xOFb+0/uvejtpu2whD8Ka5YwTdjuh70phe2u0Qf3U+jVNxpK9sBDVfk8A9EeXBDXENapYkHSoOUG/NJtEGkNk/bVNtCXNL+EWaH/YzcFAHhc7VGi1QOfBmGzMRB6uoBI3VFQwvbwD8XYG6sB8vVAi0jupjLAGatlFW3kzNqYXy0YCj2HIFSxbaoDK+yQHcGx+CT9cJ0MBj/xc7bYZ/iZ+CpjNK1iBV+FHi+CRvuytMlz+bfAI76vWYskDObKM3BQg+ZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:4:188::15)
 by KU2PPF6981E6D66.apcprd06.prod.outlook.com (2603:1096:d18::49b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:22:12 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::16) by SG2PR02CA0132.outlook.office365.com
 (2603:1096:4:188::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Thu,
 17 Jul 2025 07:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 07:22:11 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 090674160505;
	Thu, 17 Jul 2025 15:22:10 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 6/9] arm64: defconfig: Enable CIX SoC
Date: Thu, 17 Jul 2025 15:22:06 +0800
Message-Id: <20250717072209.176807-7-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250717072209.176807-1-peter.chen@cixtech.com>
References: <20250717072209.176807-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|KU2PPF6981E6D66:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6651e38f-6540-4bd7-bae0-08ddc502a5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UKaMXh6XIPUVpsi3WZFgJ92Fc2qYPsuXgdYYm276ln8mgiO1CpE2iZafYOh1?=
 =?us-ascii?Q?IGSFOs5+9pQOteIwqAIIP/dQxZ3xg4pHIvghFJWK7s9+c3Jmwa78amTZz0cg?=
 =?us-ascii?Q?/nx9aOqY6wH26c28NFF+FGH1wt80f/vlXpQ4g0z/Y0XwhRu4MdpcNw8KRork?=
 =?us-ascii?Q?imv9xbRJPQgBzoLQawHIPbHpp5RX0jcefUmQMgSixj6YCR+MzXoBhsRuotvD?=
 =?us-ascii?Q?aVKUQ/FZljRp1+8dxNcaWj4ZQQjAZOwpIntDRD8VlLaHfVJ4x+YSWLWGyo4T?=
 =?us-ascii?Q?4qJJGYxXGLNIIhHA57aMB1RM1iYMAt4tzHNqK2rqY9LBpCTad+rGWkV0xqrR?=
 =?us-ascii?Q?X5+Rm34sqJtXNS9qkftfwE0z/QHRbvhHcBB3J2lxlSHhxhG/UBFklXXg1nFn?=
 =?us-ascii?Q?uJhjP8WKuBZ3ybqEBHYmWISXfLMwp4dC9D+3zuny3FUtqZQFKIef7EEe+eiy?=
 =?us-ascii?Q?1esB2nTwXayrJxFK4M0PPIkEgCUyBfrr1SWey/kzBXK+n5DL+4zQsJa6x3VC?=
 =?us-ascii?Q?bnNUgJHmUP6RcQEV+zRrGecKmV5rLxM7MA2jh0WWflKW3FkRvL/TZ2bI15ak?=
 =?us-ascii?Q?jA21vvnFlFVSI3wHkE4SBIQknveI39SqhBQCVwqQW+C6DK86yHy0A8EIAtQb?=
 =?us-ascii?Q?llP2UdX8pB7H0ZyIRevuQLEcakB6NQtNxulzQW1UqJSzBAfKOAAR8+rNbSRn?=
 =?us-ascii?Q?fBXnv9nTtIVD5A4MXjy+cjRh74yuICqDXqjvEr46sCHKcvFydk0P65qqPkeY?=
 =?us-ascii?Q?zympFVlvmLpIujipFNp53K4ud1xvGgjjm+y80PpqjL28kdM1ajtiACqL+50n?=
 =?us-ascii?Q?n8w/e4HQmMb7SjRpQjxfl0wp0GktVjSQvI+5V34eA0tNNlwEZk4rFwEd3k5N?=
 =?us-ascii?Q?FHo+Iu+9Kue1fKLCWpFHPYtqi0XKzXRzbyKcVN5RWjqIqUnAjvGO25Idlb0O?=
 =?us-ascii?Q?N0RGIxVGyrjWPtbR53zvo9XqF/dO6YhU1pfoXMY+gTFiuCkSOZcUY2MNNX0C?=
 =?us-ascii?Q?UddbfBQE6TD4w/HJgXb1iVUd1udbciDO3okNjxm27nXvZPFP0vYUVe8Eoq5O?=
 =?us-ascii?Q?VJ9eqFko29YJrn7tpGWFoPsYm7uoIYLyvm6hokkycgcg2F8IOUlOhkgAhE5Y?=
 =?us-ascii?Q?Fpq8BMGqbP+K0DDxBSc9cJmpbcnQPt9nwhwDq9ewFQcoshYMI31+3TSC0Pm0?=
 =?us-ascii?Q?/6n9K3aaRNwphe97f0iPM3umO5AIoB4jc1vewIViqcZuptKnRSFAlRxi7G4Q?=
 =?us-ascii?Q?A930kORxGLPFP+00iIDVfL13QjU6vlwDOhhJKCMgx4h7YGHpukZZPNXd0d+6?=
 =?us-ascii?Q?Vb/rmUNZJw9V5z7EA1kDbVLJonJ6wiao5ZDUJDKB5HfNUvWMByGfGKkoX/ux?=
 =?us-ascii?Q?n10KuCYqqPD9Z4JemHXHESWJSuKiXjOUm3lYRJtRXRm4CwcXHqGZZ3fHyuqQ?=
 =?us-ascii?Q?PaWjiNzQrhcTG2SWNuXsC7Bd5+pPvcLV801a3VN9nyjfmyIlnsPAhbVFiro7?=
 =?us-ascii?Q?1+On/gUzTPJYXqwvOxYXeCtaW8o10xXY6NiD?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:22:11.9177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6651e38f-6540-4bd7-bae0-08ddc502a5ec
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF6981E6D66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002224_084337_067F1629 
X-CRM114-Status: UNSURE (   8.77  )
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

- Enable CIX SoC support at ARM64 defconfig
- Enable CIX mailbox
At CIX SoC platforms, the clock handling uses Arm SCMI protocol,
the physical clock access is at sub processor, so it needs to enable
mailbox by default.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v8:
- Add Krzysztof Kozlowski's Reviewed-by tag
Changes for v7:
- Add both CIX SoC and mailbox configuration at one patch

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..181c5f91b032 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
@@ -1445,6 +1446,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
 CONFIG_QCOM_IPCC=y
+CONFIG_CIX_MBOX=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARM_SMMU=y
-- 
2.25.1


