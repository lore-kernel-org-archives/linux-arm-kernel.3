Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45F3C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LGYFIbfhwG/ewJSvY1vT2DTH4BojWvMhmzCrf4rviWI=; b=0fOZGdZy/sMWOT8xyJ5Vg6uyMu
	s12G2bYpcHOPojr8Dkg29FB+hTHyJBFPo5vojKSsfSGtSvO+m9D10si58g0rYfglIKzvpurlq5ToP
	jdTqGhoICkcqiM7UHUoowYg3E7xX/KVD4t4t+3QDROrgNaGW9R2rn8hPFNR+uF0JP5rrPrAHV0VWo
	IoYktVFK3ojeObc3JbXFMutsv2e9JHgPgM/iGVUbXYBhtMktQQJ5FNZUFKLDJskWQAQwAoMFbAafQ
	qmumwjeb2/yO+7xHLuoeZ4jhvWvXrZjUonXFEx8+wjbXyn0byAV9e/cPaBk9Cl/ytUbfcEWkRG/VK
	99WDNOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQo8w-00000002YOS-0D4R;
	Sun, 15 Jun 2025 14:15:30 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQo5K-00000002YET-1j9T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 14:11:47 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313dc7be67aso379581a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 07:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749996705; x=1750601505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGYFIbfhwG/ewJSvY1vT2DTH4BojWvMhmzCrf4rviWI=;
        b=FsHAmti+s9UAqlYrV/3P35C5UjK1YfZrnG0a2ZFPo3egueNn630c/Ymxt6LOm2SGks
         WE0luyS/SIJkmWgRTug9shg1LelIptT4J7V2dpHMXbvcv27KRRlJ/IPpR8QzNeGITvaq
         +6U329Z8FIZilbpfh/SRbZslRyfQ7yB5mkw3iVR5bgpm/21nmzbPVVcyawfPuOANNyZj
         6iiBLIrM2AIbi9TnU1mKLgHm+dA7Lr5bjNJzWDvubGdQEMzg7Bpq4HDCJ5gOggPwxbHa
         LOqZA/cusVxxb/IFHUY+3JoNrzw/tOqkElJ7rPq5PuEhVcI7doKIUZNadctb5v3ixPwm
         d9+A==
X-Gm-Message-State: AOJu0YxvQVFTwEFCjzymbzZ7Un6RPoXreC8+i0OX+Iy54HbMxU8ffW7J
	pwMZUXqyQkGQT0364me6qMuv+1edZkl2uIac+DSQykIpHZxyQ3t/f1QB
X-Gm-Gg: ASbGncu5Xqt9lwK3IJRUYKW/xpZLQEuxXpK6OwYK9pXMimU0Y82ddXlgc4CZsmzljjD
	uNU8nEc0HsXedSbj/MJ5THK1rFaGMUGaGehYZhA9bXqk/SWr2aBiaR2+yz/OMWx2AUIqKYjTBNe
	Vg/IrlhAm35KnD7vc9Y+f3LCfhO/jGTl0XZ0AR7PTu5A88sLffwiZOmPbGQh2zVV6y+y1sCPk/7
	HdoaQlFNPOEomhFXPyjiYAmesnprc+We18FC1QMxeeoOyFTVnJGGFyfZw0uIt4zHTlltR13o3x+
	vkjEQP8pJ/6KzqSKFtj9Icb1xd1wzTW5SIEL6Q6MBM39xTYsf1eTzzm5v9ndDgZKp7jG
X-Google-Smtp-Source: AGHT+IGGa9UpaHH1Yj95UONqu/2rdm8o9/Vcg4vz+0U3koVu0uwN1twEJ1XBEWaDhjWWABQPAGIbfg==
X-Received: by 2002:a17:90b:540d:b0:312:1d2d:18f8 with SMTP id 98e67ed59e1d1-313f1e50e63mr3448982a91.7.1749996705027;
        Sun, 15 Jun 2025 07:11:45 -0700 (PDT)
Received: from localhost.localdomain ([218.152.98.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de783a8sm44233375ad.99.2025.06.15.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 07:11:44 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH] arm/probes/uprobes: Remove redundant preempt_disable/enable around kmap_atomic
Date: Sun, 15 Jun 2025 14:11:30 +0000
Message-ID: <20250615141129.653384-2-ysk@kzalloc.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_071146_447916_40CD682D 
X-CRM114-Status: GOOD (  10.65  )
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

The 'kmap_atomic' API implicitly disables preemption for the duration
of its use. It merely cleans up the code by removing unnecessary
operations, making it clearer and efficient.

Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
---
 arch/arm/probes/uprobes/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index 885e0c5e8c20..ebd17af0d865 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -116,16 +116,12 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	void *xol_page_kaddr = kmap_atomic(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
-	preempt_disable();
-
 	/* Initialize the slot */
 	memcpy(dst, src, len);
 
 	/* flush caches (dcache/icache) */
 	flush_uprobe_xol_access(page, vaddr, dst, len);
 
-	preempt_enable();
-
 	kunmap_atomic(xol_page_kaddr);
 }
 
-- 
2.48.1


