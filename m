Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9077FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AdkIGrCnMsc+er9X66uqVETmxKiULUWSewMsh5Pldk=; b=glLXCiWnaIJm3Ysjxx7vNlAffc
	SooaGDYBHSZwUXVMKlmjxoKAAJzGSGIunCKjlXF1A8oe5kRMt6ullMZKo0GO7H4606VVgYdiAUFyd
	KvL/K+17li/NCYcEk9mqAPbhMQBRuFAadMxaatjuceTh627bCYgapKfvgLi+dtrrTI/gxWBzjV4eX
	GcgcZ+lEG4CUw8SPii9v4T7ZPZ8HPEypiZc5FKm5u37ZWLjux6x3VIYxAqOdtk8efCmNpFybLrIlA
	Vp8EqsabwGoomPdHfl6gmAK1Vvu9RB84NDBSZMyCsBLdd0CaOTDUYFJIncWnf4akm3ZCQ9RL7ZwDf
	xHb8pyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvak9-0000000EglY-2Sk5;
	Fri, 21 Mar 2025 11:40:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvagi-0000000EgBK-3rDV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742557040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AdkIGrCnMsc+er9X66uqVETmxKiULUWSewMsh5Pldk=;
	b=gKLjWuy6vsqFIw8SagXDhwxg7bpi1WrqdfnuL0+BizoKkH0nnUrmenTmp9UQbItR1pXXHg
	KQSSFJRPglSmMwfqCfsFo7GE4Jj4kOh8ydC8AntM7rhMaHTraIdLmSbgBMzBHnQkmQ72yd
	dK6vNb9jjap0YGZ4ERCLEGSexcr+4xI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-xg6bj-NrNsyR-yosF6n9Dw-1; Fri, 21 Mar 2025 07:37:18 -0400
X-MC-Unique: xg6bj-NrNsyR-yosF6n9Dw-1
X-Mimecast-MFC-AGG-ID: xg6bj-NrNsyR-yosF6n9Dw_1742557038
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39130f02631so810818f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 04:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742557037; x=1743161837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AdkIGrCnMsc+er9X66uqVETmxKiULUWSewMsh5Pldk=;
        b=PV73N4bUDWap7sJTaDBy5EhlWUaRDtUTvVhEK47+sofsQPFmWq0F4dLYyIL1Kbl6q+
         8xXbWlii+D8VyuNvXtDE0SLBUPO3tWdWFCJ5WNFfAz27T//rCmKvQAgr3HmGT3y4+b7Q
         xkOBoIbtS4EFWijNzrB2m/2H7gPfkvghS5pyiJyhhCrUN/ciub05D4xA9CunaEUYNKGZ
         pCDOrwCyYQ/nXWQs26ZqqOhfiVbFQl3yDc5rzylJP3SsK95BtdAAEgnMy/mIuEFVz7Zg
         Nbg3JKk5C9HCfau5UnHm6jMawzwZFiscWxKc3jPxgA0s/PFGvoYuOa0Nwo9RLGoZOp9f
         hFHg==
X-Forwarded-Encrypted: i=1; AJvYcCVkDkremOu5ACuIEaWgvPunvzxCmZUHpCIlWBMoU1LojvykEzUChhPAhjPG1CwsYft0NuYvYJ0G/6XgsPtbwrrA@lists.infradead.org
X-Gm-Message-State: AOJu0YwTBj/WNAIxbM/RClOBiiX99C5sh1pRZr9cxMtuPorcRwkdwEXg
	uEJH//4n3LXvFmdphDdcA1OKEpZ3P+XfVJ/Y1WtIH1pbWiTWncedOu8HAnnGgBi8HHRrX4hQhTP
	/cP+OAgWOWbO6XZk3iVETWjIRHTNzjQ2DsbgOrs9GrAZeGcbPZbT37P6gbxqDwWEfPd9F3GyL
X-Gm-Gg: ASbGncvYwiBBN2L/5CQ8GTWPjzAvu/iRjX2qk0YorpLz5APIJ8QLsDcKKTo/TUC09Tw
	C0VcAiccNeDAaMRLQwIluwTrPKBrVUtkjSxTrvifukbeKsCykIYHKk5280WmuZzYzWxmc8zMVWx
	72v8/tOpL8RXLcogTaLjEKi8xEIutvcf236EWrPawM9VQqYZncXtl1meBuW6FzN9clSK4ZB/EPh
	Pm9HEc/UCd6G3elrkO6eKqJLxbWGfaCSvjjFPMtoTcpwA0BZZlGv/9HCRtZxK8IvrFzGA4mQA1F
	P1FCe/Uvn+uuMGVCxkZQWbLyhDlEiR3SJxpNxHDP8x1Jto9+FyFvxu30HzkO6O1Q82/xWK401Ah
	U
X-Received: by 2002:a05:6000:144c:b0:390:ea34:7d83 with SMTP id ffacd0b85a97d-3997f90e7c2mr2841349f8f.31.1742557037618;
        Fri, 21 Mar 2025 04:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG49ODTrypvf9tYQ5TgQ34vttK3IHB4Rj01M+eydlpDxfAmjxfWJ7Zgo7XydYKuCca6cGe7VQ==
X-Received: by 2002:a05:6000:144c:b0:390:ea34:7d83 with SMTP id ffacd0b85a97d-3997f90e7c2mr2841314f8f.31.1742557037213;
        Fri, 21 Mar 2025 04:37:17 -0700 (PDT)
Received: from localhost (p200300cbc72a910023d23800cdcc90f0.dip0.t-ipconnect.de. [2003:cb:c72a:9100:23d2:3800:cdcc:90f0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9a3f36sm2189825f8f.32.2025.03.21.04.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 04:37:16 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH v3 1/3] kernel/events/uprobes: pass VMA instead of MM to remove_breakpoint()
Date: Fri, 21 Mar 2025 12:37:11 +0100
Message-ID: <20250321113713.204682-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321113713.204682-1-david@redhat.com>
References: <20250321113713.204682-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HGzRimRxiZWquQTerHFvuQ13C7uT9wbL1IhS3pWNggE_1742557038
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_043721_032046_EA33734A 
X-CRM114-Status: GOOD (  15.80  )
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

... and remove the "MM" argument from install_breakpoint(), because it
can easily be derived from the VMA.

Acked-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/events/uprobes.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 5d6f3d9d29f44..259038d099819 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1134,10 +1134,10 @@ static bool filter_chain(struct uprobe *uprobe, struct mm_struct *mm)
 	return ret;
 }
 
-static int
-install_breakpoint(struct uprobe *uprobe, struct mm_struct *mm,
-			struct vm_area_struct *vma, unsigned long vaddr)
+static int install_breakpoint(struct uprobe *uprobe, struct vm_area_struct *vma,
+		unsigned long vaddr)
 {
+	struct mm_struct *mm = vma->vm_mm;
 	bool first_uprobe;
 	int ret;
 
@@ -1162,9 +1162,11 @@ install_breakpoint(struct uprobe *uprobe, struct mm_struct *mm,
 	return ret;
 }
 
-static int
-remove_breakpoint(struct uprobe *uprobe, struct mm_struct *mm, unsigned long vaddr)
+static int remove_breakpoint(struct uprobe *uprobe, struct vm_area_struct *vma,
+		unsigned long vaddr)
 {
+	struct mm_struct *mm = vma->vm_mm;
+
 	set_bit(MMF_RECALC_UPROBES, &mm->flags);
 	return set_orig_insn(&uprobe->arch, mm, vaddr);
 }
@@ -1296,10 +1298,10 @@ register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
 		if (is_register) {
 			/* consult only the "caller", new consumer. */
 			if (consumer_filter(new, mm))
-				err = install_breakpoint(uprobe, mm, vma, info->vaddr);
+				err = install_breakpoint(uprobe, vma, info->vaddr);
 		} else if (test_bit(MMF_HAS_UPROBES, &mm->flags)) {
 			if (!filter_chain(uprobe, mm))
-				err |= remove_breakpoint(uprobe, mm, info->vaddr);
+				err |= remove_breakpoint(uprobe, vma, info->vaddr);
 		}
 
  unlock:
@@ -1472,7 +1474,7 @@ static int unapply_uprobe(struct uprobe *uprobe, struct mm_struct *mm)
 			continue;
 
 		vaddr = offset_to_vaddr(vma, uprobe->offset);
-		err |= remove_breakpoint(uprobe, mm, vaddr);
+		err |= remove_breakpoint(uprobe, vma, vaddr);
 	}
 	mmap_read_unlock(mm);
 
@@ -1610,7 +1612,7 @@ int uprobe_mmap(struct vm_area_struct *vma)
 		if (!fatal_signal_pending(current) &&
 		    filter_chain(uprobe, vma->vm_mm)) {
 			unsigned long vaddr = offset_to_vaddr(vma, uprobe->offset);
-			install_breakpoint(uprobe, vma->vm_mm, vma, vaddr);
+			install_breakpoint(uprobe, vma, vaddr);
 		}
 		put_uprobe(uprobe);
 	}
-- 
2.48.1


