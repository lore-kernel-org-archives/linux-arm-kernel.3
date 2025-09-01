Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33B3CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0LJ4r9mMq8e3mdNbo2g6rD5aD5gZi5B+2aiqw18aFtk=; b=aIa0Ky4S0LLxUu0WjQzd24HJyl
	Aw/M4OAOJzLO9pLLfqrC6gdg+lJrhSoK421fqiVdwcasr8kZkibFAvhb0SMrnZw/l0D6BJgnM62oK
	zu0WA4XIF4w1qHGw8rvFzV65Z+P7cjHcjWdAq0veM1RqzLI5oZQXjh6O0jokkhMTdAcigC6TMMEqN
	CtBmVfdIvma5xLkGtCh0uV58J3A7pftRYaFrWsq+1mxewKwau1nWjxMhjg0f4nn3NgEHvYWi0o8oK
	oSeDLKXoZtHK5wtGod4ApetH0We3jMOFVkrKoQPj01I8PT9XZUhvgOlqVS4z2PH2ZRhBCHoq6izQf
	CDZN3NVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VZ-0000000DHBM-17EV;
	Mon, 01 Sep 2025 16:35:53 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3uz-0000000Ca0d-1CyU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:45:54 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4d1a4c157fso146665a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756730752; x=1757335552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LJ4r9mMq8e3mdNbo2g6rD5aD5gZi5B+2aiqw18aFtk=;
        b=QDaZfulo/ozE+wP2kd0Rsb8XVRuQZV0q2l4j/kcA+zAwqNDum+h3t3tEdB9AK1pFn1
         bRZV5vrmqfStBldApSzngZBi6RSYhcBcqNPh+rXyr+9UY/wmtFM0LbN32X63XCZcEjsc
         pMxhafodlKPVhWWd/CGoBObIYx/Ns7V6ux/GEBBiHQ4EkjFsN8gxWw/KXcC8ooqltJQw
         hi+S3JD3mmGm63QNF73YL7U1eKjc3/22ve//V/+8Mq8BXG44yeRfTPzn/HF3dpd0IJoX
         QTeBaxtTdl39WszewrcFXvg4Xov3tz2CzagjXGPCQL0oYkLnLHrvvcly5l8J/LT1MHVa
         DNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730752; x=1757335552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LJ4r9mMq8e3mdNbo2g6rD5aD5gZi5B+2aiqw18aFtk=;
        b=OW60/fIyZkFEcZEjEwoEDbWWljI55N24eTzGMN3kvxgzVVOABIod+wM22ECw/A3JVb
         ZuVAL96KL7u4NgoBZTcazHoU6GGDo4zWk8+QFq4YpZ/GZV1rfnIlcDVGMgg/vlYKG2y/
         a9HG58KOhzARq2wvL7ie81HqE71n7N3rDoSM5gveLlPN/1bP7wf+MD3UO4sfoFx9WLPM
         Sb1Ll60Ul+S/jnX+0+jve5M3okNYLB+uekQ9+4Y7B1ioNE6RhOmp0nLfVdfZQ2pTeMzN
         fpKTnldkMRSya4FLHvC5UW1R3NGFsvPR2udbTJ1RGUWFGDYEntdp3Wti6fuuFMypYsKU
         pdQw==
X-Forwarded-Encrypted: i=1; AJvYcCXyfaAwxf97kEgJR2mBztf7X+F+c0d6DBN3XRBainfP2SUjaR6mDYHfmURfjhh/9tCf4EF13VNBwLfXNSBYTBqp@lists.infradead.org
X-Gm-Message-State: AOJu0YxIG0FHGxhAke7BHhLmDhgPvRaNZkF2zRtmF6zLHcAaCD6Ue++t
	V0ypLKHE5eCdyEXAvSTyqrgNXIDj3yKr2xKyGRoYko9DrmCJLp2Ya527
X-Gm-Gg: ASbGncuLBIIpILcVgGJx1bSksn6achqrZkRdKPcfZlFpZGr2oCQSBfR1Rejsin1uY2A
	nlRRMXpgzPG/5Sn/3X1+wSmruslTgktCjrQAJY0qLZWAqCYOkOvF4ToUe15f2KmE0El3ALv9GDx
	CBNRbkZ8IqIocR7xfV6BdWGK2dCaFFNnnC2P1a5vb/LFz8yycCmEHEsbXFAd+xppCBBoCN9uAEr
	v+kt2hgUYY/HON7pZVnw65vb9SyWZoLTO3OPZsYsEzusRI53lZCGtI4T8Dh9PJG043PM2+kjY81
	yeZkOOuyAO3dD72dc3Qde2nsmDPNflRLyuuN4oHH1HRV1rOjnpGZbUa/lECjlIDasWjolgcl/Ks
	pSRP2WQY0p28pUZoA7t1GLA==
X-Google-Smtp-Source: AGHT+IHN71zGlOOMRyH+O5wcaJBAY1QklGt6JPB0plU5qIlkRtUqi8nYhrHaVrv2vP+4Uv8jYf4bYQ==
X-Received: by 2002:a05:6a00:928d:b0:771:eec7:a71f with SMTP id d2e1a72fcca58-77232874e8cmr5779479b3a.4.1756730752213;
        Mon, 01 Sep 2025 05:45:52 -0700 (PDT)
Received: from localhost ([114.70.121.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723d79fcfesm7553805b3a.16.2025.09.01.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:45:51 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	wlsrbwjd7232@gmail.com,
	gyutrange <wlsrbwjd643@naver.com>
Subject: [PATCH] KVM: arm64: nested: Fix VA sign extension in VNCR/TLBI paths
Date: Mon,  1 Sep 2025 21:45:20 +0900
Message-ID: <20250901124520.54259-1-wlsrbwjd7232@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054553_325910_566E4897 
X-CRM114-Status: GOOD (  11.21  )
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

Signed-off-by: gyutrange <wlsrbwjd643@naver.com>
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


