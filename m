Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1564FC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkCM63s99i91p1PpHDumOCyyQdfuhx7OwD6Jd3t1Lq4=; b=hI0E7O9v35acGxaAFEj8JTgQzx
	IgZZmNpwVCUiT8aMTnqFukXzl/QCDWSDvQEe/GElOYrW3rB0bEFNQu8Mb6NrOeSFSEr7b0SJkqu7V
	o/j5rg5vhUzdeDP5RohZa29D2HtqVIWUMwn2rddwvxgCHa3NTiNYi9FkcFQmwD6m4AWQqGhLhELjr
	e8E2VdnFerPOxBaA7mOnu2A+slg3xnEX2nqAgzOS+tvxW/MUFojtF5zFTYN0mVlywLudX4/2yjayh
	38TsoA6s3sEznnl/YDjkS4l4vcr+jDsCP2smoo9D9TfpRPsRimcVdyjuTjYu5wGdtvC28sebgAcR4
	uxsI20ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAn-0000000EYcN-0AdS;
	Sat, 22 Aug 2026 13:54:13 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAh-0000000EYZD-3eeJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:09 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-499900c9d99so14428005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406845; x=1788011645; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkCM63s99i91p1PpHDumOCyyQdfuhx7OwD6Jd3t1Lq4=;
        b=GLWYumxATmUuWZ8t1T9kYEW7lL7FZwRL+iXiG0rv1/oaUcZzivdkxUFMVf/cQKD5ln
         /M0nBwlqFnErPp/3HOwfFCUfQauuuGF6Fqjg0sRljo1fBvAiyB82v+Qw61rUajfeoX/X
         xK0ODYzh/7IsdVeQmCUrmJWeRIpQiaUKTCZg1UhTel5tfi8AcVYyEs9PiQ5OoFliPVum
         QWjNckPteJdQIh8fSPU5In0tJhNzOkjEYUVS/aLFVWmFdRFBV4pGXwwAHeX1aTFbI5C5
         JgBeLsJaHqpChBt+PhCwp5+T3ih9cDWDOav3KE5YuWzaGO/I+/6fpNk2i8oIuGdBcUkk
         Joww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406845; x=1788011645;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkCM63s99i91p1PpHDumOCyyQdfuhx7OwD6Jd3t1Lq4=;
        b=AuPAx6DrNnXiZQTTbZqPBPqmgl5TtCtU+gzgY8jkeyNEim5UF+3bGC3r50vyAoTvl5
         U/NTjePoec75tOd7pBjSBdfi1mup9K0sv7Ql1KnM7OeG3id1runnhcT92jMlzbUmM9hv
         //RwuDhqZxMuE9647STXZHtn0uEfgPcrQhbIJkY1k1Vd9f0UNl6HlyyeKhu05SJVLmkC
         1aVquF5eRIjWmYPR0fQOmT/lNiJiaiDHMdqqX0uetvg4rMhiWmfu8Fys/ze3hyFzoFcq
         Z0Y700fYLdB4Sm5h4EBC8DU0RBRekrI+HhFv2StAeRJriA7LCujJJUOEnSOAODwXpxLU
         oi0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro1xQwymSk35ItzQcohvb8h9/UiPNdm+7lrd/hgAlhvJC9zuINrmGHdRvuDjEXL7T5/AUdijrH0fNfm3iDVWsLx@lists.infradead.org
X-Gm-Message-State: AFuF++kDJvWxlQCoxtA8D3UAkZsadweQ4tTiyud3a2xFv9Z+/uT5A29m
	htdN/IZ6koT8eM0gDB6mWE61qQBG/Jr4HKEIq6tBLgIbCDw+5fU8JyiZUVS7hG424IQ2ZZfQfw=
	=
X-Received: from wmsk20-n1.prod.google.com ([2002:a05:600d:8494:10b0:495:5b3d:ed8e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f87:b0:499:5a50:b022
 with SMTP id 5b1f17b1804b1-499b830d220mr157713495e9.3.1787406845321; Sat, 22
 Aug 2026 06:54:05 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:24 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777; i=ardb@kernel.org;
 h=from:subject; bh=P7ZGJgEcYK0LKyyPgb8fkUAxKeezm6n7kbgZPbKu2yU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5TWxr2KyTbZTbOpLO1+U67/Xi9h1eWvb4iPcl4w+S
 bRJZ7V0lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIms3cbwv5ahahdT+LH2cO82
 t1yDecoKnrvaJgjtU5h+/th0FT1bD4Z/Wub5/n96de+wmHSaPL+t1b4gf0nC0eXNz1JN5Yqla1c yAgA=
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-13-ardb+git@google.com>
Subject: [RFC PATCH 2/9] mm: execmem: Allow huge vmappings to be avoided for
 execmem caches
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065407_937232_F44E1DEB 
X-CRM114-Status: GOOD (  13.86  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Only recent arm64 systems are guaranteed to be able to manipulate the
permissions on live kernel mappings that may use huge mappings. Older
ones can only do so on live mappings that are mapped down to pages.

In order to make execmem caches work on arm64 despite this distinction,
allow huge vmappings to be omitted when allocating the caches.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/execmem.h | 2 ++
 mm/execmem.c            | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 59bd862cb061..b04926f3fff2 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -48,10 +48,12 @@ enum execmem_type {
  * enum execmem_range_flags - options for executable memory allocations
  * @EXECMEM_KASAN_SHADOW:	allocate kasan shadow
  * @EXECMEM_ROX_CACHE:		allocations should use ROX cache of huge pages
+ * @EXECMEM_NO_HUGE_VMAP:	cache allocations must avoid huge vmappings
  */
 enum execmem_range_flags {
 	EXECMEM_KASAN_SHADOW	= (1 << 0),
 	EXECMEM_ROX_CACHE	= (1 << 1),
+	EXECMEM_NO_HUGE_VMAP	= (1 << 2),
 };
 
 #ifdef CONFIG_ARCH_HAS_EXECMEM_ROX
diff --git a/mm/execmem.c b/mm/execmem.c
index 6db0c1d82a9d..5790d4a8532a 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -276,7 +276,8 @@ static void *__execmem_cache_alloc(struct execmem_range *range, size_t size)
 
 static void *execmem_cache_populate_alloc(struct execmem_range *range, size_t size)
 {
-	unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
+	unsigned long vm_flags = (range->flags & EXECMEM_NO_HUGE_VMAP)
+						? 0 : VM_ALLOW_HUGE_VMAP;
 	struct mutex *mutex = &execmem_cache.mutex;
 	struct vm_struct *vm;
 	size_t alloc_size;
-- 
2.55.0.860.g4b6b3295ed-goog


