Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D10CCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=infw5/sJ0BLaKSBh6uwlSvMKrz1OwLcPBMHdfAIFrxw=; b=Uo+kQw6+2ZI3DZVvSbPlYmO+ch
	fC+TxrBd4/7uNPXCWkWI/DRXprq2vU86U6TDCfPhUe0JvhNtzNnpnA6IRH3iedKCESyFB9ciV2+14
	i14Ad9KPjJZCAMo5MlMx5kq6vSYKhZyczOXnG/oA76MTJFM21EXJ7kr0c14MG1c3L1jijJOAli6OA
	3IYKHCwp+ApmcCX5vTS1trF/uWTXiZ91fNIIyhGN/q1mlT1AQyPMx1ZBcHSttqBeDZjuFSr6QMA9T
	33CCRx6H7Qenh3L5c47lo6P/6O9glyGj7MQ8MWZ3iM/pPiiEei62ruMWb0JQPSUXuqJ5oEYjM30WK
	9bLC8Acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCkL-0000000A7W6-0UpL;
	Mon, 12 Oct 2026 09:55:05 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCkG-0000000A7UJ-2nZ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:55:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGcT9My1ZHRNyTRsHsSGZA01lenu6FTFC8sCQaDq4y82g25k54jVs0Y7rbVTvBXK3hNXv8Ava8iOXc+isuxoEf2CJwPa1dt8v00ii+nIpw2sx8CHp7qupPp6EgoVt8B8xlYIX8fumSCILU45K94L1seZ74Bb4aKLZMaLA9K4fgyVE2jA119AUCfFFHg0DOBO/kkFSAlZ12Ke+mhLPVNes94ObfOhK9pvTtJqSuwhiCFAEgiSlLBVZoqe4MzeAFv0qH5U5kNcAKUcDdh7jH9JVYtuXphumayuvfXz0pZW/XcM39DVmklV8rt81Lj25SkzYJ8XdWDTu3DKVvl+VA08YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=infw5/sJ0BLaKSBh6uwlSvMKrz1OwLcPBMHdfAIFrxw=;
 b=bZeQN/DHQxfAEMPNxASvNc0MF0WsyT74iUsO7oq5hn7xnlaeLq+A49g8j3ME2L5a2yRFGfu3qr0MHqazE3lT1kXNEAmmBIuxPkg1gmSnAqFeFhvbOywbqr3BQFkT+v4UZ/Mdn8fiPLrV2awUuLcCZD2z/FBmO2tfWfPXr0zq0W9hswa27nJHADwBkoQLAbfLAgvVhR8kNJ8diC4kXX0cTWPaEhM7L7zOgbiEpaYrx5EBcbIIyFc9+nwfFpxJwbxV2KF9wk0OOvlKl+otjBrkDdxHipy3jYm3NMfkpF4WM0/M35L/Pnf0H/ebsrnYy1TRU5a6nevlYcXfn1Jwf6QFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=infw5/sJ0BLaKSBh6uwlSvMKrz1OwLcPBMHdfAIFrxw=;
 b=WiolY92sX4t8k6CP2rrLzyjiDnJwyIlVyG34+DYOvkAqKC5/AyPXfKeCJI2WgtYird3C2JCCz7pEWWcqkTDsNuWgMjjRw+K6kmliY91++YeYLJDe38BSRRjloIXZz6ZCxrs6r9FV+rZDSAcIijQqMYjsmWbRkURhufzZF3oUdrotsEcvTpHKfhgqGjJ8WUA5brTMzIg8m8M2bTlC+r1UfUiBRhYljTTBm5v3hG0Ra1G6Kb7HUVGDYP6lc3vCfPLwM6uMc7bjustt/jmZMIchj5NbvqD9b3eO8WVBI1mtQgLbBYmogPmhyoN/jiIltSqqFDsKaKhU2Nc/nWtNTgI+Ag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by DBAPR04MB7480.eurprd04.prod.outlook.com (2603:10a6:10:1a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 09:54:53 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0496.018; Mon, 12 Oct 2026
 09:54:52 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com,
	linusw@kernel.org
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 0/9] net: dsa: netc: add PTP support for NETC switch
Date: Mon, 12 Oct 2026 17:59:15 +0800
Message-Id: <20261012095924.1129312-1-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|DBAPR04MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 230bfe9a-7922-4d65-268f-08df2846dc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|11063799006|921020|56012099006|18002099003|6133799003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 7DrsEYbOzSrAAnnn9JZv/jxfOazoEYnlVCJxkKKlh3LAx05L4UX/s5wQKnqMdwi228DiWuYKSveyWTZDmdJpPBsEAnhE5MicJSWp/obkaW4NTZrBBeZ6jdhn03d4kIiuw1Lye3KH9UcwF735AgU8YD1tEzwRyHIJl/7gCAELVjpYsaWVaxi3j/e7gugICe8oxKv6NXxMvcwfLmnWPKrP1IQDgkH/191x804MYbq5A7ndl9raOHJAiGqG97h9t5KR7ehv6pKuVqHibyvo1TohKpzJmP8JtTq5NsJ0fI/JEmXO/oLtPEMPPlWjujZCChLQ/2zqsiPi2Xnev+lpScsbJtUlDm6tKau4GNpgrpysD79ZkzL67TVy0vQS7jCI2WROEs4BRvtkAUxB5Wn4DYd/9Qwb3lOUR+LngvintVn9vewSFnxwzmsbXg/hUl4FDHptZvXHF/2Ekk1LT+8gYWM/GrOVQpNJAofdM+OnVUQGqn/J1avurRVZpkyjpETr74tINZvmhcErEj33Fxon0u2Q09h6bO3dJec/JBNpTx9Abf5XWbOzQtS78RGI0P/UVixm8wxCBjk/1sajq9R+8llr0OR4LGSjr+QVbW0YGc/T9sn4N0DznSIvhJ9v6aTdgQ9r8ge2fuCPaKYI6ce544todkKLv8hPOQft5yd0chSSpts2ek3LOPSpU40wBWwBxYRTqLdYhkKKxSALXjRwJelYUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(11063799006)(921020)(56012099006)(18002099003)(6133799003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0YJCmquvxbs4Yb8JmvHLanIlgIRBy+2SU79pyx3J2x5p03HvwMquY/oNFmGU?=
 =?us-ascii?Q?qnvwjtUa7KWLgvMxLBm1xop/wsn5R+RLnEINPIYPgNUj+MocN+05I5EsGdeU?=
 =?us-ascii?Q?gvFetVudTy5MTlDHJIKur8xr88jo/7CAxt0JlxscQi2WZOQybgwY4QHY3kMZ?=
 =?us-ascii?Q?8S/diTL2Yuq8nY1RvYzCKYOU3E++6C0ZWdIz7WCgB/IWl83xBPeTvSSyfEAm?=
 =?us-ascii?Q?OWyxIFdQ5o2hfnP+2BAEoazB5aIXWRICgt44ho3Q6g1YJyXdz1MEdfXXVIld?=
 =?us-ascii?Q?wHvqbvlDWU21yUHoWFq9qHW604yj4E82rT9AAsib5z2Bf7HyRzNqnCjDbwHr?=
 =?us-ascii?Q?ygO+iAaD+r8/mqyCzDnGcvrd5zIYQMiK5Vt8RrN8lLYyfHDCZz75w1fwmPGj?=
 =?us-ascii?Q?cPgPFYEmZrVJb6dKjPP7i8gd+slQxaMwF2XA77ziXHaULQmBJh+CHCB3cEAU?=
 =?us-ascii?Q?C1V3W9Mpt2oW6m7vKRzhIwmZ11J+r55TSrAOCXtI4Fefk7kunAzUSRpVklds?=
 =?us-ascii?Q?Dl9Y/SrZNYXCQuJNYIEtA/tM4JBKOTV4P91BXL8gx5dMM0UeS5Z9WkGxBuFR?=
 =?us-ascii?Q?zLhOne9v1IHtgXlMPUItZaeWvkMNYHvLBF+57RKx4xrqL0BsKIg1mZiTgfep?=
 =?us-ascii?Q?anFngcPvXzauQkvL55HC8ygyYnslmI7j37DhYv3MQ8Rhwz4c8g/dwHpiUJOx?=
 =?us-ascii?Q?RBIfAjPZVKejGv+IMN6McYBy9UbTrlSOCCqL/ujUdTbAEQlo/Peoh2kvy2G+?=
 =?us-ascii?Q?RLmmWnU8MYJIQgf43vVLbVNKDsDbEhWA34KrXS81J2YZw1HpFUvJenItzjWb?=
 =?us-ascii?Q?IxNTCCf+KL+3m4fpd/rEhGY3qaRMo3BZTaGLhDnDttetK8W27vUaIznsouDR?=
 =?us-ascii?Q?zsDgfeMM+RzJXAJS5jnegncJ1DA//ZIltU5UeGXPFbN3nCwHc39DsGcjgjym?=
 =?us-ascii?Q?eai09XQqaUkKrdsPNt/Ad9hNsf/9xaEIX9apD4WUjpK9FHzUnn6WffmN/e5V?=
 =?us-ascii?Q?77JunvqA6yFTAW4XhrGGFLGKMVjzTO7mPETAKRc122qmOl+hAB5PQeHCqSkT?=
 =?us-ascii?Q?LO6JtF929cXKUiK0oK2lJZQAnFyxPjYUuuyQc57uHVEOkLMf+vK4IXIJ+k2M?=
 =?us-ascii?Q?8DLM7AMpU6N0xPRpKwleDv7nR7IgFsYbLYagVlNEo1LMUfYfh/mwoqbeyIQv?=
 =?us-ascii?Q?QRmMcRe7WugXCJiIxezuuSsu83MCIURCM/dXvVyZRmwywMciCJ28k3RhzSJL?=
 =?us-ascii?Q?hh1E/0P92x1+QGoJ2vOLKHXM1HYMl4PzSuM+a1QZOGFnobNfRM//mUcZ5P+v?=
 =?us-ascii?Q?A3UafxHd8+FBoeGx9JJ2uwtCR9YIWhTXZM142dLO+vuu4erwBQHtf3CjNgSm?=
 =?us-ascii?Q?pRhEfmXvmNXtJpnz5MiaP57Sh32KQj2IBZrbpvYaOJH43m9fJ0KgKMpDeTpZ?=
 =?us-ascii?Q?HHSJnhmotyywbXqK2onlkCb5QwgVhV1dlkZ+7M9h8qOb7eDZT4nRBKiGDVLC?=
 =?us-ascii?Q?SsytGiiZ79Ngwxri4WKAlTSDjKCbVPbXrWliHUUhfivGAuCZNx4wdAkWtt6P?=
 =?us-ascii?Q?/o2Y75hm8IUw7AsLMxRv286wU9ywO5s7EuXq9jsoQISGJ+fE6G+SgspmKLo3?=
 =?us-ascii?Q?3OIiniIRxGZ/mQZH4ywTD3JVTYh5kyaF9uoitlJHhzQPdv7W8Z2KXNpjNFy7?=
 =?us-ascii?Q?gahaPhFQhE+jQ0P3p9Ie4YdFUC//uRldPDfkctwDxnwP/ObP8w6Z1EO5A9qD?=
 =?us-ascii?Q?664DSIT45pIzfGOGWbl88gAk32OKhXsCoPBDsT3/6p0MHypY73yu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230bfe9a-7922-4d65-268f-08df2846dc18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:54:52.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /R5x7SQqY9iSqE+7uDqOFiM+KgiA901z7UtymJOUJhm7aO5qOUosLmYKmySP+zDyaW3fM9T+6oOY6EhIYBeJhZKq7fej+seqh+F7w4IuvpqsAkcoAS5yVVZ+V4bRLGOb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_025500_722107_1B4A24F9 
X-CRM114-Status: GOOD (  17.21  )
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

From: Wei Fang <wei.fang@nxp.com>

This patch set adds PTP timestamping support to the NETC switch, so that
the switch ports can be used for IEEE 1588 PTP synchronization.

The NETC switch has no time registers of its own and instead shares the
PTP time of the NETC Timer, which is a separate PCIe function driven by
its own driver. The first 3 patches prepare the Timer driver for this
role: tidy up its 64-bit register access, drop an ineffective reset, and
export netc_timer_get_current_time() so the switch driver can read the
current PTP time across the driver boundary in a race-free way.

The switch redirects PTP frames to the CPU through the ingress port
filter table (IPFT). A few patches harden and simplify the existing IPFT
and host flood handling first, then enable the ingress port filtering
lookup by default so PTP filter rules take effect without extra software
tracking.

On top of that groundwork, the switch driver gains RX timestamping and
both flavours of TX timestamping. Timestamps are carried between the
hardware and the driver through dedicated switch tags: the ingress and
transmit timestamps ride in To_Host tags, and per-frame requests ride in
To_Port tags. Two-step TX matches a queued skb clone against the
timestamp response echoed back by the hardware. One-step TX defers the
Sync frame to a per-port work, where the driver reads a fresh PTP time
and writes it into the Sync frame's timestamp field, then programs the
single-step register and transmits the frame so the hardware can add the
residence time to the correction field on the wire.

Together these changes let standard user-space PTP stacks drive hardware
timestamping on the NETC switch ports.

---
v5 changes:
1. Patch 3: clarify the commit message and kernel-doc
2. Patch 4: new patch
3. Patch 6: reword as a hardening change and add a bounded retry when
   restoring the host flood rule fails
4. Patch 8: derive the RX filter from the IPFT handles instead of
   caching it
5. Patch 8: use get_jiffies_64() instead of reading jiffies_64 directly
6. Patch 9: count all dropped PTP frames in the interface tx_dropped
   statistics
7. Patch 9: resume the one-step drain from the timeout work when the
   reclaimed ts_req_id belongs to the in-flight frame, so queued frames
   are not stranded
8. Patch 9: use a dedicated zero-length dummy_skb as the ts_req_id token
   instead of an skb_clone()
9. Patch 9: remove udp_hdr() from netc_port_program_onestep()
v4 link: https://lore.kernel.org/imx/20260918072852.501420-1-wei.fang@oss.nxp.com/
v3 link: https://lore.kernel.org/imx/20260831082335.1184605-1-wei.fang@oss.nxp.com/
v2 link: https://lore.kernel.org/imx/20260808032146.2335723-1-wei.fang@oss.nxp.com/
v1 link: https://lore.kernel.org/imx/20260728104548.3301214-1-wei.fang@oss.nxp.com/
---

Wei Fang (9):
  ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register
    access
  ptp: netc: remove unnecessary pcie_flr() call in probe
  ptp: netc: export netc_timer_get_current_time() for cross-driver use
  net: dsa: netc: tie setup resources and reset to DSA setup/teardown
  net: dsa: netc: use entry ID instead of pointer to track host flood
    rule
  net: dsa: netc: check return value of ntmp_ipft_delete_entry()
  net: dsa: netc: enable ingress port filtering lookup by default
  net: dsa: netc: add PTP two-step timestamping support
  net: dsa: netc: add PTP one-step timestamping support

 drivers/net/dsa/netc/Kconfig          |   2 +
 drivers/net/dsa/netc/Makefile         |   3 +-
 drivers/net/dsa/netc/netc_main.c      | 355 +++++++---
 drivers/net/dsa/netc/netc_platform.c  |   1 +
 drivers/net/dsa/netc/netc_ptp.c       | 897 ++++++++++++++++++++++++++
 drivers/net/dsa/netc/netc_switch.h    |  67 +-
 drivers/net/dsa/netc/netc_switch_hw.h |   5 +
 drivers/ptp/ptp_netc.c                | 136 ++--
 include/linux/dsa/tag_netc.h          |  38 ++
 include/linux/fsl/netc_global.h       |  10 +
 net/dsa/tag_netc.c                    | 228 ++++++-
 11 files changed, 1580 insertions(+), 162 deletions(-)
 create mode 100644 drivers/net/dsa/netc/netc_ptp.c

-- 
2.34.1


