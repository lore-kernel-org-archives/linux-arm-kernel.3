Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E66D2A532
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jfhXtjVpMYWte58x/PC24J5XI6+isvfw/8Zcbl9+DZA=; b=wfDPSOQ7nn50zFYq1EdTwRXre9
	fxb4rlqNHhrfWmQ6wZFtfv1zuIi/9gpTaN3o+xDK5631txRHqBoDH6AhEGU2H9UmGEc7TioeEP1s8
	pl4qrLuafHkwd4iGEeK7eeTeCvsNcLMMLOlHR8FgeSQmnI+ZvVAiSt1jmP117DR1N+D2Z8+19X4ME
	HlSNkCeNm9pMoKk5AD8HcIMKtX2hpqCkPTZzgWi6UVnGeNq4lB8kjC2SfVP5vUGrht4LG92nuIOhH
	xsXSRfsR/pijtLwwtU5ZgkjEL4+gNieFVN6wuLfiKop6bl9FnJDqeZW6T4eVinPqbF8CPKfhfqmHc
	hW9zn8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGHL-00000008dF7-01Qu;
	Thu, 04 Dec 2025 20:50:19 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGHI-00000008dEh-3ysO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 20:50:18 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7c702347c6eso1384433a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764881415; x=1765486215; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jfhXtjVpMYWte58x/PC24J5XI6+isvfw/8Zcbl9+DZA=;
        b=q9XhDi+SiA4c8ZyzDUxEAVAvSkAEaaYQ5rrXhHA3sQ3V1bbr5vKmELkwkJ3dLlwsHC
         ZH9iBccH8WeKf4Reaktsb0ys/dW9D4dQDi3loT9fMr9tiD1slS2hdyyDVRqOGzZiaAcF
         LpTV+HWa+Z7mDfs0tGXUm1hnR+nZC9Ij5a0QYZjo11+RoM4BPx+1bp06izv789EozF4W
         aEJhm/PAXKds/7x2ZWwX02AdegMmu9FP9p4/ZHE2Nr46ngA1b6XBtC8YRWZxhypSU9KZ
         TS9bzjXcJAFV1U3Jy8C89H+tTzjTJKfx5CkuH+k0AorKUF+2tlvvuIwx4rexEFjKYiM1
         cEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881415; x=1765486215;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfhXtjVpMYWte58x/PC24J5XI6+isvfw/8Zcbl9+DZA=;
        b=J3Si807Xo1YpjawpXbhJ1qLaLN/Tx109zYl3bzWlU+pR1MfoSv24Wz5bSB8mkhZ8uV
         FxPiQGiSp6D+wwrIpAUfB0KzjyOhneIwKYyC5M0WmLFswNV/XK0ao57UyUnUv9TlmePR
         oAxIEVETdvmGQGy1joR7A1iM40t+hoYAr/2pAurG909dTLmj14XkVmQSNfRjf3PLXQX2
         TC9iZrvk6qRvpgQVFsWUl/zmEnzfstO1Gloy3wCgDW61LgT7o3vVp7+IKJr1p6PHX/Ak
         fc7mWSN9TppK5Q6iaYdm0gAzI9rjKL99LyVhzWVPr4q5/n5tL49e2AMNhdesqggzHlVr
         /Zyw==
X-Gm-Message-State: AOJu0Yw0+Co/yhwGDqHeG4922vWtEV0kvaP2XdU0kUNLR/W5w2tXsul0
	uyC6tcwycOjPVVHU6rNaBnVmZxOkKO8pEmK2AMvCQMX2n8VSAQmWH1dS/rpIQCJflfq3E5O+nG5
	P4sw+4X9LJ4u9pwy4vc2Mi/sV9A==
X-Google-Smtp-Source: AGHT+IHKRkFsm1qvW8FHQgUBY9rowKQV8LQD4wg/pfFAOzqqCDtedAh9KEfVk/fSu+irJi0QEI5yC6OCMXP8ByDcyQ==
X-Received: from ilbbb7.prod.google.com ([2002:a05:6e02:7:b0:433:56ba:b9cb])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1184:b0:450:c0c4:3728 with SMTP id 5614622812f47-4536e428247mr3791671b6e.30.1764881415297;
 Thu, 04 Dec 2025 12:50:15 -0800 (PST)
Date: Thu, 04 Dec 2025 12:50:11 -0800
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAP0MWkC/42NQQ7CIBBFr9LM2jGAlUZXvYfpQmBsJ6nQADaah
 ruLPYHL95L//gaJIlOCa7NBpJUTB19BHhqw092PhOwqgxLqLDrVomnRzuwivjz7jDb4lHHJETt
 y5qKFsSfjoM6XSA9+7+nbUHnilEP87E+r/Nk/oqtEibqzrdNKGG10P4YwznS04QlDKeULzWUJn sEAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764881414; l=1644;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=QdxSdzVzK5xrxxMWmz/dhJgRurzJ2W+fjhM9MUROI4E=; b=xsVQAx0YLXTKT8wTYbzwnSITaZIYSGNlnwQWqZJic5nR3ojchC2UaEVQCaQ7cnY5/r5sGShFg
 e7G0a5kMKZmDg9asmBU5U2THu+tB9937IvPJlrFBxjct0SSPaHwhSq/
X-Mailer: b4 0.12.3
Message-ID: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
Subject: [PATCH 6.1.y RESEND] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_125017_020653_76C80A53 
X-CRM114-Status: GOOD (  12.59  )
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

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways.

Silence the warning by initializing the struct.

This patch won't apply to anything past v6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration"). There is no upstream equivalent so this patch only
needs to be applied (stable only) to 6.1.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Resending this with Nathan's RB tag, an updated commit log and better
recipients from checkpatch.pl.

I've also sent a similar patch resend for 5.15
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f4a7c5abcbca..d7ebd7387221 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2948,7 +2948,7 @@ int kvm_sys_reg_table_init(void)
 {
 	bool valid = true;
 	unsigned int i;
-	struct sys_reg_desc clidr;
+	struct sys_reg_desc clidr = {0};
 
 	/* Make sure tables are unique and in order. */
 	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), false);

---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20250724-b4-clidr-unint-const-ptr-7edb960bc3bd

Best regards,
--
Justin Stitt <justinstitt@google.com>


