Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973C7F5A8C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=; b=zQ8wwxmPcky5FE2LTrR/EvEDu+
	8IOoqby59cBx10YsGOYB0/6UGDTi9kOnieWo1hNTTTtVyCny1NGijbIZZbV3aDVUpQoasEQYjFJBK
	QneaVjqtGLZT/JpzoPu7E85VfgLZe8tb5eqSx+Sxjrh9F6+vZ0wCv1qveBVZJxS5gJ7tzGZhea+9c
	owJjcS0rMKiXU+gD7Z1074X1gI9SNK/ZisgErrDafNZclms1Jc8vzVD7www89r1cr/aVwbIkkpXYs
	B+J2lhpDQu+ZXaxoJGzccGdMDCsHF3CsF5uGM6E3UNsphi8RLad7oWczFCDE5a1qazVLosiGeMKQ5
	CmlbeR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3L-00000007gd2-2ong;
	Mon, 20 Apr 2026 21:21:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2t-00000007g2t-0ilQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=; b=SyW5c8k0RBYuMDSvGYz1R127T/
	n3vbZrmZP5TCCZI9USdKCxPuVgjPorn7pP5zAKbuh1AodnvVVBFomhOnfTgTBgqYiXAgkE0CmlxhA
	bfcYTjiROY8DdmbEO2E8YRVP1N6vZKugpbBsB6UqY1SAkKny9TxXCm5FPAX+2PaTLdthQEsfnsMGh
	Hrx/ciD1KdQ6PnRcU4u0cTctVKbjlkly78c40EqLEPTAdJfb8qmqN6flcqxOmEFhRa9nhRSUhPfMm
	BZU0sb88V8W0/dr3+BoB+ATafmyJr/7TAOi+E7ip4n94ev51bkEZeBHdvUcizMKcClvZbjy6tT4dI
	9xKKp0cQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2p-000000093Ou-3Irg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b454cac322so32810115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720033; x=1777324833; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=;
        b=Cqm0naYsWOZBuStLbVrhD2JxXkMisudmVaGN4G2XTGCNC5EfGWqj1fG+2hQjtAACjP
         /V6FwPuZXtY9iVDWHqStMvBfBd49hTxTdJe+2ke5ikLsIBM2Q6+aoP6+kCQMl5dtE66n
         pTInXFAROnQVdHfjkFc/fU/ImDDMuQgWdzcwUMCIPjd9/JgDfSg7nSJMD+3eSUTX8Lj4
         fcMzKrpLD2leoudZ2xXrxSgoN7CyVzYFS9jhQKbv14AAiOEurbTUSf/bpMnzF1Xu+/k3
         nzklU0NhmeSEHE0v5tY4kOc7rJQW7FL9cNEmbj9PmkejY0Rjzchd9/Jq49/rJHHCi8L6
         ybxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720033; x=1777324833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=;
        b=I9M1NtEbW/yYbmoVbrdAtDXG1kHhICI63Ut62iQGVO9gtuJk41sLIitzPCV807bSpg
         K+HGBbLUvv5IA7APCOHDKV9XD50lmh080LnQ6Iz4Icu4+/XXyBV5mP/t9WdjBNaW8XZw
         cVG6cIeCLOzDSsm/OcUU85WADlyTmrv2SUXsAoxWrGtBHqEUtNWGe/wfZ2CzvLFwcca3
         799BWQCq+4FvuXd523wswXps/zhAMioyalbeLCTn3fMvQ8srYkY736Q4W24yUof2HVcv
         j2lJr2gQB9WzE8S3eSCet90Y866wqHUoa2T+VyTGBNyk2JJWWJgfSi0eBaLtdhZnNuLW
         JJKg==
X-Forwarded-Encrypted: i=1; AFNElJ8uHKusEDFNX3Hp3mVECzGOcHBDttpeufiR8PxIBEl8669GQY942WxHpbQH8NGSdjfODkKfugSz8kci/spDDGUV@lists.infradead.org
X-Gm-Message-State: AOJu0YwsyWVCA5ScvRofnpdEA2wvFKVn0hu666lwowyYXyCjHfjbF1f5
	I8EqsCBUUeXFljlxpL83Wp1u+z3kULse5J1RcxcxW8RwxYHTA9RVgKwEJ55NiekPLLg7XKjGqI/
	Dvkbaew==
X-Received: from pldt14.prod.google.com ([2002:a17:903:40ce:b0:2b4:5ded:6ecb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d58a:b0:2b0:ac1e:9737
 with SMTP id d9443c01a7336-2b5f9ec5ea7mr159040275ad.12.1776720033096; Mon, 20
 Apr 2026 14:20:33 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:59 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-15-seanjc@google.com>
Subject: [PATCH v3 14/19] KVM: selftests: Rename translate_to_host_paddr() => translate_hva_to_hpa()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222039_870202_AB95DC26 
X-CRM114-Status: UNSURE (   9.30  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Rename arm64's translate_to_host_paddr() to translate_hva_to_hpa() and
update variable names to match, as using "vaddr" and "paddr" terminology
is super confusing due to selftests using those exact names for *guest*
addresses.

Opportunisitically drop superfluous local page_addr and paddr variables.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index 7285eade4acf..fb06b9dcb3d9 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -56,13 +56,11 @@ static void *einj_hva;
 static u64 einj_hpa;
 static bool far_invalid;
 
-static u64 translate_to_host_paddr(unsigned long vaddr)
+static u64 translate_hva_to_hpa(unsigned long hva)
 {
 	u64 pinfo;
-	s64 offset = vaddr / getpagesize() * sizeof(pinfo);
+	s64 offset = hva / getpagesize() * sizeof(pinfo);
 	int fd;
-	u64 page_addr;
-	u64 paddr;
 
 	fd = open("/proc/self/pagemap", O_RDONLY);
 	if (fd < 0)
@@ -77,9 +75,8 @@ static u64 translate_to_host_paddr(unsigned long vaddr)
 	if ((pinfo & PAGE_PRESENT) == 0)
 		ksft_exit_fail_perror("Page not present");
 
-	page_addr = (pinfo & PAGE_PHYSICAL) << MIN_PAGE_SHIFT;
-	paddr = page_addr + (vaddr & (getpagesize() - 1));
-	return paddr;
+	return ((pinfo & PAGE_PHYSICAL) << MIN_PAGE_SHIFT) +
+	       (hva & (getpagesize() - 1));
 }
 
 static void write_einj_entry(const char *einj_path, u64 val)
@@ -303,7 +300,7 @@ static void vm_inject_memory_uer(struct kvm_vm *vm)
 	ksft_print_msg("Before EINJect: data=%#lx\n",
 		guest_data);
 
-	einj_hpa = translate_to_host_paddr((unsigned long)einj_hva);
+	einj_hpa = translate_hva_to_hpa((unsigned long)einj_hva);
 
 	ksft_print_msg("EINJ_GVA=%#lx, einj_gpa=%#lx, einj_hva=%p, einj_hpa=%#lx\n",
 		       EINJ_GVA, einj_gpa, einj_hva, einj_hpa);
-- 
2.54.0.rc1.555.g9c883467ad-goog


