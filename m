Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A507EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 22:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pc9BIslmRtbzEaqCHxhWv7mDukpJW925YKmou2T40Cs=; b=1oh3UkFXJDXpNpQgzwZtr7Ch0Q
	Y8gjyRXbJ/lf2QZRPqMfTOdEGHNA7JmtIKRQXrKAg2Y+c+TOwWAb7U49Pgo1hLm5c0ww6ZBPbK4VR
	3dg3e0thD8h5wd7HMGsW131fZG/WFaNmaIBp9mPXd/gb9nt5azl1LLl/wU6GP5RbA1R+DrwvZFwjE
	rS47ej+huiO8dQns3kaKPivF+hZkczjEO8RUeVi1TAm61qZdCpFBGILJtFkmOy5wn5SgtkmXN6sRv
	ayyOQc5vOpDK+99e/R/IslXxhWusCEEeXUuDl7Ow9Cb815JNCQquv4Pow2U9RGSeP1+Qii9CazVMk
	f+F73eQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0pFI-0000000CxQ5-30BQ;
	Fri, 04 Apr 2025 22:10:40 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0pBq-0000000CwvX-1LIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 22:07:07 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso304589939f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 15:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743804425; x=1744409225; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pc9BIslmRtbzEaqCHxhWv7mDukpJW925YKmou2T40Cs=;
        b=gdlqMm+VLWYoCp+E5GGDTuMle+vwDEzZiZi1bx9xsvNHUQnpsnWv1Mmg5GguJ9MCXi
         LZ2VjSt2JpZdyt2Iik3Je7e1/j0YSUpcU8w0njflqpIho1v2WodW0OyDpsq/rO3MMYFM
         JVYkw/KMcMBAMmtJ13NTNizIvoh6GkGigbAjre3aZOE7z8wLi2icoJL2gosOfS5B8wTr
         dBM8D/OGikmYZ8L8o/aKC5HGoi/Atmvm5jtrm0Zpmd936btZf2wMTuJAQGh7fMCpdW+d
         OIJjnYQse3wSPvm+7UWWVPDw1B9zl1ZDqne49g6CSBvrlYBC6QZC0ePiR7jNbG4bb8fN
         Vo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743804425; x=1744409225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pc9BIslmRtbzEaqCHxhWv7mDukpJW925YKmou2T40Cs=;
        b=rXnFSa7OSbz3NCC19PmmGxdyz4esbQZZUvzE+aXOYHTvX6emtIFQBSyzDoJxpVAICB
         WaFwp77JrcPFJJ3Ix2bPm396NhH9akHv5/6m0YLBThgVIchJ/m8vruAhbRHnhUhOeBzP
         buCDPSghW7R/gIxngIulP/AhMzHXhauBuzHrXLRAJvq4/5nL6LRzRPC2JwA3PeoBzP9y
         emMMkdDTvNyUomdonmJbgYxFZBAg/tpyONbrOjrOWGCtUbyO1D3Ogv6qpvvOmXh0mzNz
         XoalO5LvY/D5/01fbsLHpr7Q9hm9Su4KhGI4ZrmS8kfTQDJ4COc7fnUKRdFdt31TBlQ+
         1h9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCft4Pe52GABp1caPdYR1Cd+5hKg4xxdKeJ+JC6v5Ex5wbq2uVQfTXyVrZy9XRWDR69GDIrJOUulqK1NHUDJwa@lists.infradead.org
X-Gm-Message-State: AOJu0YxBd2gibkB6ADqySRP3BM0qpkbRtpgdi4f1B8ccJQBrMd+PQgMx
	RBVX2jfRmiFyTag6T5+Lv6E4XLMIOqKcwurVANygRn1PzKCx15zu9VpoI6njB4ag3aQdPhsr0IV
	CrUgy8w==
X-Google-Smtp-Source: AGHT+IHdes02xNhbHRa4hrCg2N+VywWvzx8Vq2+IoHciYVBDcUnJpNkQ4rg+6l0nOZiDn4tZhimhX6EbrE0g
X-Received: from iobbf5.prod.google.com ([2002:a05:6602:3685:b0:85e:9686:d0f0])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:6a46:b0:85b:46d7:1886
 with SMTP id ca18e2360f4ac-8611b49b398mr539039139f.7.1743804425293; Fri, 04
 Apr 2025 15:07:05 -0700 (PDT)
Date: Fri,  4 Apr 2025 22:06:59 +0000
In-Reply-To: <20250404220659.1312465-1-rananta@google.com>
Mime-Version: 1.0
References: <20250404220659.1312465-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404220659.1312465-3-rananta@google.com>
Subject: [PATCH 2/2] KVM: selftests: arm64: Explicitly set the page attrs to Inner-Shareable
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_150706_357942_9F75AF56 
X-CRM114-Status: GOOD (  13.72  )
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

Atomic instructions such as 'ldset' over (global) variables in the guest
is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
DEFINED fault (Unsupported Exclusive or Atomic access)). The observation
was particularly apparent on Neoverse-N3.

According to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte load/store),
it is implementation defined that a data abort with the mentioned FSC
is reported for the first stage of translation that provides an
inappropriate memory type. It's likely that the same rule also applies
to memory attribute mismatch. When the guest loads the memory location of
the variable that was already cached during the host userspace's copying
of the ELF into the memory, the core is likely running into a mismatch
of memory attrs that's checked in stage-1 itself, and thus causing the
abort in EL1.

Fix this by explicitly setting the memory attribute to Inner-Shareable
to avoid the mismatch, and by extension, the data abort.

Suggested-by: Oliver Upton <oupton@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 tools/testing/selftests/kvm/include/arm64/processor.h | 1 +
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index 691670bbe226..b337a606aac4 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -75,6 +75,7 @@
 #define PMD_TYPE_TABLE		BIT(1)
 #define PTE_TYPE_PAGE		BIT(1)
 
+#define PTE_SHARED		(UL(3) << 8) /* SH[1:0], inner shareable */
 #define PTE_AF			BIT(10)
 
 #define PTE_ADDR_MASK(page_shift)	GENMASK(47, (page_shift))
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index da5802c8a59c..9d69904cb608 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -172,6 +172,9 @@ static void _virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 	}
 
 	pg_attr = PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE_VALID;
+	if (!use_lpa2_pte_format(vm))
+		pg_attr |= PTE_SHARED;
+
 	*ptep = addr_pte(vm, paddr, pg_attr);
 }
 
-- 
2.49.0.504.g3bcea36a83-goog


