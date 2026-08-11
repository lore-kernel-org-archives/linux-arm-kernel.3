Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C2C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SWX5+OeJBk5COWxnMmv6lgU0Hvn7SpM4bX4CvBtH7A=; b=hpglkj2ZbCiEZ6RAvDyyrYqxlY
	Zpmw1WUkPWIsaQrrU9+sMPUAkzTjp+rqSoS90J7GP1bYgIebyovC95MRRxPrykr5BHM4+oOfZDuJO
	a2sadoXwwP/dd6PbI4Lu+5/4bMl7ADDxwYcciSLsH8VvLSUPBqnfBvXN1yc18CUkrpXi1etrzXMb4
	PqCS13cztHrn/+9MIJ0MzDIAoMmgjJ1ZzNFoK6/6t+Tsw9lkQeT/0/N8JyrY2FFKpnBW4J1J8qrel
	9QXH/OMGfpkWoSenseThBONFr/HY5h6xDWxX0qJfUNn6dUBAbt4s/8/I8g5ibCZyCs0893ppdBr2/
	dybv5Czg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoOg-0000000EJmb-1zBi;
	Tue, 11 Aug 2026 15:28:10 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoOe-0000000EJlM-0IB6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:28:09 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZSHGu0NYWQ4nKErIV4IVJ0cK6St2GCQfeEG2H4SukL/ogbYDloBKA22SArePi4Q9RwHCdjgHavalk6iqisAtwK+ozMQ07b1WQP2a9YMeupTD+NijaAzGdF2Q2MAnpAEhyJBe3LqjPIBUEgkB72toUbuFKcUD8785H+pJ8RKHEUDOatoVnyVavIqOEmmAeL7YQTkQVbGgprJbAdS8dlYZEf5/ZQaCyQ1UJfJ/bKXQ4NthEF2ldbf6XXANDLJLpA3EfQZ/QC2IGiirh6PRUUCJGTpNxYIpQFpw4Em3P2eOZ7aS2PhU3oNHEWQ8KhiGu0LnXs9CAn6STzajgKG1w3r6aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SWX5+OeJBk5COWxnMmv6lgU0Hvn7SpM4bX4CvBtH7A=;
 b=AkmkazwoAA7rf01Q+7AnICn/ktcqWmzqlzYXb3bqr02WvqhyTV/R57T1pCRrpEc7VJP+FhxPqCyLn4aDVIhcRl02Q+9upGKeu8XWcIRp3swCfl0ZbcsC1v4QeDSedZlnZVxNDh1L4OwIda6hR81VfuPTYoMaOOmyC8Qm6zushAvQ2bhAm/2RiJ0CacqQudQ0VvM+LZisgmSy+MulPMgku/DLq/g5wTnCXaorIgZDVadlgzcocdfddm179xD6UZKlI51Udq6+xQRaYqzHfbTbqw9IvgCm+i3T9+etcPVS/GGRdqijtmaaigzERnsZXTJ5at8wkiU/Qp89cZ0t2Qwg2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SWX5+OeJBk5COWxnMmv6lgU0Hvn7SpM4bX4CvBtH7A=;
 b=hSoVmlzKHxqF+qFGtY99F6YUv527bOSFpwktjsMGso8T1F36KCBFSMj7mHBGfoty79XmlgYZI5vx8+rC3keIwv5Wt3hq9mW8mv0Dc2JJHwPu9qV4E4iZDbfuF+eDk6KPOwocnq9zNtKYEalLz9VFbZKzQb1XpmcjfRL2jmokCJw=
Received: from AS4PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::8)
 by VI0PR08MB11712.eurprd08.prod.outlook.com (2603:10a6:800:311::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:28:03 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::57) by AS4PR09CA0007.outlook.office365.com
 (2603:10a6:20b:5e0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 15:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 15:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sO0b3v6ADSyVk+PjBeUamgFmt35XW7njyv/ukgBXuAgG65JBVfOF+qBSplfpfR1a5vQNeUveA1pncCnwMUFfHozVaAfVO+f38uTYpuMc0Ys31Qwch1kLf15iugZ8b27mbP2oKdzrEHOBmb/MEHhe7EOPZA1Ouhok1qsFDH2MyxSOsuxvZxHloB0FXj6F83/9Axx7jw8KXdXy83LVkBFLgM48vwgXjz5YTjJftI2/Vzv+EHIDbmXjhWwckXShRB744Ct3b8MMsdlN+il/0+OrOawcVw/O55zkGedb5ntEyEiNhpj305Q06zQDJBTOO0qmRXABgiAVcAY69IG+xl8exg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SWX5+OeJBk5COWxnMmv6lgU0Hvn7SpM4bX4CvBtH7A=;
 b=KxudhaX+td7lBNjIK/T67Oisa0+s9EDYm4YBWAW2cFWKcBHFnz77Dv2TvRcGsy4E88gHlcRE0jmMsMM9TCULl+fP8EL0eJZMZf5oUOV5bX4DOrERR2oxAsiJGD4ZwH7n5zfnQ23Go4L4oSE8l+cLy8E5O2jpHojVUk0PGgsoAiDN1uZz+sPeaJAISKBwJsrtGQxyVdvb+5H8p06xpSniGTv64fVDaDnBClVlL3Cj6oe5h7XbhQegkzMYNEbKLcMPZX3nDJx/iJ5yhAEDWyyjznm4UW/JW9OmWYjJYez9IxsucNUmAvlytzrM6wD4eXPLCwTl/yF/WjdvE9/LaXZh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SWX5+OeJBk5COWxnMmv6lgU0Hvn7SpM4bX4CvBtH7A=;
 b=hSoVmlzKHxqF+qFGtY99F6YUv527bOSFpwktjsMGso8T1F36KCBFSMj7mHBGfoty79XmlgYZI5vx8+rC3keIwv5Wt3hq9mW8mv0Dc2JJHwPu9qV4E4iZDbfuF+eDk6KPOwocnq9zNtKYEalLz9VFbZKzQb1XpmcjfRL2jmokCJw=
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 by AMDPR08MB11505.eurprd08.prod.outlook.com (2603:10a6:20b:718::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 15:27:31 +0000
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e]) by DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 15:27:31 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: [PATCH v2 2/2] irqchip/gic-v5: Synchronize CPU interface disable
Thread-Topic: [PATCH v2 2/2] irqchip/gic-v5: Synchronize CPU interface disable
Thread-Index: AQHdKaXttPTa4VdOL02zlJyBOiZILQ==
Date: Tue, 11 Aug 2026 15:27:31 +0000
Message-ID: <20260811152630.942023-3-sascha.bischoff@arm.com>
References: <20260811152630.942023-1-sascha.bischoff@arm.com>
In-Reply-To: <20260811152630.942023-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8421:EE_|AMDPR08MB11505:EE_|AM3PEPF0000A78F:EE_|VI0PR08MB11712:EE_
X-MS-Office365-Filtering-Correlation-Id: 2993c5d9-653b-43a8-b00b-08def7bd22b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: xdtVV2zqtdo1BqTFL6hw8nsb9oWqgpRiXuQ+1FsXEvPFv1/lzw+NC85Tk5g9tDcO+BZV+E0t0Hq1kF6P1ul6ElyqpeiYDYxw7qpA600z4vQ8TWQ9qT3YJHqYzaVxFSdnR0LO30cO4W9jaIuqBN0liWti9q/ASjz1DVYRZZoLz5Z52n4JpC0oKIi2v6UFHdq8mu02xgHP4xxBlEiSWC0IaWH6d82j5+koOyYzyj8aLv9yScCC/7sYwJs7oHq3Q3Za8Gog1nOP0pLo2dcYfDuzNCcJFcsUPsS3omi41Izk29RxZTOhLRmXzx9GpnSWCyeeavXYzC6UFfPLFHB8cpjfc/8rIXTssxssnr/v6GgDEaiQqGEDMAbxlM2dX6jRFc37USIEObW71EWVCkB8o51NcxQyTstxrTnlP6mnTLv7ELqXxS+v3C6LBif9GegCOiVnwofBHLdM/Q6E3WjIIQA+cilpQNv0YrJwVBC4JXx4TGB8ULPDKqN8QEzhlQu6MX6ODrHRCGMmV5gOwFZsnOnGBc5/TxeJl36KwFFkkUsXBvZaFOCf74QRdV45seBRtf4NCYQLoAM292Zg8DmgAmlRaSDQ58IHzBkAj4vqHTqKLDbu0lRnbPgccZNw/Dg1pWft94Z7b07BnS//sM1HDPra4ue1/TUhT6CFTOv3dbBCO7U=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OFzPKL/stK+3WYg8Td2u80bSjSBVxrQ9sZd15yNGv60hHWpw+la9AisV93D7Gq8Fu1T2IisM6dsDVNi2yn2RT63fb+kl3uhXJ7cg8FV6SbCHl/khykbyi17MMJKQKvOK904JIp5QXNi7R5CNSHrpW5Nd2/Rr9tfBHI84RuTX3w5KO/90hTgsY9D7NI2XD7BTs40W3wa+mevZfeO7z3hcYJ77dvCkoD1Cf84kHV57DHTW8GosCmK0GZ/jnRvOXJfjam/fFiYxnH512tUHxY2w+7O7+fAh/g5TQ/rfMjIhh70WeWDfUPmQBCfUoizUemXq0rqPhGtWkO67MmY+Lo6IyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e8d5c19-c69e-430f-a93b-08def7bd0f9d
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|35042699022|82310400026|14060799003|36860700016|376014|10067099003|11063799006|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: eaH3I73+zNH/JCIs03FGToJdD6JOLZEuA83ecwGMTY1eiR14SHl2ssML3w3chRnJZ6ZSK4/hPq6GyB63Wyeh5F4CXq1tx2x3jxi+2P7LCyBXrskeg+ozuejWQj09OhwwyYuDbobTuyQMempPCuYbjwGjDEK6j1gZOdEAtpChwIGbEShcrW3LUQ6mo9BVNuSdJYMaEKvf4U7um9+P+4qysdDxWLj8lG/n3+Zsg1AagnwZy1JXZrq1rWzWQMiZLJ4jKO4/FQYh1HtCDXOEQkFLejthflsTG8oUQvWY0mJnCYuZHfngJaYL4/pZOhvz8e6lAFpCXfPdkkkQaJEuUBIg6fv44yB1c657W9LvxlabaX1SGHUEoeSZ4mzzUyT0ZoVM2W/wF9KzOzP6E6V1piXSRkaU6+AuhWPe9KZex+/mAX22Ze+ej+KN4/3V1FngHvYDaqP4ksIQ//EXwqYGASLN8uqOze4siFET1u5b28VfCMAZUb0pN5HhffyI7YWBzFqhHta9rrBfNPFzXxq+MAGwmyDNY8C5FSDtjaJcJaUog0ue5afW9NC4IyY/aDwWpCBdB//nCq0LCpY9T0PPB6b1PdEKLTs77ENf1cjyBfDm1fRc4/ZcfDw7+MmRr6ne7AAA2X5c/laabMfVoEE/p0WX0A==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(35042699022)(82310400026)(14060799003)(36860700016)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OuISgXXKrCLKFPkJkzJqhiftkyF214Y95MESRJaacO3LaFChw/c4WgkxwIrNAn7nnU+K2agClSAdAitIqckmlQVUlydyIyajg0h+X5sxLVp0km2X6GfCeBw9uW+8qJpqlfIO0BCDN0gyeWFE527eoNbSSU5efCfYhEnX31ZlHkPC6SjnarpwersMI310UeZNH5jvJL9tv8v8opfpJ/J6VlYUlWF+6rnMk2Rf+K0x8GGdhFlSMScfSoeJ90dbr/nwp89hUj3TSheo9m/qfEx2wkWDsgs5440y9aY4qjqWQoeDSWrM2Et2r0A99hn1mOryfSagK+RsWNiE1SYNysLK5Bl0KF3MQbP/9bmwm78ExZEGv8/Z34/zbRc1VP8c7C37aT5nFZsvrDTCLcyLCXusYK+B4SNDf00QOB6Qp+Cyyw50b4lPsatxG5cBWzREN4dX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:28:03.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2993c5d9-653b-43a8-b00b-08def7bd22b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_082808_111336_27802CCD 
X-CRM114-Status: GOOD (  11.27  )
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

VGhlIHdyaXRlIGRpc2FibGluZyB0aGUgR0lDdjUgQ1BVIGludGVyZmFjZSBpcyBvbmx5IGd1YXJh
bnRlZWQgdG8gdGFrZQ0KZWZmZWN0IGFmdGVyIGEgY29udGV4dCBzeW5jaHJvbml6YXRpb24gZXZl
bnQuIFdpdGhvdXQgb25lLCBleGVjdXRpb24gY2FuDQpyZXR1cm4gZnJvbSBnaWN2NV9jcHVfZGlz
YWJsZV9pbnRlcnJ1cHRzKCkgd2hpbGUgYW4gaW50ZXJydXB0IGlzIHN0aWxsDQphYmxlIHRvIGJl
IHRha2VuLg0KDQpBZGQgYW4gSVNCIGFmdGVyIHRoZSBJQ0NfQ1IwX0VMMSB3cml0ZSB0byBlbnN1
cmUgaW50ZXJydXB0cyBhcmUNCmRpc2FibGVkIGJlZm9yZSB0aGUgZnVuY3Rpb24gcmV0dXJucy4g
Tm8gY29ycmVzcG9uZGluZyBJU0IgaXMgYWRkZWQNCndoZW4gZW5hYmxpbmcgdGhlIGludGVyZmFj
ZSwgYXMgaW50ZXJydXB0IGRlbGl2ZXJ5IGlzIGFzeW5jaHJvbm91cyBhbmQNCnRoZXJlIGlzIG5v
IG9idmlvdXMgYmVuZWZpdCB0byB3YWl0aW5nIGZvciBpdC4NCg0KRml4ZXM6IDdlYzgwZmIzZjAy
NSAoImlycWNoaXAvZ2ljLXY1OiBBZGQgR0lDdjUgUFBJIHN1cHBvcnQiKQ0KTGluazogaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI0MTA0ODE5LjEyOTY4MDMtMS1zYXNjaGEu
YmlzY2hvZmZAYXJtLmNvbT9wYXJ0PTYNClNpZ25lZC1vZmYtYnk6IFNhc2NoYSBCaXNjaG9mZiA8
c2FzY2hhLmJpc2Nob2ZmQGFybS5jb20+DQotLS0NCiBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12
NS5jIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMt
djUuYw0KaW5kZXggZTlkMTc5NTIzNWE2Ni4uNmE5OWM1NDFiNTU5YiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LmMNCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2lj
LXY1LmMNCkBAIC05ODMsNiArOTgzLDcgQEAgc3RhdGljIHZvaWQgZ2ljdjVfY3B1X2Rpc2FibGVf
aW50ZXJydXB0cyh2b2lkKQ0KIA0KIAljcjAgPSBGSUVMRF9QUkVQKElDQ19DUjBfRUwxX0VOLCAw
KTsNCiAJd3JpdGVfc3lzcmVnX3MoY3IwLCBTWVNfSUNDX0NSMF9FTDEpOw0KKwlpc2IoKTsNCiB9
DQogDQogc3RhdGljIHZvaWQgZ2ljdjVfY3B1X2VuYWJsZV9pbnRlcnJ1cHRzKHZvaWQpDQotLSAN
CjIuMzQuMQ0K

