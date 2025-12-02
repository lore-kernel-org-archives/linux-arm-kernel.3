Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A7BCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSppY5oK+32CD0itjrNWAYgn4J0yGPHY1rA0h9HSTYg=; b=ld+dn9464HDVp/iKt6m7r3R7Fg
	Jz6X+n1Ac+H17fGAgU3+Wj71l7VIE0VDxAotvA5bgGq3/IoLFhebBUrHtpMZSmNJVz2dxkyGQpub/
	aRIFjOZ5Gxnk5hFO2e/e0JSzwzXbOjl+I0B0fiCLmaUi2bQiHdWBYFnAeILYIzjyeiSuT9GM6pgxv
	xp0yrr5Dox+l0vE13Vv11kzvvR7VctP8bVGx/RIj7e/OAkBKpdn+SCSUV+vRVm1eUrC2zZf1bxJ9R
	rDlMuh7TOxSMwxijfDbSCMqdSZGM2Gl0wG4XmVtezkullRvpfq6Lbz1RG2KXB3BZELK9P0WK333Z2
	9693UH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMot-000000058hD-1NZp;
	Tue, 02 Dec 2025 09:37:15 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoV-000000058AP-00Kg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:54 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b2ffe9335so4318215f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668209; x=1765273009; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KSppY5oK+32CD0itjrNWAYgn4J0yGPHY1rA0h9HSTYg=;
        b=FOAd79lPVkxAwODGXrBcVJzV6GIkxCdclz+rvP741AnMVgE+RJ0bhLIrshdmrgyPct
         ym2KUTNK87jrw7shTrVioPfsRxaEMZD9hnzHRWgsi6KIB6a2PlCIhX3DYv4t2X+i9HCk
         8f+Nz6OnGZKt6itEtB/F2cMCr88lDEIVlUFc0lUJ2vqt6OwdO58IgC+NlxALq7Km9B4g
         Vg0jI5cTHfVUv1Mzykm1pr5dBZ6xjTSOpNgSWj2yoC9kGpjjAvEKo90E5aVqGRav/emc
         no5nVzh4dL4hWm7DTHnW9qzqaLresw54x/lwqn5/pf5nX5fFEuLZaJ3EImiKflbpti7H
         iOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668209; x=1765273009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSppY5oK+32CD0itjrNWAYgn4J0yGPHY1rA0h9HSTYg=;
        b=A51+VP3u/4zw1bshqNiL2rgiPiJnF0jQV9s0mGPTwu/Azx40iBjKTV0k3uMVbNPq2o
         dJTZHQU6VcSYV2JBHcP6k5GibZX0JXLSiA4RN0EDO+kzKzEnsD4jM7pooFWfzmcU91DM
         bhksop6mY6b3AeDHc0HOs0WyGGsmVYfiFwSbWTlLnQRjeeybGCs702zQ+vf5u2pj52xi
         A16dtFkQDijeFLLj2b8ukLzrYXPA2vl456kpvtdYcRpmV0QJHZ6lOo9amxOjFx0iS4CV
         gT3Y6Q8G/f+YDrxQptqKJw/l9oFeWZyhXc38GgP1PS/XJ5HmmpvZvdF1SYlH8QIU1UDF
         zO5A==
X-Forwarded-Encrypted: i=1; AJvYcCV+DMO3Mcb+J8uoo5nm+Xed1E16+z0lKxs3iWiyCLFWJn4lIPXi6EhnRcgFZxFKg5RD7EfTbfWOkhnYhO0M1HP+@lists.infradead.org
X-Gm-Message-State: AOJu0YzmHVoLxKbvUyQ27SX5qbqiRP4aUgI8ugP8/lqUgtcIxUjMxrOn
	+DI79ssSZ20i08hk09yg7MuJm+IJLIXUVDzcqCW6eY6K1f8pNF9+kVxpYM2jzP6LWHbgUD7lKMR
	hyuq8CKpk483THU3oAq8B1w==
X-Google-Smtp-Source: AGHT+IEoSfdY0P3iXQY3FCb+tHcmigvpocatUt6YkOF7zXtHSG/5g+bu26HCdo+YrjUqY1sE2DfDGCXrnlid7WmZ
X-Received: from wmrc15.prod.google.com ([2002:a05:600c:acf:b0:476:ddb0:2391])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f85:b0:477:9c73:267f with SMTP id 5b1f17b1804b1-477c01ff629mr365899995e9.33.1764668208923;
 Tue, 02 Dec 2025 01:36:48 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:11 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-19-vdonnefort@google.com>
Subject: [PATCH v9 18/30] tracing: Check for undefined symbols in simple_ring_buffer
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_013651_098285_75270FE1 
X-CRM114-Status: UNSURE (   7.86  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The simple_ring_buffer implementation must remain simple enough to be
used by the pKVM hypervisor. Prevent the object build if unresolved
symbols are found.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 53534447e70b..38523ea2e19b 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -114,4 +114,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
 obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
 obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
 
+#
+# simple_ring_buffer is used by the pKVM hypervisor which does not have access
+# to all kernel symbols. Fail the build if forbidden symbols are found.
+#
+UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
+UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
+UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
+
+quiet_cmd_check_undefined = NM      $<
+      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
+
+$(obj)/%.o.checked: $(obj)/%.o FORCE
+	$(call if_changed,check_undefined)
+
+always-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o.checked
+
 libftrace-y := ftrace.o
-- 
2.52.0.107.ga0afd4fd5b-goog


