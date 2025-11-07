Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABE3CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7UYzkbDjUzYtlMfPsEM7GuX+LxgA1EETjHu3K40WFc=; b=FLAp4k0Vjh5O5Q1IAr2WjZ2gOK
	Nk0J6y7tvLMR6I8GBydkVRGFl7qN4OznsO3sQ0dpSoTrLXt6cs8Q5LZqogJkLWQsv/4kQlJkteoJq
	6I3hSeCORR0D2fbW7HYpR8Ty/v2lI6dpLFQiJWmBuJmTfe0HViagX8dOmq8hTN9SgM7jL2dVVNdIG
	adhcbkPGgxaijIzX55yghZ+p86eXRnJZptljeaE1JfPm2CDTL3jAwyEjWTf80McYkO0fkKRlEgv/3
	ArYMYZxg9mmd4ZRboGQAZUKFCmTEbyh51nv8jJt80RoceQAcaIw5UklnZO4fzHkThN9wK57hWywnl
	n++MYang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwd-0000000GzJw-1FK5;
	Fri, 07 Nov 2025 09:39:47 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvz-0000000GyZv-281i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:08 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429c5c8ae3bso422331f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508345; x=1763113145; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V7UYzkbDjUzYtlMfPsEM7GuX+LxgA1EETjHu3K40WFc=;
        b=gpIrdloi8+25/dV7j9ZJusDzET3XIwOpf2FC3Eyf7r8Lgg5Ts2u/Uvtt7M/1aluHZN
         bfX/WumSvOFbubzOrNRwZs2ThFidVvPwt8Lwbjz1Ec48/6COqCBo1fuWPBk47Gl+hWe2
         ZsumQeA+0Z2ORRAD0aob7Iy/vuXGJTLda+akvGazLU8PQ63X2/K4wOPNwBeh8U/rF+R2
         R4lGn5MXXGUsilWXmtI31yfoSm3p2X/GGdo/I9lCR/GZ8sBxMzn/0VE9flgBkcS0Z1nb
         Fprf9fSpEtE7PbTzHEYQKqHocRrm71DF4/gdBYousg3kEpmaZcLdDVhRX/H7YYsgdOZj
         pdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508345; x=1763113145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7UYzkbDjUzYtlMfPsEM7GuX+LxgA1EETjHu3K40WFc=;
        b=d9swJV5bqhxqajNftPqXLvfkhOZJGguxXMYhe9vfQM8Fp1kpJw7jl+eDYDByU8wjuS
         eL578/IDteXPWbST3s1eEO9GDrMBcTHFUdi567oWgbdarxcJ0BDy9fAp3LUgDjEkXEEx
         jEnUcybWv/4TXSvks3u/X/yexMMWkpA0K4tA0Ia1yFp0kgZCaGbuiRtt/N8kDGdYyYDU
         hwW+TygSxAR/d9XBoHNj3/DR0pv+1H/Rqd9hgS/z/rM64IrivfHW/SgsVDniBdFw5D5M
         ffOnmi0TnpqDWrpdgXcom2TmeVa4tjGb81UvGsLmsJoQxdMZorRWL0Rv13gJrh69EqI+
         hlIg==
X-Forwarded-Encrypted: i=1; AJvYcCWDZxd15jsE9pjnG8jQLKlOw83NQjEhYFnYc8gvXdnnx7jAEuJ+Q2gC2QSEEsaw07z9ixGDSp46IZ9JKk5xMe4Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9FbOyXSPAn/danPW+Vgbn6C2PQmYkuR7ltTKVtEuJ8AeUkhmE
	eeraB421CSh/q9U+GQi+qIHN7LL0OmJgiMro63p3cGX5iYrfg7x/awkAycXeVTzbLFYWYv0G0fm
	1pDY7XbvxTVHLUrhfZB+pfQ==
X-Google-Smtp-Source: AGHT+IF1xxIvNVjq+za+iS0+/CCqGsFriDq1UMuaYLbX3urw+8ZvGD21B5ssp613AnpHoLe+UmbdSPTlqDnoLuOO
X-Received: from wrpa10.prod.google.com ([2002:adf:eeca:0:b0:429:cb19:3f9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2210:b0:429:d437:cdd7 with SMTP id ffacd0b85a97d-42ae5aefd48mr1930446f8f.52.1762508345583;
 Fri, 07 Nov 2025 01:39:05 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:30 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-19-vdonnefort@google.com>
Subject: [PATCH v8 18/28] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20251107_013907_581653_BFFF1C44 
X-CRM114-Status: UNSURE (   7.62  )
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
2.51.2.1041.gc1ab5b90ca-goog


