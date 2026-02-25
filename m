Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EF6FCEE80
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/Ma+lxDU7ERUeRkk9dh9RNirepwnoT6BNtPHK0qbdk=; b=kxIPh9yjkMLP1gkrxzJiOosxRu
	LGQBh3NCtRM8yDmuyGYrFnKtK397gEm2Jbm8/fsQlg5Zfk6o2YrZpxlW7Ei7M7j0Ddg4HR5FWBVaP
	Wj+wIGLGPtC3do3Z++zC1haDsZ1ikbpsnruEI9S5Jj4Ejzy3og9tmbJuMimAou5pgO8VVeVFh4pqW
	e69UAPrD86rkZRB3vRXhXvigBNugaCy9c9EGW1T3bP8GQtTzkZ1bStt5kMxf1DTHt8P7H5SD42OMN
	SFJzZf/Zh1Y1HB7asL3VQww/Ba/biq3vSehpVtGg3u6FM06VYfs14h6NcjXgsnTi8x0Qt8pV4WCOZ
	ZxMEMQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCnd-00000003tBd-2eSx;
	Wed, 25 Feb 2026 11:11:25 +0000
Received: from mail-centralusazon11011035.outbound.protection.outlook.com ([52.101.62.35] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCna-00000003tBI-2CrX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAHTSrkj3l3yznaZztLh6mfUkbBH6O3t2Gfv6NJRR8sGAmKGzBtT8Gr6bfOGgHyR2hP++fPW/8+emvgT72NhIIxq8OWNPbUsV6qVTWOpD65wb0oaUhe2QVJmxylUDdoEjTXoAy+I0qyCnWWQp+M2IaldQ4s4/9CmLtJxzQ7sDP4bgL7kcqG8C1P6zDTC9aahZH0KlpVU6LkmdqzmUPKTxwoJo/DibMnZ2plczC03YJscO5HRd5HEiK5dRXX/IYTjFWA+evhZeVMWMa/Zo6zrmusCUiM0NSLw8zNz4lY7a/8beCa6ch7XavTgCrTzxG4hdn7nFgH5eNdHdhwAOlHaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/Ma+lxDU7ERUeRkk9dh9RNirepwnoT6BNtPHK0qbdk=;
 b=JOxbr+8z3LIJkVlM8/AMRnsPaHwlwC0GTMypeig7Km3lSQkutkuYF/rqiTrKJQpN10yI6KefWvZgkCKCmY+AxE5PTWtEeC6E73wuMFK2Q5sUA/U8MPG46MD1aUDsXJAB/ckvuf4ddzeAYNlr3KgsPUenjkdFQTIp/3QdmR50M+4EapAZPgZyYGSmxz0cYkeQHwDChJJbUum9qTQ2ABmq9pk6RPEGSXzX/8QFcANP22bqkvnbK5cvJSYL7OhYkCcuTKpY3jMCMxx8FmIJiT3Jf89t+U8DHNqNhhwy9SsAk5sfTgkeYXqx2i5cuqtFC4eRllo9Z7f2OYd+VYuJlCvhbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/Ma+lxDU7ERUeRkk9dh9RNirepwnoT6BNtPHK0qbdk=;
 b=l3XNqV/JiG23IYA+qF73071BTncVla1dbFYRLu2Be6leUANL+y8NkRhcXPH6CKqtNLfTmmNMnt4fdrvI2raumB728rKW7fkGEF8SA/gZrT7/XWv41NbzbQZx1nk54cRieLJ2pLWteebDkGgggTVPAM+wfN+C+pvVcSN9gG0crwU=
Received: from MN0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:208:52d::8)
 by DM3PPFBD8703CAB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Wed, 25 Feb
 2026 11:11:17 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::5) by MN0PR04CA0016.outlook.office365.com
 (2603:10b6:208:52d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 11:11:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 11:11:15 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 05:11:14 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 05:11:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 05:11:14 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PBB8c14039653;
	Wed, 25 Feb 2026 05:11:09 -0600
Message-ID: <166cf8ef-9991-499d-902a-58bd1e227388@ti.com>
Date: Wed, 25 Feb 2026 16:42:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
	<horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>, <v-singh1@ti.com>,
	<vadim.fedorenko@linux.dev>, <matthias.schiffer@ew.tq-group.com>,
	<vigneshr@ti.com>, <m-malladi@ti.com>, <jacob.e.keller@intel.com>,
	<stable@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH net 1/3] net: ethernet: ti: am65-cpsw-nuss: set
 irq_disabled after disabling RX IRQ
To: Jakub Kicinski <kuba@kernel.org>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
 <20260220041431.372610-2-s-vadapalli@ti.com>
 <20260223184803.739c17a7@kernel.org>
 <c9b1c5c2c5f9587c31132586fddb1921ff6824a8.camel@ti.com>
 <20260224155432.15ded392@kernel.org>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260224155432.15ded392@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DM3PPFBD8703CAB:EE_
X-MS-Office365-Filtering-Correlation-Id: 82774578-3419-473a-1a22-08de745e97b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34070700014|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: j/tN86ojUqOEFBIhw7cLMG4tg6BPqivRoM1YzyDkwAW5ULJy+Ik65R7Jkv3Vo7+97b/WGOUgx4SV5u1wbZVXmWBLP4ht1iy+k/Pq0vP8TdL6fKDy83vIm8KBE4PrCSy+6Y9TAXakhxr+AUpYI6DO2L37qrVN1U5aEqLI7uAFE7EtG6tgNiK6f16sw8icG01JH54UPKFmO637qm09IQ5ejbAUW1VdcUrqlKvG0Gpog/ehcazyXTQNFVR65/Qkp5f3ObgoOxJLxYH7SOSEvWkEj6ozSYUFW4kaqcWulsbxrTQaYsm29m7Qzlfg4O93Fse5pl9ZlCknDODQ0YmprYULy7+YhpMJ+csxRorX4gONw57SOLrQheSEv1R/BT8MuSTW4gvcpDpRqIiad1giULlxaJXGqu0ovpE7SpjgO/zsEdml89DMLF6yNO5/bOVBn40jIptFfTMLtaT9NbtPPn3MIwCR7o8jcjPg/nEL9sGOUrK7+VDMGHjhAD9RsWqeIWUIlkay0k0C56CvToGavNKrqLpHIuj5YoNueXXZPIJWAu/3D8jUiubMCfMZb228HqwzYtuuG8aEBjB0pDMNyBqyzZ8pdX/gihDFVgzisE0cMAcu6/NcioaV9p62mwG235EFtKwN6wu0SpzYh41wnK+EVkFpEw67FXpISvfHSSKF0jDCakbgVhM0E1wFZVAcvzE2Y4VC/1w+srlkg9lNaifC4Z2HYFfGMAiC6mNXjPlRQdAv9Nbg0z7Ui4abK3aCt9TArPyFjTPDAJevEFoijeFIHa8mHp5nSEa8A/AKAvCo7Vw1jrx7zvXExho4XjbAukK7hqCmQU2YFeoXhFwAfpCmUg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34070700014)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V07cf7qAV8/VsNW5aaNCP8i7eoJetY4mEtb1KWgbFyt1Gsc3K6313fVT7BQB9YXHDpKAEbWRmDLmSrklXNigt5G112mj+71QPtZbIGiZLv3xzXo6X1jNl78D/ugPHKXG+wz6xiPfvWmoZlwoja8bBOpm485Bi0iN07ExLrTTmYmz1mKzbBEx3l88CQLU9T6/VOs/A3rc37pLfCldNjqQmShXcog7/86wU495sujz/eQyvmbQ36STFpM/YcjOvNVaiJ2y/ZV6lU79MTFJ58PLu/ZAiKRj5FU8ozxKFdw9s1d877LNIdVF3dOvfnnP+IFoaXBkK8rSmfkzBWy5Clp15i9CWiMiMTIatWX1fn7HFcBMGLGnGRDN40li3jdW2z91PvRFeuI37Td6MHk2UKwFDzamo3XtXZctlkiYtOjHu2yxiO2l0mDxONDswKSKhhe3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:11:15.3063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82774578-3419-473a-1a22-08de745e97b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBD8703CAB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_031122_709263_47B63EDD 
X-CRM114-Status: GOOD (  13.98  )
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

On 25/02/26 05:24, Jakub Kicinski wrote:
> On Tue, 24 Feb 2026 10:40:05 +0530 Siddharth Vadapalli wrote:
>> CPU1 sees irq_disabled being 'true' and before it updates it to 'false', if
>> CPU2 also sees irq_disabled
>> being 'true', both CPU1 and CPU2 will enter the IF-condition and eventually
>> invoke enable_irq().
> 
> I think the races are just between NAPI and the HARD IRQ context.
> There can only be one NAPI scheduled for a queue, I assume.

Yes. An already executing RX NAPI Handler (scheduled via net_rx_action) 
sees 'irq_disabled' set by the HARD IRQ handler. The RX NAPI Handler then 
executes 'enable_irq()' for the RX IRQ before it is actually disabled by 
the HARD IRQ handler using disable_irq_nosync().

> 
>> Please let me know if this is what you were referring to. I will use atomic
>> APIs at all places to update
>> 'irq_disabled'.
> 
> I recommend a spin lock, unless you can measure as significant
> difference. Locks and atomics have similar cost on many CPUs.
> And juggling local state, IRQ state, and NAPI state atomically
> will get tricky.

Updates to 'irq_disabled' are performed by:

	1. Hard IRQ Handler sets irq_disabled to true.
	   => Since there can be only one IRQ for a given RX Queue,
	    we can be certain that there is no race w.r.t. setting it
	    to true.
	2. NAPI RX Handler sets irq_disabled to false if currently true.
	   => This is the part I am unsure of but if a single instance
	    of the NAPI RX Handler will be scheduled in an SMP
	    environment as well, there won't be a race between
	    multiple processors as the following will cannot happen
	    simultaneously on multiple CPUs running the RX Handler:
		irq_disabled = false;
		enable_irq();

Regards,
Siddharth.

