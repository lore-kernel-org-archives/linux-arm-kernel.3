Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E726ED30CC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOVSUEmA+5YGrwLznEGs8t4Q4Plg1JGBU2ouSDKSA7M=; b=AzChW4GouQX1hrlDb5YuFYC4Ty
	S/yqep5M0mLXtDIby5jc3r2pYXBwfoWsHrNPAiJCM2K4bP3+ZwoDnJW+7IlUARuZpMELt1hS5K1mE
	HjtyZDQM8t60lOFQEBhIYWPPKJsbdkfcrO84mJP7sJ3Efcv8OiCAf/RLJrmgphlho3TB9Z9NoLu9E
	tIqsy001fukYSW2Vj/gsf5NgQef+UytgSXrAOt56wQ1euf0rgLz9z4ZnpKpGrrP6ads0cdeY0/xQ6
	rDcXOBg8o3OJqYthjUjtGhvTsbihuq44Y9mkRsZHn2sONYNlWVi/FFWtkD9/YoJOEoEX3WAUKbF7T
	vzRWu6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfl1R-00000007gsM-1nsQ;
	Tue, 13 Jan 2026 20:29:49 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfl1O-00000007grx-2wx1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 20:29:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gev9LykL6C0u1+y75RmDiwqVx0zFraB6yftJO09iRrlkXhoOJDQEQy5bPY+IlxXmx1Vcm+U78Unl0Ggcp5za/NIKeON+OQLuywyymQZHQJ1/xwNS8+5Tk0CvDNheUwuf2nAXBKkxYHhQUVPuM1J046z4JOEMR8OKMRBzu0J57xxCbd+YU4DrTHVeFR2DS1YFIsbxcYKVssSkNhnjUkWpmimoG47aXa+kQwxTsjUwPkRG+06Loh+JeAt9lAH3lVaIJKsLO030/DwWCu8IjGeEeXgQTvYDj77y1ElvtymLpgd65wIdrizbuJ6xhMufTsmj81cYT8nPFtObR0HamBdJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOVSUEmA+5YGrwLznEGs8t4Q4Plg1JGBU2ouSDKSA7M=;
 b=EvFJ25gDWo7xofcK6twOp5CGAlrHQ6AN/EAg1/ulH7EiS7Q3dDAfrzfMYBdCO6iWwKF5a6T3FAUllyvlqSEG3PdXETakE9A0KMoSnsAJY4IO/9UEPJMP1HpXHmkMcTZZ9enL/BgK688idMb/4B4sdf3q8hGhiIGvAMNuwWtlEqIM3cndJwQ4HdcK5sByF2oWaa+S3kn7DuHOr7j4C9oSi45Go9JjlLwSTgmiPJMMZSj72QIRsjni+ZkL2T7crQAp3BJ+gIN18abHm4FuNBfnCnDxkT9zhA1TXOKdUDHJkkep/Iu64Pq8fl2YjZmJflJOJ4V6BIyspTk5x7zkulCSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOVSUEmA+5YGrwLznEGs8t4Q4Plg1JGBU2ouSDKSA7M=;
 b=NQXI7t8o9YzhvRpCcHWd4nLBx8U8a/8UzaIQ9qYuoqFa8ASIeceTZI5qNuTu5Yh1IBsg4MlOQhSdToR28k4mnwDMYuv9CfRmQ+tK4dpUDLECNJCOk/yu1wBUqIVaCurO1Gzznw2wityiFcdwJJ4JaLJtvIokyibGgAO86Fc5lM7XsGSsAtFMXLC7tLsAcgueifW5ppMDvnfy+nr0tmZbMnByYeePy0kuGnqE4HteIjbPhKtCwA4Q0dFMUNuMiYvfDO+eoxiuO6lv/DbSfpnRbHEXsuwBgyjjF4OX+Y9rFlCMxYfiw7DLGiuUm985tBIcZF6DvX0rbX/d44fpIaHCOw==
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:29:38 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::72) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 20:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 20:29:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 12:29:14 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 12:29:13 -0800
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 12:29:12 -0800
Date: Tue, 13 Jan 2026 12:29:11 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aWarF90zBqxD0Gef@Asurada-Nvidia>
References: <cover.1766093909.git.nicolinc@nvidia.com>
 <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
 <aV7OBrH-TDiGRblt@willie-the-truck>
 <20260108003646.GA537728@nvidia.com>
 <aWUY-f3kvM94z4qh@willie-the-truck>
 <20260112161010.GC812923@nvidia.com>
 <aWVETpwlx9Rhs8Kw@Asurada-Nvidia>
 <aWZfUNXEka3GBf9s@willie-the-truck>
 <20260113161253.GG812923@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260113161253.GG812923@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|IA1PR12MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 5306d447-d491-4df8-07e7-08de52e2792e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QFctNBq0dj6UJbNajpdRezXL0+wJKE6Pe+G0zMAYjhBke0ExQ/52BIX+nS5z?=
 =?us-ascii?Q?T0zzaAoqRJ9UKP/EffXXuWi2+s3uEV8ZdG0i2pYU96FXSswVuTKSSN2dz2c2?=
 =?us-ascii?Q?i6nFUisUQk2P9vxj+D9Qe0OxEXEZIdFlKjswZeIMSSzj7O8u2JeHjVZIOWo0?=
 =?us-ascii?Q?y7b5VIL+qqvfcKLzwUyE1fXzTPxPCmhAJ+YG9S9I3b2T+1j0WUhESLLlEk+1?=
 =?us-ascii?Q?7HDHwczS3cbV2dTVvrL5hOEnmGw27nZYcw2B0s9q62bl4yGGyxJAomW9DuqO?=
 =?us-ascii?Q?Gc2+6cfhVX2O6DkwgU2GgvsHnGVgy3Ax+KVLMwdX3dNHOcR/Bx4XxiJxYOCh?=
 =?us-ascii?Q?RHpz/6V+/AcrijnvEHbdqGT8Cmd6n3SfNF7uYpxCWEvPnslKD3acKHQBpwoF?=
 =?us-ascii?Q?FIaBMobXZodc6rMnVX/Eoy/SApWIsmX0WskvrGzr/8DW47gPBYXubXpY9/Hf?=
 =?us-ascii?Q?Bf7tiSA1Yi0Iq5HdcObplRBSOHjyrE2HhlW9N0GwzGQ73VF1mGSnb8tpUkcQ?=
 =?us-ascii?Q?3ODsruUTCQSEij6St5bbGEi9CJXs/aLjWSX+i6pkvWWz09ZSeoAAxsOaUoTG?=
 =?us-ascii?Q?1o8IT7pmDmgFh8sEmLlDkZY28WeoHm0K2J+xs95MLG6nRxpVky0YvgMVF9jb?=
 =?us-ascii?Q?6Ej3jKuHK/5w02j+iV+bTnPTgxRGnAMPSN74LDwzY1yMS2kt8NdIYVribhZy?=
 =?us-ascii?Q?xQW+43IFC57XLJ3WtLqF+9a5YxWN5XjMRKFUFTc7rJXKNn7TBzzpBqIO37Qu?=
 =?us-ascii?Q?6qeS97GVzmxoCqhKXQ9/FmE8/xGMf0QshIqO/4DNkEY0pG0TtQIGwB4LVfGu?=
 =?us-ascii?Q?1IxYI8EZdjHzWv2kQvBPBv84EFczYwSis0g5cCeCdA14ZfwatRs3n3kUa2if?=
 =?us-ascii?Q?IiRk9Ppaol1i59f1diM3EaB4M0rZvLZzI9nwtJUq/Pu9QYjbY5TudbC0tyVT?=
 =?us-ascii?Q?sIuyOztw99xyVJhsMb0mnj9dTr/4143ei6fJpKEyrKzZxPzrU+PNH6BjgL+E?=
 =?us-ascii?Q?zsFrMCUicXqjul4Bj1SGDAHOH07EPBzXUYqfDY0TYxdOH+7qx6ezlR6K+/q+?=
 =?us-ascii?Q?ak/HLhtAs81NnIXjGm6Oao5Hn9GM9CvmjJDFkS0ex5aeKeVYAIEO9lhtWedi?=
 =?us-ascii?Q?pT6k/+x1UIUGOWdLUTLhq9loSt6FDyJ5cnnc3GutwPb9oZ4hwkXs89E+yElx?=
 =?us-ascii?Q?2Jgw1xGjrJ3jHXtaz7YjDSHU6O2kjkcMIkw0c2W7AFBCC/RoRKs9QadjHiaN?=
 =?us-ascii?Q?o2bKUYv4wizEcXg1v6mmil85L8LS7S7nbZbMPV7nfNsS4MlCiLde4jiUNYkc?=
 =?us-ascii?Q?FoPrPCbgo6PvVVf/pRYPHGqmV8+7NMqx0hH55SoCib7aYlq9LdhE93R75F/i?=
 =?us-ascii?Q?KJhj+muZBl155byFH9xHu9/T7F1I/NLWMoTRIUJnmb78QrXo+bPzVq8azHA/?=
 =?us-ascii?Q?lqst6yNBiSyU+C0lHA2Dizfbw3OPQo46WcyHec9J+ZHoEIady2ueyJEJsetw?=
 =?us-ascii?Q?sUfIBeNEw00GUPGXJeVb5jKdWx0W6v6hV+m+audJ/VpP4zGWS33/0Nw5uYBT?=
 =?us-ascii?Q?M7ndA7enZoFyzwTEu6A=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:29:38.1073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5306d447-d491-4df8-07e7-08de52e2792e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_122946_749664_77289508 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, Jan 13, 2026 at 12:12:53PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 13, 2026 at 03:05:52PM +0000, Will Deacon wrote:
> > I suppose we shouldn't ever see the case that they both have S2S, but
> > that's fine.
> 
> If they both have S2S then it works correctly? Any S2S forces EATS to
> follow the normal rules.
> 
> > The spec also suggests that there's an additional illegal STE case w/
> > split-stage ATS (EATS_S1CHK) if Config != S1+S2.
> 
> The driver doesn't support that either..
> 
> It is fixed by checking if new EATS is valid under old config and old
> EATS valid under new config.
> 
> Also to support S1CHK someday we cannot allow the hypervisor to leave
> S1_S2 and go to S2, since the HW can't deal with that...

Perhaps the safe bits should only have EATS_TRANS, excluding S1CHK:

--------------------------------------------------------------------------
+        * When an STE changes EATS_TRANS, the sequencing code in the attach
+        * logic already will have the PCI cap for ATS disabled. Thus at this
+        * moment we can expect that the device will not generate ATS queries
+        * and so we don't care about the sequencing of EATS. The purpose of
+        * EATS_TRANS is to protect the system from hostile untrusted devices
+        * that issue ATS when the PCI config space is disabled. However, if
+        * EATS_TRANS is being changed, then we must have already trusted the
+        * device as the EATS_TRANS security block is being disabled.
+        *
+        *  Note: now the EATS_TRANS update is moved to the first entry_set().
+        *  Changing S2S and EATS might transiently result in S2S=1 and EATS=1
+        *  which is a bad STE (see "5.2 Stream Table Entry"). In such a case,
+        *  we can't do a hitless update. Also, STRTAB_STE_1_EATS_S1CHK should
+        *  not be added to the safe bits because it relies on CFG[2:0]=0b111,
+        *  to prevent another bad STE.
         */
-       safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
+       if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
+               safe_bits[1] |= cpu_to_le64(
+                       FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS));
--------------------------------------------------------------------------

@will, does this look good to you? I can send a v7 with this.

Thanks
Nicolin

