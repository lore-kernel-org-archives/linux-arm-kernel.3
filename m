Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D456C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzaNd9dh5gQiSMMbEDA26vNGMF5WFO7Tl8lfuiT6OXc=; b=njmAT/zKEZfj1d5AYFXrZ3iaRJ
	nG0WZoQv2xZAvXO02W1vlgWJBQhpbl94ti4qmsdKMKN5MzO/YhrIrsaqYVgwsZmq5upjpgzMdQLDE
	A7i6FvkaxqJKcYHOtZr8MsH/ZLWg4meK09mJvZP2nnxj3M0r9FSMFa6iQSOvdqmN+L02fgFoJIKWd
	LtSnSymB+LfMiaDdSkBtPrfJrj/3rIpM4VH8oyNVTmzBFibKwP74zhwK8p1OVCNiwUSebBGv7hGAD
	R4bMBCya7myHhkq9mpmW1VRESQSZrgnbGFRyom+kDg99VHelEUXqZfhz2fABbXwt7a/5VugDIy8cx
	1nNP/eqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hn-0000000AbR7-0V5q;
	Thu, 17 Sep 2026 05:30:43 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hj-0000000AbOR-0g5H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:40 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso288319a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623038; x=1790227838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzaNd9dh5gQiSMMbEDA26vNGMF5WFO7Tl8lfuiT6OXc=;
        b=M93MnC07avLd9ShauR+ihRAV827+p2OJOQdxhI9tWtY677Cz68bWWr7SOgTsMfk4TB
         gda/mUaRQDm8ng8qWqSjV6BtdaDWvq53GkBMOVPkwGp+yohiSzMTDX7VwioTIjxLytZl
         8myVkYoZaTlgFUTXrLjL24we4WSz1cAArQm7+HvUnyL8lnJy+s+2OpnTrKVJVk13yGmR
         VOaQ4+0dh0CsknirRrEZ8bv4y2lne6Hmr8a+3ZEdgSvJvUIPQcE1t5DMA5aQD4ExQ2dK
         3DQrIMt8/1SUEEKHp65qggXx+Ifd/3RqVebxjohdOT7cUSK1gAkTFh5DF9BAeDDFjYez
         ZrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623038; x=1790227838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzaNd9dh5gQiSMMbEDA26vNGMF5WFO7Tl8lfuiT6OXc=;
        b=tVyPGzev6lzPPWj2CtSmW4cN5acP+siYMY2m3aemOj6MIOy9i/2olJ/d0XbxI+P5ql
         Dk40wstKUIE+1rd2RFv24nqI43Qim4XSsORTMI2VlNW8Svud48noMlZF/+IvBIvIE2dp
         486o1uEPxVWnlwUl6I6cWCguMtvnp2oIox96aoQ2xw7EUaZzFwGksU2JlU2ZCwoa2T0a
         pXXfa4WrFdZZdKvLrhxwyP3Zoyn3sGpSJGNQrkmfacyuM0xJlflo9UUX1cCqKZU3dtE7
         oyw1Fcnzm8dozeJDgPV61MEpLDzVmac8kK4g70lMOZgsW870Eej1Om9JMAgJpfhuvCNG
         9FIg==
X-Forwarded-Encrypted: i=1; AKwUvBz/K9p2+i396Ze2P74IaHa2iVvjPNkmbc0jYP48DO2dZelKEiIIXHJZgqidsRuVGBofL4X0buPMomuizf85F+r1@lists.infradead.org
X-Gm-Message-State: AFuF++n+8h7SlLRhMe5MjaR3D7/2n9CM+JHgQP6GjZxMRYcAuyg6r6I+
	t87TOPc9vF8MkuRqNeVXxb1avNwn/zb19eVU5hac4VLtbUnhyXB3r5Dm
X-Gm-Gg: AYBFou1NlzhI96eLq8WStuFhfQSsyXnsZdsELqpymKtRC6wClsfSWpQ0JxZsNtEfLE3
	ea2EG185PF1uZ4UudZTMtJ+QdOQHt2szftOWzR5qIW9H9EyCnHKO0/q2S5+rMEfUGFjuKI8w7tp
	B6ZcoOje2c11ih7D377y1wbA4i+72pMc/MTnMXWNbtkaw6gY31qmGFmkerWxRXbrsaw4MvdgPs2
	R7wECOVlILBCQqnQDdedoSoV1V+f6FKJnJk4si3m7TF0d6Rf3XVdFC7ZRDWpcorngGDOGy0tR7H
	dYzCnmCqrrWnqF0P4i7lTmhrhPFQvW6rkoMHMvp7Spd3RPkp0aAleLyG66lmT5rz4oVRkApnCYH
	ziEqENmCtiIU6f7US/PhcdJyK4AqzRMyCbt0nv8NcVa7gz6PB+Di7n0FNecuzccQejs4nlVdDQo
	W/rc/0ceK6bwb4UNy2OFM7/dt03EyJFbkSYBtJcqFvJ7HrPLWuuFnAAyfdclkpi+F7hA7jh4m/x
	1kxLV0Q4MW26226hHP1Sokvndc=
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr16057715a91.6.1789623038178;
        Wed, 16 Sep 2026 22:30:38 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:37 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Thu, 17 Sep 2026 13:29:31 +0800
Message-Id: <20260917052933.188679-9-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223039_210876_E7EDE4E9 
X-CRM114-Status: GOOD (  10.29  )
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

From: Wen Jiang <jiangwen6@xiaomi.com>

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
index cf1daf931a6f6..ed868afd8194d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3532,6 +3532,14 @@ void vunmap(const void *addr)
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
@@ -4039,11 +4047,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
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


