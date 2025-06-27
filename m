Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0901AC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zArH7pldUYCs6pMqy2VXTvrHIrGiPCvzu8ZcPk+EcQM=; b=BLlP57rLX6b+5VBjITB0JHQdik
	xmepLCrmJvdvVaZVLmcH9zvqrgw8bFAsei0Bc6fC4vko5yTI+g0HSSe+NDXO+bHP4W15PXi3wolol
	8MBjiM4pVGcZMIKN3RupztPjuQWCsaOCZCyJpywc1rNk78EMvnwVDhk01LnYN3h92eHnFYsEONynt
	kpVwMLiIqectzHdMkYKS6+oQ/WjalpQ605tKzWkqQosKKuX1fMCX9CTCX8dZ+3rTXf1EM3X2mGt97
	+05snQ3FaE0pDIzjVVLdBAwwFm1tqu4Y9oqp02F+TMXfEWZCYdWLEePogt6YfW7jLmnh2P6XbRoEz
	8U8QGORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUxPx-0000000DGOd-1qL5;
	Fri, 27 Jun 2025 00:58:13 +0000
Received: from mail-mw2nam12on2070c.outbound.protection.outlook.com ([2a01:111:f403:200a::70c] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUxFI-0000000DEan-0YXG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 00:47:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORcyJLJ5laxyxCxvNNZXjfd7Cw5b/gAizT8GXD8CQAYV/nPmq03b7N/RIINVm6lLiU1EAt88JeeEomS18oJ8j9eE3SXk5WTuL9pohG8CFO3iNopPILl/HRLroR6WNIj4TOcO7OZldZ7JVNF40bPq5EVl5l8D2LRuSWD10eSabrir5rIRVEqoo8ujGu/MnBGWElZfuewBlTX+otPbAuU8WovdbJpRClt+7PlGSPedEh9oVjjPzl0ISstNFERhaxfDxOdr2G9gMNpL+7212ne/oZArzQurwiK5IA8bYUItCmMMwmWIspKRxW7DhLtUgRcwPBXinGrSZ6qPgC4XzmWo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zArH7pldUYCs6pMqy2VXTvrHIrGiPCvzu8ZcPk+EcQM=;
 b=slJY54ZDzyP4N2Ust3hefepib6wdXlfkw8LTQF9rh9JP2U3k9IYPn5F7OJWkxxQyQFMRttEHW0vbZFL9OYp1EXlo7o57+NsrTmyQQk27QV4jTYBgUfmveW9wh/xRzDgWHUgcF+bPC/FPf1du3KbZssK2RqBuStcpz6PYdNwiOxSpdZe+cYp9wybbtXpNDhPcr7Y5OphESrakpnirawhV1gmqXJC6DUpLhcYfDB+x51sYtWlo5xkLmeKIqeLz/aWRRC09RZIe5UIoh1SAHWokYNH4IGcOuviGa5lpcQ39SwVaQ0g52nDW3xBKXX3e0t0cVOiiszMxeMW/04MrFL/u0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zArH7pldUYCs6pMqy2VXTvrHIrGiPCvzu8ZcPk+EcQM=;
 b=K1e37wShxuKmZwUBSERuLhJO6UhbManuImpQ28eEpQxgkPAwlZgJRDF9ldgqNlvhm0miKfXBb/7reu80ksSgkg7BnlyLHBsCBX1g9zlKrwnYhsb5M8fJWE99UXzNHkQpOhba+KGLckSy0V69bURiJSyMtGZ62WUe6StUayFZDIWVkFYmkoWyq8Z3g+Y+SQG4lXf6wB1hEfdHdi8n1/2oN7sENOc4bpK2Uj4R9ddPKQI5nhicqtZ42zt9LMfpY+BNwj3yztRX+7Efpx/+GSYrltmxJKPpfAW7p6CS6ksM18eODXM2G45rBL/9aChR9qBwk4RZ8AHssROu9sRdPfPJmA==
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 (2603:10b6:518:1::cbe) by PH3PPFFC93630F5.namprd18.prod.outlook.com
 (2603:10b6:518:1::cd2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Fri, 27 Jun
 2025 00:47:06 +0000
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161]) by PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161%5]) with mapi id 15.20.8769.035; Fri, 27 Jun 2025
 00:47:06 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
	<jank@cadence.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb5GREkMWleVUwnEujC+sUqBlKs7QR3j8AgAFHOACAAEApAIABRb8AgAB6s4CAAQsmgA==
Date: Fri, 27 Jun 2025 00:47:06 +0000
Message-ID: <72ac73e7-a201-4001-a3ca-b13fb78c980b@axiado.com>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
 <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
 <19d78e69-4a38-420b-b9f8-d0eb90cdcaf6@axiado.com>
 <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
 <a6e27c0e-0703-4444-b6e7-d4db1340e802@axiado.com>
 <3660b275-8513-4017-aba4-5c4432eb5b6b@kernel.org>
In-Reply-To: <3660b275-8513-4017-aba4-5c4432eb5b6b@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFA7616390B:EE_|PH3PPFFC93630F5:EE_
x-ms-office365-filtering-correlation-id: 550910ca-d5eb-4225-8af4-08ddb51423e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?akVEdGlpY3N0N0IvZjJtUEs0c2dMM2dDWHh2NDBFZ3hJM2c1MEJUS1c0V0tl?=
 =?utf-8?B?UlBVZW5BZjRaZlBLU3VOYzZ5K3lZNW1jR3FDK2g3ZWRBaDZQa2ltUUNkVkpv?=
 =?utf-8?B?ME45a2J4VVgvK0xsZzJRajMyZXlVL2hjbUZnaVlYRml1K0JwdG9EcmE0ZDVK?=
 =?utf-8?B?Wm90SDdmdHZIVUN0Sy9jdzFxb0NOZFljbjVyVWdhYXhHMUVyWmFMRnJqVWZ3?=
 =?utf-8?B?Rm9mR2RLNlNQWWJ6djY0eGZTQXQrMzNyODEyYXVla2lqaWpLSTNRaUZCVHg3?=
 =?utf-8?B?TXhveXJNOXMxdTJOWEZPSWlXKzlleFM0TXZDOEtQVTcvSnJmK3dlZHVSVUVZ?=
 =?utf-8?B?T1ZlelVkaC9GRjRJQVpJRUdjeldXRWs1M3FYNEI2d09jVTVwU3E5YTZTWTUx?=
 =?utf-8?B?WU1xL0ZQNWtWbC9PSXJmQTBUTEh4K0VFWS83VW90ckFTVnNZbG14aElYdStk?=
 =?utf-8?B?SEdWMWRKVkdTdVJDcjJScmRzZDVwVWliTFNnT3BlMHQ3U2NqMnNqVjNkVjg5?=
 =?utf-8?B?dXlTNlNxMWdlZjlkZmtBMUFNajkxZUFTc2o4VUMvSWdWajNsb2ZhdVlVVkQz?=
 =?utf-8?B?SVBpVC9LZTB1dnZlK3RyNTdOVXhzNmFWRU9WRmpvckpUeG9ZUzNtQVpmeG1n?=
 =?utf-8?B?U2crZlN6MEliRWdzRTJPeG5zK3h4dloxWXh3VzJjcGV1M2szZFEzcmVzQXBC?=
 =?utf-8?B?bUx4SURoSDhJd0tYWkNmOVJEcFB6Wnk0TEZXb3czQ1pTbE9YcXN2ZExTUU55?=
 =?utf-8?B?OGMyMmNEdmV5QkFwVS9CMkJ0dnFST2RxbEpQbXlueXdmSExkU041dkhRVm5x?=
 =?utf-8?B?cHZWdE9QaGZiNWwyZE53OWJFZjhQYXVvMW5XRE5RK1RvZWZJVVlFcXd1YkNM?=
 =?utf-8?B?am44S1ptTkNOWkxqRmZIS2h4cU5IN0NRZUxlQitEaWZzc0x2UjhMMVBKTzlS?=
 =?utf-8?B?VDJ1b2JGSG5mQm5ncHJwNmJ0MDBEdDBtMkYyMExUd3l1STdiRFlYSkhMeUV5?=
 =?utf-8?B?NUt5eW8rUEU3L1QxNzZGTENzNWt6bWgyL2xpaGtVREFaTk4wbUZtSC9vNzlK?=
 =?utf-8?B?V2F5em40N244V3JBTVE2c2pDSVIwME8rQkNGaTVFeXhFcUhrRTlHT0U4ZjJP?=
 =?utf-8?B?WjZ1Ym02dnEyVGtMUkN6dm81a1FINUFvVEJRd2J4SFhucUNOK1psWWJrMUNJ?=
 =?utf-8?B?VTVsclNaU2xXNDM2cWUreTFZNDY0MGplOC9YVWN3UzN4L1ZzTEYxNVNYeTZz?=
 =?utf-8?B?eVp3WmlKVFNseEMrWCtwM3U2VzlKU2c1c0xlbncyc2JzQnc5TGRKR0lqRU81?=
 =?utf-8?B?UitiRUJwZzJBNjNkYnJzdUIwcUVvMUFJRHV3QzZMYis5eEI0QmxpVlYxUEFm?=
 =?utf-8?B?V1pKeHdiR1ZDRXYxZ1VWOWxTaTBPc0xkYWVxZnBXTDkyelJMRlorVFh1YVZ6?=
 =?utf-8?B?aU1MWUtjdnluU2ZJVWVvb0VGRzhtSFE1dFA4MDcrQWVRU0lPeW1UZVVsQzBv?=
 =?utf-8?B?bzg1OGxkZkVmNGhHT2VFMCswZ1JoK3owdmkwY21lbDZLNlhoaDRPU05maUVr?=
 =?utf-8?B?dlN6dFNFQnJDYkxkTkZBU3FuMWhKUFJZVnNuVXJOc0grU2NJTTZBdGZROXh6?=
 =?utf-8?B?dFJBb3J4YmxvU1U2dzVHNE9VeUNsck5kbnBFd1haaXZLeEVzMUVmWHJtUERZ?=
 =?utf-8?B?cUFzZDZ5d0tWdW5XN2YrMjBwTjJVOUZlMW1CelVsY01LTHg4NGt4Tkg5V3NK?=
 =?utf-8?B?cVZQOG1VODRISWJyTityOFJndVFqUGdVTit1Snh5UWxzODJ6MjNCMGFiKzZI?=
 =?utf-8?B?b0hzbDZMUk1SYjQyZ0hUdUZNaElaQlQ1M2VSMWM4NmxxbCtjZVhyQUZMYU0y?=
 =?utf-8?B?c0xIL3kxSzllQ240SE45VUROWkRHL1ZnVXJOWHVBU3U2aXlFbDBuWWZES3hi?=
 =?utf-8?Q?gnpeKjrspuxlwANVn3H56Uj3HtwwgEnn?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA7616390B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJ0WjRXNWM1enhGQkVLVTROS2g1WFlVOXFGWlZ5QzFYL2FzUTZLbFhFUktw?=
 =?utf-8?B?VEtSeHFxb0JBMEdnK1N0NFlzYkZDRitXYnc4TlFwd2MrY3cvU2Q2d2E2QVND?=
 =?utf-8?B?TkF3dEdFNTZmV1NuQ1NVeE5qeCtFNzRPcC9wYUxPL25GM0VjYWJOSlVsTlEw?=
 =?utf-8?B?ajYvSXNsd3Bvd25FeGRyUXFwYzVVYUxsb0FRdDhySmY0YUNUZjNrWlc4TStZ?=
 =?utf-8?B?TzNQczVkeExtTGl5dmVHZEs3eXZlQURCeEtPV01CRWNTWEFVSjc0WCszbXdI?=
 =?utf-8?B?d3FzT2V6NFo3THNtTmI3dm95bVYrUDdqemExRzliZkxwdDcyek1BMHJqM2dZ?=
 =?utf-8?B?Wk1BTTc5VzNoeTcxZmMzWDV6K2hKclJ2OWhJcEZDcmxoaFU5NnhnNk1vdUcv?=
 =?utf-8?B?Z3phUWl2c2h4MmpMaWtLUWxaWHZ3UVFLQUNNcVRDNzB5L0d6VDQ4SW5uS0tG?=
 =?utf-8?B?bEhKTTRTc0tTVE85NHR5Y3dycDlEY3plYnVOeXRjZXV5RlhKRHdZMm5zYnBV?=
 =?utf-8?B?ODFWelpobnJuc2Q2YUZCREZVRlZJcU5nbEI4Vmx2VTQveitBZEFTK3Z2NzJ2?=
 =?utf-8?B?b3dsMFFHNjZkeUYwa0FkcmN2WFM0VGZKV1JRT2VUOXIyWkJVRkVadFV6L0tu?=
 =?utf-8?B?WFhqWkZvQmU3YnJLQ3Z0WldDVmNOYXdNbjNuUDc3eGpxVnFjUmJNRE1NV28r?=
 =?utf-8?B?NmN1VEFhZ3NqcU9DbnBpZFQ3aTZhSWkvcUVROWtIZWNBcmlIK1RZUmV5a2Ew?=
 =?utf-8?B?ZFhJYnRVeW56OVZ6bEorbVJtRXRtS2wwNkQ2aFFvb2FlN1M4WWVORnlnb3dz?=
 =?utf-8?B?bjlZajJpWWpsSDRZSzBXZDB5MVR6YmhjY29UdzlCcDJLbllYNU5Ka1J5MWdp?=
 =?utf-8?B?NE9USmEwWVBnVE1QRnRpazlvbUF4aVp3ZkIreUxyRmRmVjRMTnc3czZpQTBN?=
 =?utf-8?B?N294Y09mMEticzFUSVdUM0ZXTjZWSUhYaVhmVnUvNVpMWndlaUd4NmUzMUhq?=
 =?utf-8?B?Z2xFSVRIRlNIVVBBeTRVRUo4aktnME8yVVhwUUQ2MlRxME5WWTlQWlMzWUhR?=
 =?utf-8?B?bWJwemZlRVdGaGI4RXByeFcySXg2a3JwTTJkd3A1MzlCSHhIemNsN2tWV3pm?=
 =?utf-8?B?VUk5dU9CNjNvWThUY0JhMHFSZVBKZWFpUzZsSmkzWnI2WEdIc1ZTVWlTTTZy?=
 =?utf-8?B?QkJETG1GcjNzeFBQT1lPQjQ0cFZubHFTOE9HY2JwK2pPTGNXc3JQNDlMVzhp?=
 =?utf-8?B?SWVjL1hXQlZ4MTZDTkZKOTMxNHg1a3YvVkRiRVdNRVV5Ri9Ob2FGVTkzOXF6?=
 =?utf-8?B?U3RtdmRVUFVyOXp4SzBLYkd6KzI1RVBDL0RWVDNKL1BORnA4M0szQ3lrR2lO?=
 =?utf-8?B?WFBWRnhNVUM1T3RLREJCbE0vZ21XSFkzYWpEbTU1K1R4ZmJmOU5yNlJ4bUpo?=
 =?utf-8?B?YW1IdVNOREplUThERGNrR0tFUzd4UzFvZGhsNHo3d0lCWHpMWHZ6L0VFZEpO?=
 =?utf-8?B?Zk5ONUlDbHZOejQ2SmRMN1RWV3FwaWNoYUJPTTQ0bXhoSjlKSVY2bTJRam5L?=
 =?utf-8?B?cHJJb0FLZDBXU25TVXFWWUNrOHZiTVpmd1pRYWlRMjE3a01ES2lWeXBCS2Fu?=
 =?utf-8?B?dFUyN3NMV1RyanRNYlZ3QjNEOWpZSFRtUmtvZ1RBRTJCamlhVm15aUd4Z1Bj?=
 =?utf-8?B?eUpGeXdkeFA0M0NtVHJQZTQzaGxJYmRrRW0rUWpRYlhhWndqa0xqNEhhRnFP?=
 =?utf-8?B?N0tpcDNSSGx4RktTM0JlbjFraUw0b2k2VzlJZFo3WThBdGplK0pUSXhpQUNz?=
 =?utf-8?B?QUdGNkErR09VV0lLaUhzaERmbXZ3eG5UWjR3V2V0RVBsZmZRWU4yeWtDOEE4?=
 =?utf-8?B?RXhYWGxNbkhlc01nOHhUM1JnbFFvNC94MTVnc3d5TS9PaHpTTnhoOFRJcGhs?=
 =?utf-8?B?L3RBMTBhNHUyS2hCekw2a0FVRWVNNThEQVdRMThGd1lUWWtxeTVyeHJHalNK?=
 =?utf-8?B?TlFFK1o5M3FWQUNXTlQxbW95R0xjVi8yeU0yRGViZFppWEpzTzJJNkt1enZ0?=
 =?utf-8?B?SHpHTTNtWXBCWjRQc1JyZi9DSHoycDZIOWZPYzduUk03QWxYc3kzMkJzeWN3?=
 =?utf-8?Q?4ycc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAD079F3D4797842BE37D0BEECA0D148@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA7616390B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550910ca-d5eb-4225-8af4-08ddb51423e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 00:47:06.2478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ma5uNMRzmtqdcpruXYd7fLSP9/zHRzarfBgocDqQ4kLFAuZvgVP3cvYHkS8QPwXuMg5LvdA6KO1AK3qUvAux5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFFC93630F5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_174712_196237_B306AE32 
X-CRM114-Status: GOOD (  19.72  )
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

T24gNi8yNi8yMDI1IDE6NTAgQU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IENBVVRJ
T046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNv
Z25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBP
biAyNi8wNi8yMDI1IDAzOjMxLCBIYXJzaGl0IFNoYWggd3JvdGU6DQo+PiBPbiA2LzI0LzIwMjUg
MTE6MDUgUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4+DQo+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAieGxueCx6eW5xbXAtdWFydCIsICJjZG5zLHVh
cnQtcjFwMTIiOw0KPj4+Pj4gTkFLLCB5b3UgZG8gbm90IGhhdmUgeGxueCBoZXJlLiBMb29rIGF0
IHlvdXIgU29DOiBuYW1lIG9mIHZlbmRvciBpcw0KPj4+Pj4gYXhpYWRvLiBOb3QgeGxueC4gSG93
IGlzIHlvdXIgU29DIGNhbGxlZD8gQWxzbyB6eW5xbXA/IFlvdSBjYW5ub3QganVzdA0KPj4+Pj4g
cmFuZG9tbHkgcGljayBhbnkgY29tcGF0aWJsZXMgYW5kIHN0dWZmIHRoZW0gYXJvdW5kLg0KPj4+
Pj4NCj4+Pj4+IFBsZWFzZSBjYXJlZnVsbHkgcmVhZCB3cml0aW5nIGJpbmRpbmdzIGZyb20gRFQg
ZGlyZWN0b3J5Lg0KPj4+PiBXZSBhcmUgdXNpbmcgdGhlICJjZG5zLHVhcnQtcjFwMTIiIGZvciB0
aGUgVUFSVC4gSG93ZXZlciwgdGhhdCBhbG9uZQ0KPj4+PiBjYW4ndCBiZSBhZGRlZCBhbG9uZSBp
biB0aGUgY29tcGF0aWJsZSBhcyBwZXIgdGhlIERUIGJpbmRpbmdzIGRvYy4NCj4+PiBFeGFjdGx5
LiBTZWUgd3JpdGluZyBiaW5kaW5ncy4uLiBvciBhbnkgZ3VpZGVzL3RhbGtzLg0KPj4gV2Ugd2ls
bCBhZGQgdGhlICJjb21wYXRpYmxlID0gImF4aWFkbyxheC11YXJ0IiwgImNkbnMsdWFydC1yMXAx
MiIuIFdlDQo+PiB3aWxsIGFwcGVuZCBpbiB0aGUgZHQtYmluZGluZ3MgZG9jIGFuZCBkcml2ZXIu
DQo+Pg0KPj4gSXMgdGhpcyBuYW1lIGxvb2sgZ29vZD8NCj4gTm8sIGFsbCBjb21wYXRpYmxlcyBm
b3IgU29DIG11c3QgYmUgU29DIHNwZWNpZmljLiBUYWtlIGFueSByZWNlbnQNCj4gUXVhbGNvbW0g
U004NjUwIG9yIFNNODc1MCBhcyBleGFtcGxlLg0KPg0KPiBJIGFza2VkIHRvIHJlYWQgd3JpdGlu
ZyBiaW5kaW5ncy4gRGlkIHlvdSByZWFkIGl0PyBJdCBjb3ZlcnMgZXhhY3RseQ0KPiB0aGlzIGNh
c2UuDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg0KRXh0cmVtZWx5IHNvcnJ5
IGZvciB0aGUgbGFzdCByZXBseS4gSXQgZ290IG1lc3NlZCB1cCBpbiBmb3JtYXR0aW5nLCANCnJl
LXNlbmRpbmcgdGhlIHNhbWUuDQoNCg0KVGhhbmsgeW91IGZvciB0aGUgcmVmZXJlbmNlcy4NCg0K
WWVzLCBJIG1pc3NlZCB0aGUgcG9pbnQgaW4gdGhlIHdyaXRpbmcgYmluZGluZ3MgZG9jLiBJdCBz
YXlzIHRoZSBmb2xsb3dpbmc6DQoNCg0KIkZvciBzdWItYmxvY2tzL2NvbXBvbmVudHMgb2YgYmln
Z2VyIGRldmljZSAoZS5nLiBTb0MgYmxvY2tzKSB1c2UgcmF0aGVyIA0KZGV2aWNlLWJhc2VkIGNv
bXBhdGlibGUgKGUuZy4gU29DLWJhc2VkIGNvbXBhdGlibGUpLA0KDQogwqBpbnN0ZWFkIG9mIGN1
c3RvbSB2ZXJzaW9uaW5nIG9mIHRoYXQgY29tcG9uZW50LiBGb3IgZXhhbXBsZSB1c2UgDQoidmVu
ZG9yLHNvYzEyMzQtaTJjIiBpbnN0ZWFkIG9mICJ2ZW5kb3IsaTJjLXYyIi4iDQoNCg0KKFJlZjog
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNS4zL3NvdXJjZS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1iaW5kaW5ncy5yc3QjTDc5KSANCg0K
DQojIFdlIG5lZWQgdG8gYWRkIHRoZSBmdWxsIFNvQyBuYW1lIGluc3RlYWQgb2YgdmVyc2lvbmlu
Zy4gZS5nLiANCmNvbXBhdGlibGUgc2hvdWxkIGNvbnRhaW4gZnVsbCBTb0MgbmFtZSBheDMwMDAu
DQoNCg0KQW5vdGhlciBleGFtcGxlLCB3ZSBoYXZlIHNlZW4gaXMgdGhlIGRlc2lnbndhcmUgSTJD
IElQIGlzIHVzZWQgYnkgTVNDQywgDQpvY2Vsb3QgY2hpcHNldC4NCg0KSXQgaXMgc2hvd2luZyBh
cyBiZWxvdyBpbiB0aGUgZm9sbG93aW5nOiANCihodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ni4xNi1yYzMvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvc25wcyxkZXNpZ253YXJlLWkyYy55YW1sKSANCg0KDQogwqAgwqAgaTJjQDEwMDQwMCB7DQoN
CiDCoCDCoCDCoCBjb21wYXRpYmxlID0gIm1zY2Msb2NlbG90LWkyYyIsICJzbnBzLGRlc2lnbndh
cmUtaTJjIjsNCg0KIMKgIMKgIMKgIHJlZyA9IDwweDEwMDQwMCAweDEwMD4sIDwweDE5OCAweDg+
Ow0KDQogwqAgwqAgwqAgcGluY3RybC0wID0gPCZpMmNfcGlucz47DQoNCiDCoCDCoCDCoCBwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOw0KDQogwqAgwqAgwqAgaW50ZXJydXB0cyA9IDw4PjsNCg0K
IMKgIMKgIMKgIGNsb2NrcyA9IDwmYWhiX2Nsaz47DQoNCiDCoCDCoCB9Ow0KDQoNCiMgV2Ugd2ls
bCBhZGQgdGhpcyBjb21wYXRpYmxlIGluIHRoZSBleGlzdGluZyBkcml2ZXIgDQooZHJpdmVycy90
dHkvc2VyaWFsL3hpbGlueF91YXJ0cHMuYykgJg0KDQpiaW5kaW5ncyAoRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9jZG5zLHVhcnQueWFtbCkgc2luY2UgDQp0aGUgSVAg
aXMgY29tbW9uLg0KDQoNCkFzIHBlciB0aGUgYWJvdmUgZXhhbXBsZXMswqAgSSBzZWUgdHdvIHR5
cGVzIG9mIGJpbmRpbmdzLg0KDQoxLiBjb21wYXRpYmxlID0gImF4aWFkbyxheDMwMDAtdWFydCIs
ICJjZG5zLHVhcnQtcjFwMTIiDQoNCk9SDQoNCjIuIGNvbXBhdGlibGUgPSAiYXhpYWRvLGF4MzAw
MC11YXJ0Ig0KDQpDYW4geW91IHBsZWFzZSBoZWxwIGZvciB0aGlzIG9wdGlvbnM/IEFwb2xvZ2ll
cyBmb3IgdGhlIGxvbmcgdGhyZWFkIGFnYWluLg0KDQoNClJlZ2FyZHMsDQoNCkhhcnNoaXQuDQoN
Cg0K

