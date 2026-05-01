Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05AACD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBvpWBk7CMO/WrcxFWTVmdE0LJevmr46Qg0RrG1Rz6U=; b=FLxTIWVRaNE9jo
	Qb+WvCYViM3Lob05C82vgm/BTGX4X4nabi0/4eMOnE03qYFSTNbGnWH9g48y05YCeXbXKwjkaGaqG
	/DaMNXP9lpMWXG6j1J60aYgfpRfER1Z8XjyK0w0zKrsZjgyrBWhyzfWPn/e8tG1KdJUvp+NZV59xp
	m1MEY7hzIpSImAQWQAYZmdIIM+GTIB9qpORgFOEHI+diDKriGQIj/qjBOCuIkzHsAHTMhh0OeR4eV
	v4RP2xDWRG+pTdrgdMLzIWSNKQMJlfQIrT5F4neTBqE+XhhWbHrVIoUllsR59NlTX6MazZUDR9BDJ
	IGnhiCdkCh6qD+udozJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqWr-00000007OsO-1VGL;
	Fri, 01 May 2026 16:15:49 +0000
Received: from mail-eastus2azon11011046.outbound.protection.outlook.com ([52.101.57.46] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqWm-00000007Os3-4Ae0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:15:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ycc6RykrDFCgMJHzbSxJXUPBvUdtA+VTUCWhBgysPgoycFXiS9H2Tz4GHiMioQP4zND3yoyB61c7Xl1KdGtnqCsHGMzxpsy7mRcH2I0cTkgvnGsCTMmd4CUN349LL9A7JMHZTOIPy3RyQXttM4n3NJbxGd5U1inc7plWx2H1SvqePbZyNt/xIuCwHqQa/mjjqIB4ZVdPMxRA7RoGJZskbO09UXob+oq9rAnvhUhd90Tw549YAoeVeCdiFUXuqbr5FPjk49U/QSoDWrGoTilaITbVFBWr6/A+4MvCL+uBdt+T8Q+qpzREQYqRipv1mr3N12Z07m2iqjMcvB2/rFpoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBvpWBk7CMO/WrcxFWTVmdE0LJevmr46Qg0RrG1Rz6U=;
 b=xRPuo49BBAWums+QgHxYaDogdUE5HV8aBC4G8gQqrem9pvmbAqwV3p4D+/oAo29cIZmZCklNVCnYZ7JqRK79GE6/0Ivz6JcoaaYnhGEYouvDsWePRyTOfoWg4f7wrurvwWaEEm5cGDVrC9j8hdywRJq9FVFYY8+ynNP0QLMLiV3+v56xi4qyxi5k24aYAmISssgynyehMJr4c5bJEgPRHT2afvKTugoD+DKUygSJxPyi/ZM3uNDVEszCqeaCyKlnqAkbW7MyN772+QT2gsZx6v76RYYK6lXekujvdgL5aeOD2A9w02RNn7XYJj//MnXB1pVKCuG0gckhwzeIgVSFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBvpWBk7CMO/WrcxFWTVmdE0LJevmr46Qg0RrG1Rz6U=;
 b=gkvpWLPOIyJswp78NQj326YgXwreU+yslREXKIY+mM3b+LrARRmWkEnstMqyX88WosqY9D//i76xcVeMT8CdZAgCj4DM7jAxe1umx6Bsy5rTRxHYL+6LahsUfVPfIXx1ryG97vD/L4rn4utJFh9YDtxDUpRFXZeEq+iI5wCHfHc=
Received: from BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::10)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 16:15:38 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::c) by BY1P220CA0015.outlook.office365.com
 (2603:10b6:a03:5c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Fri,
 1 May 2026 16:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 16:15:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 11:15:36 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 11:15:36 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 1 May 2026 11:15:35 -0500
Message-ID: <b6aa8e42-632a-4dfe-9d03-5aee9ea25f11@amd.com>
Date: Fri, 1 May 2026 11:15:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name
 property
To: Conor Dooley <conor@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-2-tanmay.shah@amd.com>
 <20260501-strudel-sample-ded4d3ebf58b@spud>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260501-strudel-sample-ded4d3ebf58b@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4bdd26-05b1-45a5-64ec-08dea79ce1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 1Hut0hvdc08CZHqlZFyjM+WtmmBTq/q10xEeMO2QkaeFA/SnIjWx2lWRNJXR572nY502lIdxRC67+MsYFC0ApwNDLxk2zklWyollUK6D0VqsqvBXvZEYrMODLXRiUMOEAHmTfhKCvPbfTdc0H5+bgl+m1uWBkirqc1pBXrrcp6zfwMFLs2BO6M0QLnP7O4pKwsbdEU9o4J0MrP/EKWcY5mB4zWZ/TgCxMf0Qcms1X1djVe3Jbz9Mrg+3AaEW9ROODk39H22WRbxJxHSx04RuZQ8zZJZIEaT+6Q9XB7Cr9xhz2N0Tqlcc+Hug/GvoBD/WO2JTYmrvEhRgVJYn8nMXla9iWsxbmqC/ZA6OhDR22sHTwTXVXPPIqQfYSWRdSN5Fn9sWgP0VhQ55plsXjA7l2HP1TqkRP0WjyA0G/8alW3AWfEp4RlgPJHrpAoMLJm7/6nWo2k5nH5+JZM27F9hrvGEHnD9LAnTzwQdhjvh20yQ3uaL9EGRpDHxcacGfOuBY7Ca7701SBtIwapDf9TPIkqDaR1n8cVOIAOmNz6YSwm9ALsoqooO0bs3RVoGndrmobByPv3mEgLYNg/eKMdcZ41OFjNAJkzNhVX7vINuRW00pxb6UNfApNmmXOS2lWz5+k1Gm8Nqk+tsac95/HQkshYRKRcSAIRc85Xcr1R0CoOVxJ5xLF57z2FMYZFGEnLY+lISZrOAkMEmJmVMMKmvZk2ha76ikUom5vuE7oKnSR3Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gw2UmdgFUGChMpD+cEnszDoLRnlIeEY5X5mK8FrCwaeO5NK0Q09CHkh67jNw2b8B7JGoFVfBOkJ8fsCP9FVfIoapggOwfLbPzUNzcbdFqP1Px7xCwyR7fKobQF2nWaxItC0zVq4BaOpHAW6IfQMJHTepAezHcjxzxU8zh2LwtlaQvKBaWxMh1qbuZA3WNkHs2vUnx3TkhcWSxgFG2RDZFf+Lb1YQMhrclzQUTBHVR0OkCKIp0W5tobenIQNh5UzGK5ozh90iHLlBNSwdJb7+nV94RnvqvwMsZkRurnInJPtybDEhGhvDX6ml+1TIkLdRINMbijwLiq7xR6sWXrQLYDZJpMvC+1vR8izXIzMJra/L4PV+YCc+Yor8n8PH/ZpsHik2oTafIe4pSlkCrzkxcMAv8ZxymvPc/P6Jr9veBoYw1BoFqwY+jfgg2Du1Q6O/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 16:15:38.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4bdd26-05b1-45a5-64ec-08dea79ce1fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_091545_065294_78D5C649 
X-CRM114-Status: GOOD (  14.52  )
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
Reply-To: tanmay.shah@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

On 5/1/2026 10:49 AM, Conor Dooley wrote:
> On Fri, May 01, 2026 at 07:37:06AM -0700, Tanmay Shah wrote:
>> The firmware-name property indicates which firmware to load on RPU
>> during the Linux boot time. It is possible to stop the RPU after boot
>> and load different firmware and start RPU.
> 
> The file supports 3 devices, do they all support loading firmware like
> this?
> 

Thank you for the reviews.
Yes, all the devices support loading the firmware like this.

>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> index ee63c03949c9..ae63c3e39ced 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> @@ -135,6 +135,10 @@ patternProperties:
>>            - description: vring1
>>          additionalItems: true
>>  
>> +      firmware-name:
>> +        maxItems: 1
>> +        description: default firmware to load
>> +
>>      required:
>>        - compatible
>>        - reg
>> -- 
>> 2.34.1
>>


