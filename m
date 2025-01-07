Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D258E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFl0rTqzMZOu13PyWwuDfrMn8Up9x5/KT5bdiFMR/Bc=; b=0joJeVHfBJRbntIZj+xb1JwxCd
	MxNSESeST24tOm5vOSQbJl/aa+rM9Qi3Qosz/LjCjbjJs8WzvvkdBmS783naOVMZI2H8icSK9Z+2d
	goExwMxbDhpbZptYVIx+Zm7negtl3YXWoiBhCHNGbjkmxE15hnGXYwNMgPAM+1yQG4XGCn+Uz7Rq2
	igAlLADkpAAf0+dbLIgEAgRqbFMF+nmul5FOh5p3cHyOApFm7mJXMXQlAlcoB06SMCSBH2/JITvmT
	Vkq6v48zCPFYmenRWZtzoowBrUuM4KNQ0+TyjVBIMbRA1OeflfCGUWKHP5R1GmkGeHWJhC8pDnelE
	K5hqeFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7t7-00000004aPJ-3AlW;
	Tue, 07 Jan 2025 11:36:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7qm-00000004Zj2-04oW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:34:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361f664af5so174651235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249658; x=1736854458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFl0rTqzMZOu13PyWwuDfrMn8Up9x5/KT5bdiFMR/Bc=;
        b=JKxUR7Q5huxCEq9VhKPN+UFiqRp3Gnz8ntSTef2o1zRk8dSZwbXik1gEXxdPjcAqLC
         tdRL9UWkJ68I1Lc0cacAsz03pcf0ZEAUOKxe+b/+CxoTWxJ3eiUHKjej2hM7OAgbUNUv
         acvkVX2UqLCf+Gsz0lCUN6I2OOvR3SD8kjVNc4dfoHGTn9tWwD2HL5LgslyrF9ZrkpZ8
         SS3Yk0NUlw+it94pZ+6PNmhH390ZsVxhcBnjymMGujDmfWeQRwxZFj+0MAlrXLSypvzh
         wkuwp4HM1pVTuXgvsmAMa4m5gmYBtAMsGdZg1H9WLkGAI2/a59UtMEq/Ua+RuwCq3KFz
         0qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249658; x=1736854458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFl0rTqzMZOu13PyWwuDfrMn8Up9x5/KT5bdiFMR/Bc=;
        b=h8hJIJK9JW2BRu1Xu3u12EuLORiQZn79x7t3Ye1CpzCnx6PTy6fW7rdFxd4RrUKmRC
         oKViEayydrkZCZqrKHxerIZEkcK0Vc+a3rFQi4onK8zrs6KYmrZrIeqm8lwubATgE4yz
         YmttQxhFVInh/tRC7RzilXmdYhgI0E3skyWd2R+pAPjg4wh5TE0XOBYsHnIEnN3iw6We
         8jAdBXpCqUtSvp1y5l/jJdmtliPAjq8cWKPfa8z6rYCDtQYmEYX6c4ehi90J/PneMyvt
         iCbU2qkE7FyLSKA11MqOs3ttgFwyDbRTNFRJom2E19xaRYwUpUJ6APp4Mm1wae0UqevD
         rmug==
X-Forwarded-Encrypted: i=1; AJvYcCXW+wwvS4rqspmaBRqTaquABv/fBvJ4sv0e3jy3eRVZbrtbqzyEjCONyU9hIh8yqERPk2rpnxK7Hmp8jGsz6gcD@lists.infradead.org
X-Gm-Message-State: AOJu0YxTVyH5A4aucen1374IR6gwD1D48evOaIU5wnvxdUDWHZD/KUxd
	Pgf3xEBXayjPzCvUV89H/Jqqgf0KjA52vOV1YS3FVxMOLQ3GG4WqMWWCwNm1zeM=
X-Gm-Gg: ASbGncuhXimX4nVweCHXOLGcz6/IT4x1OziQ+Tc3GdRHpBaVL+ibmy8afJxiYh+gGul
	3xYuKuijtPaJAF6R+BhfGxPETr8EQEl/H2Vl837TTqAEiXsscu4C28Hg28tvCEz0EQs4CpFaa2P
	5/5RDNBMW37drWrae+EKa+kF1XTz/yX0cnLQG8yWPcKesff+wH0Kj4u/zdrF++w8cAXWljTP578
	Rmdh/XnVcU76S7gviNq3iy5bIZkkbCrCnx6lDGIKDtg1PYuvDFMWZW4
X-Google-Smtp-Source: AGHT+IFAu6dRs3Zmaqru9uX4iNurUOwxinvqVpqIj4nCknFhIiufx+Adf13BSKMD96GQa9CMcfatag==
X-Received: by 2002:a05:6000:1863:b0:386:4312:53ec with SMTP id ffacd0b85a97d-38a221ea72bmr48392528f8f.17.1736249658294;
        Tue, 07 Jan 2025 03:34:18 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1acsm50299218f8f.68.2025.01.07.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:34:17 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 01/10] KVM: arm64: Drop MDSCR_EL1_DEBUG_MASK
Date: Tue,  7 Jan 2025 11:32:38 +0000
Message-Id: <20250107113252.260631-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107113252.260631-1-james.clark@linaro.org>
References: <20250107113252.260631-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033420_059764_008513AC 
X-CRM114-Status: GOOD (  10.65  )
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

From: Oliver Upton <oliver.upton@linux.dev>

Nothing is using this macro, get rid of it.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20241219224116.3941496-2-oliver.upton@linux.dev
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/debug.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index ce8886122ed3..587e9eb4372e 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -16,11 +16,6 @@
 
 #include "trace.h"
 
-/* These are the bits of MDSCR_EL1 we may manipulate */
-#define MDSCR_EL1_DEBUG_MASK	(DBG_MDSCR_SS | \
-				DBG_MDSCR_KDE | \
-				DBG_MDSCR_MDE)
-
 static DEFINE_PER_CPU(u64, mdcr_el2);
 
 /*
-- 
2.34.1


