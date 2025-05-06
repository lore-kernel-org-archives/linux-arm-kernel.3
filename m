Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91EDC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njQ3TmZpiHbN0W0T2NSyLt6EnFI9+R+BtiPGKvCoesw=; b=q4shbN3n6x40Ho7h5Kybfgl1zB
	wmBqe553wMMIJeJZm6wzB0gWAtUJYQbzPq8Nk5Xx80Ds9hyjD507RcjH92nGeO7EtI1UGMP1+/fA6
	szFMy1PgL+YH4zRP1uMsECpA+ybp1AsizuokULmVdmioUYFCnHegLqrQFKAtzJkRACy7gH7f8xsMm
	GR52WuTuQzbYW9yF5nj8vM044qTwXkrI4ThykrbVONIYY0HO6yirJEcmBSuU2eI7bNE5WYGbU9CpD
	tNZ/2Iu6o6um0o7XB9HJ/QtDSy9lNcRoDEZuYijylIrtx2RkkGwT0a2dJjcrur+xHVzSmKN4lq0oD
	/dqgA0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhm-0000000DYLI-2GVF;
	Tue, 06 May 2025 22:24:02 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTd-0000000CjxW-2kpt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:06 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so27641015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550143; x=1747154943; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=njQ3TmZpiHbN0W0T2NSyLt6EnFI9+R+BtiPGKvCoesw=;
        b=3UGc35Rr0RMY3DemF7qCiPs2qiziDBMNMsoTvVrLPkE0xE3RnuGFx0ZdMdTmRGpQPz
         64eQdM34QjcDqWfZ46aPR+WyGFjDi4YDJz+pHPfIreFhdpkSYEQq7FOtTnbw7vUGHJC1
         PALjTsJQTBxCfHHnK+dS59dFyPK58dKjCdx3ApOH+BtJeOzcSB+3JDnj4fz3076f46KJ
         tfxTdUOOieSzO1ivugkacWraBIzyHduS31t7jOOokreEK3JGWTpi1U0zZZk99pq4g0sU
         Ck+GdGX7rmT5eEZ7VuuKzQ78as5PdUYnyN7ud2jufJ9ywION9z+yFp4q/V493oWdJTmr
         d23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550143; x=1747154943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njQ3TmZpiHbN0W0T2NSyLt6EnFI9+R+BtiPGKvCoesw=;
        b=h37/VMfZ1GJVK1y1HgVk94kMQZ4f0z1oXrA/Ami179H+OeyU1Panqr+8ZYPIZUTayI
         q++R8ctag3ljRf+/vUt63C3vadyQqZRlamv+HYGm0aCAYCUur1O510jvXezXnn/UPGJW
         7cCmyUK8e3X7s8xccqlqPEmUbeq9sBeK2AqoW+pusBSPWKrXKhCtXlzGptV97cIGNayT
         o24owR3cQW0HzRRfbFCoIUhCesSR7fOAyYOrCFaEUWDBLJi/JkikR6ooSRQ8zWquzxGo
         KZVzvoxcTU800syjUCAJZdmZasBgTEmxH9lNYov9fZ5TfSEcYt11uic5O+NO3WXXD8P9
         ogtw==
X-Forwarded-Encrypted: i=1; AJvYcCVmx05c+04E68Fp+Ut2MoAaJXEENRrVcx/6GbLkygtCn7UDDJxYdfz14YNU9zMJkvMaa5hVPrNn5nNZQsUlSvc3@lists.infradead.org
X-Gm-Message-State: AOJu0YxvQwos9MTw5Uus8VfZGRwUALkFcB41kEWcs+uyE7ecudY3Iohl
	j1zPdiLn1+LHIHb0mR1WHp8aQoQBtglb4WsjbEZfuXA6tpl+qW6OqJBbLa79Zh4/xMcfkNv2rcG
	UQUUmVp0YER+Nc9gDjg==
X-Google-Smtp-Source: AGHT+IHF02PKPiIhJbOE1ndD3uShLpPGP1nAp1HVPAQRz98xV5Rm4WeCONHAOCoe603i2rkE7H3ckkLeK9deDeKS
X-Received: from wmbay12.prod.google.com ([2002:a05:600c:1e0c:b0:43d:1dd4:37f2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154a:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-441d0fcc750mr28382805e9.8.1746550143106;
 Tue, 06 May 2025 09:49:03 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:09 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-14-vdonnefort@google.com>
Subject: [PATCH v4 13/24] tracing: Check for undefined symbols in simple_ring_buffer
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094905_691239_45762373 
X-CRM114-Status: UNSURE (   7.90  )
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
index 8f5e194eba71..a2f1489e11af 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -114,4 +114,19 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
 obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
 obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
 
+#
+# simple_ring_buffer is used by the pKVM hypervisor which does not have access
+# to all kernel symbols. Fail the build if forbidden symbols are found.
+#
+UNDEFINED_ALLOWLIST := alt_cb_patch_nops
+UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
+
+quiet_cmd_check_undefined = NM      $<
+      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
+
+$(obj)/%.o.checked: $(obj)/%.o FORCE
+	$(call if_changed,check_undefined)
+
+always-$(CONFIG_SIMPLE_RING_BUFFER) +=  simple_ring_buffer.o.checked
+
 libftrace-y := ftrace.o
-- 
2.49.0.967.g6a0df3ecc3-goog


