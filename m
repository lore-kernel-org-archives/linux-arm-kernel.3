Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D67CE68141
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1BAPTlNatUoHlaOrVSIaSs94OahqbT2+tOPMe3ZTF0=; b=FrCa2/N22O1mymHB+ZEDxDZDQN
	KeNwTxoPpAv6qv2lydippQoBUwk8nZWk/m/x92tC2jPGfOQZn+zxVJGBbRZnoM3J97wt9TNbfFP/p
	7d99suFmp3a3vsVHT75YvLjUYolIBA9BQVwX0n9tS4eTmYh4YBKz6b6OGB/w432MIS88EYv5ayABf
	wgt4eifVxEUfdEGZI+hnIjbz7JHyugYuH5hvsRc8+FwXcYyag+dk6wMFjH81/gRLVp8R8v19rx0Oa
	aE+Fr5keWDtES/Hkry8V0Hfx28sYkf3oCaI6JJy6m4LU0oI3eQn1wE/SGt2wwCZBN9mDU+sEUxlPu
	EsaT2r8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsG6M-00000007osv-3kMx;
	Tue, 17 Feb 2026 08:06:34 +0000
Received: from mail-japaneastazon11021123.outbound.protection.outlook.com ([52.101.125.123] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsG6A-00000007oYM-2iXJ;
	Tue, 17 Feb 2026 08:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUyfsCoaNlQI987xZ0tSERL6riEsvC/+/w4WRLrXNW8hPQd6c+63L6imOT41DaZ/VWzS3U6w6o+SjXeTiNczuzohMSu1hi2LSJmL4E+8o/3vxtwMxaJy1Wfzq486BdOLDDTVmgHejhUU4thddC15PGHYN+tmtvjvMz2zclk3wgYzcIN9xOCxJLiO8Dnqp08DNls+NiyIV3R+EsINBOmKTWO7heph643ArVP/pGYtkGGHuvkzqBpBslIRquPA1WrM0P1iKPW04xfgV24QVzoxvF7BUqO5gdYPteaIIKdMNrjRhcrTnTLcoEbIajVcGgxffp6msFj16hsUdU+jhgze0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1BAPTlNatUoHlaOrVSIaSs94OahqbT2+tOPMe3ZTF0=;
 b=kUYmkf7Eqy5RBC+cUE+bNKkapeqsMD4ytnVABQ/wBR4Xljl33jSbrkwSw/qLkqCACq/6dLPp2Da7hkb5Xj1q8XxtEv3tiIn6qErlpLOoO2alC7hwANufGNr+9Bc6nFx4YR0/Oc5KKuflUwfT3N8FsMoc0QI/uhduK2AE8U/4Gb4vgWTrOi8uyIAe/bnHpmiC5d6f7ii8djeWDXP1aoWc9DnPrvgRbRNmaVDc3JAOtwkbMitX//pLX+unBeiGfG40oBcRV+a1n3NOqJCrFj9+brANlzS1ybFJltvH7eYuqsPqnVSMPMcgbfR2tmDj+nDcVO0sCk9u0Vd1bTXQ0PUfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1BAPTlNatUoHlaOrVSIaSs94OahqbT2+tOPMe3ZTF0=;
 b=mUWC7PrL/x74pbSSd7UgmTsT2H3kCIhGV0iP8dxLxlvZ9HWNYcqHkOoOI5RZslilxqnoXB8TMoyWDdOsPnj9SAcQ0SrkcLugvAJ/DiykWJNBRAmq/s7JnCwGAihuIQzZOEsNPOdaDZaWzBfkJnQDDhPrfosZDIKRDZpgelYT9rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7132.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 08:06:13 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 08:06:13 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	heiko@sntech.de,
	kishon@kernel.org,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	cassel@kernel.org,
	shawn.lin@rock-chips.com,
	Frank.Li@nxp.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	ntb@lists.linux.dev
Subject: [PATCH v8 7/9] PCI: endpoint: pci-epf-vntb: Reuse pre-exposed doorbells and IRQ flags
Date: Tue, 17 Feb 2026 17:05:59 +0900
Message-ID: <20260217080601.3808847-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217080601.3808847-1-den@valinux.co.jp>
References: <20260217080601.3808847-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: f3255220-74dc-4813-8861-08de6dfb6b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YWccVYsWiWr1aVcAM3+2oBhJOdaDRNBEerDFrgzZY8G/MPsZ23G9NU34g5Nu?=
 =?us-ascii?Q?6/7AExACjoL2HzOSVYGuy6GK0RddBOPggbTnD+1luXoGr75RqmoSuHwN9X+2?=
 =?us-ascii?Q?6iP7vFKL95F3agkzdSd6eHhx7EqZiWjDZQ6AT+9hPk0FUdY9MiVc4m+rAL1z?=
 =?us-ascii?Q?knq6tvgTEMEQDmfbE6oVtYJFlVf/NXMPU3cBqaXNSeKi7Xr/vTSRDSQkRqdi?=
 =?us-ascii?Q?8sK7o73CYDko9hTPPhi9cy0Y4n+x3inZJO7kxgm0p7F35T5xgJE3wkmGNnYY?=
 =?us-ascii?Q?36G8epwPnYCCRLQn7mPyOWSZcW22shqoO+izRWZkt3tDUNRfTp6d6PizWqZo?=
 =?us-ascii?Q?QsPCC53wJBOEok+9+QQK+6WB/VoMioZqJl2lw8tU29N9aW1Qi8ZS1yoEEfit?=
 =?us-ascii?Q?WsXRT4CSyAgm2UWk/kHUVo8cH7NLY9OIHgFMcyuZZFJrj1nLLhFsEYaMptd8?=
 =?us-ascii?Q?IMi+cM/qynRGkPmtwNviCgNbdQdbGRZoealJqA5jJD1CW7u3EKSnnsmvn6DX?=
 =?us-ascii?Q?9/A2I9zPdjv2wjRBbzgBKw0WpZvLExv1jHS+GlWzUvT+55tgI0VJnhwhugS+?=
 =?us-ascii?Q?/lfotT7rQQjK4eQJpJ7t+Nj56LGdPCEPgi2jm3gJ4Jsp70k2ON8TEAk9xzxI?=
 =?us-ascii?Q?Z1hPd3hoTJP+/DqSzzbC4zJ43KlCkUonWxK6TvpYasXRAC8LG4BiLm5hUM8s?=
 =?us-ascii?Q?uUW5PosV0apgYlrBz2SpaFOVL2Zh380CZb8wfEvG8wKf0yyHUKfbR60J44Wz?=
 =?us-ascii?Q?rd0qdyLCVm4kuoav/F6OnPPjXXX4Lp8UyCUHexAF5gPWbxhCAjJoYNg4COLx?=
 =?us-ascii?Q?CkmIq5v5uXyV0kts3722hcE9xslw371LtvExd8vTncXtSJ8u4KdqoeP6pcZZ?=
 =?us-ascii?Q?VPB1mdo25cDak979tsgxvbBr9KzS2mEj7GWEYBK3tvGKzG93beHESYgA2aSF?=
 =?us-ascii?Q?18Cj6eaDgfd2xLxuGf6+D7A7gwJi+Ygw3UXzklktge4G6bfymd9SXthtQrXV?=
 =?us-ascii?Q?q2xHzA0CpXFd5EOmhwz+RFJHMxxEdu5vMG7+yXlYcKlLbDqhCEigGkqQApvj?=
 =?us-ascii?Q?HHKYgFsQKSxNvCjttJBXcZEzeoU90h8HPyWbTiy2ct+OQzZlC9XyxkDZD5Vl?=
 =?us-ascii?Q?e/Cff//VusMNBbg+wWa5q9I4nCg/vNG5PkM3QkzUaj6LwMFDpH2a3KkMesF3?=
 =?us-ascii?Q?ZSqfU3Brvgf6RqjzR1DAVxC8niNOvbXWzzHXm+hf8MCP/S/Tuxf7cUPdmH4X?=
 =?us-ascii?Q?KstC3p1GrjQBJb86e8NpqcH18BWPbShCnICy2vRYbAdLBaaEb+9lOwN28QOM?=
 =?us-ascii?Q?Y9HRIqh8lGDYFU/PKeJTyJOdtwzfk9/6mMHWi8vfhv249cAjL/Ny9HZzLkDu?=
 =?us-ascii?Q?kBKnVc0StU+3bj3M4kbpFqYKBjKfDngkXfgBvnhAomW93hq3pWgLgN0smlOe?=
 =?us-ascii?Q?6b+YSPYYDBRdfQoC8H6PLynLlNs9zEnIWEfhHIflAc/6ij8J1ESlFlPHokHg?=
 =?us-ascii?Q?U3RT0BgL48tOQZ2vbFX7QaGclMj5AynkQoH0XbXna3dqd1eFi31fqV36EllW?=
 =?us-ascii?Q?EZEcdKmpiL2NuZLLML+R3BNeed+LpjR8d2yQG2qKZ0UHaY21GgKnV4xDBFBH?=
 =?us-ascii?Q?/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UkLpg8/9FLnSgvyTFsPFwea71O7peIPmH4YaEElMvcilLN8SghrciNiTVWst?=
 =?us-ascii?Q?kkISZkYelZ2tig08gTEb3gTr6/fEa47ZmW7RXeUlF10b5cxnCInYAw1LRMM5?=
 =?us-ascii?Q?mH35WuLF13S47qldg2Fx0bYZKNttzhE6GtlmsK78NT8K+2pu18epdyEidyB5?=
 =?us-ascii?Q?8HdYacNEWR30arxgWcaCzStKb+cf15c5Da3MW7pxcXSvR/MSDfQwTVfE0DEX?=
 =?us-ascii?Q?R1pIhGZX9oWdtIouYSIkAnYov+xzxHLYFpgK6G510nRVtT/5z28VHeyZq5Xs?=
 =?us-ascii?Q?WqqYjEtBjTSsB6bs5vV5GMsud0Hdr8IWMog1Hoc7m012EoJgsJY3x05+l/Ps?=
 =?us-ascii?Q?b5NbmQl6H4rWdFyXuBZDrnNMQF6j6U4NB4tDsoGU/uUgnhYseoMJzf/22FWL?=
 =?us-ascii?Q?+iAoFmolbdySqeSVXY3hYvVca/WcCOmMq4IbwljEkMaIPld09j7aoVgf42ox?=
 =?us-ascii?Q?+8N6xPgT7tH9BpibaUOWbmic1Q6xo+f7ZfzgWQtyqDkbKE5w/v/PlCQB4klQ?=
 =?us-ascii?Q?j32KqgWuDECed6iK6wqznLRNc+hut8Z7IXWakfQ/zd1Hh1rzOjnEmAfeh1dq?=
 =?us-ascii?Q?kAzIHNfjJmfW0VA7F1VeGB9HoGKhMmwSiV0eIijiPQhY3EXypFyC8KuFHDG1?=
 =?us-ascii?Q?go0znjc+ux0xQEaVG+RjnhF65SGfWukntPoUMdjW4Cbp8s9bTOlQQ6DuSmAX?=
 =?us-ascii?Q?BXmQOXb9H4Y8gb6VmZf3Htjzx7jopbQwWC+bfN5CBGHH4qXtu+WOEoDn6l1b?=
 =?us-ascii?Q?jTdSSZ2Eg8Iz0SdTAD/TxnpGKL2FtTgW99QXJqhIxXDLOPBzKEro8bWlsYpo?=
 =?us-ascii?Q?AzNZ7gG4FgUrvheupol8Yse1Io5RxfK8VKvMHYbgCoU5Zph6iEtCxjzzFk+L?=
 =?us-ascii?Q?fN2Pl2kc4ObZ9nYd9C8jhd6ghRUGuD0/nA7SwJYrDY4QdIvoxzl/NPRNEMNu?=
 =?us-ascii?Q?vJm7mB7LAJZxlTJvtAfJWyf1ce7VeZQNKYrvULOCsQQCWsyy9SC8gauMafN8?=
 =?us-ascii?Q?A3Ok/L5kKEZn3lZ6sBv9FERgiejgYo0yjc/dWI0RKcsNstwntQpMs031C8of?=
 =?us-ascii?Q?Fibq/zqLLTCxRKWlhQ8g0Igtfutav8irV5OGT4GCWFz0CGEfB6SXb4SG2GXi?=
 =?us-ascii?Q?PdOxCcmqVzC4KzJiFB/iY2VBRb5awjm5RzfNNhMl7bSmoYh8TZLS7Mak6Ij6?=
 =?us-ascii?Q?roc7SLQV68alLfARQMC/sEAeuwjrhC9twwNRQQRfLthpMJxBELnfpCGt9jKL?=
 =?us-ascii?Q?rSs9Oz2Ziem9WvSYH/fSYxMqOZU0JgDI7jE0soFpKgaF7b8p7QTRQj+qWo3R?=
 =?us-ascii?Q?5hcsPf8Th/kwFO41BluW0dAMCc7ZdSdVnipXDwBEukyY2bxh1LYUKlAeGwqv?=
 =?us-ascii?Q?u0VZ7hvN2aEt2U0lNW3jA2W1FBbZEUxGhZH6wdLef9abhlnbsFIszvm1tKWj?=
 =?us-ascii?Q?AwQ/Mg3xJIKWS9dNHH8ngywHG+GRqSpSN2pGA6vEKmHUhGqxwE5yznIYd+Zy?=
 =?us-ascii?Q?qCePvqLeDm0IDh5TLMK7xbZARPmIeKoOS4GPfb+CdnMiGYazNeAkSfkT6tnf?=
 =?us-ascii?Q?UVwXG9SLV+fBV49NnmRcnQ3s6+sjdGMjQ7tDFkjf44wV2/enNtM/ADuNDrOB?=
 =?us-ascii?Q?8pwRRPZN0eNJxw/HZ1M/+uTcyA82/ABoNOpsqlC51gO2yBa4q9Q+Fkt404aL?=
 =?us-ascii?Q?GQe3SfdnMfGcx65dHHQe1kaiwzBGPHJpvJdlz35X6ZoiIW5y7N9+pVNOkS2o?=
 =?us-ascii?Q?qvjMaXlEgsZyN8GxNQdIL3DsgFkJHlEONw6DAbhvT8Ch12nXuUph?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f3255220-74dc-4813-8861-08de6dfb6b19
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 08:06:13.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFgHwB6nHWceRY+rvxn4SSnLFyHSvUO1Le2Zy7LPO4K08+NFF5nqnxLTe8vjK7nm5ZpXts7qioja/5lTC3eHpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_000622_732149_564FCD32 
X-CRM114-Status: GOOD (  16.04  )
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

Support doorbell backends where the doorbell target is already exposed
via a platform-owned fixed BAR mapping and/or where the doorbell IRQ
must be requested with specific flags.

When pci_epf_alloc_doorbell() provides db_msg[].bar/offset, reuse the
pre-exposed BAR window and skip programming a new inbound mapping. Also
honor db_msg[].irq_flags when requesting the doorbell IRQ.

Multiple doorbells may share the same Linux IRQ. Avoid duplicate
request_irq() calls by requesting each unique virq once.

This makes pci-epf-vntb work with platform-defined or embedded doorbell
backends without exposing backend-specific details to the consumer
layer.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes since v7:
  - Deduplicate request_irq()/free_irq() calls based on virq (shared
    IRQ) rather than doorbell type.

 drivers/pci/endpoint/functions/pci-epf-vntb.c | 61 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 52cf442ca1d9..b1e8414c4e43 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -134,6 +134,11 @@ struct epf_ntb {
 	u16 vntb_vid;
 
 	bool linkup;
+
+	/*
+	 * True when doorbells are interrupt-driven (MSI or embedded), false
+	 * when polled.
+	 */
 	bool msi_doorbell;
 	u32 spad_size;
 
@@ -517,6 +522,17 @@ static int epf_ntb_configure_interrupt(struct epf_ntb *ntb)
 	return 0;
 }
 
+static bool epf_ntb_db_irq_is_first(const struct pci_epf *epf, unsigned int idx)
+{
+	unsigned int i;
+
+	for (i = 0; i < idx; i++)
+		if (epf->db_msg[i].virq == epf->db_msg[idx].virq)
+			return false;
+
+	return true;
+}
+
 static int epf_ntb_db_bar_init_msi_doorbell(struct epf_ntb *ntb,
 					    struct pci_epf_bar *db_bar,
 					    const struct pci_epc_features *epc_features,
@@ -533,9 +549,24 @@ static int epf_ntb_db_bar_init_msi_doorbell(struct epf_ntb *ntb,
 	if (ret)
 		return ret;
 
+	/*
+	 * The doorbell target may already be exposed by a platform-owned fixed
+	 * BAR. In that case, we must reuse it and the requested db_bar must
+	 * match.
+	 */
+	if (epf->db_msg[0].bar != NO_BAR && epf->db_msg[0].bar != barno) {
+		ret = -EINVAL;
+		goto err_free_doorbell;
+	}
+
 	for (req = 0; req < ntb->db_count; req++) {
+		/* Avoid requesting duplicate handlers */
+		if (!epf_ntb_db_irq_is_first(epf, req))
+			continue;
+
 		ret = request_irq(epf->db_msg[req].virq, epf_ntb_doorbell_handler,
-				  0, "pci_epf_vntb_db", ntb);
+				  epf->db_msg[req].irq_flags, "pci_epf_vntb_db",
+				  ntb);
 
 		if (ret) {
 			dev_err(&epf->dev,
@@ -545,6 +576,22 @@ static int epf_ntb_db_bar_init_msi_doorbell(struct epf_ntb *ntb,
 		}
 	}
 
+	if (epf->db_msg[0].bar != NO_BAR) {
+		for (i = 0; i < ntb->db_count; i++) {
+			msg = &epf->db_msg[i].msg;
+
+			if (epf->db_msg[i].bar != barno) {
+				ret = -EINVAL;
+				goto err_free_irq;
+			}
+
+			ntb->reg->db_data[i] = msg->data;
+			ntb->reg->db_offset[i] = epf->db_msg[i].offset;
+		}
+		goto out;
+	}
+
+	/* Program inbound mapping for the doorbell */
 	msg = &epf->db_msg[0].msg;
 
 	high = 0;
@@ -591,6 +638,7 @@ static int epf_ntb_db_bar_init_msi_doorbell(struct epf_ntb *ntb,
 		ntb->reg->db_offset[i] = offset;
 	}
 
+out:
 	ntb->reg->db_entry_size = 0;
 
 	ntb->msi_doorbell = true;
@@ -598,9 +646,13 @@ static int epf_ntb_db_bar_init_msi_doorbell(struct epf_ntb *ntb,
 	return 0;
 
 err_free_irq:
-	for (req--; req >= 0; req--)
+	for (req--; req >= 0; req--) {
+		if (!epf_ntb_db_irq_is_first(epf, req))
+			continue;
 		free_irq(epf->db_msg[req].virq, ntb);
+	}
 
+err_free_doorbell:
 	pci_epf_free_doorbell(ntb->epf);
 	return ret;
 }
@@ -666,8 +718,11 @@ static void epf_ntb_db_bar_clear(struct epf_ntb *ntb)
 	if (ntb->msi_doorbell) {
 		int i;
 
-		for (i = 0; i < ntb->db_count; i++)
+		for (i = 0; i < ntb->db_count; i++) {
+			if (!epf_ntb_db_irq_is_first(ntb->epf, i))
+				continue;
 			free_irq(ntb->epf->db_msg[i].virq, ntb);
+		}
 	}
 
 	if (ntb->epf->db_msg)
-- 
2.51.0


