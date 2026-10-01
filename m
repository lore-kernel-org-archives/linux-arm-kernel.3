Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60E6CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXdW3KLWBNEvOd9ZzhOaPRcErPR/vT/YK+xCwxPIfYM=; b=vOSKUWzg0AyDtdBcXCnTXk/RW7
	MT69G23Ez1KWn0SMOpVdfRjH8Kn8DfpyU/zJPBJ+Bd7oF/wNORJcw8h1TkEdwBvuW0kcusyTaiAc1
	9HArAVU86mUqk4Ioy6Oi5CMTLsonYxAUt14hAnlZM9sT1eF2+GQNitgo2y30EvzyNDDFG4It265O2
	tNrIy45ffGbKI9OZKImO0D8T6aiObiXC8F9QV4ZMVblBYAgbzp5TwdkuwcGosy+u3/sPDHcaVnoIK
	/2kICNeeobDvyiSTvhu1LN5ein/qCYV8MZCS7gI9P88jLmj9XGOtTwfmVKIRORG8ZF1sW9evG9sBm
	08FyrqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmQ-00000009N7b-0lrt;
	Thu, 01 Oct 2026 14:29:02 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmN-00000009N5l-3Gn5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:00 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a0185655deso15393045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864938; x=1791469738; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXdW3KLWBNEvOd9ZzhOaPRcErPR/vT/YK+xCwxPIfYM=;
        b=Fw7LOXYjmU2gWcp8BQg930IoZ5hfFGEjCNuqwl7i+h4JATMCVvRRt+B9+R5DibD6jv
         AxRVRkLQHGrOFipl+6G5PgPTX71VpYygJIFtau3AXcHPMJBGMkklifWIz/yPviphDdH1
         kz850M5QrELMqSlykl51YzlHsuTJ7eM8QWl84K9zOHADc0CfPIbQiisUGPCZWDDam6bd
         98fO9HhfsM5O5sb39b/pYaWSNwiG6zqeqO97y1g/fMFDZHWitMS41zFx/NpqBBkmIYyV
         tODJm5Cn/nDdVePwRgB5FSwdvORgmk1O9KvoypYZvWqx+NlR+KEPSOLTpwAEnlzIdFCe
         4Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864938; x=1791469738;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXdW3KLWBNEvOd9ZzhOaPRcErPR/vT/YK+xCwxPIfYM=;
        b=TwgofpDc6Ihq899Ifn7BTMMsLI9OvwIdTrFSLE3frbabzkCmkRXq8rzhytaFjQ6EI9
         2wNpn93iDucVghbV7V9VwPMe2g/PMkN7Y+aWE9FhHp2vybHD0+LlIGMGZfIzMo+7zcXl
         ttGattl//C08pumGllJzrLY04r0W12IlFwnghXs/x+NOlo1V15Y5BlO5swqJ4+V7AK86
         WMh0N72bOUTFC7ZeawSPxWtpc46bdnj2M5kAtOrk7mFXHZZVTQVAwB3pMpigrdy+UWUy
         LrXS/RsAA4kB/2HORF0A65EImigHpMfIiSYMTAu/QwAOCwRpRegvEDKNmXnAoDyW+Rc2
         gjzw==
X-Forwarded-Encrypted: i=1; AKwUvBw4UiPUMbFDc+4+Xx7rwtESpBfQzcgm7g0uNNHhmxQqOy2sBS1BQuvF7ahx7XircppKa+efM3kmfDdYDPWN9Qq0@lists.infradead.org
X-Gm-Message-State: AFuF++nhlSwrxM9LZ0ykpGhiw1NEtnEZIRvZ4hmoT9AZu85xHYx5gD5w
	ysM6Fi1yjJ5osq7Ti57VUjjcF7Y2nzdIGe6gwVahEo3N7gUlreYixAJ879uG7XJyBHLKQbaggpQ
	UaQ23C6BgaQs/c4JejD6r+g==
X-Received: from wmlm13.prod.google.com ([2002:a7b:ca4d:0:b0:49f:e41d:3d75])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c490:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-4a01b12d914mr82599505e9.34.1790864937470;
 Thu, 01 Oct 2026 07:28:57 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:33 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-3-vdonnefort@google.com>
Subject: [PATCH v6 02/18] KVM: arm64: Add pkvm_remove_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072859_832734_B343C7DC 
X-CRM114-Status: GOOD (  11.36  )
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

Add the counterpart to pkvm_create_mappings(), allowing previously
mapped ranges to be removed. This will be useful for the upcoming pKVM
heap allocator to manage its private mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/mm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mm.c         | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 85f1e3c711d9..00cadd13ee5d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -25,6 +25,7 @@ int hyp_back_vmemmap(phys_addr_t back);
 int pkvm_cpu_set_vector(enum arm64_hyp_spectre_vector slot);
 int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
 int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot);
+void pkvm_remove_mappings(void *from, void *to);
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr);
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 755630c0d15e..9ab7f613fa36 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -164,6 +164,24 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	return ret;
 }
 
+/**
+ * pkvm_remove_mappings - Remove mappings from the hypervisor page-table
+ * @from:	The starting virtual address of the range to remove
+ * @to:		The ending virtual address of the range to remove
+ */
+void pkvm_remove_mappings(void *from, void *to)
+{
+	u64 size;
+
+	WARN_ON(from > to);
+	to = PTR_ALIGN(to, PAGE_SIZE);
+	from = PTR_ALIGN_DOWN(from, PAGE_SIZE);
+	size = (u64)to - (u64)from;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)from, size) != size);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


