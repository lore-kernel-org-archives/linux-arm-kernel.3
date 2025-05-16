Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00769C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nldWU/45iTLx/bZoTf91LYvS5/UOc9lwkYED0YnKrNk=; b=GS6Xw6On8a43z2MhUCTDOgEYOQ
	ln+InBsudLbE4YYjwPmn2QkoVOgPOLsYfQx+fHFHE75JTPKqu643bmo84cibjd4+mhKIhCrDreXBq
	oFjNiBw/tOJnsL2HVUPlERmq/dB/5/ayWYrSAgSD4gzIGZrg/h/mER5Vrp05ATBvJ7BCKHpv1BD7x
	WQT/mXBS3lJam+AjxxJDhL45IfwuT1iDdgu2NQXgeLNSZzaAHdBZ+mUHMaKeNTKERv+hcsxgbKQyr
	hkfp7sDjD500ZXpVvpHr6KbUeIz4DOC5HIAD6d/KX37TfwpH3dPXzqcV4kAnUsDpdNBa0QZJJ4mPh
	e0j8DwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuzj-00000003Ump-3FeN;
	Fri, 16 May 2025 13:20:59 +0000
Received: from mail-dm6nam11on20605.outbound.protection.outlook.com ([2a01:111:f403:2415::605] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuxh-00000003UVP-1N7A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:18:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvrug3sWQKGuX3ZRTwnDy8ywPD/y3hOU1I1mkArglzFmigFBfom8i9dj9/1nCmUBaCbnZpikmL/XiA2xPBTsWZj2PZ2c5yXSDJExFgJ8y/UO3fsNN2LnuYB8KABMYO0W77sYTM8a1YGpioO7xRyMoC9Ap0t4cxDSdZOWAfHQqeFTl6Vhy/GxgEOjywiao9oSVwz7uuNwlI35FjydIsq8LxcnjFxpD1kGaiukouRJaGhf/fFmVH4gjFJeJXNgXiRThfJ+LM/UxfLFCInrc6FGNVh2fvMfsBINkL3pfvjX+EtJZJpnIMEiOm5ix8XE3R1IyTpkBXo88jLQC4HftrsDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nldWU/45iTLx/bZoTf91LYvS5/UOc9lwkYED0YnKrNk=;
 b=Ux+qGTcwy0v7rcZexuvRR1N5VLkw2+WlUPqRoBJNvaWnOoe4c7DldhgXG4cy5t9pZ6OTZL1DTwbm/eCQOHTZ9mZDV8BYsV0Tg8EKUqm+K/lBcC+x0Ssj4U/A5muHU5UYs4tC6HUnYmw9dUaZY7jj535erNzsv/PoJnGFUa9M945mfRpEIJvlig2ogqBVFxFFIbhi0QiyYOLGo/65Ymbz7FJWENeA3GjDQjseqbEFTEWJDCjF65vmLm1s+DfWS51G5Xu4JaNf3skbZg98XfcLASOfWXTIaNjXeTrEdR1mbQ+L1ik7Bb6UDCfo+UtbX7wvkJ0AP3dokXh/UxEt8FHWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nldWU/45iTLx/bZoTf91LYvS5/UOc9lwkYED0YnKrNk=;
 b=AZPrsUlj5u/sCWdP/lDMhgZoLgmP9Xlqwetitfy6B8HU09LzzQc1zgbzluhZEV3vd2OdWuY/Qpk2dXlY39Qn7qYSjE2qi540hV/TVroRLQZXij1fmkLEZ3mz7vA+qjVP/AfqyLwhe4dBzEknXdF9oxgynhQuwp/1UTk1DPYFKmw=
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by SJ5PPF6D27E3EA3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::998) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 16 May
 2025 13:18:48 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:60:cafe::e3) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Fri,
 16 May 2025 13:18:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.1 via Frontend Transport; Fri, 16 May 2025 13:18:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 08:18:45 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 08:18:42 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH] dt-bindings: usb: dwc3-xilinx: allow dma-coherent
Date: Fri, 16 May 2025 18:48:36 +0530
Message-ID: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|SJ5PPF6D27E3EA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a53e5e-4366-4538-c87f-08dd947c30ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VQe/4XJ0pikDohDCtQOg09Yjjf9jgzIyoiT4QnJOK4b5OPorX+7gabyGqqyq?=
 =?us-ascii?Q?RP2lYsopC1W9lZoRW3MUwnpdTqB9QHBI7ptwbkPihvdR0iu2DRsuMkivsO/o?=
 =?us-ascii?Q?6J7Zez0bMSUAqRhMZL0XnyT4lPsZ1+e01WeUDzVjAray274VuCE5EdaLL2pT?=
 =?us-ascii?Q?G3rWc8b1muzTM3V16KH9aoPhlIdt40CaiLtBbx+zUJTVvPOkRybqqGIIfqBC?=
 =?us-ascii?Q?+CD1vps/JSHYMCreZYMSQZjlmleR4NDGjlDpnMTR0NRp6TdsO7n6zbTShwRb?=
 =?us-ascii?Q?AhPuBckpg2XrNoLe63M9UWCfSm2ZxBkm69v7kRlTcqZujykA2EU4c8zIy5LX?=
 =?us-ascii?Q?mnztbuVIHe3Mntm+BbwAFtnMploTv0xl6rccu7vxSHymCodv7H8MVA288Jit?=
 =?us-ascii?Q?kJBo+Cf22r46nkni16Xofo+3+t7EjVqs7eRoj2/ls/vUYOGQ+/IwCXINygAK?=
 =?us-ascii?Q?O2gB2A4ShsFeCpemG+z5dvK69qr/G1vIjZtJt4t60hz9JY52v+ZRVVkhhfis?=
 =?us-ascii?Q?A+f3ud4YKAWIbZbBVPfi4avcoRhFU9/kso9iuhJi/w8b4ZZca2KwnmA6EWRa?=
 =?us-ascii?Q?H0MHDOl3dJX0k83CHqSija42xTtPoMUY31tyxAz44oCZhqcy+VNGhty/etVj?=
 =?us-ascii?Q?obvT2sN1V7p9LvhGM8ktqziwo8HSw1/UxTWoeEK3c98NtTOtWbBycQc8+D5p?=
 =?us-ascii?Q?wbFy7XTZdb/qWF/8keuFeC4nDEKfWz0sw8pdCkw0SAkID7O4zmWjCcjRI690?=
 =?us-ascii?Q?gE3QRFpDHZ0ZSh8LzOdoKpj1x5uNwlTF03HIUzQ2J9FvqSOEiAcu5gvpL8Cy?=
 =?us-ascii?Q?61IJK/3T8epNLCzsWo81AgChAeXptURRyDJRf0Ss92TddtTtcdEWMFUcOpQF?=
 =?us-ascii?Q?fM8x4ihPYCp2lttffRd3IvLPfTWXZ1RykwPfOCkHQYnE2JeO0TttXp6ux1Mu?=
 =?us-ascii?Q?9I4n6nDy51yFoSGIDBauqwv6iguinSV6wkYCUNI133BvoGMgTl5kTju6r11J?=
 =?us-ascii?Q?4KjmxU+oew64gkpiEuZUsRheKPF3jFN3llgVZm/09FTYwnBMGtzFGueddXwU?=
 =?us-ascii?Q?iBZMtT3mESNUohC+HgT8Jv1/uTOdDrs/ba7f0DwRuX1GgO3tIe6R4iA96MAj?=
 =?us-ascii?Q?+qiFm47thd6isl2UILLUg0EyHEDOP+4iTtHhLyA2f+AsrFXEc+e//SBUyhmf?=
 =?us-ascii?Q?m+bZjZ3UtRWOAcMaHaDU9qv2PjNXhSy6GsyBwX80MTSY0gmYXYiEgOxs5QEs?=
 =?us-ascii?Q?ZUswPju8IAEz7ZjjecXwny/QXJ9AYcHo44zq5tCloLQDqpuyZa9jwGi04gyt?=
 =?us-ascii?Q?tKO94fyK5y+j85tlVn/y82uNaxHbuKCtBIicgcetCv7opvY2dKimXY2XLmYr?=
 =?us-ascii?Q?43AG2Pd6aYmEwlWxAi5RHqHZ4sAaA5esFI4LBVQLNE6plmCbHWS+MuNEgWs6?=
 =?us-ascii?Q?p07FX0O6ld/l9HTOZdCEqVhCLlUVVKUnFIJ9P1EWlIhkhZkAvyMLGdF6mS2M?=
 =?us-ascii?Q?VWCuISwDfOpuEQRwFO4Tm0CttQrdu+53Hdk2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:18:47.1753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a53e5e-4366-4538-c87f-08dd947c30ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6D27E3EA3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_061853_561373_030CE538 
X-CRM114-Status: UNSURE (   9.68  )
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

On Versal Gen 2 SoC the LPD USB DMA controller is coherent with the CPU
so allow specifying the information.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index 379dacacb526..36f5c644d959 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -26,6 +26,8 @@ properties:
 
   ranges: true
 
+  dma-coherent: true
+
   power-domains:
     description: specifies a phandle to PM domain provider node
     maxItems: 1

base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
-- 
2.34.1


