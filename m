Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1054F0182B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdjIJ0nMeZYZKbO40/GLR+QpLrTHUeu3UmPwKzatuc8=; b=Sawh1pvvxfMmTrrm6zI1CJLbTv
	BtRx84jeZb3Szd11m1Wsp5sFo8rkSxhlJjQWbLQm7f37hj9yapg5xwW/V2TDgUdOboi4Bvp6Jgh74
	3m8Lox4iSdv+Dd676BimwRfpvpJqmxdamLJ+e0v93iu2J0OZvsMY3E4wb5QjJEPahBMHcNDfQ4652
	s8Xm/QcqZApwQQBKeK0IJFP1QIiJT0tTzQuW4bdmDEqbiajlQEltnT/gzu9bWDg8R6PMZcJBFEjbF
	bxR+HzWvrrHiNUNj88cI3/MXRnVFwAfGgVA1CiK0XO+iCrTTqfNrYZ6ZT9CT395gNV6mTvaraiEZe
	bAyZSwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyU4a-00000003crB-3LBt;
	Fri, 06 Mar 2026 12:14:28 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyU4Y-00000003cq2-1jfd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZ5k77fBZUeLx/I7ORfiZQ/DSDf5KLXnLSMSJHUV3gl0x3lobXLiJOiGQhcIYwCBlOZoWrRrt1b39jx6rGXUv/NSfwb/0nlpjMOcTjuIRvBK2PqfP39VBMvUjfJIba+UNaWoe8xSjhdYnQ5lEuDd7isCHbUCJFfBI1Cc07IPm/HQSJ92ogTqTC5LgKcy3/iGaZSJqHOpBDDMyPgec+aAWrji1hoOf64H5vQ2M0nkazbyG/xWK8diCPy7428PBSAympYMYImEOr7WxVoC1QoJ/q5nJtm/+0vdkf2Nzw7/yVtIWPZK+bu8gtIzu1LVHQqErILfP1g8DbVaRB6KH8viZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdjIJ0nMeZYZKbO40/GLR+QpLrTHUeu3UmPwKzatuc8=;
 b=cWG+REBRSQFfEWvD+hNCtle8++KsigczKlvKTq6qSxLTvWZxyjwsTsw1aB+mVjJ1uWXts82qPjr78y9m9y/VLRngxFfHw+fvuuhfIRlmWwwrd2pw/TWOL6Q6klmR6/+J1MQopVDkJfTzCiVhlE7rsbEDSq1r31pvvzig+tmXJbmB6DTtRGvnN5vrKdsJHpy0w52RfFK77zma2p1m36KXlu9FixVp971WTo20Fs9Au6TMglT7D9fSmmH9og5HLUIWieMROPxZLEwdCjqUGT6ev6bv3p9qYtm6VxtK7UGNo+v8rVWEHU77vcp/2PxlPFTfUGodqRemMAhvh9Tr5OKB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdjIJ0nMeZYZKbO40/GLR+QpLrTHUeu3UmPwKzatuc8=;
 b=CNMC8amuVSh9WLVWWkXb1e5rUSbcKPG9fcd5hfOGNfesyP7wnvCIMUKJFVo9RKPWjamfazGjpvSpz5lTC/3B8PEkeOmhxi4h5LcKQoPnO5xofFAHmTHbcbQe5gy0o2XiPcJ+yJaqSeONCGKjtOEt2yzpa573KTkac+Gqrv7kqmc=
Received: from DM6PR08CA0066.namprd08.prod.outlook.com (2603:10b6:5:1e0::40)
 by MW4PR10MB6396.namprd10.prod.outlook.com (2603:10b6:303:1e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 12:14:20 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::8e) by DM6PR08CA0066.outlook.office365.com
 (2603:10b6:5:1e0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 12:14:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 12:14:19 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 06:14:08 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 06:14:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 06:14:08 -0600
Received: from [172.24.231.225] (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626CE4Ol3780763;
	Fri, 6 Mar 2026 06:14:05 -0600
Message-ID: <9e5f094b-a55e-40db-95f6-afcf487b3f40@ti.com>
Date: Fri, 6 Mar 2026 17:44:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] PCI/DOE: Add DOE mailbox support for endpoint
 functions
To: Manivannan Sadhasivam <mani@kernel.org>, Alistair Francis
	<alistair@alistair23.me>
CC: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<bhelgaas@google.com>, <corbet@lwn.net>, <cassel@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20260213123603.420941-1-a-garg7@ti.com>
 <20260213123603.420941-4-a-garg7@ti.com>
 <1907366a-e6d6-41ac-b61d-6e65e9dafe9a@alistair23.me>
 <m7zyatomfy37j3dmvefkxr2waokhgj3qjl65fsnn7tsug3bti4@q77qhwwmauwo>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <m7zyatomfy37j3dmvefkxr2waokhgj3qjl65fsnn7tsug3bti4@q77qhwwmauwo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|MW4PR10MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: f638d2a3-7577-40bb-e5f7-08de7b79e4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: LCbqqTR1nuBMuYJhAjWYQ07GSu8xo4X+JLEdGUd5OiNyv/rqU3114XD2bI8so5nhQq7igwwcCRJngUFVDNlD8BZEzsMHUWnMaO3edEjftoBoMrFTWnJT1D/MHniHe/MHt2tbwAG010ZEwZW78WOzOoHfDJD9h+t850j1yxL230AeyjmoPwtlLlb0UP+uXscrReOo7VEPCY9eBEVOm8QiEq2IJt6on2eq7isu16eU6cqGcg31db/1C3qKa5D+VOpdGDeIttSFG8cbCt9CXLkkwRlgv0xiPp+t0ANCVHlVx3kjNMdT8eb5JkNBM1vzzfbksVOwrmbLJqOW45vQjmU7zSCCQwm3ytiyTIpPOnLWSLFc9coeMRuZeg3+n+xTGAC7fOnAVS5OH+2umy3xB0XS7iVte4ZB2aMPVlu+EzgeoaotdTAtE6bXq4IOTAUzH6tufluxnFS1Xqg0vP40pY2h/iqjlDjWvPlOjTMsRHjjdqStm/dPqPdVG3VcKZvaByLX/an3itwG3Y7dn0lgsaNaLqWIuySPs3bsucE9u8tbeI+lQmoSJpfYoOTrQ4skzVUls/fmihX+cKfKUmQnLxH1sJaZ1ehiupb1F7+BfDebvL8GwUIYMkv0Zr6yD1q4DAqQgb/3whOR5POG+fMGx3WpVaZJOYNvj/gi2wqdFvhsEDD8peOraAaecpgiHpin211bTBYvoZc0mi7io98dFij8nHUz+yedy9AGj7ebyIFis7L56nB6XgxlQnzGjZ5PTkoynnl9ZjnySAksV1lcLuVrlw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6XTr0RTsG/UzOlQqkfWX0lnmS3EwfvXTkDFQRaPDx92BgTbdCKpQpMpvUq3Jy6Mjdz8wa29b6SdV8/ymXmXPM4FxML+i2VZimOm3isWE1MBUFlZ61P2u6JsjLruIgIsxxQ+SAlJLj+PVJjI8EWpxjEoSyq2pSdIc5XGOR2D68VAZD79wrFp6H8Q8WXzzKRgsjGqUD6zd/0vch4gsxu/xukjxmBnUhU0IgtvKPOEOqjQfvD0BlNJ59hSkmWmlIGH8tTeVCjffCLD2LmrJP9Or6w1eT1nvNGzo4M8mBTYiJE6TmtTea8GScoJr1f+XzuO1GNKOGZ/mkA2nx+M269SPhYk9izBUNODmUSZH3ACKpi7v1DSngYeWtL7c+bbrqN0a7pzW7BTaymI3e9JVjEsS6OQjFO7hIoetQSBY/d2Hz+UlLzsaf8MnxtZIW/0BWTiY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:14:19.1555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f638d2a3-7577-40bb-e5f7-08de7b79e4c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_041426_673916_88C4A90A 
X-CRM114-Status: GOOD (  14.49  )
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

Mani, Alistair

On 04/03/26 19:48, Manivannan Sadhasivam wrote:
> On Wed, Feb 18, 2026 at 02:28:23PM +1000, Alistair Francis wrote:
>> On 13/2/26 22:36, Aksh Garg wrote:
>>> From: Aksh Garg <a-garg7@ti.com>
>>>
>>> DOE (Data Object Exchange) is a standard PCIe extended capability
>>> feature introduced in the Data Object Exchange (DOE) ECN for
>>> PCIe r5.0. It provides a communication mechanism primarily used for
>>> implementing PCIe security features such as device authentication, and
>>> secure link establishment. Think of DOE as a sophisticated mailbox
>>> system built into PCIe. The root complex can send structured requests
>>> to the endpoint device through DOE mailboxes, and the endpoint device
>>> responds with appropriate data.
>>>
>>> Add the DOE support for PCIe endpoint devices, enabling endpoint
>>> functions to process the DOE requests from the host. The implementation
>>> provides framework APIs for controller drivers to register mailboxes,
>>> protocol handler registration for different DOE data object types, and
>>> request processing with workqueues ensuring sequential handling per
>>> mailbox. The Discovery protocol is handled internally by the DOE core.
>>>
>>> This implementation complements the existing DOE implementation for
>>> root complex in drivers/pci/doe.c.
>>
>> This looks good to me!
>>
>> I would love to see a handler implementation and integration with a driver
>> as well.
>>
>> For SPDM the handler could even be in userspace
>>
> 
> +1. We should not be introducing dead APIs.
> 
> - Mani
> 

I am planning to remove the register/unregister protocol APIs, and add a
static array of 'struct pci_doe_protocol' instead of a dynamic xarray.
By this, we would not be relying on someone to call the register
protocol on behalf of a library.
Whenever a new library comes up for DOE protocol, the library would have
the handler function, and the static array simply needs to populated
with this handler function in doe-ep.c

Please share your thoughts on this approach.

>> Alistair
>>
>>>
>>> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>>> ---

