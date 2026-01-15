Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F9FD44C45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ARSjK52W3i1ouFx04dQ6ryC4HgpymRlLxuM3P9k+nk=; b=g4sO4L4uzfu5Elf9LiYNOEy4rq
	72EiHgf7TNZoFghtYrpa/bbZLV69GF1Sj5cbKDUKNBYnPDqUQHwnA493PeDdA2eJ8PjBpvu4QXqH4
	Kdgawk2mig2hScuoHfl6hyXVybhzFWPCFXbUOLbW2oMDjn+yoeLlC/MwRopO+2U4+N9RiFWLUmEtG
	cQeQrF/Q4DNi549/Ntg6SvVu9P7dy8MGtQXz4tkpwTK7vE/tcn0YY3KCAMxa/iQ1nwX+Zb93eN6Pb
	vbzXPc73a1CkH+c2Oa/n2beR0Qwq7vCZMLspOy0IUPOYxsgnS/dpCkkCogisGXOcqnlxjD6BjS6rf
	vu/erulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN4n-0000000CNpC-3raD;
	Thu, 15 Jan 2026 13:07:49 +0000
Received: from mail-eastus2azon11010014.outbound.protection.outlook.com ([52.101.56.14] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN4k-0000000CNor-3KMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:07:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnC/o5i/8JQ0/P0gOOc9Lecgz3yChPM+bNrrho6w5TufrXuCrKlpLrpDF+0kyvBbK42WE+iVrcKmQ19b5++XquzAR77Y0RHGyqaRYDqMfDRGT7U6IsV3+WsErYje7NLqSMJq/rOpcsflKhSaiwF8R1qW/bCTWCATiZj2VMzba+YI2JRaZt7qwefdt3FiF2elAiMkJiZRXRf5pqiU54zM20Vc22JfCaLxv2R1uw5CiKukca5LI89EZIFNh+OW2Y99Yy/gu5K3hzWksG+fWfIwli0P/iCgh73pO9EoXyQMP2Wvv40ZtHvm+ZSqRteqJGPD/fNSjBdDxVUBNUkVbeuVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ARSjK52W3i1ouFx04dQ6ryC4HgpymRlLxuM3P9k+nk=;
 b=jsmKTI5DjwM2z8FLyVjPbfX6+K5Cm7ymMkydVkFu2UeHY4kFv89W3q/0L2jZuvN0hQvm6uuQdLT16JO2k55wCO/B5nbpRDqeyus2Gtc1GC/MQZeV5O5mQSd3Cc2gbeG+OQRPC4I+l1qUVLaA265MBS3H9aB7BicxME5ZIwdf2DyKBSLgl5mcOpZWMcL9xSPFieeruwIdne6OyBGE0QjV9a6KQGqQisZkXPMXNWhpZhYlggiwQ8OHZ7dYV9hfF18R2/fOsT9P+eN1CyMGv3Xh9pXesa6mnDtWQHUXvVs4Ehk3K1vddjC2en2yhIh0Awd/nqIHBws7OGPGfQd/k0V3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ARSjK52W3i1ouFx04dQ6ryC4HgpymRlLxuM3P9k+nk=;
 b=qDIL7OiOdFgdXEpG+r8lIn907V/TEB465AZ9XnfPw5c6hF/4CoiSLh31tp0jdug+G5q0QmdRZm4yoSbBe/F0QU16lFysaFzrkscV7LIMKcbdwZy1sqw81LgFvjv2Aoa+zkvs8i/Pm5bBG4xJ0ELZGljE9rkKskq087cFYrTBYCM=
Received: from PH7PR17CA0060.namprd17.prod.outlook.com (2603:10b6:510:325::24)
 by SJ2PR10MB7707.namprd10.prod.outlook.com (2603:10b6:a03:578::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 13:07:39 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:325:cafe::65) by PH7PR17CA0060.outlook.office365.com
 (2603:10b6:510:325::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 13:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Thu, 15 Jan 2026 13:07:37 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 07:07:37 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 07:07:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 07:07:37 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FD7bhp1465433;
	Thu, 15 Jan 2026 07:07:37 -0600
Date: Thu, 15 Jan 2026 07:07:37 -0600
From: Nishanth Menon <nm@ti.com>
To: Anshul Dalal <anshuld@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v8] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <20260115130737.eol7wtlotzum5kxv@hamburger>
References: <20260113-k3_syscon_add_boot_mailboxes-v8-1-d43954527b5d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260113-k3_syscon_add_boot_mailboxes-v8-1-d43954527b5d@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|SJ2PR10MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b74bed-cf32-4a7e-90bc-08de54370ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ep9Z853AuZ5cJC2YVxzeBGxzZMgqYTHDSuOKOpvt/WlEgzt340rXpzm625aj?=
 =?us-ascii?Q?lZsninRbay5RNIOW9sf1seeT/Whhb/HNGM4JwP19QfumsUZ7TK/Z4aGQsZPt?=
 =?us-ascii?Q?ix9mJH1igwBOcde9NNTGz6aX3d3YgD3L2Ba7PZWNxY1qLvVgLUx6yZAehSTz?=
 =?us-ascii?Q?7HNPz0QYW8f9deZa0OnXUG5BnGQSLMAzwVIxvQ2BYmMJKp0LAIh+TgP2+x64?=
 =?us-ascii?Q?VxMf31K/6m72TafaYlUla+JwCkMAQyXjD/v3fWrq6rPG+hHcLZ8ocqO/SRd0?=
 =?us-ascii?Q?X5QGnPEyE0XLE6xj++vZm2GlWliIGIwFkK2Cj/kdwjCQKzjkHJ7Yaddw06Cp?=
 =?us-ascii?Q?ViNPLdW7/wov2BdykBnE7pv9l35Lg9Oi82mEpdpk4aIOXkNODrZcrUa7cRb4?=
 =?us-ascii?Q?jhuNInUnjJLIIo5Z/lF+/hDb3myn45uPR0iJfJnzrQ+zvLeMMEKKOvr2lVKv?=
 =?us-ascii?Q?LN9EqpbrI3vdF7Mcd5FWmZo9dNWMGMNl5ZlP0869+FSPVKCIkHv5xVYiuHMi?=
 =?us-ascii?Q?3/rSOpjvi8sj0cFwqy/z9XdYiUQsjhz/1ea4sBgYnGd17/HgUevQLk119GwT?=
 =?us-ascii?Q?m1+yaMqN2cbBQJhH/vIqW4Rrmu+o+lR/cbvkuXmFEU7i7X+NV0jNqvoKDdci?=
 =?us-ascii?Q?LBKnNHg1Wow9uxCbTJ92exg5oax50pN6KV/L1vGfOxLJIUVzv+O83n9wZje7?=
 =?us-ascii?Q?SUvOO3G7Hg78Arw6p5G+K0FsMSBrNRawPXRij+lhta+R1qDkwSkB61aUlu2x?=
 =?us-ascii?Q?8uAn36Hm6fWEVIFK/8LyM8jnUS7jYl3qYhnbRXonucj5Vu2mS1xOwf7ZrQf9?=
 =?us-ascii?Q?BieiglShDbRoYeHxPluZiAEnLe5Zad7QZrSTG0sKBt0E55cbY+yADKJnHyBH?=
 =?us-ascii?Q?39OAXXR3lg1cGBoM6mxH6oq6y+aCkQdTw9rJqf63qsHRu0X4AFJitUTm2LaN?=
 =?us-ascii?Q?p+Yn0ydrvNY9Ti6XVVlfP3YK8AhnuaEgeNlgV+/EXWpIkmXJsq3Jbg/aP8YM?=
 =?us-ascii?Q?8zVs88fe1iAWpGl+Q53AAO+reiF2eyuZ8VAqdpbLDkZ1/0UYMitEtJConU6l?=
 =?us-ascii?Q?6pL2ZpzK8oM/66pTypewScFpk841p9rRPFmaLBs8yrINo06yKcUC1Zl3Yh/W?=
 =?us-ascii?Q?mtYo8GwWr/yoD+lGyh7nHQ83s3ZjbC3cYGp0iKC7GDz+HY+rKsZ7rdPKeoHM?=
 =?us-ascii?Q?J89Qq72KJDUwuiRztmC8t6VCKdoRql0YkUJipTaAavqKAsUoP/s9w8va02Gj?=
 =?us-ascii?Q?4Zug43t90cP9l6k4Q0N7k3G6nIAVqm+3+W/xKj1YA8mQzuJ3o8wwCdzT5w+P?=
 =?us-ascii?Q?lMZFn53t2ZNw0xxnAwTof6aqtXnt3rXAbXqoY4H7BA4AYQ+v8amdM90ePQBr?=
 =?us-ascii?Q?H49Pq2UoMZphWR+nnCrUITBaiwjHdEu0dON3V5uUSj2+5k0OrtfsPoOH9r66?=
 =?us-ascii?Q?Qg+lCDyz36qAh0H2niIYQwTgYx2OXPc6c47l+qiqHveeuHSN1DSsOLdqDBfZ?=
 =?us-ascii?Q?paM7XAKZTugppARvWeF5GkQgIBgr+8fcDMFL+FonGb6YgQJGTRoo/gH4fXIW?=
 =?us-ascii?Q?1UIPs7BGt9RAyZgpvTVm5DnEeRvVDs7vO/rRW1Tjv/3Mpmu+UDtnWL4QAKec?=
 =?us-ascii?Q?VKcvP7ZEUOTas6XEcLTOWryxi2QZ7GF03hChSUTkOl20YNyqSN3VEQMfqdTV?=
 =?us-ascii?Q?xjbi3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:07:37.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b74bed-cf32-4a7e-90bc-08de54370ebb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_050746_835548_F539C4AA 
X-CRM114-Status: GOOD (  14.88  )
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

On 11:08-20260113, Anshul Dalal wrote:
> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> which might be different than one's available to the kernel (firmware
> spec).
> 
> Therefore, this patch adds the missing mailbox entries to the DT binding
> if the matching compatible is ti,am654-sci to represent the mailboxes
> exposed by the hardware during boot for the purpose of loading the
> firmware.
> 
> The newly added mboxes are made optional by keeping minItems as 2 to
> remain compliant with existing device-trees. The new 'notify' channel is
> not supported on all SoCs and is therefore kept at last in the list.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> Changes in v8:
> - Refactored the patch to a simplified diff
> - Link to v7: https://lore.kernel.org/r/20260107-k3_syscon_add_boot_mailboxes-v7-1-d97a943f0a52@ti.com

Could you line this up with dts changes in a single series?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

