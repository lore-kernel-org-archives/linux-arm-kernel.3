Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE5FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 23:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UPZR4gczJ68KJs3HVBIoXHhO1xtJrYjN3HIDqomlZGk=; b=hSqXIyA0lhtxyk83+vf40/wk1J
	k0QfDS5bjXNFgx9IABjgn31iqYbWiCkSx27zZmFJZRjsiVoNKhIqgOPgO3ErouXhYbyw6rVLb1+eH
	BDNcomprapbZJYipsPRB6pnIGhg/fmkd7rgca1chas89bdsMPQ/Ac4+qEW/gVI5iu+BE3iF3DxI88
	frVW1fwvXhKgznDPahxSYkLOJMCePGlTlsyWCpFqN12/xI3xBOnYYowfN5+tueNtDc2vOGxDwjDHT
	sqbGX0x1q/y+s08k9XrU4eTwuWY5xnCRSg8gtTlkQm9wCPblnFM5+QJiYvfn6JiNC7BOK5W8AR7c0
	XeoY4Kkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmIU-0000000DS0T-0Cfj;
	Tue, 14 Jul 2026 23:12:18 +0000
Received: from mail-westusazon11022120.outbound.protection.outlook.com ([52.101.43.120] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmIR-0000000DRzz-28qC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 23:12:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAi8virO/YrjFtVZlc2gtmT7rVwN17HyMIRBP+sFUId6tk77PtWeFvdfxLfg/bsDuAIwxmBe/zvzvGgANes9j++Mz1tq0E64WGl4bTSuIp3K99mvUU9pDoM7VPWpwut0XDxgZetf2SpQMifn06tczQmyQnzYDuctp0gBzJ6nzNf2S2upUInWOgCrNmjXjs6YucOOhm4lWG5B33tve9TK5hqQ07vg6Ihmum9LniBUwYVJc9AiJuFtAlh+KraVVPUyfuUJ4FoCpxKYmksBLyAYVXi5vuafAmhBc7Aqa/Tifmh4uJnfsBx0Gs3OzPZ9rpvEnT8HTH5P9aDKlehlgvgq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPZR4gczJ68KJs3HVBIoXHhO1xtJrYjN3HIDqomlZGk=;
 b=uTcWWue/QatbBWaEBjL74InydfFcvnF8OSTxXd7WALmb/VJL2eBRDQzMLpFfXoI66KvvB4BdyR4fhn25iyGOT4mNH9bFjCAzjKbNZzxxCAgXL7578bXgiHx8v0MCRcc403Hc8NuPJl41GtQBQhZMm8seWaPpARRNM4pXreNmb9pnC3OalaYWmxRhw6RzSfD/hO+kkmw/bRzSBGKI+0WAVLIgeklUaqfaZPetzJAz8kJjFYMVHKvelpkrI+5qaITTATH4Ue6NpLZDe0Z9us6Eh4gPqr5PVtPDQwfTDLcW9e6mY3ZM7kBUzWZ6YdWTXnAQy89LZj8vGAwgbFovH+Y6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPZR4gczJ68KJs3HVBIoXHhO1xtJrYjN3HIDqomlZGk=;
 b=RkRzx/exhjh/qCYKOOOIhhX3dpYQupF2/Vgcw98lELHFrrIoVbmi8NN+/0yHscB/cNukn8UfC2TSCv+N13RF2Mz7MteBzmsVlECbXTy3AyalBmVRdF5R+04yJYF6/LyH91AfXUFSUyVbcoVgpCKF24avEeSvYeXXCR1ZWzLXw7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from LV2PR01MB7792.prod.exchangelabs.com (2603:10b6:408:14f::10) by
 LV0PR01MB994054.prod.exchangelabs.com (2603:10b6:408:330::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.18; Tue, 14 Jul 2026 23:12:09 +0000
Received: from LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::3ee4:7b7c:ee84:7c1a]) by LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::3ee4:7b7c:ee84:7c1a%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 23:12:09 +0000
From: D Scott Phillips <scott@os.amperecomputing.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Lucas Wei <lucaswei@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v2] KVM: arm64: vgic: Avoid double-deactivate of IRQs in the nested context.
Date: Tue, 14 Jul 2026 16:11:58 -0700
Message-ID: <20260714231158.496808-1-scott@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR14CA0025.namprd14.prod.outlook.com
 (2603:10b6:930:a0::27) To LV2PR01MB7792.prod.exchangelabs.com
 (2603:10b6:408:14f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR01MB7792:EE_|LV0PR01MB994054:EE_
X-MS-Office365-Filtering-Correlation-Id: bb828ef8-66d8-40fc-744c-08dee1fd544d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|921020|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: uSfJXnUhkZe1Z5TFkGpUGTEuLBmJLUruSJ63pLybnef5pViPhYpaK6YJAFVmxY9zbbigl1LeTAX88CrXcmsUZDN4d7arVIcd1fvJOR41RFUuuV9bcDXA6Fv1I7NCHCQW77FtO4E5jwLE5dMWW8TljTzAfJeXRz65Jnt0rOSs0YD2iMR9rdWCpAhgzYn7vr8xWVmR5qO+hmk1Q6kJE7inPiLUZdTrRORCXVMIf7Rbf0rQCrCCcgQCHACrOUG9JZy/tC+mTGY9/ZuEPzX2gF4TjoLwnJAlPfyfmOeTHfhTtrToyuS5k+cX6El+6+x+S1LPbNclp8d+IHOGfB6vtDwlCYxkGnVCZqTcXwLyk3nkeE+Nh1bBw3gO92OuoKOyt6V36m56W4LrxUUeN6xG16+hMC7G2oAKlfaVfOYY4dm9/xtjlXr8GUC/pe9BeDiiQ7vdXnMgbxBB4P+O3lynB8E39y1aWerc0UUan1UaS//Kt0SVi3tb5Kv9FjFpHUOuWAQtjR1QhDTlnzUCavm9a9+oLZl9pwegp8guIbdsEMjTJ7k9QP17plU1+MBcxflB6RUR3cejzyfRr4ZmnILJQ1p++J5C9Tbv7QHsTokcr696ZWXXfl4NKy4r6qa9W19C/m+7FJTJByXGmIoqfWJHklIf8DoLk4Rf1kevrscLDS8NKJbYAw/ST2HjC7Ged4+4yL+6sAX79EHlIVACMAT0N00QOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR01MB7792.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(921020)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FxY+kgrp8W3ndm/V5/2IS4UfPZ6X4Fkt0cIHPxe7KhGCimdn/p4KPq0FYTbn?=
 =?us-ascii?Q?IwedG1PNeVVtmDsNvFIiMeNuMbJI90FRKQeUBnaLxV4z2W4GLVUphDPql3oS?=
 =?us-ascii?Q?gQSwKzjExre78DoZPx8xFqQiuny4htmcOv8hjB3zhsPFGk72R9cSaxNsNY3v?=
 =?us-ascii?Q?7ZGPAQgejVXN9AXQUi1lG1rphb78qA4dWb4IIYLSt6lBF95Sxk4YzLO/IdrN?=
 =?us-ascii?Q?vV5+60V+88SaLEtGtfQi25xzr/SwR3CbdaqzRyoVX5RnxLUVdI7BgFQgnnlF?=
 =?us-ascii?Q?HZfXiuvA4XKLSugb8psFQ8rAjfE7puZfIv9rc87Xqj/Np3ZiTrX5Wq/PGrbT?=
 =?us-ascii?Q?/OrKXg60XTzNBb8R9/8MAyXPTU8swnGXHdLs3c4B70w+1EtqXduWcvEbEMer?=
 =?us-ascii?Q?Cat55tUc5EeqMg5BwU5mowN09sUtjlHcoVej/zD3Bl+sj7INoOMSD7Rb3hK7?=
 =?us-ascii?Q?j/gu1Dm5Fu433y6Ut4sR1ZaZjUZlmhlUPazgUQ+3cXgPtvT/Kwk71Rbsunsw?=
 =?us-ascii?Q?hjy0J0FNM//g9659VkVPzw1BdNbZo3d2YxGQhD/JMKMXFBs2rvk3LiGJeYc7?=
 =?us-ascii?Q?CJYumYmV6HYyAJwPFM4tI8SeNml3rlgUJ+HmTSpdSsYqU7XBv0JJyrKq5qX0?=
 =?us-ascii?Q?8ulJ8k1VhEY/5Zup3ZpKoh1+vAnZz6bLjC4WepyPu3Sp6ZC1/uwFzaXyO3Qc?=
 =?us-ascii?Q?nQZ1lvf9hjIg3YSQGqskjCjfBgjxALMg8+aviper9kb5Y9BLeUVyORG3SKAk?=
 =?us-ascii?Q?7Ji4K7YIkdT5OBSUtyQjP/6xIkX4iM8f0fPgVpmElyTWCaBvfR+zuvzEv2er?=
 =?us-ascii?Q?GCZYFC3heUP2h7PIdVkI2sObXl5iE3bhNW6xjCsRRT5bGoiGHOax9SGMuijh?=
 =?us-ascii?Q?X93rYpPJa8tPJPaIn1GFJRc5CwoQfUNYkZmAh0WfQR+Q29lAutUxqpX5Vklt?=
 =?us-ascii?Q?T5Y7usD2ddE/9O8Z/42ILpmIlxh+ixppCTI0ren+/y5gogI0Oz+2e886bO0V?=
 =?us-ascii?Q?wC+CXWgoZrfLybkiPWmFWKk9+Z9f/fbksX3gBYyszy4dv81iHBP+NC80pAg4?=
 =?us-ascii?Q?QaHyNiEUCl7W3pRfwu9eJvFjgORK3LpAsIbTlTQ5BLfXqu7VqWM2IxzJzS3a?=
 =?us-ascii?Q?m1IomU7dIqCrWUITPza1hQ9uPh1rerTEQ2nN9/1cTwpZG7r+mnm/7b7BNTHK?=
 =?us-ascii?Q?AV1+QHtlNOVh2wHhw7OPHreZlY9iABrU5j3UMKk4fFUbOph3VlwEtfaOH7CU?=
 =?us-ascii?Q?pf9q7qZNKzgpZJOmAG3CVKYD0kAA9wO0a1fjGGNII4qBXjSAqA3arwxsoBg3?=
 =?us-ascii?Q?hghvCBJ2X3knyCvE3RDmc767L7ddjOo+sqxFsb9w9saL1xyLmMJk+bMzjI74?=
 =?us-ascii?Q?rsKLKHOV2uz/ww3kPXSfDkCxhThoQetcdugsHClhtf7Gb9OssDsm/b+RWYfx?=
 =?us-ascii?Q?c5z4G46dT8h5RhH6IfLyjEjE2DfOlXU9AJd9NUa4EXNARu192hRz1bXzGuf9?=
 =?us-ascii?Q?QEd/S2CZKADR+vTgJrE361oqIXS7y6FjwcwL23V3oWF9yIn3yp2bLxgjLvUe?=
 =?us-ascii?Q?d5ahB6dqXg4bgbbmw9iJt4vZFTtTGEmM2bF/4G7TmBaB3CK+LiKB2X3vsalo?=
 =?us-ascii?Q?CkwsyG22xrpdBqvow8zBkPH+419GVsJ1YBBGcR2k96O5cNviTIQDGpVRK1u+?=
 =?us-ascii?Q?9ZX7iznyWIr2srt/UbGD4JyfxSYwBoQefw7b5TFhvjB/DA+/SA/2Oq8PKc22?=
 =?us-ascii?Q?NLO3AcviOvbOoh5SZ7jKR26TMgJdtyA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb828ef8-66d8-40fc-744c-08dee1fd544d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7792.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:12:09.2038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQvoO8zkqdKNFIc0IzmUuYQFXqYvFqcoayVG/lONb4t8Qu/V9ba2FCQN+gb002ahEQXO5D5c/h42Z/dLsLmbX7YhNsZ1rXBt6HCASZ/hhlbCv6l/vzJXJH7fXta45QRe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR01MB994054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_161215_558821_6A38D89F 
X-CRM114-Status: GOOD (  12.97  )
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

In the nested state, the physical interrupt has already been
deactivated through the HW bit in the LR. The extra deactivation
would be harmless but can hit an errata case on AmpereOne, so
avoid it here.

On AmpereOne, deactivating a physical interrupt through
ICC_DIR_EL1 or ICC_EOIR1_EL1 (depending on EOImode) which is not
active, but is the highest priority pending interrupt causes the
cpu to lose the interrupt pending state and also prevents the
delivery of future interrupts.

Fixes: 6dd333c8942b2 ("KVM: arm64: GICv3: nv: Plug L1 LR sync into deactivation primitive")
Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
Cc: stable@vger.kernel.org
---
Link to v1: https://lore.kernel.org/linux-arm-kernel/20260710222128.416581-1-scott@os.amperecomputing.com/
Changes since v1:
 - Drop erratum cpucap
 - Add comment about errata at change
 - Update commit message with description from Marc, add Fixes:

 Documentation/arch/arm64/silicon-errata.rst | 4 ++++
 arch/arm64/kvm/vgic/vgic-v3.c               | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 014aa1c215a16..88b4aa45a2066 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -55,10 +55,14 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne       | AC03_CPU_38     | AMPERE_ERRATUM_AC03_CPU_38  |
 +----------------+-----------------+-----------------+-----------------------------+
+| Ampere         | AmpereOne       | AC03_CPU_57     | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne AC04  | AC04_CPU_10     | AMPERE_ERRATUM_AC03_CPU_38  |
 +----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne AC04  | AC04_CPU_23     | AMPERE_ERRATUM_AC04_CPU_23  |
 +----------------+-----------------+-----------------+-----------------------------+
+| Ampere         | AmpereOne AC04  | AC04_CPU_29     | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A510     | #2457168        | ARM64_ERRATUM_2457168       |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 9e841e7afd4a7..7aa417440f6a2 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -275,7 +275,13 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
 		lr = vgic_v3_compute_lr(vcpu, irq) & ~ICH_LR_ACTIVE_BIT;
 	}
 
-	if (lr & ICH_LR_HW)
+	/*
+	 * In the nested state, the irq has already been deactivated via the HW
+	 * bit in the LR. Deactivating again would be harmless except AmpereOne
+	 * errata AC03_CPU_57, AC04_CPU_29 could cause irq delivery to break if
+	 * the deactivation hits the highest priority pending irq.
+	 */
+	if ((lr & ICH_LR_HW) && !vgic_state_is_nested(vcpu))
 		vgic_v3_deactivate_phys(FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
 
 	vgic_v3_fold_lr(vcpu, lr);
-- 
2.55.0


