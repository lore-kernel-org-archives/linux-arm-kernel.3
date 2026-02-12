Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09748EEA84C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uh+Bp1KDEA/PG+SC8Lr1mIHjdBZVdYW+rmzRI8dVlU4=; b=0VDuaFo6MhfzPMT/2cPgxqo4kV
	RgcSRrKZjbKyjj7vnIY76XJG3ZZuLX/HYXfLLHbV6Kf3MlW+z6T37nsrvH9FL586OBZIvKUi5R1Sw
	7vOGBUXfYfGRXrV7MTm40k3TsO+NptNR/pUzYSPypi072DTeSv1LQ6eK8CK4TwTX3wc8VGFD/HE41
	nrLMQpJ8ntIVYOtM+xt5IN0ydgsnhGeePMSRtBSMQuRk3W5/gSXee0nIcOsZcsEiv1KsWWgcMZ6sK
	QDBi5dCZCLKamaxhOymKXZzP2D5Xuz1GPfvPlIZ3VJhMLaa18iuew6tFEd1nkPObDcvoLhqvsBWc2
	MEwrZiKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcyS-00000002bZh-0gH7;
	Thu, 12 Feb 2026 20:07:40 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcyO-00000002bZD-1e4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 20:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KROrgBq1jX1Z2UbqCWp4jPoAIhDOHUGRNP8G6n5C5AEuCeEJb3HEDFu+ZS5WyAhioyJnaE+UmE3LvRs5Sp7UfW9eDWo+OaTH+1uC8SZaaOt51fkimBilJeFlwFmzinwV2j5na0LdOh9zlhLik8pvL3NU7RnFER3w2ijH1pLBzaOTSu789UmLC0ys+0zMgeM4W5yGtJB5jknNY4+w1mUIPdlW5adDmxH6RlinSuN9ElubQ2YQWHajkP6gL0KlUq9/3zFl/xYZYhKgnbM3mJpAF+w8PIoB/CXc3Z2NxAbXG4HdK4aKIAgs/NuBAALekbb6Tbi0lvGclgL4pCMmP8C8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh+Bp1KDEA/PG+SC8Lr1mIHjdBZVdYW+rmzRI8dVlU4=;
 b=ZyjOQGdrnpKHGEm7JWy7Ip8xrZdmgaJZ/4QDLdJopj3IG8AL16XhwSpz+GMpOFmgjujnzmsXD3j/uQjzrBJgzLBpep3J2XCX75Z7DBBKYdZAJtl+nUx/miZqUUeiMHHFFX4C76X2dm4AHFK7pIJ7ac0D1lVi3h1Z2eCZspusUuXMN5+gSZwy9S+tTcsMDh1Qu7qW6B1dwlQcHuPXMEjFn/P3IAvGzOQjY6pgmYjIP+LPqUuZ9W2cj9/b2yrKjnQ0ei5h5/bseWBwIkTiZBITedoS68jm/+5qpRGNpmVZCpJOsbVFu5TKHFY6HfG4yD+g2/QzcLdr5O0E92dDK6f5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh+Bp1KDEA/PG+SC8Lr1mIHjdBZVdYW+rmzRI8dVlU4=;
 b=Uqed7IFsA9MhBYRB3IJV/8XGEuRipmzQbA8VG32DkBEohruszC+5blkZG5tEfTQURQY+8lOCDieLQR4lLLRdq95cuUMNLXFSJyvcm9I5mPE/OoOFRpe624Ym2mrqqfUECG3Uak87N69dWI8ZNms5WvEdjcD6cBqWje7jq3hOj1k=
Received: from SJ0PR13CA0046.namprd13.prod.outlook.com (2603:10b6:a03:2c2::21)
 by BY5PR10MB4178.namprd10.prod.outlook.com (2603:10b6:a03:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Thu, 12 Feb
 2026 20:07:30 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::aa) by SJ0PR13CA0046.outlook.office365.com
 (2603:10b6:a03:2c2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Thu,
 12 Feb 2026 20:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 20:07:28 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 14:07:20 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 14:07:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 14:07:20 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CK7KEI4105115;
	Thu, 12 Feb 2026 14:07:20 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 12 Feb 2026 14:07:16 -0600
Subject: [PATCH] arm64: dts: ti: k3-am62d2-evm: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-am62d-can-wkup-dts-v1-1-d2de17e1f303@ti.com>
X-B4-Tracking: v=1; b=H4sIAPMyjmkC/x3MTQ5AMBBA4avIrE2igy5cRSxaHUxESesvEXfXW
 H6L9x6IHIQjNNkDgU+JsvoElWfQT8aPjOKSgQrSBSlCs2hy2BuP13xs6PaIpqrZWVuXWjGkcAs
 8yP1P2+59P2o0EEFkAAAA
X-Change-ID: 20260212-am62d-can-wkup-dts-a45edbb5361e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <msp@baylibre.com>, <d-gole@ti.com>, <sebin.francis@ti.com>,
	<vishalm@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770926840; l=3873;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=+r3GDRq00u6ZecKMEvf+tpUO1+ZsVcrMCVzBbQugevU=;
 b=wgIDmSzXyjUoMBMUaWj8qSOryXX+iXPYAwz2OAMTfHn6jfV7ofao7/5VX5QXvvdoZiqW6jkpw
 B1Ju/5Nq9jWCMVHr2pHc9hDAZ+G5mvZeUjseWQfuXynWd9GmS7zHDZr
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|BY5PR10MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: 2139d3bc-d5cc-462c-7aa9-08de6a7258d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEdpUkN3MnRQT2x5VkxJWm1uY0VLVTU1MVd0YTR4RkRnQisyWkhIcEEwQWc2?=
 =?utf-8?B?YzBqUVZERnN5Y0dQL0ViSFZQZisrdEt4c3dyQURRMmtuYzJnczB0S1k4bUFh?=
 =?utf-8?B?K25jbERoZkVrbVk4dWV3Y2tIQ3pncHZ3VWpJbWZoYWxvT1NoNjBXU3ZCa3hV?=
 =?utf-8?B?QVBDcTE4cUYvRWJCL204Z0tYRU9NZ09Lbkg2MWZaK3Exbzg4QW9VQlNta3hM?=
 =?utf-8?B?ellzT2ZhUlNZZGZ0UnVLeGVvOG54a2RXRTExdFpRRHk1c3I0bCs2VjM3RURq?=
 =?utf-8?B?dURqUmtyNWVmbzBWbjk5YTR5YVh3Y09Va004WTNaRFpXd1dNQWhmSC9BUDlm?=
 =?utf-8?B?TWhwQURpRytlaUtwTElJZ2RrNDhHN0thVjZ3Mnp1SEZGMXFINmRWNnFkYWNa?=
 =?utf-8?B?TUdnUmUwNTRCRCsrYlBRUVk4YmdiazZpQTY3T2o4RzZodm1RcjdyeG9UR0pl?=
 =?utf-8?B?dmRMbVFkL2JJV0dYMVhFeXdhK0tFL0lTc0tkRVBBV1pmSmg4MG01aEI3czBs?=
 =?utf-8?B?Q1JMWjhXZlFNMUszeVdSeGNaMGZVTUNzdlk1cFVPdW5YaGNsS240VUhsTG5v?=
 =?utf-8?B?SzM0THFpYWNQYllYY1ZqNUJJRTM0aDZCNHVXV3dlREo0Sm14S0doSGRPY3ZL?=
 =?utf-8?B?bTJhN1ZlVVVjeWtBN0VGNGpMamx2Ymx6NXRrZEdCREFRdDQ4TFJ1d0FQNC9p?=
 =?utf-8?B?eHpVVytISGwyaFp5cnpvT2U2SG1jY0t4d0xtLzFZYlNkOGdBVVV1aklLRnNT?=
 =?utf-8?B?dUpzbndSNXprUkI4d2Vpb21hSzdCZnBHZlR5VGNRK1BtUm5OQm1Nelh5UWpm?=
 =?utf-8?B?V3FHQzJhbEtVbHB6b2FDMENTWkk1dnNWb2VHSDBiK0xxaDRiRlQzcno5Q1ZW?=
 =?utf-8?B?WGdVZG9QQU51RkVHK1NKVjlDU1JQMEVtNXhWc0lkYmNkZU5RZ1pkcmRtcEJr?=
 =?utf-8?B?UU1QM2w4ZEgxYktpVVZOUmtJbUNPUUtHbDFjKy9uMzJ4dXFOTXdSRm02VFhP?=
 =?utf-8?B?dlRKa2ZscGFSYWNtbHZybU5jT0luWkZrdithY3k2Mzd2WGRKQ3krTHl6VVlm?=
 =?utf-8?B?UVpoRHdjL21LUHp2KzdnRDBiVnUzbEt0Sm04cDh2ZytYREdsOC9zNjR5N0do?=
 =?utf-8?B?TFhSZHJ1MHM1N2YvT0UyS2tBbFRDdHgxcklMOEttVVRQM09rSEpUeEQyMUNB?=
 =?utf-8?B?RUFLZDFab2VjMDl0amZqUG1zQ0xNVEoycVRZK2NRaTFyVmlidXkyOEprNjh5?=
 =?utf-8?B?YVlxSGlkZUo3M2YzSC9rYkl2TUUrQXpQdzZwU0M2aWZ2UDFBdjlqbk9jN2tT?=
 =?utf-8?B?MmR1Q2VzdUtxQlZ0K2JKQlYvUTk4UFlGeHF1U2JBOFZQSVdGYUxORXpISWlG?=
 =?utf-8?B?eFg0UjIwN2NnWEhncXEvbGZoeFpJaHZGbFdKSFFaWXNSMFFEWGZEVWlTbTlZ?=
 =?utf-8?B?emRYeWNQSWwweERzWkV5RUdCTHRkaURpOTBjb1NkZVdDbndBcWh0RExHcnJZ?=
 =?utf-8?B?OWpsUUE4eWpXTVVSMVAwNkhaQXFWVTFJeC96c3JOUTlGdGJmRjhUMWFYMXZk?=
 =?utf-8?B?a1ltVFdBUUljNjN1LzlPRDJBbE1tQXFHRTg2NWV5ektDUlpmSFBKdTdaOCtx?=
 =?utf-8?B?TDN0WGlrOS9ySWlTcmg0eUE5cVhpeUhlaFhpT0ZJSVlYdGUvT1laUkpmOE1p?=
 =?utf-8?B?QnZ6NXNadVZuVklMeVhPUW4zWlZmWWpFVVdaZ3RseHhUTGx6VlAwYW9pMDFU?=
 =?utf-8?B?azUrZzNhT3lyVXcyYW1VSnZTWUVZQXJXdXFUQTlXNnhoUG51QmxaaVB3TmVZ?=
 =?utf-8?B?NzNWaE96c0FRYlFOcjVnQkdyN0d4azA3cGRkUjhSWVBzOEdvcG5CSk84dmpk?=
 =?utf-8?B?bDFYUUlIaExkU0Fkcmt1YS9lWDBTc0tRbTdtUzlBQ3Y2alZuVGhMMk5XSWdY?=
 =?utf-8?B?KzE2K3ZBVkJONzFlTVVsSVJ4SWlFSGMweWVXdmYyWEFGRVVVQ29oUUVCcXJJ?=
 =?utf-8?B?dUxYK1VPdVpIZFZFQ2V0U2tybWhLTzhMVU5qTzhCMENCcDVqSHVZMWd2TmJT?=
 =?utf-8?B?NHFnUENwRU1CdXpub1Y4RVlKYzdhWS9TckQ0RFI4ZklUcFZTUk9veHBkcjNr?=
 =?utf-8?B?N2NlaEl3MzU0VXk4cGJwNTVwRUFmQm9RVGNKYitmdU9RZTAyMEhsKzdUWjlX?=
 =?utf-8?B?cGFpKzZvWUFhSlBkK1ZneXJ6WFJJZVgrb0Jvc1Yya0FaOXBBUEl4OE9SUlo4?=
 =?utf-8?B?RWI4WkQ4MC9Yay9aUEVkWXlacTFnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IPrFBwAN1cwcShA8dZvAJfhTzHsJhPrmQNuR6hiobE9g+wGbdDjoY8DFtQwCqaxQi+S6Au8fF/5564Ton0DHF4/HxaQtd+LP+by0m+IYwy07qCYRBQyxx7DtZSUpotz1FavtRPet2EAfQFCpsnJ8k33ldwCNYaTLOIocd580Rgkttz5y2Gsge/WVQhTEYzulVfSend9jSPSr5dwwPsaK6Y/VrPACUfPWfmFNI1ildK1aUd6EVyAQD7DK7nl4l9aCNg6VD65CPkghai78Le/DJVQAA9w8n/+gYZJIsAgf6ybrK9YugxZAI3nPbsQLpSbcLiBcbjdhd/0KE+BzuzSkX/fnxrmefrEPu7V4YbsbZ30RX8pFtSPRF3hSldsq5KFgBoTnUOtfX/GBksK0tS1aX9Ym51Pt8dO/B8eIcdq7u/Soh6BroiH2VjGk1H+wM5NK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 20:07:28.1034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2139d3bc-d5cc-462c-7aa9-08de6a7258d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_120736_534478_D85E23A2 
X-CRM114-Status: UNSURE (   9.95  )
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

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and I/O Only + DDR and are capable of waking
up the system in these states. Specify the states in which these units
can do a wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
This patch is based on a similar commit afb919a6b36b ("arm64: dts: ti:
k3-am62a7-sk: Set wakeup-source system-states") Markus made for the AM62A
SoC.
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 69 ++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index a5d5dc0a7bec8c3a5dfa63e984ae398af3ede7c0..1ee851a646c053b5d6706f885c68058f4c4374b6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -199,6 +199,42 @@ led-0 {
 &mcu_pmx0 {
 	status = "okay";
 
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x0034, PIN_OUTPUT, 0) /* (C7) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x0038, PIN_INPUT, 0) /* (E8) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x0038, PIN_INPUT | PIN_WKUP_EN, 0) /* (E8) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x003c, PIN_OUTPUT, 0) /* (D7) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x0040, PIN_INPUT, 0) /* (B9) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (B9) MCU_MCAN1_RX */
+		>;
+	};
+
 	pmic_irq_pins_default: pmic-irq-default-pins {
 		pinctrl-single,pins = <
 			AM62DX_IOPAD(0x01f4, PIN_INPUT, 7) /* (F17) EXTINTn.GPIO1_31 */
@@ -228,6 +264,10 @@ AM62DX_MCU_IOPAD(0x0050, PIN_INPUT, 0) /* (E13) WKUP_I2C0_SDA */
 &wkup_uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	bootph-all;
 	status = "reserved";
 };
@@ -737,4 +777,33 @@ &c7x_0 {
 	firmware-name = "am62d-c71_0-fw";
 };
 
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&mcu_uart0 {
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
 #include "k3-am62a-ti-ipc-firmware.dtsi"

---
base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
change-id: 20260212-am62d-can-wkup-dts-a45edbb5361e

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


