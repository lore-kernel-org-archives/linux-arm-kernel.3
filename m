Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F01CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pENGCTKnZ7mRGI9gfUvY/K5cZIEuOk2RfNmcra8POc=; b=Y5lc0GOakd+sg4SeKbuNw1Zsmm
	02BW1aZ2S9gPeDEe77zepC8jXVVdlQZ5sktG5BTaaT9BIcZ1KkAeWtHQIphWmIe9zw8ahsTlQ8nRq
	6dw6WsOYh9gPrV3sOE8TBmbJXWRe29VyoQ4/um3bY2rAFjDeukJAet2N5ukG2faTvSqRqgNRjklId
	8ykMPaU2WCwx5Fmh7unMB4Gi37k7WzuOB8bJ293aSLVk9eHGXNNtzSTa8ldIqDMVxp8Q/WKDtGx7s
	yTuYVO98KX0896mQzRs5Y1iXgZzgOITknC+z66GLOJJZSBsZ3aEiNVJT8s9Q2GfARg6Vy7WGntf6K
	GBTyicaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE4W-0000000G4H2-45RP;
	Tue, 05 May 2026 11:36:16 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE4T-0000000G4GB-3x9a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:36:15 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d2ZLrWQTQSSp4fQBEIg8wVUvNBVa9b5VyZ/1KPoVcdZ5zzgfn3rsOP1Kr/bcIMWqa4F48OeGaQ7CTEyWjqsa7Pwyel1Uwj2gYG7bRXdzBTw+KQH+9orLmKHmqcHWKdMcb9SwZ6eEIur6O7teBAuH7v7t9rO4S9I5sbBTkjzoVtnbWsWnwaYQzDL6NKJLqoTmYvcwytH5aVaiZxsidfUN0Guircqi73xsFKeK/5O3MJt2lBFZKHNoWn7umrvbgvOUK9gkWhE+nAj3x2U3GGghriSgLxXXROINlPIer+9Er/zMjue6LNdbcBAuTMjvwVHX5tfXWiQKEHb/8P/YhX+meg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pENGCTKnZ7mRGI9gfUvY/K5cZIEuOk2RfNmcra8POc=;
 b=iiV0erJFB0NARsaTb3FHm2PFFdtnFX/q9NR3LkbPZO/zJgxjuq1KAYG/Zxq+ifwuSac0QJ/M9SOGHPlKchjOFUyZRQCcIRpxBHRxpeDNEQDoBZhPdKOSZ3qGkOlKFZOoiZwk3s+Mqp96Vuxyko38muBWRVEkLM2K9TlCEc0eMl5QgnTba4KUonmmv8p46s5DQBpL1qZ/LRrtK+rJhBnyLGbE6J9JwtecSs5zKagLImndZtwTgoP1egYQOIvYUVHBuhAve4QULf1ZbBn+sqKXZrBDz9C8vyAMOxkr4FI8PvHliX+3J9icVjQrk9lwrfitvvowi8aN0mY3Xw6RLGsqoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pENGCTKnZ7mRGI9gfUvY/K5cZIEuOk2RfNmcra8POc=;
 b=nFyh2NHspBN7VK/TC3T9uegbnwWJmml/F6YFMNSkSwe8KK7zjqOB3/hbBBvIwHxREw2G7bPbip5V4+1UPorR/QzPPmjyW/1UdWo/rGnoXA6jtQMvHUVgix8ZehvtI18w8LsLMM25bPAGifufddl/QyksVBicwqjPNkroqiXY1behcikW3nTgq39cdXkboUCJsZ2yDLGbJDU/gv1qqdFDpYUJpvkr+27xyZPkZhC4qMwAR57TY/dJHq9RUFdUfpB0TpdcYhxtq3T3F0Ic5fc2E+qv/WipNlz6BIMtUFjZkbQbflEcSePx7w7kwUcvrRng9RFIuscMKAeZZ601jgyU8w==
Received: from AM8P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::33)
 by AM9PR04MB8068.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:36:08 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::55) by AM8P251CA0028.outlook.office365.com
 (2603:10a6:20b:21b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:36:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 11:36:08 +0000
Received: from emails-9917243-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-105.eu-west-1.compute.internal [10.20.6.105])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C0C90803E2;
	Tue,  5 May 2026 11:36:07 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May  5 11:34:45 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy0wWGOIDEknxSIBNnBCPv/7EapfU8193fgFvM54T8C07RsGtlVynrTgXrREF17MqVEHFx2Xwuat0CkBWdJFz86nDiVvpwI8+zi9+SdCctcIpJOQ73h4gMsIfDj2eAdE/AY69c741F39d57u2oW3M1jPtSiP5rU21bfQl8EgE4eTLUfdgLVMA4M4QToT49GwgQMlE75DQlg8zPFwD4J3HP2YeSZ0AQ59SV5AI8d1mfabm3EchD+6RT7gAUHHB0IFV+xqZfh6SY1p+OrS2jqj5qzyfRpOkzw5g8Su0H2u4+hNH/ai2XTJmB3tGOFzvPdISvZIpuAGWT8Sep1noYTyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pENGCTKnZ7mRGI9gfUvY/K5cZIEuOk2RfNmcra8POc=;
 b=Kob8DAJKYnvGv5O5BhTcJ6X7sNVHY5jtpvm6iPZsGagabVle44whKboDDhbsGPlXyIVTCrQxpafycgSEgd9LuXeQdPUx7ctz51RXbzs52bf4Qe7/4oyo/0otibtEkSTXldmjaaYR6NER+mKOFjx6vQL/yRgvPrwsgCCZEagG/nHkmX+FEK4kWtpjUhJkcUBxo962KmqE9qoLYVwmlOwPMvK69ovXXjYsl1fyxtQPpY7pKgIgmNJj3nYoiLVV78DnqZNjLAn57Eb+pinBDNpIVytuouHdipuvGOtaFy0AhWsx4l54dy8kpoV3X2Nj/x6tgVH+Z7gM4Q2n9jx4cKwDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pENGCTKnZ7mRGI9gfUvY/K5cZIEuOk2RfNmcra8POc=;
 b=nFyh2NHspBN7VK/TC3T9uegbnwWJmml/F6YFMNSkSwe8KK7zjqOB3/hbBBvIwHxREw2G7bPbip5V4+1UPorR/QzPPmjyW/1UdWo/rGnoXA6jtQMvHUVgix8ZehvtI18w8LsLMM25bPAGifufddl/QyksVBicwqjPNkroqiXY1behcikW3nTgq39cdXkboUCJsZ2yDLGbJDU/gv1qqdFDpYUJpvkr+27xyZPkZhC4qMwAR57TY/dJHq9RUFdUfpB0TpdcYhxtq3T3F0Ic5fc2E+qv/WipNlz6BIMtUFjZkbQbflEcSePx7w7kwUcvrRng9RFIuscMKAeZZ601jgyU8w==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AM9PR04MB8100.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:34:43 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 11:34:43 +0000
From: Josua Mayer <josua@solid-run.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, "nm@ti.com" <nm@ti.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "kristo@kernel.org" <kristo@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"w.egorov@phytec.de" <w.egorov@phytec.de>,
	"matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"d.haller@phytec.de" <d.haller@phytec.de>, "francesco.dolcini@toradex.com"
	<francesco.dolcini@toradex.com>, "joao.goncalves@toradex.com"
	<joao.goncalves@toradex.com>, "emanuele.ghidoli@toradex.com"
	<emanuele.ghidoli@toradex.com>, "ernest.vanhoecke@toradex.com"
	<ernest.vanhoecke@toradex.com>, "rogerq@kernel.org" <rogerq@kernel.org>,
	"eballetb@redhat.com" <eballetb@redhat.com>, "robertcnelson@gmail.com"
	<robertcnelson@gmail.com>, "afd@ti.com" <afd@ti.com>, "u-kumar1@ti.com"
	<u-kumar1@ti.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "luis.parga@ti.com"
	<luis.parga@ti.com>, "srk@ti.com" <srk@ti.com>
Subject: Re: [PATCH 01/13] arm64: dts: ti: k3-am642-hummingboard-t: fix USB
 clocking for compliance
Thread-Topic: [PATCH 01/13] arm64: dts: ti: k3-am642-hummingboard-t: fix USB
 clocking for compliance
Thread-Index: AQHc3H7/u/NguwVRqUym+5bPMktzXrX/TVeA
Date: Tue, 5 May 2026 11:34:43 +0000
Message-ID: <773b8ba4-b17f-469b-ad8d-b19e801f26a9@solid-run.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
 <20260505110631.1144200-2-s-vadapalli@ti.com>
In-Reply-To: <20260505110631.1144200-2-s-vadapalli@ti.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic: GVXPR04MB12057:EE_|AM9PR04MB8100:EE_|AM4PEPF00027A69:EE_|AM9PR04MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: d59fed47-fc7c-46e0-b700-08deaa9a7fea
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: vsAIvlcy/QaX2gyiNvciVo/VfZSwRSaoEi5TQVvJI3U01vAoZ7rUWKNHNFPa4AfDARsUIBgYvRIuh02Xw/cTMsdZoA2ENkdpT1s/BofOnzLCI2QwWby5WKMKm+c9lYx0N6KfJykjGk3bO03cY/pUr9OHogHAOwmjeGu+3p9Se00+DEiwnXiYmw8FAjA52NfdLIG4berCCt8kZ2cQ6jYWYjySZWRKq0qBrukQFbxZIVDKKDzxMqTbI8u0M5vX25CFLXflezmMzH3rdx74KtSFnRaIVTPwgK+mA7U8PWVS8/Oz+k99QBt6QhjjXiW/vkTL/pbxOJ0y2PeH+0HgK2l1bdnWYDXag9oTcH9vBnLbPM4ZQVCwaaoFl+U8h2XtPZRn+1PZt0t+qJ+L82SVOzWaMAArfL8G/zn/79QoYEIjTyD2kLRuJmlvk7A4JUZKNsi3gWrGbewsOLTDo5luIe+SKj3vYRj0B/WbzvrLBoCrMeV/uJETOFsvk/+IFA9iRLGnas9b27Qwhi05uKkusA+pobpgYBFF9SFPp2Y3W/Co6eX8toumOd9ZRnsQ+Mh1tExP7Gf2kvRANb4a25GnzmjIZru23CHOextKOP9XetWIORHKWsiAmUFshyfnbzYkvkMmzkeH9geeNnHBqBJIi3OXF1iEKM2I4iwwQ2IyH2xgAgBzjx7IcPYXlU9IbhyyzXOuS2gs0HTT+t1sMhRjsHk/Zb1ZLy7q0XPeHmp4eeUAWgJYXiY64hreK2FpSXyTeU6LTlGPV/0iV87f0lnxf5MhHA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <64FC50E64D19A3468ED4B4C687CCEFE4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: itghCUqKxWpSgnvHVmOFrF/PYXPzfMfYGcc0P/SAbgoEO+3DFR27z92gky0uVELOUHpcV8x89oLHx1CGhqsoWQwrXoItLb0AzZIgZLwipZjIrRskWpagbaw+U68RliA4wm/Fk+NdvYkNuFkBWgMNPJYX8uS/QmQUuYpdyXAx6AWTTJLqX/LIzVip9IXaPpeFJ8f13fguZ7OdY7DL7tmTJSTVQPGz97p1dP6vgfCBc41dXLt8vHkd6+SdSyFyhFsJdMEf3miJ1CG6vD7HJ44ZYxVg8u8XwtI79F0YE3a7mNRRBPrUxZMVpdtXyY2+TR+UhaxZKJ/In2sT25Gyx/rexg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: bbacac55df33462fb2cbf9f33f6f0cd9:solidrun,office365_emails,sent,inline:9723ea776f2aa7b7dfb80d808483cb3e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: eff3301f-59d8-46ed-c41b-08deaa9a4da6
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|14060799003|7416014|376014|35042699022|82310400026|1800799024|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cNCmMKa+HtB+yw6e80fQHSmu0Xvn7eyKP6ttnWiGIDfN6+/M33aIzjSghkAHz+T3OSB1brr2UJC9iyLXrAYs5NXXe/oNdMMT90d0tx+nKb5WXKmtkTM7lPuiFXGwDnwypQWxgBJTk7tRRYOWYP5t5c00eELX61HttiNAjnFVjo1SwzaCj187pjxMo4Xz7MMnThoc6xl0j3Wkof6qoWG47k5SNoLyEpfehHKZcP6qbeWG/VyhuHQYPrzdG5s1KX6+YsCJnATYmt5ezz+CJ3x4hpsLJNEZ2L7Q3pCIgjjIWI2y3V0jbYGygSsWlUjfc0JLHn8Rozg1a3wMy/doBE7DqEJZhMCtHYQDMDm+cDX2zbl73LTZalOTu8lMRf9qtkdWkQGBfEndTiDzcwZKi+JEPMWb7qK1cD81eAxyGizNomfIfM5B6yrdAK9yH3G2uRpinM8VCx4OKvgp1HTRz39BpYtcr0ht9j/QfevfZ0+CIDIQ3g5Oj5YsgaA4UmQphuplK7ndenyfY6tOv5PhzPPgL/OnZrrADueLHleSVaXiHUDa2V71P8AkSbnz70oQskxAXFiaMloLPcHx6xWFpuFy6DMFyFwxV/1r6vR3aQPD2mEIBt9J1WO4MVprCEdjH84Wsehptn/HbOaHknw7sEVA2zsGVzW/s2yOcHz1HCVagusxAHAv1SBW0nE4JST/aizAfVBVUwQ00HyvV6ZgOsr3UvRAftQx5eXGC3sAD+/7D/ZPfS7bhi01tY0BVtqLqExFEbyWEbfgkJYByq2JlpVXSQ==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(7416014)(376014)(35042699022)(82310400026)(1800799024)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WSA7JU+s2zE5C0gDw3ho7+N5uhCdrNGc3xtkjNffzlGVejyBII8UWHBhEAqgxqnBfnGS5GoCZlqGIxfwF/0a7oUu1N3y6o06zb1D9LG7Ie0nbNdpQrqs2+9LSfMrw3G0WT/QFYvVAruV+pkclAfJ/w3lTO37RaVq5G4r9jtiJAHxoXNYOMhuRJODuHOL6JSCILKz9LTNCE6NemZI5fcLZeZxeRe0uKJXTMhMbBnlWUDqs7EgMU8kRY5JTMcop1hv+rwhAr/is299/I7CfiZJ08ShyM1HWhNPSYJPQY1q1NRH76xc66rtaA42yKYQCWdM627xpmrM9Vz5DAm+msVSv9bOsqvl3ZfJRlGr1ruOFecYF6I9OoeWq86lJhruoo2ktd9IJ2Pwj0iuEamqumYVf4sViIdgZ812FOkhMU8SjKMEX9pvxs6Be6vm7jh0LdUF
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:36:08.0102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59fed47-fc7c-46e0-b700-08deaa9a7fea
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_043614_313489_5A3108D6 
X-CRM114-Status: GOOD (  14.86  )
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

QW0gMDUuMDUuMjYgdW0gMTM6MDYgc2NocmllYiBTaWRkaGFydGggVmFkYXBhbGxpOg0KPiBBY2Nv
cmRpbmcgdG8gc2VjdGlvbiAiNi41LjMgTm9ybWF0aXZlIFNwcmVhZCBTcGVjdHJ1bSBDbG9ja2lu
ZyAoU1NDKSIgb2YNCj4gdGhlIFVTQiAzLjIgU3BlY2lmaWNhdGlvbiwgU1NDIHNob3VsZCBiZSBl
bmFibGVkIGJ5IGRlZmF1bHQuIFRoaXMgcHJvdGVjdHMNCj4gYWdhaW5zdCBFTUkgdmlvbGF0aW9u
cy4gSGVuY2UsIGVuYWJsZSBpbnRlcm5hbCBTU0MgZm9yIFVTQiBTdXBlclNwZWVkLg0KPg0KPiBG
aXhlczogZTJiNjkxODA0MzE5ICgiYXJtNjQ6IGR0czogdGk6IGszLWFtNjQyLWh1bW1pbmdib2Fy
ZC10OiBDb252ZXJ0IG92ZXJsYXkgdG8gYm9hcmQgZHRzIikNCj4gRml4ZXM6IGJiZWY0MjA4NGNj
MSAoImFybTY0OiBkdHM6IHRpOiBodW1taW5nYm9hcmQtdDogYWRkIG92ZXJsYXlzIGZvciBtLjIg
cGNpLWUgYW5kIHVzYi0zIikNCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTaWRkaGFydGggVmFkYXBhbGxpIDxzLXZhZGFwYWxsaUB0aS5jb20+DQo+IC0t
LQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1hbTY0Mi1odW1taW5nYm9hcmQtdC11c2Iz
LmR0cyB8IDkgKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+
DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3RpL2szLWFtNjQyLWh1bW1pbmdi
b2FyZC10LXVzYjMuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1hbTY0Mi1odW1taW5n
Ym9hcmQtdC11c2IzLmR0cw0KPiBpbmRleCBlZTliZDYxOGYzNzAuLjkwYTE1ODUzMWY2MCAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1hbTY0Mi1odW1taW5nYm9hcmQt
dC11c2IzLmR0cw0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3RpL2szLWFtNjQyLWh1bW1p
bmdib2FyZC10LXVzYjMuZHRzDQo+IEBAIC0xNSw2ICsxNSwxNCBAQCAvIHsNCj4gIAltb2RlbCA9
ICJTb2xpZFJ1biBBTTY0MiBIdW1taW5nQm9hcmQtVCB3aXRoIFVTQi0zLjEgR2VuIDEiOw0KPiAg
fTsNCj4gIA0KPiArJnNlcmRlc193aXowIHsNCj4gKwl0aSxjb3JlLWNsay1zZWwgPSA8MT47ICAv
KiBTZWxlY3QgaW50ZXJuYWwgcmVmZXJlbmNlIGNsb2NrICovDQo+ICsJdGksc3NjLWVuYWJsZTsg
LyogRW5hYmxlIFNTQyAqLw0KPiArCXRpLHNzYy10eXBlID0gPDE+OyAvKiAxIGZvciBEb3duc3By
ZWFkICovDQo+ICsJdGksc3NjLWZyZXF1ZW5jeS1oeiA9IDwzMzAwMD47IC8qIDMzIEtIeiAqLw0K
PiArCXRpLHNzYy1kZXB0aC1wZXItbWlsID0gPDU+OyAvKiAwLjUlIGRlcHRoICovDQo+ICt9Ow0K
PiArDQo+ICAmc2VyZGVzMCB7DQo+ICAJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICAJI3NpemUt
Y2VsbHMgPSA8MD47DQo+IEBAIC0yMyw2ICszMSw3IEBAIHNlcmRlczBfbGluazogcGh5QDAgew0K
PiAgCQlyZWcgPSA8MD47DQo+ICAJCWNkbnMsbnVtLWxhbmVzID0gPDE+Ow0KPiAgCQljZG5zLHBo
eS10eXBlID0gPFBIWV9UWVBFX1VTQjM+Ow0KPiArCQljZG5zLHNzYy1tb2RlID0gPDI+OyAvKiAy
IGZvciBpbnRlcm5hbCBTU0MgKi8NCj4gIAkJI3BoeS1jZWxscyA9IDwwPjsNCj4gIAkJcmVzZXRz
ID0gPCZzZXJkZXNfd2l6MCAxPjsNCj4gIAl9Ow0KQWNrZWQtYnk6IEpvc3VhIE1heWVyIDxqb3N1
YUBzb2xpZC1ydW4uY29tPg==

