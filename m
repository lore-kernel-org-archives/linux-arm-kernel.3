Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF6CCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2tsok6si7NEX/QJgqpWWgkqrnaGhdwkkA87hDhRunI=; b=3kCFCOGOVGQ+pXsuSMD2AxyGHG
	LopGmvhwqtuDrVhOz+/MGCPkYE4WHF6zDY1CA9Qj0h4TfBqc0q5HiOqWuhAsRfy2omdwuAWP7FwaS
	8IW4UY9Ejicc3ckNwDdtQafoSmaXcROjWbILtTeDfRvnT0Bw/b7uwdaahn2B0nymzPTZ6a0Tx6zRM
	1jY8VOwMxVKjhJ4yYLkRcFObRfdL/YxGEz2ORt2XnHPuBAZy40Dr6mlPbOXPeC242r2O+HXFZyVgj
	s5eMh9HLIlTFWidrw837ZccFuFaM87ZHt6T56aQbJ+LX4ytSifZ9odjVrleA6BPYWFnq9m08FZE8a
	+tu6MQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScKT-00000005tr9-2DKy;
	Thu, 28 May 2026 15:07:25 +0000
Received: from mail-norwayeastazon11013023.outbound.protection.outlook.com ([40.107.159.23] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScKP-00000005tqA-3ffp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 15:07:23 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Dw1Rhz7SlFxt6a3ELcehmWTRkHyG0mKYSxubRheMblYBhSgS0Osta+qdWQDp86AVo7lv4GMsHbQykI3/NgMZzWcIcnvS6TdyEDp465wYkHUeRWtAS0tGSIxwSLi37yNmsWgrCDi7wITKywqKLGcaS2P9BstKHOQ3QAdD9wqltcLki4QmbGIaQ4EJ3z6VsVapid1WKBPw9wOkhLJFpjYxoClPoU9HEgfP2mSSJo7wTumXb3heHWNeadFRqFAt8RY+zkiWDhsgUEI3/QwkTZNfdvuEJM4pt8eUNmHvAVGcJr1Qr2qh0GoEhBcp00V4aX0wy5yHx5SUp7uZfXFl/n4kPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2tsok6si7NEX/QJgqpWWgkqrnaGhdwkkA87hDhRunI=;
 b=PsyJ3CWjFEBo87sDwKdYYMJsLgKRiat0gai98njrtLp+Fg5ZqM4NW3pACgiNKwYa2RaWeSQC7kd2vhrN6ttEb4vR6KnQgZ9DuiaW1dlUYmHo55++hyPwsemK/EB0zhS1loi/Jkskx7QldAqy4fdPoH7UsCIBJrVwu91EY1pjmM9MUUhI1tnAt7Zgmd2Cw64nu9nYO5qVxpbTXoWmXqyc6rmvoj6WLntgiAY7thcFluGH+wusr7kGmcwZvajUqNNjBl1hpC+G1Ba2WxhCB58ldGcdK9+lHCIw6/EZXssQSX7zwCag0IZ+uxUvfLJh/WuljMkRtYiy8j2TuKQD3k/GwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2tsok6si7NEX/QJgqpWWgkqrnaGhdwkkA87hDhRunI=;
 b=LOEA7viefBshpXxHeulBmrgUECm5lB/vRY5xoGTEaAWKXThoOe2Tf3prkkYH31s3BvyHuPVWDa2XnwAT24RLFhM5ElBLtWDXRAhFgv3UVAsy1zDtAbWK5LH5blAycfcTjQMjZ0+/KxnZ8HJGPTf7j9ZfBNOETb+NQuvUZo0zM8U=
Received: from CWLP265CA0274.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5c::22)
 by GV1PR08MB10808.eurprd08.prod.outlook.com (2603:10a6:150:160::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 15:07:14 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:401:5c:cafe::a7) by CWLP265CA0274.outlook.office365.com
 (2603:10a6:401:5c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 15:07:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 28 May 2026 15:07:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGmzorvJxTS5hh5bw9gyRS9+yTAp0eaEhRzRfcDJXOpGVkLwhqf+Cfz4MrxDP/oxt/IJ0xxp4Nb0xILen63FngpVYTPyEdVryTNB3j/n5jQV+G4iLgQxwrH4aUWYIQt7JV5amcdZGEA/f36vvXbBGNDOoSjWbphmY13UkgpLTpqN2V5uQtyM7Bk/GVVhut9Cgg5cfuiacLIDl3r5bzvZj59SrOs4j22xbRvwbqJtC7QaOm+UJK3EN5y6/cTUTidWYXcp87TJ4EVe2MQy+TdyQ8bAnS2c804ZC4ifu38X2x8W9KjikV8Sq9hnAvZ5NmTQ23om/B0LnbLVvu2kzRP/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2tsok6si7NEX/QJgqpWWgkqrnaGhdwkkA87hDhRunI=;
 b=bbtLoPQbwAixWpICOk5jMEY0tPhVH9QQxv845Zegul0m4zW/8YZiXDesDGjDEg2K0DH+6XMs2zqPhqMXc9kwGqgC79pMBW0VqtE3Zr2R28ggSKuK6fACRtYEKjIxc6GzK3UZMTdMTd/dF+WIU4mnddI0zSzMHUbV0P8vDcsRfg/MSE1gQS75FIjheG+3/v5mOZvspaLeoSf1JDufz4kSsxXXKTqB8hB9U3SfKk7f/KUnzPio+ZGlA0/cVkseKRJtGsuK39TMBYuduaBcSqVwJMTcyX6OV4x2locVw+Jf7SyVaVxoqYLezZi/oUdozkxaWAdWpRIGKa+8f3uSO2+HGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2tsok6si7NEX/QJgqpWWgkqrnaGhdwkkA87hDhRunI=;
 b=LOEA7viefBshpXxHeulBmrgUECm5lB/vRY5xoGTEaAWKXThoOe2Tf3prkkYH31s3BvyHuPVWDa2XnwAT24RLFhM5ElBLtWDXRAhFgv3UVAsy1zDtAbWK5LH5blAycfcTjQMjZ0+/KxnZ8HJGPTf7j9ZfBNOETb+NQuvUZo0zM8U=
Received: from GV1PR08MB7315.eurprd08.prod.outlook.com (2603:10a6:150:1e::15)
 by GVXPR08MB10576.eurprd08.prod.outlook.com (2603:10a6:150:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 15:06:08 +0000
Received: from GV1PR08MB7315.eurprd08.prod.outlook.com
 ([fe80::c249:1aed:a4c2:4193]) by GV1PR08MB7315.eurprd08.prod.outlook.com
 ([fe80::c249:1aed:a4c2:4193%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 15:06:08 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Vladimir Murzin
	<Vladimir.Murzin@arm.com>
CC: "maz@kernel.org" <maz@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, Mark
 Rutland <Mark.Rutland@arm.com>, nd <nd@arm.com>
Subject: Re: [BOOTWRAPPER PATCH v2 1/2] Introduce --with-gic option
Thread-Topic: [BOOTWRAPPER PATCH v2 1/2] Introduce --with-gic option
Thread-Index: AQHcu44P/LMHf9QcVkWA6vq/DetXCrYj7+iA
Date: Thu, 28 May 2026 15:06:07 +0000
Message-ID: <a39930aac3543e2866a5a0f8e8a9e98ee94a0026.camel@arm.com>
References: <20260324125906.67012-1-vladimir.murzin@arm.com>
	 <20260324125906.67012-2-vladimir.murzin@arm.com>
In-Reply-To: <20260324125906.67012-2-vladimir.murzin@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB7315:EE_|GVXPR08MB10576:EE_|AM2PEPF0001C711:EE_|GV1PR08MB10808:EE_
X-MS-Office365-Filtering-Correlation-Id: 403cd5bd-add2-4e82-0784-08debccacd19
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|38070700021|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info-Original: xw+GfFNdoNIn0DYMPsA2FMP7MlmEvaKucxjwQCPTL/3vKTCM9n3Oc+0rbSh29rx6M5XM21qHtd5pIhpJqUrs+bmAESKj2nC+lWf3vw240PPHtvsnBi99rEFLk9+vtLtBQVaq894qRK/HR3bPXVtksgBWjxBNn78KfyhU4c42YGJTzcndGOYA6UMRuaTFrvl/dlaTY1ymzKFAAaS8ALOP4XmM32u0PYqnke8EPKKi3cP31Y+eYF2lJ1nZiqY9MEGvqy715ERl9We+0a06QYAX/XIS+D0i5ANhESjnMsJJzcCRtqYzD0RZa34IQ+7VzQn9kiFY4dYD3mV0Ia8hoNGgYAvTpLCR8d8t3ORByKda+17tnny53Qag0fhWQ+IPkKWWJjmVP2Ov7A+CCdb7fsHSiYNfXL/qAWvFIvxKOdTz0RClmgaYsnbH1UJzYYnFmYMl8XtOq6EBd99zWFHmN3qizlVy0qabYmmOmu+fTwWFgojYYDL4zshQgV+nSQQj7ZIeONk1xtxFqEHiGVFTO5xymPdbfGDmsrqgg6zIlJY5YQhA1zgMP6b76d8B8spsl4Q9qtRodRvZ7QWmF8tTh3CktlXQJjs55L/S9yynJ05llG0ywwthgLR9RqzksP88bdr9Ry7FXWladYRF2iCsxmZUSLX5JSvVD1cFPUo/00vD/TEhTqITSH/5rBn1udD/iJUD5MEftPsq81nrP1b6pxeiEBlY+dI9UdjfEoJKoQl4B3/CIUXFogzLe9svINtTqGjE
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB7315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACF04E0822A1A849B29D7CACACCCEDF8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CJTOmtXtIHQqB9z2KbTPuddbxvvktpSZX2a4w0SXN+4foSgqBouJz339cRn79oAvMLOUdo979gIGxzabRwvbDYOMlw45EiDUldkNw8CguswwqM9FoGrY5DVIWSZInIekP3V7T+ElWzk1QdvCudOz+LYTQELjt0vEgoXVp9XqbxXD++2wVDyn883zFYpscdoJBNbdzxv+m+vii8B/tjJQJJ8N+xFJhJ3NerwqaLXqGHuF7gaTNDlaB++Pj0zWqXbck3KdL0esMjW/KifG7ugfQbUYN94aJlJX1WrA/fiHkN2TBKBV3JIESl1JrflwzLlB1I+4n8OET9CsTvQF5mMzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10576
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 72263c7d-d749-44b0-4a92-08debccaa59a
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|14060799003|1800799024|35042699022|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: gTczrTaAjSrZN3DKbUNFQTEptUPqjbWNgiSh7zu5pxP9wLwUMlPsme0Hy18i2hhqDAAW4Dk28wrGVF1qocXSHHcEkFvbHg3EWUymCDLO0SUfCT7X/qv2J4muoft0T4qO6JmVTOd+vk+BY4fxZrwRGN/zn96goNEhYE6r1BZoft4eSLFVquAOIdUAT+Xl+TJwzuhN3Z4RYdBuOhUsR7RoFJ3g/UC/vnY1Yd/tt9wuWW79QSF+hPIHI/4gmb5wAWpjYx5+LBZ2FnW766+MvzoU5qzWeZFUwqUIxeSz9DW9F7Ba3nXCp6oxYLga0DCiwfPOLvqSBNuH2JjMbehGJ9xDvBmGLxor0bQjqp5bEH64L7lLj8lquaVkfHcuvZLHsPur+UUcwJYm4aPqQzIPRMgbjmEl2tXlJRuiGB6+nzUg/JT606/m+FK6O0Y2WSPA65FHigRfqHu1vGEIay+TEQMUpve59na+GKVJVXYqrtxS895uQXrR7HIIMN5CsV8xTHeRovXdQGTcXWaN2iF7J6++Mlb606lxfapSjDuFJvAdNCLLNFwOcyBp4aRAZobxSLQHXySO00RT12+in4KW83gFRPRm2fm6CKAmb5lJZBUkm9U0uY3fPeHvmZHTaowzumA4I4IkbBxNqzWZUxU60pAc/70iz3ED3JAwHV+wGDOR0P5pEtPLisQmb4nNU7Rp3E0D8B3W30EFJ0sXNJzOgaR5VZyF8qSp/2cId7ouy6z1FUo=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(14060799003)(1800799024)(35042699022)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4bs/LU2ZBN8oUzRvOXfMd+AlcDjhZvpPzHTbp4fTbgV+PbSMGxgFdkQUxA5oPq7zYfFf+EOHTuDCcw/IVE3fAFpao6Xc8HLwA+L9JTi/ms98yS2zNGInBJA+AmE5qCAKbEnebOwQ9Uw8TGonlFSQwjIdl2xTatU9m6W5MCgtS/aFsujeOGqFaTxnOy3PiW7ajWaArumtM74d0nNEZlwdUodRnh+QiJ5d34dY2fmt21KWxIUB1OssDDcAKXR4dUmXVDVeK1Gov/WEuIHMvEqBKtZ8oUbzIiVgNI5AT6WDXKDecB/7hXnSeUp8AUa634n9zaKQlkRfWDWKJzkMUTKEgSsCHjH1wQN79P8RRgNDRB002Il+bcFOGaWezQ1sQkABgOpxwGLMfR2XdobqoQn1/aadb12tlI6QljIBsFUo91/PCXTiROiMyA5b7nlAbQDD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 15:07:14.3120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403cd5bd-add2-4e82-0784-08debccacd19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_080722_097677_F06E1772 
X-CRM114-Status: GOOD (  18.19  )
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

SGkgVmxhZGltaXIsDQoNClNvcnJ5IGZvciB0YWtpbmcgc28gbG9uZyB0byBnZXQgdG8gdGhpcyEN
Cg0KT24gVHVlLCAyMDI2LTAzLTI0IGF0IDEyOjU5ICswMDAwLCBWbGFkaW1pciBNdXJ6aW4gd3Jv
dGU6DQo+IFdlIGFyZSBhYm91dCBhZGRpbmcgc3VwcG9ydCBmb3IgYW5vdGhlciBHSUMgdmVyc2lv
biwgc28gaW50cm9kdWNlIGENCg0Kbml0OiBXZSBhcmUgYWJvdXQgdG8gYWRkIHN1cHBvcnQNCg0K
PiBuZXcgLS13aXRoLWdpYyBvcHRpb24gdG8gc2VsZWN0IHRoZSBkZXNpcmVkIEdJQyB2ZXJzaW9u
IGF0IGNvbmZpZ3VyZQ0KPiB0aW1lLiBUaGUgZGVmYXVsdCByZW1haW5zIHYyLCBwcmVzZXJ2aW5n
IGV4aXN0aW5nIGJlaGF2aW9yLsKgDQo+IEhvd2V2ZXJlLA0Kbml0OiBIb3dldmVyDQoNCkFzaWRl
IGZyb20gdGhlc2Ugbml0cywgdGhpcyBsb29rcyBnb29kIHRvIG1lLCBzbzoNClJldmlld2VkLWJ5
OiBTYXNjaGEgQmlzY2hvZmYgPHNhc2NoYS5iaXNjaG9mZkBhcm0uY29tPg0KDQpUaGFua3MsDQpT
YXNjaGENCg0KPiBmb3IgR0lDdjMsIHdlIHJlcGxhY2UgdGhlIHByZXZpb3VzIC0tZW5hYmxlLWdp
Y3YzIG9wdGlvbiB3aXRoDQo+IC0td2l0aC1naWM9djMgd2hpY2ggaXMgYmFja3dhcmQtaW5jb21w
YXRpYmxlIGNoYW5nZSAoeWV0IEkgaG9wZSB3ZQ0KPiBjYW4NCj4gbGl2ZSB3aXRoIHRoYXQpLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgTXVyemluIDx2bGFkaW1pci5tdXJ6aW5AYXJt
LmNvbT4NCj4gLS0tDQo+IMKgTWFrZWZpbGUuYW3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDggKysrKystLS0NCj4gwqBjb21tb24ve2dpYy5jID0+IGdpYy12Mi5jfSB8wqAgMA0K
PiDCoGNvbmZpZ3VyZS5hY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMyArKysrKysr
KysrKysrKysrLS0tLS0tLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pDQo+IMKgcmVuYW1lIGNvbW1vbi97Z2ljLmMgPT4gZ2ljLXYyLmN9ICgx
MDAlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0NCj4gaW5k
ZXggMDE3OGU1ZC4uMjcxMDQ5NCAxMDA2NDQNCj4gLS0tIGEvTWFrZWZpbGUuYW0NCj4gKysrIGIv
TWFrZWZpbGUuYW0NCj4gQEAgLTg3LDE1ICs4NywxNyBAQCBHSUNfRElTVF9CQVNFCTo9ICQoc2hl
bGwgcGVybCAtSQ0KPiAkKFNDUklQVF9ESVIpICQoU0NSSVBUX0RJUikvZmluZGJhc2UucGwgJChL
RVJORQ0KPiDCoEdJQ19SRElTVF9CQVNFCTo9ICQoc2hlbGwgcGVybCAtSSAkKFNDUklQVF9ESVIp
DQo+ICQoU0NSSVBUX0RJUikvZmluZGJhc2UucGwgJChLRVJORUxfRFRCKSAxICdhcm0sZ2ljLXYz
JykNCj4gwqBERUZJTkVTCQkrPSAtREdJQ19ESVNUX0JBU0U9JChHSUNfRElTVF9CQVNFKQ0KPiDC
oERFRklORVMJCSs9IC1ER0lDX1JESVNUX0JBU0U9JChHSUNfUkRJU1RfQkFTRSkNCj4gLUNPTU1P
Tl9PQkoJKz0gZ2ljLXYzLm8NCj4gLWVsc2UNCj4gK2VuZGlmDQo+ICsNCj4gK2lmIEdJQ1YyDQo+
IMKgR0lDX0RJU1RfQkFTRQk6PSAkKHNoZWxsIHBlcmwgLUkgJChTQ1JJUFRfRElSKQ0KPiAkKFND
UklQVF9ESVIpL2ZpbmRiYXNlLnBsICQoS0VSTkVMX0RUQikgMCAnYXJtLGNvcnRleC1hMTUtZ2lj
JykNCj4gwqBHSUNfQ1BVX0JBU0UJOj0gJChzaGVsbCBwZXJsIC1JICQoU0NSSVBUX0RJUikNCj4g
JChTQ1JJUFRfRElSKS9maW5kYmFzZS5wbCAkKEtFUk5FTF9EVEIpIDEgJ2FybSxjb3J0ZXgtYTE1
LWdpYycpDQo+IMKgREVGSU5FUwkJKz0gLURHSUNfQ1BVX0JBU0U9JChHSUNfQ1BVX0JBU0UpDQo+
IMKgREVGSU5FUwkJKz0gLURHSUNfRElTVF9CQVNFPSQoR0lDX0RJU1RfQkFTRSkNCj4gLUNPTU1P
Tl9PQkoJKz0gZ2ljLm8NCj4gwqBlbmRpZg0KPiDCoA0KPiArQ09NTU9OX09CSgkrPSBnaWMtJChH
SUNfVkVSU0lPTikubw0KPiArDQo+IMKgaWYgS0VSTkVMXzMyDQo+IMKgTUJPWF9PRkZTRVQJOj0g
MHg3ZmY4DQo+IMKgVEVYVF9MSU1JVAk6PSAweDMwMDANCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi9n
aWMuYyBiL2NvbW1vbi9naWMtdjIuYw0KPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUNCj4gcmVuYW1l
IGZyb20gY29tbW9uL2dpYy5jDQo+IHJlbmFtZSB0byBjb21tb24vZ2ljLXYyLmMNCj4gZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYw0KPiBpbmRleCA0Mjg1OGRmLi42ZjQ4
NmM0IDEwMDY0NA0KPiAtLS0gYS9jb25maWd1cmUuYWMNCj4gKysrIGIvY29uZmlndXJlLmFjDQo+
IEBAIC0xMzksMTIgKzEzOSwyMSBAQCBBQ19BUkdfV0lUSChbeGVuLWNtZGxpbmVdLA0KPiDCoAlb
WF9DTURMSU5FPSR3aXRodmFsXSkNCj4gwqBBQ19TVUJTVChbWEVOX0NNRExJTkVdLCBbJFhfQ01E
TElORV0pDQo+IMKgDQo+IC0jIEFsbG93IGEgdXNlciB0byBwYXNzIC0tZW5hYmxlLWdpY3YzDQo+
IC1BQ19BUkdfRU5BQkxFKFtnaWN2M10sDQo+IC0JQVNfSEVMUF9TVFJJTkcoWy0tZW5hYmxlLWdp
Y3YzXSwgW2VuYWJsZSBHSUN2MyBpbnN0ZWFkIG9mDQo+IEdJQ3YyXSksDQo+IC0JW1VTRV9HSUNW
Mz0kZW5hYmxldmFsXSkNCj4gLUFNX0NPTkRJVElPTkFMKFtHSUNWM10sIFt0ZXN0ICJ4JFVTRV9H
SUNWMyIgPSAieHllcyJdKQ0KPiAtQVNfSUYoW3Rlc3QgIngkVVNFX0dJQ1YzIiA9ICJ4eWVzIl0s
IFtdLCBbVVNFX0dJQ1YzPW5vXSkNCj4gKw0KPiArQUNfQVJHX1dJVEgoW2dpY10sDQo+ICvCoCBB
U19IRUxQX1NUUklORyhbLS13aXRoLWdpYz17djJ8djN9XSwgW3NlbGVjdCBHSUMgdmVyc2lvbl0p
LA0KPiArwqAgW0dJQ19WRVJTSU9OPSR3aXRodmFsXSwNCj4gK8KgIFtHSUNfVkVSU0lPTj12Ml0p
DQo+ICsNCj4gK0FTX0NBU0UoWyRHSUNfVkVSU0lPTl0sDQo+ICvCoCBbdjJ8djNdLCBbXSwNCj4g
K8KgIFtBQ19NU0dfRVJST1IoW0ludmFsaWQgR0lDIHZlcnNpb246ICRHSUNfVkVSU0lPTiAodXNl
IHYyIG9yDQo+IHYzKV0pXSkNCj4gKw0KPiArQUNfU1VCU1QoW0dJQ19WRVJTSU9OXSwgWyRHSUNf
VkVSU0lPTl0pDQo+ICsNCj4gK0FNX0NPTkRJVElPTkFMKFtHSUNWMl0sIFt0ZXN0ICJ4JEdJQ19W
RVJTSU9OIiA9ICJ4djIiXSkNCj4gK0FNX0NPTkRJVElPTkFMKFtHSUNWM10sIFt0ZXN0ICJ4JEdJ
Q19WRVJTSU9OIiA9ICJ4djMiXSkNCj4gKw0KPiDCoA0KPiDCoCMgRW5zdXJlIHRoYXQgd2UgaGF2
ZSBhbGwgdGhlIG5lZWRlZCBwcm9ncmFtcw0KPiDCoEFDX1BST0dfQ0MNCj4gQEAgLTE3NCw3ICsx
ODMsNyBAQCBlY2hvICLCoCBEZXZpY2UgdHJlZSBjb21waWxlcjrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoA0KPiAke0RUQ30iDQo+IMKgZWNobyAiwqAgTGludXgga2VybmVsIGNvbW1hbmQgbGlu
ZTrCoMKgwqDCoMKgwqDCoMKgICR7Q01ETElORX0iDQo+IMKgZWNobyAiwqAgRW1iZWRkZWQgaW5p
dHJkOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAke0ZJTEVTWVNURU06LU5P
TkV9Ig0KPiDCoGVjaG8gIsKgIFVzZSBQU0NJP8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICR7VVNFX1BTQ0l9Ig0KPiAtZWNobyAiwqAgVXNlIEdJQ3Yz
P8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAke1VTRV9H
SUNWM30iDQo+ICtlY2hvICLCoCBHSUMgdmVyc2lvbjrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAke0dJQ19WRVJTSU9OfSINCj4gwqBlY2hvICLCoCBCb290LXdy
YXBwZXIgZXhlY3V0aW9uIHN0YXRlOsKgwqDCoMKgwqAgQUFyY2gke0JPT1RXUkFQUEVSX0VTfSIN
Cj4gwqBlY2hvICLCoCBLZXJuZWwgZXhlY3V0aW9uIHN0YXRlOsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgQUFyY2gke0tFUk5FTF9FU30iDQo+IMKgZWNobyAiwqAgWGVuIGltYWdlwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJHtYRU5fSU1BR0U6LU5PTkV9
Ig0KDQo=

