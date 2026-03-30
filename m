Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD221061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA1EcVC82uXVlDKU5JkOFbhBk+6wk0PYcHaPJpFJoYQ=; b=EW/VCvsF7M+s5ql2ZJwm9+Rhm7
	jUKA0DP+aYKjuyc62LaBROh8Y4bX6QDHRBxnzyckLF1PCTVp27N4paMpr2zb6PlBSN0fhxohzKqY6
	xbBeOk/zBJ2sP6tUNDKe2zkkfcvJUgCgCWKiv1i52XwpeS8IaKgkKh9MYM4FW+CkBDw1SxljHhW0f
	lelW6aOKPmF9Uj+WSqVG4326S1iuLFXR12b5cEO8HLFspSjC/HB7AjV0W0xn8zF/Fue6rnYu3kctp
	Q22Q/9VbFdEkpp0Zh3JrBrEAcDhLMd+wtHXnBu1a3gdcTUf1yQozShRv8a+D2NhftGvFHSvqfEMAX
	bBT00+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DxX-0000000BUdy-0ypi;
	Mon, 30 Mar 2026 14:51:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DwN-0000000BTe8-2u0o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DFC3418DF;
	Mon, 30 Mar 2026 14:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8031AC2BCB1;
	Mon, 30 Mar 2026 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882207;
	bh=tDDm+SzKUoz2fWZ2GjfXbiq4GHf2/6hOrZ04uxz3XhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BsvYUlqAvj+AisWxnslnzQtbakQylr2jrh9m9Uu4pDiFlP/E40DpvEeAFJCWCN/Ys
	 ObKuSJvCoboGHby/Da/IGEryRrhyyW6fDnvieas6eScCWCitfEPPOQr4/LPD1m3waQ
	 QXMNFN8UJw4+p4LPJVfgHFx/hBL/vw1aQJ6mSq5+ep9G38gFh6GEVxgWVr7IBwsouw
	 RVstaJDkKP54Lb1aLqQRpZuf7GUeesvSECKWCZ/yanFU4A9PLGmPTHLFL4UV6O59d5
	 9y1q4k5CeyTxkks0QkHDxCqzyP9tpNPHOwiAnT9+YKyFC8PkrlrLcL+1B3C9ulx33n
	 7+aHtv0J/exDQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 23/38] KVM: arm64: Change 'pkvm_handle_t' to u16
Date: Mon, 30 Mar 2026 15:48:24 +0100
Message-ID: <20260330144841.26181-24-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_075007_822252_F71DA93D 
X-CRM114-Status: GOOD (  13.78  )
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

'pkvm_handle_t' doesn't need to be a 32-bit type and subsequent patches
will rely on it being no more than 16 bits so that it can be encoded
into a pte annotation.

Change 'pkvm_handle_t' to a u16 and add a compile-type check that the
maximum handle fits into the reduced type.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 31b9454bb74d..0c5e7ce5f187 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -247,7 +247,7 @@ struct kvm_smccc_features {
 	unsigned long vendor_hyp_bmap_2; /* Function numbers 64-127 */
 };
 
-typedef unsigned int pkvm_handle_t;
+typedef u16 pkvm_handle_t;
 
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 092e9d0e55ac..0ba6423cd0d5 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -222,6 +222,7 @@ static struct pkvm_hyp_vm **vm_table;
 
 void pkvm_hyp_vm_table_init(void *tbl)
 {
+	BUILD_BUG_ON((u64)HANDLE_OFFSET + KVM_MAX_PVMS > (pkvm_handle_t)-1);
 	WARN_ON(vm_table);
 	vm_table = tbl;
 }
-- 
2.53.0.1018.g2bb0e51243-goog


