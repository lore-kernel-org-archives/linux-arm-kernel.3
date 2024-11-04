Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F4CD132CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRaBXKWmHCm6FdE1Chl6Fbm7Oz0LIxurr/17hTAqXWI=; b=z1m1z79MkU5GkJl7oZMQR6WLsR
	uROph6f5fpkanEwvP0obqpnUE2vdelR2iY4gMruK0Y90djTzpKICFg3VY09wyXSlK/xCCharfYkNV
	NbuT0nGvtxUUBioLW9LEu5lLiTtvvJU6DC5Rt868TNeGy9/n7BKPBcQs6SHxl/YhXyi/T9hA0d9u+
	CnIIcle4fPKNl75JZQ2z0MB+ODvEUqhaU+JBqKQN3nbcUakqkOzg2WPrumLAOoxR8uMkHSqYMEdwH
	pOPD0xgSie80xYvbAXMGVkPxaWRVyAEfLy1zvpyAQrNFd4gVHTis1qoUEJ/MYCTVqDoqcre9gJ9t/
	teWchj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xVX-0000000DwYy-3YbJ;
	Mon, 04 Nov 2024 13:52:39 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBy-0000000DsL4-0cJb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:27 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2904d0cad0so7677488276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727145; x=1731331945; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRaBXKWmHCm6FdE1Chl6Fbm7Oz0LIxurr/17hTAqXWI=;
        b=viVNwvi2teHJ4DHi3I9XuAoiKzggv8eMgv6GOybtaoj7U98+6NBT+/lkwnrtMDQ4mI
         Xxo4uBz8n05sCmxhR2YbzXRT90G2c2ht/vtt5n6vaFY6Cy1uo9i8TpeKWwu3O3gLnQNs
         eZk6bZ8qletynPQthENCoQX6HoMBOOEW/i72orP7r5eMeaaVYrfYykMrBiDzwcAzXfb9
         f5WUkKTPX81ekaGOCoh8ST+MrHdwYMROARQc/71aSiiEBMOjEjxoz5xu5TzhPpF8ZJZt
         EGLe6u6tqqbI2zkPBpLZADQnnfgwE9ZGOftIAwNWAynY8bjv0lSxJdMzKObl/j4WmkeZ
         RfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727145; x=1731331945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRaBXKWmHCm6FdE1Chl6Fbm7Oz0LIxurr/17hTAqXWI=;
        b=G2R0Juxf/wECqXesL6jiBXLa3p74zi26j7CC6UyprZ5zE9Y8u9sFSNU8ohLbJG5rCW
         I2/F1RK+TdU2RwvIsNPHxk6CPorXpssXIxmHnhF3YhyBaEiyoXfl1pANyWKjvHFDET1e
         QAJRkFADibHjocBP0V4mP3IEF9JrFRgWGfnpHj2AyXjONbIeQZpSKaf/lKvBiTdiw6IN
         vr4I86/UXd7SWC0s83RdYrWvH/wI55P5aJV1nr6Kuu4HYDQUilO8dRg4hXSSDNXQ3CWB
         2JwrGbkEIAziR1CBf2r3mk3lrCQMqUK2u3KC8oCLfbl2k6ldydiEKCCJTRnVRkr7T3vM
         21iA==
X-Forwarded-Encrypted: i=1; AJvYcCVrKkb5Vi6rfALifBqovepeZYYi/dj/S9YV+nmNwsnbx+3SSSfyLRid+rU5QlxA1KXc9wb4P+i6YOXYxNL5XF/B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5N1//G6caodnCq9JOFTeKPP3ZwI8RADjbEFXnjE/zDkXxFsH3
	HpDPDwUkhslql++ahRIrL9raQBX6805s+kovMhCasZBnayhTp8T7tIIjV65oNgWAnbHvPGXPfW5
	bQ/l7sA==
X-Google-Smtp-Source: AGHT+IEIRmWbJCJ91gChrscm24F1xHepSdW9Ht8okQQnwSOPBLJd4Dm+SGDL7D1GGWqTGSqt9NEIHueAq4mp
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a25:aa05:0:b0:e25:d46a:a6b6 with SMTP id
 3f1490d57ef6-e330266859dmr11233276.8.1730727145034; Mon, 04 Nov 2024 05:32:25
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:53 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-8-qperret@google.com>
Subject: [PATCH 07/18] KVM: arm64: Make kvm_pgtable_stage2_init() a static
 inline function
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053226_225241_35C15C54 
X-CRM114-Status: GOOD (  10.72  )
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

Turn kvm_pgtable_stage2_init() into a static inline function instead of
a macro. This will allow the usage of typeof() on it later on.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index f52fa8158ce6..047e1c06ae4c 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -526,8 +526,11 @@ int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			      enum kvm_pgtable_stage2_flags flags,
 			      kvm_pgtable_force_pte_cb_t force_pte_cb);
 
-#define kvm_pgtable_stage2_init(pgt, mmu, mm_ops) \
-	__kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL)
+static inline int kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
+					  struct kvm_pgtable_mm_ops *mm_ops)
+{
+	return __kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL);
+}
 
 /**
  * kvm_pgtable_stage2_destroy() - Destroy an unused guest stage-2 page-table.
-- 
2.47.0.163.g1226f6d8fa-goog


