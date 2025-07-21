Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFC7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgBaXSS6eoL+tzDWl4vbvLMipClDtwiPdRYN3wg5eT8=; b=FVVf3ZpZ8ahfa4H7y7pd/P5iSG
	VGbzYdHtb3ztQCcXoGQN8fFqrfUmSGNfDHh3NGhXequcyp1QO4TB6g1LpF62ScC8HsP594bV82O9f
	0YN7tf1XRHlt0Sb3jLMG84T+tmY62LC6jklkE9GyhXovYcUA5XSz2Ili/VGItqV++Z75AVjs335iX
	/ehGc+hFYEln5ph9ub2U3S+Q/hJDTn+1SZt/11E9FC33CT1s4JCeO3UgDb9EyNmdGtKHtPa8dKwtd
	mToVqcHs3L3URzdGdGRmAE+hRrhQrGiKAUzoKbLhdWcI/YOAyvPihonsRqRCez2XAX6XTMhatQZio
	ZewmSbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqzA-0000000HRLN-3p3a;
	Mon, 21 Jul 2025 13:55:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqCd-0000000HKl6-3QHP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:05:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso2518714f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103110; x=1753707910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgBaXSS6eoL+tzDWl4vbvLMipClDtwiPdRYN3wg5eT8=;
        b=QodAI4Ql+w2BjomkzmK7XY0Zg5G/0IWFMb7+nDKBq+A5ltFrVt3ZvwIpTPCCbuyWvO
         bH4wS4Vzp0iy43UngzcgD51qxOuRKumn834WCSDwy/Ae11vklUldWGZXzwEtf56Dj+sB
         A1rXC9PiQE+LOd9HVTKmkyCK16XLb69hwp9yyOZbj5QysJp+0Ji92Rb9ui4/mw6I7a8l
         faoBIc+I9CpmFu2NPvjSlDNNaVuD3/GFsMBwkq0WqIIuRerwRmFBq2boDobxpmlAvhHQ
         Y3lHBOotAOxoaguuxSGVLNo36R9GpY9NQrPnGNiV0pIX0vwxmqzIkMzHzv6XNP2whj6t
         caXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103110; x=1753707910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgBaXSS6eoL+tzDWl4vbvLMipClDtwiPdRYN3wg5eT8=;
        b=j6kCQqfvvYZ1PifWco3newct2YsOPwkyXSEH4TOXoHrt4gr24XFJN+GmOBRsVFUgB4
         26rtrP4ez+YzjO6ykG+Sy9dmfIFG9c47tciyDGYycFEoLL68ZTLRSNAuI7WMDXaRU53m
         HwbUSmHA8AVxtIheAyusZcK8WqN3vw2uFsyNQuUEE1RvCnOu5cUiBDPnsmARkQ50wD/r
         cP8PQrC9znfeebQ6i/DI227nQJr8mslGkHA8que0V3V9az7dhOxXhgsTePagkTlG8og4
         DP1V+QReUVm6PpkDkATZj6eKcfAu9emfEj60a4SEbW5gqn7uAVGXJX+KUZ6ZypdQ52Lx
         W/yg==
X-Gm-Message-State: AOJu0YzK7HAOAPCCT8jo46pYhDymESHiI2nbdkz1C3rcRtiz7Z1YBqDW
	zRSXZ0vxIrYM84kR8Z8QqTTk2M3WT9XZ6xI/Gquqpd+0Pp5uAcKAtQ+4YBdgJt/JliI=
X-Gm-Gg: ASbGncv23YUVezZx6zaTa98yns0aPBdna1nSPeWQJ0Oi3tEz2D8ADMOsTP9H1ZXxLlJ
	w+Ia+qvvlm4ewJmvCIsgpj5B6+ZrY7X2jOZoffzzmOgsqEFume70iPjRo2jpqGZl86lX+niILPk
	exYRhXb08YgAi3GZeAERx3PfNQRJuzgMNJX7EB9rKJkW8gaxyp1g4hXIJXdzA9mgS2vDINNc6Sn
	jdP8tCr8KO9UZmL7MrJ7raUwPkB6jIhHDs67pdnhcw9TVy3AjxoXhI1cxE7+auT+mCjI5XTfcvi
	1sFbYCPwKCJUZLNHwbP2gPU+6WTiM448eYi873ibVjTtO/yNNNn9VlCIxsbaMCklfluW2oAAokK
	coos2dDMtAQq5goQaAZlcG+ySKFekr54=
X-Google-Smtp-Source: AGHT+IHW55CRAG6BTroVDQBsZVUrLOllfWSe7q6H/nJVZXgEqWqhx0CeR+WIH7uAuxzefIuhCImklQ==
X-Received: by 2002:a05:6000:4704:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b60dd6aa5amr15956756f8f.17.1753103110115;
        Mon, 21 Jul 2025 06:05:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:04:55 +0100
Subject: [PATCH v5 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-1-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_060511_878643_3661F38A 
X-CRM114-Status: GOOD (  11.56  )
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

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..2e897d8a4040 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2859,11 +2859,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT

-- 
2.34.1


