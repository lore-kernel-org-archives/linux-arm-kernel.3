Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE90C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkzqgZ0l8sLcIoBbfUoUdzkUZq/uyzIcAK1bqXHbP1g=; b=Tip8XEWjEZ5QK3BK1x1UwQ2ZB/
	nHcMr2vmTiPDQW3BPUOifP6ccBKKt9jcSYvH72zycyZwTyhvQhRp3CD7Q7IcH3IXo6jF2LCk5mUjO
	HELrzzAdU0dJLN2CLrd6miA5fo811cfEP+K3g3TDwYPAx2dOrunncdhXmiBk24Qi2zpsJynjeCzVl
	XZTiDRy4Eg0lg1Qd13nn9rpQJE6WzSvrMk9Haa5/+i+i1V77W7PPf3iHP1Yi/ijqIoWROdUUqRxvS
	XkiE7ORUlSFWSWFjMWCwgw4lH90oc2Mq6T3YQDHEOVAaL2sUQjZzV17LrwvAGaS59aFC7mJAvO6J4
	Nh/pJTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Iw0-0000000Bw8B-49gL;
	Thu, 17 Apr 2025 06:41:16 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IsK-0000000BvQo-3w2M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npb2DQS78Y/nnDgb6N321ggoeyyrk90268c5NbFSuMNzMIHyUgIQNQ5J9rveVCHTw2k74rQOCI7kpZxcuD6VuWUleAQjGfsn8OgVbBdruD2LGi4RdiARm9DbKqmSpNXwj4HzPE1bu8D3NSmmMqbvJsxrXZfb7cfo3GacDTVcOXr/Q74hs95ji+r02AjArcXC81W6UNCjHQ5H6+VSOaG5OQ+AW4+zQ/wSjn8MQ1bGUKutIwr+mt+AHf0C1At8rqfONOBNXjDg5L9S3YkG3vLRbBHxisL9xvA3NftpHw0QWIbUgYclza4yQ/ExAXrOIvt43z9Ak0rnsdmNcgkhSNEUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkzqgZ0l8sLcIoBbfUoUdzkUZq/uyzIcAK1bqXHbP1g=;
 b=iF1/kuW+rR+kWYqRwcRx/vOVVeGNPdZIGH8hkmvY1Ilggr5vPBdhbcUiUCk/b5wSpCj67uTp1seYAUmnz9cBNCHoqr0f5YIq+YFofEyJ7Sh05S420qdVw7Ll+I2Cd1f6HPeWAWPpOIYfBV6GgNg8M/p7J6AaAH+lAJsg3liIDxR3eZyc0QoQMKXjJ8iKsiHn5Tpb/GPv6K42Upnh/3/8H9VWlT/mwIHAjZGX7cv+ATGbnx4wKB+0h3KbfcC+HkdjnJKTst4kqRdd2JVLR0+eSo4eCMH0bStgOFfjqYuvxcnlSOeCUF3vpOOb5mFAf2M25ym+wPua8mt4vGIL3K5PIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0099.jpnprd01.prod.outlook.com (2603:1096:404:2a::15)
 by TY0PR06MB5834.apcprd06.prod.outlook.com (2603:1096:400:32e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 06:37:12 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:404:2a:cafe::39) by TYAPR01CA0099.outlook.office365.com
 (2603:1096:404:2a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 06:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 06:37:11 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9FBE841C0A00;
	Thu, 17 Apr 2025 14:37:10 +0800 (CST)
Date: Thu, 17 Apr 2025 14:37:05 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <aAChkWPn4ThMx44A@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <74b9fc25-0815-4ece-845a-5f730c87fe78@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74b9fc25-0815-4ece-845a-5f730c87fe78@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|TY0PR06MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9f5131-c90c-4ed1-d8b1-08dd7d7a48db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JYCyQJRS2UvDwZDNryQGOw1LcnWQCpuu7Mq/Aak1Y1qOPP4alrncDma/Epwf?=
 =?us-ascii?Q?u99SV4QJ7VxjayCHj9UOUmDf9KBJCVDc2ZLof0LE0RLZWT7kopwllF7HZD7W?=
 =?us-ascii?Q?E/6s1om7GJaohpUa4nR7It50p8ru/mF8BRsUdliksIUJVWDHCCVACyp9jFnj?=
 =?us-ascii?Q?zGootYcRhH7OOzeh2qpf1BjsTtCeD4dDL11/BgkMrVzs09y7JdJ7geRC0O73?=
 =?us-ascii?Q?XLU6vaYcwnLc6vk5BbLjE8Z6YT8lCbHHI75/KBMX3+XINe0ygsMNWH2ENUVC?=
 =?us-ascii?Q?OfMVSp4rv35J8TXOP3lcEv7dycmaBrHeb2T19/Iicqd9mfsPRc2/1uV73EhL?=
 =?us-ascii?Q?vhI3VN7DcJJ0aeQ7ANCvuGB2Fc56nn/ienYsSLh0vxaeDjrHR0ABbSDFDNkZ?=
 =?us-ascii?Q?PLhmYMQmIezEECXWmh0cLqiLrXj4HJ17HFDa8WPUwAOh0q4DIhRqIHTVNSrD?=
 =?us-ascii?Q?4JkNSUPWhtWY4LknuKZqhXxxP5PidjWt9koeOMJw6sGjrw19KBmdFEvwQ68V?=
 =?us-ascii?Q?QF0vEvZrH2AytlMqkUgoNOQ08mvZOd8FJsg1H9rb2Pc4wmLFsgEFjBscztdv?=
 =?us-ascii?Q?ebZzoOyrv47nXwUeILKW10HMQwAp/qUcxWdGu/wCZzPUkxl0W75UedZv/1g0?=
 =?us-ascii?Q?B/2xNo3cIy5negdJRjCK82j4gJMhAoPRPxKSuOaJU/aMkzmvu3hl+PRp7P1+?=
 =?us-ascii?Q?oqAyIIQfASHwolSFo9l8KmQOWufSgmhx5A8ws6JlkK7PXuDBDQm5QUnhAnod?=
 =?us-ascii?Q?8qe92csNk9r2kdZav1U0TsuJutxvlRSfH1Hwgqsgx9aQDvsR08dHRqYlgb5o?=
 =?us-ascii?Q?h7WaAjfn8t1qbLhmm+ePayxLPXUcix+5P2NzaBak9xV76hH8YCQ5rzUYGvtL?=
 =?us-ascii?Q?Y3lQNAYTbk2H1rL6CKypPNIVdrZxxvYfDOfZm0lw9jJB6Vf1lw0qX18lF3WC?=
 =?us-ascii?Q?FEtSZQ8Ou8fJPVpoZ8micYmzxXZWR0alUz/im7ivxbrqfMZouQPXEXomvkub?=
 =?us-ascii?Q?y0OWghYmUQCutXsZSFCPf7zZNnZ8/BFQnixuQYrUswgrh8Dgt2FWsivQhC8q?=
 =?us-ascii?Q?NuMjUgyMdBnNDueZk5f051HPWgoaRJfmyZPrcnYX0RIF5MrynekFsD0AiObd?=
 =?us-ascii?Q?MR89OafCITN359xSAc+eEzqMS8Kw7aIu3Mk+8z8ESl2UkGyd0w3C5kSXcL1r?=
 =?us-ascii?Q?NolmpwzrM08/1V987+JpuN9Iyi3jrG/nQClcOnd1q2XZVf5Xqk8RqwyE3zaP?=
 =?us-ascii?Q?hNrF2Kf3v2ubQdI42wcIscaW5w0LEjjDL7DRMC4k8/b7BoVhqlhSPkSiPJW9?=
 =?us-ascii?Q?CKcF/UI+oW2UXoHKhdekC5p1U/Q4gohvvaLKKkp71DhW4qukyKxbQ0D5B5UT?=
 =?us-ascii?Q?y8s8z/8lIA5J/o/ggDMLzkLIp34NTEkw9mkF1ApzZqjqQfx+rYftG5nH2OFG?=
 =?us-ascii?Q?HwBzY30LKufZGL6P3lgGadbCjuha4n3cHDLMzyoopl8xNgjmVcsI6C/zLgM9?=
 =?us-ascii?Q?jog3h5pSUkfEDr4HDFrWZr5Ze2DGKcxySEAu?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 06:37:11.5983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9f5131-c90c-4ed1-d8b1-08dd7d7a48db
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_233728_975016_3959514D 
X-CRM114-Status: GOOD (  11.40  )
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

On 25-04-17 08:18:44, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 15/04/2025 09:27, Peter Chen wrote:
> > +
> > +             mbox_ap2pm: mailbox@6590080 {
> > +                     compatible = "cix,sky1-mbox";
> > +                     reg = <0x0 0x06590080 0x0 0xff80>;
> > +                     interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                     #mbox-cells = <1>;
> > +                     cix,mbox-dir = "tx";
> > +             };
> > +
> > +             pm2ap_scmi_mem: pm2ap-shmem@65a0000 {
> > +                     compatible = "arm,scmi-shmem";
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> > +                     reg-io-width = <4>;
> > +                     reg = <0x0 0x065a0000 0x0 0x80>;
> 
> Messed order of properties. Keep it consistent (see DTS conding style).
> Other nodes also have oddly placed reg.

Thanks for your reviewing, Krzysztof.

All the nodes mailbox and shmem (in mailbox) are on the same bus, so
I keep it by unit address in ascending order like DTS coding sytle
says. I think below rules are two options, isn't it?


1. Nodes on any bus, thus using unit addresses for children, shall be
   ordered by unit address in ascending order.
   Alternatively for some subarchitectures, nodes of the same type can be
   grouped together, e.g. all I2C controllers one after another even if this
   breaks unit address ordering.

> 
> 
> 
> Best regards,
> Krzysztof


-- 

Best regards,
Peter

