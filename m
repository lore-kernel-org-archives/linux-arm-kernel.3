Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387B8C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 03:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9JYl8mIIrPCrvx3F0KP7Ptx4cmDd38dGZuq4n7LLd8=; b=c70dtA7MvSt3XJdKd+gOhT84KK
	vrHeIqeVHt8k+576NZRUVIRpWCanbFgga0GyMP69RrFNnK+ThLGp/OsK+uDfFhx2TwNcayuPOjJj+
	YyPCR88yDf6lIZjMg207VJ2znW3wrfhAiUVv8S0ldUOv7OX9/BAlvNAPWw1LR+lke/CVdMcH3RCtd
	c+vtTP2v5JASN5CKf8p1gJHRdCafmwl9vRSOfyxNyqx6linAPIPjKpT/2j/TmAF9kRLZKwtdIigyZ
	9iTOUO4WG8GNPEajxKh6zVTrcZd3pzTa/gQwBgPGnogzLm/WSe7BVSeR8CYQ9+oQw/jbWqJpUV8Io
	AMvWhcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYc5l-00000001FXg-3Y7Z;
	Mon, 07 Jul 2025 03:00:29 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYbwI-00000001EbQ-3kPd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 02:50:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFSSkfAkiTXET31cpKam2GoAhRgSCAY9CTL+i1rhmp4vpg37RUBH+pDYHUf2039YTd2HHpIBUmRMrBPf1VOkFdoeBcAuMBjq2BNScOvk9b9/IzoVEnCu+LKBJoN58ULFsBxdpK7MQ2B5iPiLaE2cCKLjCHJ42pymwIriRImiGPxoq3KM1NyNHVm/JD7Ts4s59girWpi65Bs8aJIx3XYJ+Y6HYFA6f0RLK6kPLJF4OcjoA1jv4r8O5WUuF2zRo0zYMhVAKVKpmVvwhaDcxH/tFv2EjKHNKDKeeMUIeuHEhGbzk7yX+iQ7EUzSAYHMtzj6hdfa1TrAqu2JW7vuPllECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9JYl8mIIrPCrvx3F0KP7Ptx4cmDd38dGZuq4n7LLd8=;
 b=V4mo7LjJx1HdA4UPMl+iFIAFxyKCAgWUBP0wbXOXokpbGZhTlltPuhwDSEJ/ja1Lek3Q46rGX6DyK+L1xWVigoVm/0wP3DFO/jolXlVE2leP9uVTgVWnj3LAudfi4m+HSqOHu2Kh5VpRCwFHOrFCvNdSyvpZunRiHXWGdyYYS/De9kwgTTr25suTyaOTcci/xQThoB3fWWE1joSBcKXJZe8lyAIRmZXQ4jviIKGWjrg+t9G/MosxdtN4KLP+L7g0rmi8FuqAj9+2aTYdK8Ii/JArPOfJVDqYcAnbZ2i7AsXf5wDvr8wMrHPdlSmIlEmlRI3gV+TyYf6dVoUMVM4FmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0056.jpnprd01.prod.outlook.com (2603:1096:604:254::16)
 by KU2PPF40E30BD52.apcprd06.prod.outlook.com (2603:1096:d18::490) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Mon, 7 Jul
 2025 02:50:18 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:604:254:cafe::3e) by OS7PR01CA0056.outlook.office365.com
 (2603:1096:604:254::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 02:50:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Mon, 7 Jul 2025 02:50:18 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4F17D4160CA0;
	Mon,  7 Jul 2025 10:50:17 +0800 (CST)
Date: Mon, 7 Jul 2025 10:50:11 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, maz@kernel.org,
	sudeep.holla@arm.com, kajetan.puchalski@arm.com,
	eballetb@redhat.com, Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v9 8/9] arm64: dts: cix: Add sky1 base dts initial support
Message-ID: <aGs14z_nvqq943ts@nchen-desktop>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-9-peter.chen@cixtech.com>
 <507129db-a84e-489e-aed7-f1f86e6d188b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <507129db-a84e-489e-aed7-f1f86e6d188b@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KU2PPF40E30BD52:EE_
X-MS-Office365-Filtering-Correlation-Id: 130f3786-a2af-4e86-9f2b-08ddbd010207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MOmeQx5qmS8uAKfU56Xf3LBrGWZauyx/6efxTRC2zMW/6KGdcNjAU7RT///O?=
 =?us-ascii?Q?7ZHY1OFUxgBvPx12uSEI5T0rBpRY10SvOaBqp+h4JpJX5x2YO2oR/jTKpiTt?=
 =?us-ascii?Q?WH2uwStXc0yQQWD22Ti6O3+gbkS4IiXT7HBU/fETZlBvjc8t7btMeuULJxX4?=
 =?us-ascii?Q?nA87ijYqtl8nO9G94twGoqIqc7sd4bfJaD5rqyfg8Z0AH9u5/p7eVUqhczYb?=
 =?us-ascii?Q?PODwegVQdL9LvEB4RUgm7eUJoD3rtRgyT+yiB/nRJXNjfZxjbIsiNiGI899H?=
 =?us-ascii?Q?qP5ioixsi/PcvexTJ3HjuyW4EoFJB7YCyexz1ehn503gCT073PTEV8Uk/Lps?=
 =?us-ascii?Q?4rn571M0GcexQv3CIIH9wAtinypBMOenRP9gDmHSyM9h9o12My4vZ+mzVWq9?=
 =?us-ascii?Q?tqgPN7lRcRbhgOm9vVaCxIBdNN5TUJyVEAwEZ1MNyy/cGPz3A2KCbZLr4LPJ?=
 =?us-ascii?Q?OXPXuHQ2U/DBCCYi1jWxKDJEtBjywAtsp6bJtQLG77cWd7x7TUtPu1FN6OZh?=
 =?us-ascii?Q?E0U6ex4iq5BcM2RlqxAHkkKrkfWTW8TH5YQRsdbRqRn6c9RyazjeIxggU+g+?=
 =?us-ascii?Q?gb+yJ12MjohhqICChW1GkazLY0zc4TjvdsGeW7Z4aTocng4bTs/d/uW/tCVZ?=
 =?us-ascii?Q?bCZap5qqfTvGYGXP3UNmq0lr+2waCTfqH0kz5he+J/OOAQfkvcPZOslnUt6Q?=
 =?us-ascii?Q?ickmrf8n+9Ke5Al8/opS0F+jgFjMOCXXrpMXFOHi2aSImTQoHBfbnD83RYMg?=
 =?us-ascii?Q?2qGW58UyNEciMHPBe1aVghmdhgeYDjczzEv1qPJ3+owcd64ZryhguD3ju465?=
 =?us-ascii?Q?clVhU9peuOT+Dm61d62ICrVuNqMLYBBsldakMyCtkDZbUihDHuUHZeg/IiBG?=
 =?us-ascii?Q?YHsKmss6En9rFQmQ1kkcfE/h8Wi/frtz2JbjHrCF2UqkPWQ7JQjy5/SXLuKp?=
 =?us-ascii?Q?TJAyKwHi8pyKGjMIY+G7HEJdk0K3Mgl9qBBJoAnxMgtKsMUVTFUdsWCYvgb1?=
 =?us-ascii?Q?E7PU+Q2vvufh5nQpLBeTQdhnfzWWL4xQmtbbxIv5FXw1RYX9MS58xIWQsKhR?=
 =?us-ascii?Q?5vAd+wR8wdXpHRpedSiWApb9XBI0IYHgkPgIMWzyByj3oMwq7uQ0zIlGwVjf?=
 =?us-ascii?Q?GWaJe/4jmIXxOjhWyShnW3o0sAqLTCG5Jh9xAjNgfEW4zPcdeXANeeEDnyeT?=
 =?us-ascii?Q?IXKphy4D6Qrh2SjdqVrVTx4dIIapR5c5xzPSLoaGwrtkdqDj0CoTQKjWAS+l?=
 =?us-ascii?Q?9mWJYir2x+0LwWd3n4XsHAiq+OB/nmGmEPrXvB2UzpJ2LSo83QuzsNO3g/50?=
 =?us-ascii?Q?nq0h6w7zB2HvIVukaCSbwlERIxQvAoxsEVhWvnBSBL81lCpd3sVncRxQQUIW?=
 =?us-ascii?Q?1n+06/hqtGEm8p+ghl4vWIbkX/busCseiHsn6O2b8BylU2CpZGr/WFRPn96A?=
 =?us-ascii?Q?nJvMixJ6SaSPC9hNZh+8Ep49uDfy5QJ9/3B7+qEG9GBtVQCnXg8VQ8Xcrnfo?=
 =?us-ascii?Q?+DibPfvbJAfjVUg8ig53m93vTUAkm+NxDmKY?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:50:18.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 130f3786-a2af-4e86-9f2b-08ddbd010207
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF40E30BD52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_195042_932549_64CE1867 
X-CRM114-Status: GOOD (  11.20  )
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

On 25-07-05 10:20:34, Krzysztof Kozlowski wrote:

Thanks, Krzysztof.

All below commands will be addressed at next revision patch set.

Peter
> 
> On 09/06/2025 05:16, Peter Chen wrote:
> > +
> > +     firmware {
> > +             ap_to_pm_scmi: scmi {
> > +                     compatible = "arm,scmi";
> > +                     mbox-names = "tx", "rx";
> > +                     mboxes = <&mbox_ap2pm 8>, <&mbox_pm2ap 8>;
> > +                     shmem = <&ap2pm_scmi_mem &pm2ap_scmi_mem>;
> 
> These are two entries, so two <>.
> 
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     scmi_clk: protocol@14 {
> > +                             reg = <0x14>;
> > +                             #clock-cells = <1>;
> > +                     };
> > +
> 
> Drop blank line
> 
> > +             };
> > +     };
> > +
> > +     pmu-a520 {
> > +             compatible = "arm,cortex-a520-pmu";
> > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_partition0>;
> > +     };
> > +
> > +     pmu-a720 {
> > +             compatible = "arm,cortex-a720-pmu";
> > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_partition1>;
> > +     };
> > +
> 
> 
> ...
> 
> > +
> > +             mbox_ap2se: mailbox@5060000 {
> > +                     compatible = "cix,sky1-mbox";
> > +                     reg = <0x0 0x05060000 0x0 0x10000>;
> > +                     interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                     #mbox-cells = <1>;
> > +                     cix,mbox-dir = "tx";
> > +             };
> > +
> > +             mbox_se2ap: mailbox@5070000 {
> > +                     compatible = "cix,sky1-mbox";
> > +                     reg = <0x0 0x05070000 0x0 0x10000>;
> > +                     interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                     #mbox-cells = <1>;
> > +                     cix,mbox-dir = "rx";
> > +             };
> > +
> > +             ap2pm_scmi_mem: ap2pm-shmem@6590000 {
> 
> This should be just shmem@
> 
> > +                     compatible = "arm,scmi-shmem";
> > +                     reg = <0x0 0x06590000 0x0 0x80>;
> > +                     reg-io-width = <4>;
> > +             };
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
> 
> Same here
> 
> > +                     compatible = "arm,scmi-shmem";
> > +                     reg = <0x0 0x065a0000 0x0 0x80>;
> > +                     reg-io-width = <4>;
> > +             };
> Best regards,
> Krzysztof

-- 

Best regards,
Peter

