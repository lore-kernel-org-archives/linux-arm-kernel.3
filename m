Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5089ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8M+85N7vxPlT6EdfKNMF7iLZL6P7LA7QnBJfg2pIwHw=; b=g9Sg2JgoUVAFGXRYvP4TY1M72i
	aajLsrX3gMhXGiAJN0+FBDJ5FzRQyvju1EYItWhEJX03xsj3MN3VbXwoRWJr0m7/2i0P9gLwDzJ48
	CKGaseAlMgvsE0FDbXzOheLdsNi8sWAGEvU88QuUm+EaOyIaXjQBn5UY+qQ3Zu6bvVmUf1wKi/n67
	vgCsxecF5gyKp7YgWVnpkRLgfsPeisrNZXQmofonIukrWwGqbCvpUuExTTah+JGsbWYfgBsB/9t9O
	jyGYQvhbDNCV0R//63Bq2fsOdacLetMqg/sT+5ADdSCo5SDSbCwIMsKyjJlYQweOQej95A+jmfFG/
	sbm3yhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArF0-0000000E0pt-0hRr;
	Mon, 20 Oct 2025 14:52:06 +0000
Received: from wxsgout04.xfusion.com ([36.139.87.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArEx-0000000E0n6-03A6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:52:04 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cqyxl3NzQzBC2xT;
	Mon, 20 Oct 2025 22:49:31 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Mon, 20 Oct 2025 22:51:41 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, <stone.xulei@xfusion.com>,
	<chenjialong@xfusion.com>, <yuxiating@xfusion.com>, shechenglong
	<shechenglong@xfusion.com>
Subject: [PATCH v2 2/2] cpu: fix hard lockup triggered by printk calls within
  scheduling context
Date: Mon, 20 Oct 2025 22:51:17 +0800
Message-ID: <20251020145118.1306-3-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.38.0.windows.1
In-Reply-To: <20251020145118.1306-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20251020145118.1306-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03045.xfusion.com (10.32.131.99) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_075203_645015_F25743CC 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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
Reply-To: linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

relocate the printk() calls from spectre_v4_mitigations_off() and=0D
spectre_v2_mitigations_off() into setup_system_capabilities() function,=0D
preventing hard lockups that occur when printk() is invoked from scheduler =
context.=0D
=0D
Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/202509180=
64907.1832-1-shechenglong@xfusion.com/=0D
Suggested-by: Mark Rutland <mark.rutland@arm.com>=0D
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>=0D
Suggested-by: Will Deacon <will@kernel.org>=0D
Signed-off-by: shechenglong <shechenglong@xfusion.com>=0D
---=0D
 arch/arm64/include/asm/spectre.h |  2 ++=0D
 arch/arm64/kernel/cpufeature.c   |  7 ++++++-=0D
 arch/arm64/kernel/proton-pack.c  | 28 ++++++++++++++--------------=0D
 3 files changed, 22 insertions(+), 15 deletions(-)=0D
=0D
diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spec=
tre.h=0D
index 8fef12626090..f244b52fb123 100644=0D
--- a/arch/arm64/include/asm/spectre.h=0D
+++ b/arch/arm64/include/asm/spectre.h=0D
@@ -118,5 +118,7 @@ void spectre_bhb_patch_wa3(struct alt_instr *alt,=0D
 void spectre_bhb_patch_clearbhb(struct alt_instr *alt,=0D
                                __le32 *origptr, __le32 *updptr, int nr_ins=
t);=0D
=0D
+void spectre_print_disabled_mitigations(void);=0D
+=0D
 #endif /* __ASSEMBLY__ */=0D
 #endif /* __ASM_SPECTRE_H */=0D
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.=
c=0D
index 5ed401ff79e3..6836e314fd30 100644=0D
--- a/arch/arm64/kernel/cpufeature.c=0D
+++ b/arch/arm64/kernel/cpufeature.c=0D
@@ -94,7 +94,7 @@=0D
 #include <asm/traps.h>=0D
 #include <asm/vectors.h>=0D
 #include <asm/virt.h>=0D
-=0D
+#include <asm/spectre.h>=0D
 /* Kernel representation of AT_HWCAP and AT_HWCAP2 */=0D
 static DECLARE_BITMAP(elf_hwcap, MAX_CPU_FEATURES) __read_mostly;=0D
=0D
@@ -3875,6 +3875,11 @@ static void __init setup_system_capabilities(void)=0D
         */=0D
        if (system_uses_ttbr0_pan())=0D
                pr_info("emulated: Privileged Access Never (PAN) using TTBR=
0_EL1 switching\n");=0D
+=0D
+       /*=0D
+        * Report Spectre mitigations status.=0D
+        */=0D
+       spectre_print_disabled_mitigations();=0D
 }=0D
=0D
 void __init setup_system_features(void)=0D
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pac=
k.c=0D
index d833b7c1bba8..386f986e6b5d 100644=0D
--- a/arch/arm64/kernel/proton-pack.c=0D
+++ b/arch/arm64/kernel/proton-pack.c=0D
@@ -91,12 +91,7 @@ early_param("nospectre_v2", parse_spectre_v2_param);=0D
=0D
 static bool spectre_v2_mitigations_off(void)=0D
 {=0D
-       bool ret =3D __nospectre_v2 || cpu_mitigations_off();=0D
-=0D
-       if (ret)=0D
-               pr_info_once("spectre-v2 mitigation disabled by command lin=
e option\n");=0D
-=0D
-       return ret;=0D
+       return __nospectre_v2 || cpu_mitigations_off();=0D
 }=0D
=0D
 static const char *get_bhb_affected_string(enum mitigation_state bhb_state=
)=0D
@@ -421,13 +416,8 @@ early_param("ssbd", parse_spectre_v4_param);=0D
  */=0D
 static bool spectre_v4_mitigations_off(void)=0D
 {=0D
-       bool ret =3D cpu_mitigations_off() ||=0D
+       return cpu_mitigations_off() ||=0D
                   __spectre_v4_policy =3D=3D SPECTRE_V4_POLICY_MITIGATION_=
DISABLED;=0D
-=0D
-       if (ret)=0D
-               pr_info_once("spectre-v4 mitigation disabled by command-lin=
e option\n");=0D
-=0D
-       return ret;=0D
 }=0D
=0D
 /* Do we need to toggle the mitigation state on entry to/exit from the ker=
nel? */=0D
@@ -1042,8 +1032,6 @@ void spectre_bhb_enable_mitigation(const struct arm64=
_cpu_capabilities *entry)=0D
=0D
        if (arm64_get_spectre_v2_state() =3D=3D SPECTRE_VULNERABLE) {=0D
                /* No point mitigating Spectre-BHB alone. */=0D
-       } else if (cpu_mitigations_off() || __nospectre_bhb) {=0D
-               pr_info_once("spectre-bhb mitigation disabled by command li=
ne option\n");=0D
        } else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {=0D
                state =3D SPECTRE_MITIGATED;=0D
                set_bit(BHB_HW, &system_bhb_mitigations);=0D
@@ -1197,3 +1185,15 @@ void unpriv_ebpf_notify(int new_state)=0D
                pr_err("WARNING: %s", EBPF_WARN);=0D
 }=0D
 #endif=0D
+=0D
+void spectre_print_disabled_mitigations(void)=0D
+{=0D
+       if (spectre_v2_mitigations_off())=0D
+               pr_info("spectre-v2 mitigation disabled by command-line opt=
ion\n");=0D
+=0D
+       if (spectre_v4_mitigations_off())=0D
+               pr_info("spectre-v4 mitigation disabled by command-line opt=
ion\n");=0D
+=0D
+       if (__nospectre_bhb || cpu_mitigations_off())=0D
+               pr_info("spectre-bhb mitigation disabled by command-line op=
tion\n");=0D
+}=0D
--=0D
2.33.0=0D

