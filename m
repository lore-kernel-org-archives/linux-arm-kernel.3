Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E33C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BRAz2fEnHmIr0vEcTL8+22GA+jsHdYNkKFmuQ6Nw3jg=; b=Dd99bznyA9Q9lU/ukocAwoeIAs
	zNQZberTaNaVTEsDX8/ICYurlIlcMT4iG+4Kw4ioE4LdGk2HHaM0AnDigMV4bstX0HjGrZwcq7Pdv
	SnhSijU2e4JNbg476M7y4uOUIOnOvvtn/UI+tfHwCc354izUK0BcKvYrmS0GUlCsHkksPFvOjXTXE
	yzucs+2BUOqN4SWzIVHdOpHXistKk1FD8SEMQszEqveWCcgju3QNyGiQzfl2HeMS7co7pJ3D2XW7J
	PJt7aiKocTdtW4nO3KyP03/RJvlA075tMmqWevNPdYnzh1HQfJ6v91ks5buDbEAYTjGFry3EB0Sya
	uvjzvCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mz8-0000000BjP2-2gE7;
	Tue, 01 Sep 2026 11:49:02 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mz6-0000000BjMv-20Ul
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDA2U1Q32n2Sd/EDbOr0C34xIYtCBJ6XMK/AF9c/BqEC+MgaE22rXSQFO7tt6BugADIty3jW6DHt7PjxW6fUMrAoaiJVna8ZCcvcJ4JvUCMWErzP9G9Ooba0OXinoqbrS6VIs/pMEuQ4aTEHF73S+fm55mvzNIyUnY7qeHCc2o9XUPzQ9dgvueHDr2foSRpV9+7k7Sn33h3b+yqt52+gHV+xjw86aI23uCfxORnha6E5l3xLqTMw8fnX3fGU5gxpHu4W48OL0lppnwER1Nfble0DzUs6Tn6pCbBgwEsrWvsyQ5bdl/SFPuHOqlEHub1+nJQa6IAXcos3/xhJfeum+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRAz2fEnHmIr0vEcTL8+22GA+jsHdYNkKFmuQ6Nw3jg=;
 b=Ah1xtgNQ/UeNFZ1VvHTABd+oHBDRyscHckS5HKRn0MHOSyNslF6xck5eN2+F8W5H+ORW2Zz855cS8oliIfos2lJgUPMUEWY6I8XjmDo2wRAkpbSRoHnFBBFv4Na1yz8YFq9nYPRMkuVscGNTrDMqB08ohZ6l0M8c6FtZovjsVPikMAcNoT1B4UR8wV4SWCt7c78KxUTnNn5ZImJqIlOwQa1qwk8d9YM1sDmJYYjzugjYtcOmq6fTTI/iqP2P5bEXyDYWYqZ1lM1u53soMwQetOz6VSKiwDVl4+UfTv904D5mR2MuByQIk1kFvb0vtFlZsnGC6twVg1t00rqWnw7Gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRAz2fEnHmIr0vEcTL8+22GA+jsHdYNkKFmuQ6Nw3jg=;
 b=m/uBTTCW1hCcbuRx3VNNYM4dcnBsp8i9lquFjTnsEb8tLip7n5EVgZQYzu88YGh2cB8g+prG2/xfxUgnj0io/rUf9Wzeo+m8LPbdJfkmW4e1SCKk6flHXdCO1s6dK/bEdezXiGXZVk+1SS+n1zmR7/kpYZYt75zjYQ/PDdwKnGSq5d5dYBlguVnuYOcvSJF+DvmFlY/xLEdFHdR5O7igdDhzVNW9ljmV+qogQMtIoXhrqHYGiRzxHxX2rUBJ7vrlV9kgOqNz9YetA0QNjnc38BvZRMOT3wVTcORD18eH1S2+k4GKOa8pPOGFph3Ppi+2dT+yRIMm79N4/UK9NkaNfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by DU4PR04MB10717.eurprd04.prod.outlook.com (2603:10a6:10:584::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 11:48:51 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:48:51 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 0/3] can: rx-offload: make skb_irq_queue per-CPU
Date: Tue,  1 Sep 2026 13:48:45 +0200
Message-ID: <20260901114848.500591-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|DU4PR04MB10717:EE_
X-MS-Office365-Filtering-Correlation-Id: f0296eda-fb18-4676-689d-08df081efd93
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|6133799003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: gKKr72/Kx1oKD/On6gGd1uGhVTQGEzh+ue3NqF89Vj+XESRIdpfd7K9xxEw0uqqiDEABa5CNHnywRgDvsYgPyyQxzHgSDyutOOft6Csonxidajk2ufuBXrnwB8WOga2n3GSQOCfOUAUDLyfLEiLCrly3Sf3yAOe1AGG4+UyZBvlI/yskdQhKDebx8ZeuN4hwZD6BACPN0D/a2h0NKAsfjOoeqxbH537MS6wkhATek53PTj5RhcHkFyTESJseOo/anPSfoobr/RN6ksT+UeBtUtcFKL0Uv1a3zNn10RbyqTjoTGgAYatQOIpEy8d/iupzFL511tq6BVGIT5VIIeBEatwNz1EDTiiOPMFGKPrNpQLvneA8cj1a6ktDalcA5taA1dCvmFa2a8HW00Vc2cWt2jFNaE691m+D/IqIeEJ0R+uFODmGcrHEtifedAKRVRIhh22kEFandtjaZ5ZSI3NOFT5BvqskUtqvdB7uaP+NAEIWVHtyfILqryGb7HvDBfiOveQliWr5JRe2JNVC16NniQyUlNEdUdH3CWF47YOBduTUPs400LqLREaC+IvOQACHpdi+mzta6qDnTIhkDdPfU8X9BYurusGi/AqOOQ5psT+5d0QC9O9ukmVNDhHogvcNXmh5GHteP6BC1V70kVvS31HvBp1R7+/yNX1c+EMpwME=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(6133799003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWkxQndGK0tBOEpiazBtVVphWXJ3d0VPeFJpUXk0eU5rbE5WalQ0R09GNzFH?=
 =?utf-8?B?WlhrQzJZcUxRTlcwRHA5dHFmRVQ0UmpoZlN6ZzJEZnR3ZHBXTWk0cnhlSTBH?=
 =?utf-8?B?T0xhcDBuRGY2bmR3ZUdYOVNZRlliUXZTaTFPSXUzRjBTT3FWYi9TQ08yN3Nu?=
 =?utf-8?B?NGFRdVQ3a1RwVWFlRksvZHN0WHJFVWEzNHFjWVh3VVZOcXc4VFFyWGRQUUw2?=
 =?utf-8?B?a3pnWTVld1d5bUx2RFZKZFZLUW1LYVBmN2Fnb09GaUlFR0JlL1M3dktuOTVR?=
 =?utf-8?B?Y045U3I2bndXTytHVGFnSkxSMjVPYU1rQjYrdTc1Vlh3SHdqbkJ1NU9oTFJn?=
 =?utf-8?B?dmE2VUpoTFdSY2E1YzN2OC9scWNzZVFJS24vUldqOGZ6WjhTQ0s0am9DeWJJ?=
 =?utf-8?B?S1FKYmtGM2ttMlNLSG8ySmp4U3c5c3FWZXhYdDBOZlJUeEZPbzZXc21oVDl6?=
 =?utf-8?B?cDkrUTVzMG9QTC9OczdmNkpaTDNqT0tlNTlZUVFkU0FCMWlLZ0FaU21sVnBu?=
 =?utf-8?B?aFkzZkl1RDE0SkV4Z2d0SGJDVDMrLzdhem1SMFZ3T2Z0eExTRUpYRStFYkln?=
 =?utf-8?B?T0pleGpvWTd0K24ydG5tdEx1ZnJ0bXNFeXhmZlV6Um1WeFRIWmN4eUVEcUNa?=
 =?utf-8?B?empjNEdvaDJNN281aEFmS2wzNmc3N2NHaG5tMzFwM2FVLzB2ZVpIQi9yY0ow?=
 =?utf-8?B?eXhPUEk3QUpSZmJFeXltOURFNkxlQWlzbnowd0tiaVBRRWZQK0MvcElubER2?=
 =?utf-8?B?eGF3NWg4Y0IxU3FHNFlkckd6ZWtrVHV3UXc3OGlnZjcxNHAzYXRtVjdsbEo3?=
 =?utf-8?B?Vkc5bWJsTGJqS2hsZDFLNTBxbkFSNUxZSWltc0dacVVMNWE0emE4UWZWYjV5?=
 =?utf-8?B?ckY0Y3hqbjdNbU9Iei9vVnJSeXB0aVp3amRCQ3Y5eEpaQmxGME5FdWJYb2tD?=
 =?utf-8?B?YStEV2lIQ3BPelJXQktISWlIeGVaREI3ZncwcFc5ZTExb3lVNDFkUWVhQ0ZB?=
 =?utf-8?B?ck93WnQxQlQxSGFWQVhSK1p4LzVUUkZ6VndzTVVEMWdBY0dKdm82c1FQOUlt?=
 =?utf-8?B?RlpNQmRDbmdBeWJnNlRnV2NlbWZtM2pEYXU2bW1MTUhrQUJINDVzMFgwbFRV?=
 =?utf-8?B?VVduRkh1bmJpNG5GYk43aUtjVDUzR3dnWW14YWNLcGF4SjMweDFuZC9sYzJG?=
 =?utf-8?B?Nmxja1BvMFFhOTNkV1ZwOVBJcWdRQUpvc2FDbkE0eU9acVVvMnVrNjFKRkNz?=
 =?utf-8?B?TmhUVmpHRjdlcnRmWHBDSWc2eDdZMkNaOEhkbTNYV2M4V3RJelN3dGVtd1c5?=
 =?utf-8?B?MCthM3RyRjNVazhEU0NuLzdBR01TdlhsZWtlM1FTSmp0UEVmSFAvYnlLeG56?=
 =?utf-8?B?Uy9FSWlOTjhvbHFlR2hSSTNwRm1PS2hGdUk5MVJyeTNtMkxOUy9TdVNnWlVV?=
 =?utf-8?B?S29KeFM2OE1SVWtjb3NESGlZdU5lRWVOWVdDRDVNYm5zeHcxeUR4dzB4WTRE?=
 =?utf-8?B?UEV3OUhRd0hZYllzb2JlbTczS2wwYmdWS01tSlAvNEk3UXlGbWhRYzRaRDVq?=
 =?utf-8?B?Mmsxa2ZKaVdkR0pPMHA4Nno4T1RXZTNBdkJIUUhpL2c1Yk9wemNlME9kL0Er?=
 =?utf-8?B?RnRLUFc4T2dVdFBuMHlhL0cxQkZlS0EzL2NjT0RKYTZaVTNMVWYvTllEcmN0?=
 =?utf-8?B?V09EMit5cHVGbW1oMUtyQzRDaEt6V1VhWkNtUm9yb2hwa3M0aDRqd3krSjBN?=
 =?utf-8?B?SFhPbElRVytqaEhPa0IrQVAxZGpCYkQ4Zm4zZkg2MVA3MENVUEpkWm9Ea1h5?=
 =?utf-8?B?MXNHZEtROHB0bVFaNnNETlVzckk5Ym1pWXZRUkxxdmF6aVI3bzEvYW95WXhm?=
 =?utf-8?B?cTc2c3J2U2VNL1Urdm5Zei92OFFRRzVUeHR1OEJnenZrYzZNdW1OY0UvRHF4?=
 =?utf-8?B?Rkl0cG1yOGtyOC9TcTJnTy9UcjhKcDVVTC9iMzRmY2RwbEVxWVNKdlptM1ln?=
 =?utf-8?B?NGlYbEg0MU02R0hMVnhnN3hHUkZFUmZ1SzRVdXY3Yzh4MGkwT2FFVFhPQVZC?=
 =?utf-8?B?c2RoM0hwVFpGOGhpK0JGNVlCNnBiVUtGRVRHdTk4alRVWW9FTEEzektldEhT?=
 =?utf-8?B?M0h3WWNKSEdRVGl3Z0NhQ080TVNKR20xbXEvRjRtRWNzSmVOYVgzR3Yzb2w0?=
 =?utf-8?B?SVI1aWRnZ1hVajNjdGN4MkZ6RUR6M0FQYjd5TkErSERmODl1bUUvd2xQdjRu?=
 =?utf-8?B?Sk52NVR1cUxjai9seVh3aDE3bTZrdDE3WWhQWGZoT1hVUEhsRnJyM1ZwUWhT?=
 =?utf-8?B?b1Nsb1dFaVRXZGJ5dSswOVFSUGYvY2ZNM1A1ZnNjNm1KVDVkV0ZZWXJKcTht?=
 =?utf-8?Q?LMF3/4iypjFR0HLQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0296eda-fb18-4676-689d-08df081efd93
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:48:50.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45e6HuvEbgUd9p5qpkd8pCInvg+omw7Dg1D81Oce+Cto30UBs3b74FTyPUMXJrjPp+GIcwlMTd23QjyU3srCSB1BnRtiLBTcCAQkukTB+QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10717
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_044900_541014_7129A3E7 
X-CRM114-Status: GOOD (  10.47  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can_rx_offload keeps a lockless irq_queue that the IRQ handlers fill and
that is later spliced under skb_queue.lock into the NAPI-facing skb_queue.
This works as long as a single context fills the irq_queue. flexcan with
FLEXCAN_QUIRK_SECONDARY_MB_IRQ and mcf5441x use two mailbox IRQ lines. When
those are affined to different CPUs the two handlers can enqueue into the
same list at the same time and corrupt it.

This series:
  1. Makes the irq_queue per-CPU so the handlers no longer share a list.
  2. Fixes at91_can rx-offload teardown.
  3. Checks the can_rx_offload_add_manual() return value in gs_usb.

Changes since v3:

- In gs_usb driver, check the can_rx_offload_add_manual() return value,
  the same NULL-deref the per-CPU change exposes.

Changes since v2:

- at91_can: also add can_rx_offload_del() on the register_candev() error
  path and check the can_rx_offload_add_timestamp() return value.

Changes since v1:

- The enqueue helpers used this_cpu_ptr() without disabling preemption.
  All four enqueue helpers now use get_cpu_ptr()/put_cpu_ptr().
- Guard can_rx_offload_del() against skb_irq_queue == NULL.
- Fix 'at91_can' memory leak by adding missing 'can_rx_offload_del'.

Ciprian Marian Costea (3):
  can: rx-offload: make skb_irq_queue per-CPU
  can: at91_can: fix rx-offload cleanup on unbind and probe errors
  can: gs_usb: check can_rx_offload_add_manual() return value

 drivers/net/can/at91_can.c       | 10 +++-
 drivers/net/can/dev/rx-offload.c | 83 ++++++++++++++++++++++++++------
 drivers/net/can/usb/gs_usb.c     |  5 +-
 include/linux/can/rx-offload.h   |  2 +-
 4 files changed, 82 insertions(+), 18 deletions(-)

-- 
2.43.0


