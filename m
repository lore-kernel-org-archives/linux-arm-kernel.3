Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C588CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWnJ61vc8TrmR90geugTcHyy4SwnyqIxAMs5deKrqH8=; b=XjteU71sTxH4crHZA/WABJ9CZe
	kVEdwsGWxVKFv2KfrkN2j5XiNdEFad4F18Y3x1XOyQNltJPCAhKP5F+4pbKUAQ6peTACluxPDTx2K
	3zEPEn48q0Jl52DuMmafnA2TsDn69H6C0rqosyazxf64CQDBpIxSGA8jJHIb5UycPbWLE0m6FfnYx
	c5d2c+zUp4iB4Y82sBdzD1FQs3HAKZYk7OPfN3FvViXRKxIHSm/Dqsg9aOHMk6ve7PZLlSV7sJU2/
	aYmZAge5/hbUR2p7M0P8TdTbaNSdCISu0b69Fh+gDSejO4/8Vuyuf/2arSPrqv57elCPcPyh+dZbP
	cXfko8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbYG-00000008v3C-0nKd;
	Mon, 25 Aug 2025 18:04:16 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbVW-00000008uW3-3aUw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 18:01:28 +0000
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e3TO+gkYypAvcraRVgG0KW46vldjGplW9SEA1Qpm16wKrF7k58sQdJqOwlc2tR5QbuC1JMAIV5AO5+6eestS78ar4OtBvPVYTVMQPkeACXmZfn2HGEm+yvImVAWEI0yHrDCZcqSDZamVT9bGfRvPku/rTWvD6BjVGzQjmg4vEN80xzKWPn6gfwmWDW/iI5lsMF8OO01dM0uwbRl4fzZ88Znc+Zh4iHC1+XrxmwK4hLHSPcAJtVdX667ioAf5u4GHdN4ErbH9o12mciY/q7dciUsVn3H609HgrUAVjUDhwIPZG7rWFFkk/hy9e7C2LkWfd7rZm4DmQkd9CtIJm+vfpA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWnJ61vc8TrmR90geugTcHyy4SwnyqIxAMs5deKrqH8=;
 b=T359515QODA63mZGM5H60S76KVbSPdJqJ86ZnaJM3E14cyQ6raNmd5Hs+wmlQFa96biQ3qFnGMHR8VHO9dsGnaXYRQB1lsjHtkCLkFXCgt4O4WFucKxx6AkZrOm9T1Eep1269DQdcnIrcBTJQJFSUI7P+4aNp4ai9vb+Uu2gpE5UQNf1BoQO9HrfmNTBCvqmjTgMDv5zqip4isxIOCdoiKXeGpZH9tZiONXugCeIRC0Dw534IIeYuWRMy3mlGEB/8n1Vkuo6cEgaFgZSKGBWVT/zjJWCgvaIjdT7m94zhvSPQWhd5uugHbyaDML4XbZabp1dMUT5isR+g1l7QN0mmw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWnJ61vc8TrmR90geugTcHyy4SwnyqIxAMs5deKrqH8=;
 b=Ca1472/x6Xdj6WJ7QWoqJct8DVMf6YZXmOvaEEScjtmEgJk6dnZpLFmYjG593oeB2wokJg73Kxv1xQWUKF3R384nVNS9I/NMbd84P3BqK8t3JvUn+mELMzMhWJkKwAQiUFl57TSHo+X2t5ei7hO0kYzmssutBJRGfJv7h8EGnio=
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Mon, 25 Aug
 2025 18:01:17 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::40) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Mon,
 25 Aug 2025 18:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Mon, 25 Aug 2025 18:01:17 +0000
Received: from emails-3081853-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 45AC580375;
	Mon, 25 Aug 2025 18:01:17 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1756144877; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=NWnJ61vc8TrmR90geugTcHyy4SwnyqIxAMs5deKrqH8=;
 b=WCD35kbEw2jVrYOzeU3QuoT5h0qT2ob7wMcZNe9XkLEJyCllQAQjTM1bJCLh+XI+C535i
 q40EyHrRWvK6F7K5/ci3arQKzUwTHSquUyh1TcnqMJKhaAzDnpAGpHGE8BfbrDWFPg4PO/Y
 nQv/1bLXWcXjuW98u9Qscy/QhkTE5Zg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1756144877;
 b=iaSRzDQBZ1khZFwscYBWVAWMZ5BFPhURkJWiX/Nt/DKfnXlzyQlGOGGq63kJ1t/IFb1Ux
 fkoDPyu8SOYKbfuVQBo4JksYzKfMOkhZGuMkeSTKRSCXKxfHUaXV8vWTygtBtbybmnPjR2Z
 enp1CqFWEC7nr5hqBWqL+H+41UVaZSI=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xG/Yk8rW59xuWWwgDS2p/q3CE98U/lFNProh0AU4MfioGbHzmxuo0J7gTyfekmbnO2aSdXlAytmDsjiSi7441I3fNMIhvi7j9jtdRj9qVBepqDn9d6pM2IWtekXzqhuaIs4vc/mchpL9KVuy8c0YgMlX5NsQLQ32VtOvX+6iopttUIuqU3HR8byMfVzGenFXWY7dqIoSq3oMSu+qrsFS+riyxD4WutP0j/y4eUlI+Fgw5Q0GvA2XOrcfCwtaLmA9o2oIpty8GHialy1vEKtg71oAWsOuT//SmyJ+aAP2r0yAHh//DuRICnSLyMtQ6AWsQPX+fBOBy7WoYKXMXoULBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWnJ61vc8TrmR90geugTcHyy4SwnyqIxAMs5deKrqH8=;
 b=yJuccQvVBfzpEEB+4tYdCiw3XTFAkzsf5FoNcam8IjtlYOG9koUW/nRi2RtYpknGzLNWGTEmUB/GAnKzrbB/XN+qnb2t7Z1NwLuIgZeTl+NHV+Jm6BZPKUH3o4ZMBmMCB2TIYxXC96fagaxKbUOAb6MhuGWSP6u4zWYRx7MbbB8Dk6LIrHTjBsFvkH63MB7wRnjzRoRBCfu9vLN+fJfyy/wUXOeubf/hMIuJ4cTDC0vXIe/EfsQZzD+YBzN/5PoFieve9t9bcw2X2WKOUtksxtxQNJ/5sLvW/uRkmM7vDS1+tzTEXTcen+/mnR69itepmbaPq3vJB0keSeDRDAnCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWnJ61vc8TrmR90geugTcHyy4SwnyqIxAMs5deKrqH8=;
 b=Ca1472/x6Xdj6WJ7QWoqJct8DVMf6YZXmOvaEEScjtmEgJk6dnZpLFmYjG593oeB2wokJg73Kxv1xQWUKF3R384nVNS9I/NMbd84P3BqK8t3JvUn+mELMzMhWJkKwAQiUFl57TSHo+X2t5ei7hO0kYzmssutBJRGfJv7h8EGnio=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8289.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.12; Mon, 25 Aug
 2025 18:01:05 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9073.010; Mon, 25 Aug 2025
 18:01:05 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 25 Aug 2025 20:00:56 +0200
Subject: [PATCH 2/2] arm64: dts: lx2160a-clearfog-itx: enable pcie nodes
 for x4 and x8 slots
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-lx2160-clearfog-omissions-v1-2-e3a28c0ea55f@solid-run.com>
References: <20250825-lx2160-clearfog-omissions-v1-0-e3a28c0ea55f@solid-run.com>
In-Reply-To: <20250825-lx2160-clearfog-omissions-v1-0-e3a28c0ea55f@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8289:EE_|DB1PEPF000509F6:EE_|DB9PR04MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: c76d65b6-3f01-4eb5-fe77-08dde40163aa
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bGdSWjJvUVg4T1RoOVRUUTV1cUR0VVc5aWk3Mlp3aENEQVlKSld0T3JhNkdk?=
 =?utf-8?B?MUpXSVRaMHU4TE9WeHNRS3BtaWNJenBFU1hiUTJIWGY1V2tTSzdTSGZYRjRi?=
 =?utf-8?B?aGZDcWF1dW11YklGQnFpY1ppV3BPdUlRU3h2eENhLytDODNIb2JxVlJRNkQ1?=
 =?utf-8?B?cENReGRJSm5Lc2tSSzE1ZC9VdUJJTDhNNERaT3FtYVpsdE96MnN1T2VORnBQ?=
 =?utf-8?B?ajUyTmpyK3IzbzdRVWkya1piY3hsLzVUWmF6V1ZZUEI1aFhrdkI4MG9MR2Ux?=
 =?utf-8?B?cVFEb21kM3NaaWQvRExHRmpaL05CVFlHY2NmVDV4MTJXeGdaQ2ZLWUYyUW56?=
 =?utf-8?B?SmI5a3lJMmEweFd6Q2dGMHU1c1hPakpjdkxqdTkrU1I0NGJ2VG9tVnVaVXRi?=
 =?utf-8?B?UWVESmdsOURmUzhyamo4b1Myc1Fsemxwcmh4U0dCdGdZbm5HMzFrL2pLMUR4?=
 =?utf-8?B?cFp3MTUwQjNnKzVtUnJlSFRiT3dXSVpvZDd1R280Wk4yQkd6dXMvc2Y2WG5I?=
 =?utf-8?B?dnNUZTBmS2UvbElnVjJIN29abmdtbDVKdytENjVSQW1TMkdGM1NHb1FGU2tZ?=
 =?utf-8?B?Tnc0MmliSVNOcXpJbitRZnphcE83T2lDM1NNSk1OZGhKSTV4WnAreWpldkYz?=
 =?utf-8?B?MGNrREd4YkVDd293elh4d0twVGZLQTgrbFQ0WkNkOEFFZDZ0Qzk1NnZ2VTZN?=
 =?utf-8?B?ZG50U3ZrUWpmV1FWclBUbVRURWdVaVgxUlgySVYzZ3VZV0VOa01RekhxWGwz?=
 =?utf-8?B?NUFYUGlLMmNrdHZHYTJyZkhBaGRxTkdlS1Y3WS9rRUFQZkt3amdSTWgveE5B?=
 =?utf-8?B?QzVrL3Fwdkp6OWh2R094OXdsa0oxR3k1TVh6cXkwVmN2QTdJVVhqb2tyQlRn?=
 =?utf-8?B?WXBPa2ZBanZvTjBKMjBLNG9hN1pUVmlMQlZBc2NVeWJDNk9UaGJrVGE5VEYz?=
 =?utf-8?B?UG54QlQ3OUltU043dmJsL3NDNlFQdzlab1RDMkJMTE9CR3ZLYko5WWhrWStC?=
 =?utf-8?B?OTNGZ0g4WGN0SFdrWk9RSkRkUVJDZnpZVWtIWTFKZVRYOVlVUDhxR2UrbUpM?=
 =?utf-8?B?Y29JL2t5bDVTTHlLa3laN1k3N0lqOFh0eWszd0dCT0JvM2lnMzlLYWlvTS84?=
 =?utf-8?B?SE5IenhvRXcwMGdDUGN2ZTlhZWYzMVFTVnJ6S3QzTFhWQXZOcGJyeEV0dkwx?=
 =?utf-8?B?a2JVRnNzY1ZxK2Ric3NUK1ZGN0Fia21GV0c3aW1zbVdXVWNZOXN0K2xRVExq?=
 =?utf-8?B?eVpuK1FGVTYzNVVFaFYxS2tldm8xMEtzRFR6bUcwQ3YxQ3R6NWNiTFlpbktx?=
 =?utf-8?B?MVdDRjcyNkpseDB3U3QxZjdhZWVsY3hOeko1RnRQbTcvU3MzWHVlUXl4bW9o?=
 =?utf-8?B?NGJwRkIvOTBYNHRBZGRrSUN1WUpraGRzUms5Wk1QdlJlN1EwY1VBZ1VBUUgz?=
 =?utf-8?B?Ny9KS1VBVWI2MzNsbGdaUzBpL3lIQ1VtMEk2ckdJZTJnREFpa3BBWURWUWho?=
 =?utf-8?B?UzVwTlJIczRvdElrbVUzY3dWUFZyaDljWHl6WHBGVWVDUTJ5U1VwYXhMc1N6?=
 =?utf-8?B?aGxWTmNJNWtaR1hKQmNmcHhRV2ROeEliVWtCbjVzaXJEUy9MbmJtNzFzMHNC?=
 =?utf-8?B?L2IraHR1QU9IMHc3RlZvT2ROdlRaczdIdHZ6SGozU2gvYmxrTk9ZZWRTcElX?=
 =?utf-8?B?a0hEZVNaK0VoTEJRV29wYlB4a2tzcDFIdGJBQUVkWlN0UEIzWmlMK0NnUUVt?=
 =?utf-8?B?MDVsY3FEdkoxTHc0NFdHd0hxQXhRM0h2bFdZWFNpdWVXMTE0TytmSXp3S21a?=
 =?utf-8?B?NFhmS2lwclR1TmcxRWVpQy90SDZjZER5VlQxMGFPci92NE9nOStialJEK054?=
 =?utf-8?B?ZWE1dXRHTnhDVVdmeFVYbEZQekhUWkJJU3F1bll0OUJuUGtHWXF2dlNnY25M?=
 =?utf-8?B?T1laNEZmdEZuZE1CYXdNSlpJU3VMUGRtM05zSWRaUWdTREQ3bHAwTGdQNGI2?=
 =?utf-8?B?VGdSSEJjTytBPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8289
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b7f694fc8f5644889ac3e23ed98a0168:solidrun,office365_emails,sent,inline:b7f6fed3d82496f51e06eac14cea92c1
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d0d306ab-71e2-460b-2599-08dde4015c25
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|35042699022|376014|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmNUVlduR2swMlV1Nmx2RUZLWEUzNWU4LzZmeUlpclVHMGtlcS9xaDVqSUVo?=
 =?utf-8?B?OWFkRVI4b2h1VGtjd0Rpa0pZMXRWSGdmbElsSC9iOXNXTml0Nk1IRnMwcGcx?=
 =?utf-8?B?dHRHZzFDNW5ueWdpYUV4cWJTajVMb3ZrWTBtMlVJODVNbGpSbmJ5Qlp1clhT?=
 =?utf-8?B?MTlTbXpGNWVrWFY5bUNlelpTNEc0WWgzRWZhSm52cUU0S0ROVEx6N1MxZ3JR?=
 =?utf-8?B?QlRTeDBuYnpaaXdDbWdCQVVvZVh0RVJ1bjZYWXFEZFBxK2JDbDhXV2dGWXI4?=
 =?utf-8?B?cnB5TStxZFdPdmtmdHBCa3pkL09aT0xpNzJsNXVCaWRacTJMcGc3Vm1kNGRi?=
 =?utf-8?B?SXk0azNYRnR5QkE5VGw0dytuUmhmVmxuaHdadmg1TzREMkpoQmVQSE51SkFm?=
 =?utf-8?B?U1BrT0NZSlB1OEZQenFSbnZjcjU3M25YSG5ueWV6ZnNKWnBSbkY3cENpbUo3?=
 =?utf-8?B?Zmc4MjlVak5tUTVZSmhOckd3Z0NTV29FYXZCSnJVTlpQRytjZFhuQTE5OXZE?=
 =?utf-8?B?TldjYmVMNmliNG1rdTJDSkx0alpVR213cGdRRWFCUVBVb2NOUWFaSlVkb09U?=
 =?utf-8?B?eU9aclBDWWFXUGhiZ3RJTUFGdHB5eXlqMm81NDloanc1ZExTMUYvVEVjQ2xa?=
 =?utf-8?B?UEJQZmZmZlFKQkx1Q0pJTGZZTzZsVkE0U2JpRXV5bEhNOExabWVTYVdMdFdJ?=
 =?utf-8?B?SWlNM1RDenY2dFgvQVVaZyt4R0MxVUJ5L3FrY0JQQytKOUlmMU1IaTZ0WTU5?=
 =?utf-8?B?NkxVMGtvSVVIU01UNENNVG1CL0FyQnYrZHVxSGlWWW5NKzRnUzJjSDVVNTJL?=
 =?utf-8?B?clV2Nnc3NHM5M004OHRPdDZUeG42ODUzWGM2NHNhaVhrMWFlZkRobkI5bGEr?=
 =?utf-8?B?RFZVbE1obCtDRnZQQ3FDcHV5Q1lydG5kMmFmZ0VYMm5GTTY4MGJBKzUwRjBi?=
 =?utf-8?B?WmdESThveENQajJjcU5rS012RVQvV2x0MW54a3EwLzRxVEppbDgwWGY3MFpa?=
 =?utf-8?B?bFR4QzBENlVYTEtieEVpd0NtU01XQ25sRzRoT1RvSFJBZGN1Nlk1M3hTa3VY?=
 =?utf-8?B?d1ZnRThadUxYMkZVQkRTbUFnUC9QM2EydE1uaEFvdTI5ZkIyY3FtODV1a0Ji?=
 =?utf-8?B?N0dFb2tUMlZSU2M0a3RTV2p3UVhaM00wNFRZUjJlNnlIeUw1b0NrNnpzZFl5?=
 =?utf-8?B?bk0yRk5hUWdvZkYxUFcwNUloRlpLR3llYkR3MzE0QWNTeXlwVm5GZHVxYTlk?=
 =?utf-8?B?ODN2V1FtVW80bTY1VzFmSE1iSU9vY1VRZTY5TXFqZFdvaUcxVEtDcy92cVhp?=
 =?utf-8?B?NVA5Y2RMSlBYWlNGa0lYQVZlRVZrV05uV3lWSjE5aVJqSDhRSExjT2pObWE0?=
 =?utf-8?B?R0JqZmNVdHdMUGU3ZWsyc0VodnBGamZoSVVhbXd1am9abmk0TkxpS21YWUsv?=
 =?utf-8?B?T1VwRTlSb3dRUW5sSnFVaGVtRDdlZ2dJbGU3K2t1Tis1Zmp4N2MwYThSanhQ?=
 =?utf-8?B?MGs5c0VQVlIzTDR3TFJBMGlVR0RxRU1uUmJCV3dzL1dJSUJXMlZyZlh4QTI1?=
 =?utf-8?B?aGszdVpINzM3ZHo0b21kWWFyNld4TWFLNlRHVUh3azhVR0tMQkovSWF2THM0?=
 =?utf-8?B?eWtaY1BTYW5DaFpaSWVsQ3pSdzgxS2tuOEdiSzJpdFlHZGs0WjNoa3lHU3Nz?=
 =?utf-8?B?SDVTSXN6TTc5Umh2T0FDUXIzeWNTem5Bc25iZ01Lb25VcE5BMjlnSTB5MHdS?=
 =?utf-8?B?N1JJVDlKTVZMcU10OE10VW1IY3RRRkJKL1FQQXhxYjd0R0IwZXE4R2RWbHph?=
 =?utf-8?B?aTh0ZVV4OHBxNHZrdjJnREF0dXZCamlRa05oWFhJVXdKSk4wSHpVM0toNHMz?=
 =?utf-8?B?eG56QlhzSW9WWmFuOXpOTEhJT2VBSmRSc2NPSDN3bENGTGh2YXRUcldzR3BM?=
 =?utf-8?B?Smc4OFI5UzczWm5VeEpjc0lXS1J2Wkx4TFJGaGtrRG1UejV2ZU5iK0F3Ylgv?=
 =?utf-8?B?cDVKckZNVWpJaUhDb1lZcThUQVY2K2pmZDNFSnovRmZ1NU5sZEorS0w1REpp?=
 =?utf-8?Q?nMURMS?=
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(82310400026)(1800799024)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:01:17.4300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c76d65b6-3f01-4eb5-fe77-08dde40163aa
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_110127_050739_09124044 
X-CRM114-Status: UNSURE (   9.89  )
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

SolidRun Clearfog CX and Honeycomb have LX2160A PEX3 and PEX5 exposed on
physical connectors.

Vendor U-Boot used to patch status properties such that it went
undiscovered these nodes have their status set disabled.

Set status okay for pcie3 and pcie5 nodes.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index a7dcbecc1f41b5387fdfc0e6c449e97bab0398cd..af6258b2fe82654615ba9b899928d4dd1339d573 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -96,6 +96,14 @@ &esdhc0 {
 	status = "okay";
 };
 
+&pcie3 {
+	status = "okay";
+};
+
+&pcie5 {
+	status = "okay";
+};
+
 &pcs_mdio7 {
 	status = "okay";
 };

-- 
2.43.0


