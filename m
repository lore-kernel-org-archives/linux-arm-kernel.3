Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D43E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 00:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCYhLJZhR58ewaFrjgMGyGbHfnpNdzHm23IqgQZ/0wM=; b=26sdoya8NhSfavl4LS3k5pDXL4
	6nn74phQxawc3wA6EIPCZPlmYjCQRKW2/dnG2sT+OcdE2okPbShXGbo0XIQMlgydZTSqb4L6S+0k8
	Q7+6MjqzO3bIYI7B3HA1Sd7ss081BTE7dJ2Dvuc73NbZuKB8eRsd8ZVM6N4L+aCjpWh+YQjLTrUeh
	8/qXjF+4gd8QBZPCDy37Y9GZeVVd0ciCGL5hOEt9NCdZ2KOrv3dbTiOU1Ngh0wayn6XsHpSYrAvlv
	JHn3gkXWioUCCw3F+vC2dFikiKnoR8u2bRjaD7j9M0snmZ4NKDuSGTFnFp7sPsVLkqiqqVof2L9Cr
	e7MDI4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGRE-00000005RAW-10z8;
	Sat, 14 Dec 2024 00:55:20 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGP7-00000005Qlf-2aLH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:10 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so1951698a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137589; x=1734742389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCYhLJZhR58ewaFrjgMGyGbHfnpNdzHm23IqgQZ/0wM=;
        b=KEIkP9fJ3ud1hPJ+rlV/jWzTxj2VPZQzZb5ICr6R8L7ANZeuIfxDk9Ja+GKEiRmS1I
         o8hCGuWEvh/TR0xJcsPriHsI/1BLalqgQYgm5A9dfXynyz5vGiybkP+lKMhjS/NlRx4o
         nIPbuQ5Kvll4EO58E0+McV5XTutyhSaX4tjlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137589; x=1734742389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCYhLJZhR58ewaFrjgMGyGbHfnpNdzHm23IqgQZ/0wM=;
        b=J/iM/r7EenpZxPBHsEhmPOMkmNuLUHcZeHCu/p3PQB3clHrs6nixtHWBaClrfnRRJe
         znaoll4a+EA6odPpflyXytMz+A7+kpPxW57XOAfXH0SMw/jNpbqO/fY7IHVOdAwN0syZ
         uNObN9TZFTeksp/EvtNqz4+/y3gGd2Xa/N1o8v4yRqEoVDwzUce/5exdMqTrADK9tg7d
         ddzuPOpsqqAwErvtX8CTc4jimzLLqyZ537zGRsgdokeew7oeC1m+SECWpicmUJ+oQxaL
         uyxX6itkSpVV9fFqpV1vBoPaD/omGJc/dlSOXtOgL0I69zwrSuyW4f6p9HujvVKpTk/Z
         ozug==
X-Forwarded-Encrypted: i=1; AJvYcCXekm4ktaj1XG7naqtlTpIcEiHOwTyVqhFc0IStdowWFPIFukXG43ZmwRrucoQTEuCc8tbpaFRHMedK0qpV9t3+@lists.infradead.org
X-Gm-Message-State: AOJu0YyhcEEIPoGmzo1YDT3w2ccGtxal0cDytp/F001tDgsZEIWbBALa
	mDdbNs9E96yBF1/OL6IvsPwmi38n6Mvr5ZLPLSPlVI3GniziX0z3KHnYr9Ipem6biYDSzDgUCHX
	92IRY
X-Gm-Gg: ASbGncv+a0KyrkPmkQL2f67z15wDkvVzcGvRrJ3qAyFCkj0QtvTWQeI0GW3WL47buhD
	evrfwdgC6slcoMN5ZHM20VjDRH8rURIcYikZ7fk/EMl9tQTFlVVwc5Uj/KTq8RCokL7p6Sgaooj
	81HFmAXAOJCH1iJtwJOW9urbYlkOxCChptLc4G4IMn6PfMBxCT6ZpaqvGBuzmlhYsr6QxsBd5Td
	RbKI9fkQl/xDjW4uU9ObjIQVEYwIf9p7qYkM9JqgUFwuHpJ2yGtCIYP64K2DOuQ+9ElrsrfXv98
X-Google-Smtp-Source: AGHT+IGyZAYcBNhvS6uotk+yKNrfDXGIRBKVBPzRwnHoQvCbP1TZ1iFVgP8Qo1WHFe4yMk8mfH9X9g==
X-Received: by 2002:a17:90b:4d08:b0:2ee:ab10:c187 with SMTP id 98e67ed59e1d1-2f28fd6b5f3mr6479214a91.18.1734137588765;
        Fri, 13 Dec 2024 16:53:08 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:08 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
Date: Fri, 13 Dec 2024 16:52:02 -0800
Message-ID: <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241214005248.198803-1-dianders@chromium.org>
References: <20241214005248.198803-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165309_653731_3DFB106E 
X-CRM114-Status: GOOD (  21.31  )
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

Flip the code on its head and instead list CPU IDs for cores that are
known to be _not_ affected. Now CPUs will be assumed vulnerable until
added to the list saying that they're safe.

As of right now, the only CPU IDs added to the "unaffected" list are
ARM Cortex A35, A53, and A55. This list was created by looking at
older cores listed in cputype.h that weren't listed in the "affected"
list previously.

Unfortunately, while this solution is better than what we had before,
it's still an imperfect solution. Specifically there are two ways to
mitigate Spectre BHB and one of those ways is parameterized with a "k"
value indicating how many loops are needed to mitigate. If we have an
unknown CPU ID then we've got to guess about how to mitigate it. Since
more cores seem to be mitigated by looping (and because it's unlikely
that the needed FW code will be in place for FW mitigation for unknown
cores), we'll choose looping for unknown CPUs and choose the highest
"k" value of 32.

The downside of our guessing is that some CPUs may now report as
"mitigated" when in reality they should need a firmware mitigation.
We'll choose to put a WARN_ON splat in the logs in this case any time
we had to make a guess since guessing the right mitigation is pretty
awful. Hopefully this will encourage CPU vendors to add their CPU IDs
to the list.


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New

 arch/arm64/kernel/proton-pack.c | 46 +++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index da53722f95d4..39c5573c7527 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -841,13 +841,31 @@ enum bhb_mitigation_bits {
 };
 static unsigned long system_bhb_mitigations;
 
+static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
+	{},
+};
+
+static const struct midr_range spectre_bhb_safe_list[] = {
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
+	{},
+};
+
 /*
  * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before any
  * SCOPE_SYSTEM call will give the right answer.
+ *
+ * NOTE: Unknown CPUs are reported as affected. In order to make this work
+ * and still keep the list short, only handle CPUs where:
+ * - supports_csv2p3() returned false
+ * - supports_clearbhb() returned false.
  */
 u8 spectre_bhb_loop_affected(int scope)
 {
-	u8 k = 0;
+	u8 k;
 	static u8 max_bhb_k;
 
 	if (scope == SCOPE_LOCAL_CPU) {
@@ -886,6 +904,16 @@ u8 spectre_bhb_loop_affected(int scope)
 			k = 11;
 		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
 			k =  8;
+		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_safe_list) ||
+			 is_midr_in_range_list(read_cpuid_id(), spectre_bhb_firmware_mitigated_list))
+			k =  0;
+		else {
+			WARN_ONCE(true,
+				 "Unrecognized CPU %#010x, assuming Spectre BHB vulnerable\n",
+				 read_cpuid_id());
+			/* Hopefully k = 32 handles the worst case for unknown CPUs */
+			k = 32;
+		}
 
 		max_bhb_k = max(max_bhb_k, k);
 	} else {
@@ -916,24 +944,26 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
 	}
 }
 
+/*
+ * NOTE: Unknown CPUs are reported as affected. In order to make this work
+ * and still keep the list short, only handle CPUs where:
+ * - supports_csv2p3() returned false
+ * - supports_clearbhb() returned false.
+ * - spectre_bhb_loop_affected() returned 0.
+ */
 static bool is_spectre_bhb_fw_affected(int scope)
 {
 	static bool system_affected;
 	enum mitigation_state fw_state;
 	bool has_smccc = arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_NONE;
-	static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
-		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
-		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
-		{},
-	};
 	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
-					 spectre_bhb_firmware_mitigated_list);
+						 spectre_bhb_safe_list);
 
 	if (scope != SCOPE_LOCAL_CPU)
 		return system_affected;
 
 	fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
-	if (cpu_in_list || (has_smccc && fw_state == SPECTRE_MITIGATED)) {
+	if (!cpu_in_list || (has_smccc && fw_state == SPECTRE_MITIGATED)) {
 		system_affected = true;
 		return true;
 	}
-- 
2.47.1.613.gc27f4b7a9f-goog


