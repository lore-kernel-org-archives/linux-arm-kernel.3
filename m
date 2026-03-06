Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B83F0181A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZknNrOHw3nLXqGuAY6PB/UGi1g21GO+TDt2vYnk6tn8=; b=PqXMB0HIhf/1BHG8pQaHS9plRi
	EBKh3HoPjpAW6W9BmQYpaNlQq5EyB93MOwtZzZjb8TQw/d2RwTuBGwhKSOz4GIjjTgQtzzvSB91Y2
	xih4IGNInrTqtBZqGrHEdUD4uPU8qgm3ydQAAAEHWADjwYSyFSAlEnCLrNtblDGBhg56jGENaY30n
	dDifOBDJzlmZiPcTlkgJvcX/x3KCLKGepyWG8ibutobemR7+6rkcAYkKjid0ec0KGPH7grvLK61Th
	P6OqT1BCXslvEefwOco3EKK8zlUgotDZB3fdN8ybLRYEpIn52jnKMvJXqz82plevKSbQTXo+KNO6P
	vEMC3bQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRtk-00000003Nyc-3n9k;
	Fri, 06 Mar 2026 09:55:08 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRth-00000003NyA-1Okb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:55:07 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bWH7ht5/Vxa6ACoXgEcaMeBGOQZSm7aLnRKoOeCStXVHoGLeAldvGATz/Gv0Tyqk2WnfynV4BOSosNDQ/cUQagHaG0/shYXd/+j/WVDAFe8TXi1ggDb5Jnhc+WC0p6jUodxwm/xzW3bRBIPhmoid4s4QzyFuGL0Rl9qosKY/syNN/4iAon8UaR56RvfV6lccsQdDPP7H80AEqPkcPBgWLR5JJFUo3SZZxr2Q/ebSOb7pP5C1kQcKzvXE+8QomrtucPk0orp5OgsSnJ1h6JzyN4C2vIpFPI52edsFkvVhmpWzSI36Z2t4ogJgezqKAQIMZwy85JjfC1Ua57voZbseEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZknNrOHw3nLXqGuAY6PB/UGi1g21GO+TDt2vYnk6tn8=;
 b=cPU3HZgBIzYPRkzueznOyrWOPMo2qayeriTmkOSJ1uu/eXogzunVKfVpbx2TOAIsPHDbJ84TuNFTS21I+DJTwGk/DW42CNlfK++9+NuEfPAm63UpbILZmsnLQFcoxWZZjksmhw0qMOrUjqkXrCZf+3fT9nKu1sqJdKmrUQ4f9kbc8yg3FsvqaWaCv+larndmXJK1hoocpMnOgonLBhMoC7jrpj1atkU5HTNw7TlYA6lFlgB/FIFu6OMkC6zDEyDn+fDXkxBInZN/u3Qt/L1gnmb+Gzu0cP8sQPmSjwD5D7XpQy3qOtZXdoSDkol9XTcJ160andgdR/dhNQwIBPn3mg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZknNrOHw3nLXqGuAY6PB/UGi1g21GO+TDt2vYnk6tn8=;
 b=NanMMlKbGnU8W45gBDsx3Tk+JsBOxOo225I4+ID9fzIn3Zu5HcaGqegKNenQo59Oq1bdhCbAwTJ7rs1fVtDTL5tK5GqwHbL3YHkqLaGAZ4wxRZEK5EQLI/3OcnG9590ZhPhaqqPa+I/erZc5/wj4L2q0vaAZGHPViO8p7tH1N9w=
Received: from DB3PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:8:1::31) by
 VI0PR08MB11513.eurprd08.prod.outlook.com (2603:10a6:800:2fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Fri, 6 Mar
 2026 09:54:55 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::14) by DB3PR06CA0018.outlook.office365.com
 (2603:10a6:8:1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 09:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 6 Mar 2026 09:54:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+Z4v9iSHzVhYLzc06nXza7NfM4vRitmbOGcL0RYVK+4cuKhPFdzEQpvcBYJa7PNRbtFx5U00y2dD0Bd4v861CCEBC0wElvgy91xuq6M1wzK+L/lusS7cS6uTX4vgQUX+gPa08sj/ByU9lPG3oZGIDVB909LDUboNUNGu/lGUynbIiOF0UFNQ8oIo1K9j5cdhdOn5PapJuAS8DRHnlXGLaKy7aKjqL0wS9tU6h4mG5WrCYYoaPS0HwiUYRZ6uZlHN/OworEHCqMgQ+IBcxYlF+EZWWMFGP+oFLEVineJ+qJXu670T3d6VODpVt+sV0zf88zwHFQo+xj+x3DubqvYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZknNrOHw3nLXqGuAY6PB/UGi1g21GO+TDt2vYnk6tn8=;
 b=EgXJIHtSNYZXRZeWWTGGLeC+SqZ8FUdqnATyWTo0u3CpbvR4UzGM8SMGQ0o7C+2lQT1nAqOWf15B24WGWIvkk9GLOIO4L/6wYWOdSi2W3m+NZ5sBNV4L27v8aZQFr1EqtCT/RpliZv6hGlRFlzpx5KfvcGclMObP/a7Kb+75LROCS3iaO/T1tUwAFPesvwwPq8FrASDgEoAcCtbKRRM47o74d1++BVHSMPy0vSP/qv29xD68Ft30UZzm/1zDhr7lroknOXJfzeZkHspdgwXHn8IerzZrkWoSI/hoWcuvwrYxIJftopueeFMyOpt91i392Nd+5sM1IKq46/JpW6hf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZknNrOHw3nLXqGuAY6PB/UGi1g21GO+TDt2vYnk6tn8=;
 b=NanMMlKbGnU8W45gBDsx3Tk+JsBOxOo225I4+ID9fzIn3Zu5HcaGqegKNenQo59Oq1bdhCbAwTJ7rs1fVtDTL5tK5GqwHbL3YHkqLaGAZ4wxRZEK5EQLI/3OcnG9590ZhPhaqqPa+I/erZc5/wj4L2q0vaAZGHPViO8p7tH1N9w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB7370.eurprd08.prod.outlook.com
 (2603:10a6:20b:446::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 09:53:50 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98%3]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 09:53:50 +0000
Date: Fri, 6 Mar 2026 09:53:46 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 00/19] CoreSight: Refactor power management for
 CoreSight path
Message-ID: <aaqkKkhFvVtTEv5e@e129823.arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS8PR08MB7370:EE_|DB1PEPF000509E7:EE_|VI0PR08MB11513:EE_
X-MS-Office365-Filtering-Correlation-Id: c4415d83-a94c-4412-9760-08de7b666b3a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: Dxf6BbvDHlU+xqnLCsPQQ40ow5BToNmsmvmKYERwXBKTQoxdplooCVvLQMdrFqT8w6HsI1mmXLAzoHWOJW6nSkHgCod3+0c6/JsA511TLH2YFWnyq2mM+sSwxT9IeKb55EuY/Sor6cie0Wr/joukSbnL/z2BPP+FCkATwfrI8Q/6T5sMa1sVFPbKDucQaJMTF6jhEesVKRxfG++8va5vJfHS9K2zrp93EkorG1CXEhKCcWmDCy5SIAvLkgC3WHnldHiWSZRs0X8y6i9BYdUmSG0DOHmXOoFp8o8PwDZ9cFBJ1r9f53H98XTQBROUeHj4ZyKLHlT4W8meVAZktWsMOicVROCj2tOIHs+B3MwzCx+6AjN2EVdvMwyAH5p1b9ZLejUPZO/N38rAtDgZ44BaipUBSBxwPoTEAI1W34FSpGOyKER7h6Z6hsPW5zKOcp+kXjnF+ev1L2l+4EoUCRWo3cWULWhp8WhUng6B0zoKpToKaH03CauOblSQsTJhoF9ivfWLHDnyJePJurVKqPpdFGyOwAKT2VNs0R5ZaSv+HJ+GwuhdCS2jcufQmjIw+HIC2+cGkJhvawAeAvQx03VFHsipMPyc9/SB82VAt6jT7V54FMbXRTt3hBI72RbyC3oMA3ocYY7xpFudTcrKR7g1AeRKsin3JyfUV8Ona/fgh3wZ+lgLGvbAJY6Cv4XubeKlRDeYF2bYmiO3eV9aPrG8GO3XARqh0R4JTNqgvyuK/EHswqGVePqRol9JPp/zlExH
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: rElZRtawKzGfGGv8UFi4xWMMtNEwGuq7gvT1yvlq67Sr4Tz8kDxaHvTyd+Q179qsKVv9ykVnpJ38r2o+cfOwt9nf12WCYAZ2Scd+c7F0MJf32i5dyjGtoUhj8xG/WF1GJ0+KvXR5EY+IFcE6bcjqHIVGHnST67+4ON2cRy6fTywxd1KJqW5Y3gJnV1lQBUt/anan6akxZgeOHxDrVRHKM6+J93XigDvTBbY8qhxHKCbqMqIOikgwHCzXHSJ78ieAWaYailDKkAe+du98jr61j5TILyTbvkJvlCBHB3skreRMT1CVWiSnN7YK68c6+HX00y/cNWDlgtelcimodb7PSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7370
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0a8c0ee4-6adb-4fb8-5f5a-08de7b66444c
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|376014|36860700016|13003099007;
X-Microsoft-Antispam-Message-Info: GwmE4xWhT41sXRvSVUvU8DQdXBN9Oa8iabxH6xwC78lwyChmQBdxzxZe9OObDIL7PMXghEzGcTnAVM02MU31gilNa/FeiMNY3oCZsNWDOzvzigExOzOgN4Wkh4l3knD4RIbEX3iqZkZ3AWm41v5qjqcqvJ19YKK+zJKsin8+KTjNltRwaGji+qyJzqQTzzoaPI9azmkyJFJRvnChedEmrau8ksL79RWFUldeopiQ5VKmmjrWBGUB5qmv1cJJORLBrncDgw/kHRf/u6lTo5ErwKmo5Mpce6HQ+TotheSXZnJp1QrxJ1eCA6LkZ8qJS/iiW57rDBT6VfJ7b9QgjjVOawv+v1F3MwtPZflc32nuP9mhoj8wrfqaIulrwCojhFY4OvJIdgn63cud0dO4LLceQq2LkwJOXo1/fxSNsFzKUG5VPhdA0X0lInT/ovHfkPY2NomAofHVv0xOIlE2E8fb8N7ReCqUS0qTh48azZ3DtrhXBowFoKiGyoqAclUZwv2vnQF8U5AsEuruj8bcPe3MmZoTbajIICOzHiHwhypYSOqPU8Or4lm1G2/WZS+UgLYJGA1nCE+BibJQ4K/+7aUZRrm1OZpJtyad8uV+6cGy0NkFIlNtW/u4OV6JdM9L7BYLJEeYhnm434104T4xZJ4E4sChLwWjR0V6lwAmiJZ+aGMQ9yBbISfnrnVeks3h7ZT+D0XnhICKlaWodLDyxnwky1o3dEyO/13kPNStu/y8AmgcokBXZ+adi1DlOWrisHN+nhELIHqlMXr3E88Wt/EIwrpjsX9FCS19VfBbfVVYrKM=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(376014)(36860700016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kx3AujryUA9WWYs8rfW/+JpFIpjb0cG1nTxrFJuV0XmVMKK9MnyBLVA9XVbQM7rXlDx429oSC820NMqk/Lowdl/18eP8u0vAu6vfdEahlFhJXJvj+Lg3O4WEyw9bL7jMpU6nc9kY1AK9CpXedAEGk7J4/Y1Zasfd07JIsJ9vXUvzxCN27CQB23UTcAnwfhMmzOAoVIJX2822jCB69OSpn2mynMzscgJGPvW/vs8RGgQ9fxDttJJOB8l6ABDfhSAiAlaIYGOB2/j6WowRUCIDayZ8sx638ZWgJAMybDf6XvKejbKqLYKeI2R3fjLjQHluBXSja8KAvpGe7CMvQ+yC9GCkF3O6yiHPisLHUuULIdgH3jm47IzyhvsOrft5t4cDRqrENLZZYFKlUQIG8BftDdJ5qiNVDKr2lGxpaoFXkFruwg2xzvWmY7yW8yazOLMd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:54:54.8093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4415d83-a94c-4412-9760-08de7b666b3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_015505_553862_73DFFA90 
X-CRM114-Status: GOOD (  20.52  )
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

On Thu, Mar 05, 2026 at 10:17:31AM +0000, Leo Yan wrote:
> This series focuses on CoreSight path power management.  The changes can
> be divided into four parts for review:
>
>   Patches 01~06: Refactor the CPU idle flow with moving common code into
>                  the CoreSight core layer.
>   Patches 07~14: Add link control during CPU idle.
>   Patches 15~16: Support the sink (TRBE) control during CPU idle.
>   Patches 17~19: Move the CPU hotplug flow into the coresight core layer
>                  and simplify the code.
>
> This series is rebased on the coresight-next branch and has been verified
> on Juno-r2 and FVP RevC.
>
> ---
> Changes in v6:
> - Rebase on the latest coresight-next branch.
> - Always save and restore TRBE context during idle (Will).
> - Use get_cpu() / put_cpu() when set the per CPU source pointer.
> - Link to v5: https://lore.kernel.org/r/20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com
>
> Changes in v5:
> - Set the per-CPU source pointer on target CPU (Suzuki).
> - Reused existed enable/disable buffer functions in TRBE callbacks
>   (James).
> - Refactored refcount for source devices in SysFS mode.
> - Released path in cpu-hotplug off flow to avoid memory leak.
> - Updated ETMv3 driver when move common code into core layer.
> - Rebased on the latest coresight-next branch.
> - Link to v4: https://lore.kernel.org/r/20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com
>
> Changes in v4:
> - Changed to store path pointer in coresight_device, this is easier for
>   fetching path pointer based on source device (Mike).
> - Dropped changes in CTI driver.
> - Only disabled path for CPU hot-plugged off but not enable path for
>   hot-plugged in.
> - Removed James' test tags for modified patches.
> - Link to v3: https://lore.kernel.org/r/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
>
> ---
> Leo Yan (18):
>       coresight: sysfs: Validate CPU online status for per-CPU sources
>       coresight: Set per-CPU source pointer
>       coresight: Register CPU PM notifier in core layer
>       coresight: etm4x: Hook CPU PM callbacks
>       coresight: Add callback to determine if PM is needed
>       coresight: etm4x: Remove redundant condition checks in save and restore
>       coresight: syscfg: Use spinlock to protect active variables
>       coresight: Introduce coresight_enable_source() helper
>       coresight: Save active path for system tracers
>       coresight: etm4x: Set active path on target CPU
>       coresight: etm3x: Set active path on target CPU
>       coresight: sysfs: Use source's path pointer for path control
>       coresight: Add 'in_idle' argument to path
>       coresight: Control path during CPU idle
>       coresight: Add PM callbacks for sink device
>       coresight: sysfs: Increment refcount only for system tracers
>       coresight: Take hotplug lock in enable_source_store() for Sysfs mode
>       coresight: Move CPU hotplug callbacks to core layer
>
> Yabin Cui (1):
>       coresight: trbe: Save and restore state across CPU low power state
>
>  drivers/hwtracing/coresight/coresight-catu.c       |   1 +
>  drivers/hwtracing/coresight/coresight-core.c       | 273 ++++++++++++++++++++-
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  |   1 +
>  drivers/hwtracing/coresight/coresight-cti-core.c   |   1 +
>  drivers/hwtracing/coresight/coresight-dummy.c      |   1 +
>  drivers/hwtracing/coresight/coresight-etb10.c      |   1 +
>  drivers/hwtracing/coresight/coresight-etm-perf.c   |   2 +-
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |  65 ++---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 153 +++---------
>  drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
>  drivers/hwtracing/coresight/coresight-priv.h       |   3 +
>  drivers/hwtracing/coresight/coresight-replicator.c |   1 +
>  drivers/hwtracing/coresight/coresight-stm.c        |   1 +
>  drivers/hwtracing/coresight/coresight-syscfg.c     |  22 +-
>  drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
>  drivers/hwtracing/coresight/coresight-sysfs.c      | 126 +++-------
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c       |   2 +
>  drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
>  drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
>  drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
>  drivers/hwtracing/coresight/coresight-trbe.c       |  60 ++++-
>  drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
>  include/linux/coresight.h                          |  11 +
>  24 files changed, 458 insertions(+), 274 deletions(-)
> ---
> base-commit: 9c5ef7a30d9044f8706bd02bfdc4eff7266f3e25
> change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
>
> Best regards,
> --
> Leo Yan <leo.yan@arm.com>
>

All patches look good to me. Feel free to add:
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

--
Sincerely,
Yeoreum Yun

