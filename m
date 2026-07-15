Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618BEC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dwtuWs6fZAlqKW07ZWIa/L7IvORP1bCSU0S6TTxBnXQ=; b=C4reEYtnAilfWRXbyzk7mEu7xO
	wBGbqfojOJ9tE4LQ4Hk5eifB/R3dDKJrx4z3HLUKPwesB+kIMCLHxMSfnob5kTYWmCm9TCerRUek4
	StF2KlJZ86TIpkoxZbENgm+VmL7RyxXvv/Cq5644dQmGahcK2x71JSfUoVI3D8WBQRyNe/zbVMZTD
	7ZbWYQyR7D0qxl2kgys+P5226eXhO5VL3Ik01D/uxt4vzQ64OfuGo9l/V3nexswGDOlG5y4Nz/K9h
	mhKDYadeWYrimVU3zVR/6EbuMFeT3bJTVf02KtJQx4lVEa61gGLWXIscfiN2uRF9AVpiC0b3oEFc8
	fv3yJscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxCs-0000000EVQj-2IIF;
	Wed, 15 Jul 2026 10:51:14 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxCo-0000000EVQ1-0rpv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:51:13 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso157191466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784112667; x=1784717467; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwtuWs6fZAlqKW07ZWIa/L7IvORP1bCSU0S6TTxBnXQ=;
        b=YYL8dOjz2L8kJ/hyi7smkJntNA4uqexFx0Q0GrJu6lV0ceF3eV6vdy2mzNvGdX80dq
         raPglNshQln2KevBZ1ZcPb3sWfWYaOwwtbd3eax0KrKPoMXlZgzKKnzFp05KZW8a/Oss
         OK1Ta6i8ZV9RQJof4f/hlK6h0TVWi/KN+wYAbGMN09xDuMuS+yyPiXcs2TcJa8IaaT0w
         rJCHe2W7P9s36buPQQb0xEAQhWIyFId9p/BeYHkPGbXQ7AyZtOrnmbjEOHIspgGD5GMe
         EAyOgXBK4nf9nC0Ot+424PESrUadFawmp1zLC6ClNpXlJ2QPXFRy6ZKOd1C5C+yLL5/9
         6cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112667; x=1784717467;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwtuWs6fZAlqKW07ZWIa/L7IvORP1bCSU0S6TTxBnXQ=;
        b=WhslMgZQ/tqcWtG0XDEmAwDpX8grC/jdzhLQJWZIG+rCxpIRFok4UIzoXVtUOZkN51
         ST4BPmGCHj+jQoslrUoFiatXpZzJw9h5thm+z5RGUt4shCn9YVMy+V1lHEOna0B12x/m
         v/qYBeidiukMpXsZrQXID7DVpFrrTxpBTwq9uwwBdvPLFq5QOFaJDJThLV02oObycmeW
         QFA4oV+2qP6TsNZDG37X9q/fQOhaF6+kYRd5MWjG3wi6s5zJp0v1a3NRzTdmJN9V+6nf
         nplCl6qygVmu+9xQtGr/L9tdXc967SxyQnFJ8FoibPSelymKk2UCKqZgr1ACYp1xhErs
         6H4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqvz92k/l23cLfRSrhGZi89g1HEK6z92x+Tp5k56Xek/jmd78py1iV0LQww+VXcHe6wrbSAQu/o9i0H8vWOHn8f@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8B5AGo37bqgh1wlnPB7HwXNLbfB946C6ZGROOkHFH/JpV2xjB
	YFk1wU8P4G3DdByXQTAV/p8qiriUr5OGj/wNb/XhahmJve0H3DIjoJlqcl8Ka2u5bLMtGSni6H5
	10a7SvEnrh3vUDKePxagcSg==
X-Received: from edn4.prod.google.com ([2002:a05:6402:a0c4:b0:69a:a0e5:c4fe])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a703:b0:c16:66ad:f8ff with SMTP id a640c23a62f3a-c1666adfb6amr360778566b.39.1784112666977;
 Wed, 15 Jul 2026 03:51:06 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:51:00 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715105100.3178255-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Fix hyp_trace clock disabling
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_035110_288237_A7EE1748 
X-CRM114-Status: GOOD (  11.40  )
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

Fix the disable path in hyp_trace_clock_enable(), which fell through to
re-initialize and reschedule the clock after cancelling the work. Return
early instead.

While at it, cleanup hyp_trace_clock::lock which is unused and
hyp_trace_clock::running which is redundant: the trace_remote framework
already serializes calls to the callback enable_tracing.

Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

--- 

v1 -> v2:
  * Rollback hyp_trace_clock_enable() on __tracing_enable error (Sashiko)

v1: https://lore.kernel.org/all/alczBmnItMwq8xj4@google.com/

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932..9bfa368dd841 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -37,8 +37,6 @@ static struct hyp_trace_clock {
 	u32			shift;
 	struct delayed_work	work;
 	struct completion	ready;
-	struct mutex		lock;
-	bool			running;
 } hyp_clock;
 
 static void __hyp_clock_work(struct work_struct *work)
@@ -110,12 +108,9 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
 {
 	struct system_time_snapshot snap;
 
-	if (hyp_clock->running == enable)
-		return;
-
 	if (!enable) {
 		cancel_delayed_work_sync(&hyp_clock->work);
-		hyp_clock->running = false;
+		return;
 	}
 
 	ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
@@ -128,7 +123,6 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
 	INIT_DELAYED_WORK(&hyp_clock->work, __hyp_clock_work);
 	schedule_delayed_work(&hyp_clock->work, msecs_to_jiffies(CLOCK_INIT_MS));
 	wait_for_completion(&hyp_clock->ready);
-	hyp_clock->running = true;
 }
 
 /* Access to this struct within the trace_remote_callbacks are protected by the trace_remote lock */
@@ -304,9 +298,15 @@ static void hyp_trace_unload(struct trace_buffer_desc *desc, void *priv)
 
 static int hyp_trace_enable_tracing(bool enable, void *priv)
 {
+	int ret;
+
 	hyp_trace_clock_enable(&hyp_clock, enable);
 
-	return kvm_call_hyp_nvhe(__tracing_enable, enable);
+	ret = kvm_call_hyp_nvhe(__tracing_enable, enable);
+	if (ret)
+		hyp_trace_clock_enable(&hyp_clock, !enable);
+
+	return ret;
 }
 
 static int hyp_trace_swap_reader_page(unsigned int cpu, void *priv)

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.55.0.141.g00534a21ce-goog


