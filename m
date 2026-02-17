Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFABE909A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lESINpYOthaX/U+Uxdy2J/xlXhHTTcmtf1Y8H54nCpw=; b=zmGDmAKLeyvJpUJGtnibDNKWMm
	UQV5jLEX+6UFRN1VM2U49W27pfj647yiEHvNz1Je+HBNyPJa9RV6vmgPoXx8cyru2l0YBhvifcwMk
	OY5H1c63LUNvatobZx+0Iym2KB1enKbBy6eDBpD3lHx5+mlV2J5bW4U9YW9RlCdNx8AMWDgQSYfvc
	dDRgusUEb5k5DoOfleDwEzvmaZG/bVH/zbIhuvDdSl/TplJjLNve4Oy87g/FBeUjWKUPlPt7OXRhk
	Io9f3WQ/t/NXmoNRBrZN2H/2JuagfN4/mbsMLOuCSye+d/0K0FdHp+zD4SpxkIQ0+C5pIf2juF/Mc
	wzgpQ+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLYE-00000008MyE-1ZwA;
	Tue, 17 Feb 2026 13:55:42 +0000
Received: from mail-northcentralusazon11010042.outbound.protection.outlook.com ([52.101.193.42] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLYA-00000008Mua-1tBH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RM5e9m2QxXSdVg+brVV2ncCvDWKpn0Z+AF/UZ+3slLh1v4QMTGy+4w8/igjZMjBwbyVtwl2F73rfNVn4DnwEhw2d8Ok2QIu8qRngwIQXDhUqEhRUhORmAPBhHMsfh2iRG4FYtqrowjgAhoMXLouCoY5gnSbPQYvfJoFOBLDW6k/ZMhOYd0IDK/taboU/9Ksz5KWe7o3rHx/SA/d0baYtkHjnkPmiWY6wJrx9LSCE8v9Z9lE09yl05C61ILq9z/9R1abZvNYCWlkgqBSCjegElPUYd8SNJKa7qGqX+dKz2hzJb0rH6m/nH5VLsh/hAq0t+JpaDue3KmUWx5CPYJmDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lESINpYOthaX/U+Uxdy2J/xlXhHTTcmtf1Y8H54nCpw=;
 b=XLzRs2/8qm8Fdkhbo/8+jmgtA6ahHh0zhC3HqOJHo3EnKEamEMqCymplufKKAJBaMtVN1V6r9VO4/6B82jiFRdgH9szVytUB6d4smmkGG4yPAwKuDdpzcX9uBZw3XJB8bjtqYLIL9GKCDg6ifoRawrHTAt73vHuARUBkixfjtSB64kTQbok0p6dMRErknO6qFf2VHGYhzT/OVhZqxhZwnz2VzeQFdcZ621nfJHmqFQtYpV3q3kDkn+XccmQij2zSZfgrUOPE1s7Jo6BIEU3IOefp9WJtOizPyqKwSAvgaMwfgl4o8C6CappJBUXSzabS/0D3NrjjsJ/v26FztdFgFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lESINpYOthaX/U+Uxdy2J/xlXhHTTcmtf1Y8H54nCpw=;
 b=MNQs+M7FDbxPSLjd6+sTzU4RRocTb32i1/avrqkSwI6ssyl/RD1K4MVXByDoBI6Zow99GyZkxei78NAUYWOE5Ewy9ehQXwsB7m2kkNfVMkfp7tdG8ERgSHRvuHiMnd6+tSFBkJv2LiLuQAmz84mHdz/t2AIlfAjDoXMcFNAsDVO6Jj19MRwAmUDaLIZFRstqLsPRYCtn92e8BsFe8T8bz/TersgM+QcW7qG2Xur/dJkeyqVvc4eFt5kl5fMcL91EbxqKG0m+knyhWkbPwV7JO1qc2Ui6O73UCM13R1Q7mTBUfcEmUi61NiUUU5FoLU+q60zL45JxORWLCT1NXXzWjA==
Received: from BN9P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::8)
 by CH2PR22MB5994.namprd22.prod.outlook.com (2603:10b6:610:284::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:55:28 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::dd) by BN9P221CA0017.outlook.office365.com
 (2603:10b6:408:10a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:27 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A35CCFD318;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/5] ARM: dts: imx: b850v3: Use alphabetical sorting
Date: Tue, 17 Feb 2026 15:55:18 +0200
Message-ID: <20260217135521.65742-4-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CH2PR22MB5994:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8706bd8a-6985-4a64-4bd1-08de6e2c3513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W1lgkj7XIaEQq1FKcdNjF2hPm6WmvZU2vj4XjtEa6uII3I3fDAKTJ0uqpoOx?=
 =?us-ascii?Q?h919z4rdpar6r7Ez8M6KJSbKjEJmwbj5moYK+/10MDR+F+X21GWdF53rIMsh?=
 =?us-ascii?Q?o2Tt+DAaXMFd+4mRyyx2QWHvpLBM8tPg6aEvSZit1PF6xYJH+B8KtoGIoaZR?=
 =?us-ascii?Q?A1GtYbi8dLBiFeLHTkx6/cDtRwNIJ7v/c+R8ZHiL8EMm6mMl3fbWw6R1s1C5?=
 =?us-ascii?Q?rmhNSRGIgcepfpCx8yA4S4SIYUdgHFRQvUchkIDQg6AbdQxFTyqwog8FNUb6?=
 =?us-ascii?Q?GKT3wdNiUa6ODVzFuOTYhdZahbiy7OZohfvOMEHIcG2nK63I7hnTATJ8fCLI?=
 =?us-ascii?Q?nRjlSJywTorxhAti3UX70u6U5U97dW+NrIPk3MA8sRXEiiBYqXJJ6CJqiwHy?=
 =?us-ascii?Q?5DILUNDFGSVFhxABzGPM0vQF9i5ommZ/bOC7KWW7K54RwG30l2PeA8gbDpQ2?=
 =?us-ascii?Q?SbGYK6YCfB+ci7Yd5R+wuCs86nGfNyzJJkFj+jivl/qK6FEDRo+qVkpWkbSd?=
 =?us-ascii?Q?+n8+OnALMlRrRWgvdYJ+SCu50380dirh2eyjMXGbh0KUAybnttWuxcL14+39?=
 =?us-ascii?Q?DpAjLnIqfI2sgtOLclSfqfFM1C7pr9z5Ti75d82fw8U3+YOUnsp1D0Np400C?=
 =?us-ascii?Q?ob3UuB3Qw6m64w6gfbyaKUvl8s49jv7OmqILJLs+DB+/oRKMGh6DY9soQQNV?=
 =?us-ascii?Q?aRV0OI80TGXD6fB5V+0Ds00/MeCsXlc3AEZNXsMNgSq3Vf93BGd9bJJp5Tvh?=
 =?us-ascii?Q?IkuGXKvNS5s/N+baJpJjoN2evN4lWulRUX5BdjvsBus3kFgzC1Sq65mAd+Y0?=
 =?us-ascii?Q?4zVxGMxX7hY08HRG+IdASMUp8qo67LSec0E369r0GZlY18Yj6nmmfRS49NlP?=
 =?us-ascii?Q?zPfHQuEnFuSeMX/a3RlYGDcN8DbGpkd8HPn1a7cRWiEC3yALyPqS/mXIf5FZ?=
 =?us-ascii?Q?N/7r6xFPNqMJx+HkzqlQyu0MrSXb3WgyV+dMvm7X85kTDBrZ4qHLqYdiXpJl?=
 =?us-ascii?Q?m4ODCjmg83Fc4tVpHTTCXwbHmeFG2jSBN65kauheLPGf74kHhbd3gVXpfXFw?=
 =?us-ascii?Q?v0dDGvJNj+mrkXRgVybOLi6XlBWxAs/jxENGSOVjFOCwkwQZF2uJvu9RFXUE?=
 =?us-ascii?Q?V+qYudyZS9yqJRYSvoJgNu6ws9nwNTRbgnpzTAiHca2+yVaoWwZomWHVw751?=
 =?us-ascii?Q?FsU1oxWtPCKjoFpGQf4QUCCRCYirll97gg0Pelub+zbjNPEpU0NZwYWAvmtn?=
 =?us-ascii?Q?yx97SQk5qZwlT+zLhVis32WrBNBlA0ay03RKzQY3wVZClCY+3ZBrdxjlGmop?=
 =?us-ascii?Q?4ztbqf3ZoiZxTkVhor52Uc6whKDNICRP4ji6vSGlaBZvsWndc9AAZxH7A7KQ?=
 =?us-ascii?Q?4jhJjYI4tVd5Oed3ytxrX2NqRVsFeeO0foa7MK4ryxignJ3iDpvqLEOGatah?=
 =?us-ascii?Q?BbCYnZbQVBp2yHIdmBi/ymepjc1ED485+kJJtlxra1heoOKsaTn+RH7smGMP?=
 =?us-ascii?Q?2uxNfGfzQP+tUREHbx6QK+UahmgANv3Wgw+5vOPccLVWeJi8xzdK1w1W34o8?=
 =?us-ascii?Q?1NaybWB5qaqxZ7ePNduAbymwwE5KOhtaiK2XALkn6YMZ0iyju1w3kgFFAQx1?=
 =?us-ascii?Q?x/oWGq7IO0HhM6LX71mIlMXDDNSs732peqOgYGQ5jF4eKNJ/AwnGd6ibCMAN?=
 =?us-ascii?Q?tQa7+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aeAjShwnQtIafxOOxtcysWrpXeeJAb/LTWvZiVCJ6ntUZuWnzmHxqlR+St22fafEeh6ga535nW7/pG3m9k9o/lBl6PYwgbC1Yy43rz7SaVV2QDT9DjcTasidlsCAiTlZ5TAxPzK0YmifanJ/ZP7RoKs1KisJxH0fNOWsZvplBK0zLKP6uP/hi2vz1r6R1P5uNG6K7sRuqu++8LH6+dgFl9i8JpHNYknKMjBrZ15BpAgtZBYdtCU1vP+uxJLcETlNf3Tigz/cnt86XiGnqVeq8GnRzAIBgnYMh3J80WK0hoJ3tDNNKUyPFsEfSErnPeofy2aUDfrUMYsM+ax6yT+g/Ii0YLbvhbffTO8mWKhUuBYar/RFb/cJQsZL33WboHVUcftwSbO5CqvI/sFsxEHt7NRkpB2+PP+6em+lKCRW69YtMxAcrwUC0lbU43dFUvrI
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:27.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8706bd8a-6985-4a64-4bd1-08de6e2c3513
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR22MB5994
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055538_514074_02308C8F 
X-CRM114-Status: UNSURE (   9.79  )
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

Use alphabetical sorting of references modification.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index e7ccdcba2d5c..fa5814287f71 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -53,23 +53,8 @@ chosen {
 	};
 };
 
-&ldb {
-	fsl,dual-channel;
-	status = "okay";
-
-	lvds0: lvds-channel@0 {
-		fsl,data-mapping = "spwg";
-		fsl,data-width = <24>;
-		status = "okay";
-
-		port@4 {
-			reg = <4>;
-
-			lvds0_out: endpoint {
-				remote-endpoint = <&stdp4028_in>;
-			};
-		};
-	};
+&hdmi {
+	ddc-i2c-bus = <&mux2_i2c1>;
 };
 
 &i2c2 {
@@ -129,8 +114,23 @@ mux2_i2c8: i2c@7 {
 	};
 };
 
-&hdmi {
-	ddc-i2c-bus = <&mux2_i2c1>;
+&ldb {
+	fsl,dual-channel;
+	status = "okay";
+
+	lvds0: lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&stdp4028_in>;
+			};
+		};
+	};
 };
 
 &mux1_i2c1 {
-- 
2.49.0


