Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA62BD58B17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ck8pulm1kASciwIUulzOfi7QW80FBHPaIKYfEhHKKFM=; b=XZYFWC5XBC31w0JGeK9GdZH5UN
	+Lp7t4aF5khs4GaQL+uRq09Bk+LSn3BM9/JEUosek+qiI8Btw5aXVpsJClJiUfz3UdeVq0iK7zNDr
	xz7QdMYsVBfb3LvznNGf24S5ab7HErIn+9mMqaQhxZtrU6O49EzYA7duTj+VTV9dUwDJ4Gl/iTgKr
	lWoCXAaQ/8RIWxb48466kW466xM8FELIszK5QY70yd+kgy2o6qzVM63oGhiM8Xh0CYN/54sZi+zt/
	tbS0v0eOsedavGwOXWQZmC/9/d4ju0tMJP6zWS0cz2JKm7ofzGOlseaqTvg3F+XwCBIuImmS0iB8G
	E91fGKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kcA-00000002bYV-3vKG;
	Sun, 15 Mar 2026 12:30:39 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kc7-00000002bY6-377a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 12:30:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eLKxlx/6bLVm2+C8CBekLbztuKMX3T2vQWCn98RG5xwMs2KbvSUto2LmRG0wahlEhiQygPCCWPQ5I9rCKbl6/scRT+/13coT9xc/68UOndztMf6Hdw21AlzQGVU0IL+Ur21o5DyckIJbeRrwtV7Wbfvi8FVl9rOjJv6ER7rXvT4xzphQ3AW4+l/MpeI9TKq0twgl86dk6QRx24ecfXSNgB3Aig6HqATcQzUCXJ+bQyWxOL5a8yvRfmDF7hBSAb4yP+Ws9TOBtRTyyG8ODTSnTEtL20t4s17dNwcHqEJrNDCuBUK7OQHpiE1SphlWkSvRFEBMmTsM9qibAnrSR6aq+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck8pulm1kASciwIUulzOfi7QW80FBHPaIKYfEhHKKFM=;
 b=r35GY5XrkqRExtCW3zlr6FsYXxN1ETo7kzF+dqvbA0Yu7GG6liaSwmjCP/JCDbVN17xHVHbz5/RnkBgWAV3Q0vsJ2IR+fPRLTiUWVZ/U41co4VGBozm28Fqdy3qjhjx+Q3X6+4KJjq6W6ggvNk+UKhd7QK7WcWAqOUYSFoiGoTEZPHPAgPoArf05bcQBIaWDASqfUvWZ8WZ9czzgZSf6BAAceerHPJTo9uo2Jy19wyFUQosxWnTKr92h5dMOU3XG7/SSvHMNJ/5xGQT2h04HH4LlM4lsmrng9wfC6ALWJDAbm50SIsQghRwJ0vsJhfsomqELEhMXy6a0FFcugOGbCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck8pulm1kASciwIUulzOfi7QW80FBHPaIKYfEhHKKFM=;
 b=qOrZ2pNmr6WSMPQW9jsb0qCIF5Q4QrpxrrIhjnr5L7EGVrW1nFJC29rerhCxerzQjzGGKA9BxLYIjfeN21Dh/Id6msmAr8FyfJ/gx6ThkDzkR6aahENc4gjOS39eUmbiBwKuo9TlVtL7qawDzeA7ci8b84OEwjYYfD3rXUkCZ+M=
Received: from DU7PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::23) by DU2PR04MB9131.eurprd04.prod.outlook.com
 (2603:10a6:10:2f6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Sun, 15 Mar
 2026 12:30:22 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::ac) by DU7PR01CA0010.outlook.office365.com
 (2603:10a6:10:50f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Sun,
 15 Mar 2026 12:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via
 Frontend Transport; Sun, 15 Mar 2026 12:30:28 +0000
Received: from emails-4975057-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-74.eu-west-1.compute.internal [10.20.5.74])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BA5AA7FF5D;
	Sun, 15 Mar 2026 12:30:28 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun Mar 15 12:30:19 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AY9N8NuWik4Miq14iwiIxXVXblEl9nuqnQiaQGGXnVc6JjOLNXgf73hOnBqVuXpekBPBh10OStOtwA9A0rNe707oeupF8B5Y7ZszrMTyBFOjuXb73K5PNEovKYvg2QCFVuyHzHTmxhEOUGjXRyWODpw7pihCLmvyiOMKSMF4pOD0nP/aMBymF4LY1H3tjSGxcujXdsEyyxzXAWrzqruqZ+yrHxDrPgV9jE7jZgupHIdZZeu9M0uipoMDg+QuNX6XKKBW3Czy1O5dIK9VYcn+Qdq3EqIOLUYuWDHibf3/dG8+g7kqugXzmOnqO6vnP/XSmKADw8xh8OD1XF0nuJqREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck8pulm1kASciwIUulzOfi7QW80FBHPaIKYfEhHKKFM=;
 b=Qz/dK1x2/cszMI++MKT3qP6ok7kywqqoQfDUhEV67eYizxzzd52jwTDD3jMM/VRbXKPawXyjg3hGT16nFPf0q9Ofp/VgZeD420FNFdThWVA00zTY8WjD7i9ticGPxyb7w0bDy+S9oWJniqOJ2QiNPu/y1ygWr/4BubFt/xOP5GC7rzKTqHlXXHAvznFbnDwzC/Yok5LWf94mrrEu4HZb8Ae2FkaWk2VnSz4pPV5OODVF+ZjiEPomzAFRsfzq2VA+Y9zBcZ7524iVg8Cw8bLIssTm2WEOvE6RxJP1SfnTwb3e4d5EMq9c1DicPgE8jIRtYSIOAOt8ru2jhcpy1uqicQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck8pulm1kASciwIUulzOfi7QW80FBHPaIKYfEhHKKFM=;
 b=qOrZ2pNmr6WSMPQW9jsb0qCIF5Q4QrpxrrIhjnr5L7EGVrW1nFJC29rerhCxerzQjzGGKA9BxLYIjfeN21Dh/Id6msmAr8FyfJ/gx6ThkDzkR6aahENc4gjOS39eUmbiBwKuo9TlVtL7qawDzeA7ci8b84OEwjYYfD3rXUkCZ+M=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sun, 15 Mar
 2026 12:30:12 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.018; Sun, 15 Mar 2026
 12:29:51 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Carlos Song <carlos.song@nxp.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Rabeeh Khoury <rabeeh@solid-run.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 10/10] arm64: dts: lx2162a-clearfog: set sfp connector
 leds function and source
Thread-Topic: [PATCH v5 10/10] arm64: dts: lx2162a-clearfog: set sfp connector
 leds function and source
Thread-Index: AQHcs6rLOyUeubmcX0WUw9B4K61IurWvh52A
Date: Sun, 15 Mar 2026 12:29:51 +0000
Message-ID: <80962490-5f42-4e0e-8b53-8e5d54751d50@solid-run.com>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
 <20260314-lx2160-sd-cd-v5-10-83de721585e3@solid-run.com>
In-Reply-To: <20260314-lx2160-sd-cd-v5-10-83de721585e3@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|DUZPR04MB9966:EE_|DU6PEPF00009528:EE_|DU2PR04MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: 4405f3c5-0b89-463a-4742-08de828ea476
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: FOyfr46rQmJJbHVxQeIPBiNNIceGWKYy/JTlPwtl4pRKZYiw9lim5qhQHC38V9h4EetLI7CA48Uy1BS0UqTa9vm0uUOr3582stIkgWi/wcOHjFsVQgu3NgdSUtQBmm9QD2PTeHbAUU+XbWVBhwY04O1rXmkZKlXkOL/61Kt7o1Jb8cL41AGsD3HjePK5CSEWvdg3MkYc03FSOCV/G3qWsf0Dm56FBQJxIl9aoB1/zmkS2wSUhmUpYwcVXNQZtHLMzFQfSbJlSWFrrEMvpLQca8kV9I7waNWQ5YEvBMOciX3Ri3nLMPRAl0CGSGlV8cPGQIaMSzcnBEgLcSJY7Htn+mkG7LjOnihyagKsQJ569m9HQYjzzy0XJiyHcbgO8dK7z7dMBFkkywsToOXuKcSGM+WXq2nAf+Z/g5h6Sfj8VcXgvtuVNQDEqf0m9HAwQg+oN/DqURWk3FiDhmh5kEGffRcJ68Pl3X+zcA/6WXXiGtomGdxtaF6BWV3SV1oswDOHcpn0L8lISwgnKlU7rEiFkAvAsRtW+Puoz1tG2ZgoGBZYLFOpUSpbVejMq0aFlfwZLkUNlc3ScLRT3JqmF3cZ/t00yB28D4y/7zEEZFMR2eoNam62GC+Mntcq4jCJnnSxGC4vBVXYrbtf18leCCo2w+zwPKO/finp02T1JuZtXWdssrSAXdgq8qZJtSXX4EvQZjjrkMXOO76oFyk0qoGCZFG7WcQwMOKk3+oDpg97wv+VE4vpTxsU+9tNDpY6aY5AaGO0ACvF+VKXd5moxxtWwu57c0mwbqVBloGcs6gMEqM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC23C1CB7112754591C3D1F2F384AE69@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KqZYvLK8q9kJPIQ7dUkh/XunK9Am4WrJ1x9VKLZavFklyDxMzxfGbVqPX9K+VdzMqnjyOvQ5q/xGc/Ij5rXffxiIQM1w1UCIH6ZmtFvDT85uRUFSPINof3rAI7QFsIgIKbC2lwIJQ0StCOzZOuQu2DctdiVVeXenusb1IA/gXrz47SuuniJZcA1U6oXLgtOFeXvE1aSBWdpajdXsP23sfqSEeY9v2Q+7/L4cBxjquZvD75jSufRzq+cLqBqYVieG25e6x8uGEnurjM+04izJMkIzg7PMPekJsyETMlwzOLFJJhBX+HqsiR93pWC0Gc8mgqdN3kd3x272rrbvW1JbGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 14754e53889c4ad8baaff887ba1f41e5:solidrun,office365_emails,sent,inline:e406a2a40cf0329e85a1817db30ac88a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a0e4210f-b6c9-4484-67e4-08de828e8e5d
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|376014|1800799024|36860700016|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KGZH0ZyfNN8aIGk76UaZQ4mqOJkBoYR97lnsngawGJh7ecLld9q4VcEbxSOaV6amn9rs7pUZ9kP/qsVWURUw0JvDB2zwL1o6kuZhd510CEG6k1PvprZ4CUgDNX1y81dttHlC+wyhbGTmgCEcKNwjbOIFv1/Kb9MmVw18YDtfvzBi33p16ROzrMn9U+Go7WEilRU5sgObiDEwI2T8S0Bmr3Oe9XEnBQqLE4MhbfV8fcXVpF/aPL0d9GBYRFmoxApcMlf5QCy80G7+NwOyKClYsHgFg45YqPNHI3oWJxkt+j7Z6lNf073CRAFWtTE8+xIMTZk4pfoE1Q3vvdDfNck+JQ/VPvYt9Owacgg+B7njV/KZRBLyFfv5SOe3RjStE6lbOZzTzNEuF3Hvfl6jN++8Vvfy/0aUfOl51jxXmjriRerOFLzaGpis9CWSF/aOw6ElVoGOTenZvYUGWwfFvmXAQY0B4viXAB56itJt2H6dCO7dwdHuw174KJNErMriJgOI8izCjkuUSFAcc4PA2zjyp8ZqlxrVWMP7T4xxjvTIjJ1vTgdqbBm/pRCNC/JZuuZu/+OxhW6Ow/px2VLdlG0yft8W8uMrIvCWDClv/HD9YqEzL2zC7UTud4hnp2/JHNQgVAaUpW6/IC0YpVZspNbShowrSe3TzlXZzqA6MXjEoE2+9zc0OfHlnmpBvK1x4NWuUM5QXJz1UfFqQGfR0IMK0+DadH4Y9aAQwEfv31TiuJMi9unBecmN7+3A/XqlGfx87TVXwEhRY9GqjYogS2a8Mw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(1800799024)(36860700016)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zwds/B1cBQQ4ySmhW6wMKqjuY0dRulkYWW7lgpbbz+ADAXeM4PPtxQJnS/TLWqi4hEPHJRUUmG9vaalwfLxH/i1Xkj3FXvwPH3RefpBUHKpI8nTalTsaxz7btr2ZcBAHgpHyK0fkNrPtrLoDMNGtR3KPGGxxufMnXZNO6r0LPfbkHX+8zmoOLOw453yFhtFMa7nxI4xKsqvXpG+ejGiwIoNTQFpdqnQPYQikvzxuLHED3oib6IUCaLpLle7JyxL2xu2WPKEkP77ipIL2qnJ9klhnjHxlIyPsVgGcYkDjzenk/DxMNpYImCPo7+dy+M26WXq9eAZm7TgwzINS8nGJq4V3XjKHH4AMwSWdCbVORpTlSolnRYiUdmuM1xAhtBn0+XRV4OhJQks/KP0yocK8PKA5aNw6IMZwsnDSf7GtlHGsKEC6Qm1G2rbQp+ksrzZ1
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 12:30:28.8951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4405f3c5-0b89-463a-4742-08de828ea476
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_053035_933519_5221CD08 
X-CRM114-Status: GOOD (  14.47  )
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

T24gMy8xNC8yNiAxNDowNSwgSm9zdWEgTWF5ZXIgd3JvdGU6DQo+IExYMjE2MkEgQ2xlYXJmb2cg
aGFzIGZvdXIgTEVEcyBhdHRhY2hlZCBwaHlzaWNhbGx5IHRvIHRoZSA0LXBvcnQgU0ZQDQo+IGNv
bm5lY3Rvci4gVGhleSBhcmUgaW50ZW5kZWQgdG8gc2hvdyBpbmZvcm1hdGlvbiByZWxhdGluZyB0
byBuZXR3b3JrDQo+IGludGVyZmFjZSBzdGF0dXMuDQo+DQo+IFNlbGVjdCAibmV0ZGV2IiBhcyBk
ZWZhdWx0IHRyaWdnZXIgZm9yIGVhY2ggTEVELCBhbmQgbGluayBlYWNoIG9uZSB0bw0KPiB0aGUg
cmVzcGVjdGl2ZSBkcG1hYyBpbnN0YW5jZSBhcyB0cmlnZ2VyLXNvdXJjZS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IC0tLQ0KPiAgIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjJhLWNsZWFyZm9nLmR0cyB8IDgg
KysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYyYS1jbGVhcmZv
Zy5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYyYS1jbGVhcmZv
Zy5kdHMNCj4gaW5kZXggODkyMDMyNmEwNjczNS4uOWQ1MGQzZTI3NjFkYSAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MmEtY2xlYXJmb2cuZHRz
DQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjJhLWNsZWFy
Zm9nLmR0cw0KPiBAQCAtNDEsMjEgKzQxLDI5IEBAIGxlZHMgew0KPiAgIAkJbGVkX3NmcF9hdDog
bGVkLXNmcC1hdCB7DQo+ICAgCQkJZ3Bpb3MgPSA8JmdwaW8yIDUgR1BJT19BQ1RJVkVfSElHSD47
IC8qIFBST0NfSVJRNSAqLw0KPiAgIAkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsNCj4gKwkJCWxp
bnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJuZXRkZXYiOw0KPiArCQkJdHJpZ2dlci1zb3VyY2VzID0g
PCZkcG1hYzM+Ow0KTGlua2luZyBhIGRwbWFjIGFzIHRyaWdnZXItc291cmNlIGRvZXNuJ3QgYWN0
dWFsbHkgd29yayBjdXJyZW50bHksDQpidXQgdGhlIGJpbmRpbmdzIGFsbG93IGl0Lg0KDQpBbnkg
b3BpbmlvbnMgb24gd2hldGhlciBvciBub3QgaXQgaXMgYmV0dGVyIHRvIG9taXQgZm9yIG5vdz8N
Cg0KTm90ZSB0aGVyZSBhcmUgY29tcGxpY2F0aW9ucyBkdWUgdG8gZHBhYTIgZHJpdmVyIGJpbmRp
bmcgbmV0ZGV2cw0KdG8gc29mdHdhcmUtb25seSBkcG5pIG9iamVjdHMgd2hpY2ggYXJlIG5vdCBs
aXN0ZWQgaW4gZGV2aWNlLXRyZWUuDQoNClRoZSBkcG1hYyBvYmplY3RzIGhvd2V2ZXIgYXJlIGhh
cmQtd2lyZWQgdG8gc3BlY2lmaWMgcGh5c2ljYWwgc2lnbmFscywNCmFuZCB0aGVyZWZvcmUgc3Vp
dGFibGUgZm9yIG1hcHBpbmcgTEVEcyBjb3JyZWN0bHkuDQoNClZlbmRvciBCU1AgZG9lcyB0aGlz
IHdpdGggdWRldiBydWxlcyBmb3Igbm93Og0KDQpTVUJTWVNURU09PSJuZXQiLCBBQ1RJT049PSJh
ZGQiLCANCkVOVntPRl9GVUxMTkFNRX09PSIvc29jL2ZzbC1tY0A4MGMwMDAwMDAvZHBtYWNzL2V0
aGVybmV0QDMiLCANClJVTis9Ii9iaW4vc2ggLWMgJ2VjaG8gJWsgPiAvc3lzL2NsYXNzL2xlZHMv
bGVkLXNmcC1hdC9kZXZpY2VfbmFtZSAmJiANCmVjaG8gMSA+IC9zeXMvY2xhc3MvbGVkcy9sZWQt
c2ZwLWF0L2xpbmsnIg0KU1VCU1lTVEVNPT0ibmV0IiwgQUNUSU9OPT0iYWRkIiwgDQpFTlZ7T0Zf
RlVMTE5BTUV9PT0iL3NvYy9mc2wtbWNAODBjMDAwMDAwL2RwbWFjcy9ldGhlcm5ldEA0IiwgDQpS
VU4rPSIvYmluL3NoIC1jICdlY2hvICVrID4gL3N5cy9jbGFzcy9sZWRzL2xlZC1zZnAtYWIvZGV2
aWNlX25hbWUgJiYgDQplY2hvIDEgPiAvc3lzL2NsYXNzL2xlZHMvbGVkLXNmcC1hYi9saW5rJyIN
ClNVQlNZU1RFTT09Im5ldCIsIEFDVElPTj09ImFkZCIsIA0KRU5We09GX0ZVTExOQU1FfT09Ii9z
b2MvZnNsLW1jQDgwYzAwMDAwMC9kcG1hY3MvZXRoZXJuZXRANSIsIA0KUlVOKz0iL2Jpbi9zaCAt
YyAnZWNobyAlayA+IC9zeXMvY2xhc3MvbGVkcy9sZWQtc2ZwLWJ0L2RldmljZV9uYW1lICYmIA0K
ZWNobyAxID4gL3N5cy9jbGFzcy9sZWRzL2xlZC1zZnAtYnQvbGluayciDQpTVUJTWVNURU09PSJu
ZXQiLCBBQ1RJT049PSJhZGQiLCANCkVOVntPRl9GVUxMTkFNRX09PSIvc29jL2ZzbC1tY0A4MGMw
MDAwMDAvZHBtYWNzL2V0aGVybmV0QDYiLCANClJVTis9Ii9iaW4vc2ggLWMgJ2VjaG8gJWsgPiAv
c3lzL2NsYXNzL2xlZHMvbGVkLXNmcC1iYi9kZXZpY2VfbmFtZSAmJiANCmVjaG8gMSA+IC9zeXMv
Y2xhc3MvbGVkcy9sZWQtc2ZwLWJiL2xpbmsnIg0KDQo+ICAgCQl9Ow0KPiAgIA0KPiAgIAkJbGVk
X3NmcF9hYjogbGVkLXNmcC1hYiB7DQo+ICAgCQkJZ3Bpb3MgPSA8JmdwaW8yIDExIEdQSU9fQUNU
SVZFX0hJR0g+OyAvKiBQUk9DX0lSUTExICovDQo+ICAgCQkJZGVmYXVsdC1zdGF0ZSA9ICJvZmYi
Ow0KPiArCQkJbGludXgsZGVmYXVsdC10cmlnZ2VyID0gIm5ldGRldiI7DQo+ICsJCQl0cmlnZ2Vy
LXNvdXJjZXMgPSA8JmRwbWFjND47DQo+ICAgCQl9Ow0KPiAgIA0KPiAgIAkJbGVkX3NmcF9idDog
bGVkLXNmcC1idCB7DQo+ICAgCQkJZ3Bpb3MgPSA8JmdwaW8yIDEzIEdQSU9fQUNUSVZFX0hJR0g+
OyAvKiBFVlQxX0IgKi8NCj4gICAJCQlkZWZhdWx0LXN0YXRlID0gIm9mZiI7DQo+ICsJCQlsaW51
eCxkZWZhdWx0LXRyaWdnZXIgPSAibmV0ZGV2IjsNCj4gKwkJCXRyaWdnZXItc291cmNlcyA9IDwm
ZHBtYWM1PjsNCj4gICAJCX07DQo+ICAgDQo+ICAgCQlsZWRfc2ZwX2JiOiBsZWQtc2ZwLWJiIHsN
Cj4gICAJCQlncGlvcyA9IDwmZ3BpbzIgMTQgR1BJT19BQ1RJVkVfSElHSD47IC8qIEVWVDJfQiAq
Lw0KPiAgIAkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsNCj4gKwkJCWxpbnV4LGRlZmF1bHQtdHJp
Z2dlciA9ICJuZXRkZXYiOw0KPiArCQkJdHJpZ2dlci1zb3VyY2VzID0gPCZkcG1hYzY+Ow0KPiAg
IAkJfTsNCj4gICAJfTsNCj4gICANCj4=

