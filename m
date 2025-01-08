Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568E2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8iCsJo5WR6KzxB92gJlgV5iV2uqY4fo13qrdsq5Log=; b=Iy9UAZbxHeszD5Lk+RExj2GAS0
	ExW8eiuT/GMmK524aH+0bg73tgZBQskye4JGiX1Y9DvBGIsPW1Za3EdfpjSZxkYZVjSBwBxIxpgh3
	uo5OCHB42nqn5w6hqEf39YiLXKy1NDfSmaJ2uz1uJ3iZ25HMvmnk5Or05IliP2HbzORFBAfR2axP1
	TIFbQHFhtdckXWJ2C45jGhuBB0GIzFO2Zu7S7m4QE8RUaor3zv4XNdWkRCFy6XdBYqKdzXVcd1vPP
	g/IFTUOkMfLG7sMC/3wKziZuaFZAZcAyNN20N7ttBPTSEyTFJKpDlk/2NoLdWSO+K37S/87ZhtLg2
	MtRSGAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVA0-00000008QX3-1Sht;
	Wed, 08 Jan 2025 12:27:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUVx-00000008H4Y-39Jz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:22 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43582d49dacso112665105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336780; x=1736941580; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8iCsJo5WR6KzxB92gJlgV5iV2uqY4fo13qrdsq5Log=;
        b=CmUBNbPcA53UnAmRpKcs4LsE8tCozsNGxDsfrtlO0vAzlaxrxFND7i0lvcLWSuLqpt
         1ORM+2wVWtZjQMHTK8C3S/4KVRP4sfyZqW6YxTGsh4ZN6D3sWMuLZCO774kF6F3LNGI2
         EUOiQOkcgQ+7BEPQEC9w71Dg7YEKwHeHRjaKRTReECLhBM2+16exUSaXcX3cV0kV1W1U
         cEQWR3CgJOjB0UnXHJF/P8Xu0XN4QZTp24aLAQbiwnbFlhtnz4UPnu960AOqazbkg6sq
         dJIRdWd7Hxt9seXeqIuTB7kkAnzctUsQgPYRIGU4zBW2562GwCSis/Czj2jt0/rEru7K
         638g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336780; x=1736941580;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8iCsJo5WR6KzxB92gJlgV5iV2uqY4fo13qrdsq5Log=;
        b=V2162PFNnm+UwpqYUUzXw6qzxu9L+Iwx1wCS1r0P7O0cR2y3hgZ5uUl1jvuJiTyHFQ
         kmbdXVAMPC8tJfqk/Nygr2kxzzV9lvmfrwOI9lfezq+9+HoXixfnMCj+YMOlli2GWfRQ
         0mdPXUXMuf0xJ7pfYxFjBjY+hfWs6TLg/SOUx9LcWgzlM860FtY0Al+Kk0pLFFwZmPez
         CADQiaUQjEOj5uMVaHBMjuHZ0etfwVXMi3LAD/bkcH9z1U+ldd4PSFRNNYpUPla5n1M6
         UEqQZ0fwi25uFf/b+LICveh3iJcwPiaRjhyNvuALe8oGyaL6LcL0ur/LEMtBTaKoBFm5
         5Veg==
X-Forwarded-Encrypted: i=1; AJvYcCXucjdVn/RjVZKVDVe8GBcdXBaOJGHXexoWZiwp186b5HiOioxE25yZ2JeYIIAWI3jKD8feOOZ98DyTtIlr1x2b@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzw5y/UZlt6DhF8qK4zh+SxM9+P/WB+Brxm+zHdrGf4dPV4GC/
	PokXgK9ikmDAzUgi3ETNTmZhaDvolEmxIr0Ls1iB3cnB5yhr2/7avnxoTUNh6dm3399AEYAdSrl
	OGQE7UjgXE/F+2JAVtA==
X-Google-Smtp-Source: AGHT+IHXMIUN4Xu/0FCutrVo30LeA75reWr3RoI+cwLisNRBI4gx5AnZfMZi4bJ3gkUBjuYDzu4HpZhou3JnhYMl
X-Received: from wmpz19.prod.google.com ([2002:a05:600c:a13:b0:435:dde5:2c3b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4751:b0:435:23c:e23e with SMTP id 5b1f17b1804b1-436e26af4b4mr21060665e9.12.1736336780098;
 Wed, 08 Jan 2025 03:46:20 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:33 +0000
In-Reply-To: <20250108114536.627715-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250108114536.627715-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-10-vdonnefort@google.com>
Subject: [PATCH v2 09/12] KVM: arm64: Add raw interface for hyp tracefs
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
X-CRM114-CacheID: sfid-20250108_034621_808346_DA2F8700 
X-CRM114-Status: GOOD (  13.51  )
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

The raw interface enables userspace tools such as trace-cmd to directly
read the ring-buffer without any decoding by the kernel.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 78193dbd8a33..3d2a58977442 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -749,6 +749,85 @@ static const struct file_operations hyp_trace_pipe_fops = {
 	.release        = hyp_trace_pipe_release,
 };
 
+static ssize_t
+hyp_trace_raw_read(struct file *file, char __user *ubuf,
+		   size_t cnt, loff_t *ppos)
+{
+	struct ht_iterator *iter = (struct ht_iterator *)file->private_data;
+	size_t size;
+	int ret;
+
+	if (iter->copy_leftover)
+		goto read;
+
+again:
+	ret = ring_buffer_read_page(iter->trace_buffer,
+				    (struct buffer_data_read_page *)iter->spare,
+				    cnt, iter->cpu, 0);
+	if (ret < 0) {
+		if (!ring_buffer_empty_cpu(iter->trace_buffer, iter->cpu))
+			return 0;
+
+		ret = ring_buffer_wait(iter->trace_buffer, iter->cpu, 0, NULL,
+				       NULL);
+		if (ret < 0)
+			return ret;
+
+		goto again;
+	}
+
+	iter->copy_leftover = 0;
+
+read:
+	size = PAGE_SIZE - iter->copy_leftover;
+	if (size > cnt)
+		size = cnt;
+
+	ret = copy_to_user(ubuf, iter->spare + PAGE_SIZE - size, size);
+	if (ret == size)
+		return -EFAULT;
+
+	size -= ret;
+	*ppos += size;
+	iter->copy_leftover = ret;
+
+	return size;
+}
+
+static int hyp_trace_raw_open(struct inode *inode, struct file *file)
+{
+	int ret = hyp_trace_pipe_open(inode, file);
+	struct ht_iterator *iter;
+
+	if (ret)
+		return ret;
+
+	iter = file->private_data;
+	iter->spare = ring_buffer_alloc_read_page(iter->trace_buffer, iter->cpu);
+	if (IS_ERR(iter->spare)) {
+		ret = PTR_ERR(iter->spare);
+		iter->spare = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int hyp_trace_raw_release(struct inode *inode, struct file *file)
+{
+	struct ht_iterator *iter = file->private_data;
+
+	ring_buffer_free_read_page(iter->trace_buffer, iter->cpu, iter->spare);
+
+	return hyp_trace_pipe_release(inode, file);
+}
+
+static const struct file_operations hyp_trace_raw_fops = {
+	.open           = hyp_trace_raw_open,
+	.read           = hyp_trace_raw_read,
+	.release        = hyp_trace_raw_release,
+};
+
 static int hyp_trace_clock_show(struct seq_file *m, void *v)
 {
 	seq_puts(m, "[boot]\n");
@@ -803,6 +882,9 @@ int hyp_trace_init_tracefs(void)
 
 		tracefs_create_file("trace_pipe", TRACEFS_MODE_READ, per_cpu_dir,
 				    (void *)cpu, &hyp_trace_pipe_fops);
+
+		tracefs_create_file("trace_pipe_raw", TRACEFS_MODE_READ, per_cpu_dir,
+				    (void *)cpu, &hyp_trace_pipe_fops);
 	}
 
 	return 0;
-- 
2.47.1.613.gc27f4b7a9f-goog


