Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D450CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBWRMN6X3w3vTrUF8QjNUM8q/tVPNzKCX5eXLQ+Uu38=; b=SaBkgRC7ejUGhZo3e+WxygkDs4
	tFZpgFpDGX/7PEMdRT2c2+cZcXUG0va/bRMFZ+XF+8/vF0HyCFZjyDyPOIPJRdXSY0bYizkOx1rrp
	MP7KEZ+4eXs9GwOWZQpvPsLH+XhCKSUuRKGlHbLUk1YSVXQn8+vHMz7vWFT4cHorogNko8vLVutj5
	6TJQRkN51+jivezMDJ5fBzsWyQTWzVbqLIPCpceKiYljqMe4HvfP8ev/ZMJdAg2wqCvWSUWO8lhA2
	dZB1mZzheLR8nNtc78ru2J03xNN78t8REwqFf+fgQsJa/5WEdru6aOK6xWR5BZmGpBP2E6f1AvQD8
	xOY3zYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQX-00000006F32-0d12;
	Fri, 17 Oct 2025 00:34:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPT-00000006DRy-2SFz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WBWRMN6X3w3vTrUF8QjNUM8q/tVPNzKCX5eXLQ+Uu38=; b=fhLxZYev8G1f+n9WmMZX/V75HK
	IUelcdWdEpP2VQZ/oRyFVw3etWWXPDoZtOp4SanzyQaOUdKWAYnOeSi5t5rGJdeKTXVVfKBed+xrk
	uzLsDTsv2ibnT77nD0CsGOZ3maENVu2hplekfkqOWshkVDn0ccElcZYQJOMjAgrc9CFm0DQ/Ur3jy
	liZNUQHMa7g2nYXgVGmEo5Pygmii6nCakecmL8FffuCZ3csRO3Z3AWleiMcMsgqREOs2IcpI+rG76
	H/oHlBFDKOGvSAkcIVB+o/f+EYPVwhQkkIZSTuJ2IO1fDM4vgJ3E0t8sLOIj+gpDPs5dKT3V8MUCD
	29gE2OqQ==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPO-0000000FiB3-0Tic
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:29 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33baef12edaso1233412a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661196; x=1761265996; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WBWRMN6X3w3vTrUF8QjNUM8q/tVPNzKCX5eXLQ+Uu38=;
        b=EJVCo06tnO+whKZkT3gHcJw1k3BxRuJpcUZftBWqFLiiW6L+ZYbr6LlRtQgFNI2Y6H
         TSMrOzyijaX0bMiZ5iba0F/zHShVTYSzSr+NkJbnTDF7t4G6ogOlAcYuWLNYq4j7On/h
         09UmfQhZQs0X+YTqObvX5r84CtnwA7ChzvqVAhLvvFTJm7Uxa215lLZsDZ3mdFn4ssHF
         iiEFAcwtx5f1Ai20zwffgqkq9r3Heck9XKNaG4/rmn11g1yesHNxETX/qw/xNSKdWuyv
         v91zMONO7XeGwO16lmieOwTuStnbkLS6ejlC70eO1SCOqeWGRyjKeRZeOO2MYn6JMNET
         4kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661196; x=1761265996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBWRMN6X3w3vTrUF8QjNUM8q/tVPNzKCX5eXLQ+Uu38=;
        b=gl7kiCDYVAEWQ3oe0DCQCnfArLFfvshjI5I+Bq8lgYbaT7FnFlnb8Yu2mvku6BmVcK
         YnNTnMxfPTZEx92B6rvZADwVcDPRburZHV2eZgim0XoKPvnOnysFTSIx/thrPxGe8Q9q
         0C9YrPNZjKikRJPp2a80kr8zQea8Wfdvtd9p9PfwiU6D2swKfX8Bu+qHfekND0A+29sM
         hxqE/x2JNM4pAMtN6Fk1mnWRmVYImuaQunnqBKchtV4duKRNWN4S3Yr7DjQgPtOq6PzH
         p8A8nKfZAXcdgpJ0iKXjPlc4uOs176MLENMvELfX2/Oi+9Yp8Bz6Q4am6zzOR3EI3eOb
         6cNA==
X-Gm-Message-State: AOJu0Yxf5lI/+7xVdaMWtu5tnQ5ynHf10ZkDckc5024aOGS7ZqN3N3i3
	YmYtD2M58fBsCe5wHQaiCjr1EEIwhzSwL8ZxWMgvOESAuaPIX+CTbI6rwZJdD5x14CPFQknm4l5
	VKeosoA==
X-Google-Smtp-Source: AGHT+IH07aQeXAQe/gpM4oI6RLK2u3p52mKtLGzZsiMbsodE1gcNl3/aTBVcK7Ae83foyLaxFhiKihoxiME=
X-Received: from pjbpt2.prod.google.com ([2002:a17:90b:3d02:b0:329:e84e:1c50])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2c3:b0:32e:4924:6902
 with SMTP id 98e67ed59e1d1-33bcf85a829mr1565388a91.3.1760661196491; Thu, 16
 Oct 2025 17:33:16 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:34 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-17-seanjc@google.com>
Subject: [PATCH v3 16/25] KVM: TDX: Fold tdx_sept_zap_private_spte() into tdx_sept_remove_private_spte()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013327_382776_08476842 
X-CRM114-Status: GOOD (  12.15  )
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

Do TDH_MEM_RANGE_BLOCK directly in tdx_sept_remove_private_spte() instead
of using a one-off helper now that the nr_premapped tracking is gone.

Opportunistically drop the WARN on hugepages, which was dead code (see the
KVM_BUG_ON() in tdx_sept_remove_private_spte()).

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 76030461c8f7..d77b2de6db8a 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1679,33 +1679,6 @@ static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
-static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, struct page *page)
-{
-	int tdx_level = pg_level_to_tdx_sept_level(level);
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	gpa_t gpa = gfn_to_gpa(gfn) & KVM_HPAGE_MASK(level);
-	u64 err, entry, level_state;
-
-	/* For now large page isn't supported yet. */
-	WARN_ON_ONCE(level != PG_LEVEL_4K);
-
-	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
-		return -EIO;
-	}
-	return 1;
-}
-
 /*
  * Ensure shared and private EPTs to be flushed on all vCPUs.
  * tdh_mem_track() is the only caller that increases TD epoch. An increase in
@@ -1786,7 +1759,6 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
-	int ret;
 
 	/*
 	 * HKID is released after all private pages have been removed, and set
@@ -1800,9 +1772,18 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return;
 
-	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
-	if (ret <= 0)
+	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+	if (unlikely(tdx_operand_busy(err))) {
+		/* After no vCPUs enter, the second retry is expected to succeed */
+		tdx_no_vcpus_enter_start(kvm);
+		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+		tdx_no_vcpus_enter_stop(kvm);
+	}
+
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
 		return;
+	}
 
 	/*
 	 * TDX requires TLB tracking before dropping private page.  Do
-- 
2.51.0.858.gf9c4a03a3a-goog


