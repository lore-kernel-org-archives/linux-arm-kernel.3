Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345EFC369D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7A6MW1L4uPVhtruRLmGwevU6AMs9Kt79fMk+4GNHCZk=; b=pR0BG7igJTp+oJE2KxfPPLMNc5
	bnH1SvWcGgJMBlR11D1Lk0mNS0iV1DPVTAHrdbsia/1x9W5oBuGXRgMRVmrRN3FDBNr/Cdl+f5+B2
	fBOjHYm3QCjil0AgXY7BPgSevC9lP3FNpuR7z/S8bR94aSShJ4hntvKZnUK8O6KinD0I+iPO2wE0z
	NOWGn0cOhNhXYWuPW1loqLqCR6Ll9/SuTnSkzcC6JepkCNxhxozgX6MnpVel5wB4gTeAMHs8DU5/v
	AsWG/41gNrgPoEzDvHWgDBuycyk2F80Tht+uyRuHglQa+hxmH+r7y0BFfWGpqVzkS+yvL2oqqE98c
	3Ta3z4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kIb-00000003g21-2Qul;
	Mon, 21 Apr 2025 06:06:33 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kGj-00000003fbY-2MC2;
	Mon, 21 Apr 2025 06:04:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7U6CPS70IyS4wu81BL2l2ILzAwXWCQLynlNBQxlpC6XHG+Sj22lHJy7xnTBKB/rK8M0Fvc8AN55WemeD+OmNTlpgoCc8iux7v30sWnGBP0VEFy6lxiGHzP6iVjEWTwY5NAJIX9hgpsBVJV4P53QNhXEgiYQAN8gWvyoCqKgHVKghXZ/5XzkKiYlQc+hOKHIW6sTEr8d0VRYACl7+bUanUr77FkQYBoZLjueCVoVjf/ratN/mXHt2vMBYv8QDS8qsAgTHX40qLsvpE7u1k6PAHaJNi1+2HZcz0FJIYV24/+IMVpz+Ng1HS9azO7DQKY7yCCeIROzdpGKXTsFiucYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A6MW1L4uPVhtruRLmGwevU6AMs9Kt79fMk+4GNHCZk=;
 b=qk+TLjfo26eEi9X6zm7HTaJaVyq6BO648iTqkkuT+rk1weIg1zAp39iVnalOBPTGZYeQVNqNSiJALKbMEOPfsZy4tK0o4dvVGwphByPyGMRxFXLOJ843H/HzMUAmiCuF17D9Wx2d1tn9mEVooz3sXZT4vU3LRcRay6xhQqzsuyE9jeori44Lle/sfOM2D3I4PNbSerjTl8y9IRA+HMMRzwN0EToTBShltj4FfdVRe7DJbpJouGXtG559yNX0H7hrnI7Wy5E9ewovsHFzz5bArsUFKAkVDw+66txiUa0AzkEyGJl8l/RDk7rV3iHOv432IE5Vc6lzYDq30bo3vEd5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A6MW1L4uPVhtruRLmGwevU6AMs9Kt79fMk+4GNHCZk=;
 b=B3h7ao14dIbYmPiYhxOLHye2lV7H8qld1rrLUnJ47i0mNAXN+9nRHywxdhbfWWbPVTYDQNd5fLgOrubbhs6x72xp44QVUFacSszX38ikqYxMXm0RwESJ3zmOfi5j8KGR3HwY2mHundZ5G0tL70ILqs12FSsYyxaKrnQYEw/jelTefqJlMHD0ffOfBwVU0JPYBz6Bw8BfYjaF2mpEb7iaLQ2B0NMBwnYdVDJ0RTvQyy8tfZmmjHeOkKcbqbTRgOUUsjSQ08gBiqvnQalK1WM+Cj1qUWws+rIxLMQtxceLe5qfxvZeGGe1IsujyGqf7/BlH+Mp5Yxrkt4bw60c0LPTNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7646.eurprd04.prod.outlook.com
 (2603:10a6:102:f3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:04:27 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 06:04:27 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] support different numbers of clocks for svc i3c controller
Date: Mon, 21 Apr 2025 14:15:41 +0800
Message-Id: <20250421061544.2471379-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To VI2PR04MB11147.eurprd04.prod.outlook.com (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: cbde8348-5af7-4ba5-d32a-08dd809a5f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VTa3/D9ZeqP2C/Ata7vJUR3NV8st4nuUcn5sJ8f9TPUDFkIfOO4DHO8wiDQ7?=
 =?us-ascii?Q?oHqB24HXADnoV5vobBG23GLh1TYO3cy6C/9thq9pW1pZjJN57TPbPQCRmBzN?=
 =?us-ascii?Q?+Ozl212pLCNxohinAsxGmFqdRcCr00BpxBbbjGQ+4mTZgsAJUqKvZP65P7Kl?=
 =?us-ascii?Q?9DLhdaFbrmIOxgiiEQ+7j93wfvRQV97QSZjZ3kc1Ahf8XCKhmMii1VZLOpiS?=
 =?us-ascii?Q?gZodfX5k6tmnNh/uqW51yHRmjOsyI3VAyDar3WYYx0oBnRMOcgTwc7Mi4mQk?=
 =?us-ascii?Q?tEuZvIBPT22exKJasWUg5Jxn0MwfnRZbn/woM8qPj00+r8746n9v4gvF8Cgd?=
 =?us-ascii?Q?fUQAnlqMHoo4F9JmXt4DGCl8IW3pD30YMHMZ/6ZOn/GQfCZBbMNfjcx7/8Dg?=
 =?us-ascii?Q?GJRd5VMpKOVustgeCaRuZnjMIvodXLL+ZzLzKrEevL6f6hq+A9NuA2Y4Itkv?=
 =?us-ascii?Q?wZyIo/dSGp7B60OZkwlYu+DzRsc7nk20h45brjAoFEMBRj7DsnknHHDsaTF6?=
 =?us-ascii?Q?8lwapjAo/X4jgCm6YWXQTjc8HTy/jBqRYxxQ1W/JeNA6/czs574YE+46RV5v?=
 =?us-ascii?Q?ANedVBJK4ReVsE2PI/i/kHgnuu2EByQ3Qbd/lKLWv2kYInr4JQpjoI+R3xYx?=
 =?us-ascii?Q?YfJORuYUHw3O4CME5cfoOsWZkY2wp4PGSeEcA+q6k05DWNu38YJm0DSOFYVs?=
 =?us-ascii?Q?b9iMPIo1ViVTi7pT/MkYzPb/E4UqdLq2don2OG9w+TEJYQIZFeg7K0G4GP3u?=
 =?us-ascii?Q?gnmhYGvxhmgwfRRdr0EM9Vk0vTXyz1PnJoFDg3qruc7l5di82HOP+FA7MW3x?=
 =?us-ascii?Q?51nZs1Fp09Iq/NynmGpMLpQBo/9SQuuVl6ZKGn29ANb5/x8yDrhXjZSI1qQT?=
 =?us-ascii?Q?YcoSOkhJQIxEC91QQMiMVlI3bl332sgNfnBXLLJ4dUtjTxH0X6TCWb0DX4L3?=
 =?us-ascii?Q?yR1UIDkgNwBomCLOv0NK/t/E1dgN5+OU1dIB+bRZ40hiXXZvjUBHzact9PXF?=
 =?us-ascii?Q?G6QVN5OikbMr0XKbagfMM8Cpd0TjNXHaEF0JVKH/RQZVYp3zhrf7xxwIHjSx?=
 =?us-ascii?Q?34i5s4Ih6A9tRjcO6HaBytBM06TwHNOtc61PcZd444D5CxEmQMLdVL2L5A0B?=
 =?us-ascii?Q?eHvFnFg+ntfpdoLcriZ4x/IkSpr/f1kxhMwHV311t3xvNc7mQ5odtu3vUaC3?=
 =?us-ascii?Q?HScyD6ZnjdPJW8cviMLhAYuyUgzF3an6r5qweFtlZsW/GIhCAvhNHhzVDZP9?=
 =?us-ascii?Q?dDihpWW0mu7Vla1y3E2/tfuLjr6EJAKlfGLV+hQJjR4T0riFVBEKj5x45TJe?=
 =?us-ascii?Q?tVMbQBaWhZZK2SYjLx9AF/ncmBNXswo0XpDlMvCRiFXEUsGkwMCPMD/CqRN7?=
 =?us-ascii?Q?qLq1pjij0z2kwSFHG4aT3r01rH1lIkPc8BhhVWBkV7j3LzW//JV8g89UtDHK?=
 =?us-ascii?Q?PCpDrb9YIhqE6jOSHO8KTwML/YGfDEar6Ho2NgmDXsjNYio+ncCvghWD3lZL?=
 =?us-ascii?Q?DxEYIG83fAjfqk4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eV6WBNdqL19B942rDZCKHUTCrhl8Iy9sS48RwTcQwqR8kN0B10K9ecaJeETq?=
 =?us-ascii?Q?8mg4KERIlSSdAPGEanz3IcYMqmFeiZA9LqMn34HhHRUCsYeUJ0sKa1badGaz?=
 =?us-ascii?Q?Q5fjDj9VdqgJNkfCO2s1BICsuMRbASqv+w5uuXBB5xNJ90AXeWqfbKSqIgwo?=
 =?us-ascii?Q?WjnUlVlw4WVx2K8HItRAm1SRoG4WhaNt34eAXwAiMCHJ4znmqgdxP+QUQgDd?=
 =?us-ascii?Q?ro98HWEVZYbPvkq+vmf2lm2DkqYU87LG3LxQ8oXQN1wsq7EJb4nvuGljm+XE?=
 =?us-ascii?Q?BmS/OYOZUiKa+bm3+Q1pePdgjDU3w2qiEy1ubeU3pzwkN9OglpFZhY5l2/f/?=
 =?us-ascii?Q?aF4QcEGv/M3rrFOUDnbCJaqmnnsOGJZl1wlL9MFJJOGAHqN6lYV/Gosz3S9q?=
 =?us-ascii?Q?/RzSRR2ZrCjuewz/5uPCfKiXO2ZRtkJPCrCv/clCgoKKNwKhLLOUwzrSiS4E?=
 =?us-ascii?Q?bi6gG8UMX4Gcgex8pxkke8oESEV64sE2N+MSF7OJRxPjJWDiuDGpfpbVmeC5?=
 =?us-ascii?Q?JhPaK8QM869TUmheluu5VnENt4nIGuP90hjAmbYgyqykizYyO4f8G74sB0eh?=
 =?us-ascii?Q?n/gVPvJiomjy5T1CMMeH6IF75YDQeObeE8kBY7TyF48QbMop+vWhsLVw8Xl/?=
 =?us-ascii?Q?aKRCWVWlfod1yEQL/7HbTwczbl4qXn2T8IktP1aCdoeQM4ljvx5a870zh4ev?=
 =?us-ascii?Q?GdJFRo248EZzdfjJnvjN/V6JwGJ3/8DsiXsKRoTwCcDoM7R0sP82jmm2/Azr?=
 =?us-ascii?Q?3cZOtnlw42lG1NjvtK99Jj6+m1u36WPIzYzPlTXXwUuXQnDZGBg5FWfpakXR?=
 =?us-ascii?Q?ORk8rMJ2Afr/9v6uTR9bIQ1Jf2JFSgJNB/x90I6aIsbyThH2Am6muKCSvbWv?=
 =?us-ascii?Q?5OM6M7UcxDNd4j7U4hx55jPgcu8amzcxqVc1bkTQKWQLQZDyIj7n4WNh5VAb?=
 =?us-ascii?Q?dhqJaijBQ1WSIvK7P02KglOmjItPpuYjgn9pHVhNenEUDXuR0ZRuFZo7mGfy?=
 =?us-ascii?Q?6/g3Bx3VmIymJT7UkHvVPH4n8x7IA6bQYLu7YIRtxWzbD1OsXwJxuP3Lh5W8?=
 =?us-ascii?Q?KQ1ONbs7TAnna2DXLFsp9i7wSYgNTI5b5a1lIcE7+BYh2XXzFZ1+JHgnxwYd?=
 =?us-ascii?Q?x60WwYwhPpkh8/odujVWY7tejQTi7SqqDZgmGLSxeVl7eFZwuLwdm8vOPP01?=
 =?us-ascii?Q?fiE/sz6suMpNLzIfK4DIFy7D2/K6PeDOsxRwHAO+aAcSWH187c/ovzhEZttR?=
 =?us-ascii?Q?GWqKid/B8+CQkDeR6vveU1FjFZoNfTsZKaKg++zRR/bmci2Jsd8fs5rwdCFe?=
 =?us-ascii?Q?ivPoH08fWaVu+9+kUaJ9FMU/7/JB3A7x06cpYWHlxguEM5zf+si/LkUVzNNL?=
 =?us-ascii?Q?4U76NuOzT65ZP2oaVevfdUqiPb5chxnQBhXZbs7nPTsnMY+qAmmb8oOfaF7R?=
 =?us-ascii?Q?uSjV0ipRVS+LXUvT8w5j6KxJVrtL6lPt6+OMFBMMdlflYYbZ8BEIPL5MOPUX?=
 =?us-ascii?Q?ZVYTBT6EEK4q0P++/5dc0p31vVyXCRYpoG4kneVx6yzTIU1IpoK4hfRMtPQR?=
 =?us-ascii?Q?RE54vqEuYRZQKcn27sjV2cFL3aJkcHlEP3Dut6MP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbde8348-5af7-4ba5-d32a-08dd809a5f22
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:04:27.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VG8/FKOA5fHpiEfDDbRxf/tqNOcDHgkY00nJxbqBH/p9FKCl3BgGB/qArs/aG2n6uOv+gV9SWk0Jo0/TqgVIRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_230437_623886_729A6338 
X-CRM114-Status: UNSURE (   7.92  )
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

From: Carlos Song <carlos.song@nxp.com>

I.MX94 and I.MX95 I3C only need two clocks and Legacy I3C needs three clocks.
So add restrictions for clock and clock-names properties for different Socs.
In driver, use the clk_bulk API to handle clocks to support different numbers
of clocks more easily. Make the code cleaner and more flexible.

Carlos Song (3):
  dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
  i3c: master: svc: switch to bulk clk API for flexible clock support
  arm64: dts: imx95: correct i3c node in imx95

 .../bindings/i3c/silvaco,i3c-master.yaml      | 45 +++++++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 12 ++-
 drivers/i3c/master/svc-i3c-master.c           | 74 +++++++------------
 3 files changed, 69 insertions(+), 62 deletions(-)

-- 
2.34.1


