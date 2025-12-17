Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611E6D65C60
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uCktiQdfSCPd3shi7p8pNmH34HrExFqkMw7Dl+wD0Bo=; b=okpy0QylQqnf6UQYuGJxHfvIin
	AxwgimceXhcoC75ZoRtYodMLputYAqFn7fSWNDgH9OZo+ju88R1KOvHcHJ999oPyYLGM1lmm00lFc
	7Q/B1a572ZM1ATu01peZuw7OmyOowQYXkby68AMSTeIqBGwOS2yVEsM3Eo5G3yyxlCwf/VXIBDV1M
	DmbjdzBSAsdh9NpP7L5ewq864X8bJRKj222NoRXattsNKHwFuw6PfX9TWtj8Dkmj3t36m4xmMy53q
	SfHMAS1313bhQU/0CLrpNWYnofFhZbj2ZLQSMm/+TZc8ene4H+Vk+7/fWLaRezZ8jwO/yGEoUlBY3
	LggB6HmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtCV-00000006zlX-2Aeq;
	Wed, 17 Dec 2025 15:12:27 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtCS-00000006zkh-2Y6C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:12:26 +0000
X-UUID: c2360be2db5a11f0a38c85956e01ac42-20251217
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:103571b8-3570-4dcd-a117-4b06b511d359,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:c820d83abc7cff5adbf79ca67a181cfa,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2360be2db5a11f0a38c85956e01ac42-20251217
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1945369742; Wed, 17 Dec 2025 23:12:10 +0800
From: tanze@kylinos.cn
To: xry111@xry111.site,
	james.morse@arm.com,
	catalin.marinas@arm.com,
	maz@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH v1] arm64/mpam: Replace the arm64.nompam parameter with arm64.mpam
Date: Wed, 17 Dec 2025 23:11:59 +0800
Message-Id: <20251217151159.1076002-1-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_071224_950901_6E1052D3 
X-CRM114-Status: GOOD (  13.26  )
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

From: tanze <tanze@kylinos.cn>

In practical application scenarios, some manufacturers use outdated
firmware and do not add relevant configurations to the kernel command
line during deployment, which will result in system boot failure.
For manufacturers, disabling the MPAM feature by default and
enabling it via additional boot parameters only when required
is a more effective way to ensure compatibility.

Fixes: 10f885d63a0e ("arm64: Add override for MPAM")
Signed-off-by: tanze <tanze@kylinos.cn>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 +++---
 arch/arm64/kernel/pi/idreg-override.c           | 8 +++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85..c10d9529147c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -556,9 +556,6 @@ Kernel parameters
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
-	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
-			Monitoring support
-
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
 
@@ -571,6 +568,9 @@ Kernel parameters
 	arm64.nosve	[ARM64] Unconditionally disable Scalable Vector
 			Extension support
 
+	arm64.mpam	[ARM64] Unconditionally enable Memory Partitioning And
+			Monitoring support
+
 	ataflop=	[HW,M68k]
 
 	atarimouse=	[HW,MOUSE] Atari Mouse
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7..f4e3972155c4 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -248,7 +248,7 @@ static const struct {
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
 	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
-	{ "arm64.nompam",		"id_aa64pfr0.mpam=0 id_aa64pfr1.mpam_frac=0" },
+	{ "arm64.mpam",			"id_aa64pfr0.mpam=1 id_aa64pfr1.mpam_frac=1" },
 };
 
 static int __init parse_hexdigit(const char *p, u64 *v)
@@ -409,6 +409,12 @@ void __init init_feature_override(u64 boot_status, const void *fdt,
 
 	__boot_status = boot_status;
 
+	/*
+	 * Set the boot parameter to disable the MPAM feature,
+	 * thus avoiding system boot failure.
+	 */
+	match_options("id_aa64pfr0.mpam=0 id_aa64pfr1.mpam_frac=0");
+
 	parse_cmdline(fdt, chosen);
 
 	for (i = 0; i < ARRAY_SIZE(regs); i++) {
-- 
2.25.1


