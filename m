Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059C9F4180F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISTtnZxQZml/VUbaQMgN/rAKYfhBuJPSGaUgT7FyeoU=; b=uaA5LHH6ueBORb3hogwW0OwY2d
	XToVZRpSKKHIecYcID9EKAN1Af3fZBPG4J5Cs5BxHmTWyWUhqkzzQh5F2neX7y+5alx7CSJ0f+Tl0
	MNS3R7yEi/JacLDOrQBdNMlyU8FQuUbeB6w5yTlVcsUO2/amrb74NpRlLNUkAMLgqT3q1oXRMCpRY
	c+be5M6GTZ9nn28QygvrCYQHsVb+V99vHvgTnBcfqUjKxHRWyOSMcjA5StLv/u3OXqiM6cdDgwQGh
	SfjaYHvikWn0WX10DB7QYobo9JZmrMlCFBUmd6uVTvGt62Wtn501BFpgL7Ymqzpoub6Z9SZkWSKMI
	6Q9qumBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRG-00000007hXV-1ejs;
	Mon, 09 Mar 2026 16:26:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQz-00000007h7T-0RkT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:22 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-485390246c8so15441525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073579; x=1773678379; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISTtnZxQZml/VUbaQMgN/rAKYfhBuJPSGaUgT7FyeoU=;
        b=D5WM45L0enNwtRgfJwJb/pMfsquiM1w93EhboKYAICdScrgQL26KCx64pOOvM7lBZo
         +GyrPYaoKv4qKxnChobjCs1nZEhq6C/ODTEsFYz/PRc/ugtysiOGhZ8IjJV4VuKJ6+Fv
         D7J+pk8ZPJ+133LbOiCrmEeNvSaqDXSOPFnktREb2hP92Z44KWyFvSXP8LFv1vxbOAX0
         4mcSS6LmxiIxxItKwEinG9RbGDfS5EpWSU7gxDsTBoUV18TAwuFYt5a27IUEby76HQhk
         L7aSsCRvc0R6pgjZI1k5mRd0wGmvyZPGHJb3vZRkPWYqVNVC1dhaX6rokWWgc9x+58gB
         WCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073579; x=1773678379;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISTtnZxQZml/VUbaQMgN/rAKYfhBuJPSGaUgT7FyeoU=;
        b=TYFLdPtvq7ilqEcvRD/nwOVhMN3fWB+fMarS6/2BcoOjTDIx8LOVM2Dz30SdreOamQ
         fFG3oOZ6guyMqPu0q64VUuQVPLTQ5rFbK7wFwc4cisU70WPMM5yS0dPMAAk4KfsXJdV0
         phXrT6Sy8JIs1NnP6+qvUDrJ1VSO6Sj5kP+yqj+sFXCOhjwFB6/F6HkO5kMop7OPpRMS
         hVkIRwB6lx1Bq9nxSdOcF41TwAbWvcWWlfeDeNDITm/KOuiSI4/yfxOYdRHCiHP1P/HD
         RK96Uc6YDVdLSTRT/WBi1NC7Q+nNcg+yW9mPXn63SroF6QJzmWdY9vURCqi9NDZ43lIm
         1SsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaRjF47twZXbm0o3TyWCs4Fq0zds/0hzOXBcC9G2bMyF9zq2fkdeBbhN/yv6i9qBI91s2doNEjqipOZJ0g5pFH@lists.infradead.org
X-Gm-Message-State: AOJu0YxL64dbpfGinQNy0M7FzXzGRfha+7xrQReG+Mo7LJlH7lMn0poG
	lYXFZh/E6nwdI/N7iqLY9c7/2otWnWz6CWIf6TxcstpRmJcTYefd3Zy75FFUIRaELbkKXPp4b0Y
	yMx6Xpv1O9UJPD+dc9LgQcg==
X-Received: from wmgb20.prod.google.com ([2002:a05:600c:1514:b0:485:2a9b:6c33])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b68:b0:485:3991:5d4 with SMTP id 5b1f17b1804b1-48539910730mr79369045e9.31.1773073579022;
 Mon, 09 Mar 2026 09:26:19 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:04 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-19-vdonnefort@google.com>
Subject: [PATCH v14 18/30] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260309_092621_169876_02281B01 
X-CRM114-Status: UNSURE (   8.08  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index d106beca8d7f..3182e1bc1cf7 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -132,4 +132,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
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
2.53.0.473.g4a7958ca14-goog


