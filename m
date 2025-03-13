Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102E4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV52GHaIMEPgQHguZuBTFzmZYTI1o5W7vkJBLWdUl1Q=; b=sfhBiQl5XukZX3wfEKjaED2hQv
	BUpApRN6mndmFWvY8fiCtMY3HJ1GncXWEcyB8Dw1q09vNe0Dqj7tUmmPavsrI1BVZ7S5xDwhM7gGK
	qcyPPhEdW8G7X3TNbBdvGTqBmdd4o5kaUZYPnTfUal8Ipmxwb+aA6AkdcOydQ6jdpzSPHftzDgWCT
	j1UjQM46rHX+ihQ/q4XwtdielSUKozI8Om5OOwiU5zlkmvDZ6NEEFRV5hYR2yP9iI7zNBBe8VUTyT
	DYZl2Y3FTup0vkIePF8AwHoWab2tIyqzlwEwQoMMS9eK0LRHe2chL+14rIIPz0FZWNgGSCk0PTpOr
	cqING3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tscfm-0000000AJNR-3wY5;
	Thu, 13 Mar 2025 07:08:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscWK-0000000AH2q-0CP3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:58:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3011737dda0so1181367a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849099; x=1742453899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dV52GHaIMEPgQHguZuBTFzmZYTI1o5W7vkJBLWdUl1Q=;
        b=yt6wTNTMFvFwA/7Gw0AdNU90x9WbVKR8s9LhSYZuokZjw58ghdkEd3TLrvsUc1R9Sk
         I4GI2WvF+zXkX1gOpNAg6Wawo+LOeuEJnX97p0J7cIHt4Nr31wD/9JbE7clCT4oXObR7
         fHjHDqGWPqSsqYCzj+AmsZ4MkDK2Gg4ecTAsIH46lHYUNlygLG/qrTyOYRwav4yWVyPW
         k2NktIqrct7PT/kd/Bga8JYGvO+MwkIA530P6fhB24f6K5wXGURGHVDAjPbMvLZA7n9j
         nMXdOb/4YOZhClrfkg7xWGio7sMVXjNGrY32NQ4cnfbrfsqTizy/BuVxaupv3KddOjnB
         Ca6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849099; x=1742453899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV52GHaIMEPgQHguZuBTFzmZYTI1o5W7vkJBLWdUl1Q=;
        b=Yv3DidElkOEeMFS80X5QrN4HI4aqwn31L57LTmL4jtG4tkTtuUnxxw26pMD8rRF8ZQ
         pKRgnYgKDEcuf7o1vwxeAe/KdvJT5DUv9DoTijNf50I/ONuYtWJ7dt/bVxuCj7sUqEfq
         Iqug371OMuC02SqTbG4bjm0Gta3CXl5na0z0N9croz56fd7o7eGffw1RjnpPcpUgAYv/
         2GsSdK6aYBhP8Hi6BwTdT4+xGCWbB9nKKXSMFsnBuxeUYi2harGkeoZCQs/yU411Jk1U
         AX0jUBFxEmwp6BPi2uMMaW0w0YMXRahWsQuR/3icVQtolDfRP4GRGVwr8o6wN63rpISH
         uqPQ==
X-Gm-Message-State: AOJu0YxDp2Nr6j92zlttxAVkV9Fy/3764x3T26bPHsGEgwdOoFAyXQR5
	nUrdmstQzQCgWHdo8mXV2RB+wZ46PEwUVShsGZOenhcw6XBrYI/Ll5GBxoXGy3I=
X-Gm-Gg: ASbGncsBOb1D5dnJCDfQ0vnN3VrdRD59pvIW1mRKnKfattBl37+KNwvq1LhADD9OI7o
	/QcVbGQYyuppZWebYLj08wKgyPljuQZvZ1mewdj3rN7Xr+OT1eena9AFCkRKp04dVrIS7Slga8O
	EQpwtRbCBOrdyd4H8PQeUjjlaxeyWyda3Rb80FLNUKZbNuxVPktHbyPUWf2Fr/moj/klSIi+NBN
	e7VUSZdU18GLfLfuLZ5uCw39Gh+PZ+oQhuQZWB0Ulrva3fYjVd9z6LeidsxoV2zs48yRwnIOxuw
	FtrksUJeuK4n/FTvwd4URP8Lc2x8wOuzoQMn+UzmqCPEz1lx
X-Google-Smtp-Source: AGHT+IEdM86wLdPa/J6rG1pbebGy/mfNmQe+uLQUEr6OB03UsH6Ds/Qp3ZpxLVj4ahH7YgLID6TR2g==
X-Received: by 2002:a17:90b:4ad0:b0:2ff:6fc3:79c4 with SMTP id 98e67ed59e1d1-2ff7cef5cdamr34627616a91.27.1741849099153;
        Wed, 12 Mar 2025 23:58:19 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30138b5d229sm610894a91.22.2025.03.12.23.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:58:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 15:57:46 +0900
Subject: [PATCH v4 5/7] KVM: arm64: PMU: Call kvm_pmu_handle_pmcr() after
 masking PMCNTENSET_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pmc-v4-5-2c976827118c@daynix.com>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_235820_089290_8316A060 
X-CRM114-Status: UNSURE (   9.84  )
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

kvm_pmu_handle_pmcr() expects PMCNTENSET_EL0 only contains valid
counters.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 3ed8b74d9925..461c76a9cb6b 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -831,11 +831,11 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 {
 	u64 mask = kvm_pmu_valid_counter_mask(vcpu);
 
-	kvm_pmu_handle_pmcr(vcpu, kvm_vcpu_read_pmcr(vcpu));
-
 	__vcpu_sys_reg(vcpu, PMOVSSET_EL0) &= mask;
 	__vcpu_sys_reg(vcpu, PMINTENSET_EL1) &= mask;
 	__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) &= mask;
+
+	kvm_pmu_handle_pmcr(vcpu, kvm_vcpu_read_pmcr(vcpu));
 }
 
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)

-- 
2.48.1


