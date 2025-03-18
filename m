Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B172BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rus6kw9XsBL2c9jHGjOEjWiY0U6NqB+KHNJXO9LzuQY=; b=qPzvccHHJxTLWO6HNoVtWwimGR
	3LZEJsOxPinw1b11YseV5RNNOOtznRn2vmkLOgTtgT2/0lGfQR9/ZtT7sMFCpa+u/EYHVkgxtUKy3
	YNF7NZzKYMhKZgtmrNecAc5hsCeeU61abJ3JmaB3hT7tM4yAUslWfZNH4P9SuxgMniwknH9m0JPjG
	89h1HCjcxT6dn/DEImhKJ7VRpx+Jz8zv8eY0WiQlJ6NeRmd2jCogPpslSTaCYemdXds6QaUKUWVfn
	THHHdDEHTVNvc+uBY8m7FgiHQEIec2Qw+LYsDGQ71a22gJzYSfhxDPXb88xg4KPrT1mCRXS3JQFXS
	Ozugu8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufGc-00000007ENm-0nBL;
	Tue, 18 Mar 2025 22:18:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufDH-00000007Dvc-0BUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 22:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742336106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rus6kw9XsBL2c9jHGjOEjWiY0U6NqB+KHNJXO9LzuQY=;
	b=eZqsLfjj5mBsnpHKaw19MdOED8Xb5bh8KKOEyUEJUxQ60xRKrbesDYRyGDHCIAx+l4AS9S
	5pDPMafBqlQ0OrHEqsuMaRCfqee/vsy2f/mldcQWLRFtjn5a6twasdEoWdnYsSBQDG8ynK
	pX0yM/f17rpqdUqXuEKfPLkMaURxlSY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-AhZLvaG5NOSzRWa-5z86-w-1; Tue, 18 Mar 2025 18:15:03 -0400
X-MC-Unique: AhZLvaG5NOSzRWa-5z86-w-1
X-Mimecast-MFC-AGG-ID: AhZLvaG5NOSzRWa-5z86-w_1742336102
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912fe32b08so3657038f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 15:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336102; x=1742940902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rus6kw9XsBL2c9jHGjOEjWiY0U6NqB+KHNJXO9LzuQY=;
        b=WEEidwCpMHlAZPKkmdjYoCBEy2DWoJY5AIOpBwqkEjRFKvpNdV88BkUJgGTGJrMm6W
         EtL0DvMqLhjbKdmVE75x97w3+APWlPsS0g2mbbg0xSxuAM64VkPQ21Jf8Tee3Szq0PeK
         Vcl6/KGHhrZ5bH1HnRPc1Tzpoz4674C6Q+wXN254gvRb2uWzovTr6aeWLy8VbgAkxRtW
         GGPISnduN3/UXKuIK6Gpp3ZB27nYK/3sA91UD2C8VNhtJNo98BvQ+Xo6XizoiZYInPZH
         Y/RxEYIq8egbIjYmCKB4C8/WpjudlGudcwDC6XnzReRQn1/RhoojnAebX9GKA8PYO9dS
         hdQA==
X-Forwarded-Encrypted: i=1; AJvYcCWZlnoWwPuhlAw5dN3XbtU3E0JZ/oRMd9mIWmCZoOZCmuUMUwM7SJzt3Ty59uyIv08CmmgumEcSL1M2T0URxirQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwYrdIRZtIhfi3L2FLj0tvJhwzjpW3OaZ/JWGhXsxL0yPACaeZf
	cWBQpd993JGhVEu0fRU50dYQqVzCtsalYz79MsEw66kiI0VkV9XjgTrurXXv06yvEitLeRGcQTk
	u7rLOYyISVpJAER+VynKadLs4njRlHN5S+rTZTLHIf1oWS/+NAimJz4QKJWWs7ubCl+7J5wAm5S
	1qnmpiG3E=
X-Gm-Gg: ASbGncvozfDusoePU96uARsz/nqKnW7/XkWIFvmDJLu1+VGC5R0eurHOa1AfCmFXvpz
	/WdebW1pDUojLYMAc7zUQ84ae0pacjZjMDXReYgA2O6UqhUqNfAdRigiYp/cTCx406SumGs+WG7
	M4yH4ZhAUcVif2HpuCWFYX1MFDJQXhPvECQneyNIc1zJ810cQGDe6KYcRkoc62b60FwgqtLJ+qI
	hRNU5URIHtw26xlpNPysTRPhwYi1NB+5csfJl9+3b4b4JsCAv11rnNgKAbAybeyp7Fr8Hrutava
	t43LBupJm+TmZ7a+VomphZ5T0Gdf76YsHRQkpHxLGoic/yQNBS6hp/zucK+W7DaeP8j3h5g5S31
	B
X-Received: by 2002:a05:6000:2a6:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-399739b484emr390656f8f.6.1742336101721;
        Tue, 18 Mar 2025 15:15:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEntLQOUh/Nv/fGa/REaqlKcGpxmQ8E/qfsoQdKPfCKbsE1Lco5OztnXYuajlRpXhgshxCpw==
X-Received: by 2002:a05:6000:2a6:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-399739b484emr390645f8f.6.1742336101239;
        Tue, 18 Mar 2025 15:15:01 -0700 (PDT)
Received: from localhost (p200300cbc72d250094b54b7dad4afd0b.dip0.t-ipconnect.de. [2003:cb:c72d:2500:94b5:4b7d:ad4a:fd0b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb318a8bsm19682001f8f.66.2025.03.18.15.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:15:00 -0700 (PDT)
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
Subject: [PATCH v2 1/3] kernel/events/uprobes: pass VMA instead of MM to remove_breakpoint()
Date: Tue, 18 Mar 2025 23:14:55 +0100
Message-ID: <20250318221457.3055598-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318221457.3055598-1-david@redhat.com>
References: <20250318221457.3055598-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8X3jaHYS-BJMEATNvAe8DVTLQajEoempa-4F_0f6kQE_1742336102
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_151507_146753_73DB0D4B 
X-CRM114-Status: GOOD (  16.40  )
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


