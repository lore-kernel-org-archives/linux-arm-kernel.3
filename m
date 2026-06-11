Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B844CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wyflRGzl20RCEe+VjdyZF4sSVExnxs7YpSWyT2xMI0=; b=JW2XgAYWu31zmqKjJKB8P5HuNo
	SGL1tCRboMI3lIuihNSuMr9KrEMfcaFvkC4mP1TLFxEUJozpzxeDmmvkS6ZaL2v9j3cr1lu78Fmpq
	cdppaJbcbtpmKg+dHTxz+yC8xinaenU/u3Ne+pWMBWGE2yEprbH6xrSn+475V8HE+wM458DCnEC0d
	LAdFSw/8xHux6iXLXFtUueMt+tdFnkhiAS6EpXt+MuFTjjiL9IdBQZjUce6kOwYtMW6DCtIfw8nhL
	sp9pffo5Rw+RDdQM8Aq41dAnNym4fNLWzRmESlHnzsvpugcvnObIhxhNl20Zpz4mtt3Q5o8pa8EcD
	PVmzMZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2j-00000009SWF-1Vq2;
	Thu, 11 Jun 2026 13:01:57 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2g-00000009ST1-312K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:01:55 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-68bd951b4bfso8389287a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781182912; x=1781787712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wyflRGzl20RCEe+VjdyZF4sSVExnxs7YpSWyT2xMI0=;
        b=RrJ3m+WHUBzOwj8oiI5rMlSYGzfQ25KZfM+07GK8wfDs28sItWXX9Dq2AK9ma+RcqS
         Ee/9RDHp/FkT8MwaI/4cfzgBjoOa50aNXxE97Q7UZuERWiJG4+2FHtOcbjzO6CVDGcVd
         M4Gvgtx1JibNvbieLM0Ux8LRZxW1+Tooqj5ZAogPnuUZefFM00eeAdKnsOCi25xZHwR6
         NGKEuZynmhmttg8FnRdmiYCumHkGJM2N8gGGQD/QYaTCuDXMRnewxeMDuIx7FetoHAE/
         l6bIIN5gDBsPHDqkjxlCBpRJsVJVpZn+hVDB8p9Khv9DHmv+T30Er7+Av/F4kwKPmPpm
         mJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182912; x=1781787712;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0wyflRGzl20RCEe+VjdyZF4sSVExnxs7YpSWyT2xMI0=;
        b=D5hgD8Luup7HzPWTIYCviwEHc6D1W5vVowsCp1p8xwCuzEUNElO/wb0WVd+dk1PCeo
         NrZaqqKQbhpPIx1d07d+qlZltDxY6IXMkODf6sfMNWfU5jNp0ZYlBsJlyQxwCAVPuDV5
         ARPpmRT1SSoq9fqCUhlb91H55NCTDWoSPslwTygZHtBfn9wsqeNUowkFkRM8j9b+0zvh
         a1GuSHAVq1Lj2iHtJH9Ljlm0vl7gHc95G/f4oF7dVd90G38fcpxs0q6W7yNrFGg4FyAR
         cTRIJsw1S5kn2LxwX/7uEE5V2sS/rSb/b6eaKsRnmZcmjLnmwFPnJjQJ9WLbcZ58ehZ8
         qqxQ==
X-Gm-Message-State: AOJu0YzJXPtrX/hUfT2RgCiAXUX/yoOLY2fWquqRVUvt3P4oGotIfsya
	Q5YH8jZqTU4be0IndbtSCq9GmNBetqSUeZ6WLJxLEB2PFpa8HVsou0vICp8A+Ewih67CG1gCcVg
	5FHpRZ2GITSw9lj2AeQclWVjfJ6fcxNwIyBacjDQnZmo3y0Kzm45QYqV6NEoRD7dkvL7b8WwOny
	HMwMTIpFea2mndTJXffVoK9N8egi4CD1UGtmYwWseJpjOdkankb6U3TQF4QWc/
X-Received: from edrs20.prod.google.com ([2002:aa7:c554:0:b0:67d:8c66:91])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4307:b0:691:b5aa:5a5c
 with SMTP id 4fb4d7f45d1cf-6930e2d10d3mr1376617a12.20.1781182911975; Thu, 11
 Jun 2026 06:01:51 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:01:41 +0000
In-Reply-To: <20260611130144.1385343-1-abarnas@google.com>
Mime-Version: 1.0
References: <20260611130144.1385343-1-abarnas@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611130144.1385343-4-abarnas@google.com>
Subject: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions on
 execmem cache clean
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_060154_779545_FE13224C 
X-CRM114-Status: GOOD (  12.16  )
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

Strip the read-only attribute from the selected memory range when
restoring the linear map after an execmem cache clean.

An execmem cache clean is performed when a cache block becomes empty
after unloading a module. When making the memory valid again, the linear
memory alias must also have its read-only attribute cleared.

Without this change, the linear memory alias remains read-only even
after the execmem cache block itself is freed, which prevents subsequent
allocations from writing to that memory.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/mm/pageattr.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 88720bbba892..eaefdf90b0d5 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -239,6 +239,13 @@ int set_memory_x(unsigned long addr, int numpages)
 					__pgprot(PTE_PXN));
 }
=20
+static int set_memory_default(unsigned long addr, int numpages)
+{
+	return __change_memory_common(addr, PAGE_SIZE * numpages,
+				      __pgprot(PTE_VALID),
+				      __pgprot(PTE_RDONLY));
+}
+
 int set_memory_valid(unsigned long addr, int numpages, int enable)
 {
 	if (enable)
@@ -362,7 +369,15 @@ int set_direct_map_valid_noflush(struct page *page, un=
signed nr, bool valid)
 	if (!can_set_direct_map())
 		return 0;
=20
-	return set_memory_valid(addr, nr, valid);
+	/*
+	 * Execmem cache uses this function to reset permissions on linear mappin=
g
+	 * when freeing unused cache block. On x86 it makes memory RW which is
+	 * desirable. On ARM64 set_memory_valid() just change valid bit which
+	 * leave direct mapping read-only so use set_memory_default instead.
+	 */
+
+	return valid ? set_memory_default(addr, nr) :
+		       set_memory_valid(addr, nr, false);
 }
=20
 #ifdef CONFIG_DEBUG_PAGEALLOC
--=20
2.54.0.1136.gdb2ca164c4-goog


