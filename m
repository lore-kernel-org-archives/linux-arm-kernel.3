Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF52CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OzMnD/NoskCUoJd7co6AiN6FbMwLhfUbQPuu5zkvOA=; b=ESKeu9oFz1teuuxBBFeJpIwpeM
	1fByNvIHrtKzvGXwAY2pZYKPWq6FvCJG6s9YH2Bzy6vbWZ+nbD125AlQYVdEwYZYx7fcMHXWViYe/
	vXaaQR5p3yBAq5YPhvyTRdi1ZzO/dyu/ycWluxnNJvqNRvO2ZblwYG1ZhKLG0QUBPieem159b1kCj
	X4fra2vijnR7ekzucFpG5yCFTUiIFRmTNFg9wmDcsUY4egh+z+90sH9X7grCZmMZfCc23rlVPZqQ/
	jL8Y3J3VHQRZrhljawYv1gvEQt3WDHq0BDStsbvr+vdrsnUjbtX43vwl2FL2G8lHlo4DtE0pN4SJu
	iH5mw0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBgA-00000001FBm-3s8J;
	Thu, 18 Jun 2026 12:17:06 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfx-00000001Ezp-2dEp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:54 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-695cf61b463so1034880a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785011; x=1782389811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OzMnD/NoskCUoJd7co6AiN6FbMwLhfUbQPuu5zkvOA=;
        b=bGGQVBVGueqDMSt5QC6IAJQHirHvokA/nxIfPOGIDcBGV1x3iq4BDzhis4VzjmMzHc
         1Xq2C8cRdG9TB5j38S1pbA5ZEjelFh0Aflqp64ZHiTi9yjDDepU+IKvZe9okQm5EuKkI
         ia6pYN9esxEze+u+0h+jm2RubPx3ZHE2mrI2Zz9urQOgVR5KrBJgRKVvnZRzlr1ljrga
         c2OogNEPGm7FqMR9DsyOhXAwOYbwp0e1flls/5dx5aT8+RFgwICRspfl2XXndSdPfHDI
         Vgh6HKQeKm6f7StEPbsqJ1GwfXxgUdJj6j6L9BHxWV85Rgfsx5soHsLz3GOSlUcNdx2V
         nFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785011; x=1782389811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OzMnD/NoskCUoJd7co6AiN6FbMwLhfUbQPuu5zkvOA=;
        b=jJFlCkazRyDhZr/f7BrT8kuVHTDIplIiniQRgzj0OBmNZzYXjZVenBPU/Qto0XSSrf
         H4WETQztnP+tCSl2xocTRV1XUnsX9FLC00dabJpmRjbpzCr/8xDCpJyR+4ypECP/82fO
         syE2bQVxdH4ENrb6y8jdrBOzuCdlht72lbWhj9WaFo/rmFxb/S8iYhkxMxNuIlcT8ujd
         lRa/X25sxuTWvgHOrv3sYtmvLdgGZ+Nxvf1SJa52yjTkmyjDGMwKU4DqoVIyWt3r4tJ6
         S31Fq5RoKhcIjC9vBexJqbIuFBaOvDIrE0OZ07dpYZUemvuvwR7Ihq5CxXplmdY6gqLf
         jCpw==
X-Forwarded-Encrypted: i=1; AFNElJ+14wOrh+xGRY0tcZVQvZ6XRkRgIb58d51JyTMzDE3GBANdK9kan9J8i0sSjKswYbXJVteqEbGqIF7pcaNjsEXs@lists.infradead.org
X-Gm-Message-State: AOJu0YzYDIxzzMCabV59KEhdr0K3XwQkIh3RXMpYmLch2YkR2Hy836GE
	kJSCJJLwv+PvxE80PQllcLHseKkWSUjzKV1fEDsOr7968eh96oF/HmgEG34rxFA74+3wQnKU6/r
	jyw==
X-Received: from edwl20.prod.google.com ([2002:a05:6402:1254:b0:695:bbc2:4b07])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:13d1:b0:671:a18b:32b8
 with SMTP id 4fb4d7f45d1cf-69546c6df14mr4828584a12.0.1781785010536; Thu, 18
 Jun 2026 05:16:50 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:41 +0100
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-6-tabba@google.com>
Subject: [PATCH v2 5/7] KVM: arm64: Set IL for emulated SError injection
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051653_672511_6AADA488 
X-CRM114-Status: GOOD (  10.82  )
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

kvm_inject_serror_esr() constructs an SError syndrome without IL. The
architecture mandates IL=1 for SError unconditionally.

Fixes: f6e2262dfa1a ("KVM: arm64: Populate ESR_ELx.EC for emulated SError injection")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/inject_fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 444d219b0217..d6c4fc16f879 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -381,7 +381,7 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 	 */
 	if (!serror_is_masked(vcpu)) {
 		pend_serror_exception(vcpu);
-		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR);
+		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
 		vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
 		return 1;
 	}
-- 
2.54.0.1189.g8c84645362-goog


