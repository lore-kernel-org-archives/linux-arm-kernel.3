Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D5CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O0JFhd1tNG2bzMtkMXOi2iF0dmLTfQcqjoiCGtr8AeY=; b=EGlMNXarzOQPD+L3wWMolvzxLV
	ib3p7GAZK8rIqCjH8BySz2HIvegOWvH5uZUaQMMsYD0MICb247yhlJcVyk3jOVCpkEdGYJ7rkQW3V
	q6XhwvuqlaLNQmww3Em36Ttdo4/QSS/pmLjvev1wfy7oO12Hm28CD0xDffzKYqFF2nG/qfGJYDAt1
	UAvJBS9GWknAfhfyrFvpbHNj/mXG+5H8RJOWMusbiRQtetkIqEovRFAqRBkHrfB4hLhKL3ZhK4d7M
	JBhhA1tPNyaDRoDz2j1tztkV+cO+2ZUM8AGsDgsj1If++WMKFoQz8eAbBnPcPi6IfXnsfma4GnQD+
	cdDKNFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfXJ-00000004UyN-2uoX;
	Wed, 20 May 2026 11:56:29 +0000
Received: from mail-southcentralusazon11011016.outbound.protection.outlook.com ([40.93.194.16] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfX7-00000004Utv-0CB2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjPQ8AR0J2t4Z/m6mxO5+0Z3HezyFzzCUzhy4Go3FaKYf0lI5nf8BlJG9UG3wVTcez2vDSSDMeXCQN0YHgmis9xmHUwdXIiYCwfpid3lRPuFEdBc547wjG+Xryr/Efg5Ys99NmxDcYiUqRtjELBotF+r8feYJmez1VNh/cm7rfAAUFhSyQQHfa1ZREm2238KBhHqOUr1SjNbLezc7wSCfC6vBfOCohk5kAWfnx7/VXveN9IzQtQcZcjZ6i1RchQLa7G4pEiUT61+dC7dMgzMhRxfHLawOrwSh7RzzccTiaoSe7zyDXdb/ReRKTuI0nJ7XSFGzfxKxvdZ6eep36HYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0JFhd1tNG2bzMtkMXOi2iF0dmLTfQcqjoiCGtr8AeY=;
 b=oAf/Xz0Rp8OsfRPvQyl9ymdNze3Yk+eVVG9HG9n1WC1SvsxveMnvxl7mRmkTiYnDGaFw6fWdDJfEJA+qFg8fqSJ4pmtkRCGtdaUsiOxrXWEhcZMv8CTSc0/6KkgmWqDzew/NZem7JtXzHn4g5zeoCBm8AxatRZVwvZOJtdQMi/OunCLGnxWgZ7CuCVOZhZDIxtyiEfFR0AGCO1c5fA2MIbqcXmCNpHObt/XlSbkbal95K83b6isgDdJ8ZmY1SEDr1646uWccmiNvGDZnnp9JnWY38zmtt0gzqeBUlDPNs+y8vNBeJ9EkJd1hY76UGdiT25um0Uteknk4MBm4AbxOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0JFhd1tNG2bzMtkMXOi2iF0dmLTfQcqjoiCGtr8AeY=;
 b=M9AWMXh19WZb915B9L2X/OQwsXRz0W5zil+TsBJpw6q0az/UShYrme3+MkrAhVo6HjCdFLDYSwNt0PUGnW+src9IGstcaXZzR3ugqsGP5Sg8Bw+kvV3AkJxYfw86zZPquBEZf3/Y32EXHwd7wS01wHumvOQPbjhMB2IaMBPnLwo=
Received: from CYXPR02CA0011.namprd02.prod.outlook.com (2603:10b6:930:cf::25)
 by SJ5PPF2C6461432.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::799) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:56:11 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:cf:cafe::32) by CYXPR02CA0011.outlook.office365.com
 (2603:10b6:930:cf::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 11:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 11:56:08 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 06:56:08 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 06:56:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 06:56:08 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KBu3SV1386033;
	Wed, 20 May 2026 06:56:04 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v5 0/2] Enable audio support for J721S2 EVM
Date: Wed, 20 May 2026 17:26:01 +0530
Message-ID: <20260520115603.2662930-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|SJ5PPF2C6461432:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ffbab9-ff42-47d0-7b5c-08deb666c7e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0zFYlJ+iTkJk3CuwyHm0NXGPqIzpkffa7Jq+LmJFDkvdkTUs0vLEkEVEzFJe7e9q6xE7VDpbkMvgUq9O1G1ZnGCvRreWEVYcpbXLzYhY3U8qkp7Rl/wxQ4PVSEiHnIKrNkB7wf6XQTbmelvFLkjmLZZBOdhrEuHtVX0hBA1lm9QG7g5nDwpvUae/95VzIoseYk2eas5r/QLmkE7WkCejYkpp+MSJ9rLswIBMSUjXCo4gs5Sru9F59mXptwNaJpEJvcybR53gxvIPzbB02XlOSI++KESabtImoBOrtxDp/mCEBDhF3fzwSIGtmv28PRBYREKyVOwzhWWChP467NXezrIdDeZt820jtMMauADBhkxiVfZTC5tH3Ij+SdSWgMwzNHY5mdr2ZXPrVyjTQPkQ9WBpOYNkSRQRLoBwa91cATxMJ+DK2bOB4XOUuburNPYaJkwRL6YOj7ErvqWEqgeF/svcyFtYxNAvnHf+8RJ/aRWEw3oNH7/MPlc4NRyosYREdH/JbXvZu51Ki3m0gD1+Rw1zDXFq2VS+ZVD+1MpQzfFrY9XXV4Ug1US7hwVoIa3Hea06TVD+5DwOhIDM3qAXaNodvK5pBuY1RG5vvosjtqp6MrnQZNWvGbWJ/fbXLQBrDkf/xdgqKGi1ZKHKHnv0BZv6Hr/6KH/r4jfsiSgtpqFrGN0D0haM9jCFMN9ZK28j
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LxStTWc2UI7ZTxWLgbo37UY6DAzuuBM9t/F1IGYNpRINtqqI1NtT5w0/5z7gyVR5UfV9CwPWGj2d/zE8048WSfN41oPvvxibVgq6x/lxrpod7BVio9Ca1tXVKblYi83d/IT3uq0kLrmPfFYTkq8wR4g4IiFu0QbTRDyYlC7NEEP4r1D226lZoko8gi+Xu/B5Z3ai8Kl/mKr+7cM2GR3xFvkLpY5oulNXOZdhUqeqNCNV7hBAmqFd4PS05GdNC+wtfNJjR6rsJRRvL3P2s5c7WRiiCL6y3R10cIz4mQu/XBFOhO/Zs5oPTER67XeqRoiFYo5ZFi21pNmHhtIZRE00wE8FnQlb5ImEusGtne4fu1Kl8IoK+BasqqO4izwpzX1BihtAW+mcqy+Ruug5CFkujTPdwXosG0DjinnA1s48MWux4uNUqsZmemNHFEl6TO1l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:56:08.8742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ffbab9-ff42-47d0-7b5c-08deb666c7e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2C6461432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_045617_127733_8289F922 
X-CRM114-Status: GOOD (  11.15  )
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

Earlier version of the patchset sent upstream[0] was rejected as
its dependency[1], which resolves the DTBS check errors introduced
by [0] also got rejected on the grounds of ABI breakage.

Another solution to fix the DTBS check errors introduced by [0] is
to modify the ti,j721e-system-controller.yaml binding to allow
audio-refclk as clock-controller child. This is done in the first
patch of this series.

Changes sinve v4:
Link to v4: https://lore.kernel.org/all/20260519142341.2531948-1-m-shah@ti.com/
- Explicitly diasble main_mcan3 and Main_mcan5 as thy will silently break mcasp audio routing

Link to v3: https://lore.kernel.org/all/20260330094459.128648-1-m-shah@ti.com/
Link to v2: https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/
Link to v1: https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/

Bootlogs: https://gist.github.com/Jamm02/f586087dad227450abe8637e8a688c68

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  dt-bindings: ti: Update audio-refclk binding and j721e system
    controller

 .../bindings/clock/ti,am62-audio-refclk.yaml  |   8 +-
 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 171 ++++++++++++++++++
 4 files changed, 185 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1


