Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54236CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpHjfUClxTOU+jhlYhm2QHp0fFzHm2uB9UfwwGXVR4E=; b=iydVAgMWAuvexYfwL0a6B8+HOC
	A/32PCGXz13mlQrYBNPOrQehXJOUfV+MAExLFNsiZDkv1oZ9MAf+nnPzS3Oan1p4mTNb/92jTAXjK
	iQiQHz+V9/yl6aX4Igpr9hTtFL9c4R+wdJBXwYt9AFrfFkv++W8qCjuRbtN7jXNnks81jv8QsqqW1
	CNgT9pqq+xaHLJ8bQ1Ux0F6Vm+9cuJ9czh9eSIJ+lBoCKyarhdqzYpa5gb+L3lSezuZ2y7phpcmEx
	ho8gI6c5Yxy4zgxgfoQyrsjhMpIExARMC7oT7n8D9utlG/+43fTNxDmS/2X/QIDOfr5oJe2aVBYmw
	0dSBaQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwFo-00000002pWr-2xzd;
	Tue, 26 May 2026 18:11:48 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwFk-00000002pW1-2EtV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 18:11:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPQIyk4JHAFH03GtD3OcjkZP7E6qlIxCGJpa5aqylIU9SJvzLE7dqFVWt9LDtEp2f/nxgzquvfb4Ed9h82k/YJsb1RxGfIdvAbUOu8M7oZT+pzWinH1Zl2HCE/zG3yh2+B1QDUfPZOXcl13967SxLXUuXh6cHaGARZMDlpNqCV6SQpiw9hJWEiDS+l+4YEbfpLZea5Gn50svanUQ1SqOHNegOdCLRupikgW5KnGwB5I8SL2dItdb45Mp8yNkGCCJv4tk+yLphdnvP2JySPnrhqgePzR2R7Fr9CuvZXpzunPrjamwsU22ELyHENOzKHEw/ULeQn+Nt5TioUBOeGMY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpHjfUClxTOU+jhlYhm2QHp0fFzHm2uB9UfwwGXVR4E=;
 b=Si9LmGJz3JBWF1UHTbs30Fsood/1k5ssC2jci1VbycpxpXSJf5oi+1QUjW5ZfAMvLZe1QIQ+3FtS107kRHOHhoAoZ5xnqIM1BkaA26+fgnvFpwgokaENz1Nx5F9yKe4D9UoXNWIRJ+IjQLerPSxJXcFNw0x54pSC1F2cO1MQy+X6lIZcwsDBEF/L9WifMzPG5VuJCK23xcXA1ueQ+RCWreWDGBXH9bHbQYghaa3xVsDNwDEBd2jmcpBEw+3bZkqTvJ7kPb8Ag+pZnGOrTHmSNCyWuAN6I+CgzMP1CEVgLR7k8Cw6cItNzQBrke+kVdvTHAw1d87q6nhvxnfgCZ4pwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpHjfUClxTOU+jhlYhm2QHp0fFzHm2uB9UfwwGXVR4E=;
 b=FNjeRbAuOVamwWadRmH6iepp96E4rLgM7dD/O1WIeZTiDWZItrWCoxG1c8MgdJz2dvg1DnwaHQ/HnafpOEQKkjpARteKdW/mNV8rrxKcyxhZlCo7CmH0V+vkpPHIz+eOBl4Qu5y4h2diLy6825M0LRlZrMib22U39GRjGbNWTho=
Received: from BL1PR13CA0390.namprd13.prod.outlook.com (2603:10b6:208:2c0::35)
 by BY5PR10MB4130.namprd10.prod.outlook.com (2603:10b6:a03:201::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 26 May
 2026 18:11:38 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::21) by BL1PR13CA0390.outlook.office365.com
 (2603:10b6:208:2c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 18:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 18:11:36 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:11:34 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:11:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 13:11:33 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QIBX7G1431730;
	Tue, 26 May 2026 13:11:33 -0500
Message-ID: <40571850-1292-462f-9bd3-527a810a6730@ti.com>
Date: Tue, 26 May 2026 13:11:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] arm64: dts/bindings: Add support for BeagleBadge
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>, Bryan Brattlof <bb@ti.com>, Jason Kridner <jkridner@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>
References: <20260515153541.294698-1-jm@ti.com>
 <20260518124932.plrgsumqgvbij65j@stash>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260518124932.plrgsumqgvbij65j@stash>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BY5PR10MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: e318cb3b-dc6f-4a90-11d8-08debb5239f3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: UvoSNFX/BeDjS+4C5yAZq0BNDtAs5T1fznBqvTA0MO6eKSrI8bG057vk5HlRo9MUuyr+1j4mjOYfS0kTATDVw9F9ePzoul8XkectQu0/lxjuT/lAYLOyVrSmbjKvUbwN+xeFPwP/5VVqNW9/6oyj1WmFdsn3PsmMKoOFka7tn4Wohj1nny+LrsyEFoVdamf+NhiJSY28HzU0ZqiFQAwrFrSn78FhA0Tm3oSaQJGxnqf7wbp1ITP6wo3HLuyscpuGtHlH4pw3dzrBKqpJwVvhrFuwuLBMz8uNDQKTZUVZ5YoOlhc0+IJqLdDjia/66rtSE8zkoqfTzPMpXhgpxDkpQ7XsfVGmAS13bLoRf/MVyEk+0XyQ4/vNRG9oXH4J+048GDxxuB5XLSYKO7yrbk0QkyaXACnnFOd3erG/d/n2CKI7py/2PQ6YaIP2d9g2Qub3pwAxzCeQnfvpvclvzaG/Q3a6/Fh2w+oCR/ddOfFCZNteorie++vFYDl8GxJsJk7uRr4979ROcOoTEFpsIFxwTxpFkzt6jFYFK9E3ilza60OBrqd4ZoxRXRnEMx7hdcwa9kstDkrx6vByAwpsAjZ+ityrUOAsX/BwI5vo3X3BeEFW+ZyN+ltpPXXdc/M0JDScaMDl4/DuJ7m7jjmYPazc/PZQHvrpxQYtCM3iUglyFPd90JQQSlmPN1vlInjUEFR3
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3+OzmOg6hOYpOT29nKNrVbJ7R7O7qip2dvA31pUjWpZ8N1tWCaZEkPS6eoAN0yI+Sdai8oojr/R6VhFgoVvt4lKCUT7k8YdMpdZ1GchWXNy0qly2egJq9Ko15hdpctIbgjfHWIcKhupYpGFpTHsTabZMg/allG6oJNBQZux5A6yzBvf8s5uHtfMaaHjMwCJCQGAeNNOYEkRmTECzSYAGoZ5up/1j2RjhBbHzUxlxVuMRVgGJlIxxlEfXHgfb+0eD0mrMctPT3Oc5ii8vfTYC8PnwzEcZn9eocK3vhjDBlnRA/2p4C+zQwq6MJQDZIfAbjOXS8q8RgsT/iig1DCLxPEdqjPclqSgJFi07dx/D9c2ZSAT1hC4D/CokSaRVLgS4MpEZI4H6vAYqf/6sb52yiwMKN4l8+ujIgt/+naVFQTub+feafJAHbkkFM2J1W954
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 18:11:36.5935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e318cb3b-dc6f-4a90-11d8-08debb5239f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_111144_675766_B622851B 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Nishanth,

On 5/18/26 7:49 AM, Nishanth Menon wrote:
> On 10:35-20260515, Judith Mendez wrote:
>> Hi,
>>
>> BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
>> hardware [2] single board computer based on the Texas Instruments AM62L3
>> SoC designed for IoT and embedded applications. Add base support for
>> the same.
>>
>> SD boot:
>> Link: https://gist.github.com/jmenti/8818fa277597de927dd2b42ab1d2552f
> 
> in all patches,
> Is https://www.beagleboard.org/boards/beaglebadge a better canonical
> link?

I can switch links, it seems to be working now.

...

