Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE51C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wO7rgHUMjvOOREbomqim3hRFXtwbnBvZKsCnDiin3lw=; b=jrsENBNDNMvtOBHioBGvzSk2aw
	2TlDkF/jb40b7CS9OLRNpelrCWurrjpZak54h+M+iXMLOjx5aOkCCfPsF0dfstHqwZjM0amcy1dxd
	J/qMZ5wUk9OoL5Qt5CDDZZQ+vfj3NB61agdBHujhIV5MNIaw0yctGuK+svNnIMnkpuiUG+wNDIc5s
	llCcRHGx8epGPtaJPS1Wz5oS2sVN9TM3DtMV7H5HJcQEJqrSlv7zSJASIkqMqasWE77EmfbardYLQ
	ucNK7kpGJ4vrgAwpysvzVyj18iqvw2SjGV3Z9Q0hR4C9nnZRiEwYpn6NMJcmas97oYAUTtO9aq91w
	3TQE5cmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRY-0000000HJ4D-2L8E;
	Thu, 16 Jul 2026 12:44:00 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRU-0000000HIwQ-15o3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:43:58 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so4856431a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205835; x=1784810635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO7rgHUMjvOOREbomqim3hRFXtwbnBvZKsCnDiin3lw=;
        b=GG4rnxIudgMhaFvwjZN6dyoWgmgwTUiDZcbBpCKKgfAaNN19d6K3A04gIrdqnrepee
         hRpw1YDLCZFXQp7zs290LCz/bNEaEuWLUu6oTz9zCgXZzbl9lXI6N7cxSQHoeZzrZYhx
         pzPegydmB2JdPXwhEhmp5/uXrgsN+VvjRVDWZy5i+Wtza+GN5ZV8k5C7Hcv0pIqYsJ3z
         TKjbFkI3UPy95Mj3IAJZwtwitPrC2QeO/B56t336GtqJ1AQ9aYEpTJjBP95NJuHaCVPw
         XoKxz5lC5oQaWTDClVBMtDril6aqjsHo61+q5YmEkrHClB88ruXgqdxHM1VqGkOzBm3N
         egeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205835; x=1784810635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wO7rgHUMjvOOREbomqim3hRFXtwbnBvZKsCnDiin3lw=;
        b=HvlMKMO8y07Tl5hn+RBzLdqUtvZT2e2XQhgA0OVntEZiK4QKjidQy3fqQEvuWVHq1O
         3f7LkQnJmD0Z2wBfOPV/f05tQcpg8IkPtqD/IdX8GrpoK6Sk/y8I45N4mXw2EJjoyknu
         GHj1wlAo699oQGAzGMZuQHGvEFWQmUKAeYNF6HEpjDitDSp0g2In0FsTqZGqoKBPa1v+
         JiMTpbaeDPvgWBAkgMgQDHRTnxYfDoOcJqOIxAVZ35wZT98Enl5WWnNiFdsIF6Hnxd6J
         ahzMwvsZqyeA8rJI28cwcJTh6QvslHOJ10ZwgJxN/SM2wRGuZLkrHFO0p5f5UQG5BnVm
         eHDA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2yOlhnDW/hqJkZCnudOc9BHqq/44a748+8xcLVh/9b16k6hrZsEp/79wuGdqjrjMaf8i/b3U97MRudNZbguty@lists.infradead.org
X-Gm-Message-State: AOJu0YxrgiiOz8zT1+++xdF7t/DL6RtBejE135A0rBdBRLQ4QjmMHwqq
	QMQXK5PcsjwRd/DsGYO2+DFWlI6HrOPUho6b5Foua94jtPBsW2PXUnw/lq25yrIWIYc=
X-Gm-Gg: AfdE7cm+9DbgtyrK2IzWrHjlnrrfJr2GYaM3i5wo3IQEz4wTJMQNiq6fa+w9Wyry/CB
	dxVIaqTHBC5SubSWAVU65DC2oJ3KqMJiomskSMSmi/DWaJ7+WDTRQIaChLLVUhGLT8rXkXYAOAD
	pS1NITcFJPdLYTRbrc92OWm0my5+NW4tOBASgXxO6rVJhY4arIqPgZgSe5dEcNFcNRy3xfNUKuE
	7oz63LF8XzMRmv1AJlbJRZDikkZo1+SP1D9EP6jcTm5nk+4SroMnMI7fjsXQz6cKLbB2rwoHUoX
	iwJeECw8jRHCjXIfWY8Fcy4DqHlRo2a4Vm2euHWqavLDQiW/82E3aoqhvi+6mVu8T0VW8z5knKp
	BCiTKMKMpl0NIhq5qhLlsg+WI9rAmPlksGB72praqcPt2WK6rBPvp5gb/xDzM5p2QVkVc/YPbL4
	tQUusSeDuV/aWKul5zZAFD7z6WbKvR4AviGQ==
X-Received: by 2002:a05:6a20:20c3:b0:3c3:859b:c20c with SMTP id adf61e73a8af0-3c3859be277mr3653741637.15.1784205835267;
        Thu, 16 Jul 2026 05:43:55 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:43:54 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 08/15] riscv/mm: avoid redundant Svnapot A/D aggregation
Date: Thu, 16 Jul 2026 20:41:43 +0800
Message-Id: <66e43057442a0f37e0c7348016ccef382387898d.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054356_349362_76626A0A 
X-CRM114-Status: GOOD (  13.40  )
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

Svnapot mappings encode a 64KB range as a NAPOT PTE block, while the
public getter returns a logical base-page PTE. To preserve that PTE view,
the getter folds accessed and dirty information from the whole NAPOT block
into the returned PTE.

This aggregation is an OR-style operation. Once the returned PTE has both
accessed and dirty state set, later entries in the block cannot change the
result. Avoid reading the rest of the block in that case.

The lockless getter still validates each entry before consuming its A/D
state, so it preserves the self-consistent range requirement while also
avoiding reads that cannot affect the returned PTE.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/contpte.c | 60 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 9ffdffdc2b0c0..70f9a0668b50c 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -309,10 +309,34 @@ pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 		cur = READ_ONCE(start[i]);
 		if (!napotpte_is_consistent(cur, orig_pte))
 			return napotpte_subpte(ptep, orig_pte);
-		if (pte_dirty(cur))
+		if (pte_dirty(cur)) {
 			pte = riscv_pte_mkhwdirty(pte);
-		if (pte_young(cur))
+			for (; i < nr; i++) {
+				cur = READ_ONCE(start[i]);
+				if (!napotpte_is_consistent(cur, orig_pte))
+					return napotpte_subpte(ptep, orig_pte);
+				if (pte_young(cur)) {
+					pte = pte_mkyoung(pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(cur)) {
 			pte = pte_mkyoung(pte);
+			i++;
+			for (; i < nr; i++) {
+				cur = READ_ONCE(start[i]);
+				if (!napotpte_is_consistent(cur, orig_pte))
+					return napotpte_subpte(ptep, orig_pte);
+				if (pte_dirty(cur)) {
+					pte = riscv_pte_mkhwdirty(pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return napotpte_subpte(ptep, pte);
@@ -343,11 +367,39 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 		if (!napotpte_is_consistent(pte, orig_pte))
 			goto retry;
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = riscv_pte_mkhwdirty(orig_pte);
+			for (; i < nr; i++, ptep++) {
+				pte = READ_ONCE(*ptep);
+
+				if (!napotpte_is_consistent(pte, orig_pte))
+					goto retry;
 
-		if (pte_young(pte))
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			for (; i < nr; i++, ptep++) {
+				pte = READ_ONCE(*ptep);
+
+				if (!napotpte_is_consistent(pte, orig_pte))
+					goto retry;
+
+				if (pte_dirty(pte)) {
+					orig_pte = riscv_pte_mkhwdirty(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return napotpte_subpte(orig_ptep, orig_pte);
-- 
2.39.5


