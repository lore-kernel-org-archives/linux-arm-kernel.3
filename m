Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE03FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxfBMiJAVszFzXJhUB89V+sCYs2b/JPiu3Ew90T+i14=; b=1zXFGiHZjbh2Prsb1hgYOneu/d
	Qw+zI7oaSfSuhar328t4JiXPxKgj15bOCuFzQ0qPF7eBGCw3hOnunP3te/NWKpu88xWRfVPH0/FZT
	MeZqtlD0nY5cDHmrEeNp75jC+6GUVN5190ma93Z/66se2nXEtEhuiG5U51wI7BviCO8XHX2eh+pui
	A3+A0l/z6VhN+fvYoZ6OxHxKRzgQVSJcOFmQtgwe8esMv/IyCcP5wzFtO7OqGtlAS4Hlfz3O7eO/k
	7FfuljOuYJewpuq3Ql3CBNTO4SU9X41T40v9oz9BKNCWIzA8yx1tQUhoYAemkWOzM5b3YOEErloWF
	xOFTaZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOUy-0000000HH3p-32By;
	Mon, 27 Apr 2026 16:07:52 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOUw-0000000HH2i-2Haw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:07:51 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v9gPLMKfl4XMvT4DCD3ORd5eXceumW3Zo0KHE6aHfjLB6R6vb2iXqbnINFQAhrJhbSph6Qb1C1TzKmmLvP+UdR+TQSEjNotZiRrts9k9DBDMBiJFYH+BQp2W91VrxK62hdvcl/TxDCxaoZOxEf5YN7pjv8Wz6BsI7npwND/SqvFo2U6yW/Bhem6xYs0kicukMer8eMhRgT7RScpxa+qKDbXy0Ef3jOA3Fj6lUajngQLeLjtpQUmRMjivPuslCXg9WtJsehJktuBLtWz8Kwq4FWWsIapAvUdaWiIVUx2f/rRirkqhnsU1bvx84zbWovcwK3nk5CrdfWbDOPE0bMZZKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxfBMiJAVszFzXJhUB89V+sCYs2b/JPiu3Ew90T+i14=;
 b=TnaJ/ykc9R4uJ39eMpZVK25+TqIGI/eW8AJz0ubvfC2iqJ39+1NJhrWwRXuc8CRhMyUhEDnR4rwiiOYLAvqE7SM5h6IiZEOqPvwtbCjzrjAyEYH7iVIBP7uNh4WnsBXJpMkwaI/F1tx7075/ZzTX7AMrn8HpB/Igoq1ODqpHgfAa+Dm8zPmWUv89Vj5ZXEW22uwh7sBuPuiNOmSgpDfy0iRtrV1BenaxIxZEFBlLADtiZpunKXPhyz3PfOBvd9/jfO2lTO2UYIP5DsC+hkDHsQW5PhJt7QYoTDQHZuZyEB4VKkGgk2GFmF2PubaWIDSQWnC+ip3n6X+xxDNK/WcZlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxfBMiJAVszFzXJhUB89V+sCYs2b/JPiu3Ew90T+i14=;
 b=cRcSFzA67FfwwOw/d2nEp27o8kDzO2gVvWebWd9ijubowcpHvsb7X0AD9rvn5eovAkcdhj1zOm6D854mSeCgJC9UBJSJvViGAoDFdjv3UEuPT9tM3DLXrcLBUZ/cjRTN3IuTUeNW/io7wrJfxysdW+DaAEUG0L9EtPlqNfjjfQk=
Received: from CW1P302CA0024.GBRP302.PROD.OUTLOOK.COM (2603:10a6:400:297::13)
 by AM8PR08MB6451.eurprd08.prod.outlook.com (2603:10a6:20b:315::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:07:45 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:400:297:cafe::90) by CW1P302CA0024.outlook.office365.com
 (2603:10a6:400:297::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 16:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EplZP8MBOkWpi0MzagJlm73CJDEL+HD6bX/7ZN5TP0bNmKVSLruKgB008w1ehB+Mv8VURGJRJAldmYmDosWkyqz9+boJ217d6EfzzvqDcc0mPsMsPWEheylTuBn2j2Zy4bvcpEoZX0cgvwTjpWlRcNzpnEYeXw7iicQIZC4clienkX20IPgmuMcKrodlUpExGfzb97NauE3picCOiD/gPvmSXjf3TjecSzqZMZSFkASQ8Zi2WFm5bzOTOvPjSRDU/asZEJZr5r+MEokkSozm1RH9V5QOPKXbdtOdZh+QXDMZvS27u6QKHql9zfMl12Zh1Wo+Wv1442cFAoSfSxJKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxfBMiJAVszFzXJhUB89V+sCYs2b/JPiu3Ew90T+i14=;
 b=GVl7H+e9y2p7AFEfFH50nTgkG0VejZeb3DQau2vLimKgCLmKl/oGLkT8Qt6/tBwJX50i5WtamWcbulKV8SMhhGRNemuUL7WMKod/ZyTj2I9ORZ3l57iCvSqwMl+dYjYs+nVikgEkdudU4YEnpyDfsWEwBZmeGdK0nWon0n9aYygO5j1PNlPWvsXH4RKs5gUuZ8yeMY0HSyZKFuTGqG0Ebs62Y/3f9H7WpJEYZo8AzwT9Hr78qFJCDw0xoJbHFSjo8VzuluFXP3/J9KEBvbqPfVOki7U9SICuIz3wgVlqgFETJ5G7ynZC3iLVne0+sreT7NNj8VmIJuT7MMeaWsZyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxfBMiJAVszFzXJhUB89V+sCYs2b/JPiu3Ew90T+i14=;
 b=cRcSFzA67FfwwOw/d2nEp27o8kDzO2gVvWebWd9ijubowcpHvsb7X0AD9rvn5eovAkcdhj1zOm6D854mSeCgJC9UBJSJvViGAoDFdjv3UEuPT9tM3DLXrcLBUZ/cjRTN3IuTUeNW/io7wrJfxysdW+DaAEUG0L9EtPlqNfjjfQk=
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com (2603:10a6:803:7c::10)
 by VE1PR08MB5792.eurprd08.prod.outlook.com (2603:10a6:800:1a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 27 Apr
 2026 16:06:43 +0000
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba]) by VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba%7]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 16:06:43 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH 02/43] arm64/sysreg: Update ICC_CR0_EL1 with LINK and
 LINK_IDLE fields
Thread-Topic: [PATCH 02/43] arm64/sysreg: Update ICC_CR0_EL1 with LINK and
 LINK_IDLE fields
Thread-Index: AQHc1l/WaeE7F8N/vUymI4g9rL0HUg==
Date: Mon, 27 Apr 2026 16:06:43 +0000
Message-ID: <20260427160547.3129448-3-sascha.bischoff@arm.com>
References: <20260427160547.3129448-1-sascha.bischoff@arm.com>
In-Reply-To: <20260427160547.3129448-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3408:EE_|VE1PR08MB5792:EE_|AMS0EPF00000199:EE_|AM8PR08MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 917e2f14-5f06-4460-7bca-08dea4771ec5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: rRI91s+MBKS3vYbfEg/poMxCtt4xaum5pwS62ttpqzp2yTIA0eG0OcVxZ6sA03fvmO9yFEizeBbmaA0buMAOZW7wZOpSS6B6SrNLcbVxO0LV5CTb0TvMstCj0hqQOX7ctuNeWB/4HvmnTOuz1hkPrsm8iXI0+57Gw+yUpakm+TmihuKOdaR5rdaExa3g3MonRJVg0+gPw7cay9HWv1EzQUMUGMsHYeF+Zie4AAZh5uptK/PEePRBwib4Ha1HFhMPFTkEln3j7fTMfc5Q9vos1lMoPZjCVQFYU/c15fV5zK0eF7bw/db/vPiiIcIs5aXEIhkPADYV22JVig3lENMYgRNWzZCsLrEGqv90OhQED5Od5g2RICXBgYqO8/74MoxDgPaJ2QDpm4qjoAE/ynGXtcr56M/citHlLw3OL5q3kIp5R3DtgmXsGKo1lhKdkoTAlVmPDgRPzhZvw8JzsllM4dOo0l4kxZoWav6C+j4iEu+LGwwY79oYV10jwwCoCFLW+u3E1+vonRkYtzk7z8Y4gTSDU3jIBETcS3xWlLy/JkKoAfxPf/Z8RZ0u5dyy0/s9sHdxfIuIISZCi9t5uLw7gmtGHhgdqNI2ru7/A/LjG7/GKnj+7QjeW5QnOOR0+0l+typkGYihI+KYlPt3yaoF6dNdybCdFT8AdrbrCQfEQ9foZnNqXCKxghleHnGt9lvTF7xiTv0vyYkszgIkaozZfRNcSydhTA5ozOSInlGJ1vg9a2BE12F5V44hy96Gzngf5MFEibv97A7v1ACZXFNB+q3pb3erci5MYL5tUP5Hp3c=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3408.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KI1kYy2m2WI0svlZDxUimqNXMDx7z5rAy2F1X7kkxcd6bg3evKjiUcV+3pMVkSVzRNqfDdjJK2BE7vq5dEaR2qHD9M+qk1ZdQ8bQz/GpM4GgGDOJ5XxnB8E3S0roRvodVS8TptNCZk7aDczf8TCXcDsSp8SkyvuhSrtvaNMdv1XRjrhNaFruhVKHWlWIQTHRMxWBJv22cSqQfV+2I3a1424bPIFVtpd0l+twqLRQ389R5GXI5gJn6HBAyqDNC14gufSM2alDqS7B+N0yDYIkdai5g74u+0DcNe6rOm6cjYs2ovRTLWXHpt3hqnFFz/ypeVdWiUKTfPrz2XvIf2XLtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5792
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 90164e41-fe2c-49a1-47c6-08dea476f966
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|35042699022|14060799003|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 9hPQk6510nKr4IWhKGBadHBUvRi/aAc9NRUi02WTVEmRp9QHrD1ot2a3tDtUhF9NMqmYXDIHbTUSBPTg8XyZT3ms4CDyoiIP7lasKK2JLIiB5YS3I9LNR4R9J0d1UbSF77gcmmprFcpBBOHfw6zJi+tqTrbXumah9Zi8grLi7eFNNHQ2mRRRnfu9qVlLh/7L3SkB7BPUNmFV/wB4jOkQXXikRXL49oS5zlfJl5SzbmzqidIjhDivCh36/IVUu/kcYnj/K/1c7I/RzgiG29W5T/4bliEKuxa0qqfAGJj/zfTmHV+COY1tiFZBfCO7KClgvKXq6ksn1DVbJMZAmnLM/s47u96QPbN41jZIz0VHMQKR9UTFAP19f6wivhoDRJu7rMmBIWRLURRksr3tjGr310kNMx9MbP8IuHepTMWGRZHm4ozW7Izy1vco+KAoSTM7gBedNM9e2Z3B8dW4S3ld6hgs4Uev4xHQXNdsdTIwFzw09n5e5/YTyWJxaY2yp22P8qH5ddZ6sQ+IuiVxMnUlrX/7hP3JnBhmbio7hiT5DTk65VMjPEKqmkGosMxptamcF+clpXWAkfCHNn1q8RvVTUJVJt/45FCUZf9fAp34zBxVCeYQxViMZH7AaMCpi2HFGtIdxHsR3iEpBumlol6kvhJcBuhlJPtBBGSD7Zpyqjhl6VO7nPUqHfkBMAAG+bchBkBpMgqaEaY4Kbn1Gavu03+pTEGje+GIGjI/a8n1h/V3R0hc4ya9YFwKKmjYeh9nQgcpUmFWBrTigbr3rvr9RQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5xAycUtbmt2UVYsVyoQMjk1YULm9RpBFTdhEJ6VZdoQBr/nhiou1Iuv7IdkY8U3gbQvzdQkaGrUc14t6q4nD2KCYgERjvbgR1CiXw5GCiWUz7lQMgAodcTzMR9EoiIBLE1LRpTO1vSx5S9QnLpDA6nwVjU/scObTraNBlWrWYGDRbHBc83rxrpIPSmfSlm8N6KlDdnMVuqIA72pi6QVf7VQqq85xGsrU0J9LlFnTtRgZNsIpvoZom9ESzHGmOMBt1Tr2BhrmD+oH9EsHVXXyPBUXd0uAOVPPoIrOOZGi76g8EtYAYxLAypkGzTR4IlVXbAY2QioJx9YofNTJepWqMIXsqFFa6eUdSJLso0VXPnDwoyTJPm5IHKHaJN8JXPPQcxU8lcNy7zhm+FW+tVqj1sC63NJF1cBCAIdoIpDL87UhliXrhtNfUpa2vSeQyHPT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:07:45.6577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 917e2f14-5f06-4460-7bca-08dea4771ec5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6451
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_090750_584490_8FDD9F90 
X-CRM114-Status: UNSURE (   8.72  )
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

These fields have been added to the architecture since this register
was added to the generator, and were hence missing.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/tools/sysreg | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 6c3ff14e561e6..57ab09404267c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3736,7 +3736,9 @@ Sysreg	ICC_CR0_EL1	3	1	12	0	1
 Res0	63:39
 Field	38	PID
 Field	37:32	IPPT
-Res0	31:1
+Res0	31:3
+Field	2	LINK_IDLE
+Field	1	LINK
 Field	0	EN
 EndSysreg
=20
--=20
2.34.1

