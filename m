Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03703C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPiumYPiRXYE6k2i+1V4bztMS18VaaozxVEnJ+hn27M=; b=CHWffnRCEcI/SPsVNE6bL+Cx8y
	UeVWYwRqGceyqmkjpBzD9ERDWK0cN6fn3vFVm3oERgO/Bu2Vjp7YJpaKvsXnQ9kr8AIjIZUgnH+qf
	n9lfCStO+xBz9nLSvUmR+ngCkiaW4Dd0ZXquXH5+3VWxEaEl8zoNBrHgsDMUF/U0+qfodTjZJHaRt
	QivRrhBWv7InBuSKiB/2mTclMwKLgzYiGhpzpjvmrCjG45VAcxXP0uD3joLRwyzMMeuC7jBBUpQph
	RREuBUdM9QAwM79Kj4PpYqT0BM+FS80NmYiST2AnrsDSheHY89m2pk9grFxLp1B6/ZNHAQfav8usm
	BlhKw3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvDS-0000000DMKA-2vB0;
	Tue, 13 May 2025 19:23:02 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuao-0000000DGw1-3nUS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 18:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djEgHBcmrS6eFNe9C52WQlzf2ro1iiplGrtqN2poC0F6tVkqaC3tN2P/LjZSdUEzJiwUtAAsFT/3cLgA8PB6xXRUAeqnwTZXiQzoQsTig5u5wuh2bWSZAZ1A2kdIGR5jtMT3T6gfky+WZ1jJg9W2Fsh1c10mBduxWAlOxGKXBEq4qS8Ab9RQSSTWuCR+fV7+pGfsvgTlBVe7gvBcyf18LXvj4RxxxmXv2oZkxNqIonR2TGOtPMv9NumL07aUzv0zs/PJps67HU4Djj+vqhgW6t7Ex57KfbQV2385CqFZ+5/C/5YK4cZvwWi/6iJJAbHnBCcacb4lhF/gc1cS2KagFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPiumYPiRXYE6k2i+1V4bztMS18VaaozxVEnJ+hn27M=;
 b=jwIl+ofaC3xSgbfCNPjCOZUH8+Zi1gdz74u2Nnmg4LePA9+1DwUgFJ+IOBbIpnUXm+MjMBygvsC+m71btBrN8hpjb5RGR30rzk0qtlExnu0VwdX98v30S6H9KTHGyjJGRwE56zl/UT31StLLGA6tyqfyqdoqgYgeavMEd+Wr0Pp+wWgXznAU2JlpgDJY5efnYEj3pgnxjOV8FaINij7bvvX8pLntm/A7hcLu8LnNlveKJy3dw+dhKVx4DgR1JFSHxKyXp2z1pnvlVLNtoraPjmgAABdo697jsTYIfDAJD/Dy4b89kLe5bwETLjQ7TilVzZMq4e66fm18g9DMGJiulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPiumYPiRXYE6k2i+1V4bztMS18VaaozxVEnJ+hn27M=;
 b=Y61F/xVf9qiTZCOVl1osZAAjNZMFna6iVK+MNzYjVEt0Rtjyx+7DpEEqKYqrAajID5woQdwu93EfEy4VlQEdZ3e+tgP7yj0C0vq7iKVtROn7q1vnlrRUdsb3WFN2GOpPEQUwkY7TlNnM4XkEvS3iJzNNwljTENwJquLsUCW5Z/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from LV2PR01MB7792.prod.exchangelabs.com (2603:10b6:408:14f::10) by
 MW6PR01MB8221.prod.exchangelabs.com (2603:10b6:303:248::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Tue, 13 May 2025 18:42:46 +0000
Received: from LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9]) by LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 18:42:46 +0000
From: D Scott Phillips <scott@os.amperecomputing.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, James Clark
 <james.clark@linaro.org>, James Morse <james.morse@arm.com>, Joey Gouly
 <joey.gouly@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Marc Zyngier
 <maz@kernel.org>, Mark Brown <broonie@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, "Rob Herring  (Arm)" <robh@kernel.org>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>, Shiqi Liu
 <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>, Yicong Yang
 <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
In-Reply-To: <aB3UBSQYtTveKPlh@linux.dev>
References: <20250508210009.428998-1-scott@os.amperecomputing.com>
 <aB3UBSQYtTveKPlh@linux.dev>
Date: Tue, 13 May 2025 11:42:42 -0700
Message-ID: <86ecwsgxnh.fsf@scott-ph-mail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::7) To LV2PR01MB7792.prod.exchangelabs.com
 (2603:10b6:408:14f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR01MB7792:EE_|MW6PR01MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: ad27ea66-be27-45f7-564d-08dd924df3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?//g6+iHks4PqlabVv7WnjD8Gi9PrrdyBfeJ8+5hYOMq3T15JGqQxhXmGOb+O?=
 =?us-ascii?Q?dEzoe/YpnPtMm6SmSscXJLhALe/T4U9MMM0ZOjCylEfLnNB52cpsKYK7ASrW?=
 =?us-ascii?Q?mb7NwrQNLlishDXz1DGubfQT6SOvxjuSYE1KdX5Pk4qVkD7ZzbxrBTl6TsUf?=
 =?us-ascii?Q?RI7XiTsAqKPZ6RVm5WC56N2p4kDmlVYt7X0i6/2t6fv6zYMDV1yUox6C4QsT?=
 =?us-ascii?Q?BOgSKDaURxa1DXLrAyCJ81xXA6M5U09zUfy5YzRHxF0+L/BdI/K13i08LVLH?=
 =?us-ascii?Q?fpqIm+CeD2jWAMQnxoaOfZHZZG4tI6u+KE7VN+ZuILMY84DRo+8DYgknMofB?=
 =?us-ascii?Q?5rWYbr6xXC+RIahg1YBqBZ6Lavvs+PziU0htTWtq0rgp0LA5vVLgFC1J9aGX?=
 =?us-ascii?Q?kYwZkNhou9fq0PNzosUxeRG1j+f7FKKpv0GyXqiVSGvEvcuR/Igy+85W0hSg?=
 =?us-ascii?Q?ld2+91/1hvzEd6P58XfWfxZZp6cpjBaeKhZVE71vUSk6/1Wu5sabLCUg25O3?=
 =?us-ascii?Q?YBDNjXZpBLCxkuu3C4Cc0Mrkdg/iQqZeHyrlPlhwsYvcY5SrCtZq3KONv9f3?=
 =?us-ascii?Q?pZ8sUH0rbJccWcJQegKtdr4uYRTaUkfHSt5Z+pVTG9C84kw9/R4/njGyfqDu?=
 =?us-ascii?Q?QJvTWltkrnZliv3msibnkXnQ08j0OcO4XHToEpwDtjrKaneZN+Ncb94MaCkV?=
 =?us-ascii?Q?egcQXC66UPgSf6TMHyA2csqdObhiFmcjGoJWwKbPeemF6eoT+6+6/VEh6DYx?=
 =?us-ascii?Q?CbDm1RGSIgh1V5WYaOEFIoqd1N6UVgJAiqIJ9SPZod7LqkMGmOy5PRvx51Bf?=
 =?us-ascii?Q?C8UaLjaqjYcPgyu15ULNJcD94KfoEWkwSsRFLGav9zC/WHkZ3BrSjo5tfymO?=
 =?us-ascii?Q?6X5fN76ibFCfvbkVg/P7l5vdOLDmhkHh13BhmYIBijXhPV7RfI+sO3zBiPgM?=
 =?us-ascii?Q?Pnr045+T4AIJbIqruJnz0KF9T7ACYrudXD1Q9k6FQsOlAV8pDlNQ2KONkm05?=
 =?us-ascii?Q?aiL08uIZrPKdPVdbTswePKEYS6KPrQEHMli3rGuA8pCsEzdMPzT0Lo1diVi5?=
 =?us-ascii?Q?zRNmjhI+DKNzibEL1zg7ROdoe/YpVKN5gar3GsA46sh4Yuh4/Se2GFHEbRCI?=
 =?us-ascii?Q?SnhMKQ4FzK0EGRzebemZ9s3ryLGRRU2fH0G9LRzJE5EJocC8u/yakQsnKqxS?=
 =?us-ascii?Q?asls1dQS3hUKu/BJodt0bnPNhIf04V758PF0gQdlNeiLfIrXF/sR2GElSAsF?=
 =?us-ascii?Q?YdCT11pCuDV9zIFgJkU5XhljtWFpLFQXXxKeuVQEf2UbcFC0m90NPJn9lJpX?=
 =?us-ascii?Q?BRQoU6c8lFvucRkKR6iuQd87xRM1bGiDztdDX//6v5Ax2DsaUV4RJNCl8+mj?=
 =?us-ascii?Q?/tNe1E3bSGiq+VLMpYLrLVAItNDTODUlQ3FcrjuUyvF6AY3CevbKO1FITIw/?=
 =?us-ascii?Q?04PdIkiuUkQL/BdH2DHJ1QWrOhx1cuQGjm8h6RULXKHYxNi9FTMkQA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR01MB7792.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kzyrmAiUR3vEhkwD8Ln0xwGhwnTe0RaAuLgyVVl/RQWMLvD0jm9C4pIp6v9n?=
 =?us-ascii?Q?JyVoTMhBrpiVm+wIIgzwvI7jgnAl27T0ZyXlKyU4IAbpV8x0fo8z8MsOczQc?=
 =?us-ascii?Q?JF/yzzfeXZBo5qIlSI/cYKSCpZLkoOd3LywKhsYzcUmE/VGWSCwXtoaucoA6?=
 =?us-ascii?Q?YTLnrB3+rFC2YywszNQzCeXmWEMtKy9ju2j2Eh5ElXAWYxiPg8Jg05aQ2RY3?=
 =?us-ascii?Q?kzyZQGPECBl+74jmjkpu06Pgzw12ptR3bVyLCdmSlInD9kP8Jyuo2Bj68Fzx?=
 =?us-ascii?Q?4wRQEuDdyScJDxk9Xm6Un60g+1Qb1L/iL/6oUYtyBGVW2sHpS1G4ke3bgz7w?=
 =?us-ascii?Q?B8n8eG/gCDDvdt8KoHea6n7aKKC9TyMj8msz6zIfyqtDaGsSWtcY7tD6KJmP?=
 =?us-ascii?Q?PT8GGB+7hc3q0N+xv3h56rWGuEFihwsaL98RCbt9LAx0/U41MGtAPCjYTFMa?=
 =?us-ascii?Q?7Us6Fv90ZrryQEvo7As1c51iAQieCqPcRcfTrLlTRZGERhrNwPh1NTjk9CEu?=
 =?us-ascii?Q?eKi0i6Ek85MDuje4FsstwY4aGdsuA6DQHFMYNgqs12t/k8YvVVVRtPTw5CPl?=
 =?us-ascii?Q?SgUs7WM6UC4oFHJtSSjYtsaDC3DPpx8WEips8fyKy15+TUIp3ByrVQFh5cL8?=
 =?us-ascii?Q?InoPJnQjx43FPhzCAO1ZHWF/v0P7XGBXW1WAVlFtL8ICVS4c0nWAUvlwuXQc?=
 =?us-ascii?Q?b/KMainhLN3g2p1ghOfGbaWMux2eNvPE6Jjw5j2x7ordp4Ye35C/ksYy2ZMH?=
 =?us-ascii?Q?GVXHD5z+RJaxAuwzrr8hSkXl108x1VEkDsKCLwokjHKdC2CU7ppxoHf2HD7m?=
 =?us-ascii?Q?1UflTlWPz5E+XDxHC6Nqkdy8PvgY4mNUsbiAHIYAFIU8CbvcZYOk8pvr8jCS?=
 =?us-ascii?Q?qlDv7BA4tTw6Cv81Y4/RsXOyi1ewPd75sEisWPvTrP50/MR3SDty+MWEKaOn?=
 =?us-ascii?Q?BnfceSIrKJ6XlVi7Cqdkfwj3NUpo5oQmmNRFe48QBDBBsu0DB6zirbX3dEYA?=
 =?us-ascii?Q?XwHoZEfCcmiw780zoKZLwHhD4OUrBLMy5/8rMNhtPZhx0E19gdUKNF8Hp2q7?=
 =?us-ascii?Q?JvHOJQwZ+fixdzQas/InoXuLQFL5EGJSomN1auLTRepgdFw8pyzSV5ONWoVI?=
 =?us-ascii?Q?6J54J1MNyZ04gCVOI8msmdXRUkiHcGSj5olEdOxWh78WEtYpAxznNfwOHbqa?=
 =?us-ascii?Q?lMMPbs7clhFtt9pI/zsjXJY9rqvrtVMLYCY0xJ0MskOFis6rWPID4yfDMGk7?=
 =?us-ascii?Q?Up37K3Ty7VsHWpvuI916qrp0ITNvYaMcafQPtJhtZEQNhBZ3InpJdPoFMcvT?=
 =?us-ascii?Q?1geOwvGIGwkE+/oomwNu1hSPq4E5nmL8CG6I3g2IAp+YkKovtuu/JE8EHn/B?=
 =?us-ascii?Q?qVKwg6IvYNEsy64N6cdrdUeNgx00VcjrKPiw4rzF/VU96sQAYq/q/yFb5u7w?=
 =?us-ascii?Q?BUDVDqaPZZrDuHaif9FV8EqMIIhiL2g2d+H92qjxxxR4owgT2Ul1K6YvatSa?=
 =?us-ascii?Q?3kHshcEjK0LlAIBqBDFpOdtlKRNO4ShlWScJejXl8iowdCV9yJHHiqqmeGsT?=
 =?us-ascii?Q?9dwVYP1KxQuRmPolVxvf4XH+Ic11p1TqRZX/QCEK7P0Qm5VnrBVmaF5+VdER?=
 =?us-ascii?Q?Ln0qW7hNnUNkbF+hQCf0dPA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad27ea66-be27-45f7-564d-08dd924df3d5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7792.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:42:45.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gt1usOhnXm099EfriLV+hBhBrxY1l6+TYx0GtpQN/y7pteb81Eb6h5/lPDKyyYg//AiFDk5WOtqRJ2qET9cT7NopKQvyNc7fB+7IiaxDuimv6NvL2dWwpatkTADvpB2J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR01MB8221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_114307_014018_696EF8CD 
X-CRM114-Status: UNSURE (   9.24  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> Hey D Scott,
>
> On Thu, May 08, 2025 at 02:00:09PM -0700, D Scott Phillips wrote:
>> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
>> translations for data addresses initiated by load/store instructions.
>> Only instruction initiated translations are vulnerable, not translations
>> from prefetches for example. A DSB before the store to HCR_EL2 is
>> sufficient to prevent older instructions from hitting the window for
>> corruption, and an ISB after is sufficient to prevent younger
>> instructions from hitting the window for corruption.
>> 
>> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
>
> Overall looks good, still needs an entry in Documentation/arch/arm64/silicon-errata.rst
> which Marc noted in v2.

Ah, sorry for missing that and making you repeat yourself. I'll fix
that.

