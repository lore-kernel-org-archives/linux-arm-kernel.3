Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A1CCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAQVxB9ChLZMlp039aWpWaXvv3NjqvMQtUXtAqsZIFU=; b=EdUX5IoiWdhJntdT1u5AoV4dyL
	DnLaeH/KYk32u8BKOycvZ6gKmWAP/iCS0yU5DF478+yFdaAlGRC5nHTRUfZReaxw00Z1azXL4bA7Q
	cr4R20ZYB6R/eonJfE4v4d2NPFXWiv2jU2uA6nfsM8eQYZiUUVKfciPrP4Xe1EfWk3Ae/hKe0DS77
	EqKQGTRBdiceNwdFwNhzMtKOf7NEbe6bTeaM7BkJvmkupAuckC4Vghz34QUx+YMV483LyDcMeHPxV
	hNc/bnci+IdjnDlZKqmfIAZ2LgWunASY+JoF+PxSHyakqSatqXJN9wLCF3dMaDYS15HmrdeSJ9tIn
	tXfzZaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzfH-0000000AaiG-0ozh;
	Mon, 01 Jun 2026 10:14:35 +0000
Received: from mail-norwayeastazon11013046.outbound.protection.outlook.com ([40.107.159.46] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzfD-0000000Aahe-3UQi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:14:33 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hMamSicFC4F/kALRu2vP+OmCuyGT4DTgcxClXQtGvS8nKb6lFcTx55YELy5IrXQflfz4+gSj8RhCcRjcXZFE/7hK3SrYIFxplGRwAGrlLMbzadWPbCL4ooQL4Gg1jSgtzBNyVg1I34Gga749vgZVp8//wxHOvg4VKD7FrJg5TA3bD/yBQlrc4Ue2vVHxiAYXY+JYnaarAS98m9WhuwWEMBtBSzNBnFe8RMlTozRXU2jhUuJXSL6RdgISRD92ElDodA4n1DtX+90NSYw7Kw/HAXyLPyywE53jsaUzVbhoS/v7j0evtBipMlQ+qV/GsC3jned0vpOiE84TxGY1KAdkBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAQVxB9ChLZMlp039aWpWaXvv3NjqvMQtUXtAqsZIFU=;
 b=HuAUefzyTBjrqfwUqSH3KlZPe1mfI9gSJoG0rp/OZu73jgFdSbDiW1pDKn8+T+8DX7UKVy4T64tyiCJsxkgCUYtg3A8L8GjjwMu6FiL3RxsjGU8wkI2AaO8ZAlT5k/wsJsIm2OHVbpPwGRwQ+a8hjHyVmK8Vm+4HqbEgedSZedYQfEQK9Zv1ZtMTD9f6obQP2hdpwzVXz3zHIQQqih9ObI/XdzPVWAxJm+NKTgC0RjRWcQ/CZXTg3UFoEkpOtW+6h6fH//H3e+MKo6ZpbonZabQqtQjfWLHCw5DEOrnZ6GpuxB4FUCdZrIUPb1G6je98v31rGcUnuYG1pVy/d4Q+Cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAQVxB9ChLZMlp039aWpWaXvv3NjqvMQtUXtAqsZIFU=;
 b=Qp/VN5QJW81H3n2r0g1GJhKGj43qrok969LTKLPBjb+eZI00/4Cz6SacvKQg1V/Ub177M28B0zRwA1vp6zcecRD4AHmWVEMYut3CX8uGIZC/Cqd+ij54WTqr+tCK96GmlRqrv6ttPeuIa0v3WhjjhMq/ky5QHhc+nG593fELoso=
Received: from AM8P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::34)
 by DU0PR08MB7762.eurprd08.prod.outlook.com (2603:10a6:10:3ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 10:14:22 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::8b) by AM8P191CA0029.outlook.office365.com
 (2603:10a6:20b:21a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 10:14:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 1 Jun 2026 10:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz6c0tkqkMv245JfRWIj4E0r1CTFRLi6bw+eHMd4P4U1qvsk8T8dgpbAlSs4vJp7Eft9iZlzZNtky5/FC//NAALt2L9Jw44yUXZsGM+XvMV96WEbAyfY4jXD3dqfvENNRP5by/4ot0t8yz5+abX2DHmNwFOWLIvlAydbN7ofiUlks8shAJCQ2uUSfUvx2TrbWuaoWpjNW+vIdsdeURVU10cC2CTSxN0X2XznmimHUNN79koyBBUwozzmklGQJIb3WHTIyewjQr2dSFxrQZ2sq+7qNgIkw6l6iC81B7LgDvdCH7E9cYZ9MO4WrJIu3LDp7+IU8vy+GzAjGbSpRsn1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAQVxB9ChLZMlp039aWpWaXvv3NjqvMQtUXtAqsZIFU=;
 b=cyjiqdXDyBSNKuTK0GeHCKEDcSv7/sqO2CjKValE+wKgzTriebnegOdI0CkOIe1r3IQacFbRk6IctMsOm6kVvF8Q35YAsSqzJiJUuHufHYEiLBTtxNxuBiwCaeZa4apbPKGPNrqRThR2lM69ItKacAXyfqUy3YACWGWlFQ4wPzDRdBZypCFHbDpq0+FFwbVoGUxpl3thUn/9S+lI3RCdpk8vsox5KK1AKRTRy/CPaJPUkD4tzQjho4216NQUdUJX71LbClYr9z86H4NdzEplV6JW66Hs7vsEl+wo6wqIEMHONnc5pXKwt0otWZTvyeDtBkiz8h5+13FQx2Ravc/zdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAQVxB9ChLZMlp039aWpWaXvv3NjqvMQtUXtAqsZIFU=;
 b=Qp/VN5QJW81H3n2r0g1GJhKGj43qrok969LTKLPBjb+eZI00/4Cz6SacvKQg1V/Ub177M28B0zRwA1vp6zcecRD4AHmWVEMYut3CX8uGIZC/Cqd+ij54WTqr+tCK96GmlRqrv6ttPeuIa0v3WhjjhMq/ky5QHhc+nG593fELoso=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by DU0PR08MB9678.eurprd08.prod.outlook.com (2603:10a6:10:446::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 10:13:16 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 10:13:16 +0000
Message-ID: <0974242f-6102-49ec-b87b-763931eb9aef@arm.com>
Date: Mon, 1 Jun 2026 11:13:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/13] coresight: etm4x: fix underflow for nrseqstate
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, leo.yan@arm.com, jie.gan@oss.qualcomm.com
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-3-yeoreum.yun@arm.com>
 <3155a54e-f0df-49d7-9cf7-6f1c0f826f31@arm.com>
 <ah1aCFTgshh9klDM@e129823.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ah1aCFTgshh9klDM@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::10) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB10975:EE_|DU0PR08MB9678:EE_|AMS1EPF00000044:EE_|DU0PR08MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d27e524-d2c8-4554-8413-08debfc68d50
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 7vqMnHs4vazawoF/KmN81NJMcWG7whAuehvj9kmsFpZSfH9dWc9muC+mRaQi/0eyp3uL0iC7vrCQYa2OJV3VEyLWRR7e93e8CRA9d6syDueaWsGuPhvodmshcdogM6fJBA1Dlo3kpuHgFGtiuvTxilIo2/AO5BcF3KBdiHsQB2gc1E9u/jPMD2l7Io0619tTn3j8xhsOp3tjRdyJ6hKglmm4niP2uaySAhiWCpZb/LO+K26ebmAaXRlglvAwYFzxBunH+Ae43NJcnE8cmMPMQ2z35tXNSBqaMo5M2Bz7jFJGm40Sj1vTuZUcQuEeDp6syPCtL9nTvvqB+6rLpL7B1SKoOJQtPOp9xXVKk+cUqFt15bKC834T77RMpl7KTPJ96sDQjJr5TOlpX8QgzqpY4sopuKgla/42FclA+5MnJDF+X6M+a12dcSqmnU1EPzfHjVSjt68EL+XxxXv09GT6jlZersG6FOyt2zMCRvKm9DA+Bhp59WcvjewQdBaj3n56lnIzVS91keJHbRakixRjWbGTPQJgbk428+TFY9belQbpeedFSRAnuLiXKuZ9CBAVeBng/UoplZvmXcwfAmFFXYnrD6EyEclu4/M1/3pbXq4VatpZAF3Gc1G9UiVjhB0qZa1b4lVD8Vc9Vpvc5rvCss1yHHwsbW77KkAjhgFH1y8NJwbo8tQYOUU6JPlzyti6+JLT29JRZGw4dF2hGeipdg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: LOaSa3P/j80NGyy9qDnkL29nigIOR73ojW/spFUBfimMyCiSQwSnLZUUPHKZ7Gm40bH27zaWEh3nKfbkKEL2zp+pOhdrxggQ68e9A0yU3d40L5sqiO2AI5NRIB7ohu4qn6roaKs76chNP6vf0SMmQglrEMtBshDfCw9JoRjMtGbKLf+LJ0GJBShdRj5l5ze01yioTxUYHPPzjOeMXsNnY2qUQIunxw7mAbaoZO+qxFm/OtKNqUKpZpsAqPz8mePr+i7KImdApS33ankcc4POfJuJwnAyQ07/iiAoQADzWF96NQO6ECY+a8WySqTM5E4xScw5JdfEYRThW+PxV3vbEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9678
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40dd51b3-1193-4cc4-8aa5-08debfc66571
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|1800799024|82310400026|376014|36860700016|11063799006|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: tN1AjgqpsAOHA7kvcb+CNJPLyOedbLEtv8M9B6sF1Ec8sFIT3vXr1z0mhSRBFwJYbAzZMwSZrn2ga+v52wma55bROxMMUf64x05pTPhBC7cbxgTlAY7JD8Ne8SymaMFwOVLJMxIMih2MS7yUaBEX7r2bz+ixmWQYhHSZRWyv4wSHsaUdTUvrzuLjBJEvjekUjPov7kzGqCtmoDJ8Op8Bz5up+qPg7JBP+PcWKN2cT9NQrR8m7DEJ1dFpYwbafSSRiqclci4TktSot1VkZ3Lnb/PRp/bosgD4uDk1L03t266xt2B1efs0Q6lmuSDhd9vbEybqHKQlNA5Mv9lq/ETo1n3SCm7vX7wNubpx5w+Cz+XswBahDK5nwkm8p2TfwagSgp6hMWmf+D5gTNL2i21H+Ck3ND6r4udyIqun8UZ0RKhT7TNR/ANWnDGDHTnlqBAuLBc0xYcdlxmaK5B0Dn4gFR5++JBJpSQS44xXYENInZvoMq+2TkTbfg0vt+mDT77DNBy/sFQ+DRZt3zp2OrBBlJaposIwIumLXx77tDWwdxF1a5GlX3BXD9E8DQErdGjSnITvJy9rt3EBXSMr8Yc2tquxh7/WhMr3JJoQX6cBsIghl8dQOfA2VFEsdwmLho0QkqgMeyiMeBteg+1OXoyhpEKi9S5IubFMHRP2jzz/BqU4R9l6lz0ZqZ9082gha9dsn8uaSuWKVXVW28WFI5SaA6HncrYyRSmODX8rLsnfSo0=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vjfnAA/kYLCvr7BLe9BqjpGIH+aCHuys5kKVNmo6gpMaoCUO18mhoZwJaEKyE9yheUJ3msj8Fcq3UjxvVqNY3gddDEMs0iBgexR8397OK+BD11MWXL7sNq1b1uZGJ50xWkUTXe+ZeV4ZYCSNt8yeJ75eagl/t7kFRA0ruxhve7sNf/+j6pnbIFP6r1uHKK3Rwuwg9Q2JUmhpSW4Zks0BUsv+KYLvnKPH9Ux+z9M03kFf5dJ38CKsXr5T2fUxp5a0U18o1qH+feFf5wcO4dB4khGp+7P0jyxJfIVe2XdO4WfMxU0qN7Iut5YnKfQb23UiKH8liXq8FlwF670wDq+RywuEbT08ho8NQDsmywjZeO2G+RNHinDA7WNbDqvyQ5RzyJG0yJfIvrVceDzp5bBfdeeZ9hJ09sKIBdqU/W6IW1H81ikD/RFiHUugYFSlxtW6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 10:14:22.7545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d27e524-d2c8-4554-8413-08debfc68d50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_031432_170545_69A699EA 
X-CRM114-Status: GOOD (  15.65  )
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

On 01/06/2026 11:08, Yeoreum Yun wrote:
>> On 19/05/2026 16:48, Yeoreum Yun wrote:
>>> TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
>>> in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
>>>
>>> Therefore, drvdata->nrseqstate should be checked before entering the loop.
>>
>> for (i = 0; i < drvdata->nrseqstate - 1; i++)
>>
>> Wouldn't that check cover the case ? (provided i is signed int ?)
>>
>> Suzuki
> 
> Unfortunately, the drvdata->nrseqstate is u8 but i is signed int.
> I think in this case it would iterate 255 times (0xff).

Then why not fix it to signed ? Anyways, please see my other comment. We 
shouldn't be relying on nrseqstate for the number of seq_ctrl registers.

Suzuki


> 
>>
>>>
>>> Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
>>> Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>    .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++--------
>>>    .../coresight/coresight-etm4x-sysfs.c          |  2 ++
>>>    2 files changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index 1e3b0344dc00..94b9385e964a 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -542,9 +542,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>>>    	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
>>>    	if (drvdata->nr_pe_cmp)
>>>    		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
>>> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
>>> -		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
>>> +
>>>    	if (drvdata->nrseqstate) {
>>> +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
>>> +			etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
>>> +
>>>    		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
>>>    		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
>>>    	}
>>> @@ -1896,10 +1898,10 @@ static int etm4_cpu_save(struct coresight_device *csdev)
>>>    	if (drvdata->nr_pe_cmp)
>>>    		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
>>> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
>>> -		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
>>> -
>>>    	if (drvdata->nrseqstate) {
>>> +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
>>> +			state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
>>> +
>>>    		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
>>>    		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
>>>    	}
>>> @@ -2009,10 +2011,10 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
>>>    	if (drvdata->nr_pe_cmp)
>>>    		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
>>> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
>>> -		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
>>> -
>>>    	if (drvdata->nrseqstate) {
>>> +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
>>> +			etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
>>> +
>>>    		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
>>>    		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
>>>    	}
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>>> index e9eeea6240d5..0e1ad175aa1e 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>>> @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
>>>    	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>    	struct etmv4_config *config = &drvdata->config;
>>> +	if (!drvdata->nrseqstate)
>>> +		return -ENOTSUPP;
>>>    	if (kstrtoul(buf, 16, &val))
>>>    		return -EINVAL;
>>>    	if (val >= drvdata->nrseqstate - 1)
>>
> 


