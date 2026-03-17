Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7660FB5EA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI/C0gsSslPlD4GdE2LcT43hHmTcYJQf9I5E3xpOyYE=; b=NDQUIGAC3RX+lH1eONisMeikKp
	GSLYQbIlIZXCQ4TeAFCboRb6lawiRiW5Meohjmuf3TTtKFHAFiMgwoJNRgITZAfwCBqRcEImti6sB
	6CuzDOhX7ANHruJleB6OuslFHpChwtXdju81DV4srxT5lIdS/uGm9r23icWmWhbL+fstj/rXHRG8f
	jdG2Yf6WnfJDVb1Eztev9f4PDCc3hX7h/vfizOwdqIw9ht+Y+7JGy7oj2GX/SABmLhnHykkmST9Uv
	7mnqRCzCTY49hofwozLpaKJhK61GATxuNn/2Jnj/osUCa+8UL777MjdvioGDAvQRhFuc3Md5TNXhy
	+Kd7jhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Jer-00000005DOu-18E0;
	Tue, 17 Mar 2026 01:55:45 +0000
Received: from mail-northcentralusazon11010022.outbound.protection.outlook.com ([52.101.193.22] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Jen-00000005DOO-2Jjv;
	Tue, 17 Mar 2026 01:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+Vu/eOpfTzF2KQoXKeSj2SgiKCxMMy5GR7wQUChUc8IS3lunaqCk/KSo+McvAVUnLsy80Ty4mLHrnQ7NosfA1bQyVfU7G6XsBcGPn/885V2012iUMG+7qY++UFEeZK3+5bpNoh+XiEKf8ylKI6G/wMwtHhhdfATgx8DP6BazaCMr3bbvDkTeUotU/grn1LOOJPZJylWBOWrcsnyjHquS3CX4eBMH/NmTAiicT0aiUDDQz83Zu/0PuFRvmP6EwUPsLMUVTG9zUAq8ePG1SHZDNzq7IbNShPt6hZ8Dy5icTS7Ct6Gjk/raohDgGj2ACYWRrtXQiNX8KeTC/02ZE5//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iI/C0gsSslPlD4GdE2LcT43hHmTcYJQf9I5E3xpOyYE=;
 b=Dm/KzE0cuQU/EfgQEythgkhjyxOFQATErHqKlYzdcPPPAgsma9ws/Nk/z1Z76L2xa9X9UHaCWJN3AUy5mTqB2BuDhdr/t+QoeGK9noTf8MRSDCUmWXdGcRSI3VOFtWT8s8TRgae0jfsurcHo6ERTxiuZ0CSn42lOaAmODcU6bd18tPub5iWmcqJyuuEeuBC8rjUJKGfEKMMafFQNXxNm4XaTi86YIAURPYGFmwe/qxEXcETbo+zjPhIVu4JEbswrkZHo2zYJjzUI2pggn1+aHW0AHt0JiXS7/6IUgKm6uBdYn90KQ3IFaJXqTYcJny9nKFJxeuAolXxPj6opL0OTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI/C0gsSslPlD4GdE2LcT43hHmTcYJQf9I5E3xpOyYE=;
 b=1uBJdr3niw3JeVF0OkwQlbiozUzz1lCHosDKdR4S/cWJEc5i9iNKp+XrHK4zQ/oA7fyUJ6+7970NkMC0TZJu8eZLJSv3TcNxaMehov7RUc0HzE22paGeIXDAIy7LzKsJxhy3F0sGMIi2IYXxbeB8nH0Z9xzF42Ujht0Wo7EWQBQ=
Received: from BLAPR05CA0033.namprd05.prod.outlook.com (2603:10b6:208:335::14)
 by CHXPR12MB999246.namprd12.prod.outlook.com (2603:10b6:610:2fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 01:55:36 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:335:cafe::be) by BLAPR05CA0033.outlook.office365.com
 (2603:10b6:208:335::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 01:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 01:55:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 16 Mar
 2026 20:55:35 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Mar
 2026 20:55:35 -0500
Received: from [10.136.37.230] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 20:55:31 -0500
Message-ID: <94239f7e-49f6-409b-9c87-25fefd52b2cd@amd.com>
Date: Tue, 17 Mar 2026 07:25:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/7] s390/runtime-const: Introduce
 runtime_const_mask_32()
To: Heiko Carstens <hca@linux.ibm.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
	<dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
 <20260316052401.18910-6-kprateek.nayak@amd.com>
 <20260316191958.13160A9f-hca@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260316191958.13160A9f-hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|CHXPR12MB999246:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c1f9dd-97f1-4b31-c51c-08de83c8483f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700016|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: yQ68oX4hReP3ygDCldcZdhKqe8BQ4M1GUPHDfZqh0gp8yGhZqbq/jCsrbgroDbz7mENje0YAHwj0xpoSpQ4dPDcDJqqKy9comVzjrr40fKupYYnM9c0Z48TuG5TSQl84sPkZX2Q7r6uXbKF2S17mFr2zTlWQHMcgYwpF0ocrMLfMv0BEapxCPGwNSmmbaqy9/JBm6Z24o+fAlSmJI9d2tAODJaUGoN9dXXbv0bdzSbbwdngmYZq29RriUagTHrIbW/syrNIIw2inRAXOoNVD0B5XqeLKOGxwBpMBeEj04oSaO1V9HjOAR+xy6IKS1m3GaIuoE/KnPr1FCvHldlIhsvHuDeJNqIOJASkv7JdRC5Qqd5Ysa5VY5DKN0LA01820Wy7kKeAS0nzQS77keaz0iunBO7fWmkFaFy7P7wlIiGuy/SvrN815dbkH+oHd2KGHXXZiD8KkLfXfmBIdkK7w2J0a8+hh1GkdDWx23ihXuWTTfB0AZWx1ICj6V43Pb4RelVsk6hXGkeS5EIyMgey36OGsaqJ/J/dZLxqMIFsmcDiP4+kw9T3XZ6tW6b4zdQdIdOOuk8/+nx/51iLXT8uLDoy+Vbg2POX51t1GRyUoP3oCOnK7Fi92SfRQTIRx4blscF5gm2+M6llYIie4BTwIFOTqWrUOmsmqGxnlzahBWW5Ldfv9OL/BoTN7quunLvhiX2yl5UHHGxfXFqvJm+Xl7SCU64LH47Bds/G43KKv3butX1Tulpb5iW+WaqPWByPdzice9wNbZm+TrXX+GSW07w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OPW6o8O7R0KWwvWrG36EKa6KWP7hX6BDRZ+SEDAMEytZDnC8wMoD0uYID6tgz+pTqPRXQ1m9kv+nkaYWhLRPqP+Rr5sQy8E0azW2JHI/BrmPYTXG8ZUjXDU83DaRof0yUFh+1osiCkI0dGTMu5W3PFJujM/Io4eyqhpCPj9GaSO42UyR5Yufr5q2Y1GbkV7R/hF/YCX4PSc4ngX8VILVBV7Of34n1dNOSoAwLkq+07H5dsM35UB/6VvuGXGap3GvMysBRDbIq4zLkFgRHssHKWDRfrkltka1d54QWB4pzqE40OSTYuX3liU3luF0zZ4jrHzGt+aCwSs7Y30PQincee8scaFqHlyYk2GL00/TqxyLWH7C92uBQql4M28XUGNLpmn9i4cmimGeXuYxdiIaploXSkxkPvBjVZ79TL80OozSKUQUQPfYvgdcZNGl6OU1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 01:55:36.1586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c1f9dd-97f1-4b31-c51c-08de83c8483f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_185541_694592_EE46C7FD 
X-CRM114-Status: GOOD (  11.20  )
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

Hello Heiko,

On 3/17/2026 12:49 AM, Heiko Carstens wrote:
>> +#define runtime_const_mask_32(val, sym)				\
>> +({								\
>> +	unsigned int __ret = (val);				\
>> +								\
>> +	asm_inline(						\
>> +		"0:	nilf	%[__ret],12\n"			\
>> +		".pushsection runtime_mask_" #sym ",\"a\"\n"	\
>> +		".long 0b - .\n"				\
>> +		".popsection"					\
>> +		: [__ret] "+d" (__ret));			\
>> +	__ret;							\
>> +})
> 
> The nilf instruction changes the condition code and this must be reflected in
> the clobber list.

Thanks a ton for catching that!

> Besides that I would also appreciate if you would move the
> existing comment above __runtime_fixup_32().
> 
> Or in other words, if you merge the patch below into this one feel free to
> add:

I'll fold in the suggested diff when spinning up the next version.

> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com>

Thanks a ton for taking a look at the series!

-- 
Thanks and Regards,
Prateek


