Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA3FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mA/M2yfUtu8zNJQh/42keKiP/yoGWRCF9Gqcyr0XaYY=; b=2pBFF2Whv7yx19OTLNIAQSi1fY
	ciWWXRuVkPuMuNg1o5P5BaRBYE8gp6FMZD29BfGTwPtd5kN5646wOMxRW05MywZrEnFUvjGp2Sp74
	P/VfIpX5YCtCYx7zqwn/3rQs22pKJTJtQ5waDVIcQ2VWnzf5HTJZ8U64mDuzasS8+KcTTaqHB6ahV
	NJI40cE8TcGzsbdxxWzB639Jr5W5rgem92AJWWVNugGwfOBtswbviEVHGjqmBHyRNKCs8PFmVvco/
	hE7MX8mq0xn4MGzMWXwxH6YfCIBsO1m5a86xq/7hnW+dMFo6PTAXE5l+8QOLyZHrFQwc61pnUxtsr
	CLoOfZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTrw-0000000353o-1v9i;
	Fri, 22 Aug 2025 15:39:56 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPMg-00000002F9A-41rd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z74lbkjLE/HPoTRNAfr/xbYqa/v0kYNKRQ6JWQNpZggjy20eRsDcX9i77Gto9BB9vtgEZ/vAqFrLRRqkPl6IwOt+Ml2kIPuQCYPblEzdpuI/dMK3gHM1tihTCqnwU0qf0bW8Yfn7o3zH1/euaPd6YwFcRm3WWakRa2FwbKX9v/jjphwyjn2MvD/LAbaLTQXLkGS97Xq+4sOSElqMUbxTE3e+WOpnkjLMPyD7s71OdFE+D+X3EJBqezTHmcEX4v10L0W0M606U6iYwJoBrHXqqwnkvpXYSyXXoeBsqf0waf0GEhMA3LG3+WJttbpg36cYyJJ5gVnLrINKXryIZAWfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA/M2yfUtu8zNJQh/42keKiP/yoGWRCF9Gqcyr0XaYY=;
 b=e9I22qfTiiUntK8p4v4ifNa38aLEtJk/MqDEFvSIzeOSbVNUN7TzkA2GWXlhCXpbgRs0Dimvij/SHKeKGSwTw6+BpjpHZeCxjnytn3xDkxK8IoFo75ZKNv22xOctUDR6wlfOnLcXC59cPK760lrNWnPLyCf4w22KLJOYRZ6csSLrBbG7gWuIBdfAvxpdcFHqwpOFks24SOIIcR0GjdQje2larQ2XFiigiMI7F4jHwXuwp2ziwkDee2h3fDzX8wqxnFhdP9hxMSaO9/fzT5iwKh6cpTPn7nE9nVaSmjYQ3gRVQnf9oozqfGHXrfld7DKR3kTuSBryaKZ4jRa+LqvStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA/M2yfUtu8zNJQh/42keKiP/yoGWRCF9Gqcyr0XaYY=;
 b=E3iDCQ5S6749YLS9usquYkecfHAlqRNtbYMHZxQfyix+N1gDnCJ+uzfy2IHuXLwQ/DqhYBsYaR7EfoHx9+ALDTfUZ2AqFdPuT2UtxVxN2xinm7iaBWhBSXBT0976AVw+b2U7OdEtBpMoU7vb1nz0NJiOhVjAEIdOJ43YXz2m/Zy3E06nL8Vv8Q/OqCSoA+mE422Mt2Rb7fWs89X3r5PKCf87JTQ/TMKzga5w2hyVu+WtUjpdAJbZtP7H01DQg9A2iR2fhV+zhcUY+9STzzRFKer6ygj1o31lO9D0EE5B/X72uHcp4a3r4DM9ryUPzXNZftD/ZkzNnTFYkSPB6zqmgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 10:51:16 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Fri, 22 Aug 2025
 10:51:16 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 22 Aug 2025 18:50:14 +0800
Subject: [PATCH v2 3/4] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-csi2_imx8ulp-v2-3-26a444394965@nxp.com>
References: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
In-Reply-To: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755859853; l=1279;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=HJqROAqzEX+7PJeSyerUBDBXtrnx9x5INKoImUgVQy8=;
 b=okCvErgAjFzTWTNGowqgNC4xStYzFCSvRp/VIQlfkO0VzW8LOgPLHnUzSZTGAijkMMCRVn8Z6
 08TVYB2mFixA/6cwfi71FtALTv+iUwo4aBI8m340j5qWMvzCzcn7hYV
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 105ab86e-3117-48a7-934d-08dde169d161
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzRUR0hDb1IrYlFucnl4K0k1RUZaWkFLRzRUU2dtWUM3b21wa1pucjJFaGZm?=
 =?utf-8?B?ZnUxVUR3amVrKzlJV2V6K1JpN3VWQk12SHArZXpvODFuZ3B4b2R6RGp2RVZE?=
 =?utf-8?B?VzRieTQvbWc3MW9GTGlHWFdFQzZpWnVab21qYXF1dXcxOWRHV1N2cHJzWXUz?=
 =?utf-8?B?akVrNGxwRVF1L1NVN1FrUWt5UGpPc0NZeWkwN2FYMkpXRERzWHZvNFlPRjBa?=
 =?utf-8?B?RUJpTnUyaFJ6WUVJdTQ1cS81b1dhMVZZSHJaZGRHUmpyV25TV0huZlJ3bVJp?=
 =?utf-8?B?MmxQbUh0eEcyYW9uNndaVVdCRUQ5WmtPQmZOQ080em54MUdJbjNJRE1IYW5D?=
 =?utf-8?B?bUdVeWZYVGl0QmpodHpDL2IxSDlmeHFYMjMydHZYZE9JbGZ3MzFUNVRtR1ll?=
 =?utf-8?B?cy9ndUpRc3NtdHpTUWRRMUtTc0hOSDhLN2F5VmhyRWRQZEdQekxmQXZXM2ND?=
 =?utf-8?B?cmJkcVZBZFlFbHRzeUc0NVZZV1N0NVMvQXBoYjFxZW5DVFRxNTBQVzRGSm02?=
 =?utf-8?B?MjQ2aGM0dVlmRnlHYllaKzVGTHpJNnBDZVZPSzlQcGxmNmhDM2Fxd1dpOGoy?=
 =?utf-8?B?NmpIMmg5dkllTlg2SzB1ejZVVjl4N1RLckVEWjh6ay9oTEgzbkQyM0hYUWZw?=
 =?utf-8?B?TEtyekIxWitQMHc2N05hRFZXbDFBWXBKWWhncktkT2RsKytzcks1NTg2ZlJa?=
 =?utf-8?B?ZTIvMks0a3MwendmZlUzK1p5eWE2TXRBZ1JNT2RBTWVYcU4yb0pRTmVlRnFG?=
 =?utf-8?B?enZMTnNoSkJSU2NiMGF0Z1g0Z1ZBVXBueU1WRm43NFdZbktzczRDTWxxY2xD?=
 =?utf-8?B?SVprRXE2N284U3M3bjd0ak5uWS8zQmV3WjNadkJoazJLWEpjWGRiTmM3dzh3?=
 =?utf-8?B?MytaeGxTc0xQMnNSTkVrZzhOTVFleXdRdVZLekJLNGpoNGpCbG44dGQrT0kr?=
 =?utf-8?B?MEhHak5MajlpdUJ6OVBIUXQrZ1BETHFEbDc1ckFsaC9FZERTbmxsOGdoeTZi?=
 =?utf-8?B?aW5hU0o5ekl2cER0NFdJTlE5b3BhemNXNGJwMlozcmxzcFpHeU1hWHNoMTd5?=
 =?utf-8?B?U3l3OUg1WTQ3Q1NWYy9ocGUxUDgvTFB4TEJYdE5zWUJCeEYzYmJ3dU5PMWY5?=
 =?utf-8?B?UUJnRENZdWJVbXRsWkpWdWFWRHI0MTlzZ2dKZktGMGJNRHBmZmU0OVJwMDdy?=
 =?utf-8?B?U1FULzk4UEhsUFNBODMzKytMSE8xR0dMSStWT1NnSWpoVlRMYnhERitOS1Uw?=
 =?utf-8?B?RzJhY2hrNFZoUERmdS9aMFBncDJ2TDBJOUdLbUNuRm5PbkFReVJjWDZzbEJU?=
 =?utf-8?B?NW5objdKYzNLZ216aGNxSHJFcVVBbk0yZTRPQ1g3TWlpMDBuWTlNYkp3c21m?=
 =?utf-8?B?U1dKbkJCd3dqU3ZCSEpQdVJ6VHJ6RU9uUUQ2MW9QM3NQdWpuNmRXU08xQ0Nz?=
 =?utf-8?B?VERSWmdmYythZEFyQUo3THNoWHJvZmdaT0RQNXQ0ek5BdmVmblFmaTRoVDJE?=
 =?utf-8?B?QnBLcTR0SXkvOU1GRjFvZWt6ZkFBSVFhQ3Z4OVlkR09VR3VtM09CQkdHUm5t?=
 =?utf-8?B?eW4vYy9CcTFwa2tISVo4dytPL215NUN6RWtnWlNkK2Zkdys3cnFEK1BjaUUv?=
 =?utf-8?B?a3BWdWtnRHlzclJxQVBMUmNXaXpqYlVQbkN3VDI0M3lqNkVvZkZ3bmNETm1w?=
 =?utf-8?B?U3pmbnhoMUh5Vyt0S0JTc1hubFhuNkwvU1NUaE9PL3dDWU5JSVJMQ2xxcEZs?=
 =?utf-8?B?cUd2ZG00Sm41Y3JQaksveGJLMnpqRWhKclQvQzVFejU0eGxtd3FxUGVYS3h6?=
 =?utf-8?B?QzRQdXJ4dGUyK2lDU0pXbkQxRTNvRHVTUGdjNlh5Q0JHNXZVSkdsWVk2b1Az?=
 =?utf-8?B?cGNuajlUTnNLOC8vMEZsQ3llQlZ5SVpBMytRalZoVzZyQW9YcDg0QmlWYitl?=
 =?utf-8?B?UFkxQmgxc1hBYnM4YU4remVTVWpQUk9RdW85Vlh0TkVvVkZiOG9wbjVuN0VV?=
 =?utf-8?Q?5dmLe39/Fb11lxxmA3MDbiDcF2Yugw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXNKUHQyeXplOHhGRy9VVTFIeHA5Y0xDR1ZIM0xNb2RkWWxTbDJpei9OODJU?=
 =?utf-8?B?M2ZpSE9kUFFyQm4zdFo1a3pFUVRvNTRCZzlSS3hITUxsbFhiQzNtVUNJdFFv?=
 =?utf-8?B?YXFnbU1aTk5jYzFjRnNLUTBQZTgvL3ZGK1M2S3BGc3ZMT2FaYUJFZ2FnZGg5?=
 =?utf-8?B?djM3L0hkTkNWSHpMWlBvOGVsbXI5MGRCaUx5dkpaRkQ0U2lWa1dZTVVHdWpl?=
 =?utf-8?B?WDU3QThsMEJVUFRPVXBlRnRTd2dNYk9QK3NYaXJ5TlhKMi9HR1lDU0dvclY0?=
 =?utf-8?B?T25GZlBlL1BDWFc5cjBybitjY1BRT1ZvU2trYitMTGdxK3l4NmlXOFk3b3d1?=
 =?utf-8?B?SHZyYUVXNDRES1BJZnQ4eklUNHNseFNEcTQvU3VNQUp4Y0VMV29GQ0ZzR29r?=
 =?utf-8?B?U0dnUDR3TEgxZldEWVgvSVZGZGd1NXArY01zejhUcnhxZzVsTEpjb1ZUdi9Q?=
 =?utf-8?B?UlAvK0wxVjJWYWM3WW1PbVFmSzBPaWJXOWpDZlJXbFF1VUgwODJwK21CY2Rt?=
 =?utf-8?B?Z21DNy9GVzI1L3ptU0I0cS9pSE5TYmM5eEdFb2VYL0czV1B0NDRtNGMwMHNB?=
 =?utf-8?B?b1pLeXdGMGFKczB0V1dUVEJ1NXhobWM1clI4SkgwVDRneDdGU2hsRlpoRUFh?=
 =?utf-8?B?aGl3L2pDTHlEdlFWcUN0ZzYrZXpKdEsxaW1wWHY1RktYdTF6YTl4OWFNQmlW?=
 =?utf-8?B?b01aa0g1bklTakV1WjJsc2MwQVM2NXV5TC94RkxGa0NPTldBZTBqVWVDQTRO?=
 =?utf-8?B?SlpBZGhOalp6OVJuRlFLYjkxdU8yMjNqRnZwNzNjWS9jR2JDZCt5Q2VnMTBi?=
 =?utf-8?B?VXdvd01FZmV6WEhZczU3Q2dncnJ0cHM3QmFiclYzVFA4Z3RDMDVWZVRjRHFK?=
 =?utf-8?B?MjQ1aWdNa0tSL2d4NHpKV3kwdnFZdHE2MVVjZ0Jjb0NSVXFXY3A1eTkrWTE1?=
 =?utf-8?B?MEtacDdsZ2ljOFJpWGxBNldDYU0xUk1oS21OeStMZTR2ZUg2K2ovL28waEVI?=
 =?utf-8?B?TWVOcUdGOStUc3pjN2JMTGszajk3Q3RtTEZFZHc3MHZURG9BUHBjU3haeFdr?=
 =?utf-8?B?NUExNlc2VGxMMEdWdUhJY25sZEh4MG5IWjJSY0hLejJwckdjdmUzNmFEVllj?=
 =?utf-8?B?dm1ZQ2NsOTlHUE1sWWU5akc0TlRIM2cwTmhQRkE0cEpjSG14b2EyYUlUNjNB?=
 =?utf-8?B?ZTFJaDZzRlpGOWx2Mk5qSEdoSzVwNWFBUTlYclVuUFhHVGp1a1AxY0dzTmIz?=
 =?utf-8?B?dFlLbGo3SGVBdVFCQytTNjdXUktkelNLbUFLcTY3SUMxNUo3M3lKTEFYTk1W?=
 =?utf-8?B?eW05UmtDNU1XVzg0L2YvZGFsUWZUdHRJblZiS29GdHlWeFNaeDFsRFdaUWlH?=
 =?utf-8?B?QkcxM1N3WXVWV0hpY1YxT0tkVkpOL3Y2ZmtFZzhkb0dRMkUvK3BtQWZzVUts?=
 =?utf-8?B?WUJaNm1IVEtwaDRMaklMRW9IR29WUFBzRG9JRzZMRWpnQWJZelM2ZHgwdW9t?=
 =?utf-8?B?OFZUR1NYYlJBNk9NSmp6emxPeDZlT3ZibkpHRHdid1l1TmtEMmNIRmNzaWFV?=
 =?utf-8?B?SVRoaFF2MDlDUUdyV1NoNU9JUzhGUFVyQnV6VWZRczN3MEZYenZ5NURqVnpm?=
 =?utf-8?B?Sjk1RldsUVI0anVtYXlnanE3U3VTT0dXT1BFSkY5ajM1TjBvaFREYWg0LytZ?=
 =?utf-8?B?ZUw5NnlPelN6MHBva2t4c2wxWjRRRTdaWllnRE1DclVPdDRzUlBKbEp6ekQ0?=
 =?utf-8?B?elRNcmRLVVRDc1NHR2M3cHFydjZaRVU3WVdPbEx3bDRraUlzV1plVlRFQnRD?=
 =?utf-8?B?QmczWFlQSmE2QjExOTdQR054OHErKzFXc3RiRlZscjlCb1Y5R29yVGZmUDAr?=
 =?utf-8?B?OUI0Vkg2T3p5b3VraStkTURDbFp2b09KWWhhbVNDM0tISDlURGlGZGZIVFNC?=
 =?utf-8?B?REo4RHVmcEFyOEFaVzVrQkJMZk5IeGFKMGFtWVMvenJ4S2diZ3MvRE85TEtm?=
 =?utf-8?B?Y3cyWE52cXNWWnRuY01QRzFUSXhWTHRLanA4K1p6bkNPVjRCcGhGSGljNGpY?=
 =?utf-8?B?Z3JyUlJlakUzRlZaU3M1YkU0dkNDV3dnU3JCV1lIU0xKT1M4aXlycmFsWWZS?=
 =?utf-8?Q?1iha9PVlni3FMGyWyScX4utxn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105ab86e-3117-48a7-934d-08dde169d161
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:51:15.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2wbAyh/lSds0OHbxUc+MSWN7lNyRMtxSvAE8rMqGuXs1pwGvDMZbYaFxCjF7p04iuos0b57fGHLdGkhUNK70w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_035122_993292_00D041CA 
X-CRM114-Status: GOOD (  13.79  )
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

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 {
 	int ret;
 
-	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
-	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
 		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
 		return ret;
 	}
 
-	return 0;
+	/* Explicitly release reset to make sure reset bits are cleared. */
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
2.34.1


