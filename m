Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE703C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 21:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRndjmqR/pDKaAT5YJWoMzUu6Phwwq9DvX5GRxKta6o=; b=WY86eE6CVWVytZ3kgVu2dPmerP
	UoyZlAQIsu7q8Q65DHbyKdwrDtgXIKNOkODA/wW1wHHTnPaLB/rCBOPFazw0KpZd7BQO2CNrBHb1p
	K8pbyF0Qkp4VF/2FCYcR5boBep0P3EA0XwLAHihfoVBsmusRzALXeXnowKluK/SxF1y5fxZ7Hgqiv
	heHYIXNwtMTtCjb/KnrswPYN9waQosq0AWGCA773rDX7QM3uihmexzWZsFKp84ZrJXYF6+62TCAcY
	/9bL68UVd+oIj4ZlzvJvObFNXRXxiAaV85eoMgUBrsySbpREOoBEQDNzxrRzLX5h3GjZCwbXt79Lf
	dA62WgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNk-0000000DQKH-09rm;
	Tue, 01 Sep 2026 21:51:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNi-0000000DQIv-2ugg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 21:51:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26535600D9;
	Tue,  1 Sep 2026 21:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4FB1F00A3D;
	Tue,  1 Sep 2026 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299461;
	bh=fRndjmqR/pDKaAT5YJWoMzUu6Phwwq9DvX5GRxKta6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AQHj1ZT2mBNjscrSoVJTdOUjme+Hwc1l7GuTPF/1IPpm8ESshRDsUVq+lnWn+6RRe
	 /4Asky7NXAGXyh9Np9ke1b7ckqGzxcpdy8a0gvGK8hUVZfO/rWz0ON/b83Pv9OghCA
	 D4xEX2lbDsV/505DqX0qTJ0oU3hEAg8hisS4Bq3y3m/zmAHbMMjBEYZUItgHjJcwXv
	 4v82zRU99OaGK/vpHzARBDPTSxr0cyreid8gVVsolZYxhy2PPwW5fDWehCiWe6bCd8
	 6iOqjuNkVTLI+Gt1/pAgrpUrjUeJ9gUpUeWHoUKXxZlyTjdCmdLktZEgEvSrOVXfO/
	 93hgqF0i64PoQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 22:47:05 +0100
Subject: [PATCH v20 07/14] KVM: arm64: Forward GCS exceptions to nested
 guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-gcs-v20-7-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
In-Reply-To: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ybZ3Kdn/7X6FtbChfk8rW3p585sYuKBjGuFuBHbmNzA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql0ih715I7fTQ8ImR5pPuXiL5bjJV6Yt6xQaij
 m17Hr7PAbCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdIoQAKCRAk1otyXVSH
 0DAfB/9WzE5SnoA6xrOiQ6faxAotAUN5O1BpWGY3P1Q3uA8gLLr83/moWCnFRRb9cYMAaiKck+T
 jZUpsFk1gtgdF7SiIrcCbRgPv5l144hBm/Fc8KKEpuS7p2WmNg3O6YN7+x1PXZULD1vxkKAyLS+
 L3iDSWXv4Ytu8SLiczzTC81ioPGMyqLMblIJQ/YBpzZMxN8+4lqAf4nkqxWwBLe+L6LExTl+Oj8
 +ZmmzqRYFl9iruvA4K+jpOWzhh2gmbgo9V/ERWPSeU5HoZxqY5dcR7o696C3IX1PENQwejk9tJa
 VYzH1wzs1ALlnoUrGMldITlNim0Ml+jCZFc0rUE0vhWCNBwl
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

For nested guests where HFGITR_EL2.nGCSSTR_EL1 is clear or when there are
L2 GCS data check exceptions we need to forward the exception to the guest.
Add handling to do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index db37678dcb05..a8198e96fcb4 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -304,12 +304,24 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+/*
+ * We might get GCS exceptions that need to be forwarded to the
+ * hypervisor when a nested guest has HFGITR_EL2.nGCSSTR_EL1 clear, or
+ * for a GCS data check exception for a L2 guest.
+ */
 static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
 {
-	/* We don't expect GCS, so treat it with contempt */
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
-		WARN_ON_ONCE(1);
+	if (!kvm_has_gcs(vcpu->kvm)) {
+		kvm_inject_undefined(vcpu);
+		return 1;
+	}
 
+	if (vcpu_has_nv(vcpu)) {
+		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+		return 1;
+	}
+
+	WARN_ON_ONCE(1);
 	kvm_inject_undefined(vcpu);
 	return 1;
 }

-- 
2.47.3


