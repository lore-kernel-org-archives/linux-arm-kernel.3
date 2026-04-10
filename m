Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06493F459EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/3y4hYTHmLn7EvY87LiVgpMgno/IVbCEtP4uMNGXSw=; b=FYOt4TjTo//Zk3882Uu4L9mjvP
	lz8NcZ48AqX85ziGH/U80WxPuSOQFcOpt1bI18ydN4V7L6t3D3KQ54NaLVNyQJqahJyt8s/RLKlrU
	k01ZDCrCYnjhLNJPODxTfI1q90iEcyru2i+zqVnXi0MiV8HWTiACj31/Wg7fr1Qkbsjb0mJT6mkI+
	SDxJX+RxF0QHpQ2T1h9WxetsXxNCatI5yJGjMcWFzv0Lbi3ceswnWItzhDFRd4GsPi9DRXwmgz2Hs
	X7oa6BlWhwmMHnR0p4aWaKr+66znh90S0whh/kDNrvAbHfVv+7gfrUuT3pColAWO+MY/f79ocGKpD
	wf1b1dHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEti-0000000CYOC-3srM;
	Fri, 10 Apr 2026 16:39:58 +0000
Received: from mail-westeuropeazon11011051.outbound.protection.outlook.com ([52.101.70.51] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEtf-0000000CYNZ-11W4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 16:39:57 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DxaY7vm3ZuJNp5rleev8jeaJAOcDuby9kcQlkqxxElgf37SDLa3NRYnus9dz9rYb3xg8aWqweVEhMUIB4L+Ft6bhTmGMrGgrJr5f3z+xeYsWvw9Majewsqj4ozrQ+FOGgqv/ySdubl4sUD+iybCeCZed9fLsfkegLY1+YSwXmyXA9U92v0sVrCiuv72zJsA12BAp8M8+6CF1CYZnHP++bQOanyyMYt1FHp8s2sFTPeBQXIOpbZcDFKZGNxTTBUIKbDUZj0ZppF0ORuxg6rXikluO6ohHwOo5pwEmjAXrBoFT73QGbHvhoA3KTkuPwIeWENHf8/sjwt0BMfSSFJ80Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/3y4hYTHmLn7EvY87LiVgpMgno/IVbCEtP4uMNGXSw=;
 b=rkNtV5E3PRpugtgTCgrF6qsrSBe06e6/NGA1RtOk9ctZXlvySNvn5F+5KPg2qGnvERXkBUMeCF2LH7HM08JfFKgBpJuZeZ9egCH5mJunqPaBAqa90MABsGouOabkiPwgxFQKJR5kNm8wHqTGanVhD1gD6OOuEMHWKvvXhrAulQ8gxz8iaJLkQgFff1VcXM6GjnVS8T9FnKwf0wca34u1VxnA/f77CrI+bjWIXSGy9x1AOGRjIzAS4i5DK4j5zH+HHfzFz9YJcITN+dlLpIRLQDIn/7iRFmB5ABCN1RJe5veKo8m1keddAIdOoh/v4Xkls3r7C9KRaJlRpSGfq/Jgfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/3y4hYTHmLn7EvY87LiVgpMgno/IVbCEtP4uMNGXSw=;
 b=k7Vh3A2QNtDeIOW4rqR1zEUWaraN/HJ8cyW9suT20CkrMg1ceTXak31RxtWc2faGD+WJJionGq1J9Xpk90AaO2qQO8HyTO9Y8fuEtVh2f/fDI0LzoVWpks8WletYFGMV0VL7bJuJExo4/L0EYceWjd277k0OFnZgJ/Mh84Cd77s=
Received: from DUZP191CA0065.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::6) by
 AS8PR08MB10345.eurprd08.prod.outlook.com (2603:10a6:20b:57d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.45; Fri, 10 Apr
 2026 16:39:48 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::5a) by DUZP191CA0065.outlook.office365.com
 (2603:10a6:10:4fa::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 16:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 10 Apr 2026 16:39:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTkQZuVjK6OWOO2J3nfcRPSBvZxI4yZZPp4cVCm5Ao+yFQp5iMo9JBDKei6w8rKd11/Dgmyw55hYMNgyC/YUJn4meMZ8Fn67UVglRVZH0yagtkPRZO4ZFrzUPwerI5IqEjI47ziyQkrSw3FO2h9I5tC2MKabopuu6yda2r4m8+wLrwo0vkXXuJN8DXYHNCuQKK4lD88SVoc5GHzAaxOcrkR+t4JuqTi5FrhS1JCkAiC3l76bQ1ioRDFFgVNhjlsALZ2pEgkIiobUoyHXHOPq5li3z62pY+swIqDTYj6JuqDh4J31CQVXhFTol7xzml7sZRWZk10/tmKZvcGnovxJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/3y4hYTHmLn7EvY87LiVgpMgno/IVbCEtP4uMNGXSw=;
 b=OiT2Li4DA5BCVvB3O0zIf0lagmRA3fJ2FC/tUz+yTPbFsAQi76/5dDwBN67fZeKgz+gyprgWXKVEzlURwo5P+U3KAGs7b398KBCrTiLndmb7+B1cO8mYr3DVYM1ikFkQh4cN3UE6aGoLfkNEhawch/4w6wE0UOICffTRY1rBXW+rSKa5uZUgzKNg+thu/qrZd7QgO/mgHXXgQCtAzhcEgKu0cOzDaWSGK+7IeHTZ6dXbFpk03+pi0uWSTi4jCDxpdkb/AMxcv7gS4tpSuyt0rkvA1wZ9hk8NgPXRHXkUjt/KjPxupiulqCOR0NvFwbI5YMryNbiR75gB9MqHm3iJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 172.205.89.229) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/3y4hYTHmLn7EvY87LiVgpMgno/IVbCEtP4uMNGXSw=;
 b=k7Vh3A2QNtDeIOW4rqR1zEUWaraN/HJ8cyW9suT20CkrMg1ceTXak31RxtWc2faGD+WJJionGq1J9Xpk90AaO2qQO8HyTO9Y8fuEtVh2f/fDI0LzoVWpks8WletYFGMV0VL7bJuJExo4/L0EYceWjd277k0OFnZgJ/Mh84Cd77s=
Received: from DB9PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:10:1d9::6)
 by AS4PR08MB7760.eurprd08.prod.outlook.com (2603:10a6:20b:517::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.39; Fri, 10 Apr
 2026 16:38:44 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::cb) by DB9PR02CA0001.outlook.office365.com
 (2603:10a6:10:1d9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 16:38:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 172.205.89.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=172.205.89.229; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (172.205.89.229) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 10 Apr 2026 16:38:43 +0000
Received: from AZ-NEU-EXJ02.Arm.com (10.240.25.139) by AZ-NEU-EX03.Arm.com
 (10.240.25.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 10 Apr
 2026 16:38:41 +0000
Received: from AZ-NEU-EX03.Arm.com (10.240.25.137) by AZ-NEU-EXJ02.Arm.com
 (10.240.25.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 10 Apr
 2026 16:38:41 +0000
Received: from localhost.localdomain (10.1.36.22) by mail.arm.com
 (10.240.25.137) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 10 Apr 2026 16:38:41 +0000
From: Sami Mujawar <sami.mujawar@arm.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <steven.price@arm.com>,
	<suzuki.poulose@arm.com>, <sami.mujawar@arm.com>, <gshan@redhat.com>,
	<YeoReum.Yun@arm.com>, Jagdish Gediya <Jagdish.Gediya@arm.com>
Subject: [PATCH 1/1] virt: arm-cca-guest: fix error check for RSI_INCOMPLETE
Date: Fri, 10 Apr 2026 17:36:36 +0100
Message-ID: <20260410163636.259443-1-sami.mujawar@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|AS4PR08MB7760:EE_|DU2PEPF00028D0C:EE_|AS8PR08MB10345:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8bf913-c4e5-4437-84d3-08de971fc7a1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: VQYu4cKSn69a779SM0l2SOQ4YDhpYTUqBHddm3PVjiHQitCHwoJAGFUlq4n2iaII3XMjZ+XvYo4r9PQH0eywVYUZujU0HaZHmE72vy/P25K8ct8Gn5aCTnrfSFzF9WK39EcgnFuX/sWBOIjub6/PCKzGlldwuLuKYIdi7P6UZ2iStBbC13rLMqCC1VQqPlDLt0n+eEPUEIbNEZ/nYtQMJeVO9v1b6te6/SCndQHTs0GuUzut5blQPg5NDhjz+ZpQe79oIivADiced0Dp4x40f0ePEz26mfVExzGiyEq129VvzCcqVuXHlObn6b7YBeoH7ovuKdaLC/eQRFj3q8uC6qSiV6WcISQFDKc0xAET+mUWjRZt1cSE0y83K0bBho3sHPnjyL9c9EUnOaQM9Ax/EtEIlt2k/fQdgDz+ntXEI1xdPTtQkPx0hqcW/CLOdxjNdSGlEqSJzzmPxT2vO5Wb1nmBunGBjDKnFp7nAopQQeWJc49MaTw5NtOQfTKy+wgFcqoG8IPBUkdrR42ERuYLgD92jW7CZ79yBMqvfilXDodpW6+Xh9rdDtcEQdhbPrDrugnmbFU7+c/p6BOjS27P/WmgLAla5EkseNhJTEb4f2DJdKJkAYccZ3nCV2Y29fuDq1lAFCmhcp4FN6Q18lqHkPaISHE6//lV1Yp0e179HiyeU/79ihQmYlfPpy8i3kndCebuqDfVYU04FSp4Vzgi9VNrF2ISMJQAtHY8SjpY7GNTBlJiFeaiduUxo2rtOR6XtR99HhNdE0rPjokBHEzhAQ==
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: rTOIuhdnOD9SdzxKODOBsqIN5mkLZTXonnmXaggi5fIfH7y1a5VTzYrkNjk/qz9S+Zw9KoSHn/K11rVQtkGmLnjFqX9l4vcvG+OKdHOOQ1pIq+pj0N2+QASG/oR5Tcqaoljo7WAHBluQkAl3yVsd6NF/L31eUwNbMLG6deph2BYiuv/CkUtoU2SHvlsbWsUuY835Xs3ISKVOnJyaiRfLbxj3YwXQB6ulaUJ+gBpzoSzA2paX3NFxFau6WO/xJiNP8aV1iU/0ax3kdh6Ge5MSU2oqPz9pE260vlIoNKzo2Y5vmSyHpCed6ULsuJDraQZW+oThoqZbEE26TEA2lxoQCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7760
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 528900c6-08ed-4033-6aef-08de971fa13f
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|14060799003|376014|82310400026|35042699022|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: GwhjHFeSTgNjuSj391LZIDlGVZd2/9jqerHXY22o4e0TGa91BRAFOw+ymeN2KDqb0CphEM4x62SWQrk0XF6OYk9fBq0XYM93O5luVE1Uj7mBwf/hCccQzJLR2tfOD5rmDa013D67oFJenRnvinI9v8RnW+4XbEIMCccaZh6TjetPOK4N0IhleFchDJIYDSrlaVfOA1TUIY1D+qlMEyjWnHSHxFBnVjFlrh35YyuyCEoMJukM7WRPgYaBLfz+AuEXpj1hBipkN/FnQjsZpOj0/R1c8sa47OkhE+jum/liJVzakYXp3KjAweXXiOnojlXeU/NcjS32W5a/rJmWtjx/xpaHpKOxzy4DffMUq+zlAfnMAq6Ye8flQY5+UXvyzwPQ3jdepB0/lEaBQgitVFVyWR9rNaj+Z+JXPOgvaEnJjIFn6wkO2IVkoPHF6gAMj1EmVWIfKLgd24CrtxxHVEtaiOSCrbsZQem36mP5cNiQAggveisskPSFwU68iNPWoZaMFyn1yh3o+fGRFSsI2vIrM+sCuJ/C3ROw/7r3toVwzqq0zyJFQAHkn9yUNiogwNHWixrUVvZbf9FQqj9q0DKvYVO2j1ITAVjrNzKelpeH9aKq0VqcmhEjw8r7SU15Q0W3zRN8a4rdFnNC9bzqXiZQTL4LC9BzqEFastl+IkeVkKCK2yuAxaesQQLutf42Kft0JrVT/o9wZi6iutIJng/V5fSeQH9zFOrneodjR/7HkAUWvE5cwmOni2g2GD8xBFeUiQdbSMKqd1FH5qlg0lcOlg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(376014)(82310400026)(35042699022)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u60acijK9nX4sthD/X5Pw/msZsycByouWbRxaMrS6O0dKZLuX66z5VFC4PSZYshEfAjhv6UpHa/oWlQuJ2TdT+2lLS5+UZ9QKrmb2av0+rW7E71lzcvGmcWAIASb7MpL7yrHYK5XdnEHOvhjEPj09O5wTDXDrND6QTyPjS+Wo7zIajO3eI5+uaVcyw1dt6NQNAQZyy+iklFQO8M+vGUsnIz9ukXu6N3JM5xlB9s9DegnEnKHl0PhSnyfjQf5LrE2u6xqfa6xs1t+qUU4ghnECzYpoqwddDjFMeAdAod/OIHZYsWbSWXw3aCQIRlwBaBeAEY7YjEvgJp3z8mvRvYYmaH6wkoSy+YJY3esKdqf49G2aCU1KqtUFec+8Jfv74dkyQmQNnvhMmI3tlRQf6ofVrHVvMY1mRSd6O+gglRZM6LdeUC9NfwjfQl0aMs/MCt5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 16:39:48.1252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8bf913-c4e5-4437-84d3-08de971fc7a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_093955_380989_75A0E74A 
X-CRM114-Status: GOOD (  11.05  )
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

The RSI interface can return RSI_INCOMPLETE when a report spans
multiple granules. This is an expected condition and should not be
treated as a fatal error.

Currently, arm_cca_report_new() checks for `info.result != RSI_SUCCESS`
and bails out, which incorrectly flags RSI_INCOMPLETE as a failure.
Fix the check to only break out on results other than RSI_SUCCESS or
RSI_INCOMPLETE.

This ensures partial reports are handled correctly and avoids spurious
-ENXIO errors when generating attestation reports.

Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
Reported-by: Jagdish Gediya <Jagdish.Gediya@arm.com>
---
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 0c9ea24a200c..66d00b6ceb78 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -157,7 +157,8 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 		} while (info.result == RSI_INCOMPLETE &&
 			 info.offset < RSI_GRANULE_SIZE);
 
-		if (info.result != RSI_SUCCESS) {
+		/* Break out in case of failure */
+		if (info.result != RSI_SUCCESS && info.result != RSI_INCOMPLETE) {
 			ret = -ENXIO;
 			token_size = 0;
 			goto exit_free_granule_page;
-- 
SAMI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


