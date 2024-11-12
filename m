Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8175D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SUZb9Z1/W7ca2STbTF5/tGFSoH8Cx+ksuikIOfGFMUI=; b=3Xy15dR8PHxJvAfVaX4VLcQ/gt
	VohZ1T4ts/sRkX5ertLLTyk9Cn724qVbizVY7XWHv6XnFqH59aHryP5g0IZWZnhFsoG6iZAbIiS86
	gDMfPvjlKvdgoob3p1TY8b6msyXwziAR5z3+lCCrH43dv4AGekzNBT8BCCqC5wTL1ME/Lhikf4imH
	9QctaWKN7T42nUuucTtC2ba4WwB+X2351OVR2OPgZM0buajnp4dp+N52X1HhLuk94z9/HWeB7Co1b
	TXAl/DTP+jADQVAx+8Ib2CJHrtfePLp+JL7Y3FZYd4kg4JMBvnEkbC2HzFgvfpDoSQRalEsms7cMl
	7d1RpJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApZn-00000003KCZ-3ze5;
	Tue, 12 Nov 2024 12:00:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoZd-000000038Kj-1kw4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:56:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d5aedd177so3228100f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731408999; x=1732013799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUZb9Z1/W7ca2STbTF5/tGFSoH8Cx+ksuikIOfGFMUI=;
        b=W926RWtHeaOtyuJiLhbcoE7+32PtJTE1OzBFS3XsZkb2Tz9WayO+osuJosq6vuoysp
         ZZlpbIQrtX4UTxsbFxQkbYvjo205cCJmfFsYbytTMLTRaKuAVfBt3E0JrK6bTMwyqd2Q
         kAlgubdo1EYv0DFSTBnu4sFIFU63sgNNf59bHaP1+6HJ672CCsb8WW77eEWEGK7Vek9L
         mh2bUhRgzdESysUkG7NCVucCN36pGXEF3ppdcksqZPU4b0MPs6tIZReuIbDLoV8sSGuk
         7o5hbXvGdad/Sb8BMgxF93AT9KFTl+8hhNTjba5hGvc11cQ/rN6vJO/6hlBpzQlgteHS
         WGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408999; x=1732013799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUZb9Z1/W7ca2STbTF5/tGFSoH8Cx+ksuikIOfGFMUI=;
        b=rZnWiIGXilAOIgViiH+2KvvcWIHJkpdCgPleT26lPcfisV+t4MRFtPCdqhQZZEnnHb
         O3kuhBTjpi5NvjsOepxhsynlAxz0NH74O8ItvheYxmrMXpnTLyMrBEeeGdEaVgVoh3i1
         0NTWW1M0de7Zu1FDGO17oFEf0i7assWptcnGIj7qrBxnG4XS7SPTnunzPrByZbSunBvO
         0zStVEeq9Ns0xzaGdz2i65u/Lzh963dTNEhfBpr9I+QAYkXBdEalKrvfeFN6UwmqTaPO
         hWpeAPcbBbqOqtQsNxkQWpW1EpVU9cyr1PAXk/fYTkWatrjidsjojBbVcKpFhhpPL25P
         IQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCXBIQOw6q+bGCDDcYj6otZAV7qupRSJe/mNmJMYipP4YwjIzxOshWnrhyxMlbyjL605+2VOcOokyw+V+Ll0Ygu9@lists.infradead.org
X-Gm-Message-State: AOJu0YxxPetL8zkdT6mkxb1x71W4j5h5cz7f/JmpZHtZq7zflUei51M+
	Qw/RYp139cW0rwLe4AtOH5CGnFoLaQKaHDq7caIws8XVsdsDk0CtsYLjsCjZO9k=
X-Google-Smtp-Source: AGHT+IHvq8za4ODwagi9eMCX58JHSHwa35A0vD53q9ShdqUM3Ry91k3zNmwqMO4C+mOEfDBMTSJnrw==
X-Received: by 2002:a05:6000:2a88:b0:381:f443:21bf with SMTP id ffacd0b85a97d-381f4432609mr10071022f8f.2.1731408999580;
        Tue, 12 Nov 2024 02:56:39 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970fb7sm14943629f8f.21.2024.11.12.02.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:56:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: tabba@google.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Pass on SVE mapping failures
Date: Tue, 12 Nov 2024 10:56:03 +0000
Message-Id: <20241112105604.795809-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_025641_482577_0A069B14 
X-CRM114-Status: GOOD (  11.76  )
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

This function can fail but its return value isn't passed onto the
caller. Presumably this could result in a broken state.

Fixes: 66d5b53e20a6 ("KVM: arm64: Allocate memory mapped at hyp for host sve state in pKVM")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/hyp/nvhe/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 8fec099c2775..cbdd18cd3f98 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -146,8 +146,7 @@ static int recreate_hyp_mappings(phys_addr_t phys, unsigned long size,
 			return ret;
 	}
 
-	pkvm_create_host_sve_mappings();
-	return 0;
+	return pkvm_create_host_sve_mappings();
 }
 
 static void update_nvhe_init_params(void)
-- 
2.34.1


