Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52CEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcPAx9c5msj9PGvYGysBlOuqdG+WJGm65sEpJJbXuZA=; b=GX8AY686uucFTjELHloNWRjDEt
	0UtVmoUHa2G0xNz+TlzqH3Ch8rrXQnI5gXajg8nTTC13jS4po4NEwf3+Lt5g1Oi/qd4cJMQ9rgfsn
	KT9Yn9mJ36QVGGNldQtSeyZZjPtUsfyc9+N9TE/uw8m4/i8yqplrAnd7ArlPVtWAOAiKFx6AhQ3R2
	rSuR8G/511SPSATXee8Ebtfkww+roasJjAkaEnpU0//odiIB8rFbSsizluEHupycTvoxdZruwKBKl
	2XvyiOzuuZNJB1h5C87z1TYq5uXg1Ux35MS0C0qGrSdccV2uy3qbEZzfhf+vpW161H2Pb3O1wlEEG
	Dbzba82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGH-00000000Z7S-3QH4;
	Thu, 16 Jul 2026 21:04:53 +0000
Received: from mail-westus3azon11012004.outbound.protection.outlook.com ([40.107.209.4] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFT-00000000YEP-3XL5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSWaWriUfteiTNn8romPFZmwVt9KfZcCHkjkM/EEat1hD2vLmtpJxtmSOowSJ3ESXbgSRaGm2dS3/3oQEgW0jT2hQa1YRxXgLuC8Lr79gMyEiJw/H8N0aH/3FaHbJ7LPU3jACAP5X9gNTT3NqEamyftsCF8wFfLB2dMtsA0z+WQ2ikzvhMRqJzhBeuFC66PjyuGWWWYrTQACznAtNXkaNIcYD39agjK7SLgcSR7HEMe7t7DfWSLAcTJK8m78dOlCPNulsFoH7sX7OGe5+rmjkqOo4Fr4r1f5ARRCPp2c6BpaC9++czKYKw7f6d6zmpAbdTqTQxmEXUoh+gDYz4zSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcPAx9c5msj9PGvYGysBlOuqdG+WJGm65sEpJJbXuZA=;
 b=JtQVxpISooIsdd42K0Hp9D/J3Da73XeAeQBcga1BRyWRIQ2Oz8EkmV9KYdJGA6rLyWVjSoqqBkkh1M2r+hk7Gldg9abep41xG+gaa6Vs9EQGFxe+z9Bicxiah+N8GWTqQWPuLFp5cskivfdn0KoQOB6b8osbggrwizKfRdr4kg7pWKzQmUsb7S5jhuKmMPwGqdhBSm9rqGdx9LIRGoF66H9KSpBU9TTvvLuzMEO0AazRPkaVQAiGvkBEUuRb753+sEABjZtMleO223GKiBRe+1aXA0F28ie/SOs5d6oGSslVhUp2XM46jJSS6VPiowtolvzfEefKr+134fS04UotZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcPAx9c5msj9PGvYGysBlOuqdG+WJGm65sEpJJbXuZA=;
 b=GARpWGtvHnlvf1cZh8WbEq2dRABld7+SX5KwbRFm8EZsMzR2QkJ322PC1oK5xiT1LcamXCb4QdDEP+uI64SlHqf6VfJ67SSIYQDwL5mxhPDxJY4UESTFftFs/DiIcRfxzHwzzrqLjxiNbJpuBpI9BRjjHT70Ow9clu6mS+UvDHR1JxMBgqA303zyUu3LmdeLQBRtMSj4SLiLzZ33q1zf0HiD7cfzNKeOQee6APskFSbcUMlyxw8+Y48RySWrqDim27hFhwXYKD1WvT0mBc/X8CmCILHnuJCSzvkW2Yvz8DWimzI7RWMZswGONwHj418dXiD9D001kCcrzYXtX1OzxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 21:03:56 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:56 +0000
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
Subject: [PATCH 21/23] Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
Date: Thu, 16 Jul 2026 14:03:11 -0700
Message-ID: <20260716210329.2914625-21-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dca27ab-3ac2-476e-2f22-08dee37dbfbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|56012099006|11063799006|3023799007|10067099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info: Gsw/1NlMNZQgkuOY5h4OiPPlCouMaBFb4oP6K6OmsEcYD3RqqJoY4lGh1fHcS08Xn0QVWzzV3qq5cphpwc8cSLNgI7gf3XUSuIdGuxBmUsUm06glLbXL23EcNuq2z/MO0Y8EUd7FIrriqr2O16bi4ULROR9sU2AoukelrrgsAbCnm9qCtgvhtJKmDXA3u8n4WZ+iSda0UJCtvTdXCvWdjx5F/YJTwMMkf28PbSZ5dlop/EMFN82EouNwD8V66a2Razszk+pZAyDf2Pv+Jp1G+eqilZGv7NTfMf1umz0DpTOIxSAelctsdbCUxQCCrHfamcAJWkHg113DRQQLCTPcKWNHC7s0y/iy/a+6o99hJw/ufPK9y0FoIIZbM6R2ErFeVesIMcewmXz0nVneiU4aLj1mCia5zwvXvWhTQxCU/ObmXHpoYV0YVHB7PK8cPkluWB4Dv9KIJEm54ck7jmApypI49E6kYxxQdnpcyzC96rsSqThZrC2MOy2kd3mgC6n7FhXlhA0LmbF/JteHv6zU0+N0+YMQlLW/In6GPz8Kjca66O9DQQu90HsBCDfA2ZwKIBtWitrl1+cinK5Fgudd8wK5xdTw406rAjqCfw2znXprjbfpNGCNW94GO2dnJt12srL/LQmW5o21Qw7asH3H+9c+Fz2f6TRA7zrrM3fZh+0IxSMuf5BK6PPvtFjTm8k9LE4VWLVhm6WqZWtykpw4Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdvTGRUcVVmM2k4aUlTTnh4ZE1ld0I1L1ZVVGNmeGRuYlVIL3N3ZUhqQ0d0?=
 =?utf-8?B?Y3lkUThUdkp6djBEOEVXZ28xVk1iaitvcW82OTR0MWFnMVNmemFqak5DOW5J?=
 =?utf-8?B?R0NqNnhWN0Y1Vm9MaWYvRlY4bnpZaHdMdHpuSGdkb3dlNmFnU1JzWUFyZEZl?=
 =?utf-8?B?eFl4azJHWkhnbFdjeDA2YXlwdHp1ckNRZUFreDZ1bkQxaU1Gc1Bod2I2NmlD?=
 =?utf-8?B?elBCL0JCWVFNdTFBeTVRdnVPV3VCUS9aQkhUOU8va0p6c3BOc1I1NkpFc1V6?=
 =?utf-8?B?YmZWbDVaUUt0cnVFemx6RW56NkNmeEVyRlViL09pM0pacSt1S0FWU0VGNTVG?=
 =?utf-8?B?ZExrV2V5TGNueXRybVJNZWZBZFcrSlBhUXgrRUJQVDR6RTEyR2JwbU9HOVBZ?=
 =?utf-8?B?cHZqOVA2elp0Tnk3MFpKTGgrVDBHTTloclRob2NwWVRvZUI0ZnpDZjdibndz?=
 =?utf-8?B?V2VBOW5nN2d2SVFiQlZsNVBUcHBlV0kwM0FXRHZzdmswT2o0UVI0TzZwTzhS?=
 =?utf-8?B?Z0JabkJPVFdaSkMzL1gwdVA3OWwxUlRkT1V0WlRSNnZ4cDR0SmtENlFiREtN?=
 =?utf-8?B?WFNJSXF0SC9YVDE4aFlSYmZTU3Q3RWpUYjNya0VoNEJyTjJKS2l3b1lGZmVi?=
 =?utf-8?B?TXZEZnlqbzluWExCaENNRFFpZHVTRlBWcnNEN3ViR3Q2Y2ZHdHB4UE9vdHBa?=
 =?utf-8?B?ZkJaUjhuT0NVZU5wUnh1aDM4dHN4bDBidXFuQmtQMzlvZnhpQUlxL2VDZ1p5?=
 =?utf-8?B?L0J4Ykl6Nk40VHhJMmxmRmJFaFdZSEZXcURMMUcvcGh6eTBvbGhYaUFQVXdD?=
 =?utf-8?B?aWJISjErd1pzREg4cWgyR0VIR05EQ20yK0tJQzY4cEgxODdrOG5JdlBVSStU?=
 =?utf-8?B?WmlzYnpadkxTaHdsaFBEalM2L1NWQ3JveisySzE5TmVvZzJJM0Rwc0I5czA3?=
 =?utf-8?B?NS9WbzJLdVowN2tEak4rRFlwMU5qZy84eDlnN0ZadkZhNlVLK3F6YWlOdTg2?=
 =?utf-8?B?NGJEN0dxNWNacDFyb3FXaHpUaS93bmpnSUZNRmhaenBGVkVyU29QbzA0Qm1E?=
 =?utf-8?B?OC9KRGJmdFNNSTJjdW9ZVjZDNlRMZThqaWhVdzRmQjFSUVR2dFYwR2p3WVNw?=
 =?utf-8?B?SmU1L3R2RnZqVjRHWlhIOEdWcXVTSDBGUWNyME0zQ1RtcG9BV1Vjb3I4cTRr?=
 =?utf-8?B?eFRYRk5rSUNyTmtTKzBIeTNsd0JiTG5jS3dteUUxZUtPQVZ4clV4S1phNXo3?=
 =?utf-8?B?SE45Y21pVkpObXMrSk81UnhsQzhIa2toQXloWDVkeDF5OEV2TTJNY1BQOVlD?=
 =?utf-8?B?UFIyVVRiZTluWFdEOXJGQ0orWkFzbnMvTWtwTnJJWVJuT25kMmM0N3FxanFF?=
 =?utf-8?B?NUYzYXFILzRpZ29JdXRpdjJSbWttVmlnNHc4OFQrRWo4TFRBdTBkY1ZBR3Fo?=
 =?utf-8?B?QjkzYWJycmsxWHdnWStaRzZRellNZkZTcWg0Z3hDK1F6VFQzdXExL2I4ajdy?=
 =?utf-8?B?TFBHV3EvRWNQOGZ5UjBJRVkxUWkyclpkRkdnNjlSdUd2dlNDdEJQNFp0QVNP?=
 =?utf-8?B?YnJNL2tmSW1sVFQrRXQxdkhFc2hFanYzZk9XbnIzOG9UcWpHYzJ6KzZzb20v?=
 =?utf-8?B?RGhGZUVIby9SSmtxY3FGUFFNV2xRVTk2blVSZm5RMDFabEpmTk9NaEQ5aGkx?=
 =?utf-8?B?Rm05aGV1ZVJuc01lN2EyYXV5ejFsdmU3UXBNbTFGbDY1TE9rSkNmZTVieHV0?=
 =?utf-8?B?aVM2MVc0RVJFY1NoZUxScEF5NktvQWxrQ3VSdFVGQndmUFBFWVJESXdCTEFV?=
 =?utf-8?B?ekZPbDZ4R25qYUFjSkU2cFBOcitIbS9FOGJ3WG1NWEtBK251YWtQdmMrRzM3?=
 =?utf-8?B?bzZmUE9qQjAyOEluYlFHK0FrUHNTSlJqbHlVbllUQXk2QVQvV09Xd0c5SCt3?=
 =?utf-8?B?akxBL25jRDhRR25idCtNRHJIQ1ZxOUYzQnowbkZ2TXdzYXpmQjZPZnJXeitp?=
 =?utf-8?B?d3cxQ1N0QklLL3RabVUrT2lCKzRQbGFTbWRYbUtqU1RETnZEbjFxOGxxNTBq?=
 =?utf-8?B?RDlFQjMwNmNjRG1BWi9vQi9Ua0huM0tKQmpJQXExZTBhZ3YyLzZvUzZOL3NN?=
 =?utf-8?B?UVZHd3F3NDVNdFp4c09BWjR4ZDk4bkw4QnkyYUo2QUVUVVlrbUxYL05ERm1q?=
 =?utf-8?B?V1h4UFVRL3VRRnUzNGtKZC9ReVR5QU03SDhTUHNiRDJYRldYU2VuQkl1enRK?=
 =?utf-8?B?cm1tYUtIcm03MDA0Rmx1Mk43cXY4dXNsMjRxbHFiTytzNXlyNWxNRlFaUFdw?=
 =?utf-8?B?K0JGN3Y2Z0VpZnBsaXU3MUFhZDBGOUxnbDVtdGtyRmc5aTBKb2Q1Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dca27ab-3ac2-476e-2f22-08dee37dbfbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:56.1564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3pW/95tJpLWd5661SjayMklCy5LmgVvEhg91wSyFP+0QgIHCgIDpuITD0SjPFOD8FCsYtehO/okaXbh7wYgOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140404_028892_730B115C 
X-CRM114-Status: GOOD (  10.79  )
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

Add an ARM MPAM specific example to the generic "MBA control emulation"
section: the concrete MB and MB_NODE controls (their scope, status, and
schemata identifiers), how MB_NODE emulates MB in legacy mode, and the
resource_schemata subdirectory layouts for the enabled/disabled MB
combinations.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index a88ea9c2a386..6027b2f9aa15 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1087,6 +1087,58 @@ down and recreated, so a concurrent reader may briefly observe
 the control subdirectories are informational only and the actual bandwidth
 configuration in each group's ``schemata`` file is unaffected.
 
+The following illustrates one such configuration on ARM MPAM.
+
+ARM MPAM example
+~~~~~~~~~~~~~~~~
+On ARM MPAM systems where the MBA resource is backed by a memory-level
+MSC, the kernel exposes two bandwidth controls:
+
+``MB`` (default):
+	The legacy control. When the L3 cache MSC has usable MBA hardware,
+	this control is backed by cache-level MBW (``mbw_max``) hardware,
+	its ``status`` reads ``enabled``, and its ``scope`` reads ``L3``.
+	The ``MB:`` schemata line uses L3 cache identifiers.
+
+``MB_NODE``:
+	The native, node-scoped control. When the memory MSC has usable MBA
+	hardware, this control is backed by node-level MBW hardware, its
+	``status`` reads ``enabled``, and its ``scope`` reads ``NODE``.
+	The ``MB_NODE:`` schemata line uses NUMA node identifiers.
+
+``MB_NODE`` is the native control that emulates ``MB`` in legacy mode
+when ``MB`` has no MBW hardware of its own.
+
+``MB_NODE`` is only created on a memory-class MBA resource, and such a
+resource is only registered when it has usable MBA hardware, so whenever
+``MB_NODE`` is present its ``status`` reads ``enabled``. (If ``MB_NODE``
+is not supported it is simply absent from ``info/MB/resource_schemata/``.)
+The control subdirectory layout therefore depends only on the ``MB``
+control's ``status`` (the trees below show ``legacy`` mode; in ``native``
+mode every control is a sibling directly under ``resource_schemata/``):
+
+**MB disabled, MB_NODE enabled** (``MB`` emulated by ``MB_NODE``)::
+
+	info/MB/resource_schemata/
+	├── mode
+	└── MB/
+	    ├── scope                     # NODE
+	    ├── status                    # disabled
+	    └── MB_NODE/
+	        ├── scope                 # NODE
+	        └── status                # enabled
+
+**MB enabled, MB_NODE enabled**::
+
+	info/MB/resource_schemata/
+	├── mode
+	├── MB/
+	│   ├── scope                     # L3
+	│   └── status                    # enabled
+	└── MB_NODE/
+	    ├── scope                     # NODE
+	    └── status                    # enabled
+
 Memory bandwidth Allocation specified in MiBps
 ----------------------------------------------
 
-- 
2.43.0


