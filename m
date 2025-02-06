Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA87C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7PuHbEkj9bxXyvOy4Wft90fnvSqXXP7HOWdWuclOYE=; b=by9RYjyosVi2l8yT7VlBgNSKdQ
	NWb4wYgx1HaOVc4wSmE32veKPo6ptdSGUzE7G9M3Z3x5eu8Mn3t+vBKuHKszVd5pWN1Mkg55zFscd
	yenhAynxMYFiK7F300ve/46Pkha95EG6IrromFuC2WNt4nTkMj+EuOnMAREkyy0d+z/wAuqkqTBh9
	7T/5mfyNLfkvpwYXQDvuu//uhWQnsBAl8pdY9hGHkRONTa1SyLdF1RQjF0GRLsUJ5BD6C+52b9YVU
	x7fK0+b5Kt5jMTPR7QOxmcBPo1yzSWGj3izdGcqjtU1HjLbF+ExUpO74iDz/6qaJNXd4FzlMitbzB
	aLrzopIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg50w-00000006to2-157r;
	Thu, 06 Feb 2025 16:46:06 +0000
Received: from mail-westcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c112::] helo=CY4PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4wt-00000006t6U-2N3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 16:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgHbADJNJ6butUAPK4PmPaJXe8voyPUE21/hxLLYcXXySCZRkJCYMJTXpLpsKKzWxkFPSD1VgBwL3QDLDnesukgq3goXyb7c4gYrQBWjyy/SG0y5M4jDy0xoch1Sva0MXQPbl7OsPHYn/UhKwFKueyomJilgxdHX06zFXHOz+m1GATLzuuyJXk0gV42Rd43fe4viJi6QpazQKb5C5C+LYDVBsqiG7BgNyUTTKfb62BoVcKcAgVUi0HGA0zQoRns0ijEbhhKH/A6PsiMTVe2ElaglcgNYibEd9gE0VmFIPDFplUmTmRNzNeuGqYwTjWIn5mZQao5tat5CeCEjiqQ0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7PuHbEkj9bxXyvOy4Wft90fnvSqXXP7HOWdWuclOYE=;
 b=dhla4iCFrWWBocUpqA99jc8rkTllP+MNmPUKhLS5BXqrqy/yQQznifPPn+2HQnNX4EV0BunnGwSzPy2fg+U3sjHRv1rOJTAni2ZC1A8K4Rua/60rS8EZkwSIlZbJ28p4YHbeS3uVIgcgG5pAxrIAvkOjq5R29HNTsq3SLa+bE9x71rhwJRzhuzK37hMqJEwC8fC/W5E8DtQuxNWlW61O/FUBlpqJUzJTt/hKNSYej6hu+RFUKOo3ByRdQsfyvdlKRymq7187Oqmmi88wqnpnH+wLh0h0oHQTfkvYrrj7EFyNJ734ip/D/pWFH5IKiCEIAnP/ruP11UiokfcBT1BaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7PuHbEkj9bxXyvOy4Wft90fnvSqXXP7HOWdWuclOYE=;
 b=sgH7452WWHya4qPH/JCrl4KrpokT7mEKchDTLm+fOGe/V2t1KZzrxDYSbQjkUN3UELsgjwzFSmmtc9rDzDLC+K+wV6YqCQk+NICKRbJuuc63CCXnVo4icH3OoWh255FBFkAVtHxNJDV9TFOgEkLGC8YofF68TFJ6IvSxX/SMjDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 SJ0PR01MB6478.prod.exchangelabs.com (2603:10b6:a03:298::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.10; Thu, 6 Feb 2025 16:41:49 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%4]) with mapi id 15.20.8445.005; Thu, 6 Feb 2025
 16:41:49 +0000
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
To: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	darren@os.amperecomputing.com,
	scott@os.amperecomputing.com,
	gankulkarni@os.amperecomputing.com
Subject: [RFC PATCH 2/2] KVM: arm64: nv: selftests: Access VNCR mapped registers
Date: Thu,  6 Feb 2025 08:41:20 -0800
Message-ID: <20250206164120.4045569-3-gankulkarni@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250206164120.4045569-1-gankulkarni@os.amperecomputing.com>
References: <20250206164120.4045569-1-gankulkarni@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:610:b1::24) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|SJ0PR01MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: d24f4c67-dcb5-4b2f-a837-08dd46cd270b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q2j5UE4dZ2H2NObWcNwVYd/tva7IYfwdqQivmw1GK1ZQOYBvaFUJd0MLtCbC?=
 =?us-ascii?Q?VnB6frBS8fMDDudEdlJ6wuZ5+Pb27rJc0co1Hvmiki9ZUG9Is7MMje5TxRzr?=
 =?us-ascii?Q?uAIdHOS4ozCIfgQWBBHWGXxppFNoLX7Xo9yBdjHjc0HgY4pb5Lur2gs11ohy?=
 =?us-ascii?Q?GYUWgxWi7t826nBxzbEeie/uBE9kOMJNvMRXAFsB6TXz1hgsYA68lCSJpku5?=
 =?us-ascii?Q?Fu+rWk2I3abwrWd5zz4B+LV+06bwBE7s1oyJ9BdgRj9a7Ho5an2y6VtoNNIA?=
 =?us-ascii?Q?KfJs0PMWbf1EjTX+0M+xIHgOyeUwXJT3DXkHI56+oQsv12NA7P0YzUYa3q41?=
 =?us-ascii?Q?sW8npfqyzOQwAujBJdbgPMo949jRmw+4oaJtmieyUQPY1yYEzZW5b+t+Spkc?=
 =?us-ascii?Q?R81A2/ymjtGEJLEnT1FVhU17Cz2y+sYbE3s6b4afxxUEUGeWTbLpYmZjwZop?=
 =?us-ascii?Q?qVNyUBMTrZ6+QpvFqL1VU7UA6dn9b0xuCYmtT5UxIY8l34hziW2iDm5YfCUZ?=
 =?us-ascii?Q?ynwfM8wEiFwWX6Ts8ghfUEwpLH1DDB9k+JGkskHO+DxwNquHDX1e4rpSJGgn?=
 =?us-ascii?Q?/Z2Y1joX/0Z3HJJ7Na6h23gX+YLlCBV/F3UpZ32lxfjXC0m3mpI/k6PUpD7T?=
 =?us-ascii?Q?3fx4incK/REWj4osh/NTRyJJHyHoc+7hwGvdX09kfn6/BxUYi9AwwuxO87Jj?=
 =?us-ascii?Q?hKLpt0jjMmQ9km0QiTZtjRGqkCxaieEjf5slsqI8q44FGW2j9v3fDjX6T2Ux?=
 =?us-ascii?Q?o1Pya8rmL/DEmyXEzNG05SVAec/+BdrxnMr1p7NWrJ4uRVa074XZz/Xvrurn?=
 =?us-ascii?Q?+XfKka4rnBNGx8OhWiG8XdQY3XQ7SEgaf+ZiAYuxP2QDj4EwwM/4zMTqM7/a?=
 =?us-ascii?Q?yPORaxo5jgntMYai53KcrN/9chPzv+qJdHCy94gXBfL60EDY5nKixOyMxWEN?=
 =?us-ascii?Q?9ei5KxWd8CjWJiBfYyiYjzYdrxU1V+3GK8nilKGkfZDX89de412sev0Y/1Yg?=
 =?us-ascii?Q?qRRgNgbBsGPqfzHhKqI8BZuDLMa+aBnRD8hJCUZDGw3dwOSoWNXQiYFOTA2Y?=
 =?us-ascii?Q?D1kfZMcYvI9iYaPNTmSafEi7ao3Fq7dCvZykpBYBZ07qXlLSMQaPu/pxJzPF?=
 =?us-ascii?Q?MC0eooWRDrDaXRpZdmn54kr+RQqpudiUMrcJ+c1kdw33We68eJXRS49Cfopu?=
 =?us-ascii?Q?hLR6Wa+TnGDNSNnv82629KjEebhQCAbfAPSPZb2UwGBHYFYX5vzyVECXFnff?=
 =?us-ascii?Q?JRd6nNHfeO09uMBFv2qiyBPz3Vuye96VOCQN6RLAlfhl/4CapP0fk4T9c9Y+?=
 =?us-ascii?Q?RacZsSX25Qox1kNOq32/XnrHJHDitHjObI5wmHeyHLWON0nJ02aJ9jVwjKjT?=
 =?us-ascii?Q?s9SycoWaVZ4Y8xdfsooVVYmhQnulD3D08qsnVBtoprXlnWHrRfkhFoM0rAW3?=
 =?us-ascii?Q?tmCqnld5eRbdEpfJuTyQRPnnzyhf4hix?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sE3YqyCZsVFkaxkcO6STry7lv7xDm+kI22YBN2JSESXXknNZg7clq3zNHaAm?=
 =?us-ascii?Q?b1bweGRV7tsXeqwOodE8DQhLjvfHu4AaOtFvHJGqdtgpVYD83JVmoqQYPCSr?=
 =?us-ascii?Q?bUYBYTNLg91RzclDp+VOwzf2Ab21Zduno6aGje9++S7gwuLIrCq3vwItAFf5?=
 =?us-ascii?Q?zY0VnCYjGt22sC04J9RbeXqcXQYLf3sDROQ//6Q3y/Je1+OkKhY0iaeHuiX8?=
 =?us-ascii?Q?VU5+5naJw6YMhQ7pMt/+xHMYmRIVdNx4iS2Uye9KqVARQ8tzfZKmtsGqW5ts?=
 =?us-ascii?Q?Xz9McVVesFnMbKxKDkEy5u9AaplSc8CTeSFZ0i85PouRpRlqhHfBEAnGl9Gb?=
 =?us-ascii?Q?5mP+dz3AO/29Czx+xGacEbsyezcod8GSHtICNsOSBjZjSw2rSD3gkY9SOXak?=
 =?us-ascii?Q?eUG+f9moYfTxLbFc27dMah0BwhieEaNgfs8p9/poqc745mgYfGjEhMI4YLMJ?=
 =?us-ascii?Q?GLDV2IHbQ7GKWtE3JX5WbrrGKi950RP62KYwtS3O02XXKRGy8adtkgkFwFDQ?=
 =?us-ascii?Q?UsxTOdXUvXKPMn9zttrHiNJBYW7a7u9/bCXsGW7qXddLjmgynv9AefH/Ic7z?=
 =?us-ascii?Q?LLVCKuFfu+TfuwTALGa2G0GvHa+RYLxOx38Fxv8b1SHjBx/Md/jqIbJPZ/iF?=
 =?us-ascii?Q?+qcVG7oFNAJsKpJxKP7KgGMb9sLDmB2bShzoR22BJ3G7ziKAeudr/BwgyURf?=
 =?us-ascii?Q?9+prhyzBXfZrWbSsAms+QiAehp0fd3k2VbNXsQdjUt9fJXt8RjJENKLk1bke?=
 =?us-ascii?Q?ataRaNwl5S5mDzBLKHMlPMyA/WkAuBn26+FYu9M9Um7/329z0UtTEH7Gm46f?=
 =?us-ascii?Q?BAdOS5ttlUi3au4oLwVIeJhNeUwCugerAGvQ9KJNdB5cLuO4u2sehmeqC+f7?=
 =?us-ascii?Q?Mobr4II9B6ogAJw7l5qvzfMXvHuNQf1aflAuKl02Burzz3uoOVlZMLE9qpWt?=
 =?us-ascii?Q?86aQvjaaKiowW4fHvHlNZlw7lwm9h0d9OhjNdzlAGqq+zPABAek4y6E4DUYG?=
 =?us-ascii?Q?4yi/iRAnHN5sMgNy1VK/o3zi0ycF00y1XYXB6Ay8DYb6J4/6yUOUm4pRLG47?=
 =?us-ascii?Q?AuHxY5yg+p7jTPfKeNQ2Ru4PEpx+xgARMY2bXeQt4EwZJiFJNDfkRGEoJnWW?=
 =?us-ascii?Q?Ps27C3Bhjx4lT5IZIbPLUhxTHNbzijXtdfPm0fAsUepzCxrnGwkb230jhRgq?=
 =?us-ascii?Q?2yE+93Xd2SnIV5llawVaFX4b3m14jXX0McjZONASyhGYBQ99mqjyfFF7ZE+W?=
 =?us-ascii?Q?YfxhCgHIoq6Nee1ot6O/HrPSfcIYHYbV9Z7X2CVAZSLu1MGLlf3tiE/WGRgO?=
 =?us-ascii?Q?pyYdjV2qxBm6YzyJtoal6yEiPw0ewUNjE/XHgIKjvF7xY/Uj24Et1LBvAHQB?=
 =?us-ascii?Q?7risOXWqMeKHmbmUV2K4U00pXDdJL9dNh4AsABaIRvv6oJqBH+IIj4+NazCa?=
 =?us-ascii?Q?/bt2Xs/urYmE9IxLwIlI/6l0gSQpMtQ+oSxpc2IeTac2LuQF73K1B9OoziT/?=
 =?us-ascii?Q?NXk1f4BA6MWaAKu8f4LlWe6/dGDhuNbcG+0zVJCSDe+yLUJsATYs9/E9rQmF?=
 =?us-ascii?Q?9Qd5lcaybTPgpIvaTogbxhDccIwRXv7Qx/XwdGP263jJi2C6HwDgsKIlJSHR?=
 =?us-ascii?Q?esMazc5BWCeMaffEibUU4k5Ue056E6PZ5FKzQ2qmkjI1?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24f4c67-dcb5-4b2f-a837-08dd46cd270b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:41:49.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8nPPADePCQlh/oZhGLubIbx1oFZ5C0aKSOTl6lHEadTMyOK9N3UOjRgN7HwJ/lCndTIB/lSaI9g2ENbYvGZTcci0IIewYNp1Xmfhj2rSIC/QK6TFNRE7flbV9BO3zUS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_084155_645014_E8AD9BDD 
X-CRM114-Status: GOOD (  16.34  )
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

With NV2 enabled, some of the EL1/EL2/EL12 register accesses are
transformed to memory accesses. This test code accesses all those
registers in guest code to validate that they are not trapped to L0.

Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/nv_vncr_regs_test.c   | 255 ++++++++++++++++++
 2 files changed, 256 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/nv_vncr_regs_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index a85d3bec9fb1..7790e4021013 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -155,6 +155,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
 TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
 TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
 TEST_GEN_PROGS_arm64 += arm64/nv_guest_hypervisor
+TEST_GEN_PROGS_arm64 += arm64/nv_vncr_regs_test
 TEST_GEN_PROGS_arm64 += access_tracking_perf_test
 TEST_GEN_PROGS_arm64 += arch_timer
 TEST_GEN_PROGS_arm64 += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/arm64/nv_vncr_regs_test.c b/tools/testing/selftests/kvm/arm64/nv_vncr_regs_test.c
new file mode 100644
index 000000000000..d05b20b828ff
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/nv_vncr_regs_test.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Ampere Computing LLC
+ *
+ * This is a test to validate Nested Virtualization.
+ */
+#include <kvm_util.h>
+#include <nv_util.h>
+#include <processor.h>
+#include <vgic.h>
+
+#define __check_sr_read(r)					\
+	({							\
+		uint64_t val;					\
+								\
+		handled = false;				\
+		dsb(sy);					\
+		val = read_sysreg_s(SYS_ ## r);			\
+		val;						\
+	})
+
+#define __check_sr_write(r)					\
+	do {							\
+		handled = false;				\
+		dsb(sy);					\
+		write_sysreg_s(0, SYS_ ## r);			\
+		isb();						\
+	} while (0)
+
+
+#define check_sr_read(r)					  \
+	do {							  \
+		__check_sr_read(r);				  \
+		__GUEST_ASSERT(!handled, #r "Read Test Failed");  \
+	} while (0)
+
+#define check_sr_write(r)					  \
+	do {							  \
+		__check_sr_write(r);				  \
+		__GUEST_ASSERT(!handled, #r "Write Test Failed"); \
+	} while (0)
+
+#define check_sr_rw(r)				\
+	do {					\
+		GUEST_PRINTF("%s\n", #r);	\
+		check_sr_write(r);		\
+		check_sr_read(r);		\
+	} while (0)
+
+static void test_vncr_mapped_regs(void);
+static void regs_test_ich_lr(void);
+
+static volatile bool handled;
+
+static void regs_test_ich_lr(void)
+{
+	int nr_lr, lr;
+
+	nr_lr  = (read_sysreg_s(SYS_ICH_VTR_EL2) & 0xf);
+
+	for (lr = 0; lr <= nr_lr;  lr++) {
+		switch (lr) {
+		case 0:
+			check_sr_rw(ICH_LR0_EL2);
+			break;
+		case 1:
+			check_sr_rw(ICH_LR1_EL2);
+			break;
+		case 2:
+			check_sr_rw(ICH_LR2_EL2);
+			break;
+		case 3:
+			check_sr_rw(ICH_LR3_EL2);
+			break;
+		case 4:
+			check_sr_rw(ICH_LR4_EL2);
+			break;
+		case 5:
+			check_sr_rw(ICH_LR5_EL2);
+			break;
+		case 6:
+			check_sr_rw(ICH_LR6_EL2);
+			break;
+		case 7:
+			check_sr_rw(ICH_LR7_EL2);
+			break;
+		case 8:
+			check_sr_rw(ICH_LR8_EL2);
+			break;
+		case 9:
+			check_sr_rw(ICH_LR9_EL2);
+			break;
+		case 10:
+			check_sr_rw(ICH_LR10_EL2);
+			break;
+		case 11:
+			check_sr_rw(ICH_LR11_EL2);
+			break;
+		case 12:
+			check_sr_rw(ICH_LR12_EL2);
+			break;
+		case 13:
+			check_sr_rw(ICH_LR13_EL2);
+			break;
+		case 14:
+			check_sr_rw(ICH_LR14_EL2);
+			break;
+		case 15:
+			check_sr_rw(ICH_LR15_EL2);
+			break;
+		default:
+			break;
+		}
+	}
+}
+
+/*
+ * Validate READ/WRITE to VNCR Mapped registers for NV1=0
+ */
+
+static void test_vncr_mapped_regs(void)
+{
+	/*
+	 * Access all VNCR Mapped registers, and fail if we get an UNDEF.
+	 */
+
+	GUEST_PRINTF("VNCR Mapped registers access test:\n");
+	check_sr_rw(VTTBR_EL2);
+	check_sr_rw(VTCR_EL2);
+	check_sr_rw(VMPIDR_EL2);
+	check_sr_rw(CNTVOFF_EL2);
+	check_sr_rw(HCR_EL2);
+	check_sr_rw(HSTR_EL2);
+	check_sr_rw(VPIDR_EL2);
+	check_sr_rw(TPIDR_EL2);
+	check_sr_rw(VNCR_EL2);
+	check_sr_rw(CPACR_EL12);
+	check_sr_rw(CONTEXTIDR_EL12);
+	check_sr_rw(SCTLR_EL12);
+	check_sr_rw(ACTLR_EL1);
+	check_sr_rw(TCR_EL12);
+	check_sr_rw(AFSR0_EL12);
+	check_sr_rw(AFSR1_EL12);
+	check_sr_rw(ESR_EL12);
+	check_sr_rw(MAIR_EL12);
+	check_sr_rw(AMAIR_EL12);
+	check_sr_rw(MDSCR_EL1);
+	check_sr_rw(SPSR_EL12);
+	check_sr_rw(CNTV_CVAL_EL02);
+	check_sr_rw(CNTV_CTL_EL02);
+	check_sr_rw(CNTP_CVAL_EL02);
+	check_sr_rw(CNTP_CTL_EL02);
+	check_sr_rw(HAFGRTR_EL2);
+	check_sr_rw(TTBR0_EL12);
+	check_sr_rw(TTBR1_EL12);
+	check_sr_rw(FAR_EL12);
+	check_sr_rw(ELR_EL12);
+	check_sr_rw(SP_EL1);
+	check_sr_rw(VBAR_EL12);
+
+	regs_test_ich_lr();
+
+	check_sr_rw(ICH_AP0R0_EL2);
+	check_sr_rw(ICH_AP1R0_EL2);
+	check_sr_rw(ICH_HCR_EL2);
+	check_sr_rw(ICH_VMCR_EL2);
+	check_sr_rw(VDISR_EL2);
+	check_sr_rw(MPAM1_EL12);
+	check_sr_rw(MPAMHCR_EL2);
+	check_sr_rw(MPAMVPMV_EL2);
+	check_sr_rw(MPAMVPM0_EL2);
+	check_sr_rw(MPAMVPM1_EL2);
+	check_sr_rw(MPAMVPM2_EL2);
+	check_sr_rw(MPAMVPM3_EL2);
+	check_sr_rw(MPAMVPM4_EL2);
+	check_sr_rw(MPAMVPM5_EL2);
+	check_sr_rw(MPAMVPM6_EL2);
+	check_sr_rw(MPAMVPM7_EL2);
+}
+
+static void guest_code(void)
+{
+	if (read_sysreg(CurrentEL) != CurrentEL_EL2)
+		GUEST_FAIL("Fail to run in vEL2\n");
+
+	test_vncr_mapped_regs();
+	GUEST_DONE();
+}
+
+static void guest_undef_handler(struct ex_regs *regs)
+{
+	handled = true;
+	regs->pc += 4;
+	GUEST_FAIL("TEST FAIL: register access trap to EL2");
+}
+
+static void test_run_vcpu(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	do {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_PRINTF:
+			printf("%s", uc.buffer);
+			break;
+		case UCALL_DONE:
+			printf("TEST PASS\n");
+			break;
+		default:
+			TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		}
+	} while (uc.cmd != UCALL_DONE);
+}
+
+static void test_nv_vncr(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct kvm_vcpu_init init;
+	int gic_fd;
+
+	vm = vm_create(1);
+	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
+
+	init.features[0] = 0;
+	init_vcpu_nested(&init);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+
+	__TEST_REQUIRE(is_vcpu_nested(vcpu), "Failed to Enable NV");
+
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+	gic_fd = vgic_v3_setup(vm, 1, 64);
+	__TEST_REQUIRE(gic_fd >= 0, "Failed to create vgic-v3");
+
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
+				ESR_ELx_EC_UNKNOWN, guest_undef_handler);
+
+	test_run_vcpu(vcpu);
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_EL2));
+
+	test_nv_vncr();
+
+	return 0;
+}
-- 
2.48.1


