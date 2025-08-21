Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA5FCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1WnKbqGJMz5GKuhjASXO9eryfCuYBOVak1j8VKvvaQ=; b=0yKLX5tzLjl3dvL77+MiQ4CQLN
	8d5FdYJr9skcA8bqfOnjjdCTKFl6Bqqm+qnczQTe3Xht1WihX5YBzsOTshWACtTaUnQQ/g4FQpsuV
	nq1ErsGKenb0PCNnBJtpI5OGKfrwN1iOEXVC26hASnQxdmKJ2kqa+SirLdfVDMJZ5PHv7Yo7Odfue
	KB7lIy09G26beKTRNFLFohr3uxWGJf2kX+k5rsSfDuBeLOVsKZY8y/yIo32KkQ7CzwmgaldS8hOzn
	eqAn1vpRx7b1f9vG/9lVp3sD8viuZxj03rXio1LZZUPn2sXRHGQIWZSaA/MYoq0bl9Ow3+gUewnQ6
	aHKECPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up21j-0000000GWbi-3rJM;
	Thu, 21 Aug 2025 09:56:11 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RU-0000000GChZ-39Kn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0045a0so4165335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764079; x=1756368879; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1WnKbqGJMz5GKuhjASXO9eryfCuYBOVak1j8VKvvaQ=;
        b=OdIs2WNYYHCgzXv5zhgvVmeEMi/mfX6NU3kDUbxzybRXRRP1sLNm+ODzLDDKDGGmFu
         mDegnshVtPRRTB9u3hrSiShhpBSCH/Z+F5df/jr7Q+XZ+R/VPYGp6hts0T1WmuuEmGi8
         ZvuOWIwSuhNIddspNYNThixRK7eTAk+e+HqMAHqilUxLjbfgLevQxQFp9Unkr2BNcKxp
         g2FQHAsU7chlskldrZ2cLQdSMTiG4EZerMpCF+0Rgxpj3kNwOoqADszP+YZ4XMXhKwJz
         1JU+aFD1ehw2Yp8ThzZGrV3A8Dtro9akzM0G0nydJ4ZB3u8q/TzOJo+ZG6oSLuyI3ww5
         BCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764079; x=1756368879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1WnKbqGJMz5GKuhjASXO9eryfCuYBOVak1j8VKvvaQ=;
        b=mYUrm4V0aRuIDCzvp8yyzdWs1z2UfSDmSzPNVGsfUHZPOX3gTbQoIR2+BY2GohFS97
         ookWrP2XHtG6w7RhELG1C8k+xPoM96H79F0KDMAQnBY6HHLA6V+lLEb5WxnSwKbjNIuH
         eaZ+qDPFLUVbloO5Gm7w6ClqCHhAhrhXgR2vTDUksehvEOXsck2IsSySWI2TZxymgzop
         5AexFgdaqmVme7X8T3s+BGZLQ9gRrk8p9bZ0CpUPfZ8aBsGemj98VGnhZmaD+Vxo4deR
         QWh27Cffmhxmq1gnjm7HUtcy0K1CRi8faqYCJvQhfNAU5YTNtCEeD5cW8/2pPSSpXiPP
         Obpg==
X-Forwarded-Encrypted: i=1; AJvYcCWTuGn7EAkGPel05MzumOeG4YmrBcAZxTMOCGp6zuN8r2cQgb+4qjJh2kdBUOb4snGBO33GZ7XWeD8w1nGJcKhv@lists.infradead.org
X-Gm-Message-State: AOJu0YyGsX54pazi20LF4g4tN3J0kaxQFtf8O3J5xvEAQ+wOHcWBWha/
	FS9xEBaA0phAIRB9kmfPhVhpkcL2bc0WsHQx1uaXRt3iZKHvbJD9gRu5k2WgagTICXamSdSG8AC
	F6v4SFdkfN2bOi2hSbVP4GQ==
X-Google-Smtp-Source: AGHT+IGDwbMV0G2Q6eX5Ty92Ruu8G0gWgsOI3nyPGZY41v04cwU8/dEgbGIM8RR7KNaNp8Qt7tiVh+uNmLBvDtT9
X-Received: from wmbep22.prod.google.com ([2002:a05:600c:8416:b0:459:d776:c35d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e51:b0:459:d709:e5a1 with SMTP id 5b1f17b1804b1-45b4dc74ff9mr10294255e9.6.1755764079281;
 Thu, 21 Aug 2025 01:14:39 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:14:02 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-15-vdonnefort@google.com>
Subject: [PATCH v6 14/24] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20250821_011440_786282_072DEBF4 
X-CRM114-Status: UNSURE (   8.13  )
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
2.51.0.rc2.233.g662b1ed5c5-goog


