Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80DFD0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UUv0bhCA+Tnp7t0RJIbnCt0mXR7WDVRrdpyjT9eb3NA=; b=PMZozifymVEQlAQDe94/0/zjrj
	inI+wD91vQjFmpVMrQQe9bge2eNa5lmdGOnkNWEL53tGTGhRXp76few8YHnETALbhOjL3tRl0k8BO
	2gzmp3wxRYTn1kdHpzvaZGvlU05BJoR1bhKfcaqJ5MhUd6Ddaw3BKDNlEMc4EpEpbvqYtHdRTBqNr
	/rKzucnQUWtCpEYhnvWdN1QfmkZ5UXy6iF9XAO3rluYOOEi+66iePOEcS1b3ZvssdgxeU4euOzkEZ
	duzASRDSDkOSGAMZd8P/00wcar0EpREpjzFtK96f1xv/71IVAUHmFNvMcek4Wlvx77ixvoveFMbr/
	8Odu8ZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxK9-0000000DiPi-0wce;
	Tue, 25 Nov 2025 17:59:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxK6-0000000DiPM-3y6I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5587F4017B;
	Tue, 25 Nov 2025 17:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5943FC4CEF1;
	Tue, 25 Nov 2025 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764093570;
	bh=h1qlIj8HN/bM1sBtCtKsuSxVMyqRjvY/Uk7aNakm8hM=;
	h=From:Date:Subject:To:Cc:From;
	b=QKhhfPUtCMlfCcOICVoGwipUuNj2cmL2Y6m+rfxvgq59YzUjL89dgWluW2TkivAR2
	 D/cCdGiOsioLMK8SQICulxOuoLJemRvfIH5oPwciSZXgSj1MxSxckd9YpLzn9aSC8I
	 41Wruge3gwVkVcRkGRra1gg5o08KvassgXFMkgq7ORzsnpy0HlSW/5MqGUeHEiVLgA
	 stIGrXR4d08526DVfI2lwvJaDJwFiHnPIln+uc16H19VnUljsu5iBQ8etehMigwzi0
	 c2p3A/uGc/dPwMul9NhdN8Nq11jDDaxD8hLMhtTU/L44+UZwBqUPX92w43oJ2VqTCX
	 nUiO5ngFp+3zQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 25 Nov 2025 10:59:15 -0700
Subject: [PATCH] KVM: arm64: Add break to default case in
 kvm_pgtable_stage2_pte_prot()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-arm64-kvm-hyp-pgtable-fix-c23-ext-warn-v1-1-98b506ddefbf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHLuJWkC/yXNQQ7CIBCF4as0s3YSQUHjVUwXgNN21CIZsNY0v
 buoyy95+d8CmYQpw6lZQGjizI9YoTYNhMHFnpAv1aC32iilDToZ7R5v04jDO2Hqi/N3wo5nDHq
 HNBd8OYl4NMpbb+hgO4IaS0J18zs6t3/np79SKN86rOsHSVH8dooAAAA=
X-Change-ID: 20251125-arm64-kvm-hyp-pgtable-fix-c23-ext-warn-851b6b5e76fe
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=nathan@kernel.org;
 h=from:subject:message-id; bh=h1qlIj8HN/bM1sBtCtKsuSxVMyqRjvY/Uk7aNakm8hM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmq7+pLPp/MFlzXcIbv96LXBRKT7dmTlOaGZk/M1oyuO
 Gvr+vl3RykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIxESG/4Wz/7ZMKWbImLRM
 verzz17TAN+Xs9pFZ0gXr7/+3X1DyF9GhpXl8v+1t4XcXyWf87h8s0GK1qNbpuWyRcflFpyN+pk
 sxQAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_095931_014218_2BDC4FC1 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Clang warns (or errors with CONFIG_WERROR=y / W=e):

  arch/arm64/kvm/hyp/pgtable.c:757:2: error: label at end of compound statement is a C23 extension [-Werror,-Wc23-extensions]
    757 |         }
        |         ^

With older versions of clang (15 and older) and GCC (at least the minimum
supported, 8.1), this is an unconditional hard error:

  arch/arm64/kvm/hyp/pgtable.c: In function 'kvm_pgtable_stage2_pte_prot':
  arch/arm64/kvm/hyp/pgtable.c:756:2: error: label at end of compound statement
    default:
    ^~~~~~~

  arch/arm64/kvm/hyp/pgtable.c:756:10: error: label at end of compound statement: expected statement
          default:
                  ^
                   ;

Add a break statement to this default case to clear up the error/warning.

Fixes: 2608563b466b ("KVM: arm64: Add support for FEAT_XNX stage-2 permissions")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/kvm/hyp/pgtable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 57e13a5d0405..947ac1a951a5 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -754,6 +754,7 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte)
 		prot |= KVM_PGTABLE_PROT_PX;
 		break;
 	default:
+		break;
 	}
 
 	return prot;

---
base-commit: b5e3afe91cfa420076851bbd833f11ecd3fab74d
change-id: 20251125-arm64-kvm-hyp-pgtable-fix-c23-ext-warn-851b6b5e76fe

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


