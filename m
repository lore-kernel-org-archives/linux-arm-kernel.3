Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3561DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 00:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kJSCvQLTkCq5YX+/NIhp+wzySh5DRPeRqV4orNXxIP8=; b=X10tzV0IWdwSuO
	M5ocHSpXuacDddl7IuDjQZwPM8mbuYqzJnjU0ubyeg4R/+HwY2aM83rNj3wN1am/YwZxNt+xeUoi2
	mdZTUDd/fY+tyjCh+eyRm+Hs/nrVIBLkn+R1/mWBdvMqkUQSjRT7R2qDs4umIECbQ1tXXH2B9u/tl
	lW+ZC1VdigyvJAeoQII4GnpP59lkJQboAD0KAofCfWyJf/b9ezUKK3Y4s5oDw6QrcaSq6awTtmvWB
	aPVFbIeOs42MYCuBDySgyVudPpTPSU0PU2aIthCEmgzObHp9yyk2Rzy90h/E56HvAOrMQwuDpTYVE
	rpOQ5vm1wXvfjOnZT2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX7lp-00000009rjo-2jYS;
	Thu, 03 Jul 2025 00:25:45 +0000
Received: from mail-co1nam11on20704.outbound.protection.outlook.com ([2a01:111:f403:2416::704] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX7j0-00000009r5d-0V3T;
	Thu, 03 Jul 2025 00:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0oOMZx48qwdZ9ku+59cdo+Q9W3Ld4RM9+sL222ZSFjdzXleJDRPJucw/IJFyPYstXI0ovx3npxosfLLicpxARAeYMAXTxDin/ddYplCbsrU0TpHrSjFA/+vDRmkG7lbn1M2Sy269vzRG+7EEwrRcZU+HAmTmlKEA9YdNl0Ef615IAFX5FRMTM+nVgOmwHTDTOgjkaCrFLVnlh+V3zqQ6XluEm0LXHqXX/D8zz3hmn8juFvyU8sm5AnUhpLm8lB8oBVYPnFMMxbwmdOqdZe4HahldZZrLOmK5arLGhjYxnaIvyFAkaYlGKFK3iAaiGdk2AAgh20+5MyAC9ACnEcOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJSCvQLTkCq5YX+/NIhp+wzySh5DRPeRqV4orNXxIP8=;
 b=fDxHhVNTwK8F3wC/4lvnWG6yw/+kfu3klgopkQkFelecllFCpuZYbMpFqnKsomfMEhRct8KQu7Ww1iydfdNcHSpE6zY7yM5EUi7wQYUo2iZsoqt3EgTsm/E0Fag9bhNXrPi1ShldqA9YC40mcUDgcPZRl/r019ET2oKpbTlK/e98qWQOncG8TkX0c/DG2C3DGa0vRmFHjs13kJLop1/duwO94bzXajx8MrqWwIsZrKVmTtsUoILmRtqi1QmwN4OOLLWWWu2FgnehiqCRhzHyWSAJyL8JmGRDGgBwxqQgKFx4uqZj8wmBOVGRrntR4/d9RJp46P9xgeRUW5gfw2sxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJSCvQLTkCq5YX+/NIhp+wzySh5DRPeRqV4orNXxIP8=;
 b=X8SqIEqSNRLPLc1DHuxTHWjAGxRdCRQYmkfQQqz8ihEDjjU4aZ/u9w8ORDvngswb2+ArvyhrMB2dlPC+jVfkT5UWgjutcu9pDNb2je7FnvyX3/e6RdAt4E95AzJOvqBv0hYvYkZFcw/6ckaALMmVZG8rNgLoMz28/1b6jfLQZBd17mupKz1O+092ncnn1yFwbyUaMGaJPCrik9sklNaw4MghMrMRbjNHheENLqRXbLCg8kNnyWW2QpNSzcZ3IQ51w7ld9PxVlZyrQAAeEJ6mUoEibNefRtdgg/Xdyf46wmt7MBnZX2b+Jy0W4wLiFXUBNe23qfepTEhNAZKze2Pjog==
Received: from MW4PR03CA0110.namprd03.prod.outlook.com (2603:10b6:303:b7::25)
 by BY3PR18MB4721.namprd18.prod.outlook.com (2603:10b6:a03:3c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 00:22:44 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::34) by MW4PR03CA0110.outlook.office365.com
 (2603:10b6:303:b7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 00:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:44 +0000
From: Harshit Shah <hshah@axiado.com>
Subject: [PATCH v5 00/10] Axiado AX3000 SoC and Evaluation Board Support
Date: Wed, 02 Jul 2025 17:22:29 -0700
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXNZWgC/53Ny2rDMBCF4VcJWneKRjc7WfU9ShajixtBaxnJE
 QnB7145XTQlK3cljmC+/8ZKyDEUdtjdWA41lpjGNvTLjrkTjR8Bom+bCS40N6iALpF8ao/knEN
 JDmj0ECp9nmlux2ATZQ/lPE0pz4C2N1bR3hM51tAphyFe7sH3Y9unWOaUr/d+xfX336mKwEGKj
 qxUyqHxbz/Aq0tfbG1V8ejrzb5YfYWaCy97g/2TLx98ITf7svlWBmOoU3sc9JOvfv2O42ZfNR/
 RkhmMsENv/vjLsnwDT+JYvg0CAAA=
X-Change-ID: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5681; i=hshah@axiado.com;
 h=from:subject:message-id; bh=nfxso6gUbjItWSLGLWsN1oTD9mzaO1MU/buVS50MO1w=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1N0Dqt/tPASw0DuYQGESjx4iTtvfZOS5x+N
 XBdUbqJMOaJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNTQAKCRDxWHMRoTLV
 +6KrC/sGy50WY1r9YaRu4CTiiwTstALjor9L2sDRU6oX3UNMVjFRlrmXdHO72bQKCU2jVvW8hju
 ok194QCtRtCvsRJOqyE1LwaFMZpdLB6/EddB8XSllFBsFc10SRTVRrmvakETMTvoL2m64zIzKcM
 YauiFf7+9xrZ4Nv2/L9hepkZCqOijSCYHpOtida4qSItId1IdRPvWxvsDVv5K6hs4TaqdPFQ/9e
 VGvDmWDYi44lTqSeESjgZiQt7R/KljmRlJnv4r5oRJOI1HYJnzOA+sOe0V/BfDmiyPZmOWx3tLv
 1M400/+AA7med3w3wLr+QosUVpTQNKOEHlGfHGr0HXWGrq/peXnLANwGfID5XVA2/Js9umBtIS5
 rtWxLZAQ/EOfeg17SVFXruJ2DHBo4m/QNXSfxBtnjxvuDAshnMB0ADPhRkvQvfEQDgZSxzj5eiw
 ApBehUAbeNU9SE2pxE3vB7narAzBP5dzjcNaymsdVngSyZxySTGVJvij60Ff8IyC9AlEk=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|BY3PR18MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f92d7d-1d4a-43ae-57af-08ddb9c7baec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUpKakpHK0ZVdTBQb0RuNXgrUW40TFpJcllacml5SWlHUUM5TnZhZWlWeU9M?=
 =?utf-8?B?SkV0TTh1dlhidFNHVkRTN0F5QjJnM2FOK2QrbFhvd3V1b0dzMGxtZjd3bjRM?=
 =?utf-8?B?SnpjdlpKSC9NMEF2TUF1NlRialp4UE5mQzBSbFFBelRPaTJjT1BscUN1N2Q4?=
 =?utf-8?B?SFJUbmVFU1ZRY2VrQ0E1dUN1a3JxeEJtbHlpRGhLV0xZTlR0SlpINWpjWVFj?=
 =?utf-8?B?Z0wrdjR2Ti9INVBkcEEyeDBDalErbUVxMWtINUxkR0kvN1lsc3c0VEFxQjlw?=
 =?utf-8?B?VUlyeXpkM2JKbVFCc1M1cDJCQkpneTZDSVUva2tlTXVMMXY0N2RIWG4yMDlU?=
 =?utf-8?B?MTAvb2tVRlVwTWozaUdtK1NoNlVQa29GNVJvTkZ6WjNwWXNqWTRLRC9yNGJp?=
 =?utf-8?B?eHpDMG1qMkoya0IxcHN1K0dUWjlMZEgwSHh4SVg2Z2JDU3Z0d21JM2x1YVhK?=
 =?utf-8?B?dEdBRWd0TkdodngwOHVJRVNJcU1BN0lKU0NNcmxja3NYTko2QUptc05QVnFB?=
 =?utf-8?B?VjJrNXZMbnRyME1VUVVMMURhSk4xZXVpOXB3ZW9hRHRaS3dXMGtmTVlDaEZY?=
 =?utf-8?B?UC9wNmo0MTJ5cFNpMHAxd2pmdWtKek9jY0I3bzJIeWNNOFBxczNSMGVYakl2?=
 =?utf-8?B?Zmt4MzM0V0YzQzdTQThqNmdrV1hHRVNPZWtNYlcvTXNqN2FybVloYnN0blZT?=
 =?utf-8?B?aThlSVkwWlgrTkN3ektKelJTSVJHZHRCdnpQTTFpU094RHg0ZGNoZVVEWlBo?=
 =?utf-8?B?a0VlR0txMlZLRUJGNEJHeFV2em5ibFNzY3pNNkR4QngveGhRWEZwSElYaU5Z?=
 =?utf-8?B?QVFEb3JzUTlsYUM2WnVNeTVxbTdvNTkvb2xVSzFJZEI0VHlrNURoRGhGUzNy?=
 =?utf-8?B?MGcrZTBuQ1J5Slp5M3kyaUp2M1R5T1hKOUV3RS8ybTJ1RDhtSUVRYU9hU3pX?=
 =?utf-8?B?NWRHdlIzdkJKZFZHQUM3TFhKTk5pc3hLZ2ZUVjRUS0hKWUFRVS9GUFh4dUNy?=
 =?utf-8?B?VkhETVE1QnV4QzhyNmN5UjV4UndOdVh3V1hSL3B0MW81NUVjYVRoVFY4cnVD?=
 =?utf-8?B?OG4vSEtFMHIyay82REF5aEw4U2pMTmdaS3BWTlI5d1pLVTNCMVdhVGVuK3Ay?=
 =?utf-8?B?elU3ZlZwME9uWGpkNWVXT1hwSUMrVUdUMEhDdXVrd2V5KzlTYmNUV3RSZUli?=
 =?utf-8?B?cHRLV0FVSjl5K1R0VEUzQXRESzIxOE4rSzhydUtNOUhNbmVjTHdCQ29PNDlR?=
 =?utf-8?B?NE9QOUR2Ylh4d1RPeHpvU05YUi9USXBYNmh6cWswK1hhNzJlUlQ5VDdFYU9R?=
 =?utf-8?B?NWRmcHROMDZpV1crcm9IeGxLWGE0NTV4bkMxOWt3QmtFL3h4Ni9iYnRPUkg0?=
 =?utf-8?B?RXZudVBTM0tNUFlaYWRTRlkyUDhVQnAwVm1CSXcrVjdUM0JRNzdWdmh3Mk1Q?=
 =?utf-8?B?bDNVWEM5am5scjR1bGlqNDFCbnYxeGJLRk5rUzZuN29QNm81VkZKN0dSNVJG?=
 =?utf-8?B?bklFRGlycUxDRzlvTVExZ2lya2J0Y0VyV0U3bXZyVzM3KzE5b0pEb3IyZjZs?=
 =?utf-8?B?L1paMjhodExMelg3OUxUSUZqaWZZYUVCUEJOZGFQOUFnbUM4SFQ2SG92cTVx?=
 =?utf-8?B?dHVVcExsVXl3VWc3bUI5V2YyTmYwUXp0a1V5c3kvcml0OThzL2gxeHp3OEFu?=
 =?utf-8?B?K0Nkc3Uwa1BTUXRoNmE4ZlpJeEZENFhlMUJSM1dQaW5WazN0VkF3a2p4ZCtI?=
 =?utf-8?B?Q09nbjZLcEg1VDNEdW5mZjBpMVBSVitwbTJQRGxjUVRDNEdhK1JGTjBvWFpK?=
 =?utf-8?B?NCtMc1IwWTNqS1NZQTZLK24yendOTlNnSGlTMnZ1WnAxSWIydlRIK1BneHEz?=
 =?utf-8?B?Z3Vnbkh2UVdZWmdqV3J0aE93Q3gxY1AreFBtYlhWT0NJVEc2eE1US0tleDVL?=
 =?utf-8?B?R0l0WlVUNFpSY0k5Nkk5cCtyZVpHRmF1Smlpc2duUGVsTmU5TXBPTkJQZFhO?=
 =?utf-8?B?Tk81NXNSRmVxcXRjeFlLT3lqQnUwVXQwZjRlZkJwTjBuOVlxMEFBSUdJWmF3?=
 =?utf-8?B?OE9HRGp1NW9zb09PekhhLzVxVVB5WVE0MlpCUT09?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:44.1323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f92d7d-1d4a-43ae-57af-08ddb9c7baec
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_172250_199670_985305B4 
X-CRM114-Status: GOOD (  16.85  )
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

This patch series adds initial support for the Axiado AX3000 SoC and its
evaluation board.

The AX3000 is a multi-core system-on-chip featuring four ARM Cortex-A53
cores, secure vault, hardware firewall, and AI acceleration engines. This
initial support enables basic bring-up of the SoC and evaluation platform
with CPU, timer, UART, and I3C functionality.

The series begins by adding the "axiado" vendor prefix and compatible
strings for the SoC and board. It then introduces the device tree files
and minimal ARCH_AXIADO platform support in arm64.

Patch breakdown:
  - Patch 1 add the vendor prefix entry
  - Patch 2 document the SoC and board bindings
  - Patch 3 convert cdns,gpio.txt to gpio-cdns.yaml
  - Patch 4 add binding for ax3000 gpio controller
  - Patch 5 add binding for ax3000 uart controller
  - Patch 6 add binding for ax3000 i3c controller
  - Patch 7 add Axiado SoC family
  - Patch 8 add device tree for the ax3000 & ax3000-evk
  - Patch 9 add ARCH_AXIADO in defconfig
  - Patch 10 update MAINTAINERS file

Note: A few checkpatch.pl warnings appear due to DT binding conversions and
MAINTAINERS update. The binding conversion and includes were kept together in 
patch 3/10 due to their close relationship, but we are happy to split them if 
preferred.

Feedback and suggestions are welcome.

Signed-off-by: Harshit Shah <hshah@axiado.com>

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: soc@lists.linux.dev
Cc: Jan Kotas <jank@cadence.com>

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
Changes in v5:
* patch#4
 - remove description, add enum (Krzysztof)
* patch#5
 - removed description, add enum (Krzysztof)
 - moved to the first entry (Krzysztof)
* patch#6
 - removed description, add enum (Krzysztof)
* patch#8
 - add reviewed-by Krzysztof

- Link to v4: https://lore.kernel.org/r/20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com

Changes in v4:
* patch#1
 - add acked-by Rob
* patch#2
 - add reviewed-by Krzysztof
* patch#3 
 - remove description in "ngpio" (Krzysztof)
 - add reviewed-by Krzysztof
* patch#4 (new)
 - add binding for ax3000 gpio controller
 - backward compatible with original binding
* patch#5 (new)
 - add binding for ax3000 uart controller
 - backward compatible with original binding
* patch#6 (new)
 - add binding for ax3000 i3c controller
 - backward compatible with original binding
* patch#7
 - add reviewed-by Krzysztof
* patch#8
 - update compatibles uart -> axiado,ax3000-uart, i3c -> axiado,ax3000-i3c, gpio -> axiado,ax3000-gpio (Krzysztof)
 - add space between nodes (Krzysztof)
* patch#9-10
 - add reviewed-by Krzysztof
 
- Link to v3: https://lore.kernel.org/r/20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com

Changes in v3:
- patch#3 
 - Update with the original filename (Krzysztof)
 - maitainer and property name updates (Krzysztof)
- patch#4
  - removed defconfig (Krzysztof)
- patch#5 
  - update nodes to alphabetical order, remove redudant nodes (Krzysztof)
  - add fix clock nodes (Krzysztof)
- patch#6 
  - enable ARCH_AXIADO in defconfig (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com

Changes in v2:
- update patch#2 to fix the yamlint,dt_binding_check error
- update patch#6 to update path mentioned by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com

---
Harshit Shah (10):
      dt-bindings: vendor-prefixes: Add Axiado Corporation
      dt-bindings: arm: axiado: add AX3000 EVK compatible strings
      dt-bindings: gpio: cdns: convert to YAML
      dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
      dt-bindings: serial: cdns: add Axiado AX3000 UART controller
      dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
      arm64: add Axiado SoC family
      arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
      arm64: defconfig: enable the Axiado family
      MAINTAINERS: Add entry for Axiado

 Documentation/devicetree/bindings/arm/axiado.yaml  |  23 +
 .../devicetree/bindings/gpio/cdns,gpio.txt         |  43 --
 .../devicetree/bindings/gpio/cdns,gpio.yaml        |  83 ++++
 .../devicetree/bindings/i3c/cdns,i3c-master.yaml   |   7 +-
 .../devicetree/bindings/serial/cdns,uart.yaml      |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axiado/Makefile                |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts          |  79 ++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi             | 520 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 13 files changed, 735 insertions(+), 44 deletions(-)
---
base-commit: 8c6bc74c7f8910ed4c969ccec52e98716f98700a
change-id: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


