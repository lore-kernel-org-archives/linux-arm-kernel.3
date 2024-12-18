Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2D1E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frwHySiUt99urmdPAJId9ZT5HAE/k9Nka9CE6s9PMDQ=; b=vs76XqQ4aNdy+3tsAsazMCWqlu
	SIVVDKGszSQoOhcccGjYlwK1Yli794LDjFmdNfuzJAN6t5vbRBiiRNUb0r2h9iLgiaqRZN9l8yCJC
	R5AOsBTd2W8VfrC/XsAmZboPqk3DK5gSO6blH01VGPNKYq2hTWh8Fr2y+Yb1ZNME3V9lOFAw+ESEJ
	97zIGxgP7UUDmrCHjmpBxdOQLB1tKJIyC2YqVUbg/XDlWTi5UYXmwhNWkkAhV3dgyorXbaCw69jbA
	GiNPuTRkKJ/B+dLZ0djaiUiL7qi+ljrGfDJLL5BYYbwZjzY6a7OjKfS3lvkr97/f4IfzFNKAMInAV
	eCwZjsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrYm-0000000GJNN-29sH;
	Wed, 18 Dec 2024 10:45:44 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrWe-0000000GIrS-1NIs;
	Wed, 18 Dec 2024 10:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/drKchflte2UGktm2iLcHJkVGzCEVK2bLR+IhTC2yUkG8J34g7r2v7RW2LNm5rb8o/rFbkYH/KDU7ZVYgzhNNGWMxJfFRuQoGeZMvYyDQatxHwP//Bhg+cuGYzVDyHf5/wVmyI/+ApjYxSqgzFEuggyxBtZuqmg/nHnA4sAOFGYwtECkMPzxqGSe18ArUBDDJcl0YGQ96JbPlcigqi5fRmxPJG6L3i/nm5dtSpfHn4zklc60IANpahZW4xRHWpyGioahhCVsr/p3jNBbThlUunFDmcyCpt+2+rigf6W6erb00iJSr8iRU+XXW4Ww0/7Y7+3q+mNV5+nlR3OVyEqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frwHySiUt99urmdPAJId9ZT5HAE/k9Nka9CE6s9PMDQ=;
 b=JUPoVaqJnBJi3SZQqyk26Jq7cEoh2Lmnmx9rF7YwZ91ikeZdDoCM0c6yYeyRovRXjvGCSOhXgKvaufSKW7s/FarvyJIokPKZnDoaZERxYmN+d6Q+RADzX8Ip8U8OdGTFyeSWoBh+BkuQCPZVIisbb6WX0mdE3ChSqL6uBcfKZRJhC6n246X0keeTi4X79XIP6iLAWVayCubLYJp3kM5fpO3se9A18XnDq/iW9lp6Atrk0JStOq5rWWD+32F7L4SKXHyFNbn/5W9Lg9Yf6d2/cgsCchTMRHpw0hY18UBb3MeHpGFuYY/ef4LxF2AD/5ofigqqSjA9ZUgqgSLFzOpPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frwHySiUt99urmdPAJId9ZT5HAE/k9Nka9CE6s9PMDQ=;
 b=g5KfFQbO/DLkK28ApYB+8y1Q6zCdXFqPySfy9+8GA2BCah4mPVvsfyFpmommnTOXADU9Eopn/FNOnOlBo8H8bQtrR68SiwJ8Ea8xYU0yy5x9H6KSE+Ax3gJ6agApV2T4TumekGcrLpABv5nNuuLATiXuxcnjXlMRiSLbZ7U54f4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DBBPR08MB10841.eurprd08.prod.outlook.com (2603:10a6:10:533::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 10:43:27 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:43:27 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 18 Dec 2024 11:43:12 +0100
Subject: [PATCH 2/2] arm64: dts: rockchip: enable hdmi out audio on
 wolfvision pf5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-b4-wolfvision-pf5-update-v1-2-1d1959858708@wolfvision.net>
References: <20241218-b4-wolfvision-pf5-update-v1-0-1d1959858708@wolfvision.net>
In-Reply-To: <20241218-b4-wolfvision-pf5-update-v1-0-1d1959858708@wolfvision.net>
To: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734518605; l=845;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=PKbX80sp6fmo1xscI98jqjFw5KMYwr1ZmcF/FeEohCU=;
 b=5oVBnMvIQFGCnOFtiR6JgMbeT0gPbPmXJm/aQIUUeMaUYog2gxidAAspadeLD4valuneFjLH+
 8I6EFjULsBNC7vVM0r39GlMcP/OPJznX7Ir6aD1LPo+4FxA7lvawKE/
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR09CA0140.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::24) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DBBPR08MB10841:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b573b1-1136-4f55-8fc6-08dd1f50ce20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmxYdjVpeEhZOEEvNnRnZU1Yb3dhbU1uKzJOeTVabXl2UDE1UUI5TUxxWFJ6?=
 =?utf-8?B?MTR4Qm1lb2JFc01HY25DUlFSNjRQZWhCeCszV1h3a05NOVlZMmNxakxITS9F?=
 =?utf-8?B?V2RmVzhBYloyZ21TOGlYQVRIUy9XeTZIZjJhb0pTZ1c3K0ZsZDVPWnNEMHQ4?=
 =?utf-8?B?SFFpL3htMzBpRUJLU2VXem1uSGNHU0lnTHlKbkpnY09zT3A1WWpjT0lZa2g3?=
 =?utf-8?B?N1NhU2xTcThiWlJNMHR0ZGYzQmNRbkpQSWVlc3FEU0V5Z1QraFNoWGo3NEtL?=
 =?utf-8?B?bkZVWlNabXR5U3FvcDFrRkVKMDhJQmswYnRqZDFxb25BcS84UVpweGVWZGxv?=
 =?utf-8?B?VGpxOXFmWkhqZEdoQjRMaWg1QjU5cUlIbktBaHdjVWpGT0xnRG53cVdpcnkr?=
 =?utf-8?B?c3pOZ2d2cnNUWTBTa2NFdUtoUjExeUt5UHZrM1NlTTFHcUMvYUFXMUpETGI2?=
 =?utf-8?B?aUdadndROSs5bG0zT0dqNjFmc2Qyb3BCUlh5VkxDTmd4cURSYUJjbGhTbGFU?=
 =?utf-8?B?Tjd1UG5JQkVvMHg2bXRONDlKUmMwVXB0RkZocTlyMmNnWE12cE8wTHNhOU9a?=
 =?utf-8?B?NnFnUnpWZkp1cEMwTFZsWWlFOWRzYlpETm5mNnpIZEZ2b1ZRTzJTN2JDaVh4?=
 =?utf-8?B?SHNYR3ZxWjdETndId2NhZFlBTWttMlREZUc4eFdtbzlRY2NYWXhNOWIwK0NT?=
 =?utf-8?B?MTZwa09QUjdjVGphRHdkeWhMcHBISFJYMmlTdjJYemUwUkxWa0ltd2hVVk05?=
 =?utf-8?B?ektoQlhheEU1bE5reUlKZDFlbTlhWlZraGE4SGZiaGp3bTlLSjFrbzlEVmNO?=
 =?utf-8?B?QUtPSkNvVjJZVWJQL3doMUtENFpkYnI1TWNSbzI1NEQ0RlIweCtKbnlwUE1x?=
 =?utf-8?B?V0g5VXRpZnordk1VRit2QktnRXVvTlBqcGRPNXplYmpsUEdJZnYvNHFwYjRs?=
 =?utf-8?B?blZZTWR2ZTljcVkwb2RGRlpvVEFsV3NtZVNaamxqcUZiRVNJQ1J5NXg1MVJH?=
 =?utf-8?B?a0djUEVpVFBkbTN1bFFVcFRNeG5FOCtoc2xtdCtkangwVkN5OG9FMjI4QTBH?=
 =?utf-8?B?RS91bjlQZlB5MlZ6OERZVVJzWDhrVGRGM1c2eTVRNVVnTmdBbTNrZ3k1OUhp?=
 =?utf-8?B?VUtZSXQ4SXZRamwvNkljZGV1NUhYbHdjTk9FU21HandQa3daNjFxaUltRmVV?=
 =?utf-8?B?WkFiQWpnR0NkZVlwejAra0tmKzhOMENlbXNFT3RuUXhnTzUyUktPR2pRYnN5?=
 =?utf-8?B?UEZJMm9ieERxVGtqOEdWOEtKWjZ3VmFIZVV1MDlHK2pPMTdvWFNuUFQ2SlVl?=
 =?utf-8?B?a20yU3daTUJML1dUZmNWVWRZdWpzZzdoTjRhdTlSUTVUSnFzNEF0S1pKRUFk?=
 =?utf-8?B?cXN0K2d4NkNOVjZTYkhEN0gzbGVUQ3lSdkplOWgxSEswcWhtZW93MUZ5Ymhj?=
 =?utf-8?B?WjAxd3p3OEN1L1lGbE5YMXNCUzZUSEZnMFcxSy9qUHhPZmhqUE5TVzdBaWRm?=
 =?utf-8?B?YXQ2T2hqSVNDNWxBaUNoZ3B6Wi8yQXdnVlBRZWxhMEx4QXA0eGJmTEZWUC8w?=
 =?utf-8?B?aG5OSFc3UmZneVB4dUR3SUl3K2lvMXh1Q0FEdlRWNEQ3RzVNZC9HMDVFTkto?=
 =?utf-8?B?cnd4REc3bFBYajI0V2RpaVpFSmpRWjIxNmttL2RkTTRXMjhGQUptd0RQVXgv?=
 =?utf-8?B?MVZZZGl0VVFOVXYxRDljQUpxTDc0ekh1OWZIRmpSUmFaakdMYVZwUWhhTXlZ?=
 =?utf-8?B?NUJ3bnZPbWVJcHh2OVNBTjJvT2tMYlhHU0x0RmpEL0IyWi9HblNKcHNFakdL?=
 =?utf-8?B?V0gyM09iV0JCOFRvNU1UbUg5T2d6eWZVSk82TjhlUWVHazVyRFY4aTRidlBN?=
 =?utf-8?B?c1hSWGNtcDgxS3RWSlRaVzNyTTUwcWJFNHNkNGpickFsYXpaZE9uNWZpQ0xG?=
 =?utf-8?Q?ezlUduzGBKOGhvdisRMa49D4u6+lLxXH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW1zTlFPejJwd1pwUzllQXZnMDc1UXFnM0N2Ui9RYWw3Wm5qVVhZVXJNMkZx?=
 =?utf-8?B?ZXl3Tm9HNldzUlhqWmhNL2NYK0VLeE91N1lYTWZCZHJPblZYOCtoZ2ZGY3lC?=
 =?utf-8?B?MW9BSzhqbUp5ek5PUjg4T0h3aTcrT2FJUGowMlZWNGVFZWV2K2tQMHN0Rk93?=
 =?utf-8?B?NGVBWUJLbkt3YTRMRDVVbW9hVExrcEpsYkpteFdiVUw1VUd4Ky9SVXFnT0c0?=
 =?utf-8?B?WVhqWTRTbS9iMDh6TVpjNkN2ZG1MRFpLSjlZOGNWWDNvRktaVDZ0bTE2LzlM?=
 =?utf-8?B?d1pLa3pHcUhnYmVWakVBbmQ2dFRyT0FQbnA2bjgvSTVyUndLZEpyemtGN0xy?=
 =?utf-8?B?VHBIOGpUUmp6RExjcGJuTUx5VGtDYjZ3OWs4blFPbTkxRmdJMlpBeElEUDJS?=
 =?utf-8?B?c05NbExJQytOZE9CZVRHMkRLczdabFAxU2FlL0NnZEhFNlJBcHJhTEQ2WWlq?=
 =?utf-8?B?TnY3MmZldkZreHRwR25nSytZKzNud0FBY3NEQUlzcUIzdXg4QWZXSDVhdTVv?=
 =?utf-8?B?N3ladVduNVFzMWJodUkrdWNxcld3TjJIbnVHM0NnSXpSc01heUtsRmR4MWI4?=
 =?utf-8?B?ckY2RDVqWml4QUFZSUZrNUVBREtUbmx6REtFVDJTK0ZaZmhjM3ZFR3Q2b25v?=
 =?utf-8?B?R3E2b21OTjZlWlVWOTRJZU9RcFhHdTRJTlBkTTlERmZ0RW1veFpoSU55S0dD?=
 =?utf-8?B?NmlSdnc5bVNRRFRwdy9WVTk1ZzRneHlHSm9rV0loWTZxcUxlRHRlTkRvVk1P?=
 =?utf-8?B?cmRJRkY4elBpSDVCN2lkWmZNWTlzQ0h6azVTT2xncTZnMnd2Tm1jdEtkdGJW?=
 =?utf-8?B?NDlWQUlLWUFHeHFNcDFaSGhDb29JakRhTGwzeEsxNkFwLzZSampvNHlzaCtT?=
 =?utf-8?B?eC9MNk9hUVIrUDhYZzA5VkszekttT1o5TXVyV3VKN2ZiQVU4bTdXTG5ibm9X?=
 =?utf-8?B?L0FJM3lLWWdkUURLRWQ3VGYrN1RzWi8zZ0dndWFLMnA2aTNHb0hrcTZrRkha?=
 =?utf-8?B?S2VHdUJoR05LWHZTem1GS1hreFJGWVF6Qkd1NVNTV1Bpa0dXYUs1VFkwQ2FK?=
 =?utf-8?B?OU1zNEJPdWdFTEtTZ0lRS1h2QjZRY2RQcE1LckxlbWRSQXBDTThFRkVMTzVv?=
 =?utf-8?B?MEd1NUJQbFUzUXFpQ1dGVCtxTExnd3liejZ4c3NrQjBRL0EySmhLRkZaaGZC?=
 =?utf-8?B?eldxWVYrQWptOTZtOXNOZTUxRzUxQXZxbE1QTm9wZFg4V08reEdxeTBjRG9r?=
 =?utf-8?B?YU1kOW1mUHYraFNSYzdKdHNVVUlmWjdrTnpjM01rMlV2dFBSbE8rR0FnYXFj?=
 =?utf-8?B?N1llblQ4WGNiZDlLYjVZWWEvMHJGV1FmTENsLy8rN3h0NThJckR5dmdYVzRL?=
 =?utf-8?B?U2FWTGRubG1GTHNrOE9HczlTZ3BMdDFyZDU3Y2JoUGRybUVJcVA5S2VsYklw?=
 =?utf-8?B?aGMxelU2UkJWZmoxakd2NS9OVTEyVkVKQUNmRVV5R1pYVXVQd2I4L1V0aVg5?=
 =?utf-8?B?cWtrWGVMdFNTY0FGSVkvV0FJZDZGWGJvU1cwOU5FQWNFckJVdTEwQzFHMVlu?=
 =?utf-8?B?NTBJcmlEMXYwS2JPLzNIWmxwWkRhcVBwTUJsYTNjQUdrc09IazBlSmhCcmR2?=
 =?utf-8?B?TDJVbVNsMVp4T2FGeGlBWFZNUUYyZzZJOG01TzVBMUNwUStURzhIYlFvOVNF?=
 =?utf-8?B?UXFpUmpkMnJoZk91UmxkeWpjVU91VjdSdnpZVXUrbVNlZW8zbndiTDhicUpl?=
 =?utf-8?B?M2UyK1ZWdVlYRGhQWEFGS0Y0aEFUSkNZZjlDSmhWQ1NNNFA4c09aSWV4K1hj?=
 =?utf-8?B?ZGFSQmpMeXdmSjFyKzNsSmlTc2ltNjJvQjRqc0JGSUI5dU1VRy9iUmdzRU1K?=
 =?utf-8?B?MUhLczJNU1NIRkxrR01lMzZlSlZjNzc4dERSQ1VxQURUQzJLZHZmRzBPdTJm?=
 =?utf-8?B?QTAvRW8wSElEQ2RDbVBxemFWOCs0bytGWHpNQnBSU0N0cUZEQ3BDYlFBWGZo?=
 =?utf-8?B?M2NjRE5JVkdDZ2JGSU5UY1FnQlJ5dDlyN0RPVUVsODQvZEt4UEFIUlgxd1pE?=
 =?utf-8?B?SGxYcjd5K0FQdklxOUkyT2JNUVA0MmRSQzVQY0VhZHJrcFJhRTBYQTQ5ZHVV?=
 =?utf-8?B?MHRuenZSS0FCeW0zUmRVZXNDUVNtelY5bGNDUHNXbTF1ZVhtWFRKcUJsTm0x?=
 =?utf-8?Q?/udm3Fe5awY/+MHqpMzaEuI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b573b1-1136-4f55-8fc6-08dd1f50ce20
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:43:27.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzrKMXlfIn5z2+bGiQ1CZNDs5i1ZPxEklV8QfoxILLPClJPcy2NdbOqSFumbGL2WP/uHkLJeFEOGSjiS2/m0P5LFlSAIhwbBUo9wxfSOJCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_024332_369596_B89E4F69 
X-CRM114-Status: UNSURE (   8.47  )
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

Enable HDMI out audio on the WolfVision PF5 mainboard.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts
index c6e413731241..bb33fabae16e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dts
@@ -167,6 +167,10 @@ hdmi_tx_out: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -414,6 +418,10 @@ &i2c4 {
 	pinctrl-0 = <&i2c4m1_xfer>;
 };
 
+&i2s0_8ch {
+	status = "okay";
+};
+
 &pdm {
 	pinctrl-0 = <&pdmm0_clk
 		     &pdmm0_sdi0>;

-- 
2.34.1


