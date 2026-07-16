Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BB8C4451A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXQk/uaXX2G3TF8vPU244x3nFPRdRUJnn/otnLZHetg=; b=NlK18dp6xX7WYOeSaEubK02qU5
	C45g898zoesDQGFg8Xtsw/Cu4TeMvEC5JUDyXirIZHuaEmPNBJ2KsW3tDvrkDokLPLKcfHd0DpEAt
	YkPMrEIRBROzZ/D6EBeyvaVBz/QNtcXaG19Ub3y/i5YIkwzTjn6V3T+zrT44i6/MBrLSPGctSO9Tv
	j5iOS2bFcGxvw+R6dR88bdMz6n/wtl0u6iKt1EGrWl1ZBzqTTpevk2PmYArWpTQJ/wgZcTuPC+uu+
	OK8GmgKWNsTMtWAwtvZEAYjFpJZPdjdt4oqeJaDXdLfEXDVL0iNk8AIpkNDVJ0/fnHXsGOwOz20Uq
	TKNtfuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFT-00000000YHb-3Tcg;
	Thu, 16 Jul 2026 21:04:03 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFG-00000000Y2O-3suD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4qkaUrcCMTuGRn48HQG7Q06A6tfI2BISi+lCpSbLmTn1UbxVNa1u675Nf9qtpWPxS3uWO4R70W4rQuFEqH+dWvV9TsKfGTLFnHiB0kqGI3jmpMoEHlPDAVu2HFScplkcm5rsGNLD9HVdmZrpcDdCaBfb8nf4axgr/vAPsddALrp5KKzwvRUlMouEA6ky8aE7OPSsy+2J/XbiLGJREvLR3xDKu8+qqtxUI7XubK4Nmr9Ikdz5TKqxiC99i9Ix4ZULF2eU34DpBiM6cwsmMQkiMwmmL9RZovxIlN1mk9MVP7+ahxvJNltfQaHDDMDTNjWt9Wop5S2H3CSH1cbtAQNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXQk/uaXX2G3TF8vPU244x3nFPRdRUJnn/otnLZHetg=;
 b=WoNx3gCd7S8q+/29ruXqwOWSpJe2BWPogPKNRkwBjLcJyVPIW7xzzaoDgiHsiaVG1XiaRHO4vv9MFftFFe2t/Wju1JaDzuQNZWAOqglJ0ytfDnGElJp6qeKGgv465ycOAL3li60eXHFaBaAKLiuKoTvDzyfpAAJ5k2vZrzENw85Kg6YIbbdyuFROFbmatn58JpBS8rDe87cmjq3gxu7Ky5nUZXH8UodniUwEW/0fPlOMvauaQnY4VYRikkFQXwMQcXg3jEBVXehC9eBnF12y8BW0upHPoHiAOD0XGcTmRc9O5JJwkDJcLx02BctJyIhB2Goz9R/J8tBIVBW+yyB5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXQk/uaXX2G3TF8vPU244x3nFPRdRUJnn/otnLZHetg=;
 b=hmvkNhoJ4hN/QNX8HixvR24diAyckuZAuUp9HH/j3SN0mWeDR7dxtrQ7Yvqlq187QMpW/zBxI1KgywQRLqbdiWupkk3wrEzk+8I+M0B2CSWjDZBwb/VxwVr5VNgbe4xXHPudM734FEx0apNc27RqKkrN27bcj+DHQm9y4DzSG1kuKNaUHUas6tvZMla1ya33l0FBuaQ3uivLHzdr0eZjnkKHyT45B6pKbd+dbUYb2Ut0V8lFvyrJG3FUjsKStWiPJ1g/OC7V8QiNeT2FjvjGSS0C6xIDbyjInlTVhFjIHLqg2yBipReh6mOpqZ/hn1Qe4AoujoD4Q9/z5TkMS/XbXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:40 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:40 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH 08/23] Documentation: resctrl: document MBA control emulation
Date: Thu, 16 Jul 2026 14:02:58 -0700
Message-ID: <20260716210329.2914625-8-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::8) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecbfdb8-30f9-4f0f-624d-08dee37db65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|3023799007|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: hpboZpTImorVRIxSN6IhIGZa1xnrZ1Cqi6wxnIXseP+HHlzIDMFYbrNhucAqqhGaphI4s9bnhOphP5/tisT/bB2Ow6z/nrHB2rp6+z3noKFdhVg4DDLIcddyAnrCE0x9LyD4PDtLIzA3f+PKMwtJxftP9Nn2pY6qAw45zJZiiUVa4yGa6fqQ3imbMK8Xm0Gc9yF8qKWKe2E1dPr6/9o9pLi6wQNrsXa4kpc9s9fM5i7mCg65r+FyJbWeo7vBIq0tG26hkhEe8GkRhyLHQ72OVVYPjQ9EQiP7Ks0VYfT1xbVL3TBc3RqGzUUda2E59I45AXmIb5c80sVScGGENXPwd/eN2m416TtEgtoaS3JJb9GU4h9/MlCLc6hLT/A1ig+7AV5RldqJRORgdJ8HwVsR8ybCZI8Q9kTanbh04DcLzRnzowTsFyVNC11Q+nmhQMMxKweR5wKSqPNtAFjzU64MgjDgqzQAxrbbsK5MiL4k6hRvGVi/OAV0tIO2Cudxftp1nnOOej33wx9MgkSiMKrhkoOSiI77H9LT6pW+cLOPk6m7fXDzWexm0j2TdytYgk9ln5i/3R8HqWD83oHW5qcr79u2sJUTeW02M2COJ6TQKHujRZJuY8+bfHX7BZuP5H2FHjPXBc16rIVhLrTVtNxE3enOmPKArbZTR882/CyY8uwBfy3kouFT8ZgV2IRvQkg8twd0Wj7T4ydrGgionX2l7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(3023799007)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i04t9tHFvw12WhZM0ha6GyYairdUV60SEwNlzQUOYo0JQrdbBraSMjixqkur?=
 =?us-ascii?Q?abVJ6jwre5iwBULXo4yNeJrrxSmm+wHxgaWa8ekaj1HGxz1TqfkeDamvhevY?=
 =?us-ascii?Q?hYPbXWNMhV7L1usf7R2hdpGU3DuFBldSET9uxYEPWvWqoX+9saZJS5Zbj7Ti?=
 =?us-ascii?Q?PKv1NabkYS35UQnJMOIR5t0B1lQ/pdECBNsJmA9XnpYodxk/QN7WT5l9B38T?=
 =?us-ascii?Q?1M/5NAs0/+gaIyBQLk2i5HzzXK4hAimk7rPwGVxhNMdL0Xl930YO4o4Eyyb1?=
 =?us-ascii?Q?6HWgnMlXE9J3bB63pDD0jCFl1HCxymVIZa7jb+6aCkWCmLdt4t1/DzDyUxJ8?=
 =?us-ascii?Q?Y09aSPK8R6yW54i1PGWZ1GcHqUtfxC+X51ua+wx9hgOxl7IXunpUw6817KE7?=
 =?us-ascii?Q?nHTgfBx/NXzsMU9sxymankIxWOPjnyrF9mNUzL3aiSZYQAeZ3jteDIN5UnW8?=
 =?us-ascii?Q?yDtDtvm79wgkHyTjXVOs1jyLlX5wae1P2Z+mdw8JryMpUAA1VFgXzKXHSxYa?=
 =?us-ascii?Q?r3jiamPDAb2OrsemUc7HFqs5nPsW6lAIUpl2wxRFEd9HUBqdax5yISwyG6bV?=
 =?us-ascii?Q?E+7rtiuPAky97rzGWh0ROJCqNJtPg5bmZCS1SffKS713oqJHv3zz+01iWkN0?=
 =?us-ascii?Q?CQ2gn93wtS+rzJERNJMTvUltZ04zTOKBAGSPxPpFUH0PfIj4I/IBeFPf51tq?=
 =?us-ascii?Q?28iP1A9RLLTtYDKqUQqT4hY9kL4dUw3J3xhePtYDCBj6yNnJDeCuuGWZTf73?=
 =?us-ascii?Q?2/0gV5uk/fz0BXmFzR9DOtE6o9Sr7CEVx5zbpu64J2crJbzLlvMt+rdKZnS4?=
 =?us-ascii?Q?MzM13OId2F9AkdwxXfkASVjdswc7us6jHcCpSs8qTcd/Eeb3j1WIlazSNz1B?=
 =?us-ascii?Q?SsLSbapNH8c2ujqiIJVIbeEOrJ0y7zvmabnSq43oNJf1RYABqJgrg/+YTsh2?=
 =?us-ascii?Q?cgH5Fr3Dy3v6/quzO5cHQqoeCj9IRV1Js17xcGbh77qNVT3gYlwjKWyqIFuW?=
 =?us-ascii?Q?Ta06WytsrE4sG5v9ftoJoS6XK9STdAkvANP7xEbkwohuD+Ga6mUly1EH/QFF?=
 =?us-ascii?Q?P6O2SEn3qUeOGmXRBKOTkkAuu8BR+AY0fNV025HTtZw2OJarpcV5NzsGntOm?=
 =?us-ascii?Q?h8yin2K+LDUktej7xe7XKJCdqBzyUhX3cxUyK3kHwSdOnMiFh0oYEEaW8IsS?=
 =?us-ascii?Q?47T3UprCYZobf1T9tkma0MbXPRabRBjdQS5CtC7I/LR8jK2WSUzWyKOPIwBQ?=
 =?us-ascii?Q?TyXnLVhHDFtKu88rdCGTMt23pFmNWEsy0r0S2SjVPWzg1/V9oQ0ovA6G9Fnh?=
 =?us-ascii?Q?hN9nnRtqfMgOG7WMavrjkVSjfNsohJTaPAcjNJkgYI9QDIUhqmY/hEWGaKFM?=
 =?us-ascii?Q?M+lOwho/EqxoRk4eShfKxBJOx7gyqvzUtuW191eh/6+oYUwWSjN6h/nN5GKw?=
 =?us-ascii?Q?F0bpq5gOz/NHs4x00pEynNLD0AEpZYX336KBV398X/QCQlYiUjb4qZDOvUGR?=
 =?us-ascii?Q?i6PfAyAA2nmc3hBGuMoXqCiQZQCUPcWOfBdiF76Cccsq3ufs1xZzRVBXM890?=
 =?us-ascii?Q?+/zKwHgxfIr49E7ReCwQ37PNFM93ufoSkwW94aiAPbntUt1BQywH86z7fovf?=
 =?us-ascii?Q?ch1DWZDhfGfhVlP6bSRLqlQ9rDFcHsmP5duV2y5v4TUkUfTHMN0YxtMrRCIq?=
 =?us-ascii?Q?sf+pIPglq8/VnEdmNyRK7lukG/dsBlWkWPCXWpawPPBbIxb39ZZsj7I5b7LC?=
 =?us-ascii?Q?6BuZZNqHag=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecbfdb8-30f9-4f0f-624d-08dee37db65c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:40.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0SOv9HiwnOojwDy80XeXsXGmbcvbyh68LG3q3vOH4LczvuXtxD2WxHizaosOJydtC+VIsjfCkQE+kXpRtUbPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140351_014995_221BF0D0 
X-CRM114-Status: GOOD (  16.78  )
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

Describe the generic resctrl mechanism that lets a native control emulate
the legacy MB control so the MB: schemata line keeps working for existing
tools when the default MB control has no hardware of its own.

Document the info/<resource>/resource_schemata directory, its per-control
status file, and the writable legacy/native mode file, independent of any
particular architecture. Architecture-specific examples are added
separately.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..0de86d00c0a6 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -81,6 +81,28 @@ to modify those settings.
 Each subdirectory contains the following files with respect to
 allocation:
 
+"resource_schemata":
+		Directory describing the controls exposed for each alloc-capable
+		resource (for example L3, L2, and MB). Each control has its own
+		subdirectory. Control names are formed from the resource name and
+		an optional suffix when a resource exposes more than one control
+		(for example ``MB`` and ``MB_NODE`` on MBA resources).
+
+		Each control subdirectory is read-only and contains ``scope``
+		and ``type`` files. Bandwidth (scalar) controls also expose a
+		``status`` file that reads ``enabled`` when the control is backed
+		by bandwidth-control hardware and ``disabled`` otherwise.
+
+		On resources that support control emulation (see "MBA control
+		emulation" below), this directory also contains a writable
+		``mode`` file that selects the active control mode (``legacy``
+		or ``native``). This is not the same as the per-resource-group
+		``mode`` file described below under "Resource Groups", which
+		selects shareable/exclusive cache allocation. Switching emulation
+		modes only changes observable behaviour when the default control
+		is disabled and emulated by another control. On resources that do
+		not support control emulation, no ``mode`` file is created.
+
 Cache resource(L3/L2)  subdirectory contains the following files
 related to allocation:
 
@@ -617,6 +639,10 @@ When control is enabled all CTRL_MON groups will also contain:
 	file. On successful pseudo-locked region creation the mode will
 	automatically change to "pseudo-locked".
 
+	This is not the ``mode`` file under ``info/<resource>/resource_schemata/``,
+	which selects MBA control emulation mode (``legacy`` or ``native``); see
+	"MBA control emulation" below.
+
 "ctrl_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the control group. On x86 this is the CLOSID.
@@ -966,6 +992,73 @@ Memory b/w domain is L3 cache.
 
 	MB:<cache_id0>=bandwidth0;<cache_id1>=bandwidth1;...
 
+MBA control emulation
+---------------------
+Some platforms expose memory bandwidth allocation through a native control
+(for example a node-scoped control) rather than the legacy ``MB`` control
+that existing tools expect. To preserve backward compatibility, legacy mode
+(the default) keeps the ``MB:`` entry in ``schemata`` when the default
+``MB`` control has no hardware of its own. A native control emulates ``MB``
+behind the scenes so user tools that read or write only the ``MB:`` line
+continue to work. In native mode the disabled ``MB`` control has no
+``schemata`` line; tools use the native control's line instead.
+
+Nesting under ``resource_schemata`` and schemata mirroring take effect
+only when an architecture driver configures which control emulates which
+(for example by setting the ``emulated_by`` relationship described in the
+kernel API).
+
+When the default ``MB`` control has no MBW hardware of its own
+(``status`` reads ``disabled``), it is emulated by a native control in
+legacy mode. In that case:
+
+- The native control is nested under ``MB`` in
+  ``info/MB/resource_schemata/``.
+- Schemata reads and writes for the ``MB:`` line are mirrored through
+  the native control so both lines show and update the same values.
+
+When ``MB`` is enabled, the native control is a sibling of ``MB`` in
+``info/MB/resource_schemata/``, and the two controls operate
+independently.
+
+Emulation mode
+~~~~~~~~~~~~~~
+Whether a disabled control is emulated is selected by the writable
+``mode`` file in ``info/MB/resource_schemata/``. This is not the same
+as the per-resource-group ``mode`` file under each ``<group>/`` directory,
+which selects shareable/exclusive cache allocation; see "Resource Groups"
+above. Reading it shows the available modes with the active one in brackets,
+for example::
+
+	# cat /sys/fs/resctrl/info/MB/resource_schemata/mode
+	[legacy] native
+
+``legacy`` (default):
+	A disabled ``MB`` control is emulated by a native control. The
+	native control is nested under ``MB`` in
+	``info/MB/resource_schemata/`` and schemata reads and writes for
+	the ``MB:`` line are mirrored through it. This keeps the ``MB:``
+	entry working for existing tools.
+
+``native``:
+	No emulation is performed. A disabled ``MB`` control has no ``MB:``
+	schemata line, the native control is a sibling of ``MB`` directly
+	under ``info/MB/resource_schemata/``, and each visible schemata line
+	only reflects its own hardware.
+
+The mode is changed by writing to the file::
+
+	# echo native > /sys/fs/resctrl/info/MB/resource_schemata/mode
+
+Switching mode rebuilds the ``info/MB/resource_schemata/`` control
+subdirectories so their nesting matches the new mode.
+
+While a mode write is being processed the control subdirectories are torn
+down and recreated, so a concurrent reader may briefly observe
+``resource_schemata/`` containing only the ``mode`` file. This is expected:
+the control subdirectories are informational only and the actual bandwidth
+configuration in each group's ``schemata`` file is unaffected.
+
 Memory bandwidth Allocation specified in MiBps
 ----------------------------------------------
 
-- 
2.43.0


