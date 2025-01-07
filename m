Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905ECE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyuPoGoas0FXrrfma5oME99Ny+q0qNNG5nUGFTCnZN8=; b=HMQxqe19KJVf0TRTmr/IXg9uQ6
	YuXolBx09pVRfq5NFu8FjvZVn9+pl131M1xMxbqbfzoJ4oXq7wbPF8mt1EV3aiZo/JnYLE2bg1pHE
	GKyFxQWM3n3LaFZPoHTkeLhrCfj8JRn+HHQfoSKXamltVA+HpPqGJ0JMcSdrvF/m8Qo2rT4XyZcSu
	NXIeqrKddXpqJX2P6Rg4eyruWPyRiMg+IxI/L47v46RdFrD2uE3KuN3twO9w9jEQiMfilK58rQNHc
	Vp5MTZvNokI5BkqEfqdQUS15NyvyvlrLrDtAQe5MVa/k7AfBnJIl7H3oEnFWN3e+/WvF6sJ3TLtWH
	dsAV7LMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFvd-00000006DCv-0tWD;
	Tue, 07 Jan 2025 20:11:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFs5-00000006CRq-1LYO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 20:08:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166f1e589cso18267045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 12:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280492; x=1736885292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyuPoGoas0FXrrfma5oME99Ny+q0qNNG5nUGFTCnZN8=;
        b=H086kfDwVupbkyrE6Lm0OibreduQq5GaZ6M2C2yKQ3bmn9DfbRpu3TFCeXQyHgwDj6
         LMoIBF+83vuncSREOLaVotiROJOjN/luH7OKDaFEJDl068/pVq3HWGf1ySXTdf6KjJ2W
         gBVA4ND67DVxFoI16iDhmTQYIq64S2l8Wxi/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280492; x=1736885292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyuPoGoas0FXrrfma5oME99Ny+q0qNNG5nUGFTCnZN8=;
        b=ENiuv31SSwtTlBD5R2jRfFcCsgfQB99DpDb+IyniK+eNMKqCjqlXybnvA96ddt0r3o
         bRlbUWbWWLmo+CAsiBqM6ZqPpIZ7QA4A9WK1NTTfuYc/sGmFzfyl4f4mSmjF4WeimmlS
         iMLZ4fhOwvGUjeszTiqTi3l2GBCT2Jm1CoAvxQH68Bimycn7exrRWJr8W/STtyECX0Mh
         PcjeldLn4k/Fx20h0cNp05NQMSO7eaGN2Lg1v66MJ60PxV/Vosoh+aunWcrQb7JjEZzS
         30fluBPMY6ONOIVpfuweYwqvLM/QpTtL9XmDFmlQW+pSnh8KE9wm2UduHENqMKGBMK4h
         xF1g==
X-Forwarded-Encrypted: i=1; AJvYcCXUGbDbfgEj+o7AwuwIgjTzJUaIJGNQvz+KJceJr/LM8/SEoDF5ZSUB0E72Zq0xqQwvsKURrYcGywJkmtT5Or8W@lists.infradead.org
X-Gm-Message-State: AOJu0YzwMS/dCqrHtNrRZoJg9SkoVb9x0M3OQ1+c7mbIZ3wHMUIws3zr
	9L7k5RCf42BZNmHsZZNH8GpqR5DcYNY3wDmHcqDAZhA78dFQweoeNrSPFfCsTA==
X-Gm-Gg: ASbGncvLD2xnjmVB3DjtMgjhnGcx6DOJM/B3stT7HewDQnJ809cy5GxL1yTaUI/9+Qe
	Ip+JdWfLoAIX2Y8qhPsq4o9sbI+t1PTcU64C/QL2kKqt5DniINaVE/WdmAS1K/ERaH3qik05MXM
	Z9JyW8zEfOPA946knSiM/BvGR7QfuabkK6w1F6AGryGAeaH4TsLDxCB8T48v9xE2D4qlvuVsO35
	aJETiMlSXbLH0Ge9LZOk6LQOwcnNCXLFnWWmevdcdQbfakMUo0z/Fw5ies4VmWCBVn8b4X2s7gU
X-Google-Smtp-Source: AGHT+IH9SDkWGRhHf89AC8Lyy6Me9FNM2MneEbrONqwNlFgWCin4uJi7+v53aHD2Xs3q0+CE3HhNxg==
X-Received: by 2002:a17:903:32cf:b0:216:644f:bc0e with SMTP id d9443c01a7336-21a83f502aemr4816215ad.24.1736280492102;
        Tue, 07 Jan 2025 12:08:12 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:11 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
Date: Tue,  7 Jan 2025 12:05:59 -0800
Message-ID: <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_120813_361982_F71EF115 
X-CRM114-Status: GOOD (  27.11  )
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

The code for detecting CPUs that are vulnerable to Spectre BHB was
based on a hardcoded list of CPU IDs that were known to be affected.
Unfortunately, the list mostly only contained the IDs of standard ARM
cores. The IDs for many cores that are minor variants of the standard
ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
code to assume that those variants were not affected.

Flip the code on its head and instead assume that a core is vulnerable
if it doesn't have CSV2_3 but is unrecognized as being safe. This
involves creating a "Spectre BHB safe" list.

As of right now, the only CPU IDs added to the "Spectre BHB safe" list
are ARM Cortex A35, A53, A55, A510, and A520. This list was created by
looking for cores that weren't listed in ARM's list [1] as per review
feedback on v2 of this patch [2]. Additionally Brahma A53 is added as
per mailing list feedback [3].

NOTE: this patch will not actually _mitigate_ anyone, it will simply
cause them to report themselves as vulnerable. If any cores in the
system are reported as vulnerable but not mitigated then the whole
system will be reported as vulnerable though the system will attempt
to mitigate with the information it has about the known cores.

[1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
[2] https://lore.kernel.org/r/20241219175128.GA25477@willie-the-truck
[3] https://lore.kernel.org/r/18dbd7d1-a46c-4112-a425-320c99f67a8d@broadcom.com


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Reviewed-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Add MIDR_BRAHMA_B53 as safe.
- Get rid of `spectre_bhb_firmware_mitigated_list`.

Changes in v3:
- Don't guess the mitigation; just report unknown cores as vulnerable.
- Restructure the code since is_spectre_bhb_affected() defaults to true

Changes in v2:
- New

 arch/arm64/include/asm/spectre.h |   1 -
 arch/arm64/kernel/proton-pack.c  | 203 ++++++++++++++++---------------
 2 files changed, 102 insertions(+), 102 deletions(-)

diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
index 0c4d9045c31f..f1524cdeacf1 100644
--- a/arch/arm64/include/asm/spectre.h
+++ b/arch/arm64/include/asm/spectre.h
@@ -97,7 +97,6 @@ enum mitigation_state arm64_get_meltdown_state(void);
 
 enum mitigation_state arm64_get_spectre_bhb_state(void);
 bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry, int scope);
-u8 spectre_bhb_loop_affected(int scope);
 void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *__unused);
 bool try_emulate_el1_ssbs(struct pt_regs *regs, u32 instr);
 
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index e149efadff20..17aa836fe46d 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -845,53 +845,70 @@ static unsigned long system_bhb_mitigations;
  * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before any
  * SCOPE_SYSTEM call will give the right answer.
  */
-u8 spectre_bhb_loop_affected(int scope)
+static bool is_spectre_bhb_safe(int scope)
+{
+	static const struct midr_range spectre_bhb_safe_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
+		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
+		{},
+	};
+	static bool all_safe = true;
+
+	if (scope != SCOPE_LOCAL_CPU)
+		return all_safe;
+
+	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_safe_list))
+		return true;
+
+	all_safe = false;
+
+	return false;
+}
+
+static u8 spectre_bhb_loop_affected(void)
 {
 	u8 k = 0;
-	static u8 max_bhb_k;
-
-	if (scope == SCOPE_LOCAL_CPU) {
-		static const struct midr_range spectre_bhb_k32_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
-			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
-			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
-			{},
-		};
-		static const struct midr_range spectre_bhb_k24_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
-			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
-			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
-			{},
-		};
-		static const struct midr_range spectre_bhb_k11_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_AMPERE1),
-			{},
-		};
-		static const struct midr_range spectre_bhb_k8_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
-			{},
-		};
-
-		if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
-			k = 32;
-		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
-			k = 24;
-		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
-			k = 11;
-		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
-			k =  8;
-
-		max_bhb_k = max(max_bhb_k, k);
-	} else {
-		k = max_bhb_k;
-	}
+
+	static const struct midr_range spectre_bhb_k32_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+		{},
+	};
+	static const struct midr_range spectre_bhb_k24_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
+		{},
+	};
+	static const struct midr_range spectre_bhb_k11_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+		{},
+	};
+	static const struct midr_range spectre_bhb_k8_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
+		{},
+	};
+
+	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
+		k = 32;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
+		k = 24;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
+		k = 11;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
+		k =  8;
 
 	return k;
 }
@@ -917,29 +934,13 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
 	}
 }
 
-static bool is_spectre_bhb_fw_affected(int scope)
+static bool has_spectre_bhb_fw_mitigation(void)
 {
-	static bool system_affected;
 	enum mitigation_state fw_state;
 	bool has_smccc = arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_NONE;
-	static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
-		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
-		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
-		{},
-	};
-	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
-					 spectre_bhb_firmware_mitigated_list);
-
-	if (scope != SCOPE_LOCAL_CPU)
-		return system_affected;
 
 	fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
-	if (cpu_in_list || (has_smccc && fw_state == SPECTRE_MITIGATED)) {
-		system_affected = true;
-		return true;
-	}
-
-	return false;
+	return has_smccc && fw_state == SPECTRE_MITIGATED;
 }
 
 static bool supports_ecbhb(int scope)
@@ -955,6 +956,8 @@ static bool supports_ecbhb(int scope)
 						    ID_AA64MMFR1_EL1_ECBHB_SHIFT);
 }
 
+static u8 max_bhb_k;
+
 bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
 			     int scope)
 {
@@ -963,16 +966,18 @@ bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
 	if (supports_csv2p3(scope))
 		return false;
 
-	if (supports_clearbhb(scope))
-		return true;
-
-	if (spectre_bhb_loop_affected(scope))
-		return true;
+	if (is_spectre_bhb_safe(scope))
+		return false;
 
-	if (is_spectre_bhb_fw_affected(scope))
-		return true;
+	/*
+	 * At this point the core isn't known to be "safe" so we're going to
+	 * assume it's vulnerable. We still need to update `max_bhb_k` though,
+	 * but only if we aren't mitigating with clearbhb though.
+	 */
+	if (scope == SCOPE_LOCAL_CPU && !supports_clearbhb(SCOPE_LOCAL_CPU))
+		max_bhb_k = max(max_bhb_k, spectre_bhb_loop_affected());
 
-	return false;
+	return true;
 }
 
 static void this_cpu_set_vectors(enum arm64_bp_harden_el1_vectors slot)
@@ -1003,7 +1008,7 @@ early_param("nospectre_bhb", parse_spectre_bhb_param);
 void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 {
 	bp_hardening_cb_t cpu_cb;
-	enum mitigation_state fw_state, state = SPECTRE_VULNERABLE;
+	enum mitigation_state state = SPECTRE_VULNERABLE;
 	struct bp_hardening_data *data = this_cpu_ptr(&bp_hardening_data);
 
 	if (!is_spectre_bhb_affected(entry, SCOPE_LOCAL_CPU))
@@ -1029,7 +1034,7 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		this_cpu_set_vectors(EL1_VECTOR_BHB_CLEAR_INSN);
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_INSN, &system_bhb_mitigations);
-	} else if (spectre_bhb_loop_affected(SCOPE_LOCAL_CPU)) {
+	} else if (spectre_bhb_loop_affected()) {
 		/*
 		 * Ensure KVM uses the indirect vector which will have the
 		 * branchy-loop added. A57/A72-r0 will already have selected
@@ -1042,32 +1047,29 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		this_cpu_set_vectors(EL1_VECTOR_BHB_LOOP);
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_LOOP, &system_bhb_mitigations);
-	} else if (is_spectre_bhb_fw_affected(SCOPE_LOCAL_CPU)) {
-		fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
-		if (fw_state == SPECTRE_MITIGATED) {
-			/*
-			 * Ensure KVM uses one of the spectre bp_hardening
-			 * vectors. The indirect vector doesn't include the EL3
-			 * call, so needs upgrading to
-			 * HYP_VECTOR_SPECTRE_INDIRECT.
-			 */
-			if (!data->slot || data->slot == HYP_VECTOR_INDIRECT)
-				data->slot += 1;
-
-			this_cpu_set_vectors(EL1_VECTOR_BHB_FW);
-
-			/*
-			 * The WA3 call in the vectors supersedes the WA1 call
-			 * made during context-switch. Uninstall any firmware
-			 * bp_hardening callback.
-			 */
-			cpu_cb = spectre_v2_get_sw_mitigation_cb();
-			if (__this_cpu_read(bp_hardening_data.fn) != cpu_cb)
-				__this_cpu_write(bp_hardening_data.fn, NULL);
-
-			state = SPECTRE_MITIGATED;
-			set_bit(BHB_FW, &system_bhb_mitigations);
-		}
+	} else if (has_spectre_bhb_fw_mitigation()) {
+		/*
+		 * Ensure KVM uses one of the spectre bp_hardening
+		 * vectors. The indirect vector doesn't include the EL3
+		 * call, so needs upgrading to
+		 * HYP_VECTOR_SPECTRE_INDIRECT.
+		 */
+		if (!data->slot || data->slot == HYP_VECTOR_INDIRECT)
+			data->slot += 1;
+
+		this_cpu_set_vectors(EL1_VECTOR_BHB_FW);
+
+		/*
+		 * The WA3 call in the vectors supersedes the WA1 call
+		 * made during context-switch. Uninstall any firmware
+		 * bp_hardening callback.
+		 */
+		cpu_cb = spectre_v2_get_sw_mitigation_cb();
+		if (__this_cpu_read(bp_hardening_data.fn) != cpu_cb)
+			__this_cpu_write(bp_hardening_data.fn, NULL);
+
+		state = SPECTRE_MITIGATED;
+		set_bit(BHB_FW, &system_bhb_mitigations);
 	}
 
 	update_mitigation_state(&spectre_bhb_state, state);
@@ -1101,7 +1103,6 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
 {
 	u8 rd;
 	u32 insn;
-	u16 loop_count = spectre_bhb_loop_affected(SCOPE_SYSTEM);
 
 	BUG_ON(nr_inst != 1); /* MOV -> MOV */
 
@@ -1110,7 +1111,7 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
 
 	insn = le32_to_cpu(*origptr);
 	rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn);
-	insn = aarch64_insn_gen_movewide(rd, loop_count, 0,
+	insn = aarch64_insn_gen_movewide(rd, max_bhb_k, 0,
 					 AARCH64_INSN_VARIANT_64BIT,
 					 AARCH64_INSN_MOVEWIDE_ZERO);
 	*updptr++ = cpu_to_le32(insn);
-- 
2.47.1.613.gc27f4b7a9f-goog


