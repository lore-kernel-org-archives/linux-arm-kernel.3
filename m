Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D3CD2ECF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqgc5CPjaP49KJcXebJGCDXQWilda3LGOk43y2VroRw=; b=nWhU6EUlVr6VtcRfqn61Ov+ncp
	Cki36JfvOf3dywv/W8xq+iqSVxo5uzR2yU2ty7Na8fnMZ1pJ559SccSTffwjpcHYe0qR0fynG3Ul1
	ExJDoJcCuUEDzzohAFLcnAj1JgdZj55SthqkwLwvq41MlNtJjhWgQExBRusuq8GqShwr8GZquMwYL
	3rHsUS8dunVZT7t5H1reB8GXPQAvuCHsGjrS0bHWrUha2QhjLyThhTLlCiJ0KdwsU2mJGbnYfKYkk
	arUggCFZFpr6ngjkVw9kZSJVGEu6jmXO6/JmXWmUlfHSDR5ThKBc/ei5CpN/AB8vWVgtnGwPsR6pl
	w1vdFDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Td-00000003IJJ-4Axa;
	Tue, 20 Jan 2026 06:44:34 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5TY-00000003IC4-2B8r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVkRCwSV7rosuiQfRBpjQ5634IptEZvcmnDVoYahRFo6ZnIjFVOkMRvVI3noqGQpaLVUJTbhDft9MmfXMentedTJQoePj8XeRLPGINB1uDe+0xs3utaylrg33Gb+gZyAas5E9kn2yKvnsD/Gpy5v6/nefTOhofKmRvsqdur21FTWstuZCBn5lnuAgtROOLvljpR0/HgkAUlZkX3j9iu6YD2htVhiynUWq2fayuGjuYAz2tQ6u9BQUwD9vvXujavlWz/2k3jrujZ3HmCJxMbQe+1552hRbI911P1NTDwXLijlWrkoVVyL8uoXQxHHw5lHc7NMhfTGpxD+ivAegNHcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqgc5CPjaP49KJcXebJGCDXQWilda3LGOk43y2VroRw=;
 b=dpuGR+a3OiILgxsPBhE+ytHV8OPrg8pHzVE/tm+s+GeV8Lxu8RiefkIUEOfhzL3sAOi4YWDXwnqF7QbY6A+Z+DLeJnaZ31JRxgRe/sN4GslSsArIjHv3YJpM2d+XqdO26q0hTikY0m7rwD7nmtmA7AOnLnN0KW5HhTHUp/mU5p3Lw2wKP3BqFNCSUvYVarCrZvGNy1RiVKpT0KGOWQwTb/6GNt8GN4PrBUOX5fZY70KG4IGPQMNh/iarT21DczWHrm0qWtG/4c2SmDK/cglAoamlQJH7lnblZPElF+kPp0VqNPk66fdznpzSn8vmOd0QIyaFRRS1qhMShIfO3NvzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=arm.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqgc5CPjaP49KJcXebJGCDXQWilda3LGOk43y2VroRw=;
 b=lbTwt6TyqGQ/Q/uNCKd0wObLm3lK614HlCwOplkx1EUUFzEul/sINzY8vAr0Ezo1DwnzIzD4hPP64fxemue8A7SAfY+a8KF/iDXM5DL5G8Gv0EyCCYzrOADewk2+O5Uypq3NJwEN1OtNL3e1+XvOVfyXGI2EncR4d2g7WkHXN8U=
Received: from PH2PEPF00003856.namprd17.prod.outlook.com (2603:10b6:518:1::78)
 by CH3PR10MB7257.namprd10.prod.outlook.com (2603:10b6:610:128::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:44:21 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2a01:111:f403:f90d::) by PH2PEPF00003856.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 06:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 06:44:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 00:44:21 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 00:44:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 00:44:20 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60K6iJXG619716;
	Tue, 20 Jan 2026 00:44:20 -0600
Date: Tue, 20 Jan 2026 12:14:19 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: Cristian Marussi <cristian.marussi@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<sudeep.holla@arm.com>, <james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<elif.topuz@arm.com>, <lukasz.luba@arm.com>, <philip.radford@arm.com>,
	<souvik.chakravarty@arm.com>
Subject: Re: [PATCH v2 01/17] firmware: arm_scmi: Define a common
 SCMI_MAX_PROTOCOLS value
Message-ID: <20260120064419.by4nvmdgdybwe76q@lcpd911>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-2-cristian.marussi@arm.com>
 <20260119111827.00001704@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260119111827.00001704@huawei.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CH3PR10MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d78a62-9531-4e7b-c5d7-08de57ef57c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ovd8b3Fh0cZvjkAv4XSAuc9KwOD1Qzqjkp7ALf62oE7UHFb7qDm2kyO/lykU?=
 =?us-ascii?Q?jTQZ3URAY4eYae+Br8IkVMQImEspzoH/qBwSEbG5cUf4uU24UdI5md2W1cdd?=
 =?us-ascii?Q?l+fdE+fiouHOlGvORIpW0pp/7ZTPM+DfXuluSKAWhPHUDD+FGiwYz/UgpE+w?=
 =?us-ascii?Q?b/W1AmQwu0hZWovdrkwVZhY0RdQXeaiUO7Za6oFuOjOXieMtj9dDYwpQTtv0?=
 =?us-ascii?Q?waK7lonj2HIsMAvAz5m1LYdtoX1d8jRoemDA4Hb+yqH+Bz3Thgffj2p7cmWZ?=
 =?us-ascii?Q?hWwABrvAz87JxE7GLvlVUof0+R02RDBaDQk0Bk9vZFAw7KU6ECtcs97dWQ+P?=
 =?us-ascii?Q?MqL+c1Gi7R62ooODZNo+4EEGoms/4pH/CIBi2LqpwWe1PNjY7GS5WP+trb9A?=
 =?us-ascii?Q?vZdMgL7k+evzgC9YHvi+fjkQO/H4JHaeCYigUQdHaz0wMqwBCuzQKNsU3Irl?=
 =?us-ascii?Q?F394RghUYUYGmRyzlYYMrse9AYaE4iim/ZIqMTHtrpuTwpKa4Oo/2ieWvW8A?=
 =?us-ascii?Q?biyLNnO9fs2DMyF7cJqukAFxx9RJbEd7mN4GNckWqFSU64/IkhXNcbXX9HwG?=
 =?us-ascii?Q?bTcrIAT+l1DWChIqAyVh58Ja0BvmjqXFjt0I5yPfilz5X8qAAS/6ecmM0aao?=
 =?us-ascii?Q?xNwc3FVu6Ly+uEVyKXxjsb5PzbvqTv9Byaf2XZdIcmv3NWZB332KV+WzVQ4i?=
 =?us-ascii?Q?CWKNdxx1T/1PF4XpGziBDwXmFXLQ9s2fZu1908eZfwk5+d6N4s8bDESUC5fb?=
 =?us-ascii?Q?95lAA8o4qCQTKvzK1hfgLLLV1rqvn3e2cbsUUBl2/6yebAjgxQSUqZb3yXKJ?=
 =?us-ascii?Q?eTr7Z9bXOaLpA7Vvohsaf9HC/GsHfxVe1ZWvtRLrYwCX6+Q5LsVYjwDT3kOs?=
 =?us-ascii?Q?gL0h2I2qQI9BeP0c/7gtQmyX5SjWKoN3e33uwqh1cgCrjV9/uvpPrhSsodmn?=
 =?us-ascii?Q?5qCCbsUTGuf4PGHzenN0w4v4swrDGzDzGUJatxraRMBvBsXMeM82jwdfcOuF?=
 =?us-ascii?Q?S8Zbi8o16n4Gzxg0UAh484erpA24aG3+PEs7PF0ypUn0/tEzUXyQSzHFv7aG?=
 =?us-ascii?Q?C7EafCVMqi5r/PtfvSXQ9eNwdx79+P8SiwAtU6ftM/cO+GI/9iqHwsJ7XR0i?=
 =?us-ascii?Q?y1qy8vmdIon3u6PPWNWDT0Z0JAQ3C3qCD4GWum+i8qfigToeMoeSJ0iB2AO6?=
 =?us-ascii?Q?F9puDw/Tuwx8tXGoJwBD4jWyIE2jO3pH2Zm7LxIzi29lRPnKjbdNhZn7An8H?=
 =?us-ascii?Q?9Q4cTmgaez9uLAbAXju9mURUyZhrNUs2YP7eUOlW02xfyKnoPLIhsF9dy0jp?=
 =?us-ascii?Q?JhD0iMrHeXGmFJJH1WbR6BxdifzEXky0+1toHm0YFDuH2e3hmYO0UF4EXUTM?=
 =?us-ascii?Q?/D+u+iXr32gEMCJVwsT+H1zFUUwZ5iDZmd3Tts948EFDRxrd0EiTKIgibxNZ?=
 =?us-ascii?Q?DLFOupqQgxQjGt4cuvcxl76ZFbjvsnWNUtDqNu4lvlEoGzS4nVbyfEs8/IUn?=
 =?us-ascii?Q?bJodAAW8QR4DAgU+LVGBNqe3qmbGrB07MBaPIuP+Sdv5jZdioUJvHbLgpoD+?=
 =?us-ascii?Q?3gwBqj2XkzLr5uyhk/uuTt4snqauGspB9Xr2c7i1WbOaeIZWKK077mqFoDml?=
 =?us-ascii?Q?iaShPVQEQjwkldN20GgqOZIfXyuf/1EqfVdWrJ+AnHmWuFytBVg4RP31pC+J?=
 =?us-ascii?Q?RebiLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:44:21.3468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d78a62-9531-4e7b-c5d7-08de57ef57c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224428_574569_BB2B975B 
X-CRM114-Status: GOOD (  20.99  )
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

On Jan 19, 2026 at 11:18:27 +0000, Jonathan Cameron wrote:
> On Wed, 14 Jan 2026 11:46:05 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
> > SCMI stack.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Hi Cristian,
> 
> Mention the introduction of SCMI_PROTOCOL_LAST in the patch description
> and probably say why it takes that value (which is much less than
> the SCMI_MAX_PROTOCOLS value).

Rather I wonder why even add it? Is it just like a documentation/ marker
or is some other usage even planned for it?

> 
> Jonathan
> 
> > ---
> >  drivers/firmware/arm_scmi/notify.c | 4 +---
> >  include/linux/scmi_protocol.h      | 3 +++
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> > index dee9f238f6fd..78e9e27dc9ec 100644
> > --- a/drivers/firmware/arm_scmi/notify.c
> > +++ b/drivers/firmware/arm_scmi/notify.c
> > @@ -94,8 +94,6 @@
> >  #include "common.h"
> >  #include "notify.h"
> >  
> > -#define SCMI_MAX_PROTO		256
> > -
> >  #define PROTO_ID_MASK		GENMASK(31, 24)
> >  #define EVT_ID_MASK		GENMASK(23, 16)
> >  #define SRC_ID_MASK		GENMASK(15, 0)
> > @@ -1673,7 +1671,7 @@ int scmi_notification_init(struct scmi_handle *handle)
> >  	ni->gid = gid;
> >  	ni->handle = handle;
> >  
> > -	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
> > +	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTOCOLS,
> >  						sizeof(char *), GFP_KERNEL);
> >  	if (!ni->registered_protocols)
> >  		goto err;
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index aafaac1496b0..c6efe4f371ac 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -926,8 +926,11 @@ enum scmi_std_protocol {
> >  	SCMI_PROTOCOL_VOLTAGE = 0x17,
> >  	SCMI_PROTOCOL_POWERCAP = 0x18,
> >  	SCMI_PROTOCOL_PINCTRL = 0x19,
> > +	SCMI_PROTOCOL_LAST = 0x7f,
> >  };
> >  
> > +#define SCMI_MAX_PROTOCOLS	256
> > +
> >  enum scmi_system_events {
> >  	SCMI_SYSTEM_SHUTDOWN,
> >  	SCMI_SYSTEM_COLDRESET,
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

