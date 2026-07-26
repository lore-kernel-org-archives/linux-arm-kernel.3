Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14B0C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHN7j1c1qpvzCHml0Yb9DW3l1T4sBXf6FrZ7o+K/N9s=; b=glNE3UR3oz6sj/Zxe2/WbBI7Jt
	9LxX6XVjOST5rV+mbAutkaYPAWYegvZQwSLFK83noDrY5nBHMm0V2ljRMqg+aXffiF9VVYlp6CKcP
	w1S/3Oc2pkc7G0inKeuzCsiYM1laEf3aMStOLLatBoM4Jk4i2Fx6Ztcv7V/zMQH/1/cGuqd3bjlTS
	UTCDzET8/WPCu7gHCZy6HVE3+TgtYHdBpZ+CtP9JerNgPZTco+wbMMx/FXSS/fspQ0YUeT02awAtA
	Hg9njp12Qxsi+XFUhxCc0/F9msTArejN0fpZNVhAKvUZIYS/oBz8CGPfHzhxV5kBmxcg2gF7Qn0j7
	4IrkU+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3WK-00000001UM3-0Pvh;
	Sun, 26 Jul 2026 18:24:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3WH-00000001ULN-0iNb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:24:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4954afac04bso23230565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090251; x=1785695051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHN7j1c1qpvzCHml0Yb9DW3l1T4sBXf6FrZ7o+K/N9s=;
        b=dj9bobFEKcjREN+J3corW4u7sCZyikFg8c9wyW0MidDYyVsQ0lV8zgq/oLRWIVJva+
         v1Q5y/YN+IJBNuEzkfUvUYYdg8mIVPdsOe8QwOENtCMF7poBItaIoW14deaAM24aeroH
         ZhymJ7RDEYCxCXWpuD/YsdZwKe03aigGFyOBeseCDo6Iof9DxeEsAi3Lbdwqrv4RVRZh
         awcyJKHVV8ha9mPWG7EbtboNZ/ly5fkvBb+Uovcu8zMo721hL3CJOewqwkDRP/0BmtoI
         hcXBDZCTx99GCtOiVdmaK4oUJsP8Q9A8NYhOX56QaAJsMebQ41aM1CILQ1f55nMaSNxs
         3w9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090251; x=1785695051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHN7j1c1qpvzCHml0Yb9DW3l1T4sBXf6FrZ7o+K/N9s=;
        b=roL0pOFT8e21OfZRkOcAgh91lrLJbRaIyipdtrAXdvTCv8lPNNJ3pXmzdUjSkLQibl
         HrCdTMK5M8MOWy9U5CIcQU5mAOC5bWq8Pa/hvY7Fiu0393wpjXDsnCP+5IPaNqRd0/XS
         5fKIAjEGWgGppC9d2qCwDwaOOIL1H7fxvrNnIvjlvh2DYtuOUFLmzrUzMIvfSBUQ9Oyd
         virUySK5mwR3G0mY7hHH4izkrNv4zhbFlFLuOfBbs0gEd6dwdLLS5HkBxCjmfbgJ1ZI0
         eL7AEA2vzy3ojCnd+l5gtV4TKWgPIAnDgCt9BcyP7DAXRQBjKrdwBIz+AglNjFbBGOoQ
         Q/bw==
X-Forwarded-Encrypted: i=1; AHgh+RqU8HNyIN5+bZYy8cXERXtmqKurjPIsYX6thly7WfYsogn4ibp63GkzZVR04uE0T1JVx6H0EyafPQNpDU+/t1nS@lists.infradead.org
X-Gm-Message-State: AOJu0YzUo3z2ZWPG3/FF9JMDXrLUvPU1WQwAlt88/zkbmuCgsQ2iGa2b
	Swa66lfyDkkzS7jwLa7v6juWB1ZTuPWVRsv0llGNBl0fToM4RsBe2+nb
X-Gm-Gg: AR+sD11uqCDKvkvyJ6p7INKEh3C0jXKD2no3X7er4vegMDROGh1yg86c3RSOAqm0wur
	y5+iA9XrZiSIket5hM5PdiPizHlkplsc+agpR8bdJ6a9X+r82UTy55adDPQB5ZLTk6+5gRCWnQI
	NbCC3s103J36FNup/ORnsz+YxlXIs6gWj9SG3XEBh3/pGZteE+tdv6xPmX7sZpLZKxKkW3z765x
	vTw18+g2zhxI0I1kPrDxH7X2dylTcDs7CuxB73AzgD9yykkphi2EyLzalU4+BQLskYvyiINHJOQ
	Pi0V4IIuB0dCDlGtTmSuRH5n+2TkhWd+V+fRGubuF6CTNcH+/dORPGiOzuaRMDlUx3D7MprEJkS
	nhSh9+lOcVmlIY847wCm7YIKu36L0nWZK1YiSSBP+W/KOYu5DqqKZUE2SX8lbdcSBA7+u7IKD7k
	F94ayc5YWT2o7RltUCTMnGGNwkOfh6yR0HZFZlrnVfCSyTGdrDsgp44Vs9ubQAg1C1+jbJ/xxOQ
	vpcN5+30i7Cv1qkqJ1P+UgA9F/t4hwaKqJaUoPtYeFt9vNzT6M=
X-Received: by 2002:a05:600c:1d0d:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-496b56b1b23mr75964785e9.7.1785090251254;
        Sun, 26 Jul 2026 11:24:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm42553563f8f.25.2026.07.26.11.24.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 11:24:10 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Liu Song <liusong@linux.alibaba.com>,
	shechenglong <shechenglong@xfusion.com>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: proton-pack: Restore the nospectre_bhb command-line option
Date: Sun, 26 Jul 2026 20:22:53 +0200
Message-Id: <20260726182253.6939-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112413_235348_E8DC1163 
X-CRM114-Status: GOOD (  17.21  )
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

Commit 7f1635737823 ("arm64: proton-pack: Fix hard lockup due to print in
scheduler context") moved the "mitigation disabled" printks into
spectre_print_disabled_mitigations(). For spectre-v2 and spectre-v4 only
the pr_info_once() calls were removed, but for spectre-bhb the whole
branch went with the print:

  -   } else if (cpu_mitigations_off() || __nospectre_bhb) {
  -           pr_info_once("spectre-bhb mitigation disabled ...\n");

spectre_bhb_enable_mitigation() therefore no longer tests __nospectre_bhb
or cpu_mitigations_off() and the mitigation is enabled regardless of the
command line. The parameter is still parsed and its flag is still checked
by spectre_print_disabled_mitigations(), so the kernel prints "spectre-bhb
mitigation disabled by command-line option" while
/sys/devices/system/cpu/vulnerabilities/spectre_v2 reports "Mitigation:
CSV2, BHB" and the vectors are switched to EL1_VECTOR_BHB_LOOP.

The only remaining escape is the SPECTRE_VULNERABLE arm at the top of the
chain, which a CSV2 core never reaches, so from Cortex-A76 and Neoverse N1
onwards both nospectre_bhb and mitigations=off are ignored. Both are
documented in Documentation/admin-guide/kernel-parameters.txt.

The identical mistake was made on the neighbouring compile-time-option
branch immediately before this regression and fixed shortly afterwards;
this command-line branch was missed.
build_bhb_mitigation() in arch/arm64/net/bpf_jit_comp.c still tests both
flags, so nospectre_bhb currently keeps the exception-vector loop while
dropping the cBPF epilogue mitigation.

Restore the check, folded into a spectre_bhb_mitigations_off() helper
alongside its spectre_v2/v4 counterparts, and use it for the boot-time
print in spectre_print_disabled_mitigations() as well. The print itself
already lives there and does not need restoring.

Tested under QEMU with -cpu neoverse-n1 (CSV2, no ECBHB, no CLRBHB).
Before, spectre_v2 read "Mitigation: CSV2, BHB" with and without the
option; after, nospectre_bhb and mitigations=off both give "Mitigation:
CSV2, but not BHB" and a boot without either is unchanged.

Fixes: 7f1635737823 ("arm64: proton-pack: Fix hard lockup due to print in scheduler context")
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2: fold the check into a spectre_bhb_mitigations_off() helper, matching
    spectre_v2_mitigations_off()/spectre_v4_mitigations_off(), and use it
    for the boot-time print too, as requested by Will. All three QEMU
    boots re-run on v2; results unchanged.
v1: https://lore.kernel.org/r/20260725122959.98361-1-kmehltretter@gmail.com/

 arch/arm64/kernel/proton-pack.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 7bb6553fec08..3bcf86154d95 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -1023,6 +1023,11 @@ static int __init parse_spectre_bhb_param(char *str)
 }
 early_param("nospectre_bhb", parse_spectre_bhb_param);

+static bool spectre_bhb_mitigations_off(void)
+{
+	return __nospectre_bhb || cpu_mitigations_off();
+}
+
 void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 {
 	bp_hardening_cb_t cpu_cb;
@@ -1036,6 +1041,8 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		/* No point mitigating Spectre-BHB alone. */
 	} else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
 		/* Do nothing */
+	} else if (spectre_bhb_mitigations_off()) {
+		/* Mitigation disabled on the command line */
 	} else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_HW, &system_bhb_mitigations);
@@ -1201,6 +1208,6 @@ void spectre_print_disabled_mitigations(void)
 	if (spectre_v4_mitigations_off())
 		pr_info("spectre-v4 %s", spectre_disabled_suffix);

-	if (__nospectre_bhb || cpu_mitigations_off())
+	if (spectre_bhb_mitigations_off())
 		pr_info("spectre-bhb %s", spectre_disabled_suffix);
 }
-- 
2.51.0

