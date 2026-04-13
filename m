Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C318CEBFD1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QWN6rL2r/xYAa5DXD7V2SgRbgtZfpFgvpc2OtYyFwU=; b=ZCHJy7jJwAiHZTPOM+7Lg9t7nN
	I/wHoE2Myse9wvmFDFTJGkLkA76Jnr1ftGYreWinufV3t/jK28XxBcp5T3FonWhEDqa+qaQ86GBgS
	C+l8BKQ5feq3joA1BrENqVyAbytqH19ehhgunJFMxAqk4ke2Nz53YlHNMEruBW68wd3oU8bbHDrcs
	qN36C9CKf8DTMVIVtbY7ZWZtIUkvVeZzTXaIvQOVTloBtHas9mKDpdW+GqI3wkrkJ2R2ndsRVa4Er
	OvQcdnqwjMsbU+zMk9CUMIpiN0/T6Gl41aYilopGhJ5JRhcw9pVTeXjOalR2l9vNGIPAzAvMX+T0U
	dufNQTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD26-0000000FIk4-1yS5;
	Mon, 13 Apr 2026 08:52:38 +0000
Received: from mail-northeuropeazon11011053.outbound.protection.outlook.com ([52.101.65.53] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD23-0000000FIjI-2dV3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:52:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kHQVyvKZr9FAPMG6xhzMkm1cL7kJGJcPrdKvi4rrgTHSwFr7guD+IwgGl/QnBlOUNY0Dj7vPcfMJPgW3lrKn3QkzBmXbebltXgdVBuCWFxaKhGo7XXZe/erP+hdjk+SjAbDdVym5s7Ld3howRZIjFf4bbNa12iz0Vgc8ZHl6unBXWfwJPjNac+MOJwrr5OQF5mdd+rz5eC7OslbLohcPwswpg15/i3t8otN8N6EhagD/QVnyxtGYvuddeqxDzbDF28JOP1Ir7UAOvcw2wx6RuIJpiDdLHar0xPpwF/ErETAmSfMJShuNYGE5ZtrwFL9gjsMaf+ZPhZKLrCHpsnPeXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QWN6rL2r/xYAa5DXD7V2SgRbgtZfpFgvpc2OtYyFwU=;
 b=aNKbDOrLcApTtC57RXMFwXrTMmhn7476eqQn0wOBH/bzCs3/GGKrGbY0OewiZe4VybLnT8AHov494tH3JfubWfoyQiAsYXy63zZVWuUw8ZITABQjFpbVzxdx+dWlc9CXocscCXcVA23tD2u6/Ybp0xcBxDc/MFM+auFWUM8MdAWEUkoQmbOTQMZc5OZ6f1VERJpccyzvbJdVRuNpcp0AHkCvs+d1tqBxOnScD1HmB3IdWEu1/8GofF5jwgbxsoyV5tagIcW2zdN5msj+0WjFujKkkNKD+Z2Ts1INXuAdfXM8Uy3yfNHMCq63t+PHA1vFeWbXhV9sCfhWY1UHl1RU3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QWN6rL2r/xYAa5DXD7V2SgRbgtZfpFgvpc2OtYyFwU=;
 b=LuOjeYkpL/mdb98BrK6u14Np/wz54TvtgL6WChwD8uJVQozkeTPB0aXYLnivSBumBMQQW+dG7t7gZSQKthy2wdezASZnaE84HJQwtdfaIw/Q/POxlnPgbRdweM6aTNlcAPTUftnaYnq42MW5M66ty0FetSEuXHfQwhWxxcd0XR0=
Received: from DUZPR01CA0254.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::26) by DB4PR08MB9864.eurprd08.prod.outlook.com
 (2603:10a6:10:3cf::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:52:25 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::66) by DUZPR01CA0254.outlook.office365.com
 (2603:10a6:10:4b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 08:52:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykRhNQPyZYWP9M7SxBtKcovvr0pJ7LX5wsL68OHlHw+qXIMg4YXkdVYHdaZ1m2Jm46XzaeIJhACG9EqlEVw/z5YbtFPGHJpOKgFbvK06ERqKFAHiEHXLj3sDSv/cbewl29/lng+bIzObdIInSDRPuQ9iFHbB2VeT5jg6PF9lZAwRRWf9UqwYUrUl7lUu2WHcsW4HNIRUZ/Z6dxCXhop9J7lHHpskSahuGidYaM5lZXDPmZKT/KF70SA++ugT6+6XLNT1cDnijZHRCJpUj+ohr1Mcu0g0JWhLOSytfhtnPuJQI5+v+yqpEQl8JEOh5JfPxxVTVwjqCu/5q3YFpsG+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QWN6rL2r/xYAa5DXD7V2SgRbgtZfpFgvpc2OtYyFwU=;
 b=eRkZkkKDJ3f7pG8e51gs30OamlexoRpFGQTs7CF/uH6Iq7DlSJMhyXE0PBXAk/J6NH16lZF6LSxiHRf3hB2osUiA0Fwmi29xUR33V3kDwF/Xn3oya9SLjjuqg6ZqdVH0dOsH7q1LP4JrkeVRO1l6nDwlut0fl++U/0JTIdow9FS7GnrQAMIUYM72wT8B0b/N0G+sjb6d/GUINeUHXpz/VKeZaba9tJiparYVpFqQdEXm2suJzSFgmOuSrZvFw+emGJ7y4iGdFl60BUKRizEmgY5/YACr7LFs9T4y+J/5qEaBmhiQSoo0JaCrLoqH1QFyoaLLZF8RLzKnN5/yKKXaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 172.205.89.229) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QWN6rL2r/xYAa5DXD7V2SgRbgtZfpFgvpc2OtYyFwU=;
 b=LuOjeYkpL/mdb98BrK6u14Np/wz54TvtgL6WChwD8uJVQozkeTPB0aXYLnivSBumBMQQW+dG7t7gZSQKthy2wdezASZnaE84HJQwtdfaIw/Q/POxlnPgbRdweM6aTNlcAPTUftnaYnq42MW5M66ty0FetSEuXHfQwhWxxcd0XR0=
Received: from AS4P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::15)
 by DU0PR08MB8710.eurprd08.prod.outlook.com (2603:10a6:10:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:51:19 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::c4) by AS4P189CA0025.outlook.office365.com
 (2603:10a6:20b:5db::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:51:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 172.205.89.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=172.205.89.229; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (172.205.89.229) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 08:51:20 +0000
Received: from AZ-NEU-EX04.Arm.com (10.240.25.138) by AZ-NEU-EX03.Arm.com
 (10.240.25.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 13 Apr
 2026 08:51:19 +0000
Received: from localhost.localdomain (10.1.31.15) by mail.arm.com
 (10.240.25.138) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 13 Apr 2026 08:51:19 +0000
From: Sami Mujawar <sami.mujawar@arm.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <jgg@ziepe.ca>,
	<thuth@redhat.com>, <Suzuki.Poulose@arm.com>, <steven.price@arm.com>,
	<gshan@redhat.com>, <YeoReum.Yun@arm.com>, Sami Mujawar
	<sami.mujawar@arm.com>
Subject: [PATCH 1/3] arm64: rsi: Add helpers for Arm CCA measurement register operations
Date: Mon, 13 Apr 2026 09:49:55 +0100
Message-ID: <20260413084957.327661-2-sami.mujawar@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413084957.327661-1-sami.mujawar@arm.com>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|DU0PR08MB8710:EE_|DU6PEPF0000B61C:EE_|DB4PR08MB9864:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3aef6a-19cf-43c9-5b2d-08de9939fbda
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: i7NMYoD/hj9cDUAbmAyC3N/Q1LLsBeQ0Ck1ooK2rteg58/a55tfYwvKEudXThYSttsGa818vq5rTeizm5kHtL9SIk4fihqm4KFT/wKzZXAsg6U+GAxnW126VvF5vdXc4cgIa5eQCHN38iO9Jpi122nFNCFDPC0rOfz0vTTgAyJ0ydD6LcfBdWb1Ddxk+5TiwwI5Voj+oHOh+f2E8oL6Im2jZNylcFNggXRbjf08sK9G4oJ8Lc2SOgJzFAMZ4qwb/d5lYy0WdrjzFWar8DqhgPeiIXco0kGkms+VaDE8W1rV1wJhdj8XwlUdS8n0wv8PGB0NlyuoYNJ/NkFnyF3dpOsdpvcriAU0c3tOocsDylFt0zZih21RXLAfsCGGbNwLxF37bU7TYL0w26J9KuiPW5OH32+hC9Y6W/TeM+J6MhhsPGXFsk5EeH0EMSnu6vhoqtvBUHacw9Cn/woWmd5wx5cw1Jw95Haj6vuMIUfpVKwnsNvXfLtWwgWMbkMHsalx9wwGzt3GHfbyQl9Ex71weA3+v/boc0vxZOPERr3Mht4az4M1XmhjCKtv/prM/vSf1OxfVZ0GLbDcjsEGKX7a3q6kr9KkRUW+hst65afi2xPyV5J615Ta431bGxT2iTGp7f/x0PE3yZFqoz52/K5p8oRG51wld5RdibpHfsgVYWDxczGs2/3pjSDskC2DyxhR3czGA9R9KmS1SGvRP9RYHOcdjZry3Fsd2POfyIWqMLyJdKhB/79XUjjSW1w8Jj+Md++pTty/DgINE9S32kTIQ2w==
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: NdHzrtTcJr/NI2DNuxN8/8N7qtlDutrMj5rYsrcMSckdIUixu5r2iUE+QZvqSrwxVoIWnIAU1m+PPrVyEY1Klx7tUlHBTNZ1K2EloLB7GRBg4YcW13Gpv0ssGc3RQwVjYu4Cgqli75Tk2yReLQLZPr85TNukaNITS2Ga24+3AMTdFT2CFG5LunwSFxFG71Esp53GUAspo91/T/NNvyLPgd8ZSBPEw93Gxklxzu6jPDADPSis9YFc6rvi2TIpjfkQy3IlOz7azUJSGap+24wbB5RTQj2+3xF0doRL4OfOItuKyiKQLbHgyMgs8ZapwPxUhsKN+VBGw5hMqRquP+u+gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8710
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4cf558cc-d88c-49e2-dafc-08de9939d585
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|14060799003|1800799024|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: UEDr+IIj3CUBesK03hk8tS06ARAqzSm8gGp0CV6YDLJPNLj/++volaVGuknyrs6xyP3uJ7TE2HlS8LV6OYnHoqFtKQIfNGZplBGHMbWhm7rwf4Z4Y0HbMT9vTPDxl6RwgmRnYCxmR+VFetVV1EpnYkRCo+EAV1iEuKhh05r93/L+m763nr6rM+jpqAjl4Snb39iys1NDNyMsJX1uIjp7A5EpIp8+L36SUHsjaUcRQ+A5RZUoaxdo6xfAFPM0QOja7s7ECri8H2a4m2FMBNwQSfGVssZiGZzJSohiaKQp9hrqnsbYJrwzP1YNuhX5ZzfoATTiDuB9LcOPajPo89lxPeK5KZ6TUQzRBIme3fT985hnK8lvAd5XcYujdpoQhVWaAUhkYyYpG6ndsI/O+WkhnaokZcJPXUmvSpX5AOb7UU9LUsQwPC5xHt0Ed5Exy1iFRa2BkfztPDKAvO7mSVIeMDaKiwdt7hc9mHnJaakqbCaKzPgx+jY8Dw33OyMBL3pWS4gJrYiPQAPfQ99rk8EuEyNauYOJ56xH+O4I6R2L3UW05vEBN9Ljg+4AP9ZJ04MZ+tg+V+79GqncEY2BbPL4ksBS5B5ZZhv0qcOJgJCww4O5oyH26r/j7slCr0IUZCwEPSSqcDi0aD1iGjGugQgifZ7abqEF9fuGmIutIJfbZhXOCD2wVIPGZQSDZs0o6iHW7LkpkMNHJMFQRVzIB5yllXvfGwG5q3Oq1YDyCBbjwj+DUCVFl7lbpQeSZHqdUcW6923YYELADzJW8854OTwFQg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(14060799003)(1800799024)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VQTMTngBSYitaxQ5pVilnWii3L+3E7V9yTp6zM0LOTaCEFcTH5/Vzwbq7vuhAnQksBSJPpkNYX2BTyMyz+j5C/TETAEA96g8u++rh3lELrRAEBCbfcLxLjl/MQFVgx/z9WkSC7lV1L2BrZo9knsQMgrAPzkVptlND9BHEHVIbhdmOk4TsoGTCJqGly6S2Tzh6+504SWKs78KbQwTNuOQZ5ZXtoK6myWlMcWhWx6mWThvi3KuSKMgq0Q2MNXljClh8yWZGlWcIEWNbI/9xfNQ7rCmSg67n80zP5qSNLpLL/xoeIm0dmKOQ6dfdlI6opoKTsPwLzMsemx1tYFA+6hUnRSQaVh6x83Tw5obnIEKd8a5cNN5QI0NACJ9C9m/C2vPwRYzKGXSl7Fqdfza6hUtNcQU4rEFD5mns4i7IElcZq2pKAPV3iT6wLOPc4QtLybS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:52:24.9742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3aef6a-19cf-43c9-5b2d-08de9939fbda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_015235_837002_E71EBCF6 
X-CRM114-Status: GOOD (  17.50  )
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

Add static inline helper functions to support reading the Realm
Initial Measurement (RIM) and reading/extending the Realm
Extensible Measurement (REM) registers.

The indices of the Arm CCA measurement registers, as defined by
the Realm Management Monitor specification, are as follows:
    Index    Register
    0        RIM
    1 - 4    REM[0 - 3]

The rsi_measurement_extend() function allows extending REM[0–3]
registers with a caller-provided digest (up to 64 bytes).
Index 0 (RIM) is read-only and cannot be extended.

The rsi_measurement_read() function allows reading measurement
values from RIM (index 0) or REM[0–3] (indices 1–4). The returned
digest is expected to be 64 bytes.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 arch/arm64/include/asm/rsi_cmds.h | 105 +++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
index 2c8763876dfb..cfd9bff88147 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/arch/arm64/include/asm/rsi_cmds.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2023 ARM Ltd.
+ * Copyright (C) 2023 - 2025 ARM Ltd.
  */
 
 #ifndef __ASM_RSI_CMDS_H
@@ -15,6 +15,26 @@
 #define RSI_GRANULE_SHIFT		12
 #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
 
+/*
+ * Maximum measurement data size in bytes.
+ * According to the RMM Specification, the width of the RmmRealmMeasurement type
+ * is 512 bits.
+ */
+#define RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES  64
+
+/*
+ * Indices for the Realm Initial Measurement register (RIM) and the Realm
+ * Extensible Measurement registers (REMs).
+ * According to the RMM Specification, Realm attributes of a Realm include
+ * an array of measurement values. The first entry in this array is a RIM.
+ * The remaining entries in this array are REMs.
+ */
+#define RSI_INDEX_RIM		0
+#define RSI_INDEX_REM0		1
+#define RSI_INDEX_REM1		2
+#define RSI_INDEX_REM2		3
+#define RSI_INDEX_REM3		4
+
 enum ripas {
 	RSI_RIPAS_EMPTY = 0,
 	RSI_RIPAS_RAM = 1,
@@ -159,4 +179,87 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
 	return res.a0;
 }
 
+/**
+ * rsi_measurement_extend - Extend the measurement value to the Realm Extensible
+ * Measurement (REM).
+ *
+ * @idx:		Index of the REM register.
+ *				Where:
+ *				Index	Register
+ *				1 - 4	REM[0-3]
+ * @digest:		The digest data to be extended.
+ * @digest_size:	Size of the digest data in bytes.
+ *
+ * Returns:
+ *  On success, returns RSI_SUCCESS.
+ *  Otherwise, -EINVAL
+ */
+static inline unsigned long rsi_measurement_extend(u32 idx,
+						   const u8 *digest,
+						   unsigned long digest_size)
+{
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	/*
+	 * Index 0 is for RIM (which is Read Only), while
+	 * REM[0-3] are indexed from 1 - 4.
+	 * The digest size can be at the most 64 bytes.
+	 */
+	if (!digest || idx < RSI_INDEX_REM0 || idx > RSI_INDEX_REM3 ||
+	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
+		return -EINVAL;
+
+	regs.a0 = SMC_RSI_MEASUREMENT_EXTEND;
+	regs.a1 = idx;
+	regs.a2 = digest_size;
+	memcpy(&regs.a3, digest, digest_size);
+	arm_smccc_1_2_smc(&regs, &regs);
+
+	if (regs.a0 != RSI_SUCCESS)
+		return -EINVAL;
+
+	return regs.a0;
+}
+
+/**
+ * rsi_measurement_read - Read the measurement value from the Realm Initial
+ * Measurement (RIM) or the Realm Extensible Measurement (REM) register.
+ *
+ * @idx:		Index of the RIM or REM register.
+ *				Where:
+ *				Index	Register
+ *				0	RIM
+ *				1 - 4	REM[0-3]
+ * @digest:			The digest data to be returned.
+ * @digest_size:	Size of the digest data buffer in bytes.
+ *
+ * Returns:
+ *  On success, returns RSI_SUCCESS.
+ *  Otherwise, -EINVAL
+ */
+static inline unsigned long rsi_measurement_read(u32 idx,
+						 u8 *digest,
+						 unsigned long digest_size)
+{
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	/*
+	 * The digest size can be at the most 64 bytes, if less then 64 bytes
+	 * it is zero padded.
+	 */
+	if (!digest || idx > RSI_INDEX_REM3 ||
+	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
+		return -EINVAL;
+
+	regs.a0 = SMC_RSI_MEASUREMENT_READ;
+	regs.a1 = idx;
+	arm_smccc_1_2_smc(&regs, &regs);
+
+	if (regs.a0 != RSI_SUCCESS)
+		return -EINVAL;
+
+	memcpy(digest, &regs.a1, digest_size);
+	return regs.a0;
+}
+
 #endif /* __ASM_RSI_CMDS_H */
-- 
SAMI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


