Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6225DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPnatUnJPKrw1pxfY+XXR902PU81z5h+YgeiJInMCN8=; b=WNJCenHAFZqY+o6vxyvW6MWdxo
	WXvLYY4fm+ahBWEGttVBgZGsB/474PnSKE2B3+fWQMVvsAfjj2KYmcAp7rCmOg108n+IueYfLhx83
	edOS/FLvDcTfE6FpMliJVMCbQ7IWwZLCNrD7O6My0ggdVnyvbPEE1+fz4qWa0QCfs7bgy8oQgFuos
	hHFEy5EltulAO998F/HM+yaXtu6CQdUh1x5jcJxoYTtzuSmsIcahjGeic2HYpIjAhhWzom8Gfbsee
	kLYfG5b2jNQDC7HrSVtn8BVcScEEaiMtVW/lFIQWPx92gurid8ibdrTj1tTH7VJsQXsn4vYlWaaYc
	dit6inFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokzf-0000000EIP2-026n;
	Wed, 20 Aug 2025 15:44:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojb9-0000000DzFM-2ugz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2716A61439;
	Wed, 20 Aug 2025 14:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B26C4CEE7;
	Wed, 20 Aug 2025 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699331;
	bh=/H6Cuxewkf3ZOoM+h+m1Hnboxh9fXQ17PaC0xmbP9d8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GiI37vqHndScZIBREQpAxkImAI56bfK+WeLENIxvhYv5359DFAtQtmJYBGk19UGYR
	 tmNbFEZxzCQHTfyMGnX6oP7FDC2CbCP2wJvzuhGyfpnoGYOY3DKWYnpckF5XgJERiM
	 5/88QrLKY3OZhbv36zIf7gQlAx56Mlfvvwy7jdFDgyYooGUJZ0bZ4pTqHcb4ghNYJX
	 IYeXx0+QdgvkE1PeTJuTKqyr923obJRXwi8U/lE4set3YWBpqQhAtE7kNdy50uyTsN
	 z7tlN+drlTw/YYQsITAxXk0pf7sxf1/+DJnoCjM0umRNcX5lmHIuSe/LHgzof96Vj9
	 N35iVNX01cvKA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 15:14:43 +0100
Subject: [PATCH v15 3/6] KVM: arm64: Forward GCS exceptions to nested
 guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-gcs-v15-3-5e334da18b84@kernel.org>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
In-Reply-To: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/H6Cuxewkf3ZOoM+h+m1Hnboxh9fXQ17PaC0xmbP9d8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBopdhw9a8PwftR7e7KTrbNQNhA2EWwxbNtGK3+O
 uDaajVqAxqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKXYcAAKCRAk1otyXVSH
 0JS+B/wNzWs53o4ozEZ+UVZObC3L+hU7WGSpojmSDhHzVYkpqAFOywHJUwUe+8/kJmKC2Ct/VzX
 ZIxMGWpO7E5OHGJDMbT3yRXqGkMs0kHvt3kkoXjn6Y6dddqtFqWYXaqwkY2ZOLxbSGPJRDn3eb3
 kvQdUSWxwaRwrTeuLEGsGm2pLoaTRVVCJaUTAWwV5DpUPjuwuIYuM9nBPWZHzB5sWuKU02iw0jE
 gqhqavT9QJPnLdf9K3EMhPfixEkK+XraEgf9MtzpLcGJfzTmL+CjakifA4gK3Nsvmf84TGNFDCE
 eGwHOfQggzSd0F6ijq6Edd84QEfFJtMQICcL60sMNnDY78SE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

GCS can generate exceptions with an EC of 0x2D (GCS Data Check
Exception) when data validation checks fail.  When running a nested
guest which has access to GCS such exceptions can be directed from EL0
to EL2 and therefore need to be forwarded to the guest hypervisor, add
handling for this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index a598072f36d2..2f5aef84b294 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -301,10 +301,18 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 
 static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
 {
-	/* We don't expect GCS, so treat it with contempt */
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
-		WARN_ON_ONCE(1);
+	if (!kvm_has_gcs(vcpu->kvm)) {
+		kvm_inject_undefined(vcpu);
+		return 1;
+	}
 
+	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
+		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+		return 1;
+	}
+
+	/* We shouldn't have generated a trap in this case */
+	WARN_ON_ONCE(1);
 	kvm_inject_undefined(vcpu);
 	return 1;
 }

-- 
2.39.5


