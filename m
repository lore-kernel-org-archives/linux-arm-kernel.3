Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzRYzyIaR/usyhcRkkMO9ooDp9KzjNDUZG6dVhy3MqE=; b=Lzm1m1PaQoPOwNaKZfTkPS1SpJ
	9nj2QOMB6jza3H7wtVQ8yIcwOtV5SIBPpHVoY8uNVXvKQMP47b6g8VEZltgcgwp3/93YQg9QZciN+
	0Gsxf1CY+RvkleBa3zj0NnJ2OJjKKfIIpheeZWBQ2lw/D+XxBHyWh7TXz8SXkWN39DZExVevWQPT5
	Bi6Eyj3JtH3k4WrDzVVKv6DTkovuRgSlxlPayYhNwZoIBwnBs0Fhjk71l+iMueSXbQtOqXjOqMzZ4
	/8Md1tjlCuHoxN0G1sMh6H5mw34mmzrFINPG6RMaWwdj0rHdBRiKDO102n7p/MOQLAEC82LEY7Ysu
	7uObBFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUMU-00000008po5-2IYh;
	Thu, 30 Jan 2025 13:13:38 +0000
Received: from mail-vi1eur05on2061a.outbound.protection.outlook.com ([2a01:111:f403:2613::61a] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUIe-00000008p2W-003I;
	Thu, 30 Jan 2025 13:09:41 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yWAup038pqmu0Yg1fqJ/BQHySFv3vPbnlkIIIMdnCmh3Swvz30jTMkTZXDU8pwY7xNIEQepSTbp6eJUZTTGv3CtNvOGZsY8bdAXdcCA4FpYUE31GNk3iSUWX4CEGR398ywF0Mv6SXA17CFr32GigObNSp/dZ+w1fRGnuptFl7/f7SACP+BcrSIkCWSJuZcm+4W1F3BrzqY/C+kEYhCQj3JGZ4uV4SgkTy7v3zD4NRGUAWQPJStd2uVU12xCKuoW1KrEuos8iD2n9OhzMTGGMzJOXVkz9JxmbKqUtGKsKOBwrtl0O8WpjBWvOYgBvEhIqbBvCy9SiHWaBXhefBJRUjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzRYzyIaR/usyhcRkkMO9ooDp9KzjNDUZG6dVhy3MqE=;
 b=kxEzuF6zfBIHK7x9iPU4jonz+Sl48FZFi933WdLYAGYqv+YAnyagjoXoBDX2L1UnuVemD58xM6uzxK2HkfP2mgVHo4Wd7FzTiH821J44uu013NAMLpnqJyla7nndvW/XwqXTp+R1S2i+gIOSVWRLlk2Y7BVV7uB80Vo+M3mAteNFhrp47YU25gt0BpEbpNvfd8Mkl/p6JQOrYGMA6DZzCmprdNOUbaPhzWx7X5y5HNOBmmNPz8H7KsCOi6mFpBNha4cNS1SDLeB1HmlPKtlIrF6VZsqSm9Aat7ulwKPMcIkf/sOfhpB32WJCsZYHdzjsnKFbGgDSHZgqYI0fakeBOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzRYzyIaR/usyhcRkkMO9ooDp9KzjNDUZG6dVhy3MqE=;
 b=rGdbU81DdeQSkKOzYOfeY5Kc+94DgovN0FjUEr2TjJNApq/80mACLRHXSzer1JHpiHxKfgp5WWQcHCZAsjXUjavSen9oae7CAKoafF+rAX611wbqJotOH+7dyoiWs0Fbc0QcWIU4zsaSUXAYzqfqTRSlwewZrLfM/3XnOoeooOU=
Received: from DUZPR01CA0127.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::13) by VE1PR08MB5725.eurprd08.prod.outlook.com
 (2603:10a6:800:1b0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:09:30 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::f5) by DUZPR01CA0127.outlook.office365.com
 (2603:10a6:10:4bc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 13:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 30 Jan 2025 13:09:30 +0000
Received: ("Tessian outbound d1e0abd198b0:v560"); Thu, 30 Jan 2025 13:09:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c3d37ded5f250c7
X-TessianGatewayMetadata: elQEzW1ZeYfknqF/NvZTWfoBLX9C1hr64tIzMc/SLMCRx0qdx0YY0w7sfwbIVh8lK3TjNUTuadG9lkdWW4qMAd79z7pgdHr2IMzRv9MVGY4/D5WtSAkASfg+QYE7RfO2sZrNlrBmG6tQNLWfyXTR4cY15QeuQm2SpeXHL0OOqTSRZ4XkXqmzmxCzn8XFDcnrpxJ3P2F1HoPcAGLsm5Cs+Q==
X-CR-MTA-TID: 64aa7808
Received: from Lf34b4cc09ba7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4C16007F-770A-40C9-9890-EF004666A8A4.1;
	Thu, 30 Jan 2025 13:09:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf34b4cc09ba7.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 30 Jan 2025 13:09:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eu6zpTZpVstbjHxlum6nScaVaQBCk3w/nWtEzqf7trCx5ujle6rnlAjCInQbNpfRFfTGcsbQO26Pmv6VrQg72C2U+nqBwDxQuCqKIbWdkGG3+A4nPSFTnxYQaQTRBBuQEg2Soy16l7hM2CpdMh6eZqYfuQ0ApUN9IujZcXNz7l3jLcKLcGsjdJx33IkIFa+MVVE8LqdcTCt+bzlW0UI4jMEAaWrYVAbI3c8hVL2qeigx7bM3nijuQ8HOJtBSERxq6dN6MaRf+sKpGHe57VoyKNBtoz+k1kNKDiDw4w8LeXb35btvDTWzBtKXudKA1ItiPz3GPMRu4ca40OQtpaE/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzRYzyIaR/usyhcRkkMO9ooDp9KzjNDUZG6dVhy3MqE=;
 b=C2RUe91+x+YEXlCmk36faFj5xNiYza5m/8uLB1v42Xubx7o5xnFdwIyPlBqqg8BF6VzoLiLIQq+YGOmUwRXfyU+WXi5YED7RHdFbyFJqskbE797xwhXWjcecHza12obAr05QodBGYicuzd7gwvlsQ9rLV/1uBBmhI149GF7VDI7d5EsiWka0Z9kbBcnowXx2R6g+o/met1Kx+1PWxXhkTrCjSo3YSBXEXOvcasLPgGnF1lEqM6Ny7T2bKCKlqEf0bSoOzaO1x4+iCg/8B5nwYt2lPrrRoMBUJ1SFfm5HIMB8030bRaUx8Z5vUcNj9EB3KeMrhP+foIwNS7Y34c92HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzRYzyIaR/usyhcRkkMO9ooDp9KzjNDUZG6dVhy3MqE=;
 b=rGdbU81DdeQSkKOzYOfeY5Kc+94DgovN0FjUEr2TjJNApq/80mACLRHXSzer1JHpiHxKfgp5WWQcHCZAsjXUjavSen9oae7CAKoafF+rAX611wbqJotOH+7dyoiWs0Fbc0QcWIU4zsaSUXAYzqfqTRSlwewZrLfM/3XnOoeooOU=
Received: from DUZPR01CA0248.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::21) by PAVPR08MB10338.eurprd08.prod.outlook.com
 (2603:10a6:102:30d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 13:09:15 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::d1) by DUZPR01CA0248.outlook.office365.com
 (2603:10a6:10:4b5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 13:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 13:09:14 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:07 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 13:09:06 +0000
From: Florent Tomasin <florent.tomasin@arm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, Steven Price
	<steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
	<Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J . Mercier"
	<tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong Wu
	<yong.wu@mediatek.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<nd@arm.com>, Akash Goel <akash.goel@arm.com>, Florent Tomasin
	<florent.tomasin@arm.com>
Subject: [RFC PATCH 2/5] cma-heap: Allow registration of custom cma heaps
Date: Thu, 30 Jan 2025 13:08:58 +0000
Message-ID: <2255866ee9e81136a7099376b34b8305758ec9f0.1738228114.git.florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738228114.git.florent.tomasin@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|PAVPR08MB10338:EE_|DU2PEPF00028D06:EE_|VE1PR08MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb1b074-490e-4d2d-81b6-08dd412f5538
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?G/QZuaDfKvegyrQcnGOhi00R+0GHOcqYRcVvz856nH8wGz+p7Aw5VOSKxtn1?=
 =?us-ascii?Q?1NL15LETxzczD7yUTPEkZdSx/rf4InzvSD1nzwJTTyDC90FjF0uk3u7tireR?=
 =?us-ascii?Q?hna0xnDAfVxX3Q4tJF9lj3MWZwnxtBpTVj6HR9eabwOGDv48uOgDCgi6r0bp?=
 =?us-ascii?Q?gKg+aHnYJ3cS9hK7f5qkW1QWwENsVcnuqO4TcjQcwFnsHZgnVYx6DL37MU51?=
 =?us-ascii?Q?KvVdkFkRhJRYkOxLNBLaW4LK7LkjhIgyvVIl1eXEqk9Dd5WaLBJKFjUnPnu6?=
 =?us-ascii?Q?KHe1q4vKduEWAW4Nu1F/sVaDL2h4oHjU1sdmPYwykG0h/IEghW4prz0zvl+5?=
 =?us-ascii?Q?tMBoJ9s7RxjDBTQWpz3/WN6UmBu0dtWRu2UIVPfG2STrEnczaORVDk5D19JX?=
 =?us-ascii?Q?/c9EQWW/dtm090YfQt7R/xYemWRbxoJbkjsbUOhKyDp7TaGzjSsqCmVtRr2K?=
 =?us-ascii?Q?pi43tI2yoPoIhyawxakkidia4IEC0WlKvKuzVMLswUIJmUEXzhGJ66EGP0ge?=
 =?us-ascii?Q?8naHUXSB+jZh9g9W5rAesC3BQfT/31v7QKb8jjfCYwG/rIHZaHa0+3Ap9RgF?=
 =?us-ascii?Q?/98qDl39TlKiz/NF5QQVwMkgeCV0uCO99kei6tm744SUt2wB2nf3PJbMh+l2?=
 =?us-ascii?Q?985eOJBy28a48mt/pYwt06Pj441AUx5goYEPQzcrs5XEkNsPVwaxpdlDEU3d?=
 =?us-ascii?Q?ySOIykEGb2plx52ZjZD1NsfnwjeRbA0Vadaht4cB0GgzAJBGKOcXR+4HeFGY?=
 =?us-ascii?Q?sYwXRu3bGEdWHB3UakrTywNcyLzzWv6bET7/wTLdhGsUBORT/vsmIp5RXsGr?=
 =?us-ascii?Q?QT2xpiyLrd3nIBOhHpNmFmxKg5KBg9fX19k8y1tjxC2QYKlB6IOmjr2vT/lz?=
 =?us-ascii?Q?WRIE81+gxezs6qWvWa6pjKVC8J2tRM6e4+aoG2gD6/NsS6mnanwPtQYuG0aL?=
 =?us-ascii?Q?DARMYRHVeuH2kUgDtL+t9Hm7TbnPvHjIO2im93Z3wZ1D6zwrlbZuSXaSs/3h?=
 =?us-ascii?Q?jXP6DMg28P5j2YjuXm/uhW6g602pdRsisV5PyflBxD1JlABdL7f4lbopDsjP?=
 =?us-ascii?Q?CmgYKbQ+hY+NceHvyR9V02KuU2OB0rgJlSKE5+mE3h3Q212fuVaB/BmqaaZC?=
 =?us-ascii?Q?tW5HaOubaMiyg0/F8iuQ0YAnEaa2LqJfxmxUpxndtYb4jL1uPY6pznJzfvTE?=
 =?us-ascii?Q?cUb9MTCWJwbE5pPXUjLo6YEQbgTTQV7u1073hTd32em21rg7orOTnwV2Jnep?=
 =?us-ascii?Q?OrQH9oGP/wCSAgQkTpL2HyhovkBh97CHFCt8x0XtxiX07HWajczwasE3Dmmn?=
 =?us-ascii?Q?kmPg+k61VAUxHq0TEZ553WPyeS+abiUknguAUa0YBAtQrBXdOG8O1PHetIll?=
 =?us-ascii?Q?6jhVJ3XJ1VFBZHU3AFFJhuGnDSarvwv5JIJ34+5LFTHcyHG0LEwAYTgdi5h1?=
 =?us-ascii?Q?H/ylrngLc0GRatS+8nTPun20E/KfH1or0nCwS43BLN8bLgjBHDtC7PJUlVLL?=
 =?us-ascii?Q?Djrr/jPvQzGXKAU+UfcvPJtfdNTNgmrXz3b0?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10338
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:4b5::21];domain=DUZPR01CA0248.eurprd01.prod.exchangelabs.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bfa6c096-861a-4cf2-cafa-08dd412f4bea
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9gLz74ZKPGZQSnkeAwdIWrpejdcLEO2e9jNSsgwN6mobPT1JHCgAoP67Wu3f?=
 =?us-ascii?Q?CA5Yp5wuWyKV/yOy3Z1qEtdllLuIm8fuMfYtS7dfR8olA45KZ2QYQHNDNQQZ?=
 =?us-ascii?Q?+KNHuTKtonPnKxBWDY8ZddSJMofFm0poXZDDKK6O+L96FbhqoypXkQGU1Pzt?=
 =?us-ascii?Q?m0BMkkRouJACJG5UzrA/cBqVdk4UHs0x466h9raASxImbYQpGQD5TyOo1K/Z?=
 =?us-ascii?Q?l1r49keDZh3QIUHOUICkGvurM/9RmNK1lJlkXjNiHBabzpP97wRbDqtrcGcz?=
 =?us-ascii?Q?9u4jQXSRi4YKxv/D4uticdr3vgUkeYVWyFhb23p8KCtAogKuD7HSRDJV45OJ?=
 =?us-ascii?Q?PaMjBoWWfQ5v+6m5s8JafzLyui4ll+SN+7MNAMPpe13OVFSqh2FIseDxKiIa?=
 =?us-ascii?Q?sU4oHda0jxw+RKmK7HzSovF1iLQNdjSQQnLIdm1QV+63EpXSmOaincYxcgNp?=
 =?us-ascii?Q?O9zX7d19748HA7ttWRm1yI6km7zsLwFec4VDkewqqnYb1o2SxdNuk3874AyW?=
 =?us-ascii?Q?6wwsXU4zaM0NeISXXrfLi1oSQfIpyHkF6+MTxyfbSnqdk2iu5pKIAzMTG6r5?=
 =?us-ascii?Q?2mIF8Fr661vqv2sG4GiHjoPT0gKBgXLX0u0DKo24tlChMJhGpPXpO5uJLeGx?=
 =?us-ascii?Q?uTZcQTRRlhbdHN0QWdRimCwADjAkYRnSUygRpUGlYKjHFrmqv4x7qoarGIiq?=
 =?us-ascii?Q?zNx5eAJXaAKCREW6heTUQiqJ3/j2EhNGqd3QUJxqSlUeFg2qW9IX0ehq3VNg?=
 =?us-ascii?Q?NoOn0S/CQKC3PNv779dpGjM+y/idyiRrA0ySiXVKKqEE28+D9YMpHBFXM0PF?=
 =?us-ascii?Q?iOGZAIzI18yFj7P1tjCxMlFFEoyEH42E8iNpoih/WItrdjHB37LjKu370Qeo?=
 =?us-ascii?Q?nh6l5KsJqIzE0HRO3OETsV+OhMHr9nvPXXqX9P4xdMJ11jWm910B6rOo61d2?=
 =?us-ascii?Q?KKJJBjYs2Al2uHA8rqPH1nyCMZrUOWgx+49h3I3mJlq9AMWVMTo4MiHBXU8Q?=
 =?us-ascii?Q?c2AYTSx2Rh9RAMOGh9NUPVvOe38UjozbNOqy1BzEjT3Bt1jZ7AyH1WuWrYGs?=
 =?us-ascii?Q?93z+uknO0zUmN0hFnScTNj1zAmjKmKOTG41iF9UKh9s8mJKVOqEoLom/0HvG?=
 =?us-ascii?Q?9FHS5PuuCqtZ5g1evS471wucYaUWkzq4GdQnoyvMeuB/lATWwtRLE19NkES2?=
 =?us-ascii?Q?KCn4VMAXc6h+OJ/a4HZyccZr5bwSK3TdWmjKZXt9UVHrvkcipz48tzuN81TP?=
 =?us-ascii?Q?BHqy7l7nLjPk76X/xQf0daLmDmeHPaQTwaG7frEX8T6FyMazPrzuRudTjvg9?=
 =?us-ascii?Q?I+7+uO19ke2qCYMTaHoCTqW1UAucbRgvcGjbQG87WyVtz1u0MiloNXii3jhK?=
 =?us-ascii?Q?JDcSWOUU8ZpOIX5typDYkvm70S4FDQD+m0jwuXvtynRR2CIfyrnWBHyelMKu?=
 =?us-ascii?Q?N/u1A7KpnJ7OVRwLQ0VELbtJllCFfw6HjHKSaPXXU38fQZGjJ4bYT1mTUtbF?=
 =?us-ascii?Q?zELI5a0b32jERObcnHAZsVLl9wAU38wlnhtw?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022)(14060799003)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:09:30.4732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb1b074-490e-4d2d-81b6-08dd412f5538
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_050940_201413_04A188C5 
X-CRM114-Status: UNSURE (   4.86  )
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

This patch introduces a cma-heap probe function, allowing
users to register custom cma heaps in the device tree.

A "memory-region" is bound to the cma heap at probe time
allowing allocation of DMA buffers from that heap.

Use cases:
- registration of carved out secure heaps. Some devices
  are implementing secure memory by reserving a specific
  memory regions for that purpose. For example, this is the
  case of platforms making use of early version of
  ARM TrustZone.
- registration of multiple memory regions at different
  locations for efficiency or HW integration reasons.
  For example, a peripheral may expect to share data at a
  specific location in RAM. This information could have been
  programmed by a FW prior to the kernel boot.

* Zeroing of CMA heap allocation:
In the case of secure CMA heaps used along with ARM TrustZone,
the zeroing of the secure memory could result in a bus fault
if performed with `kmap_atomic()` or `page_address()`.
To prevent such scenario, the zeroing of the pages is done
using a virtual pointer acquired from `vmap()` using:
`pgprot_writecombine(PAGE_KERNEL)` as argument.

* Idea of improvement:
This patch could have an impact on the performance of devices
as a result of using `pgprot_writecombine(PAGE_KERNEL)`.
It could be prevented by allowing control of this argument
via a parameter of some sort. The driver could then use
or not `pgprot_writecombine(PAGE_KERNEL)` according to
the use case defined by the system integrator.

* Note to the reviewers:
The patch was used for the development of the protected mode
feature in Panthor CSF kernel driver and is not initially thought
to land in the Linux kernel. It is mostly relevant if someone
wants to reproduce the environment of testing. Please, raise
interest if you think the patch has value in the Linux kernel.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 120 +++++++++++++++++++++----------
 1 file changed, 81 insertions(+), 39 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a..8f17221311fd 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -18,6 +18,9 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
@@ -186,6 +189,7 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 
 	vma->vm_ops = &dma_heap_vm_ops;
 	vma->vm_private_data = buffer;
+	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
 
 	return 0;
 }
@@ -194,7 +198,7 @@ static void *cma_heap_do_vmap(struct cma_heap_buffer *buffer)
 {
 	void *vaddr;
 
-	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
+	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
 	if (!vaddr)
 		return ERR_PTR(-ENOMEM);
 
@@ -286,6 +290,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	struct page *cma_pages;
 	struct dma_buf *dmabuf;
 	int ret = -ENOMEM;
+	void *vaddr;
 	pgoff_t pg;
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
@@ -303,29 +308,6 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	if (!cma_pages)
 		goto free_buffer;
 
-	/* Clear the cma pages */
-	if (PageHighMem(cma_pages)) {
-		unsigned long nr_clear_pages = pagecount;
-		struct page *page = cma_pages;
-
-		while (nr_clear_pages > 0) {
-			void *vaddr = kmap_local_page(page);
-
-			memset(vaddr, 0, PAGE_SIZE);
-			kunmap_local(vaddr);
-			/*
-			 * Avoid wasting time zeroing memory if the process
-			 * has been killed by SIGKILL.
-			 */
-			if (fatal_signal_pending(current))
-				goto free_cma;
-			page++;
-			nr_clear_pages--;
-		}
-	} else {
-		memset(page_address(cma_pages), 0, size);
-	}
-
 	buffer->pages = kmalloc_array(pagecount, sizeof(*buffer->pages), GFP_KERNEL);
 	if (!buffer->pages) {
 		ret = -ENOMEM;
@@ -335,6 +317,14 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	for (pg = 0; pg < pagecount; pg++)
 		buffer->pages[pg] = &cma_pages[pg];
 
+	/* Clear the cma pages */
+	vaddr = vmap(buffer->pages, pagecount, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	if (!vaddr)
+		goto free_pages;
+
+	memset(vaddr, 0, size);
+	vunmap(vaddr);
+
 	buffer->cma_pages = cma_pages;
 	buffer->heap = cma_heap;
 	buffer->pagecount = pagecount;
@@ -366,17 +356,79 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int cma_heap_probe(struct platform_device *pdev)
 {
+	struct dma_heap_export_info *exp_info;
+	struct cma_heap *cma_heap;
+	int ret;
+
+	exp_info = devm_kzalloc(&pdev->dev, sizeof(*exp_info), GFP_KERNEL);
+	if (IS_ERR_OR_NULL(exp_info))
+		return -ENOMEM;
+
+	cma_heap = devm_kzalloc(&pdev->dev, sizeof(*cma_heap), GFP_KERNEL);
+	if (IS_ERR_OR_NULL(cma_heap))
+		return -ENOMEM;
+
+	ret = of_reserved_mem_device_init(&pdev->dev);
+	if (ret)
+		return ret;
+
+	cma_heap->cma = dev_get_cma_area(&pdev->dev);
+	if (!cma_heap->cma) {
+		ret = -EINVAL;
+		goto error_reserved_mem;
+	}
+
+	exp_info->name = cma_get_name(cma_heap->cma);
+	exp_info->ops = &cma_heap_ops;
+	exp_info->priv = cma_heap;
+
+	cma_heap->heap = dma_heap_add(exp_info);
+	if (IS_ERR(cma_heap->heap)) {
+		ret = PTR_ERR(cma_heap->heap);
+		goto error_reserved_mem;
+	}
+
+	return 0;
+
+error_reserved_mem:
+	of_reserved_mem_device_release(&pdev->dev);
+
+	return ret;
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "linux,cma" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static struct platform_driver cma_heap_driver = {
+	.probe = cma_heap_probe,
+	.driver = {
+		.name = "linux,cma",
+		.of_match_table = dt_match,
+	},
+};
+
+static int __init cma_heap_init(void)
+{
+	struct cma *cma_area = dev_get_cma_area(NULL);
 	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
 
+	if (!cma_area)
+		return -EINVAL;
+
+	/* Add default CMA heap */
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
-	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	cma_heap->cma = cma_area;
+
+	exp_info.name = cma_get_name(cma_area);
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -388,18 +440,8 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 		return ret;
 	}
 
-	return 0;
+	return platform_driver_register(&cma_heap_driver);
 }
 
-static int __init add_default_cma_heap(void)
-{
-	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
-
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
-
-	return ret;
-}
-module_init(add_default_cma_heap);
+module_init(cma_heap_init);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.34.1


