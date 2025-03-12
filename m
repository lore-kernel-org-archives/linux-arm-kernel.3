Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC1C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2W4Xv+9VQWQQBSPngguZ3XObUjYW0AuhHcxMG6Wj0Y=; b=rz5uxxhiopjJSDV4eu4EH6XvSC
	Oppi4jNDQIzCNcrWAG1qaPxV/M9CvUjpeEabsCF+0gHqNwvY0QdJlyzdcAaXMHgYlNXVZ7KAEY7gd
	4Tlz1muqJawU8FI5kBb4QwzRgoVvG0rOdinikcpFGoQaZ13gDX/awXRu1pZMOENMWKvI/MmfDfFml
	BHro3lX+kJdIKSQFBaJGHhCFDyqZKBldnDPWjqFb8ghdXBgKZJm0dTk5KtL3jXwQwKw8LgkclW1s7
	b5Nqb9WFPq3/Hu+ML8a0xTWE+26q8fLmUwmdGB5X5aLmpeY23ZvAoFC6yWS4lZdWCBPiYOjID+D7f
	AEJ+o0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLkI-00000008UNI-2wP0;
	Wed, 12 Mar 2025 13:03:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKhW-00000008KTG-2qrT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 11:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=u2W4Xv+9VQWQQBSPngguZ3XObUjYW0AuhHcxMG6Wj0Y=; b=BtQexKMbfxFL+amink8bxuwSdc
	P24lEbic+hRIkYOCaz1rKx+AR7IMhD/ujOf9z9CffGrS+iAxWFjt2bNjsEpnGaT8zUHXqSN08cltm
	riJM0QDdRZYvVE8eU4PIfAgrh5wruD+cDzfoKZ5YK/XLIsrSNRdWq1BlVsef44lbnKOFGViQZUH/F
	De7LOww0shSY/E3pFcW0bYUaHZhkNh3JzEekv7bqCfP81nFgEPxOgwol0ka4Yf6/ntX6Sp3JTd0H+
	/ec1dbExNe/2Bk/GukwtcMJ7FgzJ5uDnJcTjbRkNTVjyvyJJMK1w5a3aB5g8M5UxXvzy4D115pIP8
	xPe60Hag==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKhT-00000002Mql-3jWO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:56:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2255003f4c6so72464125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741780597; x=1742385397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2W4Xv+9VQWQQBSPngguZ3XObUjYW0AuhHcxMG6Wj0Y=;
        b=FFBMyyS2D2p+FVUhlFeO7/DJk1oRaRxxdCl3Ce8j76qqzMVvXwdW8B5BzrwuSEKbXB
         TzGmgBxVgj2psV9JNn0whh3lQZXxzwFDQjQolOCLjvzwOGtLEaQ7Gp2uKRi0HQeBKCKy
         RuchIj4sGL94WZNt5VwUOVLdrjErbEQ2YCkFdPx3rjwy1vZkQjDEq7MLjjs3ebj1ko0b
         y+p9boUSDHWATsLXgBnML+ORDQPTYYEMSs0id4DUfM2MG2b/1nXn78JGnB65CCVA+k+M
         Hx3SZD+uW5i8mDXSzgx6/v38eQ65RXX2UGzMoHZkL4e7nkgDFVmYNVma0351iC7s+Jab
         aEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780597; x=1742385397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2W4Xv+9VQWQQBSPngguZ3XObUjYW0AuhHcxMG6Wj0Y=;
        b=tQTLj0JoohEkw0Sn3lH1a6np0+gBS3z6IXQv2KgiKFANx5YfZ7XxjpsUzphkvjCfKY
         Mg6Kjh39V4yBbk/ZP495Rw1CP+Eb0igyJo0rU/7VAQQo6JuQb1CBc4HG/9swRBGC0AxN
         ++EIyYW77kPCe3RZfvd3NTVf2IeP8UURn6z18gpiI8MPyJsldbghLK+qcOS/iLgkNgzR
         6OsEzLaH448UnUpK6+HdPA9uO+93FYC+PzqIqJS/pXKURQNqYq3N4wstDzRvcNsMABqJ
         JLsk3sFYRlclaNhnIga6AA0ViLFz1ThyP6ESZpg4/0RqL7rHPCVUtKN3vhsuYNTnnU9F
         B+ew==
X-Gm-Message-State: AOJu0YyiIi9R6oKqiW8i3eVEbhXyUgt5ynJMc668cBVdqsLnpM0zag4n
	y2oFYYsbh8qV7G5du96q1sWtvIcbCWQmLV9yBuK4ZlxMkXZfBmtkgqvYOv58914=
X-Gm-Gg: ASbGncu5laiHHC+7Pv2jn6LewBnL9qkO/4P+Ojm6r+ODaEuitk65jQFcLIlc5D1bM7b
	UqZvxQGmoTcs8Wg57n+Z4TT/TBj4HihlFPsjSmN0f2tC/jWcZs41AvA+3+tTTwZ4dg4Pp+ypDz9
	0j8pz0WKoK8l3PrIhkOgsW4FTQd84rjvwjN40ow4yjnnmNJsqin9rNot1aKmMyi8aluI70TZ52O
	jn+mZxFWeUgeVNqBF81ow0EsNn3L/6PNTD3NMnLc+ZMpG/P+E+B6SFqF17j6vXmAgclnldu7+X4
	6YWe4/RbAE2tDGHQRTiFmXrXij2iWIe5BKGTrIVqcHVxJJbH
X-Google-Smtp-Source: AGHT+IFKd8JzPs00shGeDPszPVRqf7Tdd+CUl4POW8V13KNLbNVMybkA3YJRReDGIm9qT/E2zqWsNQ==
X-Received: by 2002:a05:6a21:9d48:b0:1f5:8a1d:38fd with SMTP id adf61e73a8af0-1f58caefbf9mr12020498637.2.1741780597517;
        Wed, 12 Mar 2025 04:56:37 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736d4f20913sm6410407b3a.13.2025.03.12.04.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 04:56:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 12 Mar 2025 20:56:00 +0900
Subject: [PATCH v3 6/6] KVM: arm64: Reload PMCNTENSET_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pmc-v3-6-0411cab5dc3d@daynix.com>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
In-Reply-To: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_115640_024718_DA0C4179 
X-CRM114-Status: UNSURE (   9.70  )
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

Disable counters that are no longer included in PMCNTENSET_EL0. It is
not necessary to enable counters included in PMCNTENSET_EL0 because
kvm_pmu_handle_pmcr() does so if appropriate.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 2d19c6048091..b14655dda6db 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -831,6 +831,8 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 {
 	u64 mask = kvm_pmu_valid_counter_mask(vcpu);
 
+	kvm_pmu_disable_counter_mask(vcpu, ~__vcpu_sys_reg(vcpu, PMCNTENSET_EL0));
+
 	__vcpu_sys_reg(vcpu, PMOVSSET_EL0) &= mask;
 	__vcpu_sys_reg(vcpu, PMINTENSET_EL1) &= mask;
 	__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) &= mask;

-- 
2.48.1


