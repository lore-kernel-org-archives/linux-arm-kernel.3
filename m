Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB70CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0hMb6JFLji8duaB2XeitlKTMM8QIWRSHjGJV9xdd+o=; b=tiUmv1bzEF2BMJaj5XqEUXp76T
	9clQe/BQIkOauC/OGuXL2/YyHGMP2BcykbIp2btiOtfN6DLGijsinfPvogh6wepqw0HLAlpB2QGU9
	iGd3wJhobaek4gXi0tOqpdHwE3JLwvS4+m6yawJ0clrwMSdFNPyPAhChzj7Uc7tF/NlZYcdXJOO7l
	xCl2nhollrTVm648XKPoKBfzlskPsvmNLf+YRfRYEyHIN6pmWT4d2B7KNn72+xVTdp5DyaVvO63Za
	zOWhkIaGjYAB0tXvpgvCSeJ6345vs3ruE9BZI2sEKHkt48TqGq24E/hEbDz3l/GCfYzWgWnDNFWzD
	Lt/QyyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmN-0000000DAk2-0UXc;
	Sun, 14 Jun 2026 16:33:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmH-0000000DAhK-1M6X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:42 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490bfd70b0fso23576005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454819; x=1782059619; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0hMb6JFLji8duaB2XeitlKTMM8QIWRSHjGJV9xdd+o=;
        b=hCFKb295wA7J0z/yIWIVDjYwjyWe16m8FA/aJehW+CBZQrl2P/dtlp7DHTtlPHugq6
         L3qrB+Z6SK0jzNIKmm2Vt1CgbfE3zqV5OBA0dM4waVoJnfb9pDkMnWr0t9ss2bZzxBdr
         hNX/uwHyif6TgINkoJjHob1Mm7q3mJkNvVPhqMTrRrihq2Q7I7CVkoqb9pV6lGNqKiDp
         oXoGWJEq+gj7YKQ/rG/yqeEbALhY34X2zXgBx+Vo6wgpSGkhtCww+sJQPNYvgfnTu2HE
         fDS4tedHO+4oJYxZAX3THFj/BGqYjhBAFph9urwy4hbUvmhCT0hAbN8MoTIkOewu9dGD
         coFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454819; x=1782059619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0hMb6JFLji8duaB2XeitlKTMM8QIWRSHjGJV9xdd+o=;
        b=gX0HtsI2UPAdemUfLuM6hzXcuOOY1s8EJ6BGU9zuYqLJoOwcyHHhj5vNcZDCPen150
         F0uNaTYD/TKoFl/N2CFyFjos7ILK3HezlL2gpv6awvONOA/1v6IjPhVR9k4OuUBxzXYQ
         5z2zh2f6q76D33tq/WdbQziaPukhrygaz5/9DlpQSuakzIfAfNh1AipdGXjVkILbgoWS
         rKEnwWuGVj4f8eB61adbwIc+Jx7G1E72+ZrMj2EoChakL1ZdAhX6f1PNVCUCFeQFy95h
         9QMFCOgksVc3MC4Q27ScMzB2/BIh4UBdb9TqiVBbtua8FwUuZR0XpD8n5RP89r5KXOXh
         Vl7A==
X-Forwarded-Encrypted: i=1; AFNElJ/kb+pKs5l+YVduuHItIDddVOl8hzY++2Otwckpk79SJtRoBBRmm32UNk/dSOJ9J4uG9j+CiiZQoB3kOLJbHgTj@lists.infradead.org
X-Gm-Message-State: AOJu0YzMEvQ1aW5OVmI7dYENA+k3C3rcJg5AeTXjIyeSR4nEgXLS8VYu
	TL6PaV/e31SfPHRZrX8U55IaG1Mc+xEEM+DajEdAzGQoNRpb1wHFdzh0koy+l6/tpup/X2I4JHZ
	D8g==
X-Received: from wmcv17.prod.google.com ([2002:a05:600c:4291:b0:490:ae4c:a69c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6612:b0:490:bb45:79ee
 with SMTP id 5b1f17b1804b1-490ec33d4cfmr133385485e9.0.1781454818769; Sun, 14
 Jun 2026 09:33:38 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:30 +0100
In-Reply-To: <20260614163336.3490925-1-tabba@google.com>
Mime-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-2-tabba@google.com>
Subject: [PATCH 1/7] KVM: arm64: Set ESR_ELx.IL for injected undefined
 exceptions at EL2
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_093341_366632_AAEDCD99 
X-CRM114-Status: GOOD (  11.03  )
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

inject_undef64() constructs an ESR with EC=0 (Unknown) but does not set
IL. The architecture mandates IL=1 for EC=0 unconditionally (ARM DDI
0487, ESR_ELx.IL description), so the injected syndrome is one that
conforming hardware cannot produce.

Set ESR_ELx_IL in the constructed syndrome.

Fixes: e5d40a5a97c1 ("KVM: arm64: pkvm: Add a generic synchronous exception injection primitive")
Reported-by: sashiko <sashiko@sashiko.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8c3fbb413a06..9767adf1f73e 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -278,7 +278,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
  */
 static void inject_undef64(struct kvm_vcpu *vcpu)
 {
-	inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT));
+	inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL);
 }
 
 static u64 read_id_reg(const struct kvm_vcpu *vcpu,
-- 
2.54.0.1136.gdb2ca164c4-goog


