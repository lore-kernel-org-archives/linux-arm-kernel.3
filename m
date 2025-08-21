Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A4ACA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJOAg2LepmucyL506XIcO8nq6zYHDDz484cJsiMQI5I=; b=L6JlgnZBGeNtbj7Jbaj5qN+UfG
	vtxgZX0IlDYtsxHBtjWdto76v5GY7NYS+MWd0ewV5Cchccu2HJTxjZXvh+bDqAVQ0s3Lo2J7ct2TQ
	vWd2quanTu/dex9FuqlBeoErNilRAUtno2PfWY9rk6atsrwVcPgR0oYx0R2MuGwWNB4Mz2QHhQbr+
	TjgDBNs16H6VbHncMafq7bhKl6TxZurzyhxeIO4AqlJ9XKWWnXGQBPjwVmGGxDxtPZGSV6rLapTn2
	ebZnszRweVW/V5OpxxC2BzO4fG9oeWFR//JvxbA3S66oDAK9y7FqxzK7Vgp8GoAZjB9fkRwyadH/Q
	f2s1PlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up32j-0000000GgbE-47lY;
	Thu, 21 Aug 2025 11:01:17 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RC-0000000GCbM-3Du5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:23 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0b6466so4880665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764060; x=1756368860; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dJOAg2LepmucyL506XIcO8nq6zYHDDz484cJsiMQI5I=;
        b=KgXUlEjQQEBEv7idIiJLEHpnBXh4LWLSzwdcvELCkA1817/LfKx5T7Qdav10gHUgie
         PVHekX70MghJurTtRxVo2S0VF3Fz7fUbJFSQka5Tqnlj4llUO0RkFNH/+cP/kS0/26p6
         itonKWZUNV0Mtve/12M15Os2MSZhJQOTMshchekYKqe6UtYyADy2famMRZ267h++jNSm
         Xnn0hhqwsfp0QG31GboTXzWLoJrrXMmb/dHYBjH9HFTnrl97627Uw73VVtmcbIiTi8yH
         aJULiQtFFR48RGzx/24CiaoaTA1RxCUTqLACygaf2Xj+7Tl37gR66Ec6iTQ1Oyux+sMM
         ZLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764060; x=1756368860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJOAg2LepmucyL506XIcO8nq6zYHDDz484cJsiMQI5I=;
        b=Gk2N22AI6vnFkyS2XivXpv49GLyqeolI724a7YLHLzlposckt3GOxlmCiFRlMTdbuc
         o0VU5FlsQ3VD/kn+g+tq6Ox2WakbM8CeObzn9WGegYSIwgRS7cJtG3IaG6QqKKtHdTMW
         EBu2jTS9IP9COzDyXjR97Ajz2aJg4a0UFrdgG5+IOuaIaXgGuMbUSeScWmVrUsv/nxUy
         qMw2tb/3Ah1D0ru07dBnSqoLUmtZn0h9V0TgzTZoDcp780U7/WFytmIanGJIA0te/0C4
         xTCIber76bv/Vc+G7JEmmLtTci4Wocvy+f2iWgUqUPWlbJYpbwQhCEJSWZH/c65bzCbk
         GiKw==
X-Forwarded-Encrypted: i=1; AJvYcCVdV8+3T76TuMinnNkIFPlQjGqagOA/e4Pr8UWEUiokDkkPe1MsyggHNtAUmy1XToBL8mQpyYdR2mXcu5Wbt4T8@lists.infradead.org
X-Gm-Message-State: AOJu0YwGx9i86ZNaJLw1GdmzqmpkIs9Vp9gOEMDLLS/XDwM1UAGQ4Z01
	Qfo4oBJanjzw0PSyjUHzmJ0ZX71yW80fk5+7I8cMWUqtQcwfbeuGZ6f/gOGpYHB5U1QzmOzuoIt
	leSQUeRmmihHvxYI61Fi1uw==
X-Google-Smtp-Source: AGHT+IHcoqwzyqcPrFsP+sYGNNnfFwMlL/y8NDzxBQBSaC+pxoZobjyvT11sCcSBD4JOgEO+Nyr7sVyBoR8vIUR9
X-Received: from wmqa19.prod.google.com ([2002:a05:600c:3493:b0:459:dbaa:93a6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:358e:b0:459:d3ce:2cbd with SMTP id 5b1f17b1804b1-45b4d7dd79bmr9793685e9.13.1755764060486;
 Thu, 21 Aug 2025 01:14:20 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:49 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-2-vdonnefort@google.com>
Subject: [PATCH v6 01/24] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20250821_011422_817445_04A2A541 
X-CRM114-Status: UNSURE (   9.82  )
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

Add two fields pages_touched and pages_lost to the ring-buffer
meta-page. Those fields are useful to get the number of used pages in
the ring-buffer.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/uapi/linux/trace_mmap.h b/include/uapi/linux/trace_mmap.h
index c102ef35d11e..e8185889a1c8 100644
--- a/include/uapi/linux/trace_mmap.h
+++ b/include/uapi/linux/trace_mmap.h
@@ -17,8 +17,8 @@
  * @entries:		Number of entries in the ring-buffer.
  * @overrun:		Number of entries lost in the ring-buffer.
  * @read:		Number of entries that have been read.
- * @Reserved1:		Internal use only.
- * @Reserved2:		Internal use only.
+ * @pages_lost:		Number of pages overwritten by the writer.
+ * @pages_touched:	Number of pages written by the writer.
  */
 struct trace_buffer_meta {
 	__u32		meta_page_size;
@@ -39,8 +39,8 @@ struct trace_buffer_meta {
 	__u64	overrun;
 	__u64	read;
 
-	__u64	Reserved1;
-	__u64	Reserved2;
+	__u64	pages_lost;
+	__u64	pages_touched;
 };
 
 #define TRACE_MMAP_IOCTL_GET_READER		_IO('R', 0x20)
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index bb71a0dc9d69..064005c9347e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6113,6 +6113,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


