Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D37DE9A05E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SamU2zU/E2VFC0+OFF45Fs4+nHaBK64joLuaLigrfHk=; b=3ffRlE0qh2FjtNnD9fvk7GrXgo
	xlIe9Oxf6DIlMz+CR6NCg5/RHed4JmK+Vj6RQn+ePgtLeyCsmPuOt2a19oqmYpcTs8Ahulzq5VSWR
	nZo5KNrDhTI8yHZIYsGnz4iXsQisJ74nqSSwjxignAscLcQanDHXQ7wjThSokAnmkCiI2P5Lv4y4v
	FnXDndH/O0xc5FPhqeDluW8A4S1nEbPxe8JdXOph6b+0egHO8tNzYeP8v155Sjk/vGjjQZRwR4+tf
	icqoPQCvOxKIko/BQLDzSH3qwU0q6670PPwldTvx2+8QdkfdR6pOXiiHFkdfNZ7B6lo1TbNXHh4E9
	cKf/0fSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9wC-0000000BsHF-1QdM;
	Thu, 19 Feb 2026 19:43:48 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9w2-0000000Bs98-23CT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:43:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkPtJ9BZS0n6IgLPZK/d1gJvFctsyrSqvgcilOWHW6mhFOrRzoZgxWdZaR9U0w7/t/Pnwas6a0sR3arqSubRtcczoaDa7iPrh/2Cxl+bg91+N7b1nOh7U7asL5WAZFPz0crDvNzqBkShU0eIzu6HFiEnKhkHHzh9Wy2+PLTij7qXoCEVLt/m5J2vmk/V7/f0u7Izz3rtzoIVTGj7yHhCBHeyk+TTT3Gp+n67YvzrEx+E+W8SUGhBQAwvZn7Xn0xY14Cxpy/VNp5kc/oNPMIpZ4vxb47YaIshXim7RGzkGF64edz2RD1JBKEfJjUbKAljZtAbHkDg5KNFfkQn8yx61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SamU2zU/E2VFC0+OFF45Fs4+nHaBK64joLuaLigrfHk=;
 b=J07HiCWQqzSFm5WyoC7wDJDhQ0cD3JvTdGzaT286IHCixN1SSp04e1snrNiMyOypT+c1tz5BE/WJYM1RzkFKf/dCyBVcuiFUBL7odFAnDPW8jzpMZXW3yglQ396o7qC+oXEWds9wriWn5HVwqNKlfWbb6sb5t2El8mxBL0yZH8aJ8D4U3FKDzTBRf5LChp41cS2cd+EAYj0d85c2M6TKVD9TPTHkYUWPZLGlACZf6Ex1ctJP7YNhI/5PJE1jdG4Y5b4Fd7JSYIGQWv02SFQCBYcYvOSuKwyC+wxrgtQcylrM6mzoxXdCon43tBEr+MoAeFs5winR874c4e+JJy97zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SamU2zU/E2VFC0+OFF45Fs4+nHaBK64joLuaLigrfHk=;
 b=BxnFs4lHCdsxX08jd2dnXrdnJMnC5r31S9ZHAC460NA/MSGNjs/z354lJFI1wefzu7i59U63AenGre84tCB7h7oa9aIPc7ZC9WelNsA8qplGhZHqh7U/gkPvKVqj3CFuykSEJL3RoU1Irc3S0ZtiGgq5tGhwLQcft+rn/tsb2qs=
Received: from BL1PR13CA0197.namprd13.prod.outlook.com (2603:10b6:208:2be::22)
 by DS4PPFB033C1B5C.namprd10.prod.outlook.com (2603:10b6:f:fc00::d42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.18; Thu, 19 Feb
 2026 19:43:31 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::2f) by BL1PR13CA0197.outlook.office365.com
 (2603:10b6:208:2be::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 19:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:43:29 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:43:21 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:43:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:43:21 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJhLBZ2638942;
	Thu, 19 Feb 2026 13:43:21 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 19 Feb 2026 13:43:16 -0600
Subject: [PATCH v4 1/4] arm64: dts: ti: k3-am62l: include WKUP_UART0 in
 wakeup peripheral window
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260219-v6-19-wkup-uart-wakeup-v4-1-eda09dce5623@ti.com>
References: <20260219-v6-19-wkup-uart-wakeup-v4-0-eda09dce5623@ti.com>
In-Reply-To: <20260219-v6-19-wkup-uart-wakeup-v4-0-eda09dce5623@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771530201; l=1916;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=tk098XTfssSPtY7jBh1/YqYku8gyjoYr1+zcywvW9Mc=;
 b=9Sa6DY5zGUcKZF6+Jzn9NmvbY0fKY9ih+gqBl4xIXEHDNnNZ1YBRH2IEcjSJ+9b6vTT+iHJYr
 zgqEDUlO/d7AgWQxQljI1mDBiZ6QKzlvPfPTRtGxjJ+nSmYImszUFdc
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DS4PPFB033C1B5C:EE_
X-MS-Office365-Filtering-Correlation-Id: 60433096-de96-477d-8e21-08de6fef2819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZWbHhtcXpLYjdlaUQ4WWxuR3U1WGhRRXNOM2VPbDJOS1hRYU9CUmhBc21T?=
 =?utf-8?B?OEtKak14MFhYMENzWXdOQjVGUHNkT1p2SEhkSG55L24vVXVoVFJNYmxwTlM0?=
 =?utf-8?B?eFRFWStnWFNWRXU4eGFLbkpOTjJYM0w5S09vU214RTlxdDNobVpnVlRvdTlz?=
 =?utf-8?B?em52bXpQUUlJeVpFWkxTNGgxRXRyUjdkTUxWbmEvaTExWFhOM2gvUTFJcWp0?=
 =?utf-8?B?eEJiTGZkOUwvYUlXVUJ0REpoU2hsc0FNUmdid3lCRVpSZEtQMDFzd0V4ZUpB?=
 =?utf-8?B?bnNVNjRnN1VBRFdwR2N6VkVrbDVZYWZKWkNZZXI0WXd2WE5iRFBxQzd1L2E2?=
 =?utf-8?B?ZjJlOTdGTHVFYXp2OGd2cEVFZnZnbWFmQ1hadTA0bEhEdUtpUWk1MHR6RWMv?=
 =?utf-8?B?alNyQVVDeDIvOWdVYUJxR3lQd0Q4eTFKeFQ0TFd5eHBYSjlJcHNkNERtN2li?=
 =?utf-8?B?OE92OW9KU3g5bU5mK1o2N3M0YlNYSklqcmtsV0ZPajJnRUFSSkIxUVBnSnpR?=
 =?utf-8?B?RjBpaExiN2dPWjdrTlpHSm5UZzZ0eDdNS1FSQUozaXY5QUdTNmZKLzdCdDJU?=
 =?utf-8?B?bC93clpWU1JIWm40TFlTUW4yWGROQlM0TW42L01KY2poUm9STWtsRkpKdkJq?=
 =?utf-8?B?RzMrWVcwMXVPSVNPWFQxM3dNcmsxeVZERXpuMjNRbHF4UU9Yc0UwdzZ4Z2hX?=
 =?utf-8?B?Sit4VnlORERETWNHc2xwV3FVdU4wOXFWZEtmbGJvS0VNWDYxR3RFbklDVkh3?=
 =?utf-8?B?UU9qWFJxbEtpWHNxb0xhdUJVMXY4UzhmZkY3WEJmMncvMTlZNk9ROEIrN0hp?=
 =?utf-8?B?cUJMN2dDazY0UGk0SVZsZHdxUllkczBiODlTc3FiUlJTcXFsYStLbWVHVkNn?=
 =?utf-8?B?Y0tzcWkvdUU5SVJFTTFEQjBhZy8yejdDVEtFaXl4bEQ2Q2lQZVJpMlZNSFZJ?=
 =?utf-8?B?SExLdVQ3UDN0dzZqczViT3pxS3dybzM4cHpQamlyMWRYZGt2Vkl4b09KbVRM?=
 =?utf-8?B?YkZWbHNWOHpzQUNENCtYTzdJaEgxdGplcGdUaThHV0s0MGZ6b203MVc3NG1Q?=
 =?utf-8?B?OXFOSVJKLytuclo5S0RhaXRXY05LeXp3SXc3RFRLZlQwdFNGejdGbDJkcGt3?=
 =?utf-8?B?OGRqTTR1VkpWUEdZT3h3dTIyd1grSHFnZU1MZTBSbHIzSXU3aUZDSlo5cDlj?=
 =?utf-8?B?OHhPUzI3eitzaUxKVkJyaUtxRkQ3aTVrWGsrQzFzbHVFTG5odkNOOVRoQWw1?=
 =?utf-8?B?VmJYcEJHM1VtYkRrR094OE56dUYyOHd6dDE5QmpCQ2x6RHlNczZqTW82cFVm?=
 =?utf-8?B?RU9IMTR5VFoxdVRyOTdTQ0Z1SkhNV0ZleWtOWWxlZGZtK0ZGcjNnZWt0VUFX?=
 =?utf-8?B?WDdVTmZBL1YyWmgvSmlwaWczSVJQaG53a2hXUmJsdGw0eUZVeFo5V0t6VEp5?=
 =?utf-8?B?S1Z2YThEdVd3SHJkSkg3SmU1N3JnQUlMQ0IzblZ4YndTSTkzbm9vMlJKZEpm?=
 =?utf-8?B?a1ZZNWdWSDd3N014OW1NeWNYc1hvWjBNQ3ArbEJsNmpzYXBzUDNlRllybEQv?=
 =?utf-8?B?Q0xVOStSN1JRVlFwTU9mVjJWQVdhbk12cklkT2dQWWFEcTgybWtkdmM0SzN3?=
 =?utf-8?B?YWh5VCtEUDJ3YW1hZy92UlI1aE01RDdUbmJJQnZEYWF4SW5GNDFvdlpFMnZN?=
 =?utf-8?B?VVBudEs0RnpzTE1hU3k2SjJUcE5VUkI2d3M4ZkFQRGNoQzREcDU5cjFNcmJy?=
 =?utf-8?B?Y2pQUXpQUStDK1orQjFqeWxzWERIYTM3TFB5N2NUR1VtaERxMHF3RjNmSG5M?=
 =?utf-8?B?aVFyV29MdndiaGxiMmdhcFg2L09ycURoYlhKV0NxdnVPQzRLY1N3S3orUUNJ?=
 =?utf-8?B?ZWRQdjZTbDBYTEswR05QcXdDUlN4QkRlRzZSVlZwWFpEcFhITGkwT1ZuODFT?=
 =?utf-8?B?MGF2RGxQSk10ZUdHZ2s3TlNrcUNySm5zdzhqQ210VERQWWdmb3pGV25LYllY?=
 =?utf-8?B?Wk9HcldQZHFrOGN1NlJ5TWhrSmN4VTE4S0tBUGJvc3Qxb0xBa2R1OXVFRS9P?=
 =?utf-8?B?QWlqaUVGMzEyL212bG9jV3BGYmpHMkcxR1ZjVUtBaTRpRzMyeFBaTXhCOWUr?=
 =?utf-8?B?dTN2enZJd2JKRlowNzFCa3dISElLL0dWRUlmWUJmY3d2Mlp6Umd6SHFSWXhs?=
 =?utf-8?B?cGtmMEF3RnVCN282VVREc1ZnMG9YdVpYS3pNSFNmenJMaDMxSDk5aml5bldR?=
 =?utf-8?B?MVhyVkJYd2hRc0o5L21iK3k3WStBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IBpNcPcC2iSXYCcBbO8OKpgUZNVzhqPZFa6nhTRWn1oTT89rlrlWt3g5xIEhZ9LsZqkOIUFI8rNcwmBN5E2a04LPJwIVcxBGTlxvJ0HqO1+YPQ7cQxNWMKn29r9+xLtuLV7A81XkMHeSQecazE+NDfG5+d8SnKsa+plNP84LJL92h8XQqvzKsc34YVSdE+5/S3FAhvCBxPU8Zwoqc6GRNBfHuAfYaoUOqCOH2shmu/DzpzBgCfaK/pyB1QRWQLx/U1YEfJHR7AtXGdhJ/PqUHPxGYLB5Sz1n7Lo1qAAZ6gStCELjHCF9Aoww/1L/a/CxRs1DC/MhZc9RHRXQMqR6Mk4He3HJt0nEAYBVuUWhsFeqIfUhfkRzK8Hj7vPv8qHtAlgtSc9I8V+Rq33BDyeCj7Fdn3uZsKDTWfPKSaMUaKpLHwqzNo6aj3l4neZBLaLT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:43:29.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60433096-de96-477d-8e21-08de6fef2819
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFB033C1B5C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_114338_567262_EF662198 
X-CRM114-Status: UNSURE (   9.63  )
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

WKUP_UART0 is apart of the wakeup peripherals and has a range from
0x002B300000 to 0x002B3001FF. Expand the wakeup peripheral window to
include WKUP_UART0.

Fixes: 5f016758b0ab ("arm64: dts: ti: k3-am62l: add initial infrastructure")
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
index 23acdbb301fe38e6045c0ef3ae340196009ed217..e01e342c26daaa06a72036cc3a9a7b13a60e6738 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
@@ -92,7 +92,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
 			 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
 			 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
-			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
+			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00200200>, /* Wakeup Peripheral Window */
 			 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
 			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
 		#address-cells = <2>;
@@ -104,7 +104,7 @@ cbass_wakeup: bus@a80000 {
 				 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
 				 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
 				 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
-				 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
+				 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00200200>, /* Wakeup Peripheral Window */
 				 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
 				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
 			#address-cells = <2>;

-- 
2.34.1


