Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778B2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbZohyQ+F8Yv2FOgbAqi97aaop77RlTewqsAZtNSHwM=; b=xsdwmO2SbWeFotUUayg9VHDkyf
	ezaDMBYtq2Doh+DoPTy+fFsTd4ggwmq8z47KK1zwFuMf+JuAj+KflRyr0lR3Z1LJvC9lzV4Vy7nVw
	RabgDeLyfTQigWBVD60Sjy18gmyn4K/12Tvb4Ngfbub6BF6dS+74/x8Y+9tRA1vQaRbXghT16R7Ky
	h5csvzEFnj0ch1Y53eHembF8/5iVETilQDZGTnfGdBJEUkbOXrzW+Zqvz6a/cVW4ue6ZCqt/XJhAq
	H2oxazCouKu920sjo1QJ33cyoG5K1balkVimxj7tehh5TzOlBaBYphgk1rjcx1T0jMzoGnfe8MSiZ
	SCg0EZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQza-00000009Cip-0eeI;
	Mon, 12 May 2025 11:06:42 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQmj-000000099e9-3IGO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:53:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dz29RkbiUbFmKjhYFVhLXRljRRXPZZeFQysJ1OGGR1DrKOFIEo9vnq9MRe6t1heyWxMkmNxwfNLMCRFiqcekBOrw4hBwBWZGsrz/+JQLOZjZy4SY0aCUekoH6MnwhNrSiL5JdpU2k9RXS9Pzh/+W5uH3+vYKHnwNlDm4Y2+ba4/GFN12nD5rSaUmCyhIfjU7OCVOB1NsFN0VYmg3c04c18EzI7FpFAVgsjw/2mc3IAPIszCmN/ZsFad3I3ypDcMswY/okpgPprcRelWqGkTuzP4ZJnxMl4Z0Ub4qR0VivqQ1Ga64AXRRm71KiHFuomcYLHKwkwPjIMYF4P7feomXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbZohyQ+F8Yv2FOgbAqi97aaop77RlTewqsAZtNSHwM=;
 b=ywI9nkpnLUO0D88AmbrtLSiKw7VSkCIvGS7ZbyVv6nCkR99V4Ujzgu6k21Evvz4juMOuhK31cbgbARmF7xlknsExDm+J5g4jP/0nC65e8aVNO1Hf7aJ55jjtbK9Q23D7AMwyLqQqsiUetSF4dy5KrW0FvumIThZYAv1vL82vWoZLq+o0Er59qdd3rTO41aMc3Fn6Tk0k6/ubtY5K9NaMz3BPfbHT7H/on+opWTqf5fwV0GCU2Z4NJo2P/OfS3tioyOFsUEnbXPIkZo9x+hgBR29oKsJz+6dGZI/mZKawTwUpTtl2t8L314rR15Jh1RpvhlQOE/vDVj6PsucWDjUFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbZohyQ+F8Yv2FOgbAqi97aaop77RlTewqsAZtNSHwM=;
 b=Ghr9YmHXmLxmvoQroD7+GL8D+S3wZb/bRHjajSYc55dt3T0MHRcc8hriBGEmQtQN7hjiHHqQyJ1slnX5gwHWjn72KLOMi1QBMjgRc2zMt+FagZjndwU3Ng3lrrMVFye2uG6LSZAUUo7dcLGPxUCOyQQ88cerIC4uO9Vuwoq8WjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 CH0PR01MB6907.prod.exchangelabs.com (2603:10b6:610:104::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Mon, 12 May 2025 10:53:17 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 10:53:17 +0000
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	seanjc@google.com,
	darren@os.amperecomputing.com,
	gankulkarni@os.amperecomputing.com
Subject: [RFC PATCH v2 4/9] KVM: arm64: nv: selftests: enable aarch32_id_regs test to run in vEL2
Date: Mon, 12 May 2025 03:52:46 -0700
Message-ID: <20250512105251.577874-5-gankulkarni@os.amperecomputing.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
References: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR19CA0043.namprd19.prod.outlook.com
 (2603:10b6:930:6::14) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|CH0PR01MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ef61f4-0d7f-436a-6036-08dd91433383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PcB2KUO4DLG7z7j0NVprZzJEC59X/N6UggwA029ZkpTCrNklNhL8+Q0HjBp6?=
 =?us-ascii?Q?4OcNHyjb05HN5KM6K77zKTmSZhUAkSIIHIkSoGNTB1LvkrMYnS+dPWmsrrqd?=
 =?us-ascii?Q?DfhlBdiP5dY/018chE72OtkQs3Ctxi/roP+jBE1wZ+fZPBHoN2TvMkkiUKI7?=
 =?us-ascii?Q?0kRuQt1c9ZYknB9Fxa0XaHB850dMWCkMMW8NVGeAdbwjX8KEyE9xuJ1OOq42?=
 =?us-ascii?Q?yXv6if2yae1WC/BRezntXQD7d1wQiQL4ZvMYcUtHQKasA0ybFTeH2ZBIOTjQ?=
 =?us-ascii?Q?pES79mFtuv7DNZ4p1ZlUd5d9AgtRg3Bt5ndePmWuOLSORwtX+PUTM+VBRUmV?=
 =?us-ascii?Q?NJAVJ4rdjKdXtm4g7TTv95DoO2py2FUKz/qyYisxy3u+xf/CtJjOAjqfC5DC?=
 =?us-ascii?Q?ADJHX7Cha9mKMra3+W/eioPdIEGczszrGlq1O01U/PYhujEN4Dq3Wnl/sNP0?=
 =?us-ascii?Q?K2gxcC/dn2OsUNEwSoKDzM+9yQ2HMIqdd4A568D5ZISTxxYf3QlKRZ8CP7NP?=
 =?us-ascii?Q?+HxWP5faDinGGKJLAr3Wdlv4NG2tzlL+h/jD/Li8CdTCCmPbw1D2go4+S/Uw?=
 =?us-ascii?Q?ipPwUQotEPnZMeITSAlwE+t0S3/zehLbH/0DXPWPspOk4XL5+lCS0wyJQkI6?=
 =?us-ascii?Q?0+TKJNPuK+zZ+bCWFPurohOe/USGZOckL1523eJUTaFzRX268R0pBK5i/EdQ?=
 =?us-ascii?Q?Dk3KEjiYtY5QUaiMrxS/8dKFbwDHXJo4/piGsVL9Um9IQfP8bj0y3zr+dGFZ?=
 =?us-ascii?Q?zfRtXfsvRrHAUSMWLOYTH/bY7JxhCgNTx3BiXwk+9/TuzVEsC1jKmM8Dwdoc?=
 =?us-ascii?Q?uvq+uQu8SIm65O6QcrH/7eOQytfsnZGqh2uhlHde9wqgcqCNkSPuzIbdtKlz?=
 =?us-ascii?Q?9SqS0OspIbUVoqd9asKN2Jf5eXS3m/gqxssO6gse309fuPqBonIb7ccMTzHG?=
 =?us-ascii?Q?u8eC3HJw8B/UXGrtll8uPSdqcLEpe39GAqBeasEohtV8q/ZrMO5clsaSpQcm?=
 =?us-ascii?Q?WUjy1QJi7GO3GsvBzGifk1cgfY9HrXwbBa1mA79keDnKYBltVtrCB2STFTDq?=
 =?us-ascii?Q?ZGCLdmDQJn7YebqWAobiFLYwHAhA3udaojxZB8B1cho7cxqMaG+tG28+1hpV?=
 =?us-ascii?Q?z3b3hmvsLT0nrg0u36Ox4MuCPfkAWCtF4nnAVJQW8X3iyDC4OQVJUtDAk6Fa?=
 =?us-ascii?Q?sdckp2O3vdc2bTktk1QozTGE2HBxPzvsTh0wJO+Vy1nOZq1WR+dfJNTNtw1j?=
 =?us-ascii?Q?MLOxCG81thtXm99F+c6pVUSt330RqjPfxuIMJTIwBjqlaWm6qg7t4cpV8m07?=
 =?us-ascii?Q?cthV0AKUrJgO1Dn/p1iZ7XcQwGokNF7+XHSiQiwbeNvARtNiHWC25XiuPRTO?=
 =?us-ascii?Q?xQhfOfVpOdla5p3h7HPUhM72bQIPSkHhfBC3hL0w3jE7isSWuGr+9eKGBOJW?=
 =?us-ascii?Q?Cc8NqbJZsJ8pC6buqsMbWXJJbnuFU4nBYNUCjTzcjkbC03LDQmWOLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WFehHF3PycCoiaRpnNW0FVjWHmO4av3Esd+IFO1cIUJAKR6/p/BMXE5ij+iM?=
 =?us-ascii?Q?mS5FTwK94JZID+U1grASbaj0Byxt+dzhm4M9SWuXDAwqX2i+kgpeQAqRnVCh?=
 =?us-ascii?Q?xH2VJcil95eqvGw/LmH7/sQ0FrH+PVYjNAlis8oJ0+rf2T7ee+ktYFi/3OBR?=
 =?us-ascii?Q?O0rC7DgL7ZTdsG9Bx4l4TAtZfTjh1K9lJsZPN2KKQBpdsUjE8E0QrkXW5b3o?=
 =?us-ascii?Q?N9dn5PAbIqg6aqviCWcEh7uIK3CsrCzXaMAAPzbBE4d2YRfjAVqvFIzqp/CP?=
 =?us-ascii?Q?yiNcFnyfjXgBauPVaQvwhiCIixthaCwX+FoW+i060QUjYxsbaUxDkQvZp+aP?=
 =?us-ascii?Q?tuNjhucyssy5eCnqMkFnkvJJR94a8dOpHvigsFSV+VoZduGSCPc/m4S28MiS?=
 =?us-ascii?Q?z1v67zgmXt1AeZ/ojA9aMlh0KUAUDfWr4vh4pX1gsaDhWa1IE2wuAMVZ6qR2?=
 =?us-ascii?Q?Npn6rrkuzBW0kkLT/ysFspibxVxooK5+99hrPcTbKef5MCRVW3kujZbpnUkV?=
 =?us-ascii?Q?8MRAvxXqlBktNLaoW//Jw4eLtLUbgn8Xj/ddmPb5GpzgWXuoVOJORKBMLkp+?=
 =?us-ascii?Q?jqnAFQhFpLzDHyQuqAQi1csrfT3TBa2+uSKrNbiS2KZ8OmMaHJKjeDlkEV+6?=
 =?us-ascii?Q?yQz8Z2KrF9oE/UlWafMklSRKHrrvebm0PQhNbj5kWiGDrYuyE73l4I1tKRSN?=
 =?us-ascii?Q?DhxgXRUJULOzvnnn7EJX06QDVlnBoJkIpexNNJfPlTxYVA/0q+KmrCMes3g6?=
 =?us-ascii?Q?39CjbDuZYDrWfQTwk7/eK+gLjntZViN6Nw0KK/bB9DHloUn5f/phLnVNFHlj?=
 =?us-ascii?Q?eFgPlVvAFtoAikyE3oVLFzuKg+2veDrYWdN0yPyZXo7Sa5SgkzDV3yWfQxgP?=
 =?us-ascii?Q?ovSY+SA2syGlfzZVFFOe0JI/GZfmh9mibZJzzdzMLFmSIxKrixFJ5KNQG0KE?=
 =?us-ascii?Q?ZODzjF66yvDxm2jwMdJR8x284wgzHrNuMsELkN2/eiM2CwCbbXD9o1bEnJn6?=
 =?us-ascii?Q?o0qGuKz3GNFkdlHTxieSaXYG4/3M6B+lUZxUyWfKmBt4aWnG2g+PV1dyc9iu?=
 =?us-ascii?Q?Wulg+u0RX0hUgLz80+NvRPFRHBGh2FNqJGPQRyFctH7M95qd/CEqwcDJBM14?=
 =?us-ascii?Q?8iY8/oUlKayrRfUPI1w7aDsMKLwXDL05tBoNSOvjyDizdpY7Jt8OKcT451c0?=
 =?us-ascii?Q?4hRaQCRUWnG0XZHZPkpl5BHGX61deK4Yub8tSa6orZfazg4efXX7g7qwB8lu?=
 =?us-ascii?Q?OG8MEJhFmGobdBQhjEi1ZTo1O7xnvtMg0MirI3Q7yg+zp9eZXl0ZHnHT9N8K?=
 =?us-ascii?Q?MgCxteULbmwLLOCYpbT2Hxu4nMg4Mr4ZKbXSWEccG/Elm765yVakV9sz/Vn6?=
 =?us-ascii?Q?vLVB7K2lEJiz3ImsLj7OEBF6vpS47Et5jBoaGobQpKXvuGyvSgJrHwerEy/L?=
 =?us-ascii?Q?beGHulsj7MHu8LNd/zHdapuSWji+rx7mrT7UOxjACkNL2M8k/0IyXCpSl7X+?=
 =?us-ascii?Q?fHxKVW5gwT34jLrQEBQcHSWZZcaamyYiX41hhj/4NxqOFHjqyWP8RmYR14j8?=
 =?us-ascii?Q?zP1yw2tFGgn9NQfhUc8X/dhWdAPX7QqXhP3hbdc63D+C4+zZ1OmEHDth1RDc?=
 =?us-ascii?Q?iwYbTit8SmNlbcyBDw1WItY2wcZ2YtggR84JV3ix7FLn?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ef61f4-0d7f-436a-6036-08dd91433383
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 10:53:17.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/AsSIEym4KFKlB49a+IpMDB2GodaxgrhbJPjvxjTEYbISP4mYnfL4Xn+7JLl+9MM4ctPhsAi7QxzZozV17yxRNBZRymtuoYeHhANWWz5q8/OJZS9CuPBFnx1AvyoSkR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB6907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_035325_852223_020B27A1 
X-CRM114-Status: GOOD (  11.51  )
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

Extend the testing of AArch32 ID registers with guest code
with NV enabled.

NV is enabled using command line argument and it is disabled by default.

Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
---
 .../selftests/kvm/arm64/aarch32_id_regs.c     | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/aarch32_id_regs.c b/tools/testing/selftests/kvm/arm64/aarch32_id_regs.c
index cef8f7323ceb..8a9afda8a3e2 100644
--- a/tools/testing/selftests/kvm/arm64/aarch32_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/aarch32_id_regs.c
@@ -11,6 +11,7 @@
 #include <stdint.h>
 
 #include "kvm_util.h"
+#include "nv_util.h"
 #include "processor.h"
 #include "test_util.h"
 #include <linux/bitfield.h>
@@ -150,12 +151,38 @@ static bool vcpu_aarch64_only(struct kvm_vcpu *vcpu)
 	return el0 == ID_AA64PFR0_EL1_EL0_IMP;
 }
 
-int main(void)
+static void help(const char *name)
+{
+	pr_info("Usage: %s [-g enable]\n", name);
+	pr_info("\t-g: Enable Nested Virtualization, run guest code as guest hypervisor (default: Disabled)\n");
+	exit(1);
+}
+
+int main(int argc, char **argv)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
+	int gic_fd;
+	int opt;
+	bool is_nested = false;
+
+
+	while ((opt = getopt(argc, argv, "h:g:")) != -1) {
+		switch (opt) {
+		case 'g':
+			is_nested = atoi_non_negative("Is Nested", optarg);
+			break;
+		case 'h':
+		default:
+			help(argv[0]);
+			break;
+		}
+	}
 
-	vm = vm_create_with_one_vcpu(&vcpu, guest_main);
+	if (is_nested)
+		vm = nv_vm_create_with_vcpus_gic(1, &vcpu, &gic_fd, guest_main);
+	else
+		vm = vm_create_with_one_vcpu(&vcpu, guest_main);
 
 	TEST_REQUIRE(vcpu_aarch64_only(vcpu));
 
@@ -163,5 +190,8 @@ int main(void)
 	test_user_raz_invariant(vcpu);
 	test_guest_raz(vcpu);
 
+	if (is_nested)
+		close(gic_fd);
+
 	kvm_vm_free(vm);
 }
-- 
2.48.1


