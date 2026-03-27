Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE6C10ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJuQdkIEeyExQZXEyMF0SSvaDQC+hxqqpLFGMqet5zA=; b=KyeajGiJ1LmWY0XtKMwLxTKAna
	1gPRMVhu3vKP0OX0F2tBPIom6Sig3ugxB8O6vCIltgiUlATJ2GxFBgQsTGi4a9PvhjmOZ42pHuUfz
	JOHXjNB1XoAMkVAOD1aWKYaWhriuHoDzua3FT84QQNTQgKr0xKj04gJ3M7WkeJKNDcOnpK8AsWVY8
	84bJ4lJ9gptbayHjc5dEoixk6wZn07A1Wkaei1xS1yujG8w+oxWoNyEdELYVrDluR5nK2zbLKrjZj
	pf3J1LuVAv+CQc595+06VeuN88bzxIYZX9Zej/LMI7ZDvRFNZPW4RyvOFow0BS+ENpxqqIKP/2rPL
	bvpAhMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w657u-00000007CRX-1jjy;
	Fri, 27 Mar 2026 11:13:18 +0000
Received: from mail-japanwestazon11022075.outbound.protection.outlook.com ([40.107.75.75] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w657r-00000007CR1-0PHh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pE+tkuEDeFruqAGSo1c2MwTjc/Iny8AGc2+Rq3jgW/eoR3DGRXiENKwZl9zHZ8ammVVIXdsXVclb7g6Pm2EcZe1ociMBXV0GZue9uqY4M0LQTMPuZOTaiosRXDWfK36mGiL7Sxu2NDS6KDSd68Jqd6+J+nnGffx2Bwln84KQpSxxhjFI5zNazPEPQUnTreJZbeqJqRZe7mkizasl8HrvYctH1Z/9OjP/Xi/9+k+gN1oJYUOh7qNn5xT/O7KnJbOBwC/ruu/9Vmah8VGwFRealb6yNwCc7hp6NYxuLslt8Ajb/KfBSjozeyWZqNE5LB/qr4vDatey3BxJKaIrilotVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJuQdkIEeyExQZXEyMF0SSvaDQC+hxqqpLFGMqet5zA=;
 b=B09SGM3lPNV8VogJBsFlUhmJ/EM6c90uHaMhvRfO2gHDanxQs43vuIbfjuE2TxeItf6/WNjfSqDYdfn189mzf6JSp2WOONLWVMRhUaqyyGMBUjzc9ldRTd1td2cYOz41f6T8Y1eLEl0rzheosZuAPcKm9STyAXmZkgdncpb7f+SWVkhQCPwQgrajPi9N52kld2iTuZ/GCVDt59VH9phMn7dwWCzLIxJivYmCevR77/U4zNSX42jwHxFIfgGWpj6aLy9B2CwbSnboQMF0gAllOK41t3m/+fzwc+pBoYg7xML5rq+RDiYg4qmjn2IwHpA1HKUGTsEkH89Fq7Iggn6rtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::30) by SG2PR06MB5383.apcprd06.prod.outlook.com
 (2603:1096:4:1d7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 11:13:05 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::cc) by PS2PR01CA0042.outlook.office365.com
 (2603:1096:300:58::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 11:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 11:13:03 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DB40740A5BD8;
	Fri, 27 Mar 2026 19:13:02 +0800 (CST)
Date: Fri, 27 Mar 2026 19:13:01 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: arnd@arndb.de, geert+renesas@glider.be, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Yunseong Kim <ysk@kzalloc.com>
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable pinctrl/gpio/pcie for
 CIX Sky1 SoC
Message-ID: <acZmPUIHwJhJNT4x@nchen-desktop>
References: <20260327095652.3793688-1-peter.chen@cixtech.com>
 <55875ef5-7959-454e-b071-c9f5c6f87bc0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55875ef5-7959-454e-b071-c9f5c6f87bc0@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|SG2PR06MB5383:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fd23f5-ba39-461d-722e-08de8bf1d0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: HEovT0RScWF9Rc7OCwlIP5ZTl/xgM2fNx/HizrShhNOWZfJEI2vpqOrvDTDY8UmcqF0mft11VgCLfj+71w+fNyXNZ02eAB3/ARLOu1tGx4AxE/F2rNUnpn0FwQBxVEJimoqVeWQ/365LdkZE84HbxWcw68icp0eYL9oceBP9dj60I4Tf+NPgD13f9SP8sVWm/5PQlmCfH9MyHuYDPOqyW/eSWHGUP4ELxHK6HagNE83Px4I2ViaXbca6aljPvBxSfIVyADHp90jgHVXsXnOGIHXUqDWrUzhC12OcXSo58spkjJtpKA69I9uezMvxK5kg/hPLJnIQUrc2skIGNkWxfrRXdGN0yB1j1tbHnYofr1Y+by2KLxlyDjz3qOyQhabhla7ycd0qIeEMmJv3y1C3GYLE18T2JoBYbAt7qXrBZLt7/mFgOBp6wAx0AZzZmyyTQ7om6VGrSpkpXXS6ifM5pJuVxuxjSJa0+L4kqLiR7ZJB1MpxiSsNcUkARs9isQZybAUxnI2O8OOLbHV7ZY26KJecAVvtTJJj14I4XBBCulObf+E0HpMjxg8dSilLh2SjueVLE9hveE3dboUTdNNrM1c+BKyWw/NC2Zz8LuCzE2IJ0kMXw3HHSwWgGk3nADRtRyGw2ct9ADus6A4f/q2c/kHKJURuW48xRRNVrjpJ0DHmqQdJIBBlytTdlxAUJnY4Unq/EHv6EfcIvc7vx9CEJ1jIUKWHmMMmOwuD29t4diyeGku4sO4oJHi/KvU27XutKT5Y0M5tai0icbmJuqu9Hw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bz5t5KpOQMe+Gs4CFfeuHxh/tg0UEF+iC/SJnf8CEO6zCsEOiKY0Qa62Xu0Dq1x84NIfk/CqJ3/xKVVzKtocPf6emPP2hlRLsEiX5DgV43eDTYjpttdbGp84CCNB3tOvuPsrDUWzOYIOfLJkQQOgqZ/G2kYjaiOsKIE99DOTF9y6K4Pw087mp0WSB3imxeNzE1HOlC9QmelPLQsVLIbVYmLc22Bbg9aFnJEDsSz6523ckgCmfx2NiFpDgXk8J7+eLyGpwGedmnx7iFsiPVK4CzLXJ+QjAR8bRPKOfXDLjSHX5lstpzwMhUt2409IC5Q7U135FA/jf+sT9b9P7S1wmfMOER4GhKYUnQINswODImqB7HPlPrOImIIvr+5z6ZOiu7oBu0Ciq3GcZXir2mCH+UWdVcyilh2u+GUtDJxxpF4L7ByBtt5hKX/1ALC6eRgH
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 11:13:03.7851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fd23f5-ba39-461d-722e-08de8bf1d0d1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_041315_135893_A456923B 
X-CRM114-Status: GOOD (  16.28  )
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

On 26-03-27 11:22:33, Krzysztof Kozlowski wrote:

Krzysztof, thanks for reviewing.

> > Pinctrl, PCIe, and GPIO device are used at Radxa Orion O6 board.
> > - Pinctrl is the base for peripheral IP and peripheral device.
> > - PCIe NVMe is needed for Debian boot.
> 
> I don't see NVMe there, only PCI controller.
> 
> > - GPIO is added due to Debian bug report[1].
> 
> Rationale must be here, not in external references - this explicitly
> requested in submitting patches.
> 
> This entire Debian reference does not really matter. It is enough to
> explain what hardware you are enabling it for, so the board, its
> contents, and SoC.
> 
> This is as simple as - does board use it or not? Does SoC with this
> board has it or not?


So, I just only keep the below summary, is it right?

Pinctrl, PCIe, and GPIO device are used at Radxa Orion O6 board which Sky1
SoC is on it.

Peter
> 
> 
> Best regards,
> Krzysztof

-- 

Best regards,
Peter

