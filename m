Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A22C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 06:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpX7PUzYRYR+hIB+AthXL3AbBfvOM8aw+cGqJNKoxy8=; b=D0jI3LVtWtuFebwT8HXNDxfLA0
	/pyINB+Ou/deEOkyoPO6r1mjWjxdsNAXCLQqyBr6LZt4x5/m6O8Rj3CSWWujUWeEjOC5a3cF71UQK
	xoLci+VSIX1m+Gzca5a3GF1C+fOJf+qza6VTHhRfUppfvn1aGIXnCxjAeyRMwKFa3yR7RY1w2TZL3
	eGXfBJRzgpFr4GZEJIL2cPYHmpY1fjHdxU0LeCa1Jv3K/hCwswOOjIZjxLLSp+vzjC/MSfu3SsLb8
	gQKMpqr7aY5sin3K8tOhAhG9ryX42hEp9XiebLifceMHTtbn4x2wi3LKZoxcljezzOZ4hW0Ar+reA
	psmEO9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFkc-00000007bqV-39Nv;
	Wed, 12 Mar 2025 06:39:34 +0000
Received: from mail-am6eur05on2061e.outbound.protection.outlook.com ([2a01:111:f403:2612::61e] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFhv-00000007bZ3-41A8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 06:36:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pDNJfzRfZg+i5nHM6btVNUEBuC5QgzW8PHUONP1uwN6mqVPBhhnandPhQnif4wb2GLo+IPnKSo6oDVY67R5sAUp4Mw97j1LqPgPWLXOsra2M4UiJZ8A7QptfCCCe2sUORW9Vyz/hfgF7j1gEl3RoravB2dSL/X86ilZVSGw4iLSC1q5WVhfQCiKAnfJ3sf5ei+KnuF44fprTvBOWsH3LVvj3N9yTWg1zfRU2xGn1P+7dnGU0INK9ITy8pcyCbA5UP/wqK/kQyP8QkKOmE47R6KZ6Ubsl+x2onhs7BwQot0SaFsTD78PclJYNAR7K6YKAoFEOC8Hfjez2sLGIdTeQ5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpX7PUzYRYR+hIB+AthXL3AbBfvOM8aw+cGqJNKoxy8=;
 b=t+ge9BUfL2/mw1ugH2LH6KJUZPW4eiAUhDsxqyFr6pivXmsM2o9PpWMPFaEW1JWyo6D6nMP4e1oO6VDhkhH0syCe8OYfkirGnoeQ4iXGc0kMBOTxkQV5sxNzZNlEEQtQzsoGwBRxvu17ZeUymTd4muaqFy2bxODpx9uXmS/htHmNeIFiyokw6L8AAOp+tOGagOPWTUGwSv4EqMFSCJka0G8kt9gQgths+fdes6sMPyhWicl8zZBES/MKmP+T4kgb4g1aXfXQvFb4QYPfiIw5X5mD+HLpocJ7X8l6LP8ndxANM+HP+LxenokB8fAGTi4ESBizh5YA0RjGwv3NdT+57w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpX7PUzYRYR+hIB+AthXL3AbBfvOM8aw+cGqJNKoxy8=;
 b=qi7KbuDWfJv9rXQ47fZGukSd0neYVvV5+7h0UH20gZq40sAziRmZ60KdDeN6W2wGJZLSDZTJd6RgOQ7aIhAViaHsz879OKXOO+Qef/FY2zcozlL7XVdUYQP6h2btwHKQdnXc2nzZJdb3fCcySW52EzZ3tTdieVqynUCMaZCQ8TI=
Received: from DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) by DU0PR08MB9371.eurprd08.prod.outlook.com
 (2603:10a6:10:421::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 06:36:38 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::d1) by DUZPR01CA0295.outlook.office365.com
 (2603:10a6:10:4b7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 06:36:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 12 Mar 2025 06:36:38 +0000
Received: ("Tessian outbound 8a1969cea684:v585"); Wed, 12 Mar 2025 06:36:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7db86f106617341e
X-TessianGatewayMetadata: 03pNMDyICIZjs3/tDsc75e+PxA60oBSnBR3HEidJATqgSp9gASKwoGEYKmL4yVeKq++ULMYSjerSZG7DcF3+M8gcl3A42U9PaGglXoiZ13Y7leIRr+WeoZI5hCbfOUI8dw5wISdRZa0TbyWaGGQ8DrscSA74OFrnU3oB3frUuL4vxze4dkBCwxTr0/yBQW+s76JIrooBiLX7sksWGz6ygA==
X-CR-MTA-TID: 64aa7808
Received: from Lc9e5bb8833e8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 189B169F-7285-4005-934E-F77039D01788.1;
	Wed, 12 Mar 2025 06:36:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc9e5bb8833e8.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 12 Mar 2025 06:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcjSFh35zbQ4c0szpQgjt0fufHoquixDNLiSxD9gsDL+g0r3nWDCfRlA/jrG6zs/occWGt8V2B+zg2v2AkVUPEsTNv4vqMOMw/b5VVopPQBTn4nZqrE4XnoMm0z6s5tZINERFspyUcLHyoWI4pgKYm562bYd8cMSmp+Xa6NXTTV0y7lM+QTAXPBvet+C5hi8pPKOuVc+JDI9NEpL7hrpk2WJxJlIiuC0Y7CggpHy+lTW5fX0svjScApKCpWVhMBDZsitpBsVCod9wg0I28itNF8bPNTgyZysn9WPf0IceBEg2vzeqgDr9rOH+AeTgyLhnJO3zKpw0v1iXCd8c1a/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpX7PUzYRYR+hIB+AthXL3AbBfvOM8aw+cGqJNKoxy8=;
 b=YoK8+/+uAPEh57SJSsNHZS/Goqfxql/WbxW9hNsCK0poP3t+wvvqZ+3JqXE7TZFFRe7NtgCjokPJquvCjtIjCUAltrD2XoOjx6y4dex3gPWowwghrzcDnfwyjmag1KNZHTKg5LXe+499jMBtBJFHkE+dg4tDrAk43I95k3WFLqMm+Wy0QyrzQJ0SehEgGXFJFCQ3TnQzKvcJxOUrMxBf0xYIE56PjcM1tGBSNKmxZeuBeQxmC343slEeg4oo4LTX6LGHT1roEkfKgDMMsvU8RLn8omAlcrkKi5uwam7HSyt9bmFBvKIPHdgMxSo0bA5IxHnU6hnEhKAkp5a+QwdC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpX7PUzYRYR+hIB+AthXL3AbBfvOM8aw+cGqJNKoxy8=;
 b=qi7KbuDWfJv9rXQ47fZGukSd0neYVvV5+7h0UH20gZq40sAziRmZ60KdDeN6W2wGJZLSDZTJd6RgOQ7aIhAViaHsz879OKXOO+Qef/FY2zcozlL7XVdUYQP6h2btwHKQdnXc2nzZJdb3fCcySW52EzZ3tTdieVqynUCMaZCQ8TI=
Received: from PA6PR08MB10526.eurprd08.prod.outlook.com
 (2603:10a6:102:3d5::16) by AS2PR08MB9988.eurprd08.prod.outlook.com
 (2603:10a6:20b:642::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 06:36:29 +0000
Received: from PA6PR08MB10526.eurprd08.prod.outlook.com
 ([fe80::b3fc:bdd1:c52c:6d95]) by PA6PR08MB10526.eurprd08.prod.outlook.com
 ([fe80::b3fc:bdd1:c52c:6d95%2]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 06:36:29 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
Thread-Topic: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
Thread-Index: AQHbYrq6r5SrhbLvl0KKCTupVv1Yu7NvbKS9
Date: Wed, 12 Mar 2025 06:36:29 +0000
Message-ID: <PA6PR08MB1052667843120D0736A4B574AFBD02@PA6PR08MB10526.eurprd08.prod.outlook.com>
References: <20250109171956.3535294-1-yeoreum.yun@arm.com>
In-Reply-To: <20250109171956.3535294-1-yeoreum.yun@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PA6PR08MB10526:EE_|AS2PR08MB9988:EE_|DB1PEPF000509E5:EE_|DU0PR08MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: df85f273-0120-4ed7-c5c1-08dd61303e1b
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?wWjnMkqWa0iVxuFgM9d9pN6vG9worzR1hyaxIlVO4AJGQwHewmtOSa6RJRbq?=
 =?us-ascii?Q?eRAyZ22KQuI7YRWb5FcnRSYESvIRxdMzWRnlDIP+MIr5zhaFUQvZkeymXkKy?=
 =?us-ascii?Q?0+Hiv5iGYxKDSvb0oEVR/RlzqIFczcg+Ls3H0M2sVQw1cOZXL3LpRlVRX0KW?=
 =?us-ascii?Q?I7HpQpNP17QyhIyzj41AVdZiWp2nhAZAKc/F1GoIwwABv0AkE7FDYZtiNE0G?=
 =?us-ascii?Q?NaHXIikw/OjBTZSPuuvGgOoFgLSVwifyORFPxmthVClJmGWtIGBdNumLM7ON?=
 =?us-ascii?Q?K8+Yj+7G1EZBfotwvR3kd8RW0NgRsgv4oWBX8m9J7CqmW12M9hlA0Y3nXBe3?=
 =?us-ascii?Q?F/OEJ0DocZaBSR47cCEXiWEUb+VQxJdQkCY+G05Sn0y8I/GFzvi+hRw0mbKa?=
 =?us-ascii?Q?nzXThCm37j58caDFakSK6SPnSVJenYZOo3KUroD4mDgXovHwM1mg+eZyenT6?=
 =?us-ascii?Q?CjUXFWB5oNA388oU2dnTM2Q+VN3gYgrckGVXpW2X7oDw0ODkNt4kUrr4r8dA?=
 =?us-ascii?Q?hKhwZkCmiNCKMq7Kdd6NuIbMfPcSj5gmQqPpbS6iJsgXDzk9Gj5ZxheXhKbj?=
 =?us-ascii?Q?dGPY7gMb83xsVuPKMu5gK31usrqNWvUlEGaqWjnRkwLR7Rj30pIeXl41OMZ7?=
 =?us-ascii?Q?EG3fjKKgKURCxaSHfJVWD24T6S1UcKuTV4sqgYjh4Ht41wf+x7yafcIfuxS0?=
 =?us-ascii?Q?lgwxI/SUVTelyG+ptYQKUrqyEVSIVO7Axyt0uZNhvmUtpjZf0nL9MMFe5Mdm?=
 =?us-ascii?Q?1BEIz0Jkjrc6VXb8/9zz9iil7MI4OWjvmdD+UF/Cv4n/vvmxI24jIvAXc9OS?=
 =?us-ascii?Q?eusPNcwdoD5YewdqXYUHNLcF1I1kMiQCfajn4yBsxbca8BZOjowc/r9W3OW0?=
 =?us-ascii?Q?5F3JW8FuNQ8lf3XbnGB7Ca3nsX7pvE5EB438DPTh1RM+59UeZDH7TbnReHjq?=
 =?us-ascii?Q?Fj6qwhPAC+41LRh6HIAoO913tVlWWCOJcrILlwnm+QfqliMGdr7q+/FU/Lpa?=
 =?us-ascii?Q?8/o63YxV9rkrEsmZypqiYgAxLSlg57TK5GR+w2hb8WIjt9mHNMLlaJ0kGXKj?=
 =?us-ascii?Q?fPTsZEvHMuaY8lehr8aN9saeLB5dGAoH5WZwUmU2nr1VvWsy+8XkoVsfZIyd?=
 =?us-ascii?Q?aCRpJcjCPHwxzyx6KdBUVF7aeZmsxCKn9MpprLg2F6ag71ivTeW1/XWHaGyv?=
 =?us-ascii?Q?D0sQrJ19WPiyoQQhEZfm6cVBky5Nwk4JRWvVUDJ9LK54lqpoPRdQlLWXrv6P?=
 =?us-ascii?Q?qFWULrERaCP10t9HUVgjh/tsLZfqIHd5fNLFDSjl7qMzZf40f2NJeGWaY3EF?=
 =?us-ascii?Q?VbVMEXdTUsv7BvsgEwtxYLYr7qYDWh8tcyJM8LizS06IMEcvTNiQgvJbQuZp?=
 =?us-ascii?Q?u80sxB2x2RjuG5CYGfuyPPgUtqvH9z3mZqhF8Z+BbEItyQwEnleaWivaIQ5L?=
 =?us-ascii?Q?V1lSKz4MyUIa+A9ag/PfMJSKZzTsgy2T?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR08MB10526.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9988
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:102:3d5::16];domain=PA6PR08MB10526.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9b42a40d-491a-4439-736b-08dd61303894
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kVFTRAhLmi7ZP0AahqluRdvIy6BOWfJuqY21O+CycZ7U9mBM3z7y7hn+AwaD?=
 =?us-ascii?Q?rUf91/iLiX75KjII86W29wRxbUkX84lfLeTz/EWlsr3FHi89+UOUfAF5AI1a?=
 =?us-ascii?Q?hPmmkaBbbBylGa+QxTeUB5EUBcF/bVZi1s/h7Blns5ZNfuVzppslGuMNUN2T?=
 =?us-ascii?Q?GUz/s+/aNtES/6Z5HF5GLIX1JtCzaOujNPEaIWCB3c4AlBmujTUyeXb6tA3G?=
 =?us-ascii?Q?/Mej3DbJqby30fOWgVZOf9lECcXp9ZVfxs1jQ2C42TwSUaRUo00tsAV3VMBk?=
 =?us-ascii?Q?IyxCxg3pcgssy7lVap6SnlZhvAjr7rvxofR1Y4CbyWq5eelLKurERwnWVUsk?=
 =?us-ascii?Q?IdPkHKEojAsqw12gS8cUzeyfmb2VjfJtcuJt7p+khO4+L0AQfrbsLq9rs9/X?=
 =?us-ascii?Q?R4p3HcfcxapQNoSb+gPMalw6uf8YzlXxdx2fY4630GcI4pBMJMT9JPRonZ9J?=
 =?us-ascii?Q?9RlOp8lkpR9ljURKmthNjwSp9TsqAW7nag7E3j533tfjAPngyvgkCLUV4Chu?=
 =?us-ascii?Q?iHCvCEMtiCoCeslUXC30P6txE3RlYkMuLKFfdjWREAgGbuYFrhjVz6ItA8A5?=
 =?us-ascii?Q?gOu6DxByMOhq31Xq7vcN/yIYks80HYXXB8xeJIUmihig2Cc2xhJaTG12jChO?=
 =?us-ascii?Q?oxS7ybsjxwjd3XujzaNm1yDqjpHhynxJtRS7yZcH5x63ijOS7MWzz6CCWLSP?=
 =?us-ascii?Q?mTwapPiXG2p/pm7C6flmmUhgoMAU2mcLbvoiyWjExwPLaiOpSLAkdUksrJHo?=
 =?us-ascii?Q?xkkXT/Y4eLjc8fKyBuvvNo3X0P/Xz6S5YyjpFlONbSIbyDFDWx8ZZK6NYfPe?=
 =?us-ascii?Q?RM003w5qx0nal4BhbH2TFXgDtmRnNJ3msSMriQYHmTqPTPsl2jjjECcnRijf?=
 =?us-ascii?Q?ieRGN8LRxlcQmSqPVzrU3HTOOUuIRQrVvQL0QojObo9+CRQ8HrwKqHFcCbgD?=
 =?us-ascii?Q?6m+8w0CKkYqQlIeHj8LzyZFi4cmfrZUxWm0t4Be426KffOpNA8sLmqTbQKSR?=
 =?us-ascii?Q?++PVdvKsQlX7AcstfOFCNWnNIaIYKOBgPoxsCX0cEnVyCj46iw2nr+J4MYJ9?=
 =?us-ascii?Q?2ufuDhbmTML4SPa7w2ddbEqfR7F7WlAm003GYhBKRuVbPyLKSmc1VF4GTLqZ?=
 =?us-ascii?Q?bAeUqzQKxJn0j8ScCtaqEmnUFTVsq7LwARGRfO28l6jU3z0ROK1kPG/SlGw7?=
 =?us-ascii?Q?Bt/t8bjp5lWr0BFx5gZFVXlwbE89ojrlP1Xsce1jTfSPLtC8Y7HetWkKoQeK?=
 =?us-ascii?Q?9q8N4J5yd1P0XyN8oAN12ajg4A8js3oMThZ/v+/nF+FBZpLHMjLL7Ulxbl7+?=
 =?us-ascii?Q?Ve1KKAi6WWmG7G0iZaBDuS7GuidMMEpzHCHzFwonHiiEKPY48AvHl6/vGn6w?=
 =?us-ascii?Q?+UjzYjRurcjtfMZnbD4oEFEcU8KbEeY3XHW63Mr52Y6y3nFTTEO49lh4NtVA?=
 =?us-ascii?Q?wztdVzM+IlfqTapPLaWG5eZ43JjUSL9bUHTVc1V3he1ep8URyIIuFaEt8Xkp?=
 =?us-ascii?Q?FedmCoVB//VpZ3Y=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 06:36:38.4497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df85f273-0120-4ed7-c5c1-08dd61303e1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_233648_254947_9431B0B3 
X-CRM114-Status: UNSURE (   7.28  )
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

Gentle ping in case of forgotten,..

________________________________________
From: Yeoreum Yun <yeoreum.yun@arm.com>
Sent: 09 January 2025 17:19
To: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexande=
r.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux=
-kernel@vger.kernel.org; Yeo Reum Yun
Subject: [PATCH v3 1/1] coresight: prevent deactivate active config while e=
nabling the config

While enable active config via cscfg_csdev_enable_active_config(),
active config could be deactivated via configfs' sysfs interface.
This could make UAF issue in below scenario:

CPU0                                          CPU1
(sysfs enable)                                load module
                                              cscfg_load_config_sets()
                                              activate config. // sysfs
                                              (sys_active_cnt =3D=3D 1)
...
cscfg_csdev_enable_active_config()
  lock(csdev->cscfg_csdev_lock)
  // here load config activate by CPU1
  unlock(csdev->cscfg_csdev_lock)

                                              deactivate config // sysfs
                                              (sys_activec_cnt =3D=3D 0)
                                              cscfg_unload_config_sets()
                                              unload module

  // access to config_desc which freed
  // while unloading module.
  cfs_csdev_enable_config

To address this, use cscfg_config_desc's active_cnt as a reference count
which will be holded when
    - activate the config.
    - enable the activated config.
and put the module reference when config_active_cnt =3D=3D 0.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
from v2 to v3:
    - add cscfg_config_desc_get()/put() (from Suzuki).
    - remove sys_enable_cnt.

from v1 to v2:
    - modify commit message.
---
 .../hwtracing/coresight/coresight-config.h    |  2 +-
 .../coresight/coresight-etm4x-core.c          |  3 +
 .../hwtracing/coresight/coresight-syscfg.c    | 55 ++++++++++++++-----
 3 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtra=
cing/coresight/coresight-config.h
index b9ebc9fcfb7f..90fd937d3bd8 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
  * @feats_csdev:references to the device features to enable.
  */
 struct cscfg_config_csdev {
-       const struct cscfg_config_desc *config_desc;
+       struct cscfg_config_desc *config_desc;
        struct coresight_device *csdev;
        bool enabled;
        struct list_head node;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/h=
wtracing/coresight/coresight-etm4x-core.c
index 86893115df17..6218ef40acbc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device =
*csdev)
        smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1)=
;

        raw_spin_unlock(&drvdata->spinlock);
+
+       cscfg_csdev_disable_active_config(csdev);
+
        cpus_read_unlock();

        /*
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtra=
cing/coresight/coresight-syscfg.c
index a70c1454b410..8766f72db33e 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_i=
nfo *owner_info)
 static void cscfg_remove_owned_csdev_configs(struct coresight_device *csde=
v, void *load_owner)
 {
        struct cscfg_config_csdev *config_csdev, *tmp;
+       unsigned long flags;

        if (list_empty(&csdev->config_csdev_list))
                return;

+       raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
        list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_li=
st, node) {
                if (config_csdev->config_desc->load_owner =3D=3D load_owner=
)
                        list_del(&config_csdev->node);
        }
+       raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 }

 static void cscfg_remove_owned_csdev_features(struct coresight_device *csd=
ev, void *load_owner)
@@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_device *=
csdev)
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);

+static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc, b=
ool enable)
+{
+       if (enable)
+               return atomic_inc_not_zero(&config_desc->active_cnt);
+
+       /* when activate config */
+
+       /* must ensure that config cannot be unloaded in use */
+       if (cscfg_owner_get(config_desc->load_owner))
+               return false;
+
+       atomic_inc(&config_desc->active_cnt);
+
+       return true;
+}
+
+static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
+{
+       if (!atomic_dec_return(&config_desc->active_cnt))
+               cscfg_owner_put(config_desc->load_owner);
+}
+
 /*
  * This activate configuration for either perf or sysfs. Perf can have mul=
tiple
  * active configs, selected per event, sysfs is limited to one.
@@ -890,22 +915,17 @@ static int _cscfg_activate_config(unsigned long cfg_h=
ash)
                        if (config_desc->available =3D=3D false)
                                return -EBUSY;

-                       /* must ensure that config cannot be unloaded in us=
e */
-                       err =3D cscfg_owner_get(config_desc->load_owner);
-                       if (err)
+                       if (!cscfg_config_desc_get(config_desc, false)) {
+                               err =3D -EINVAL;
                                break;
+                       }
+
                        /*
                         * increment the global active count - control chan=
ges to
                         * active configurations
                         */
                        atomic_inc(&cscfg_mgr->sys_active_cnt);

-                       /*
-                        * mark the descriptor as active so enable config o=
n a
-                        * device instance will use it
-                        */
-                       atomic_inc(&config_desc->active_cnt);
-
                        err =3D 0;
                        dev_dbg(cscfg_device(), "Activate config %s.\n", co=
nfig_desc->name);
                        break;
@@ -920,9 +940,8 @@ static void _cscfg_deactivate_config(unsigned long cfg_=
hash)

        list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item=
) {
                if ((unsigned long)config_desc->event_ea->var =3D=3D cfg_ha=
sh) {
-                       atomic_dec(&config_desc->active_cnt);
                        atomic_dec(&cscfg_mgr->sys_active_cnt);
-                       cscfg_owner_put(config_desc->load_owner);
+                       cscfg_config_desc_put(config_desc);
                        dev_dbg(cscfg_device(), "Deactivate config %s.\n", =
config_desc->name);
                        break;
                }
@@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct coresight=
_device *csdev,
                                     unsigned long cfg_hash, int preset)
 {
        struct cscfg_config_csdev *config_csdev_active =3D NULL, *config_cs=
dev_item;
-       const struct cscfg_config_desc *config_desc;
+       struct cscfg_config_desc *config_desc;
        unsigned long flags;
        int err =3D 0;

@@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct coresight=
_device *csdev,
        raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
        list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, n=
ode) {
                config_desc =3D config_csdev_item->config_desc;
-               if ((atomic_read(&config_desc->active_cnt)) &&
-                   ((unsigned long)config_desc->event_ea->var =3D=3D cfg_h=
ash)) {
+               if (((unsigned long)config_desc->event_ea->var =3D=3D cfg_h=
ash) &&
+                               cscfg_config_desc_get(config_desc, true)) {
                        config_csdev_active =3D config_csdev_item;
                        csdev->active_cscfg_ctxt =3D (void *)config_csdev_a=
ctive;
                        break;
@@ -1097,7 +1116,11 @@ int cscfg_csdev_enable_active_config(struct coresigh=
t_device *csdev,
                                err =3D -EBUSY;
                        raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock=
, flags);
                }
+
+               if (err)
+                       cscfg_config_desc_put(config_desc);
        }
+
        return err;
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
@@ -1136,8 +1159,10 @@ void cscfg_csdev_disable_active_config(struct coresi=
ght_device *csdev)
        raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);

        /* true if there was an enabled active config */
-       if (config_csdev)
+       if (config_csdev) {
                cscfg_csdev_disable_config(config_csdev);
+               cscfg_config_desc_put(config_csdev->config_desc);
+       }
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


