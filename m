Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D42CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=olATEhuJ7Rj0q51m0msTdMRcBctLQkkJ/hDbLCgUHPE=; b=za078OMc682VYtiw7Q+J3W0AYD
	tslUf2a7uwqSfW20Q09rj5KxiBiebt9CLLTXFG6NeoAhHNN4COEMSgF6GA3yY0xMm+CT58/CAi+3O
	ie9ZMS7SphHSPMr6YxEdksMMT6L+kvxdtOTj3U+RCTpZswEximXEzq/2q7Ug58hxneYCxmFVpXSaK
	1GvKId7tvSnrCyLTkLsFgq/rwMiypNr9nK7mgPkBM99zlHi04XoF2QDqPVBk/n68Duy9fTbQnJsea
	1ZIXKmitybH8Wp24L/aKymE1MR0oGr+O6Br6fIogWBpD0qmHFmgsV2t3HUKLijfQ/gEa7pSTP6IwA
	MJzRw1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8NN-0000000DT0K-25aB;
	Mon, 01 Sep 2025 17:31:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5KT-0000000Cof4-1hco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:16:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-248f2da72edso9184785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756736176; x=1757340976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=olATEhuJ7Rj0q51m0msTdMRcBctLQkkJ/hDbLCgUHPE=;
        b=EV8mCLsS4wn5TE+kW3/BJQcZC0npiEslRt5BkZJXtr2V3GrF16mLrvgYKuaFsosXXN
         fGgLIxjxEoNEgq6ifeMwkVdwJeQvqcSRpsEiuPLnHNAJn7QJYho7+xd5vbpH4arqvJpU
         Xck7Fz3W4lqnzaL0tN9Wz5eqEMYVUdOEJgeaDe4lNSGVi8wwZqdSgwzW7DWjRNCJ46Dc
         PVv+BWWO1S6e3cRaz/ASex+dgHpI9AyUon2Kp4htSMUyyqVCFf3ncyv2XWcprHNF9zQP
         IITWFYAh+uWp4vUOxnQXvkwSauPqiqCHw17+/RkQJXmtxsplN3p9J8ysEA6t7ezSKt+X
         MrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736176; x=1757340976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olATEhuJ7Rj0q51m0msTdMRcBctLQkkJ/hDbLCgUHPE=;
        b=AGRmzjCN2If3zjVwfMUGd4jcC3bmKO30snLxl7r7S4cAMxck6Cm0Ix3X7uKEypwAk9
         g1ibrYNici33L4VN9QEuSgOBzaAgcn0GL/ax7H5JG7AQG1IohEUW5uxBFwjIzxdpCJ+C
         jIwYud2J4/EeaKzYHi04OHCMv2zbyzcCBliIW2wYb+YiLyR6ZUVqWdHI8VBMN3JfZ1x+
         aYljTR672QsU63/blHlK4ZkEPBPrIh5FDRgZboM04sxhQJH4hbeNh2LYUag5BuB4sjZR
         /8UrHkwBibd0NynVhzFKufJN5CQ40oBRLTB/TWBhKYs2WXaP4r/3SIB5MaPtdnGTkfer
         zMVA==
X-Forwarded-Encrypted: i=1; AJvYcCVheWKlSGSMgRrcAReVUeo9D5Dvz6lI2hVMa9a8icUKRYhvJcLivMQMq/iD7R7EIBqxzhfeG993b7JXyqfX3LGz@lists.infradead.org
X-Gm-Message-State: AOJu0YzVfeWWaKTpfFZBywysfUbYK/0M88vADj4tbJeayGu7b+XVfOwb
	JcDtQTPWVlEF2iRPcI1XGBzcUhK5Wp21XUlr+fz6yEQ9TS60kGM1mwwuu/pLka5l
X-Gm-Gg: ASbGncsGykt3dy97Ojjx4DkSSZ0RnABNbVtGbSX0zTRM0sT8BABbOiPD0kYm70UUajR
	re+9U98gvPJhJAUoOPfFpzNV8Yg3TZZqIQ5nLZpMHljb+2YWFS0v+6jrvGPRD+MlWseVf3Ukli+
	EkdlpkqmXPCSx51LjgeM26j/+MAgge9Gq1gh8iAZqMS+LolOfSCBp+A6sdFF6oOofIiZRtSQUFs
	kDZyLf/6T1erT+YYjClWO7iyBcnQnoHlpZXXVl5XX7nOL12rbczRrJGf3jIVLNLXuIrakLTVJ7R
	X/Vzvecqev0R4mOD/oTYAbEgKCsDUK34skJD9lhYQ3YJSBlpaR+0eXDG+Vwu1PcPwW1DmkMMFO5
	DerhbMeRRH7NZxwtTRP1Q9hA=
X-Google-Smtp-Source: AGHT+IHf7G+mUAagKO2yJzD5uM1O7o4u98GK3mA53rtvl6kubMMUObA8Y6uYeXML8+HaH3iMeRvPFQ==
X-Received: by 2002:a17:902:e74f:b0:246:ed8f:c63e with SMTP id d9443c01a7336-2491be7d2a2mr85172585ad.0.1756736176486;
        Mon, 01 Sep 2025 07:16:16 -0700 (PDT)
Received: from localhost ([106.101.139.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da1b35sm106729755ad.84.2025.09.01.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 07:16:16 -0700 (PDT)
From: Gyujeong Jin <wlsrbwjd7232@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wlsrbwjd7232@gmail.com,
	gyutrange <wlsrbwjd643@naver.com>,
	stable@vger.kernel.org,
	DongHa Lee <gap-dev@example.com>,
	Daehyeon Ko <4ncient@example.com>,
	Geonha Lee <leegn4a@example.com>,
	Hyungyu Oh <dqpc_lover@example.com>,
	Jaewon Yang <r4mbb1@example.com>
Subject: [PATCH] KVM: arm64: nested: Fix VA sign extension in VNCR/TLBI paths
Date: Mon,  1 Sep 2025 23:15:51 +0900
Message-ID: <20250901141551.57981-1-wlsrbwjd7232@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_071617_449760_B40A50AC 
X-CRM114-Status: GOOD (  12.22  )
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

From: gyutrange <wlsrbwjd643@naver.com>

VNCR/TLBI VA reconstruction currently uses bit 48 as the sign bit,
but for 48-bit virtual addresses the correct sign bit is bit 47.
Using 48 can mis-canonicalize addresses in the negative half and may
cause missed invalidations.

Although VNCR_EL2 encodes other architectural fields (RESS, BADDR;
see Arm ARM D24.2.206), sign_extend64() interprets its second argument
as the index of the sign bit. Passing 48 prevents propagation of the
canonical sign bit for 48-bit VAs.

Impact:
- Incorrect canonicalization of VAs with bit47=1
- Potential stale VNCR pseudo-TLB entries after TLBI or MMU notifier
- Possible incorrect translation/permissions or DoS when combined
  with other issues

Fixes: 667304740537 ("KVM: arm64: Mask out non-VA bits from TLBI VA* on VNCR invalidation")
Cc: stable@vger.kernel.org
Reported-by: DongHa Lee <gap-dev@example.com>
Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
Reported-by: Daehyeon Ko <4ncient@example.com>
Reported-by: Geonha Lee <leegn4a@example.com>
Reported-by: Hyungyu Oh <dqpc_lover@example.com>
Reported-by: Jaewon Yang <r4mbb1@example.com>
Signed-off-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 77db81bae86f..eaa6dd9da086 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1169,7 +1169,7 @@ int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu)
 
 static u64 read_vncr_el2(struct kvm_vcpu *vcpu)
 {
-	return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 48);
+	return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 47);
 }
 
 static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
-- 
2.43.0


