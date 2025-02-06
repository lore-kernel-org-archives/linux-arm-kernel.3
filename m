Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90CFC02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM1cWP5AZGvUjUC2hiAx8ZJu7pdZXgJihkTanZsgA78=; b=iqgRQCd1ubw6K/AOAuk/WjnDj3
	bxuXfPi2+cUaFgJ0rbqSEbm/rmZ8t4dHrdAjzBeJk278UyIR1nZ8H/TVyGER7/wz94HLRMG6r8kHC
	EtIfuFLGrClfGdQh86iv358doXIL7JEJA6xdVKfNTkDYR1FtzHvMdgSult8bCVIFluhfHXQai8tfX
	ixbidyDHTZfWgAppHQ5msfD/OCy0P2FllzqkHtL9Uv/n864CASkVU4n7xnC0VUOFjD1jJM5d2S/OZ
	yWp8uuaQaH6vkOicj243FIHT38thB3HeSvXsGtEZ+8sPJYVCqfy8U3+HLXey8s2pILkp1e8sH/qLe
	R1PlkRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4za-00000006tS8-2Yd1;
	Thu, 06 Feb 2025 16:44:42 +0000
Received: from mail-southcentralusazlp170110000.outbound.protection.outlook.com ([2a01:111:f403:c102::] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4wt-00000006t6D-19QH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 16:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDcJDC5Gs+oPpJrK076jnEjzgAl3wGB0mJsBt9AX1fh4DS8dXYtp3caZpUmFnusmOmFuTaSO1mhXdKCeMcozIvZZ/Zv+DkhlOgUZsrZ62+kRfjmuc2VBtTvNSg0CSN3Vge41GKveMr4duJNqFlLGxxeSSpf90ToxMGpXItHCOdR7/1OY9zqOYAAkGjO5QBnbehhuOoE14EZPcBe6BZEYGO3PTlOHbDmct+PjWXhxNMWESzNmyrJzKFZO/j2pqJaR8dHC4njUt5NdR0AsEr3AlZ9DgJkyqWFU4AOcM+cAFJnn3qTpULQTY2Zd4x3cxKH/7mNaBm5n4x0IO4DOL1XbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vM1cWP5AZGvUjUC2hiAx8ZJu7pdZXgJihkTanZsgA78=;
 b=W4nSVcByZpcP9fbuM/3VPB8W4TR7gIkYI7yfovkGT5ZFKf/PCwUZdgnYxOzVVTAtHEO5Nk9f47eEywfgP60KqaFxxtRjt4cgdFbPjV7EM7LTBUwDfbWE03H4vYvgc++Y8gmBGhl9Npv+Y5ISSURSS1gnEAsBTb+9bp6U2fy7ErzEv3vMUL8AsWsQsZTODi3UbLz9fpGn0Qe+Pn6uA49gSlWe0k7dzx9pGlnNA2TJ25AZJOQN5bpNKZ+rqf9fv0r5h/CZGypgZuoRRxAap7hlqByytIzxB1+iFgz9TSugkssj4P72/yPqjY756ub8LuP90yU8uIaozVGUtOHLBTOUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vM1cWP5AZGvUjUC2hiAx8ZJu7pdZXgJihkTanZsgA78=;
 b=J8drSjuslvGbSpr8sRKmpHAkKmpx4ReSoueleOmsB/T+RdnOK7YnJcAPi7dB9jbwA5rZi9UE+rd4/Ca/aFdZQ884Q2CJkWPs2RbTG1u39wKsLcHAHBPsSy41QhW6B1dR0BD69uU+9WSj+4U1oK2f/K3Y8d3mmk/417P4gG+O5CA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 IA0PR01MB8377.prod.exchangelabs.com (2603:10b6:208:48e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.7; Thu, 6 Feb 2025 16:41:48 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%4]) with mapi id 15.20.8445.005; Thu, 6 Feb 2025
 16:41:48 +0000
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
Subject: [RFC PATCH 1/2] KVM: arm64: nv: selftests: Add guest hypervisor test
Date: Thu,  6 Feb 2025 08:41:19 -0800
Message-ID: <20250206164120.4045569-2-gankulkarni@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|IA0PR01MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: c45b04f8-66d5-48f0-88e4-08dd46cd2605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iRfqyQ9XUtpOeA6jfv+b/iXmHtSBfyHloIN2nD8kN+Tf5EtFcwZZzSSWIXqK?=
 =?us-ascii?Q?XZ23arKlCQc5aM3zKpi0nqweyHv5A3mn6i2pm2BfNOJ4Y4VeC3CbP/Z/p+aa?=
 =?us-ascii?Q?jdQgMWW8l4OB91UcIn+xzAEjY3V3R9WSti7VG4pdxQ8RhRDPDUnlAdYoFnrE?=
 =?us-ascii?Q?uEmvyMueVn5yMV8Eh6IVQERyNcPCA94UNbD/SjljeUtm+WmmTpeYmMni1iRj?=
 =?us-ascii?Q?1SFStS7PEG/8yDfH/FghavpBkhmP9IhNM4n878jrMBJafOoOJwU4FG9SwghM?=
 =?us-ascii?Q?00+jQMoKXWD9degTqXCJg7XVWcDBsb2mhwxCLElwIIoIYc7pvtxGh2OiIg7a?=
 =?us-ascii?Q?BkMjwolpX1f0990MdlYVELp6FxaoqUWOhMVzooOelVu+zFFO2qPMX0CathJO?=
 =?us-ascii?Q?dU3k/0X7uIKsJ16+Uq4tZIr7GMn2zB5xc6ky9huUgP2lykJ4ORjhY93RLnY+?=
 =?us-ascii?Q?sN3wnYOeCKiaGTHpu54qCVsQZbbBzAF6xRa3CEeSlX41Rv4vezpyCowFLUbf?=
 =?us-ascii?Q?0yonwTn3OFnepsdBNOAqKecdKRxXB8ULVt0zs8hi2G/60ziatsqkbWvThcIv?=
 =?us-ascii?Q?vZUelbomTaJK/amBiAs/pKX/A2ZWI3lKGJ1zhe2RzCXTgvXiFDEXzWR4oUeu?=
 =?us-ascii?Q?b/L9QeZWzB9FZRSjq5hLphF6W/6WcsZLRTLqKDRM5KF0HaqZggmlwFuz0SYc?=
 =?us-ascii?Q?STKlyfRvIRnW1tqR0dOi0nizk8NlZj9tWYIciyQEODcsZ/yf+1+OHQ+1r4v6?=
 =?us-ascii?Q?NC1XnL2FROMAqpjetQne/r+W35K0IP/scagNmpayCQY3TW4QoxEg/eHOUgPf?=
 =?us-ascii?Q?XGo1JoaFg99AKbKxvIZ0ZnY0NMNJWYD7u9x45sRTKtL1yAva8F1nlJpltjWW?=
 =?us-ascii?Q?Cg9kxTjE5Suw9m+QnrV+1jRLX61owYTsmL/3Q+0hNsGRJyFxn6SQgmpHQceP?=
 =?us-ascii?Q?7vDiAneVS7GCDoVi94wlhVjI474gZm5vMG8r+uLMShaYFr/pgusElQT4CObA?=
 =?us-ascii?Q?CFRqoG4v/dL/89vyyQlR975Ahi9oNNAh2+aMsCzPMuBuWcFCP+dBLMGP9WoB?=
 =?us-ascii?Q?GrUUu6gRQS+ZYnZPCJduJSTADDQYSg8go/rfTDq0e/H4AalFBtFPFgS5kP1G?=
 =?us-ascii?Q?g1G8LuxFy6gBlKkO/FMnjXikWBkUdXmm6p+3fiJQON7YBkJ4WHHTgfKOuXJ4?=
 =?us-ascii?Q?qnlbndoBOI9vdRha/RMNHKFpjfgQoTHCkd2TvoXZHhXcFNA16NNsG3PKonUV?=
 =?us-ascii?Q?zfrlZUzri6A3CkjYlTkWhgXXNu17D8AxLkwmnxoeF36eRV7QscP+woCl9GYP?=
 =?us-ascii?Q?8owawKR4FVP95BT/K12iw56E66xvVQreVLY8PR9sC/Ow9DYkmd48WhVHdIFD?=
 =?us-ascii?Q?IqN9xcqqxq/790TLGx5sWTcy4CKG6zKAXLhKvUwaxnCDEn92EbMeTA5cmD1H?=
 =?us-ascii?Q?A/QKUVlLffdQ13BiFpqWyimEQgydPIHk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z9RXv4W3cJzzuvsCMgkyzIzFybGxLcqvkzGlQip7xlaLKbzDP8nuWuPVxM7r?=
 =?us-ascii?Q?+Dlsjg15kI0Qw+9xFM/QD3qoVH07NlaWR9yfl2TbqVwApCJpufSXIcj1Glif?=
 =?us-ascii?Q?tetdXob/a85kPTKWIuE1fxrsHeq3Lsxi83yIfWvbUaAIfM+h4UW3jfmgGsOn?=
 =?us-ascii?Q?sZ3jlx8Ud/15YaMWvceXugXjbqqg6mFmORzCSbbTSpJ5AI5474PFvGcyo9uA?=
 =?us-ascii?Q?YOS0eMmXyhVkzPMpT9SVUi5EVVfJS3niZ3HInhJktI4oyHEPJLTZadUXFvpO?=
 =?us-ascii?Q?qTS/ztxMohV3+zx27GE7zHZu4kqGU8donQ0jubz0fF3VEHWREcu/rVOe1/d/?=
 =?us-ascii?Q?keLnWqaNtlv0OXtu/xaXrH+5XPkA4gE24un2pCa3wOteTKfqnE0rYh9xjpkC?=
 =?us-ascii?Q?pzvKz6aN5Z62i46+YqwO49yC8JHxILgnmZ6RYov1M+0Wuae2gfV1gFunmQCc?=
 =?us-ascii?Q?QUX3hIBHf9i6PlFGj0APMLRF2xDwMEsUEZBS78XM1eKmTTqXkmGo1ktSRbYl?=
 =?us-ascii?Q?G6Y1lVe8ynFMEjl6Nxq/kVQFEjIy7+xLqWakHKldAviYjUC5Ev30VMrdYpsE?=
 =?us-ascii?Q?CTZwMLMUhvhIDQxY1cE4MheUzeVTa66H5zaiBsjGDT6a2ruE9nSjW7GZxf1V?=
 =?us-ascii?Q?DH7KFuZ9OIq/uwE5kdgaCmPu8pqSRvYNo09OVj7aYkSoNZxbQ0AgTdFoM0pp?=
 =?us-ascii?Q?gXp0CbKw+RT5XObzOGFYzD/0hP7lyYhrTJLhTGoc1kxuAeRw7JuL+zqW9ioo?=
 =?us-ascii?Q?rcF+o9n5CW5AWbIh93aBwNMZwiL5qo1u1rOKuAObzlLRdKtDydPZcz+eXGHz?=
 =?us-ascii?Q?jw7yFHiOu3eA1W8UYwgmqBQZ+yKW0ssBppoU9bDosiE93EWXhawv1rgVzISy?=
 =?us-ascii?Q?SBWchUfJhxSIcnOG34LIyJ9h2xHM573L36vuppPrX3QuCrnXfhsky60+xV4D?=
 =?us-ascii?Q?urRmrzcyLHnsOjOMrTsxfDOfdI+YTWw6qIqnx+JD8tLUG1U9dACvabOlqMAe?=
 =?us-ascii?Q?HpZTbBSXzWMJ2jWD/Em1to3g3FPf2o2155ywoOvDGY7rf/ZpLNDyVXmO+UdR?=
 =?us-ascii?Q?5LPYUS/Xcvwr3tBRxRu3SENop3W7V4AZjbKd3wF+8315cZTXan8vusH+gI7J?=
 =?us-ascii?Q?3VkB+94YaSG2Yi3ApQW+B6SP9FT2uNoe4+D6RwHWNM41l6QCL2WE9X+8ZIOk?=
 =?us-ascii?Q?1zgRtjwa6u7FL1C8AYfZjPQZWlinbbUbPMeB4xufIpEgl3J/q3ESJNasgTGs?=
 =?us-ascii?Q?wFFxHxBsjfzzLmh/4XQDOcWY4tNnnqDq34DYU9htpCjvMpKvb27upsJReEQ1?=
 =?us-ascii?Q?oDvlEBlfSTRvxdpQlaumYNxKiYE1r1qjZbRnSXV+phI7RTS0Jk87rll0+j3u?=
 =?us-ascii?Q?IguH4d/WS3BotnbL6FkINOwKD5md/CJElhSmFKSNqXX2xFzASP3QbQhgmtxT?=
 =?us-ascii?Q?BTaiMx0buYwRzHwlpbG4yPAeYExAcX3qPU1sjrKjxFuxfLq8ACYbsJ11cRev?=
 =?us-ascii?Q?GdE8WMorSWBsubbDfg2I3TJ4j13Zggi2i6rxN27qd9fLVD78/NeW4Pqsbxcp?=
 =?us-ascii?Q?23VP/SEmty8mBwzdnB5AwM9nCvtotE1n7YV8yaAsWsc/BjRrZCrUtmm/uPLy?=
 =?us-ascii?Q?XpQguY8frLDIXfPRAyOKySfLe6hFG00WGeZf8WqKey5C?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45b04f8-66d5-48f0-88e4-08dd46cd2605
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:41:47.7980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70p4I+iDDgTKIAaM4aU6JJdTDxIjV6cNpn7XYk5oTfAafEK0y3qoANczieJG5AGKwQ+6izGeGV4/xVAn4ZwWX7LP398XyXB3uHNj6UVINb1AkAIdC/Ii3exVatY1bsAE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_084155_319565_EED40B7D 
X-CRM114-Status: GOOD (  19.47  )
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

This patch adds the required changes to init vcpu in vEL2 context.
Also adds a KVM selftest to execute guest code as a guest hypervisor(L1).

Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/arm64/nv_guest_hypervisor.c | 83 +++++++++++++++++++
 .../kvm/include/arm64/kvm_util_arch.h         |  3 +
 .../selftests/kvm/include/arm64/nv_util.h     | 28 +++++++
 .../testing/selftests/kvm/include/kvm_util.h  |  1 +
 .../selftests/kvm/lib/arm64/processor.c       | 59 +++++++++----
 6 files changed, 161 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
 create mode 100644 tools/testing/selftests/kvm/include/arm64/nv_util.h

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 4277b983cace..a85d3bec9fb1 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -154,6 +154,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_irq
 TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
 TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
 TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
+TEST_GEN_PROGS_arm64 += arm64/nv_guest_hypervisor
 TEST_GEN_PROGS_arm64 += access_tracking_perf_test
 TEST_GEN_PROGS_arm64 += arch_timer
 TEST_GEN_PROGS_arm64 += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c b/tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
new file mode 100644
index 000000000000..5aeefe43aff7
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Ampere Computing LLC
+ */
+#include <kvm_util.h>
+#include <nv_util.h>
+#include <processor.h>
+#include <vgic.h>
+
+static void guest_code(void)
+{
+	if (read_sysreg(CurrentEL) == CurrentEL_EL2)
+		GUEST_PRINTF("Executing guest code in vEL2\n");
+	else
+		GUEST_FAIL("Fail to run in vEL2\n");
+
+	GUEST_DONE();
+}
+
+static void guest_undef_handler(struct ex_regs *regs)
+{
+	GUEST_FAIL("Unexpected exception far_el1 = 0x%lx", read_sysreg(far_el1));
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
+			printf("Test PASS\n");
+			break;
+		default:
+			TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		}
+	} while (uc.cmd != UCALL_DONE);
+}
+
+static void test_nv_guest_hypervisor(void)
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
+	test_nv_guest_hypervisor();
+
+	return 0;
+}
diff --git a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
index e43a57d99b56..ab5279c24413 100644
--- a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
@@ -2,6 +2,9 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+#define CurrentEL_EL1		(1 << 2)
+#define CurrentEL_EL2		(2 << 2)
+
 struct kvm_vm_arch {};
 
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/arm64/nv_util.h b/tools/testing/selftests/kvm/include/arm64/nv_util.h
new file mode 100644
index 000000000000..4fecf1f18554
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/arm64/nv_util.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ampere Computing
+ */
+#ifndef SELFTEST_NV_UTIL_H
+#define SELFTEST_NV_UTIL_H
+
+#include <linux/bitmap.h>
+
+/* NV helpers */
+static inline void init_vcpu_nested(struct kvm_vcpu_init *init)
+{
+	init->features[0] |= (1 << KVM_ARM_VCPU_HAS_EL2);
+}
+
+static inline bool kvm_arm_vcpu_has_el2(struct kvm_vcpu_init *init)
+{
+	unsigned long features = init->features[0];
+
+	return test_bit(KVM_ARM_VCPU_HAS_EL2, &features);
+}
+
+static inline bool is_vcpu_nested(struct kvm_vcpu *vcpu)
+{
+	return vcpu->nested;
+}
+
+#endif /* SELFTEST_NV_UTIL_H */
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4c4e5a847f67..8c53dbc17f8f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -58,6 +58,7 @@ struct kvm_vcpu {
 	struct kvm_dirty_gfn *dirty_gfns;
 	uint32_t fetch_index;
 	uint32_t dirty_gfns_count;
+	bool nested;
 };
 
 struct userspace_mem_regions {
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 7ba3aa3755f3..35ba2ace61a2 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -10,6 +10,7 @@
 
 #include "guest_modes.h"
 #include "kvm_util.h"
+#include "nv_util.h"
 #include "processor.h"
 #include "ucall_common.h"
 
@@ -258,14 +259,47 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+static void aarch64_vcpu_set_reg(struct kvm_vcpu *vcpu, uint64_t sctlr_el1,
+			uint64_t tcr_el1, uint64_t ttbr0_el1)
+{
+	uint64_t fpen;
+
+	/*
+	 * Enable FP/ASIMD to avoid trapping when accessing Q0-Q15
+	 * registers, which the variable argument list macros do.
+	 */
+	fpen = 3 << 20;
+
+	if (is_vcpu_nested(vcpu)) {
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CPTR_EL2), fpen);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL2), sctlr_el1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL2), tcr_el1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MAIR_EL2), DEFAULT_MAIR_EL1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TTBR0_EL2), ttbr0_el1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL2), vcpu->id);
+	} else {
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CPACR_EL1), fpen);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1), sctlr_el1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1), tcr_el1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MAIR_EL1), DEFAULT_MAIR_EL1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TTBR0_EL1), ttbr0_el1);
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL1), vcpu->id);
+}
+}
+
 void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 {
 	struct kvm_vcpu_init default_init = { .target = -1, };
 	struct kvm_vm *vm = vcpu->vm;
 	uint64_t sctlr_el1, tcr_el1, ttbr0_el1;
 
-	if (!init)
+	if (!init) {
 		init = &default_init;
+	} else {
+		/* Is this vcpu a Guest-Hypersior */
+		if (kvm_arm_vcpu_has_el2(init))
+			vcpu->nested = true;
+	}
 
 	if (init->target == -1) {
 		struct kvm_vcpu_init preferred;
@@ -275,12 +309,6 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 
 	vcpu_ioctl(vcpu, KVM_ARM_VCPU_INIT, init);
 
-	/*
-	 * Enable FP/ASIMD to avoid trapping when accessing Q0-Q15
-	 * registers, which the variable argument list macros do.
-	 */
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CPACR_EL1), 3 << 20);
-
 	sctlr_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1));
 	tcr_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1));
 
@@ -349,11 +377,7 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 	if (use_lpa2_pte_format(vm))
 		tcr_el1 |= (1ul << 59) /* DS */;
 
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1), sctlr_el1);
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1), tcr_el1);
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MAIR_EL1), DEFAULT_MAIR_EL1);
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TTBR0_EL1), ttbr0_el1);
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL1), vcpu->id);
+	aarch64_vcpu_set_reg(vcpu, sctlr_el1, tcr_el1, ttbr0_el1);
 }
 
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, uint8_t indent)
@@ -387,7 +411,11 @@ static struct kvm_vcpu *__aarch64_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 
 	aarch64_vcpu_setup(vcpu, init);
 
-	vcpu_set_reg(vcpu, ARM64_CORE_REG(sp_el1), stack_vaddr + stack_size);
+	if (is_vcpu_nested(vcpu))
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SP_EL2), stack_vaddr + stack_size);
+	else
+		vcpu_set_reg(vcpu, ARM64_CORE_REG(sp_el1), stack_vaddr + stack_size);
+
 	return vcpu;
 }
 
@@ -457,7 +485,10 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 {
 	extern char vectors;
 
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VBAR_EL1), (uint64_t)&vectors);
+	if (is_vcpu_nested(vcpu))
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VBAR_EL2), (uint64_t)&vectors);
+	else
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VBAR_EL1), (uint64_t)&vectors);
 }
 
 void route_exception(struct ex_regs *regs, int vector)
-- 
2.48.1


