Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D78E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ws483vT9ImqaWBbACp05hLMjN/NOLNkPhH09Oq9djO0=; b=Uy1heoRQQaol1QMzIKYg/zqkKg
	OlYvhXsQHltL+yCHcWwyF8yy6vPWmyPL++8/tS33nOlrdoWwVFG7avqvRO18mp0zvbpg+qWBC7qHX
	crMdqjciktxh5Y9DAjs2G4cG3Zi00fJzmIAhkQZdkSVIQUur8L6c0/ZpFf4i2uHf4VfQ9Ehh46kDF
	gGd+lLM+w6XGbvF3nUGtEMjKk/DD8VXH1Zk4/jJQf5vMh+lKQFihLHtVBQ12RtdD5qaeMawN9I4uf
	oTo8Qp9nucwMxel6qGC5f/ubeDAA4qOZ3akf48WWXSMhxIJSRMsCzI1C+wtwEgQb3zMqVa7TRcqZZ
	P+XqYY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa7p-00000004ZPv-24DT;
	Fri, 20 Dec 2024 10:20:53 +0000
Received: from mail-am6eur05on20616.outbound.protection.outlook.com ([2a01:111:f403:2612::616] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZvR-00000004Wtq-1SeB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:08:07 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ixvfEOYXrkFMKX/CvD7Uzf4gDbO1id9Hd7fcEIxtsY85W4yIfFE1N4uhC4gJpdMaecop9wPSmJqr222oRZXzoJ7vWfIOIg9SzcBlm0CGG6xOtIBhhqwRRpDqYbAvs1qFCJDi+RkCT9e+MmMyzXx6kWI+nd2otzu7TfEz114zHO42Lq3bluIBpbZlPKmsHnJquID3Inx17zpeZNPYuS+JaelXyRFXKngoKb7hZKsksHaMHz66j9bs68rUS9xg1ARLHjJIPV7kUGkQEwqYB2Yn/5YSa0ppsXeAIvpVvY24d9WZ44RvSgt4lZSZxlmXufGFMmwhRizOC739zynd4boyQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws483vT9ImqaWBbACp05hLMjN/NOLNkPhH09Oq9djO0=;
 b=w36cBcgz3t6Q0rtofoTpn5bRuGL0cigjWK+962cQD5sS3yyQhEkOLQKkyuFliI9wMVKG1KUu5RPauCCKz/FKnBBs/eWXM3JJenkoSbHU7uHNFZH9SjvHUHvwJfLbwLnV76tbxy85oi+nzfHvsHLY8WufRBGcB5zSmI1VDFZbzPjOE0yy4pOZsIbbYglL2w55oPsaKD3x8+tkW3LK9/JJHwMItNF71qIfW9yvdmjGIkBu78fGgi9/4wGBTxrTHxUtIAtGVkRWup1uTZvMlf6HcCr4qnbfgNRB3W4P/db0kC9VLU6JiLBD1oNHFNtYFbZSpcgQRGGbS39VAvgCDKGtMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws483vT9ImqaWBbACp05hLMjN/NOLNkPhH09Oq9djO0=;
 b=jfoOkmkOcxfVPk6ZmGoYTFYsA/KXVeExVS0x94iHY9szMpNRcNs8gx5QShgAqzOOAoy5g/7z5yaycdTFbl3e44BBQRaJq/+IYHUx9MToGkKho5YRqEg028TG10ndkmADew9Lmv44aXW/IosHqXvaZ4svChUW6Oc/iAaXIZglHxU=
Received: from DB8PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:10:be::38)
 by AM9PR08MB6066.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 10:07:58 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::a) by DB8PR03CA0025.outlook.office365.com
 (2603:10a6:10:be::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Fri, 20 Dec 2024 10:07:57 +0000
Received: ("Tessian outbound 7762b28e8285:v528"); Fri, 20 Dec 2024 10:07:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3266548f1e19a613
X-TessianGatewayMetadata: wLa5Ej4LX9iOzOIoj87xvlEEHrMapTHIYEswDEUEKrRy7E5i8ALEg/c10kZG8bis4V4Lo6LPMSQp2cdBG/Pyq73hAWV93fX4L/vggksrGKSM77+AyedIzAsztFe0aP75H1SlQtrLqYnxw577vUPvTg==
X-CR-MTA-TID: 64aa7808
Received: from Lf5c1c55045b5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A6FCA764-9C5D-4175-8026-A03EA3148B40.1;
	Fri, 20 Dec 2024 10:07:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf5c1c55045b5.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 20 Dec 2024 10:07:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8/yA2lTjkcpeDizQfoIWUW3CSqdQbWLwy02Z7+h9u9Edmk8ZfCL4vWhtuPXUjA/vVINxFZqJBvmB78gEXHBbTgonVPKRCYhZGv8kf6QDAINBp/nWoUUj1VLb4+TZO+iFnl688Ynx9ENsMGhK+nZ8gP4CnYEMQbptpYwE+eH5C0+ZYFIs0Z9+PQGFjwoWYV9FR7uEt08ngdMsN2zAm0hj9t5TX+7JQ7olR7yXpkgp5ogUvVzZ1LE4GrRupZxnuXXreMauXIsfCix7O5RpiDycasoWqQWU7aFy31u88xcIAbWfXk6Duvj/PgZ1mFVpgITnRQL59Af7yRSPjV31Z983A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws483vT9ImqaWBbACp05hLMjN/NOLNkPhH09Oq9djO0=;
 b=PD3pTHerrbBHeiTRugItmTF5zOC9ET51Vz8vrZuV8F78JWepPbUt97fXP0cZbUgunpAkA2ybhLGZhHH2mQ2eRWie4JVQMWNRBL8k3NFw8/VvN90ToDWXo5hXBoNT2KuIDlJEur9Dj6ruAuFuukr7eqGYV0rDaa5W94g2Ee/DeVq0H+RMdplxKYZ+la+r4qoE6Djz9Z/KXmyM03XVzzQ7aYxByEMBoPkPbj574ZhidFtmMmw7E05PU0c2PAZhhSP6F7cPMUFC8EtaZww3fQfS/PXGlKtGdUvpXFvmkE0DMthLEQu4OnXAmWXtMOwfIU/NdSoH0F7UMHvk29dHgwgwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws483vT9ImqaWBbACp05hLMjN/NOLNkPhH09Oq9djO0=;
 b=jfoOkmkOcxfVPk6ZmGoYTFYsA/KXVeExVS0x94iHY9szMpNRcNs8gx5QShgAqzOOAoy5g/7z5yaycdTFbl3e44BBQRaJq/+IYHUx9MToGkKho5YRqEg028TG10ndkmADew9Lmv44aXW/IosHqXvaZ4svChUW6Oc/iAaXIZglHxU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB8202.eurprd08.prod.outlook.com
 (2603:10a6:10:39d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 10:07:44 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 10:07:44 +0000
Date: Fri, 20 Dec 2024 10:07:42 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 9/9] coresight/ultrasoc: change cti_drvdata spinlock's
 type to raw_spinlock_t
Message-ID: <Z2VB7uGgTpOoRQqj@e129823.arm.com>
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <20241216115006.415861-10-yeoreum.yun@arm.com>
 <CAJ9a7ViC+ZSzNYTo+mKK4UYw=GBO9TCyJ2WHN879=hO-tq8JvQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7ViC+ZSzNYTo+mKK4UYw=GBO9TCyJ2WHN879=hO-tq8JvQ@mail.gmail.com>
X-ClientProxiedBy: LO4P302CA0002.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::8) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB9PR08MB8202:EE_|DU2PEPF00028D04:EE_|AM9PR08MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 90cc68e9-efb9-4d25-afef-08dd20de2d7f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?eyFmzg0WhJAjztGgvljNQprbb6FaxsK/quxdHZRMZAfqAc9gwz1MwVOIANmo?=
 =?us-ascii?Q?f3p6l8wn65m6KM1k6cKzZGEXps+M2bG8vDiYIti+lNg2PYNpu5OHLrN0PkUM?=
 =?us-ascii?Q?ZPCK8ZjPi2ZhWkBe2NpyDJ7ijfkFRiLjtVdSQxinNgyrFo0YNWJHSK2oZhYk?=
 =?us-ascii?Q?fBiQOX/UAbBwUNGIjhtSa6dQDq0ulSOo3m6NR8pY6LYO+rCB5CERsAQyY+yZ?=
 =?us-ascii?Q?RpOIOpHLL6MENpoMy916WoGprtKwNDKsCptKfkYedSFUsgKBK0mpi0oL8V17?=
 =?us-ascii?Q?CxbeyiT3KbsGqncUKvSdTJWX8Y8iMBsoRU78HqkDqmyJUEqFkHLmEIHK1YlI?=
 =?us-ascii?Q?zGRG3EpkKbk/O2Owxc1spRphht/6excC7BipPJCkFQmG7WHhEoSLE/6ZFL5q?=
 =?us-ascii?Q?zvMf42uIA80COe2jXHMEDaBcFMmLbz+G/hgzU8BD5KVHDalkPNxxkxwlW0GO?=
 =?us-ascii?Q?bFOdZX79IWRJRlORiITnKQGfCDkbED2GyMwbqmmmzzJ/I90SjOtjc5viF7k5?=
 =?us-ascii?Q?Z205FiP3Qwqbq7YOwxmhjsbJj8gakt+ANWHwrxzik1rD1fpuJbgswjIIYEZF?=
 =?us-ascii?Q?zH+tzlj6XkBRO44u1c7Z/NRHzzpbFsbzUNSC2CyGFOGtKUfmdspcHVfTc+cd?=
 =?us-ascii?Q?m8ZbV2A6KhpBPADGRdus0zI18HnyOKRKpQ25A+gHVpty2Tthk/dA7bhNXpq8?=
 =?us-ascii?Q?owyBaZYcBIa1dpkQZGeoEOXuHDYvxfWdcfqQajkQ0/m6j9MEOJ+4jZHvD3oA?=
 =?us-ascii?Q?faCQo3t2Oiz4Qzm7cHl8H3OShG/ZVs0CqujayUV7DsdV7UiNOYa6MsIrUPJ1?=
 =?us-ascii?Q?lagiqGn8fuZccHAKCKAl6RYRiAPpu1/6v7Ttgf4UhorKznu1T7Cv3JwIoZig?=
 =?us-ascii?Q?BRttV5Z/ZUAWSAd5yPZ7GC7csaleXKFLUMs61pyR9Q03izyqZaTWqeR5eT8w?=
 =?us-ascii?Q?O+qm8M+f5CIFZndlKm6gkTA7sSnjfIo5NxLf/e5oOAexyr1G2GxuXVmZs8Nc?=
 =?us-ascii?Q?JlaADQapXHwd8CZitPIzWxri/57Yc/7QurqDssN+7ZKW0hJJxLGZS6qZp62g?=
 =?us-ascii?Q?M1M1Hj0W79y2xmGsrQL6gMgnbgPYLFZHtiAVqbAuJZrW1rfqJmdDKwlT5yH3?=
 =?us-ascii?Q?TgUvP+VJEgvk8heunQegQ/8ljl9eDeM9lK6hXuybh9Ij3ZyItBXmyGpgdfkj?=
 =?us-ascii?Q?gmrmvQQhog/bRGqHJQIqRcG+bMARx06VwtDTA8OsFWTuP5+0jVnXx+A8VB+c?=
 =?us-ascii?Q?YstqzngaVd30DxhTFAP1IrCQyCasYFG2zsfmP2hnz5SmQb2rfgfapCjx1G7x?=
 =?us-ascii?Q?rfzWxgcLp27KWYnAVuYdDFPMbieRT4oiuImmYJJEhnryyhd0++jTmTbZwWOp?=
 =?us-ascii?Q?Eqpq+dswrCBX6oikFgclTo4bru+S?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 789c852d-2492-4ba3-202b-08dd20de25de
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cEt0RBW5bc+NQvHFJyVjfPz1dcQce4PyNelVUjgz8+q7D1cBLLqSapgI/7T1?=
 =?us-ascii?Q?ujEqnnC63PFM+n4S+1gj7c5T1voceZtTLu8eRGcquYoU/72n/5ob/61O5Ynr?=
 =?us-ascii?Q?gT5FI4YcfEoaTtvmi6EBdzFCxWoD7YQU/2d+N/j/UlZnLtRKdLOf9UAJt+Fb?=
 =?us-ascii?Q?5r6Mq0JzpjKT5cEPpUaEIspZVNSn3EbhuAL/Gm/iMvCpyOUNJ0PfbknePdak?=
 =?us-ascii?Q?ubL9qJtwkDbu2IZP/xKVuZUmgh2dTqrp3D9W517K380f0Sx56+QrYvfbDKRp?=
 =?us-ascii?Q?fS+hNvuqebzC7deZK5pZGU1JLhEE/KIanZ3rU25OJcTK4oBeI+T4Esm8YcmR?=
 =?us-ascii?Q?/rgmssK6Up7XvdgCSf5wNYYwmbO6YWqLFgGOIw19WYhms3LnXcbBYdS9pCNP?=
 =?us-ascii?Q?RfB7C/Kl4z+fomcShhTQCB1lsiS021BKBu9aO6BpJ7SxSYvZgLi/mEbn4EaG?=
 =?us-ascii?Q?T4/oywyuopdJ90Nz8eKMAR9cfpyzQ57id38E61WYHjGSFd6jeWtcxzXoyPvD?=
 =?us-ascii?Q?e5K4hC2NjI3xSHPXZu38/lOMu1woHa1tAqlktUldnZj+6hILwKtWJCusoqUo?=
 =?us-ascii?Q?i+HrSW+T4wI7N2Jzzxdz4yYTgbRBpWrda0+QFoj0Q1ttmjQXp6p8Rlzak8u0?=
 =?us-ascii?Q?dRj2jF4NJULSVvF59x4cModkzAG/XGWGPVlF9Ft0xhm0eQ07h137dJv2Muwn?=
 =?us-ascii?Q?rQrfVXAAPeXVhyEP8vpFToSIZtd0d9K9OU4l4bcQJVR756sETA4a5CHGHMRN?=
 =?us-ascii?Q?3/wrrTMWsvE07A016F7s/fPEcni1I7WgVvwxIslkwNq1Q4T6Ych2sktUyILC?=
 =?us-ascii?Q?gVb0X328L9JnGu7pCGQbl6uk0KxHkftlCyU6gkj8oni66T8vJEf3cjP0Nfqd?=
 =?us-ascii?Q?71dB7DopNGEXL8xMFgG4HSzHty+ga8iofrdPtgkQfj3hen4L6ou2cjyW6m/s?=
 =?us-ascii?Q?DdDo+F6ru5BCBnXHbjSOZQG1zare4hWbm/az4YWqciXiI9z2SokPdYmNuTjX?=
 =?us-ascii?Q?23DPgVdYq9LzxtgG7/Fs3kExT6iFMdW7BfWfP3o8iRHOjOJEMjJ6Wxa3Dkbv?=
 =?us-ascii?Q?XwJtc4oyYMqQIMTkLyj2c8NwVqsSr3p9GdmBUuSAXmKLVrkrOPLZAW5VBAFf?=
 =?us-ascii?Q?/0O6cAku2JKwJTVOK//8mi0clrr15Tk/MIutOT6ENrRcw6sBfBro/1Q6hvVX?=
 =?us-ascii?Q?LXQHiRWjww7wQ7I873ou6LyZnkeNjG4SBOstv2+pIsyphLBx5jh1FfElh3B5?=
 =?us-ascii?Q?V00oNGuPS1fp7jjwe/pzaFzyEbRVzSmiwXprWHoAVkaCrG5xtZksXST60o2V?=
 =?us-ascii?Q?pbWjp98ytzU6LBmY0NkSTEc1k96PKhz8IOZr8bRktSQAQhiUfYBvpm+lQ3Xo?=
 =?us-ascii?Q?/uvRXOK8o6461/y3Fhm+blGDMxNw5R5iuRCQJIRbZp+BCMlnQK/158NF61+5?=
 =?us-ascii?Q?3WwqxclUor5ujQY8DjMh1R/0EPKLNuoISQ4PnTBumKbIiwKPjPaiOHJHr5uw?=
 =?us-ascii?Q?f9buo0qm0Wp3jlE=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:07:57.4024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cc68e9-efb9-4d25-afef-08dd20de2d7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_020805_925520_E539E532 
X-CRM114-Status: GOOD (  19.61  )
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

Hi Mike.

> Title of patch - this patch has nothing to do with cti_drvdata.

Sorry. I'll fix this. Thanks
>
>
> On Mon, 16 Dec 2024 at 11:50, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > In ultrasoc-smb drivers, smb_drv_data->spinlock can be held
> > during __schedule() by perf_event_task_sched_out()/in().
> >
> > Since smb__drv_data->spinlock type is spinlock_t and
> > perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> > which is raw_spinlock_t (an unsleepable lock),
> > this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
> >
> > To address this, change type smb_drv_data->spinlock in ultrasoc-smb drivers,
> > which can be called by perf_event_task_sched_out()/in(),
> > from spinlock_t to raw_spinlock_t.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  drivers/hwtracing/coresight/ultrasoc-smb.c | 12 ++++++------
> >  drivers/hwtracing/coresight/ultrasoc-smb.h |  2 +-
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> > index dc3c9504dd7c..26cfc939e5bd 100644
> > --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> > +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> > @@ -98,7 +98,7 @@ static int smb_open(struct inode *inode, struct file *file)
> >         struct smb_drv_data *drvdata = container_of(file->private_data,
> >                                         struct smb_drv_data, miscdev);
> >
> > -       guard(spinlock)(&drvdata->spinlock);
> > +       guard(raw_spinlock)(&drvdata->spinlock);
> >
> >         if (drvdata->reading)
> >                 return -EBUSY;
> > @@ -152,7 +152,7 @@ static int smb_release(struct inode *inode, struct file *file)
> >         struct smb_drv_data *drvdata = container_of(file->private_data,
> >                                         struct smb_drv_data, miscdev);
> >
> > -       guard(spinlock)(&drvdata->spinlock);
> > +       guard(raw_spinlock)(&drvdata->spinlock);
> >         drvdata->reading = false;
> >
> >         return 0;
> > @@ -245,7 +245,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
> >         struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
> >         int ret = 0;
> >
> > -       guard(spinlock)(&drvdata->spinlock);
> > +       guard(raw_spinlock)(&drvdata->spinlock);
> >
> >         /* Do nothing, the trace data is reading by other interface now */
> >         if (drvdata->reading)
> > @@ -280,7 +280,7 @@ static int smb_disable(struct coresight_device *csdev)
> >  {
> >         struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
> >
> > -       guard(spinlock)(&drvdata->spinlock);
> > +       guard(raw_spinlock)(&drvdata->spinlock);
> >
> >         if (drvdata->reading)
> >                 return -EBUSY;
> > @@ -378,7 +378,7 @@ static unsigned long smb_update_buffer(struct coresight_device *csdev,
> >         if (!buf)
> >                 return 0;
> >
> > -       guard(spinlock)(&drvdata->spinlock);
> > +       guard(raw_spinlock)(&drvdata->spinlock);
> >
> >         /* Don't do anything if another tracer is using this sink. */
> >         if (csdev->refcnt != 1)
> > @@ -563,7 +563,7 @@ static int smb_probe(struct platform_device *pdev)
> >
> >         smb_reset_buffer(drvdata);
> >         platform_set_drvdata(pdev, drvdata);
> > -       spin_lock_init(&drvdata->spinlock);
> > +       raw_spin_lock_init(&drvdata->spinlock);
> >         drvdata->pid = -1;
> >
> >         ret = smb_register_sink(pdev, drvdata);
> > diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
> > index a91d39cfccb8..c4c111275627 100644
> > --- a/drivers/hwtracing/coresight/ultrasoc-smb.h
> > +++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
> > @@ -115,7 +115,7 @@ struct smb_drv_data {
> >         struct coresight_device *csdev;
> >         struct smb_data_buffer sdb;
> >         struct miscdevice miscdev;
> > -       spinlock_t spinlock;
> > +       raw_spinlock_t spinlock;
> >         bool reading;
> >         pid_t pid;
> >  };
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> >
>
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

