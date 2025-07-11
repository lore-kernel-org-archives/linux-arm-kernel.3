Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE42AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMFPZ8IrMjqiIE9bHcG8tr3UGU/I4RiiuVq8nzCqZJ4=; b=1qrezO1cVD/zbel1qH8U7UIBAx
	umG4erUPznmp3KlvVi/Dzqc6G2bz3t5hTKHf9oyydmx/4jFIE4JMMnRl/gNHfJGDXYKNOE6NFutzh
	ooDWLXlgzs4Z5HgF4bcej+KVpnL6yobqITUGaqu2vek5dEl1lAtO2LZ3kBsZfXOAXSJyYYB/DGAb0
	5aDYgPiWlOzajN7x3LBL2L1hSJS1Z9TbRDs8UXamrtN+p8A/gcGxOlsbO7OeYdRN+b0tiVTcoognZ
	p16m2hrJCxE9VPM6CErsu7wLpissGZ4h75Xcf8fjjEBPXW1lQ3dQUJCOEqz2YqTErKDnF1TDwRD7Z
	CFyG8RFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKO7-0000000FnHg-49CI;
	Fri, 11 Jul 2025 20:30:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJGr-0000000Fcuh-3bIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 19:18:59 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 955732115802; Fri, 11 Jul 2025 12:18:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 955732115802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1752261535;
	bh=UMFPZ8IrMjqiIE9bHcG8tr3UGU/I4RiiuVq8nzCqZJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcKyRt95LY91swi1TdKcoT+mfHyF8tYy50XkcwH3KV167LODNbEpbYPioy6kFWxCO
	 dF+ZYckPR0PiLgpf/y5W1z7ynyZJ3RLJDs1ZQ32UnXd3dI/ndJe/RFCCgk2J9ThxGg
	 69MVy8hY5lgivpclVpsy5xpMjZp+LNQPaEVhusq8=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	tglx@linutronix.de,
	bhelgaas@google.com,
	romank@linux.microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH v3 1/3] Drivers: hv: Use nested hypercall for post message and signal event
Date: Fri, 11 Jul 2025 12:18:50 -0700
Message-Id: <1752261532-7225-2-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1752261532-7225-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1752261532-7225-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_121857_942459_42C4536E 
X-CRM114-Status: GOOD (  10.85  )
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

When running nested, these hypercalls must be sent to the L0 hypervisor
or VMBus will fail.

Remove hv_do_nested_hypercall() and hv_do_fast_nested_hypercall8()
altogether and open-code these cases, since there are only 2 and all
they do is add the nested bit.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
---
 arch/x86/include/asm/mshyperv.h | 20 --------------------
 drivers/hv/connection.c         |  5 ++++-
 drivers/hv/hv.c                 |  6 ++++--
 3 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index e1752ba47e67..ab097a3a8b75 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -112,12 +112,6 @@ static inline u64 hv_do_hypercall(u64 control, void *input, void *output)
 	return hv_status;
 }
 
-/* Hypercall to the L0 hypervisor */
-static inline u64 hv_do_nested_hypercall(u64 control, void *input, void *output)
-{
-	return hv_do_hypercall(control | HV_HYPERCALL_NESTED, input, output);
-}
-
 /* Fast hypercall with 8 bytes of input and no output */
 static inline u64 _hv_do_fast_hypercall8(u64 control, u64 input1)
 {
@@ -165,13 +159,6 @@ static inline u64 hv_do_fast_hypercall8(u16 code, u64 input1)
 	return _hv_do_fast_hypercall8(control, input1);
 }
 
-static inline u64 hv_do_fast_nested_hypercall8(u16 code, u64 input1)
-{
-	u64 control = (u64)code | HV_HYPERCALL_FAST_BIT | HV_HYPERCALL_NESTED;
-
-	return _hv_do_fast_hypercall8(control, input1);
-}
-
 /* Fast hypercall with 16 bytes of input */
 static inline u64 _hv_do_fast_hypercall16(u64 control, u64 input1, u64 input2)
 {
@@ -223,13 +210,6 @@ static inline u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
 	return _hv_do_fast_hypercall16(control, input1, input2);
 }
 
-static inline u64 hv_do_fast_nested_hypercall16(u16 code, u64 input1, u64 input2)
-{
-	u64 control = (u64)code | HV_HYPERCALL_FAST_BIT | HV_HYPERCALL_NESTED;
-
-	return _hv_do_fast_hypercall16(control, input1, input2);
-}
-
 extern struct hv_vp_assist_page **hv_vp_assist_page;
 
 static inline struct hv_vp_assist_page *hv_get_vp_assist_page(unsigned int cpu)
diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index be490c598785..1fe3573ae52a 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -519,7 +519,10 @@ void vmbus_set_event(struct vmbus_channel *channel)
 		else
 			WARN_ON_ONCE(1);
 	} else {
-		hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
+		u64 control = HVCALL_SIGNAL_EVENT;
+
+		control |= hv_nested ? HV_HYPERCALL_NESTED : 0;
+		hv_do_fast_hypercall8(control, channel->sig_event);
 	}
 }
 EXPORT_SYMBOL_GPL(vmbus_set_event);
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index 308c8f279df8..b14c5f9e0ef2 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -85,8 +85,10 @@ int hv_post_message(union hv_connection_id connection_id,
 		else
 			status = HV_STATUS_INVALID_PARAMETER;
 	} else {
-		status = hv_do_hypercall(HVCALL_POST_MESSAGE,
-					 aligned_msg, NULL);
+		u64 control = HVCALL_POST_MESSAGE;
+
+		control |= hv_nested ? HV_HYPERCALL_NESTED : 0;
+		status = hv_do_hypercall(control, aligned_msg, NULL);
 	}
 
 	local_irq_restore(flags);
-- 
2.34.1


