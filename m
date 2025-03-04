Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BAEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RHlzy1ROEWhQbxxG4Yv+rRoMty5ce9tc18f8MaHZsU=; b=s0Cdq2XC08j7tZmM7reGD8Ukbx
	CakYl/nu5YMaQka8kesreJRcRbWvRWiYFvqF/33qirCr2YhwKNBwETBpcm1jEYgkp7UvSXkMRXdRi
	aBEPP8N6BXlfHLh4OhW01MvE/ZaHuLjceSoEmChxCpKIg3oVfNtuet7rlHmPhIDWo3rsdsumEEaSp
	AroHnHqeJNpQtUK79q8PXOix/jiXdUWtwU86twLrEn9bOV2VP1m9bbPhQ0tGa9ZIdaU6SAPrcAlRv
	vQqVQ+7VGFbDn4vGe3ZQpaQlkG7GEZ0+ytoczRs/bCOkNKdAhC9vdixePu9NImUU6aiLs5+RlN+Tu
	1D68jhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWmy-00000005nWp-1evg;
	Tue, 04 Mar 2025 18:14:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUVq-00000005Hin-108v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741103333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RHlzy1ROEWhQbxxG4Yv+rRoMty5ce9tc18f8MaHZsU=;
	b=bAhdoQSm9XaMTJHTxGnLddPdJSnt1yxl0cUlaR9g0bpz8TCqhnGeuKUMPyh15k6NH0o6L1
	inS1BBgP8LWx1DMeP08sSP1d/84RP7C2UkJ9REfJryGMThBDCyROUvPuFiYhQDDBYJxGXe
	9SXFd9M/mBbqrdRCUQclTg6sDU02SHw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-64atDQihPACOpKXXcGipbg-1; Tue, 04 Mar 2025 10:48:52 -0500
X-MC-Unique: 64atDQihPACOpKXXcGipbg-1
X-Mimecast-MFC-AGG-ID: 64atDQihPACOpKXXcGipbg_1741103331
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4399a5afc72so26872155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103331; x=1741708131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RHlzy1ROEWhQbxxG4Yv+rRoMty5ce9tc18f8MaHZsU=;
        b=dbgano3ad4ir6kyCUAwv0RwtE1lFzB0gkh02wCothTqH2iME5TJM/CU09gZtiZAWJO
         PvpzmRtoHRq5dIeW8twZwT2DsuYKUKpE64wijfAfMXoYI3Lr2+ipChS67mHhJi7xctpb
         F0xTijeep0Aja3/J5uuoXXB1shc3Nm4WHkI/xIrMJN7qBSff1bYQgvUZ4T4jDTLNLh3J
         c66KXB6EpkWZ7yu1sCV7gi9z0ELX7AQlAnbWn+JP0XXeK9psrtFx88fLvrbovwID2/oI
         lcQEsESGJRmJpvNe6a9oSjiIBR/yPZjrxkVRvBGCsAkNjdI80iD5k7nGgWx6u/BLpIFh
         1bMg==
X-Forwarded-Encrypted: i=1; AJvYcCXbZPcCJ07/p6fODta+qjFIMwc38ynENx1PnqJNqSQupuSSSNuVhbf607oklgwJ/FVWxkoQPVhJtt2pM9AbSP4L@lists.infradead.org
X-Gm-Message-State: AOJu0YxD0iiKc6riE72Ck246QfG9nM/A3KHDapptK3ZLW46dLp6IRZ/6
	93VLFscJjTQ25tq07VVPExUsWBZEYqvqFMMsApvWTglwewUgWX43heKqOb1pcWQJwJL99f00//j
	Vs+EB4HIADKwVZyG45qIeii7x9b7bMkuVkbpCFYAzWw/2E6Te8BjBBihvnKFEdQo4zpJenuZM
X-Gm-Gg: ASbGncuAmzM0PIqlIVlblO5KxJmVe3aASEErPpzbppDPGRoX7p4WV2rIWRU+qJGruAT
	JdOpS6nP/7hwF4p4yjNajbidJIEJnWhDP1nk8lp/pIYzGQrugSIda1vdbxQ5TJfA2EVbKmFgnHa
	/fdv0qE9GgRQ7VLXRUMeIFfa8kZZHSYG1j/OIwEJnN9o5zbybnU+iQjZIKsGAS2Lz1b7F/BW+Wr
	M10rLr3mwFGoZOntj/OSgvmwxbQzWEzFt+v0gEO5f9gWYRZwRybAK/ehUDlpwYhE7SvKMYAXj1w
	39ktTMwfVHemHuw8oOxxn1Gs+kTAtCohhlcYbmbn/9xuPbMy2aCZNo9BoslX5qu0rqWDN0dgKvY
	d
X-Received: by 2002:a5d:5847:0:b0:390:e94c:453e with SMTP id ffacd0b85a97d-390eca070b2mr17839164f8f.39.1741103331038;
        Tue, 04 Mar 2025 07:48:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS2yQ2nIm92Fqm8oP87QtIsIbeZe5pQ0O0ho/Z0iCYCjljpWAZZP5v8ry/LGiAu8oiIQK1RQ==
X-Received: by 2002:a5d:5847:0:b0:390:e94c:453e with SMTP id ffacd0b85a97d-390eca070b2mr17839137f8f.39.1741103330643;
        Tue, 04 Mar 2025 07:48:50 -0800 (PST)
Received: from localhost (p200300cbc73610009e302a8acd3d419c.dip0.t-ipconnect.de. [2003:cb:c736:1000:9e30:2a8a:cd3d:419c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485d906sm18206420f8f.90.2025.03.04.07.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 07:48:50 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [PATCH -next v1 1/3] kernel/events/uprobes: pass VMA instead of MM to remove_breakpoint()
Date: Tue,  4 Mar 2025 16:48:44 +0100
Message-ID: <20250304154846.1937958-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304154846.1937958-1-david@redhat.com>
References: <20250304154846.1937958-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I_LW-Y73KrAJswuBp3IBP0RPMBuZh_7nH32tTQBWMgk_1741103331
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074854_348369_88931023 
X-CRM114-Status: GOOD (  17.11  )
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
index 8fc53813779a4..991aacc80d0e0 100644
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


