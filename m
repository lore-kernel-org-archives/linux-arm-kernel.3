Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88788C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLJDwfik8v5sXhgfZiByNmP7K0w0uZHSBWxfXEf9m1M=; b=iz3u5x3XaCFxSikU0t2FrNswkN
	LbLgFule20G6aWq1tjXZMP/41vUU82aO5JFHTi25i8mbrkzNYdQSGPn5DgXpn2VhMVcsC9ptzShoY
	e0iBSiWVA3a0BRaZux3ASPiHrf/UglX3a6/Y6/u+0ldpXn88m/LSuW1aRQMmob3Uw7ELVeODtnj9z
	CKrKahQMPRh8GrkYo77FpGNOTHrtKa5iU/l2inH9GKyP8U01P+wbrjC98nKsIv7M2QGhMivtvtpgv
	dhQ0J6KAJo9+SUxlWRD9NiTxsBxvMLA/IgYhT9JYR76Qec74SvnrP2Tug8l9+yiBObg2YpM6CtqoT
	Mut+aOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GU5-00000007Heg-0Q3K;
	Wed, 23 Sep 2026 06:29:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTv-00000007HYH-32lv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2caced6038eso4079015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144967; x=1790749767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLJDwfik8v5sXhgfZiByNmP7K0w0uZHSBWxfXEf9m1M=;
        b=dwo5AZNoxNFLaUxJK+v0E16LV84uWSqrTMY8qbaoZ4HkK6fXZ7TOv5nO7XSKAxj8t9
         EpGVfmf6ccDSQekwx28wZxJoyXqDZEeYrb1WOtTrC+aYH0qOgbki09hSwpQKMFZtTXQL
         FoobAz4RR9tWmQpA2dfshrc1B8DJDMtIOKyjtCMNB8Db6NJhDIivk5wu6GxZ5EexhD5P
         AhPNJ7IyCd4bX8Vrdx0oCUlrMoxfGDPARcQNORurjsSHc3Vc+M7aH/3J+4JM2i+fVOk5
         s0pXQPifJeEgkUJuiTVyT9P2odH3dn9tApCAm8aYlI1uwnZ9G98KdfURqLx8MPRoyci5
         8ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144967; x=1790749767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLJDwfik8v5sXhgfZiByNmP7K0w0uZHSBWxfXEf9m1M=;
        b=dw7imbbk9TDV2Gwv8Aq6KVCr+U3bJm47dl8/zkZOu2rhOmQQqIiKeuz+X+UJEL926o
         ci7lhQ7eM5oWJUTe09cg6XzdnTmkY1SD7QRN7XALTFATcGKzNJBa7WQeQL3+YTeKOYD8
         dRlqsUMKJpaTzSfC+mtU2jFSO9DIO9d/biwgalgbl09cWrJbZDwbf8h4cbN8hoEpJjqR
         lKtvJ6CLamFasmWDAXO/eA4KzNVP6571zhrMhMv6h8JpmWz+no6L+vqyd9OsTUF1ZfAQ
         dliMS4yeV74B3CIzWzv/E+F1MHLMXZhFF2zseN1XpPiVSkidSyQaKJ8FCRnpKnyIO1tv
         GIfw==
X-Forwarded-Encrypted: i=1; AKwUvByBx/46vugn9y3JZKnYUl97FM56ioxOxwxjBiF7Z9771Rd1DOGHAMv9GGBVZatzcjSliUTe5U9MblfoRnqYW5Wu@lists.infradead.org
X-Gm-Message-State: AFuF++kpWkaenqTxAoUFVrMs7YjyfhdwASVd1IkgZSrtpx4f+zltV5pS
	g/Y3f2Zm+xrsjq//jYDbM4o/65LcClRPm+wKVVuhasV3lCXLT47g3LpL
X-Gm-Gg: AYBFou1pzY+Xy+73uh2SY6SIuNikND+sRx0MT0UXSfQvpfUtro/SDSFi+wXt1bZEmPK
	rogLlVKGwL/uRXrTaK2LBY0NU0RpSPahiY4fuTwXYKKlPIm0KwG4PNfRfOB9brTgIcq6132ZEfr
	ODerwdV17zFC6w3ykf007d0d9L9Vehimxvo9SyfaKuk31C3AWgbaZ2+1yJWxXO1hyYZVv9TCMBI
	e60aicddWIjIQOc0ymPOkuNQrtWrvjTVn+vcmh8gW7rbD+Eb204bVT+5JZlE/T+enzkOLM/0XgQ
	JwVt3lSlslsh5LdQ0Vc9XP70ui1HBCfnGJM9sOkup0To/IqH2KbfDM2z5SuRm0uhkSboQWxeOg+
	L/9tpxSqaOy5EFKTM77O+jFNhxwwDb6o3VZnHTU1eTd7I4w2kFpbJA4nBTH1fkbVVx+kteNi52s
	iBHnyn7OvTpH12r7wpEQBYJ4lVhBypoINkxdfrN9osoN0DBOm9kfB7jgdllKOnsrOpnw02rgyiq
	OdEmzUKWUrGW+IxO25Bug==
X-Received: by 2002:a17:903:3c2c:b0:2d7:1cbd:9ceb with SMTP id d9443c01a7336-2df60aee398mr25552315ad.12.1790144966712;
        Tue, 22 Sep 2026 23:29:26 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:26 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v9 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Wed, 23 Sep 2026 14:28:30 +0800
Message-Id: <20260923062832.479455-9-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232927_778747_8CF9F09A 
X-CRM114-Status: GOOD (  10.86  )
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

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6e0dec73107a7..a43965016eb4d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3568,6 +3568,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -4079,11 +4087,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}
 
-- 
2.34.1


