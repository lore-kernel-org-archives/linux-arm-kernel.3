Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C84CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCcr65sPLORj627Lp0bpZGMol0uaDnoIgHQtYd2TdNg=; b=XFRUNiTG3z6Mu9pGaG/3yk7zNR
	hFNqdTLf9Ae6TqVXI8imh8DvAwGdpUyWday8dmbuatJYWId/QWlHYYB/OW2neCKhuIL9OYtpgwy9P
	aGB+OYtvAzu9rnY91CwBWVe9JGysnvPbb2ohEYsVZy7MqI6k6J+RN1baZaOdmiTrdLZhtVn6rzXox
	+/AYgm9AtR3vk57i1OjxNRaFA7QdoDv70/qwtkQTkfiLJCTVrDC4zaxxvLNGSdk9jG4kgiz4xuF0s
	2bwpeoeRhwxny+BndqlAofHCoU24JkULMgUsCj1l3Ihh+N8f7M8v4NLkWosCDkioM/iteihGO+Oau
	6UnmjoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0X-0000000CQrB-1CaV;
	Fri, 03 Oct 2025 13:39:37 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0C-0000000CQJu-1GPz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:18 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ecdc9dbc5fso1041318f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498754; x=1760103554; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QCcr65sPLORj627Lp0bpZGMol0uaDnoIgHQtYd2TdNg=;
        b=eOVTy7qSmU944qXLcm3t3XcLepbeHEy8IvMD4UfqSfVbwtjRifmyhJ8ID6PWPkVlnf
         5oI9GahLmxpXGrPsxVGc96XJOuZfdwneVH99O0byB4TQ/PrKy7uJ+KpY1Ubhuaf9WQec
         eehMjOqW1rlOv5z33neBKIQ6uA1uqA2Qu83hd3Wl3IhVhoO+lXZhEBLp+ybumYPnFy/U
         GnXDNnKqYrXyl0fGHUpzIXaJkVecro/SJhhYCEzSq4c5tRg0kuw1X1Kvac7W5FAqBbfS
         m3CZdLeSald1+Nqax/xWl2fcEJcAYU0EjuISdhtfZ84eaEPQ6Qdx6hGGNwSGNBqkDOq/
         1XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498754; x=1760103554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCcr65sPLORj627Lp0bpZGMol0uaDnoIgHQtYd2TdNg=;
        b=vaGyOh4rab5F5waLD/bbNdjYviGbD2dy+c2RJCfUyrknTEH7/pIHubp73i0IAONSnX
         axCjWDcP04kt/A7XF88V1HSgUd+a495zJFNQ6NJ5mmXnkzXD05JxHpa9Pd11TE9uZMMR
         8krZfVyRwl6HI8sCP41baZ9CaOXrT7iJmbNmYzGQHQVUqvRizkPfpqDIHbQetFUSiwQf
         /qGEZ+0iU97OM7yu+paFnp3fueC1LChnx74Pgjug2Ji2qGiEIQG92r0vBYLhxx+CKSGu
         6np+ytg/r5ZtAnYMVIgav4WKkfLwe31l4RCJqN9GQ1TWjSIFqyE9rCFhxY4f9UCnFKKM
         ITpg==
X-Forwarded-Encrypted: i=1; AJvYcCWLCsL1I+k6giyW4MydRm+VMr5BPNysSjjRTpNyqh/zlm+QXKh5RJDlz3CyeN7PaGNtxKRGqzC77Ub9bD/oqWBc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2N2S8votv6g7q6aY+zeWYUQ8hGW6tXAxcXWV+x4NIeGk3tgAP
	MPZ+Dv3HLJoC1hNQ+bbhxaQqsXNvQO1niT04kd0cc+lRR17+FbXwonFfCDroYAXum8Duxhrrhhe
	Cx0MIo3h+t+MgNXU2n39AUA==
X-Google-Smtp-Source: AGHT+IHQ12IlCfmMAydiKBsHPD9Q4iJr8SeYEXmAn4PmVdl5+Rxkjar+IUCHmSelDg/tdXKzfnSMs19tRFdbpfxM
X-Received: from wmdd3.prod.google.com ([2002:a05:600c:a203:b0:45c:b62f:ca0d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:18a9:b0:411:3c14:3aa1 with SMTP id ffacd0b85a97d-42567139debmr2038918f8f.3.1759498754083;
 Fri, 03 Oct 2025 06:39:14 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:15 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-19-vdonnefort@google.com>
Subject: [PATCH v7 18/28] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20251003_063916_453576_02BE11F0 
X-CRM114-Status: UNSURE (   7.85  )
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
2.51.0.618.g983fd99d29-goog


