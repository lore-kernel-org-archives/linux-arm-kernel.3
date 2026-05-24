Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC54CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32o/CeXYOM9MhQSONaelw59YBOSa7TLOMYd6xarMHzI=; b=Ejm656NW1tM/w+ZrCVZNFcriWs
	N6XNDg11GTenPXVeqbVTPQJUvlkrQlhSLbWqwipc5d/FFta2G31rWZZ3337nVzS124wJGhMEVbtR+
	2xFOV691vGhYIPwzRpB8d9TMURaybqGrgjwDLPXl7CEduO4RkmgIrLQ+gZCstxXRHWHU0ro1tXnG9
	rY19xVgThlNNr3flcx3VC5kNjpHf0t6Egq3jBtNX3ljeEdO1dNRT8QcnxdZGqtXg05PAgJOUhmWYH
	fPH6kkXwtuGcP/6gO9YNgRf7WWYsFIj1AfWvF/2HPW83PPQFLiKwnvrQAFZiW/AsT8xnlKGOUevFt
	JQ+jhfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR7hM-0000000EvjW-1IhI;
	Sun, 24 May 2026 12:12:52 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR7hK-0000000Evit-11fL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 12:12:51 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nB6s06aYk710vF8SC6Ywj9Epk4qkkaFxUKl7aoraEjPpKoeR8mMQRqWCM27nUfsbl3i+OdETAUfeVR44/ZWCNLTuHxjOSqJu/ac3DALbwS3Pcjh9Rd2UcrvDauhQ7AxWzejg+3IzK3/z7dThsJ2ph0WZIF3SZpjxIN4OsXvEAgoXEncjm1b3MvEX7AOSwXWfCcFkDu3MxLR2bamdT/n3xWDVernloq/hToTlGaHoxlzpwpSPZ7x5YwWHZHHKMRfpYBoXzjLTMFkveqMkO6noWcLxEGJa5adYRGI/3f4ps1SLqZjbeDn+phauWhhUd97b8kcPmfZ9wOy/5B9bQHUl+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32o/CeXYOM9MhQSONaelw59YBOSa7TLOMYd6xarMHzI=;
 b=abIzJX6A5lTTI09shk1kNi0/SNi8Jv6eqCPig+uNGhGw2uu4etmRtqC/v+WfdPZPNh2s7U+1honQW5IsbR9wlxG8oP2xQst5eOntNHmHbZyuK/oVy6XSyTWBjDHU0yyrieAdKrH6ihGtOaeU1cmZS8/rFm3cxwg9ODgB5kkBIYEFnLHTqILbxd60Z4kH/+aILu/Y37cR1J8V7vrsAPyMag3iGRBkdZaf32gOxxfO/i0mqBNskqII7S0MmNqahxQoCWqrIKUorcrf/T2REly27teA5SSSoah1HNJbB8D45/qN21F8gAeemJ59wJVG6bGB98BMZ+cp9j0AdLjnltZB5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32o/CeXYOM9MhQSONaelw59YBOSa7TLOMYd6xarMHzI=;
 b=JWz9zzYTYJzruo7TjzKFtNvyihJyCo1dhsULlhVDqonwlQsdzeWw1vKz1Fp5fFVonQ1IJQykddebTAQHK8dtwKiNJBcldma4SfGMpM02nf6noE6U3fjzCwMtc1wfnE26tQgUHx25hN3WEqEBoAq/N1Xritm16WyQX3/52rPAMkQTEtRwOtr9+axJJrkbVizCmVq+qN4YyrAfko+AYJ9JD6zekhUg9aaME4WHeNF0IDpBbvJuzXhnAWLCkilragzMn3aIDEg58ppZGHgIQ0TOdMi/kKBEB2zJxgkCf3kQfd/jUZLYdzRNZOSkwMjR8PASs7diDbTFyuTPADeHbX+MRg==
Received: from AS4P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::13)
 by PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sun, 24 May
 2026 12:12:44 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::2b) by AS4P251CA0027.outlook.office365.com
 (2603:10a6:20b:5d3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 12:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 12:12:44 +0000
Received: from emails-614197-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D563C7FE3D;
	Sun, 24 May 2026 12:12:43 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 12:12:37 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tn4k+seafxsMu9emKCuld/njDkteW++5DKhY6ZPDtiii1JcOZJsZCm8qovh9qMtSi72DiZMzpShLFPOO/8Fd0uTahxnKt9vVzHMsd+IFu9NXB79TsRUzhjh0Y/6rUj/E0p76Y0iOtJSyZk4tf2C9ZhZgJpQ1e4zQRbNzmK79j25GmpAOQP9YT5Ca1G1rZ1jjPYwDlLh0q3Lq4mlZQLrupT9As+yoYObKCX0HKISLD5YImNCHvstNQThc5xgVP8Hkft/O1vt/hMWDaSZqqMGnC/p83s8cVwufoaN6ndM5+bv4oK3MFKBptNM6Br6klY2YaTNAprtxFJcrs5sWYRRP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32o/CeXYOM9MhQSONaelw59YBOSa7TLOMYd6xarMHzI=;
 b=SpCkPjFsElJQC4ZWJCoOHiCRI0ygwh016JIxvwLXT4lMRxKbhvXPUF1wAGrsQVkT/4QGxnJh5YV6yiQgeVZQ2un5HJht+zHbluHvxpsTM0So823IfBIsW546stKfqnGivSebUOZfV7W+v2Nob6BmZ4XmHsTKki7P9YfDoOfCCEa8E8m+F7fO2IiHOiiUWWsfhTkCfjMyGehbGAdsLq5hMiX20BWEwTETM7ERm27klqiesBSrEELyjsU5aDqTd7abl1I68/H2B0ir96qq2WD/NLlw7zLr9aAiZZodDRKqswt31quZFhUVtumhBsmtKYYQpWpZANGRhuIZfNRRH+X/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32o/CeXYOM9MhQSONaelw59YBOSa7TLOMYd6xarMHzI=;
 b=JWz9zzYTYJzruo7TjzKFtNvyihJyCo1dhsULlhVDqonwlQsdzeWw1vKz1Fp5fFVonQ1IJQykddebTAQHK8dtwKiNJBcldma4SfGMpM02nf6noE6U3fjzCwMtc1wfnE26tQgUHx25hN3WEqEBoAq/N1Xritm16WyQX3/52rPAMkQTEtRwOtr9+axJJrkbVizCmVq+qN4YyrAfko+AYJ9JD6zekhUg9aaME4WHeNF0IDpBbvJuzXhnAWLCkilragzMn3aIDEg58ppZGHgIQ0TOdMi/kKBEB2zJxgkCf3kQfd/jUZLYdzRNZOSkwMjR8PASs7diDbTFyuTPADeHbX+MRg==
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by AM8PR04MB7361.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 24 May
 2026 12:12:35 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 12:12:35 +0000
From: Josua Mayer <josua@solid-run.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v6 08/10] arm64: dts: lx2160a: add labels to thermal
 trip-point nodes
Thread-Topic: [PATCH v6 08/10] arm64: dts: lx2160a: add labels to thermal
 trip-point nodes
Thread-Index: AQHc4h0WH5WlzWmrEUqxBhldH1y31LYNFTSAgBATxgA=
Date: Sun, 24 May 2026 12:12:35 +0000
Message-ID: <9aa8e125-b543-47cf-b8d7-01d64601ac77@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
 <20260512-lx2160-pci-v6-8-d0ff72d3c983@solid-run.com>
 <20260514-kind-antique-ocelot-d34abe@quoll>
In-Reply-To: <20260514-kind-antique-ocelot-d34abe@quoll>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic: DB8PR04MB6859:EE_|AM8PR04MB7361:EE_|AMS1EPF0000003F:EE_|PAXPR04MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f604ca8-47d8-480a-1106-08deb98dc2c5
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099003|18002099003|22082099003|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info-Original: +wkdD/iHkM2o0vz4kzEo+cl5EoFTtxzDd6wuqdpFjo+fuJvOdt8XVxad1r3yUV7CxJWM+M3Fl1xudLP4LAwynJXJ+iaUtMDRGiSspaG9pRpZDkt4HMtc1TuPDkWO46MVX9qfGv6NMzy4s9HfhsoJ7u1fHQWoDtVp1ouXg+nwgpYt7HOKtDBlYPzhIyLRkIyJWpqLJdYzvKSxa6BccVvwR3YUw2yiyISmXZhg7CwlCEFftxYVmKJoJoWrJ0bvvDTT1KCBDgChuLagPxwVvcRlJeKTzGFHDCYEwyVgJMSmHPHmFXa0/KSg1tdsBqBmJVJLXON90vYYkBVOjcRWumQVc2y28X8796yuf6Cb2mg9mgfK2Q4cRczDZX5sF1LU5mzcv9sT42Az3y+FOhYDrxO/Trgmpp/r96w8l4mz1pIJyqVVusC1dXYV90WZQ5cS6tRgIc+hkugb3OdhQPPaA0WYLvSFYHFS32ro/VyH+BgNMBbN1mOUZAR/iSc/TIEoF8pBYySm5akhUdatxeXo5WALIp4I9ZZ8teIRCAdIilLTGGZwT/j+qGc7Jkns14UpPgQEIqMz1O47J67mZPduPbFXctWkjh8BSiLmD10aAWaK8tjf5CLC8U5TMt146k3j3AVThZa223PZAd+VqHeNqsH7Kcpc/WZOj1yR7yAjnhHobRRK3Rh/L2do06uv3RbxdlowmtVzyIdnMJJWHwGvINgoLrFOgddYUMpW1B2r5hOUredbUvxCJ8lWmVJ9fW6we1HJ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(4143699003)(5023799004);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B515667BC02A874A9EC5A55CE15682CE@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EC3EuIRTD6UswRzY47s5LMXdK0DP0U+PxXsYlmUHLWV8CCOhov44qgY5SjYTUocgv9DTTMS93fKOkwJwcdD//zmXZ4BPBKqoXvnHRdYML9VIxpBUC8Hl1Za32+uTXSKqX2K1lSefRxb9VEsvtO8lCPK60BQC6lTpQUa/uJ64WGVygr0ZOJKMaQIbclFhL70wg9qb+ipcykWwP9tIG1I5dhB54rMcm/nFeGfRBjmQIfLcrDqmoMBHXjKv73GE1bRPhItCu3XNTpjPufOk26tPPBNpXBsg8Z7osoK9STMm5rFycNnK0q1IAPiRXCRTPLV5bn1gC8FFRYH2zGlea2hneQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7361
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2af72ec2c201460082beb7c52a05f2d1:solidrun,office365_emails,sent,inline:3c9d929d64deb09a853209c2d2827b57
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 438b1fe5-270b-4f9f-e300-08deb98dbd5f
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|35042699022|82310400026|14060799003|1800799024|36860700016|4143699003|22082099003|18002099003|56012099003|5023799004;
X-Microsoft-Antispam-Message-Info: EIsek0Jwxol6xcwpG8V8M5sv2ooiLyoikZr8NETo6yXVUo61HtCce5EsdLNVbhf+RfokxKbo1xpncxR8AtNHuLQkK7T4gPpgRsrgxGf/ZkJhVvi0jiCRHZBU2ANlRuH9vftnmye2qhrB3XX8oqV4Y0fo2hhikX/VLgr9wptc/0eFFVHP1Nk/fxdPrmOz/9JbFFGVP2jxuKtogrj/mZlDgGWDNgCiJAyj99/dTnQgtCx0gu6oXg6U89Qb2/IuCuVa/BorytN4MBlw+A64UjgPH6Wa+xc7n6RDaXLUH1vuZAFgsTD7Ev6aFB/foj+rl5gMiMjPWpYHq7ijXhu32/mqpZlcgRZkyQTCiG7578R771CusgzXjY93KCXz/CvN+KaUatswP9A8gBl+MD4JWLOc1iYODBQdRwE1QlhZB/KvAtvWDg2U3tV4esFt1r6SGHDnkah3wk+ba5oMWKR0Aa8CBDs9FRRFHMHfgQzSqpsuCcNBfn9j4v4bFUKiO1ujir36oAbyATGb9oevzcGaJ4Utw8gu5sauQ5Ph7vjVPYJuoViPdryu6EVY1qeFwx3cWPrM74gewRy6QFK1WZU4E+mXKBtTQgyhZ30fq9rmoSUnugkDutAqrBksxUSbFSvKQbsmvtg21/D3aEUqRQETKZ7r74fXvFCGjrStgux7+JT/9AlKn+JE5OPwryU8JJNLyNJEH9TO3ayu9/3O1cT2kmsMIigaT59vm0paXrFbN3i5lig=
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(36860700016)(4143699003)(22082099003)(18002099003)(56012099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QGEghNr7gZ+el14u9NuA98xSMOMzt4Bk+vHsYBJg1119ErkUAQtqrtJFdDtRmzZwGfQolhewrh9S/t469sGRvW2MHn1Fb8lFtNC67GiEB3buGUqHMkqsxVryZ2lMk7+O6Jrd/H8YmELg6rkQtgU06OJa2KYB6G9BjgvHFZrD4uKaiaYO2Pr9rs8iKPXrqHE34Tvmu/payM/nTu9jHXnh5971o+rUKS/TUTKVKHOqMkhdd2wHHT8d8TXVXH2F+JtwX8HfaJmmqHK+86Gy0gkIXeijSNDizESIKtRDNsz0qcsEj8P/iz1Mf8eGY+81NDViUqd3ruKYkShOVfmOlpKyreRyWnyF/i4QKgYS05BMYnIibpVs2aZM0GyKwbslkNaDuZdG1f5R033T3wQurD7ndU+NpWvb9maGk/wjO0SWbH3f0LCcJ15yAUSF8QZpAE64
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 12:12:44.1416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f604ca8-47d8-480a-1106-08deb98dc2c5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_051250_292876_D6CB33DE 
X-CRM114-Status: GOOD (  11.80  )
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

QW0gMTQuMDUuMjYgdW0gMDg6NDEgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tpOg0KPiBPbiBU
dWUsIE1heSAxMiwgMjAyNiBhdCAwNDozOTowM1BNICswMjAwLCBKb3N1YSBNYXllciB3cm90ZToN
Cj4+IExYMjE2MEEgU29DIGR0c2kgZGVmaW5lcyByYXRoZXIgY29uc2VydmF0aXZlIHRoZXJtYWwg
dHJpcCBwb2ludHMsDQo+PiBhbGVydCBhdCA4NcKwQyBhbmQgY3JpdGljYWwgYXQgOTXCsEMuDQo+
Pg0KPj4gVGhpcyBpcyBva2F5IGZvciBtb3N0IGJvYXJkcywgaG93ZXZlciB0aGUgU29DIG1heGlt
dW0ganVuY3Rpb24NCj4+IHRlbXBlcmF0dXJlIGlzIDEwNcKwQyBpbiBib3RoIGNvbW1lcmNpYWwg
YW5kIGluZHVzdHJpYWwgdmVyc2lvbi4NCj4+DQo+PiBJbmR1c3RyaWFsIGdyYWRlIGJvYXJkcyBu
ZWVkIHRvIGNoYW5nZSB0aGUgdGhyZXNob2xkcyB0byBhdm9pZCBwcmVtYXR1cmUNCj4+IHRoZXJt
YWwgc2h1dGRvd24gaW4gaGlnaC10ZW1lcHJhdHVyZSBlbnZpcm9ubWVudHMuDQo+Pg0KPj4gQWRk
IGxhYmVscyB0byBhbGwgdGhlcm1hbCB0cmlwIHBvaW50IG5vZGVzLCBlbmFibGluZyBib2FyZCBk
dHMgdG8NCj4+IHJlZmVyZW5jZSB0aGVtIGFuZCBtb2RpZnkgcHJvcGVydGllcy4NCj4gVGhpcyBp
cyBkZWFkIGNvZGUgb3Igbm8tb3AuIExhYmVscyBzaG91bGQgYmUgcmVmZXJlbmNlZCwgb3RoZXJ3
aXNlIHlvdQ0KPiBhcmUgY2hhbmdpbmcgaGVyZSBub3RoaW5nLg0KPg0KPiBTcXVhc2ggdGhlIHBh
dGNoZXMgd2l0aCB0aGUgdXNlciBvZiB0aGlzIGxhYmVsLg0KV2lsbCBkbywgdGhhbmtzLg==

