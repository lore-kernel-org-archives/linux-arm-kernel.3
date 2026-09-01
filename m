Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE4CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzuzRQWzKhh9d8u5tb9B8Xmk/6ykx/rwaytUEdjFAyo=; b=eLXTfplv4SWwDJWnPyz5V+WjHN
	3rwK1upmOopywawDESiI1lQ9LtobumO4kWBBt/xpKYxW7sSd8RfUudGLj0G20RMUjEElK93hgvDpK
	CArrnVsHpqdmYJK1SOtBGD10hlSvF401O+l1dcwaIbeCJdEhvkxvEL6z74xtgmLJxRqr2DIoh9kG0
	fehldjzEYhZ8WWCp+fHdcu95RTeFqLJn3OTz3oqr1shCYUrEIXSKA7eKw71c4ez/UXqk6J7RHGOlS
	aaNCrBM9o8t4ct3E1dBS9F3Hk63dZZfb3fts5CvvSCicGsYiI+Qvyy63/3AUa1qhCYia6WcfGAekW
	ViQitRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QGH-0000000CTAT-1iPu;
	Tue, 01 Sep 2026 15:18:57 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QGF-0000000CT9B-1t72
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:18:56 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8484a24ccf8so458290b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275934; x=1788880734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzuzRQWzKhh9d8u5tb9B8Xmk/6ykx/rwaytUEdjFAyo=;
        b=RS23IBnLeGB7NSoDxU3EIyybOQBvSL5/A0J1v1dI+t8525yplYs8I7F1a5F8WniNU6
         cX5PvFMi163jfzfRiBGblmxaSnms0bQhIhokNUTu7iCuytGZHSclLUSttFALcnFHIOaq
         hv/vlLEzeg6lbu2p0DI3UFmTegodOLnDbOFYjG+iIx9Iua6yNbcWZp3dliKrapwXtZT1
         36KN72kCqj/eZbBk3C1hdu9D2raHi9uFAPPlZWJW3du56TxNH3qXkRzwtOF9XTvxSKBt
         sRTBLkzZaW51oDVMFzLyYSyiNQIDaHdd5r3LK9Ypg6EhqmY+pMxutHpoOlhcSO5Od8Jo
         714Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275934; x=1788880734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dzuzRQWzKhh9d8u5tb9B8Xmk/6ykx/rwaytUEdjFAyo=;
        b=KQnzGM9LkuPZ51fmj3mo3kyBIBBq6rDSaqOqwLSygY0oE1SdzkGLB376BV2moe34PQ
         MceAbjdqZYAaM+DBPzXfDdvMFatRe3djvy9pBbVHkfIm535CcoMmXjTxJB6aITMiqOE5
         BGM7YtpsXU9ZDbAXxxTHvcgc3c5tuTFocRKckkmgVSMs6KBD0Jwacj0wEOy/HxCjRrko
         x6vzxZmCQJMmqrG9QAF9lgJLK3D3mO/MMeXXj4UqU6Qis7lYP8/pEiGQyjUtj0OMdmvv
         UiSeJDUEZb0hwghNmgAyATrEhKGW0E3mDXwyRkYKPb+SCkYWeF5H3su/dDy2IBS0EdJL
         ZKWA==
X-Forwarded-Encrypted: i=1; AHgh+Rpujt7Ony3rIjG/3eudvy+Z0YvBiBYHjrqIPUKRuYYHTB6SLdQaNBcp40g45JjTlwa9/vAKhskPqvAZO5SGbcVv@lists.infradead.org
X-Gm-Message-State: AFuF++mzCbVEgQoTGrfoL37jMQS85wx9gJjMbstTGQlQqcpC/DvjTlw0
	3Qu4sgSalsdcohNKG4TjCLW49pDIWwrhC96Hn5m77oUwukX2IYv9FkB1
X-Gm-Gg: AR+sD11m9TwjwbWRQoUhDKb5xdiC1Vt1JfGvH1phR/WTv2X2u5sa/+Z2+S40C37yfvx
	XViUwYd4UHUrsitBUtUXXxmx7evtZ5Mj2tDKZOjMAuiW39UCCCwCCfsdVP33powcSIZ9Qvy0brg
	kSLMfJOsSlHFoKf7CCNXewD2x6KQhb83yjrPBi2A9jqJZ5G85hXWAJHFHX/b5LrjnVhJyA1FmMR
	Cwimv5+J/Qf9N9tp9ZnNillTdDvtK5V1TvTmZi/ClIGeXJnf0O2V6ZuD/JPosgP328456DwWKUV
	DGuXLcx6U412hlrids64/wKo7Av2mKrBSV2nUNHzOgbHEh2ZjBV1+WCTchuN2EyK9a+x7fFgUs0
	DC5qDj3Pie0Y6ZC+O7iuddYC3H/zAN23QwuJgOb3rephWPzp6pkQ0peNlI/RePzTtaXeZzzzTE7
	ldM4d22iuNXXxpxFEITY1QpMmrpYWFyEyQcoKT+kQIEt3PcfKSX2dsti/pcDwIZQBFO/dlkhXFg
	e43JPPbBNyduXe8UtLixALPTA==
X-Received: by 2002:a05:6a00:4a89:b0:845:cf73:5bd8 with SMTP id d2e1a72fcca58-856271fc239mr22836969b3a.1.1788275934457;
        Tue, 01 Sep 2026 08:18:54 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:53 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] x86/mm: add set_direct_map_ro()
Date: Tue,  1 Sep 2026 23:18:18 +0800
Message-ID: <20260901151818.3191443-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_081855_491645_6275C6AE 
X-CRM114-Status: GOOD (  10.90  )
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

Implement set_direct_map_ro() for x86 with a page-based interface. Clear
_PAGE_RW and _PAGE_DIRTY through the CPA path and let the common CPA
wrapper invalidate stale writable translations before returning.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/x86/include/asm/set_memory.h |  2 ++
 arch/x86/mm/pat/set_memory.c      | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 39271a5ea925..710164ea8258 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -88,6 +88,8 @@ int set_pages_rw(struct page *page, int numpages);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr);
 int set_direct_map_default_noflush(struct page *page, unsigned int nr);
+int set_direct_map_ro(struct page *page, unsigned int nr);
+#define set_direct_map_ro set_direct_map_ro
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index a1a061d995b3..7c0cfa7acd17 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2666,6 +2666,16 @@ int set_direct_map_default_noflush(struct page *page, unsigned int nr)
 	return __set_pages_p(page, nr, 0);
 }
 
+int set_direct_map_ro(struct page *page, unsigned int nr)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	/* Direct-map callers are expected to pass pages without aliases. */
+	return change_page_attr_set_clr(&addr, nr, __pgprot(0),
+					__pgprot(_PAGE_RW | _PAGE_DIRTY), 0,
+					CPA_NO_CHECK_ALIAS, NULL);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-- 
2.47.3


