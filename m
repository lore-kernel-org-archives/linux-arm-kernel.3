Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC875F3D330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bO2UOIDwg7LbHLAJUvx/Ly3Rtx5QYHbhjFHT70hclSM=; b=k+3EWE0zBSiDpP
	L8CbSVH8bPaIf0xHq5XA2jVt+HouPs2Fjq1ykALyuzu6kV8tx2CfXdkJ+szV6cPT0Xm0Xq/8CgC5u
	qGtTeodfJFIWhEcPh0hn/iCyX3OrCWFkbal/ox36ZgMG+8zTDxFS/n6jcyjg1ZplTDQjjsWG0K9z6
	eFSRcToCc1VMfZqddIMS/3SNWA0GWD+0VZPUS5+VqkYI8aOQoPGBpknKXG5KdyJyxFJvw0qdPlcZs
	/6NHrNxXcY738lyay2KdG6Db3COTNLVGVW5t5NfU5dsAtWzETf1cf+GlL/Nf0HYLdBjMhCEWkiDKO
	0ZhpqVxhiUKEzaXxp+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZD-00000002CvT-2TO6;
	Thu, 05 Mar 2026 16:28:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZA-00000002CuJ-3EVL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:28:50 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439a90f194bso4327443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772728126; x=1773332926; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bO2UOIDwg7LbHLAJUvx/Ly3Rtx5QYHbhjFHT70hclSM=;
        b=ga8mHyq4lLEoxJIJu59ZW43iUfB+KtqFG8a+9szFNxYRnGvlz2bRD/PborZ8RvMFKN
         lKPZ0uOSpTtxpeOkQv/j+jvLRsZsnv8BENnGTu13YM1dILOQOeFblCjQYxtlGJ65sGPN
         INuRV/YNwORflH9ag074jw5PWxxVXXtCeTM0PQZYYFGt2jUkNB2CgCcdwURBLK2Pw2wD
         lQrcnXjkesvN1Y5Q1FESXmPDS9WxFsEBTpDAmLbXsZi/03t36xKRzZ+2VG3FYV75TU8x
         uGewxcW7nH2TeUX42l+BhuRCIpzB/O9v9FAXnfbnithF1mcJHDo04Cd35sgLxAApTpeH
         MWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728126; x=1773332926;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bO2UOIDwg7LbHLAJUvx/Ly3Rtx5QYHbhjFHT70hclSM=;
        b=vwG9FkcnZNxoZwkMyrqsYc5C+uvcc8JNjCB+63TYpj96l47/JzRHkg01dauShMXGv2
         S0etWmgKE3K8nMt0BbWEEpvRfhR1KXKuzJ7YvXh7LWFomxWQZQ4pNTlSBig884vDEE0s
         mgVw4OW8RGGCixtkHlPnnPvYek5ZJMWUwCEK7KNycFrZqz2qywhG8P8M0WHwDnknmSS1
         AAei04WbzwbV4t/ynb1+aA4gueLzvIudx65n5pZrO/4VDS0UYy2lHtEga86yVIcDdxxs
         exZMCiKKITGPpNnI2FNTOpV0bQCO3F1gn/ZoMeEOncwGAUsXmXTuZj315evVIcBslhvv
         kk0w==
X-Gm-Message-State: AOJu0Yw0b36VM+lPJDU1HmB3666DluS1CYXcdOYU9Dj79OrokPJWi1KV
	LP4u2v+2p72QEKNF6RciazeQWDF4uaMqfkfGW9EzFpyWY2ouiZu5B/P59ixahc35TsA=
X-Gm-Gg: ATEYQzxp461uBvErcWk3i8eYIlhcFjGAbDTx8dJYFV/+libi86saAOp4JdSjsGdv9Lh
	K+sgBcD0yMmRN+EA5ENIoZJ2jyK1AGpHE2BUN/zEOIAsMUKgZVi/r1ij4wlML5MoP39ynEl1Y2j
	WXcrY5l2hpWVMM4tH3U5tW994JqlKTLJp7u4zhMfmEDqTSoDjBWpAk/gwWqm19ebuk5HenSIKat
	dlbJBxWoBL1LI8NSu/7naSWfH5IjO9Gt85dUbr5+0b5PtGLWawCydWwckeKTwa7ijqRFQnU4w92
	F1yVLTThKX+3pMrMUb5hRsnEU5JfxX5nY6XF9mBwG6uIMMxOv+T1DYrjLWcwghjO7oK0KZ0/vRG
	44RnOlCA+hixQzw/nhgj81sBxvCbsllB6Nb2EvebPXAE8jzmM4ONzNokWPCz++Y4p0UvRXg5xIE
	dLe5asBsLqkv2P6h440oakM0KsiWfJCZII
X-Received: by 2002:a05:6000:2386:b0:439:bcc2:bf0a with SMTP id ffacd0b85a97d-439c7f79f3emr12042592f8f.23.1772728126496;
        Thu, 05 Mar 2026 08:28:46 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c2f8c0e7sm19596034f8f.29.2026.03.05.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:28:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/3] KVM: arm64: Read PMUVer as unsigned
Date: Thu, 05 Mar 2026 16:28:16 +0000
Message-Id: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCvqWkC/4WNQQrCMBBFr1Jm7UiSYhFX3kO6iGaajtqkTGpQS
 u5u7AVcvgf//RUSCVOCU7OCUObEMVQwuwZuow2ekF1lMMp0qlUHvNuJEj7yhPP0yiSY2Acc6Ni
 qqyPrjIO6nYUGfm/dS1955LRE+Ww3Wf/sv2LWqJHIKmu07pxT5ycHK3EfxUNfSvkCeqU9f7sAA
 AA=
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Colton Lewis <coltonlewis@google.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_082848_823843_1EC9400C 
X-CRM114-Status: UNSURE (   9.93  )
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

Fix some issues with the signedness of PMUVer and PerfMon ID fields.

I ran into the first issue when testing "ARM64 PMU Partitioning" patches
on the FVP. The second issue was only found by inspection.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Handle ID_AA64DFR0_EL1_PMUVer_IMP_DEF correctly by using
  pmuv3_implemented()
- Fix another issue with incorrect sign in cpufeature.c
- Add a commit to refactor has_pmuv3() to use pmuv3_implemented() for
  consistency
- Link to v1: https://lore.kernel.org/r/20260305-james-kvm-pmuver-sign-v1-1-eea0a2116dd0@linaro.org

---
James Clark (3):
      KVM: arm64: Read PMUVer as unsigned
      arm64: cpufeature: Make PMUVer and PerfMon unsigned
      arm64: cpufeature: Use pmuv3_implemented() function

 arch/arm/include/asm/arm_pmuv3.h |  7 +++++++
 arch/arm64/kernel/cpufeature.c   | 16 ++++------------
 arch/arm64/kvm/debug.c           |  5 ++++-
 3 files changed, 15 insertions(+), 13 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260305-james-kvm-pmuver-sign-fe830bdead2d

Best regards,
-- 
James Clark <james.clark@linaro.org>


