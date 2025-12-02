Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13211CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJMobDlS9cUjf1A94hhHD9cE0Yb81+orJSLPQk+5ukA=; b=1BmJ1t9qY40N9gvkyihHlAbJF2
	QSLORc/Hcasc1yJui4o7s2Mv5kmqwQ4ZFCkIl2vJZ/LlMv7nUsJ16QTEyMb7F+iQAGoyYdrLrLjfQ
	jexwaZN/XDRNiwFq3gyBrrgNORo9wREspLibKm2BhWU/OTiovk9cI7FyIK6rUcnP5foplTCFXrS+r
	Pfq9Ibd4E+FwLZnvnHI9A6DcM477nx221kR6Kh/LNRDsl1b3fGUHy59MQDtW7CoWlKwSCAGmbXzw2
	cg6CJH7/zumBvj0p2jmeKalib9EKY0DiIk6wkoLpXK/CMAk5bdHPol4BfALvH5bpFFPEHLuInhBV1
	kg3DZG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoJ-000000057v0-3XQo;
	Tue, 02 Dec 2025 09:36:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoF-000000057rT-1TDS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:37 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477964c22e0so33230175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668193; x=1765272993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJMobDlS9cUjf1A94hhHD9cE0Yb81+orJSLPQk+5ukA=;
        b=zpcHDcJee1yDaH/kUo5AERFDpu3W4AtyRQFUIzx7MKvQxqKnjytohngJUWl/W5GqEq
         xKyzxjX68Rh8K4mo0UyezVaqeDzvyLgssv46vV6GC3mPxOOypn9kIiQq6CqvetXXf2K9
         xIapiFoFHyDjwaG4+MNY/f68ETpV6mDMtrIfaBm6ZAVpVW09J4y392GXrDGqfEBcjSp2
         88RnddMf9akJXOsiBv2l7WhRhWmhh7fMdENnaznOAA7FpXFNAwu9aWkufOXDOOCK1xC3
         8ZqvTbdh0+oj2OIzPymcWU6BDcOJR7T+10gtxQYjL7MHhylPFfLuEVJTiZnSkBRJEifA
         PqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668193; x=1765272993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJMobDlS9cUjf1A94hhHD9cE0Yb81+orJSLPQk+5ukA=;
        b=fx8XaDorRJ3xOkKXK3F7proyTuWa//rmSOfUgeExEwJvY2eNOxUVct0RvpaosCuuzf
         MDd2acwr9C5oZJen61GEF9bkAImVa4BTbcS4FC/KHM8BhEHgkFQQcxY/Mw74Qt2XRau0
         0RKuWCXzFs3jDxfSrqM5XB2h9a3A8ZK9CCWdtM5btsm2+wl754KgSgFpmZS6lHwXceBB
         IVuMo7tDrnWpMqnCfd/34nGmctbZ4QvG7EZ5NcM4Jc89DFfvKcSDB4SfN3txcRH5nGBw
         KFGXFGygkbc9Yc3Z0v3B7EoYAnIfiI2p7QkmvzKM+WvFbmJI4kvPAts++YflSFIAXFbk
         pxjA==
X-Forwarded-Encrypted: i=1; AJvYcCVQazVaIZ0uTXghzCQqQTBr+9fcQpv9iwhMJCptfyPZB6gJTM6JPEN+YG8ERX7I2luX8TM4EOrc6YJRn5Sd4mzJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxHosm11eyHPTceYaeT/kcbZxyhcFu2tjPTz6aTBY8ntQA3VUJs
	YRsUJWsv9BTnds3Ncuvni/eB/MM4QnG9srxkPQr+/SE4N8BYSXWe/0Y1xUgKMyvNSA9Yn3+PyCO
	Sj6CQ4NxKP0nIudVHGq3gqQ==
X-Google-Smtp-Source: AGHT+IFOZr0MC/hR67QKvdZl1NGr26HqxISCDgDHqiuErADTEPz6Od/NumPdYRXvv0diOBWVyP3bPEcOcKjqzEay
X-Received: from wmlc8.prod.google.com ([2002:a7b:c848:0:b0:477:5a4b:d57f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a41:b0:479:255f:8805 with SMTP id 5b1f17b1804b1-47926f80721mr15071745e9.4.1764668192874;
 Tue, 02 Dec 2025 01:36:32 -0800 (PST)
Date: Tue,  2 Dec 2025 09:35:54 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-2-vdonnefort@google.com>
Subject: [PATCH v9 01/30] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20251202_013635_411972_3AEB6DE0 
X-CRM114-Status: UNSURE (   9.55  )
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
index afcd3747264d..048dde717b94 100644
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
2.52.0.107.ga0afd4fd5b-goog


