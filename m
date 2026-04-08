Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91DA1073C9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj0zMko1GUZVYEH4QFbxKyXZOc0wTLNBV4ZWHGk83fw=; b=P+wlPQ0i5ROwuzCVUDfRHql5XQ
	LwM6sF4lZvNeoN78nNcbjoe/pWRpCmNoniWI2VihxXQyXabRHUrftlaixnkr6l/ezUpNcdYwxs1xS
	btzbPcG+SRal3RMq0h6UEtRZ7b3zf9ni4ujmJrkBu92DEmkVEM6I6drqS6NoZ9svOIScKwPRmBINH
	MoRNcFP2ZXo6wFgEh7G/0aDKoHXgNiBCc/HaK4iR6eKtfwTE3x9FasKTpalB0Ltpw27Q65PbYe4s+
	X5pDR7kxBkUfFFcKAY1OEBWYdH3XvaBAPEYea4TLDt0h2e/AdBAztnMl8eILz57jVW4MFkNLzGH2O
	6B1jTZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARJ9-00000008lww-1VQO;
	Wed, 08 Apr 2026 11:42:55 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARJ6-00000008lw6-2rBK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:42:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQxdqJtevU0qRag21rlxB0gsUd8F3HPOBktwyxLXWQyO+iTiDaiE45bQQ7UBVkGCr3VQ4WmBs+qD+0sRWcVFsdH+LUjPYOnuX7FkFiElIGCgOC09jlacS8HtCfBAKye0Lmp6S7CRFF/FE2iIpWtGQrw59UYuC+qYWSR8f0sNkvh0SCj87ElRm/6Px0+WtukPHHpe4cPxHQRdYlEJduJ77c9jMqy+MxhvYbN3EUkmQov+aX96L4r4eY7D0qzQYX+Ar9/XWqQvL2lRJeIzgMP4Dbo07n4HbBknaPzlpjqAlKdPFakj3qOFZfWkgVKMh6cWfHWkJ6QNP0ODe07KsUVVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rj0zMko1GUZVYEH4QFbxKyXZOc0wTLNBV4ZWHGk83fw=;
 b=oBenQ0I9f9e2pPP2QESHy2fz+qevj1yyBMkqWPXTHh2zzf/kf+zaKW0jl7jJ4Bcf1jXaYXsxvU6sXF+XsdEn1Xq+U2NXjrR/BnFSDN/zN37HQNwp8bXAU8C0U1ueAFARyl1nKr6M+0FFOJ9u98Av+xt/LRHcBeFPK9DtO3EYoNyV8SMZLnXmBskq8+Ek2MfTVbvpCWWqdkZRWyWZtPfGrsHB5Bj2Hm3i9cRy35lA11/Ro+LtZe7oa8b/wb2SKK71FQSlS/Co2tf7zrDjq6xYyVcleM7wdb8ywD3mpwE0xOtZdORoX3yQW/dc6kQkSEv9HgRMnmnRKkhuBQwB5smzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj0zMko1GUZVYEH4QFbxKyXZOc0wTLNBV4ZWHGk83fw=;
 b=rwBtflBK6ieKXo61Gsckgw1uvkYJnd1SbmBYkt6eZ+AhpCMlVfeMziF832KTTkbSUeeKvlU5SiS3KmwV2gctGFYeN/IIpPgHbJT/Jzj1QphTA/rYv/zgjoXRw+6HDajP9406gY/iCkUqjFyTMQJiixHquVjmAV1pw68XHiQCnLg=
Received: from CH2PR05CA0058.namprd05.prod.outlook.com (2603:10b6:610:38::35)
 by SA5PPFF1E6547B5.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 11:42:47 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::a1) by CH2PR05CA0058.outlook.office365.com
 (2603:10b6:610:38::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 11:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 11:42:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 8 Apr
 2026 06:42:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Apr
 2026 06:42:46 -0500
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Apr 2026 06:42:45 -0500
From: Ronak Jain <ronak.jain@amd.com>
To: <michal.simek@amd.com>, <senthilnathan.thangaraj@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ronak.jain@amd.com>
Subject: [PATCH 1/2] Documentation: ABI: add sysfs interface for ZynqMP CSU registers
Date: Wed, 8 Apr 2026 04:42:43 -0700
Message-ID: <20260408114244.2852015-2-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408114244.2852015-1-ronak.jain@amd.com>
References: <20260408114244.2852015-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ronak.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|SA5PPFF1E6547B5:EE_
X-MS-Office365-Filtering-Correlation-Id: e07d61d3-ade3-415c-d4a5-08de9563f46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AHz4ZXuzgP2R1DSsSgz4xvPltTNElwTHiEkHU4roy9gQrCPORK/89R1cibQBLwKsP9P8OTs3tuilKSK9WHPjZpLiRH7YEiIO4PUxSj1nUAkIUSwM/49e0ar5/iXWCnKDgS7dRtouNMgJifnojngsSrQlryZxwfgz8hp++XZ9S78Ln6Y85YMFSkrqvBgrBKsYPGMEiFwbwSnnGr6n8FK98GcQRqT0rWZ9y9JUN6SPFBTVkpBOJUR6AFNffz0dcSMJQ11CqcaZSQw7bhqrjefhDGtaPlRtftdMT246QzzRuD/5flBr3jS8m80kIR6D6a/gj1UXxBcfb/6CMS5w6RCZGvcupC5yaD5w31+Jyquc40gSuW8fbn44MAkTtLtQYwehuws+F+ZmKu+80/etSaRC1yHHApMzIID/FoKj8x4BkMm2Gq6OIv1j1EP81zr3IMhnVtizY1qnjrcJO/1FN+9+3Y2QbnIv4qbMGn9pU0Rmo3dzLNJuGD6yBG/cowpR9P6syACGmctdOqdLIHy8u5duxX7L/p7pt2Hesc9xchlbyDfLpyLB8XVdZGWPL4RI8oQEePt3mrMtZ7FxiwZ6zn5fN5NE7BTjHIIjVG96H3hyOfQzvyQkwBK2x8EK4blcfop1TJ8WAOolFc8DjYRCJMGgNNaVU+MWPJ8fz+61YjukB5rysVhiW1IdyTpUIb4xEN1sdFatjCqTKimryQuNlJgiCm39VoyeU4kI96TfXH6ERdbHkY4U43JbaJUKdOtrLTFnskI7mqvpJIC9/p9VHQ4epQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wTOan48hX7qpJb7mMuY3ZpGo6bQ4tCgdU34aAIqQDn0PBLV0/OghVfc9FwDybJeRb2MdQM2I3KMsUk4zWdxuWTuB/Ib5qAKHSewQmkFjk5dvCvUfbK2NgoMp4Cjyd3IBD5wc1qOrv5zxLN3cI8vnxPap9tVR73yL+wU6cKgI4XXSFK9DkqLbrIVycWiwWFs8y+La/aryUSTDck0abJACKnzYS0nzZjer55+vNyAcYBAZdprcwRwKKYULfx82XlXjULvEp8dFylVwAxLIFNeVPwlX7ymH1n+ob4lZSCYLl8YogFiOFUqmmGBHGC4UVLmLXeKg3mgqbIHC/B46kjvBcEUBTDxYRcQ8fmfgGVF9Re1Sm7f9lA32kP3sQSbPCL+35aH3erXQz3d9/Ha02ZXioDjbN3WCUbtA/MnVHkb7dmYon5FsO6l081GijLLf9tKz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:42:46.7651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e07d61d3-ade3-415c-d4a5-08de9563f46b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF1E6547B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_044252_719681_C350EF4C 
X-CRM114-Status: GOOD (  12.94  )
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

Document the new sysfs interface that exposes Configuration Security
Unit (CSU) registers through the zynqmp-firmware driver.

The interface is available under:

  /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/

The CSU registers are discovered at boot time using the PM_QUERY_DATA
firmware API. The following registers are currently supported:

  - multiboot     (CSU_MULTI_BOOT)
  - idcode        (CSU_IDCODE, read-only)
  - pcap-status   (CSU_PCAP_STATUS, read-only)

Read operations use the existing IOCTL_READ_REG firmware interface,
while write operations use IOCTL_MASK_WRITE_REG.

Access control is enforced by the firmware. Write attempts to
read-only registers are rejected by firmware even though the sysfs file
permissions allow writes.

Document the ABI entry accordingly.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 .../ABI/stable/sysfs-driver-firmware-zynqmp   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp b/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
index c3fec3c835af..f537f7d9bb55 100644
--- a/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
+++ b/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
@@ -254,3 +254,36 @@ Description:
 		The expected result is 500.
 
 Users:		Xilinx
+
+What:		/sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/*
+Date:		March 2026
+KernelVersion:	7.1
+Contact:	"Ronak Jain" <ronak.jain@amd.com>
+Description:
+		Read/Write CSU (Configuration Security Unit) registers.
+
+		This interface provides dynamic access to CSU registers that are
+		discovered from the firmware at boot time using PM_QUERY_DATA API.
+
+		The supported registers are:
+
+		- multiboot: CSU_MULTI_BOOT register
+		- idcode: CSU_IDCODE register (read-only)
+		- pcap-status: CSU_PCAP_STATUS register (read-only)
+
+		Read operations use the existing IOCTL_READ_REG API.
+		Write operations use the existing IOCTL_MASK_WRITE_REG API.
+
+		The firmware enforces access control - read-only registers will reject
+		write attempts even though the sysfs permissions show write access.
+
+		Usage for reading::
+
+		    # cat /sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/multiboot
+		    # cat /sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/idcode
+
+		Usage for writing (mask and value are in hexadecimal)::
+
+		    # echo 0xFFFFFFF 0x0 > /sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/multiboot
+
+Users:		Xilinx/AMD
-- 
2.34.1


