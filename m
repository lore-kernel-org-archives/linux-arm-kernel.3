Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3E4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiS1+BL6zFb+LAfV1/fNlK4rZlB6cl3YP+eBfRDjPoo=; b=Iza5p5qwfeQP2C2BA0v2HWAJI8
	bZhiCe5QBf2wIx7G8CFo4WmhGYLdNTPNiyOQdba3T8ob+RZY5bon3E+amjt259M/KnKwvxrv9Hrnw
	Y4cHhqtx69T03AtJoVLObDKbDESLnE0P+OQJ8urGaoiinA7DreFnw3kYlTdFHygG8Tj3QZ9El9QwV
	cgFsanrtqbQlYlJWRIWRoagWfP6vifUeQvC4gTxHM4utbk2+JNhPEcw/V9J3hCsMqQ/cbK751fvR3
	U47Rsta3XizT0vsIZB1sdVmrv2r9I7Wrz+3EMh75WBooK7cpNIU+cI+OahpHXchPerTb9ZBlLhjY0
	6cCNSgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7udl-0000000Dpru-28oF;
	Thu, 24 Apr 2025 11:21:13 +0000
Received: from mail-eastasiaazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c400::3] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tbo-0000000DdTu-24wA;
	Thu, 24 Apr 2025 10:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCJAygKtMTKjrAyU82doSArJy+vlGVxdOCN4qnUOzujtASUEhMoZPvPMx8sx4A74NIHnGH2O/zGBi0st1Vm7OdGYPTIpw0niFSHHDDDLWzA4r3yC9ZoYQsk6xbnWzVXu7hURk74gbTZFPtXFcw+0KqVQQ0O4FOzHZeXbDuyIHKs4LIC1sxmjulRAax2K/P0Osehb7dE2UQyDNKD85kVQuQ1Mn3t8/JHVSw6fg6HJRKrDZVIVVZMP1bd6fdTpRyPlRoejChlEqZqh5KL3fC9KVQinOuzSb0Cr65CqcFabZMSaAyFiSm3hqJ84U9+iEmF443TqCP1PuHv/Qm5M1q1g7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiS1+BL6zFb+LAfV1/fNlK4rZlB6cl3YP+eBfRDjPoo=;
 b=DAkH7RYg7YBg8Qhrk8diNJWRykt/Cw6KhJ6sLWgyXeMxMSw7gKhIUhLQdnWf3zQY7VpX/IbvRutBOPFidszmSBlZMtoybSac9lbO1t/kusFHKLdCVl4pqK6CmfPN5BdGnfKf1c4PZQbhAPSAKiznqZNWQUKuROv8+DYM2ctGyyYm3f9LagDrsaMKr/IYbnFh4Jtag/OEboXIspbu/7bj5X+x+pjYrusQ/tQsWE2b282jXk2feIqWYA76SZmlRxgyAZfPll67Zt5yd6N16z4YcBB4T43VbIWE3fh3QCdOzeWMm79SMkz47ywDEoqz3Ytrd7Yw4zyUuM8RwxgWPabxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com (2603:1096:400:26a::14)
 by TY2PPFC1C818470.apcprd03.prod.outlook.com (2603:1096:408::9e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Thu, 24 Apr
 2025 10:14:54 +0000
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0]) by TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:14:54 +0000
From: Jacobe Zang <jacobe.zang@wesion.com>
Date: Thu, 24 Apr 2025 18:14:41 +0800
Subject: [PATCH 2/3] arm64: dts: rockchip: Add HDMI & VOP2 to Khadas Edge2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-edge-v1-2-314aad01d9ab@wesion.com>
References: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
In-Reply-To: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 nick@khadas.com, Jacobe Zang <jacobe.zang@wesion.com>, 
 Muhammed Efe Cetin <efectn@protonmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=jacobe.zang@wesion.com; h=from:subject:message-id;
 bh=hyR4esbFEPQ5zH+gKLtMIzcDmgx+ypTM7S31vT2v4G4=;
 b=owGbwMvMwCXGEJfeJ5AmN4HxtFoSQwYXv/i9NVs5J++f8c7p38HLa2auW9XtPT16kfwUuwV5P
 B7aTaqpHaUsDGJcDLJiiixSy0SlItx507Yuj/8GM4eVCWQIAxenAExEO5nhr7h+un2BQE9998PM
 8sSYCzssFHRuhGllnct6lXMid8HP6Qz/LNxNMnbXTGed9v3QipBFNgZ79U8uEf86w/dixM6MY3N
 /swMA
X-Developer-Key: i=jacobe.zang@wesion.com; a=openpgp;
 fpr=1AA6151A58470D66B5A75FF6005E678E10661E90
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To TYZPR03MB7001.apcprd03.prod.outlook.com
 (2603:1096:400:26a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7001:EE_|TY2PPFC1C818470:EE_
X-MS-Office365-Filtering-Correlation-Id: 331e2c5c-9b4c-4fe3-30a2-08dd8318db93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clJWYkZVRW9JV2hsa2hEWE5CRmhkRjZiL2V4c3VtTVpsMUg2MDh4QzhnejZq?=
 =?utf-8?B?dE5tcHVuSURLTDhmbHBZVEV4bE5KZHAvaG8zcVJqcGJqcjZoMW0rSnFKLzEr?=
 =?utf-8?B?eXBrWWRkWmNYSlZneXVQN0JZc0JEK1JQa0xyRk5LVG5PVGVNZk5vU1JwQ0du?=
 =?utf-8?B?ZkV5bGJBckF4VmM1UUw4NFo3UmNhcHlnR1VTNGQ3Z2FDUFRzOHhUOUtobXV4?=
 =?utf-8?B?VEU3bFpXSDE5eUFmcWcwV2ZHcGtkbUh2cVdmZkI5cERSQlF5WDY5SU1uLzhJ?=
 =?utf-8?B?ZGkwZXk4ZDhqTTRISUs3cHVKa2hadEtrZ1N2OW1udE9lcFRVZVAxaXFndW9P?=
 =?utf-8?B?NGppYjFPRE1NSjZjb1JuREQ3NkhKZk9iakswSEc3T3FoYVprQ0ExVjd5cWZq?=
 =?utf-8?B?Nk1PeFBsTDZDOVlRRDRkWEFxSG9VSGlaL1dSUk5wRVE4T1FMSkNhak9oSjAz?=
 =?utf-8?B?Zzdxam9CaHBMVUlUQ2xjM3ZKeTJTZ2JPU0lFQVl2L0t4NzV2Q005d0l1YWl4?=
 =?utf-8?B?VHN6Sm1ia2pwVGhNQmRRK1czYitNYmIzN3lESnM3bXBWd0U4STUwemg4RGNW?=
 =?utf-8?B?TVc2bmRSOERjZ0pKaHFRUGVuMzZubUovemtZaE0vN3J2NXFtcmtVc3Y4akdD?=
 =?utf-8?B?YjJaTjJNaEVFeXdhQzdVMlZ0MVl1Q1pDWVhVUnRGdy9yUlIxWVM3OW56dGFn?=
 =?utf-8?B?ZGtpZDBsZlR1VlpjeHZFd0lWRE5vd2lqbjNiMUdLNVVOR2VmS1dxSm11d0FC?=
 =?utf-8?B?Njg2bmdtL082S1F4ZWE3T0hPRThpcjloMWFvUHlnRW5aR2xpY2VUeXFZbjk1?=
 =?utf-8?B?TnVjeHRjM0E4SlRLRENIcDJUdzhQVHZRZXFDNE9QMjdtakxSZlREdUljaDJw?=
 =?utf-8?B?ZHU3Q0FFM0Fyc0NnTFZFMmNZdVIxL214VXVZWElvM0xkMlQwTmV0SUE3bGhO?=
 =?utf-8?B?MjY4Ly94bXV6Q21vNWZPSUZPYjgzckw4bEp3RTRidE83cnM5ZUtQa3hVWVYw?=
 =?utf-8?B?Ung3S1ZrMEhLeW9RNENRZkpBNHhwRlIwTE1lL1JBbjJ5b1F4d0pzcXZEbXRP?=
 =?utf-8?B?bzNVYjRFcStqbENBNC9rQ2xRT1hkWC91NVFPTkFLNzVCeGxNNHd0WkdIcTV4?=
 =?utf-8?B?SzlmNVdRREp0WVhINGwvbVY0eFV2aTlJaGpEd3ROQ0xIWGk5R3NkeFRoazhU?=
 =?utf-8?B?eWllRE5EMnU5WHpoV3o3c0tQMHlTd0JWcUxLTG9MSlNrdGdVZEYwOFFwbzdP?=
 =?utf-8?B?YVQ1bStzdGFWUWkyelpxSmhJcXdiTzBkVW01Nm1vR1BVbkc2eDRzU3ErMlR1?=
 =?utf-8?B?Z0ZVenhnVTJHbnVRVE91d1E4dmk5alVMMHJTWHl5OXdoTlBYby9oUDNwN1k0?=
 =?utf-8?B?anM1WktnYUNMZEg3VlFlNVNiU0tXTFZjU21paDhyb1VYVVFmenhLZFladHhN?=
 =?utf-8?B?OVBkTGdGSzl2NnkyZE5UVlMyOVlRU3d2aGlsbWxWNitHbVh6YUttV05vVFFO?=
 =?utf-8?B?cWRFYlFpTjB6RlEyYjV6ZmJJUEQzYm9kWU5Jd3N4S1RmK0huRjBmQzUwbTJS?=
 =?utf-8?B?dWF5OWtPWTVRTlVEeTNncmJiQXZ5bkttYnViYjJKcHdpcWtURHJuNWdiOVMw?=
 =?utf-8?B?Q2JjY3B4NWVacjFUOUZ3eFFHRVVXUXVQdnc0QXNVVTVGVlpKSDVOMkFNVjY3?=
 =?utf-8?B?bTNuUTRjS1o4Q0Qyb3RIU0YxQWhPYjEyQ21DOE1yR2VoNFRLVHJOa3dMSWtR?=
 =?utf-8?B?aitJQ3BETDlGQU9uWklYMER1Z1NNZno3dDBjdlpTRzRHVzhBSUc2U3huMGhE?=
 =?utf-8?B?U0xSTzBza3lLQVJmVTlpOFIva1ZBSzNXZzB5RFZ6WWFaVThybzNCZk4yQjZx?=
 =?utf-8?B?WkcwYWNaUkJSRmlIazNidE1JTWFCU3pvYWpnT3dsNGdhL0VNQlBTZ0tROWMv?=
 =?utf-8?B?aWpqZ1FBREZNUWxuYWRRTWpFRUNQU1F4LzJrczNVcS9Sa3dVVnRKTno2MUVn?=
 =?utf-8?B?N2xmbVVveUhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7001.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2FXQVlpQkZtTi9tdDJNRUpJRkhrUXhZbmZMSjFVYjdOUitueWw3MzU2elpl?=
 =?utf-8?B?RFd2dEZJeDFEekpxT1F5cXZtUVd3cVg2ZWlQZCtxeGg4bmtzMEpNSm95UzBu?=
 =?utf-8?B?dk1hZmpiaHF5ZjBRSC9iendtTlVOOTVQSzlRVlhuVDRsdXlmMC9nYWR5ZFF0?=
 =?utf-8?B?dVh2RlRvaUZxb1FkUTAxZUI2N3lHNmFXWnM1YndFNlMvUDVQZUM0MU0rZEpE?=
 =?utf-8?B?MDhXQVNtVkxnaUNLV0tNMnJ3dk40NDBwYzBHQ2krcXlERzRwTFF2OW5IWSs3?=
 =?utf-8?B?eittbWlsMmcwTUh0NW1saFRBbWxXTDhSODhMaUsrYmpWajJVYlB4VHFyZ08w?=
 =?utf-8?B?VldJQW5yRjdGNU5vYWR2MU9HUUR5eFZUMk5IQ0pmdHBscUpxbXkxN3dnMWp2?=
 =?utf-8?B?T09UTE1yNDM5aHBRUkZvZkNZVkxjanpCbG1IQ3ZEUTNBYjBYcU55S2traUhK?=
 =?utf-8?B?Q1VtL3Z0eUVjRWQrbEdoSHM0UXExbkd1WndjeHQ0NnhrVTE0d2pEWU1NYUJr?=
 =?utf-8?B?Y1BqSWRkU1hXNGsreHpGekQ5QkJKeUM3VW5aUU5BUFd6VEVCSmdTOThqdnlY?=
 =?utf-8?B?NW4yVnhRWUR6ajBRZmhIcWx1eUJpZU5TNzlIWHV1NVlrRjU2bktwZDVOYUlP?=
 =?utf-8?B?SGhPM3VCL1VDUTR1UVJHUFJybHJmWU00ZlVWK2NIblY4dWFRZlBmV3I1SnlJ?=
 =?utf-8?B?TnM4RXNSbGtabzJTaHpRUHdrSXM2Tk5WWHdrS0pDTmE4dVJLbTZvR1RkdVpi?=
 =?utf-8?B?clpyZ25WSmd3NWNwQ0lEZUlMTjBkRExhTlA3YkxYZnBqeE5GZFl1VkdLUERz?=
 =?utf-8?B?dnlPL0UzU0IwcUhTM1Q4U2tuZFlWUlE4OW5qRzVkVEVWemFBQjZ0eTFBcktj?=
 =?utf-8?B?Q1NzbEM2SHdrYm56aUdEYjB3Z0hDc2tqMVlBNXRPam03aEJGaUNscjRSWGpv?=
 =?utf-8?B?dldDYWQxQ01RU2FEUFhoZGpWd1ZST1BjWndQckQzY3VXUUhJWFQ2T1JGaEhU?=
 =?utf-8?B?ZUZ3SnpFQktaSTcwT29hNDhhTWw1MG1DOXJncWFuVzNIcWJRV0Y1ckZaZWFk?=
 =?utf-8?B?eWRveC9GeTZwQnQ3N1UxM051N3g0TXZ1WmRtYnIxN2FjMjQ2YWpyeGlKZkta?=
 =?utf-8?B?MGtOYnloa01RNzFtdWlBaHFDM0o5anRQNWxaQ2JBLzdPWUJvbWpRdENNbElm?=
 =?utf-8?B?bUZKZnAzQ0E1WGNzS0NyVWtFV2wzb0FnN0xGT0F4UFU0R0ZWVjZSWUxjM0ky?=
 =?utf-8?B?SUh4cTNpQnNSUUhSWUtrNm50U2NNMGQ0c3FXM2NWQnhNblhLcVNpMU9neWxC?=
 =?utf-8?B?Y1ovQVh6RnlJc3ByQUhiNGJITXZQUzEzODhPNkNZdnNUYitxd3Jkc0lCVERS?=
 =?utf-8?B?Qnh1KzNITTJiVzRVWkpSR1g2WXdmUVFOQUVKbVRIQVY4TFE0QUY0bVZyTitX?=
 =?utf-8?B?R1M1cXJZQllnZ0pQenVqUDRIdkJFb3VabGVzUU40eHZyUCthakFrMmE3cW1B?=
 =?utf-8?B?YnNndkFEZmdMNmorTXZweGx0TUJNVTE2cmRFS3NsUThDMEw4U05kZzE3M2t1?=
 =?utf-8?B?U2l2L1kxL2xxbUpxb2ptWnU1c3FZRGtaNU1iTStmQVNQTUd2bmlobVdSMExw?=
 =?utf-8?B?ZmdRbmgrWDU3YTcrYUQwUEdHNmtlRVhYa3g0Qm42d0xucGE2SzlJSzYwZ1hQ?=
 =?utf-8?B?UFRTMmM2OEpPMlBnRVpvOUo0N3g3aTFiSENXY2FKVUhEMXlrMXB1UlNFeGV0?=
 =?utf-8?B?bHlUMXFMLzhoNVUrdkpucnhPL1EvaEtuemI0MFFyZG1tWWZ1bkRuUU56Wml1?=
 =?utf-8?B?T1k2bk1rLzdyUUtOQklkSEx6UDBsdUNKUExpNm5jVHNQUm0rWlIwY29VT2FG?=
 =?utf-8?B?bmtkaGQvOUNCMHIzOGJ3dmVUTHhwRmhFcVNhL1dqZmJMMEVkVG4rTlphUjBY?=
 =?utf-8?B?ZUlFTVQ4YW9CRVNnT0hNN01TQlA4Y0JwS0tTbHRFZTZqS1hBd3dvUlBKSzJF?=
 =?utf-8?B?VlovcUlhRC83czdsbmQ1USsvVHZINW1EdDZpRDJ6ZlhLMVkwK3VHRzhWdVla?=
 =?utf-8?B?OWFUeVk3dWw4VUp3RTVhZTk0MXBIdE9SNjlVdG5NY1JmeDJNdG9WdnZLcFBR?=
 =?utf-8?B?OEhEbXJSa21zdUQvMTVGbzlzVWgxaktoWFBiWVp6VnMzK3NOVVU0dFhUUDhU?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331e2c5c-9b4c-4fe3-30a2-08dd8318db93
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7001.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:14:54.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWM9NqMNx6QGfqmBm+8DunYQjXwSFVWHTFfOmntrMU3Y97HCZ3Cq44si0ZkTz+QqqkQuxZKFD15dbm1befWU0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFC1C818470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_031508_547762_452B7D41 
X-CRM114-Status: UNSURE (   9.69  )
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

Enable HDMI display output on Khadas Edge2.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
---
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index afa16aacee00..7aa93ab3bc4b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588s.dtsi"
 
 / {
@@ -42,6 +43,17 @@ ir-receiver {
 		pinctrl-0 = <&ir_receiver_pin>;
 	};
 
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "pwm-leds";
 
@@ -181,6 +193,30 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdmi0_sound {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -754,3 +790,18 @@ &usb_host1_ohci {
 &usb_host2_xhci {
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};

-- 
2.43.0


