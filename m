Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A3C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ch3mUlEhrZc5Yn/m5R1uPyYkZxYLTxGAckLc2kMhPI=; b=PAa8tKX3dqRGjhuNHwXONQKEtg
	XZ8B4wms9kBLYXGTG+ioc9647ZlOSuoC3xU+nWqYwQBna9Ki8VvgOuSx7Jvxo/tVj3n38fPT9F+6m
	BzzNjVzUoNEXM6ZWkwieVy29prRV5jvTqHTv+LPxg6zfGcQbJ0M0AZ0SLsUW3himE/unLTmCDA/1H
	rVeOFTH9y9ZP+lbBZ22+BjsKg4/FacSMO0G1InmgAq5UjlUZjKNB0Wforqygu0yUOon3BxEF+2ciC
	0Pl/Lva1xM5YZRu3F6PDPpKiz1in34uRIBY+/wr2HAslIjvLQN8cU/EzAYxtbqtEm/pQzGiNNnhMX
	wdrHPwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpahm-00000006P66-26aq;
	Tue, 04 Mar 2025 22:25:38 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpadB-00000006OM9-2pd9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 22:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgexTAPtA7vfearZRRJlhds5VL111VtFTlNHDTvkyIzV/02TjdrdYWudKzR4qf/jd2mzvBZDYbg9YUlL6j8hiLd7MbwN16CIqV4h9+CC89F7Iju9482gaizaJC+rcejnZMgaYvZA2dvEyMl4Eb+dvrPcyn3kAVdYtOYlJSUGVMhSyK/IFFzmN4ooJzQkpi8jwGFajyO2wqVzQgLxBrlbbpoH0U7NumBA7gomsde1tr9wq2K/89PD968Lwp5zUkOLN0anVssPOdJMqb7Jwx5LAolNpwIQnji2SwQh2vPNUpjnrHmcHf68nJL7OgGAhPiZTWSUa5eYjp5a5oLxUSWVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ch3mUlEhrZc5Yn/m5R1uPyYkZxYLTxGAckLc2kMhPI=;
 b=dQ9skztfXau9c13zvxX/mkrC0oXQsT4/DfphVq1sRU99kWe31JTB+8yoNbwLI08Cyjk7B8+Ky5bkAhWF09gfv6bl2eIDMmYJ9SHpvVCkaJ7WS7yZiT1xm+HqVmn5W2MuPNBT0ki5vXQF1h3bxcK/s/bxL+pDyZhRuPhHD1ZCEzj298+wjFqTchnv7aX68dB5Zpom5gUQmCwDozDouZQKFYm/C6wueL68uDvjpnc0vVdtP8hvS45m4CM3v/dDDCkBgwTB7RtYS0XWMHlFp0RrcTYJQkccW+iJSK6tQPCB8+dfnS41sDpsJ4y5Wj9iC8tVEajQX4EiQqvS106iHWCazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ch3mUlEhrZc5Yn/m5R1uPyYkZxYLTxGAckLc2kMhPI=;
 b=rqjhM64OvqqYf836H05YwT+3c8huiskeXUVapSRTiQQ+JGxLHMviZoYhZgqmmjcRmOs9XrqO3IfAE6t72cwYsVb+Zx8nL8Aa6Wt/iJ3IjWAI2wVNTQE2vGpnE/5Tz/GtV65Evpbr9qsByh6zbDF5ytDcttdZQ4TOxTOS0g0rA5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH7PR01MB7931.prod.exchangelabs.com (2603:10b6:510:275::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.26; Tue, 4 Mar 2025 22:20:47 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%2]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 22:20:47 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	Miko.Lenczewski@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v3 PATCH 2/6] arm64: cpufeature: add AmpereOne to BBML2 allow list
Date: Tue,  4 Mar 2025 14:19:27 -0800
Message-ID: <20250304222018.615808-3-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250304222018.615808-1-yang@os.amperecomputing.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH7PR01MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: ebec83d3-1ef0-47e2-74ab-08dd5b6ad009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YhHLX5zZ8FWz2+z+hDWDQioPgTXmeATVOM4JuHF+UB788ORau5VVnTvOAxi9?=
 =?us-ascii?Q?3Zb8Y/BLWOu537voLGzWcLMENUOYlLGj15vVfCCn/0gn4tE/O7cu6x/vWS4w?=
 =?us-ascii?Q?IqNXoSThXDmrFKsSOmmEE+HA9xJLavmK8M/gtiPEdLdpwEvVXlxsIiiSFd7U?=
 =?us-ascii?Q?rlfBytojl5pTZv3PPNkNddtFEle9NHNryXGS1q/rgTgEuFDKXzu+wAJzLs6W?=
 =?us-ascii?Q?U2XGIdKPidWKuAPUMUDEvAB58dYlZzSNaq2YHSLx9lq6X1GvUVXvgjEJl8qa?=
 =?us-ascii?Q?Fyr4SyB7Gt7XBAR4UVu4gwolbUK7okblvuOY+9JMqLbGAYWIlyGIfd8EtNt1?=
 =?us-ascii?Q?mcLJLMFAr0cqR5Ft715luUIZ4++as9dpKuL4wgj5YzQsDhwXJJID41CgY+Zc?=
 =?us-ascii?Q?Y8SFaEE/wgLimdtF78LrugyEZCvCIiB7aIDtA2LRjm2SQynWiGKKNqL4H0DB?=
 =?us-ascii?Q?7nMACsucq1uRAtDxh+XWQFpF6PEfM4y5EOLQF6Sq21olBUNrFsdNar6qNwzk?=
 =?us-ascii?Q?ffzAE6n0IHBsekLF/vAmGdBGICwi6Hw4GdF0nJQEtX/2D4LXvu2WHGzYlR5n?=
 =?us-ascii?Q?qC9qSSVgO8FNyyodCv4IkkRQ8Zgh9by0rF2/vi5OEsNumNhIHn0beZSzCMEG?=
 =?us-ascii?Q?6wv8hOhW9SExlwKD5Lc3jiKmgknzm99DS2f8i9dxRL3Jc58LABhjBMyFQtpr?=
 =?us-ascii?Q?qdhqOr5ToIffPwvRBGKq9kWhHOIwl4ZFmLs3qK4YUPROEmQvaieDmUGKR7l6?=
 =?us-ascii?Q?L5QorVFAIu+0/ByIgQg5NZaR0lpMJ6YUkGn0XF/ur5Ot/kyqw0MfjTZqL7Wg?=
 =?us-ascii?Q?/hnTaZO8Fq2BD8vBAsbYds4/P+oOX8lE6UJ0lWeIuwIQAHKkXp7f0bGBlcdu?=
 =?us-ascii?Q?P2YfGwAwHgEfkUG7t21oyZv8naq97ZEJoW1/HvBwVLxvXrSTa52BLLzfFJME?=
 =?us-ascii?Q?Oa+hQfng6PsU+epKBuUf69g78V8BeTDnxXkj1RlCYaHYpKaia9nGjWb7+HnR?=
 =?us-ascii?Q?Np61+pjot3Mk3rh38Y9Lm3SLR67l6teSF6ue+g3mYU6fRCtdEBwJtqwkd/bf?=
 =?us-ascii?Q?2DN8yrymp9AfeVZdxNTNVp02QcUSneFWBG5YxQvIvUTtNcba/bLF5neVC7Wu?=
 =?us-ascii?Q?H5dA73+OMNrLZFVeTCquGLMA6Amb20TVYm6uKA8n6bfuc/IoLB7GPlbNwbie?=
 =?us-ascii?Q?6NWw7+vQ3nn7hxND4Zmu5p9l4mtZXtUe3TSb43O+T7feys2IPbryYb+MeWO5?=
 =?us-ascii?Q?A/GRp9vic2VtVCtaghDAoDrB0Jdk8lPHaiHgXi+uVXgHbrIBIXzVSqml3xbS?=
 =?us-ascii?Q?QmZ98ldVMbr88INSln/wpULIf9RCYOUtTOOdDnO2mnmJYT1fCaKNXqWO0+CN?=
 =?us-ascii?Q?I/ij5VhOaQJQD1iScfbhJ8YKd4acigNLH5VSwcefGqEWA+DQOqVKHjm7hdDv?=
 =?us-ascii?Q?wu+9HlF0ETwKBKJK1J8Q+UUgyGYKQ112?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UuAIeapEuzDQJ4tqlkEcQS0n/qds0eiWk6wTeP0sbGbsBgVoW8HRxizr0xDn?=
 =?us-ascii?Q?fqZtKQCMJFgdtY0lE1tIk9OQ+L8E6M37B9DHng7ddXCtKtEO+qK5huVoRxhQ?=
 =?us-ascii?Q?DTMSt/tqtkr6/ecb4HV9ywbkvZIbmZ3WQt7KEt8o0ATo5OLaO8KBOyG/IW2c?=
 =?us-ascii?Q?6wi8KHnvbAhjVnf6tCKLiqCXP7+gjXEcyTM9QnslqCSGheTzBx/qX1dj+GGu?=
 =?us-ascii?Q?aCyhn0ZFBH1DjFz9tWlSC62AuM8HxsxMMXjp1N+11eN+5H+ONW6YGKwr/FG3?=
 =?us-ascii?Q?9Ikn5CtjzDcmowCpJPYDmlBharSqkiWwFXX26DOLUlR28W2AvfiPpsDvS9+8?=
 =?us-ascii?Q?EuqDiO3hAx212yt2ooRL/EDyjsNd+PHcTIsM6nigeLA3Cd+4YepDId+FJeZl?=
 =?us-ascii?Q?85PBIkgW0E0NLNOCF2IDxyISzuZiJo2eLAVoGuhyRS7XXSzwsTfcrvDM0Wc/?=
 =?us-ascii?Q?dPRkPTMEDm5ifSmhgVgfP6g7e5m5k9erG1Gkgoes95ULs+/ralavUYgTZhfA?=
 =?us-ascii?Q?M2R8XerYYwQCGT61zxgb19xigWjUS1mfhZMN91IDilm+TpClyAWFHwiQKKqs?=
 =?us-ascii?Q?adeIUgGEfIT/TvhP10sCZglC0PIAFVJjAB+W2zKYiF59HDzv4dZAYyg7X6RE?=
 =?us-ascii?Q?kx27O2I4qmWhMELYrEg57Bm/QgEtyFMZRK5T/fOE0d0quvn8FG08VPN7ALe6?=
 =?us-ascii?Q?+5L/eK0+QWg0pwRHcdv/byXyfwbngPlloyfMeqzR0jV7ksiXMfHa54EWQJhE?=
 =?us-ascii?Q?CZ7eHddeBhEnmiR3GPEZg2/FAfwJHKPXuWVD02lLmJGPacFlc/eNgnN8KxLJ?=
 =?us-ascii?Q?o885wzn6dbgx9DTRjTStqzmuSw+hTq4LucGcGTvyT1vvXH9Zz24+szxfrXnp?=
 =?us-ascii?Q?wrtvAaRqe/sHm0dPwkQ6PhI9Gc2ZSVkFmVokTu6tY6eS0lYZ5FqwlggkSLUz?=
 =?us-ascii?Q?xWi5rXZLdAw57kG9EsumdYt9FPr7na9k06gWmnE6Qp163i/4/ge8aVRqpyxl?=
 =?us-ascii?Q?Q2eNsRMz/PhrsfISGvJgY7IX3PisscnpX5fdrL6bHeDKUnLqCx4E5qkrFSAd?=
 =?us-ascii?Q?E2IoAaTMWVxoWD1pt6XeuBqSChnfEPLC2uc53IwJTZbEHzBd/EsWYLxMmuXg?=
 =?us-ascii?Q?JDyWouCnpc2plkFsOh8lLmCLxTiwOgIkyAEgdNs3ZFL1JD6TOBkGxhcbT6pi?=
 =?us-ascii?Q?w7gP23jJWxHF8bowds8GF1tthSOQM5NRBLrboC6vNKyBZnHw0X0nHQAkCz18?=
 =?us-ascii?Q?/fhA3r/sRFgAwlvi6vOOc2tdtPmZ8cUePyPO0tPnYn30aJ57LakuQQUZBtd4?=
 =?us-ascii?Q?fdYAX9HRY1gLvCeqxah8h0NpT0zl++S5IkiIyoZsbccmcZ0P0hpHZT95a2pb?=
 =?us-ascii?Q?YXeahgEXNe4aMr959+wdQt4yikHT/TirQvU9r2qsGYsNDyZzSiIXt6nrn0wJ?=
 =?us-ascii?Q?xf0cWTkLW68uMLwpT9Obg9oR3MPMmDCBcNQM7QzImiyqavaztnIXWqp5Htlg?=
 =?us-ascii?Q?9mEc0PIYghXMG1t3joCdNeaQFjAF6kklNH23OL9IMK+9ja/yiN4xuWin6JuV?=
 =?us-ascii?Q?G/75QH8WQEWWKyUCWaeViwYxDYWsBTdv+8MAIgP9hup6xUYn19KH2U4fHfYp?=
 =?us-ascii?Q?Lw9+PyAIVPz8e0SM6MQyHTc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebec83d3-1ef0-47e2-74ab-08dd5b6ad009
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 22:20:47.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir3LDNr8RtBM7auA6sVxkvrTcXE4aM2Ye66L7PgvLyj7g4L0Nf6NN2YYnyFsS53TiZZw1Zp+8qLzgIgzH48xzT75umpcn5M7cTCSZaeEVUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_142053_712520_6CE80D39 
X-CRM114-Status: UNSURE (   9.20  )
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

AmpereOne supports BBML2 without conflict abort, add to the allow list.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/cpufeature.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 7934c6dd493e..bf3df8407ca3 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2192,6 +2192,8 @@ static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
 	static const struct midr_range supports_bbml2_noabort_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
 		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
 		{}
 	};
 
-- 
2.47.1


