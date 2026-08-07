Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C86C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7YUN3acSudzIiV+nemfJRyQohopopchH4wYIZSGQ/4=; b=ozFIetFVf/ssD0xS0wgLnDBWo9
	FT1mA2sBjfRZtEhi/DjqQh6gaQcD/hvtNyi3lQYYtGp2y3UmTwKHCFfSgrHXy/GLUCKqWCLA7TAsT
	v0J9YFhsZsiwRGjDVcPwI+p4RE8DqJJDxcBVlhC9iqdoe6d7+3/3hXhYzMsG0KZNUDFPEj7MWJgqU
	jgd6L8vncFWWwlR1hcWpkHwzVslNrStzwy/n42h3z4usOONmYoinV2BQvqXyH29HLN6kg9/CsIiS2
	QeKeBK1Bf+ub1bc2edW0rQCAo5cOrf2IQU/9WJPJ5IEOQ3L+a59Nz61uN+zsIPvaRlJ0wqYMVNivX
	hHVIZLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHKm-00000007ZQe-1Vm6;
	Fri, 07 Aug 2026 09:57:48 +0000
Received: from mail-westeuropeazon11010048.outbound.protection.outlook.com ([52.101.69.48] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHKh-00000007ZPd-2Ot5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:57:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=atNgpxF6fwW1b7JuRvCT1IbinrfaEFdfRfkLkEaFinQo0IiWfAOP2890H7I0s2iXzb5/NfITinAEBRMu35gO9oreV3DaZntLOfCF+A2s1l78u5DC5dJDJwJqAicbTmnKjofavJ6sWUtz0JqBCI2ErSZhXQaSynk1bLdftaCzLrYDe8UBGQyjRYm+sxOMffrRXub0ntROGmfss0uS/GMUtiDiOrz0BARXAlNfCVgqQpiSw1u1lhGK5Wul4DhInqalfMQ3lxQc7YUC/jya5szdWmuiiTkR/YN9w9Y0SpElc83uQ6aBWQ8B+FZMS7iIo38tkIZZlvAECmTSSkDTYKoHvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7YUN3acSudzIiV+nemfJRyQohopopchH4wYIZSGQ/4=;
 b=X6n2fbZU0p8kLfE9vslR/u7bAcsk+ZatmR4sJlNCONoT+Y3ysgVXYSXRmKG76SBJ78CuaEo6AGPnkdWA6voGDGstLCximIAnrSt4V3R3i5MFWbk2PlBFyfmMyj7cQeN3WhYolCNFQHt+bnZ/Ois4qtCAQNOpLr5Ew6cKikPKkfdK7svpMA0EgHa13y5RqhUWYnWLk8/apAs3A7auCqql0Z7v/qQxjW+dDIBad7WFXA66fjfigzcOBKjeUWhhVmZ1O/aFl1iqu6GD9cbPTZsGOelNsUeNSYTYeg1EFKzo+7VDDSXj5VpQZAxsg+NeLew6Yej9VRpx4s+e9Ei/N1UIcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.dev smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7YUN3acSudzIiV+nemfJRyQohopopchH4wYIZSGQ/4=;
 b=c6BXxYgc0wVe/EC0yL5EbRPpC/TsNTcFgFxGBE+pfXMxCLgnsjL+I7BVAPe06oUdg+ty/iH4I6adFd9OWsbduP0IoqnO3Khnl2zayELacZOEkcReYX1gvkvhdOqXX0/dXIF8TEfrM8AksHBv9Hb9TvUTSKWmWT5BBk1FbGoc/5E=
Received: from AS9PR05CA0247.eurprd05.prod.outlook.com (2603:10a6:20b:493::11)
 by DB9PR08MB6396.eurprd08.prod.outlook.com (2603:10a6:10:23e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 09:57:34 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:493:cafe::65) by AS9PR05CA0247.outlook.office365.com
 (2603:10a6:20b:493::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 09:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 09:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXYrmQ57j767J36O/1wO2bYtiYWkZEgfnV0vnm+YNxKRZ2VjPRLPi2exO+obS4HKxfGYRxffFHz63SrjS6PHyV01moAixgZZYWzigXBIoFx5Xoq1MzKmWdwCdwjXXoe+iIhiYmQZeJJ7wqjRNGPYmIqdtBsxZrq5KjZfwpEAXr9r3/Z8aZww9fdiaL5orym4EILq8+eWUhoDAlmzzIyT5UPEr8vPYN7/73LG+1CvYGmuiWpsqOCwhIhMQjFT1BrC/JwWCbuIQIDKtUePk0fI9miLSGkPTS6vCVfpYPw3I3nHxrMHnm1aPReDH0AJGwZfM6Pszyw9e3oulcVJynjdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7YUN3acSudzIiV+nemfJRyQohopopchH4wYIZSGQ/4=;
 b=XTkmPdi7Yx3Sg8r0/7gBejMesgY2qRPvcnXOl+jk8+2ZukJeerP9cRWa23iSwPmNGqAMLJQQU3bAqBnKvOEinWOprZxTkusHBgx1iNbo0+5sYVh9zcAah5y/xnPmc18mqtmbCVF9dnJlpqFQKHh7Q/+3FWz+IEzZp7JeI58fZZusZ7BqR+l8bCQaC6Z7gEBC5Iv9drkIInsXt3jV3O1PulG36585UA9UUhEVmilIR3TOvESb28SsU9f8lShyp0/3Syt1Q7I9Ct0RVPWVKcpXg+CFbP17zBVhj6l0Qe5j+MwkNtSMHalK19Jkzy43D6h0BgPJAiVGuCby6UMDcZnLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7YUN3acSudzIiV+nemfJRyQohopopchH4wYIZSGQ/4=;
 b=c6BXxYgc0wVe/EC0yL5EbRPpC/TsNTcFgFxGBE+pfXMxCLgnsjL+I7BVAPe06oUdg+ty/iH4I6adFd9OWsbduP0IoqnO3Khnl2zayELacZOEkcReYX1gvkvhdOqXX0/dXIF8TEfrM8AksHBv9Hb9TvUTSKWmWT5BBk1FbGoc/5E=
Received: from GV1PR08MB8428.eurprd08.prod.outlook.com (2603:10a6:150:81::5)
 by DU0PR08MB8065.eurprd08.prod.outlook.com (2603:10a6:10:3e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 09:56:55 +0000
Received: from GV1PR08MB8428.eurprd08.prod.outlook.com
 ([fe80::9b97:c973:3308:5ba7]) by GV1PR08MB8428.eurprd08.prod.outlook.com
 ([fe80::9b97:c973:3308:5ba7%5]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 09:56:54 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "fuad.tabba@linux.dev" <fuad.tabba@linux.dev>, "maz@kernel.org"
	<maz@kernel.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"oupton@kernel.org" <oupton@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Joey Gouly <Joey.Gouly@arm.com>, "yuzenghui@huawei.com"
	<yuzenghui@huawei.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"will@kernel.org" <will@kernel.org>, Catalin Marinas
	<Catalin.Marinas@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH v1 1/4] KVM: arm64: Validate the host-provided vgic model
 in pKVM
Thread-Topic: [PATCH v1 1/4] KVM: arm64: Validate the host-provided vgic model
 in pKVM
Thread-Index: AQHdJYrhm8gMT+mVykqpQbRoHfVCP7aSWw+A
Date: Fri, 7 Aug 2026 09:56:54 +0000
Message-ID: <6a92d2e40a2195099eed90179efa286295392e39.camel@arm.com>
References: <20260806100256.371164-1-fuad.tabba@linux.dev>
	 <20260806100256.371164-2-fuad.tabba@linux.dev>
In-Reply-To: <20260806100256.371164-2-fuad.tabba@linux.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB8428:EE_|DU0PR08MB8065:EE_|AMS0EPF000001A2:EE_|DB9PR08MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9bfc75-2454-4793-132e-08def46a4deb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: DgyPS57bo4DqdpnX4KKgXLGaIMFDLLM9Q0r3DG2ig3W3YKp8UcxL2TcIFSD4gCeLfjSymVXmX1xd/8pb8/gupokG7YKFYvA5M+umHuLDc+jDyRBE6LbJnUookVezJREgvL94MMisdcT04a59sOJuh2Ijgr8pImhqvcX1iI6akL4OCHOPKO5WHav51I49hnSROLHAcBIpSnpddgqixWi1f0kMpC/Xx4Y0zntpcOZnhcfV3OXBcf14e8UPz4XTT0hqkTubYyHlANjSa3tlihN20EdL3QhciQkghokgZBur75OhGncPHlWqrJ0Yk+5Jv4vC24k5vDMfioVrgboEiaQi9KfU0zl+x7ttJHSYEQL9pn6YRpcvbDQJIZRrXiNtOFH/IsRvW1xLf5PeO+6D9jG1qmkD04inuqrZYfgB/oKFZYje5oersw2SKZYfyYlJF8L2z/B1e5eEKGPMEAGaV23mqc9J0bT8LW3s6ZMOfIILygEMcUu2m6s3vX/FueeuMzTgPgf0baXJ5Ad3OtTwFUe/nXTwbHwAG1S9KUyZFiO/O9Mz9ACBCBskWBnwfqyRv/3VRbaqTkf9dUuNA+nbOJ4Z8xwiGLwUAuE6bGvze0Y91qCbXmYqL3crKJS02ShNloh7jg2veJszc5HffkB8CKQ/9HM+ai5N7prVcTZOORcc8PQR142Auu/tCw2X2YUt1CvPLPUq2jnDrMRNEYsFZ+2AHL79eneNUOKeMQUrQNHSywY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8428.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E374BB3768CA3F459C6067744463B74D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NHcMWb8/0/K+EHHQV6zGXn/7/dIvzvK3wjcwX8HrFJMURYuoX1mtaheyrVmnO4IYfXZrM55XG8Ta8/ruEzYtzNf4VoPG7rWwFl02nUMlWshSJLeE+Nm8B0UtVDwDeoxcAN7IpFmrl+K9oeL5FdZlvIufz+U1WKBwap4irYUUC7jX+Vew0q+IyPxWxkPc7uphGrtJ7yjUkxIG9XhGYstHViciWoV4UxBFqKQnedvccARrAkCmg4VRF7di2e6MGB9ijN7TX6TFKfFczNWYyMWz++P/3qtPDsIDl18uAc4Rhnbk28j2pxsx/9n8oKAL+OnZqvBPqf/HOpPI5Ji6MDuN7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8065
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a9cdd601-a1db-4afe-e5ac-08def46a3657
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: ftrlFa/y877JukX7+BW/UQo5rDkBTFrYN8sH86zsgDKdNiO7pgMnZ7LDSQ8FFqIWwIKJ1m9eRqWRmWdjFGuHg1xRQ+rQMJNrfhGZPbDkvSt0+EMHfMDt0kVlYK0KPAIVClAGbtasW0uPofY2S4Ltzp7qEFSr/u5BATFvJs9VHLY+uGIecFjfwtSKdElnG8Gz0li6/W/UyB4G2ddbxX6H1N1Lz6CvAzxMbLtpycpDAk4iVs8Ie4oR5tqVkXNdBrccKfX2hsqnLWJ2a/0E50tjCF/RIy3PD/slCThpTKYrywWo2d4nNfVU0x9YuJA7fEtdWfEt8vaWshJmd+r7ikWur4XcqzB/c+bVI20jhazEOFNOwI3DV+A6JktoVKKb2yKWjouezFiF1tZHlZRtNuoJVem+NA4GCsaFPmBtxOvChEOCPjf/tmRw6lwcHblnQl7ghp5bG6h6YlDkj9Xt0D6jlpSlGlCCgPDLF6VwLQ2NGK9lI4Taq7WTWVRsAD63LlgZqLNjtXqR7ZbZSvxII4RMUNxBT/2HxnwZZpPDUC2ZlQAgTf1GSGN4nkVWE1fJWZrShSqP7maf2K/GihOEaEcXekyqoXDBAXNRbQQDl/BSo4OrcNjc7C7oQ8tZJoQ7aTIXrhTnzjh6ZFxRMm/8yes3RNPoNcTRVcPAgiiO+ao0fVtT9NAIH9hswHd6LiOX4VubWshQ+q2/KhQSz548KQ/w6A==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XaqWxTfW9Scmm9sq6unmO1PpmhYwByzH7K30i2QgZo6OvEeKvvUAaPkaBlvWq9mWb2mggMhQNO+LCK0snMuyPnpn3P8t+EsCSLAgEM1GYvqNmfZkL1k4XXzjHc0eKmnCYANkjTt7XfWhaL/uxQW4vZxe4hpMH1rqCayF56ZmHF5761YMXCgceqgd+AaIzoemsAh4EV7cuvGjRInJsq+Mj4k1/qIrobqOvJB44CqF6WUP0q+K4UAENX7UG3unbLeLiOCq8DbpQDeXklUO3oRNmYRKxExnQECazx2TNl/6kSC6r0LzwYudooen6P0moPCM49QorPuw8inFPES2W5gV9/Ons1MOwXrEW/AWn/S28zjhYN4zZDOlJEfZjhTAkvpzd5F/E17VX8eQxW4l9AlrivPhvDdV6JVqC6o62650krU6PiE05cNeTXxFzFtjNx7z
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 09:57:34.3235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9bfc75-2454-4793-132e-08def46a4deb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_025743_865060_F777E58A 
X-CRM114-Status: GOOD (  21.77  )
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

SGkgRnVhZCwNCk9uIFRodSwgMjAyNi0wOC0wNiBhdCAxMTowMiArMDEwMCwgRnVhZCBUYWJiYSB3
cm90ZToNCj4gRUwyIGNvcGllcyB2Z2ljX21vZGVsIGZyb20gdGhlIGhvc3QncyBzdHJ1Y3Qga3Zt
IHVuY2hlY2tlZCwgYW5kIHRoZQ0KPiBuVkhFDQo+IHdvcmxkIHN3aXRjaCBkaXNwYXRjaGVzIG9u
IGl0IHdpdGggbm8gY3B1Y2FwIGd1YXJkLiBBIGhvc3Qgd3JpdGluZw0KPiBLVk1fREVWX1RZUEVf
QVJNX1ZHSUNfVjUgbWFrZXMgRUwyIGFjY2VzcyBHSUN2NSBDUFUgaW50ZXJmYWNlDQo+IHJlZ2lz
dGVycywNCj4gd2hpY2ggYXJlIFVOREVGSU5FRCB3aXRob3V0IEZFQVRfR0NJRSBhbmQgcGFuaWMg
dGhlIGh5cGVydmlzb3Igb24gYW55DQo+IEdJQ3YzIG1hY2hpbmUuDQo+IA0KPiBBY2NlcHQgb25s
eSB0aGUgbW9kZWxzIHBLVk0gY2FuIHJ1biwgZm9yY2luZyBhbnl0aGluZyBlbHNlIHRvIDAuDQoN
CkNhbiBwS1ZNIHJ1biBWR0lDX1YyPyBTZWUgY29tbWVudCBiZWxvdy4NCg0KPiANCj4gRml4ZXM6
IDliOGUzZDRjYTBlNzMgKCJLVk06IGFybTY0OiBnaWMtdjU6IEltcGxlbWVudCBHSUN2NSBsb2Fk
L3B1dA0KPiBhbmQgc2F2ZS9yZXN0b3JlIikNCj4gU2lnbmVkLW9mZi1ieTogRnVhZCBUYWJiYSA8
ZnVhZC50YWJiYUBsaW51eC5kZXY+DQo+IC0tLQ0KPiDCoGFyY2gvYXJtNjQva3ZtL2h5cC9udmhl
L3Brdm0uYyB8IDE2ICsrKysrKysrKysrKysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2t2bS9oeXAvbnZoZS9wa3ZtLmMNCj4gYi9hcmNoL2FybTY0L2t2bS9oeXAvbnZoZS9wa3ZtLmMN
Cj4gaW5kZXggMjRkNmYxNjQxMjlhYy4uNTliYjE1ZWZkY2E0MiAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9hcm02NC9rdm0vaHlwL252aGUvcGt2bS5jDQo+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL2h5cC9u
dmhlL3Brdm0uYw0KPiBAQCAtMzQwLDEzICszNDAsMjUgQEAgc3RhdGljIHZvaWQgcGt2bV9pbml0
X2ZlYXR1cmVzX2Zyb21faG9zdChzdHJ1Y3QNCj4gcGt2bV9oeXBfdm0gKmh5cF92bSwgY29uc3Qg
c3RydWMNCj4gwqB7DQo+IMKgCXN0cnVjdCBrdm0gKmt2bSA9ICZoeXBfdm0tPmt2bTsNCj4gwqAJ
dW5zaWduZWQgbG9uZyBob3N0X2FyY2hfZmxhZ3MgPSBSRUFEX09OQ0UoaG9zdF9rdm0tDQo+ID5h
cmNoLmZsYWdzKTsNCj4gKwl1MzIgdmdpY19tb2RlbCA9IFJFQURfT05DRShob3N0X2t2bS0+YXJj
aC52Z2ljLnZnaWNfbW9kZWwpOw0KPiDCoAlERUNMQVJFX0JJVE1BUChhbGxvd2VkX2ZlYXR1cmVz
LCBLVk1fVkNQVV9NQVhfRkVBVFVSRVMpOw0KPiDCoA0KPiDCoAkvKiBDVFJfRUwwIGlzIGFsd2F5
cyB1bmRlciBob3N0IGNvbnRyb2wsIGV2ZW4gZm9yIHByb3RlY3RlZA0KPiBWTXMuICovDQo+IMKg
CWh5cF92bS0+a3ZtLmFyY2guY3RyX2VsMCA9IGhvc3Rfa3ZtLT5hcmNoLmN0cl9lbDA7DQo+IMKg
DQo+IC0JLyogUHJlc2VydmUgdGhlIHZnaWMgbW9kZWwgc28gdGhhdCBHSUN2MyBlbXVsYXRpb24g
d29ya3MgKi8NCj4gLQloeXBfdm0tPmt2bS5hcmNoLnZnaWMudmdpY19tb2RlbCA9IGhvc3Rfa3Zt
LQ0KPiA+YXJjaC52Z2ljLnZnaWNfbW9kZWw7DQo+ICsJLyoNCj4gKwkgKiBQcmVzZXJ2ZSB0aGUg
dmdpYyBtb2RlbCBmb3IgR0lDdjMgZW11bGF0aW9uLCBidXQgb25seQ0KPiB3aGF0IHBLVk0gY2Fu
DQo+ICsJICogcnVuOiB0aGUgR0lDdjUgd29ybGQgc3dpdGNoIHRvdWNoZXMgcmVnaXN0ZXJzIFVO
REVGSU5FRA0KPiBhdCBFTDINCj4gKwkgKiB3aXRob3V0IEZFQVRfR0NJRS4gMCBpcyBub3QgYSB2
YWxpZCBrdm1fZGV2aWNlX3R5cGU6ICJubw0KPiB2Z2ljIi4NCj4gKwkgKi8NCj4gKwlzd2l0Y2gg
KHZnaWNfbW9kZWwpIHsNCj4gKwljYXNlIEtWTV9ERVZfVFlQRV9BUk1fVkdJQ19WMjoNCg0KV2h5
IGFyZSB3ZSBhbGxvd2luZyB0aGUgdjIgY2FzZSB0aHJvdWdoPw0KDQpJbiB2Z2ljX3YzX3Byb2Jl
KCkgdGhlcmUgaXMgYW4gZXhwbGljaXQgY2hlY2sgdGhhdCBibG9ja3MgdGhlDQpyZWdpc3RyYXRp
b24gb2YgVkdJQ19WMiBpZiBLVk1fTU9ERV9QUk9URUNURUQgaXMgc2V0LCBzbyBJIGRvbid0IHRo
aW5rDQp0aGF0IHdlIGNvdWxkIHJlYWNoIGhlcmUgd2l0aCB0aGUgVkdJQ19WMiBtb2RlbC4NCg0K
PiArCWNhc2UgS1ZNX0RFVl9UWVBFX0FSTV9WR0lDX1YzOg0KPiArCQlicmVhazsNCj4gKwlkZWZh
dWx0Og0KPiArCQl2Z2ljX21vZGVsID0gMDsNCj4gKwl9DQo+ICsJaHlwX3ZtLT5rdm0uYXJjaC52
Z2ljLnZnaWNfbW9kZWwgPSB2Z2ljX21vZGVsOw0KPiDCoA0KPiDCoAkvKiBObyByZXN0cmljdGlv
bnMgZm9yIG5vbi1wcm90ZWN0ZWQgVk1zLiAqLw0KPiDCoAlpZiAoIWt2bV92bV9pc19wcm90ZWN0
ZWQoa3ZtKSkgew0KDQpUaGFua3MsDQpTYXNjaGENCg0K

