Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A6ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MsimPcdUANfcIFgHzpPOd6ABveJwxGYZMeC9Y1ifSik=; b=BtOrKIZlkb5W/+8Sb6Bn3mrEHP
	u3zazo6P4xl7XZAQY4w27VdHc6Xb72ZUled+NMAvHvlrCYTGk7u60D0KZ3I2aM9e92C4WL330XN+2
	jGr/Q1yYMGFh+I2Uv1MOwfGzq4xtsayMFGvcuxE4IVxbOiBBQNm0ux5O7CpAYIFJp7Ojtrrtv20wc
	1rXI2w/ucicF6pk94jwHZ3mo3B25OBMpxNTjlNtSc064jUxn5Rysq7SW1XwlMBXTrjXDVINg+GxTY
	WIghnYSbZEnSo0YwrhNSmocDpM6lav7T08kvCf3FSok+3XBtgz6yK94tS6cq5e2RLH36BHmnXvXAD
	OC5t2TdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnZ6-0000000Gv2x-25Jh;
	Tue, 12 May 2026 13:54:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnZ4-0000000Gv1r-0EbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:54:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891f625344so52286815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778594064; x=1779198864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsimPcdUANfcIFgHzpPOd6ABveJwxGYZMeC9Y1ifSik=;
        b=VhVc75Z1zZpuEBSCUe1/1GRG0Ouro8BmTAgou+wFS18giVohwv4j/NZpHT4qOc9oTk
         vLrfy9hf6Ch4gTpHdo961Gp9TPzbNm3G8gcItsdOfuXzOfBQeD42bg+76tae53nOAAgF
         nC/Jjvofz1C2GCMQuqYth0kDUJkB5Jqjzbh5JRaTv7nk95gC831hQSFEa/VD5XBAr0zH
         3AnPiLiy+MMcKfgAPfSUu6eHj0h4qj0zWPOJV5GLZ0HK+kqq7j2wyC1trgdvwKQfR/jm
         CKnAwjht9/kINrKpwQCLj3CxKB0kCId7MmBdV5glAf112NgvC/uThq82qnxOcwIHxqZT
         9tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594064; x=1779198864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsimPcdUANfcIFgHzpPOd6ABveJwxGYZMeC9Y1ifSik=;
        b=iUxo9N3L0Wy27IMuko9qDDsOqp8f2YxNHcUoI2YO5y6rSu+l9+oTI4xZymnbYkKYLI
         9jQNvAGS+xL2QBz4xprUOhwGYwnjn2zuUGSCO5vdxv/2OSSt9SniWLAxQNoCvuuKaKcb
         T7tmg9vmNjglecyiYwWImBEuWtw8VKZL02Be1U+832TxKbqMibCCMjRWOj63JMUryEbO
         5I4Q6vcXkK78nB7VPW7p8nMGL0LUBWvjGyiSlWndFBnoxWNWmFUYSrCZV/okxTJ+soks
         HkboTpvQlk5NA31Icu2onf16Yzt+RgcQarOVs5+RbPL4PLPMinDM0p3bSLY1WMs9kkyA
         4hZA==
X-Forwarded-Encrypted: i=1; AFNElJ+tFZOtx3nZgNfw5jsQQA03JO30Tk+LIjU8bVTPlHApJPzalKRIzBM8ci2oKg1+WwORaZ9Z6PbKRr68Q2MKGnVD@lists.infradead.org
X-Gm-Message-State: AOJu0YyMF9v+pS8PuImH32kviRthcsYUCMt2vYVV81uGiWACgTFC4w51
	9mGmjhHC9kLjr1O+AXdaUDv5rtRBUTPU5J01v7acdyooUA4HtkNkXNaJ
X-Gm-Gg: Acq92OGF6MPast0PjM9MLpWwoETMoGIWktXqd2wWY83iIWQAeohLUGPnpPlMddHQARL
	8uzZdJ+pfasHmd2NNxVcER5lG1LlLqcS3cNN/Iur+B/s3FsdIwrlHIsWEOFfRHfR2ysY6gyRgbW
	8Y26+yDb1oCafQcszCz2qif3iYEhSB+wAQEDp7w8l+UXNK83BCN9WwTCLtLEqGph8I9kAhQ34RZ
	9+fkVTXcn5Lf7Rui1vmrHZ+SJ8fo52MG+Qm96Ne2I7rLZ8NaEwyz3Csq5KVhC9RYH0XDIn6jND/
	iMYe7iPgYMCThdOApqAm4Ap0qlWm90DXGbkhhTEUAsZKYwbWnbUC4OQBC6xbdvpbm21ztbJS0uj
	gmqrHtE0R9P6Vv45QBMom8f7+7q3UKbtIPMGIu9vmycSHJE7+FdJ3eZ40RsccwBgKYIKksiWxmV
	+Q3YM28SNEk2G5pcrqhA3MSOKOzcQn2wQyySusfLKD0nVjn8p/L33WRO5UyVb190AMyH2ZZqqi/
	ZOxt4NJO7Y=
X-Received: by 2002:a05:600c:3b99:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48e906c4525mr43131835e9.12.1778594063788;
        Tue, 12 May 2026 06:54:23 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e908d890fsm43691055e9.15.2026.05.12.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:54:23 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	vdonnefort@google.com,
	ryan.roberts@arm.com,
	maz@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3] tracing: Fix nr_subbufs initialization in simple_ring_buffer_init_mm()
Date: Tue, 12 May 2026 14:54:20 +0100
Message-ID: <20260512135420.99194-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_065426_106652_ABFF33AE 
X-CRM114-Status: GOOD (  13.38  )
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

nr_subbufs in the ring buffer metadata is always initialized to zero
because it is assigned from cpu_buffer->nr_pages before the page
initialization loop has run. While nr_subbufs is not currently read
by the kernel, it should reflect the actual buffer geometry in the
meta page for correctness.

Move the assignment after the page loop so that cpu_buffer->nr_pages
holds the final count.

Fixes: 34e5b958bdad ("tracing: Introduce simple_ring_buffer")
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/simple_ring_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 02af2297ae5a..f731f14d0ff7 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -395,7 +395,6 @@ int simple_ring_buffer_init_mm(struct simple_rb_per_cpu *cpu_buffer,
 
 	memset(cpu_buffer->meta, 0, sizeof(*cpu_buffer->meta));
 	cpu_buffer->meta->meta_page_size = PAGE_SIZE;
-	cpu_buffer->meta->nr_subbufs = cpu_buffer->nr_pages;
 
 	/* The reader page is not part of the ring initially */
 	page = load_page(desc->page_va[0]);
@@ -437,6 +436,7 @@ int simple_ring_buffer_init_mm(struct simple_rb_per_cpu *cpu_buffer,
 		return ret;
 	}
 
+	cpu_buffer->meta->nr_subbufs = cpu_buffer->nr_pages;
 	/* Close the ring */
 	bpage->link.next = &cpu_buffer->tail_page->link;
 	cpu_buffer->tail_page->link.prev = &bpage->link;
-- 
2.53.0


