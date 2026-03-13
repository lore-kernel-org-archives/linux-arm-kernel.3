Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D9F105F79B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MK7Axwp3LtCJLxv969Ozhz1tsPmmB2P0uhbaZRGb4U=; b=SALPgJSxeRF55+f/yHgfAxYelx
	DKp3UjrMjzGc+kMrUoXRQGN4hyk5+qfphOPJQ9vS79ZiGyqIEXWvVgmj2H/L1t12ymg4WUlzD08+Y
	dKU1fz2bFR6S6fXBluCQT4SlRQm9Hp45Tlwj91Y/TZsUxzLcaTfVlFryaQHwVdROSMlf8FKIuTvkP
	GArYifvqDBeaFDq/HeGYYA+jWZ5X6bMDLmTk8NSb1iVf7FMsFLFd1Wq9frVVWtW3N2IOJfEB47vLW
	BvikrVn+NdgqcVt8SEeExe/G6atoz6llBNX5yWcGTu8cUMsqMMhiBJJv7EIBtnce9/ZvEtzgCeaEf
	6prXs0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10gl-000000001mO-1qal;
	Fri, 13 Mar 2026 11:28:19 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10gh-000000001lW-0bD7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:28:17 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DQS0Kt6uXL9yTOCIHoVqnK+ganUdbiYgRR2hwxPe+cDvWlvMX1oyQW/6RcSZE5TIVMqIAGcpuw0ovGkH+wiLSBexaOFrdFjXmO1MlGbXeABdk0quPrTVg8F/46zITHQwmr/Ud5bSp4KGv3A7LQxNSA8t88qjGImjM/uR90dnzv0OUad/gEWZl/5KaySZ2P+50Ot1D5lbGgVVx5nq23q7BqIkIZQO1DDIJ+nDJxLHZxmRapkGWH4PPTEkr4bkqFrxrbzYl8A3LDihvYDjMPTSIROgyxfnZXMy5Lt2dCYl2zYKcA4qwCMcjGeGBnKbqqyw9RxPJyAZAOKap9/k5lROTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MK7Axwp3LtCJLxv969Ozhz1tsPmmB2P0uhbaZRGb4U=;
 b=RZ3UK0YFTrRr7q8BUQswLxOLXcO3JUt07B+/aUpdgRnOyY/uTrvRPUkGbLYfyojEpA8D6EZIsZedKAfvyn0y4m06n9zZIn/iuYKwCEbixzh8jQ79h4HQq4p+o+tROgMEEqbS7EunGqiA4/AaQAGcSKg+IHriHfyhWu+x/LHFAmcdUIA9fd/Vgertjkw0NK8lNKLQNJzLXl3FqqdxP0Pcb+9FK90HmCILDkAGXaQmT6KKR7J2/IV4fJaHSbAQ+HhHk7RfrUb7OGPHQpluQMkuYxuBFyrH00qcDI4TWlAV8SMOiKyKbpU6S8ZQiPqIOqLFtOXdBU1Rg0MBJPDMibA8Mg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MK7Axwp3LtCJLxv969Ozhz1tsPmmB2P0uhbaZRGb4U=;
 b=b4tdZ7yjCHgdQl+t31ZtXZu0hSBBAJb7pRD8FU8UUUQM14Rm1zZ97zU+BDEMxJX/uBVJij+MnoNuLuwrcC9Nz3LZVMV/35Av0GlbkU1lUTQr0+sXRkhchR3rfRrut/NA8klLIDS2gMDiSQ2d20vGc/cKQYB3qilNNeeTbblBvXI=
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by VI0PR08MB10682.eurprd08.prod.outlook.com (2603:10a6:800:205::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 11:28:07 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::97) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 11:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 13 Mar 2026 11:28:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2YwPf7yNwmZrRDq98N73M/1Nrg2IGOnKuKZQerA73WoOC0T/NLqqT83ySHTzpUbTgMhqxvOr0UGr4rVaIIpQt4wCIRsIBmJFaBVII3PK9VWRo+o2s0eF1zqOIol4/7j2Ks0PR/uDeNpJteswpwMgsYCIRuBtKKZlPRayXFzhoXQh363n7uNOjXYs2IHz9rR6RsuF69Dnh8+OSr+XqyKTS1WgLXkfj+l8ev1F9JrWx9oPL2bPqK3Z/lyc2hcU2xX1K6ph8E57bE84BfxVHncOf4qIeh04ewrkGBfFQqJIsgzXGXPvY4gqmPgyXy2CV9ldlKaHrFBNnbPj3vO9jjbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MK7Axwp3LtCJLxv969Ozhz1tsPmmB2P0uhbaZRGb4U=;
 b=aOcMr5Oa52gHMLu4q/b8OUnWmich0TM1pyyPptUj9hf50/oytag5aqt+ddNFieVcQCKqz18BP4iGXCKlJGWajF96ZjERJY2zTJbA0OzlaZ+FfThzcR+CnyOLRzqk+7/QLTIKemebA4O8v2scKemdQC/d58h2EtUZdR/OUo9ExOaXlEDYgn28cEvYmZl0AvS5kNVgCKwz52gR+f1eduD/hScHJQPrDulB7DKlHsINe97G+DsVLnXIRqxew19IkSbYoFTQP4V7V4042t+JcGik3knMQPCBzF9jKjOkpgjZBTimu8rjBJOXYNNOsczbbOiQkt5cbKXXUGuc9mlKgs/8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MK7Axwp3LtCJLxv969Ozhz1tsPmmB2P0uhbaZRGb4U=;
 b=b4tdZ7yjCHgdQl+t31ZtXZu0hSBBAJb7pRD8FU8UUUQM14Rm1zZ97zU+BDEMxJX/uBVJij+MnoNuLuwrcC9Nz3LZVMV/35Av0GlbkU1lUTQr0+sXRkhchR3rfRrut/NA8klLIDS2gMDiSQ2d20vGc/cKQYB3qilNNeeTbblBvXI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AS2PR08MB9986.eurprd08.prod.outlook.com (2603:10a6:20b:649::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:27:03 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:27:00 +0000
Message-ID: <050d326f-ca74-4a8e-9ccd-78a653344c81@arm.com>
Date: Fri, 13 Mar 2026 11:26:59 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/19] coresight: Add callback to determine if PM is
 needed
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-5-eff765d211a9@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-5-eff765d211a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0585.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::19) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|AS2PR08MB9986:EE_|DB1PEPF000509EE:EE_|VI0PR08MB10682:EE_
X-MS-Office365-Filtering-Correlation-Id: 18859e20-9db6-4fbd-1d22-08de80f399af
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|921020|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info-Original: QfG7KyWEEcOIsiR40RAABbNlOzjtzTD2hMWuDPEV4MZAjLBJTTfPTHuuuJpoO46xSZ58evlsu0KHjq5Bu7q9UE0F0Bxd16kEbHijLe35h/nuRzg4TsRAfoV9NzvoDtBNnINUYxXzG3WdcOrGIADcbCIqWDFFH2mxHx9l43Xjr1AvXG+An3MVQ2OTJkTdUckfYVpr2eCoa9QFgIM0QaVhLzpGfoxD2h+rn4dteVU2Lkx7p3lMXmZGW4nycgzbdPRgzV3jpNB42khKi+QlFgQqeF5mMJLqEcc6UdG7GETZaGcGkV7GeZMRcFndOm2Wrijjv9FRZAlZ0ZsUgueNe9O05NIYj/JCIyhRs1LWG4abK0WmG2bi6FmzizL6ytMI23/ZqGXMyvBH4mPCvplYv08lcPKG5xAMnhbaAhmr9wCWBh8i3p/37DKDgoXWMmwhoYDFp5TPcgccAAV3jMwgV0toU7t06vNEt7IyaWqK82fbkUqesLkIo19xkJ0FcNhkkQj4jteYFhl+WVNrN60kk+yusG8OYxt3pR9yqnmAmaIaqFuao0/BilFkifsej8OpWhaFxwE8sR9idS3fuijRPc+m/QBt69Llq2Ohpv25unPELGahOyGAeuHXvt1a4PVGB67Uzpu+ngSrXI5tzIViZbk8PmsJCjoKz87wyjYsP7PU2H0nmyNTuL97X3Vlqp8nKRPt7Q589FP/kLkoCk6isgKTOEWgdJ3q7sse43XK5O2jx+QQ20kJD0llI5cY+dtP+RJzxZn1KXzyWYjhTb04yQ05fA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: PucGjxmjVxJpq38HikI6PrHubs/m2eJT4MDpkPizQazOxQHbmQHr+Yx9abb8voJu675hLX9wperrzlKfPyjAtYp8vYeeECmx1AXCATyOE1wb128+iaSg5yuKceDlmAjnGRggUmNXJuoLydcFpxS0JtlvXbUXADggNwWUwpO3pWKr73mUfLTLUzEUrh9Lmf81BLF2YNckqg0iRdoz8dAA2vKh5zD/mXWYgkKPGD+T5/8ZJaWLpPseELTjuiZZdz5cNkdnux5rBlTjUj04YGcko/aaK8TDbpnIF66GTjXm0YdKGROPNYqgMR0a2EaXrGgzUL5I6RN9EzI5SUyNMPYrjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9986
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b5d7b02f-07e7-46e0-7c8c-08de80f3715a
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|14060799003|1800799024|35042699022|36860700016|921020|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: r2S9VrmZMP5qgS5wjLx948SjtiHmjsxjBprw2T9cpHUK2/YGFCnFagQR1oFhrEPxVAbKt+EbvFZw0TH4GzlGy3D3vBsiokdbZMrgAU/d55qnMwA1zOnl0sqs0dwXr0WDkSAVjG/45y5VjLkSNsdB5BGqvIEYIsOO72F6oBOow+gsE+sVUxDCvm2saXd/5jCz8DaqG1Qk/j6/ceqfr/L7NAr7uNmJA2oCnwiqV7YJA0nzFhwKy6i8ouPei41Abi+5sdSmQ8XmJQohoNGC67nJjz6xgLnU9crmlArLorpBZnAypKzIM9lC/wfAXJGlNgdeIs6qQp8wXxf4u4ArNHlQSYaeYC7cpE3Z0ezwWQOA0IcDLtdBdcvhr9dn7vpgRqopMO04+pL75uQj43l6oqPUzheVzSW/K520m8YWmd6wwUoibAYb1tlnmGN8PWWBsg+wMmE0iO8D2JYYYVeW5CsyhBp8qlQ8UQj6HWThoPAlCFU4p1qoprlrogzDLbeANVaI8Q9X1R18ONpIKSh2wNSBCzMAmcPt/hbS18Oqh1uq/zekU2Kp0DEQkY5PABOTS6WnDPR55ECPzttEeNKPrWlUhn611n5LP4Ahi+jbBzK7U8F8oJK5cnAaSjhni6k3sabpUlyZjALzweVHlSM2qTTBC6K7+abc+efN7bEbOQF9VROvJ+3E4iP3l2kJueJqKdbNJuc76nEPcnK1ut2GH35ZkjVYgmG/9lNJbI2cknami1yMsoVpDFuzPwVcwMD57kHKU0m5VpxU8m4s91QMrlIAtlVZtPxc2vegEsomvCNxXqpoHTJD/LcEgGICaKBjmZVQ
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(1800799024)(35042699022)(36860700016)(921020)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QawGaSs4rrV8BlBwFvaJ/imQIAX+unzS0eBQefgE6CqF2RYA1I8YadiCktOgK9RZrbRNzPtS/1DMsIzRXqvasYrqmAgki8wheCqMxuYr+OAovbao82snLGc/O67ctERQpAzJyWMFR3HzEVc80rEdHh4phezW0Qm7I5rwrf60BnUpIcdW2DiHkrZIHrHpbokP2bnEBEb9azwkcQ6h9hPZER64XGEX3E4gRs7SP0trXhat4Nq2uvmSvXhN48JDA7oDe209TLDVgbD3UWHOmLuVAhqSjII2Cg2OLhTeQ/ONPtYaxkRes3QYeETN7Qti4O+P8LUmZ8e4TeqSel6tJKGc5LK2We1ZnHhI43EJoksOw2VGlEAJBZkzUGkEeGgQO+qOao8KhZ5adwOQmr9aCUgilkpddnuMvsu4pYDoUhdM0hll1yOSfYBpM497us8EWsni
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:28:07.5989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18859e20-9db6-4fbd-1d22-08de80f399af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_042815_351487_6EE2AA50 
X-CRM114-Status: GOOD (  23.25  )
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

On 05/03/2026 10:17, Leo Yan wrote:
> Add a callback in the source device that returns a boolean indicating
> whether power management operations are required. The save and restore
> flow is skipped if the callback returns false.
> 
> The ETMv4 driver implements its own version's callback.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c       |  9 ++++++++-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 ++++++++++++++++
>   include/linux/coresight.h                          |  1 +
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 5f7930ef537e2877649c404858d9fe6f593af037..6956429ca507d850c8b8c62c65de4b6fe1a1740c 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1681,7 +1681,14 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
>   	    !coresight_ops(csdev)->pm_restore_enable)
>   		return false;
>   
> -	return true;
> +	/*
> +	 * PM callbacks are provided but pm_is_neended() is absent, it means
> +	 * no extra check is needed.
> +	 */
> +	if (!coresight_ops(csdev)->pm_is_needed)
> +		return true;

Do we really need this call back ? The ETM can skip registering the PM 
ops when it is not needed (make them NULL) ? And the oresight_get_mode() 
is any way available for all devices and use that simply in the core 
function ?

Suzuki


> +
> +	return coresight_ops(csdev)->pm_is_needed(csdev);
>   }
>   
>   static int coresight_pm_save(struct coresight_device *csdev)
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index ab2031647616111d0689442149bcfdb0accbb218..d005983ee1e595f4ddc0b1f87596b1fbe4a0e41a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1861,6 +1861,21 @@ static int etm4_dying_cpu(unsigned int cpu)
>   	return 0;
>   }
>   
> +static bool etm4_need_save_restore_context(struct coresight_device *csdev)
> +{
> +	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +		return false;
> +
> +	/*
> +	 * Save and restore the ETM Trace registers only if
> +	 * the ETM is active.
> +	 */
> +	if (coresight_get_mode(csdev))
> +		return true;
> +
> +	return false;
> +}
> +
>   static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   {
>   	int i, ret = 0;
> @@ -2136,6 +2151,7 @@ static const struct coresight_ops etm4_cs_ops = {
>   	.trace_id		= coresight_etm_get_trace_id,
>   	.pm_save_disable	= etm4_cpu_save,
>   	.pm_restore_enable	= etm4_cpu_restore,
> +	.pm_is_needed		= etm4_need_save_restore_context,
>   	.source_ops		= &etm4_source_ops,
>   };
>   
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 63d77a064d9431d512b6407946c403f5c331d086..2de2ef94d2e046effb264cc97e5cd1a61e609249 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -439,6 +439,7 @@ struct coresight_ops {
>   			struct coresight_device *sink);
>   	int (*pm_save_disable)(struct coresight_device *csdev);
>   	void (*pm_restore_enable)(struct coresight_device *csdev);
> +	bool (*pm_is_needed)(struct coresight_device *csdev);
>   	const struct coresight_ops_sink *sink_ops;
>   	const struct coresight_ops_link *link_ops;
>   	const struct coresight_ops_source *source_ops;
> 


