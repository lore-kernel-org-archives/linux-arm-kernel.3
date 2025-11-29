Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70948D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLFiJTr/PkVr7rHKO2KwNJ/IBM0wSXjgLNXeCzLoIec=; b=DpW9e+Ojkglw6Yn+cDaEnfp5LV
	xBFMR6uC3Ib+X/gbL9Um1+JNilD2h7OW1D70QkBqRLiU1OI3T/wzok+xo81zhJjeGjBRSTlTCZNK6
	wj+oh2gdzvP/lzSaKK6UX+JxRM0urJmQ1T2gSXGWHdRW81fWwNa6ywetC2kpfOjTdptmb/emgXWU+
	d/gau0JnDYhnGHtQImkrRtrqm4nSMp2M29kSTK+IZryArCafFUD/eZV+O5GD0fNmNe7swh0eQyjN9
	Cp8HRtxByhpQobJHkgoBVvg5Lx1rwFNYJnqMwo4PDk1peKb5DKJ8sOOfXzjZ1QircvHPTGDSguyCS
	AAdxIKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPMCc-00000001bfC-0MRx;
	Sat, 29 Nov 2025 14:45:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPMCa-00000001beS-0Mfs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 14:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BC6060120;
	Sat, 29 Nov 2025 14:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C086C113D0;
	Sat, 29 Nov 2025 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764427530;
	bh=J8YgpBDKoIkE30i8e29RJl8Adbc8Y+aT9MBBTzbD6IU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5yIymrvlmrVZV10Kyo9oayMygRW0E5mnnRK13jq4+/1dlZaKWyhRghI6fcQF1AUh
	 gIg70MuCIQXTFu48m61Iu4UQzzuklOVsdvjttpsHFr5h9+zACeGEKgr8EE3u35qsuV
	 RwGhNeRVYqxXaXfZQJKelZyG4atkiLifG4OJToXb9dxMfux6OQPeuSnfK6hErz3LDx
	 xF2eDDrL/oycQAR0Mpiu3IF9S8kQOAnjRUiyWi23d0Lgbhd8ifRMy9syzqEjtNqWv0
	 ccDx0jUjvgjVGAR9B5+0bs5yBxVqyU+yOkIMujGSYIsdx6UseN7OHZCZjXrcTzDT5L
	 aE8NNQfziCHng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vPMCW-00000009HnQ-26an;
	Sat, 29 Nov 2025 14:45:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH 1/4] arm64: Convert ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 to UnsignedEnum
Date: Sat, 29 Nov 2025 14:45:22 +0000
Message-ID: <20251129144525.2609207-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251129144525.2609207-1-maz@kernel.org>
References: <20251129144525.2609207-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 are currently represented as unordered
enumerations. However, the architecture treats them as Unsigned,
as hinted to by the MRS data:

(FEAT_S2TGran4K <=> (((UInt(ID_AA64MMFR0_EL1.TGran4_2) == 0) &&
		       FEAT_TGran4K) ||
		     (UInt(ID_AA64MMFR0_EL1.TGran4_2) >= 2))))

and similar descriptions exist for 16 and 64k.

This is also confirmed by D24.1.3.3 ("Alternative ID scheme used for
ID_AA64MMFR0_EL1 stage 2 granule sizes") in the L.b revision of
the ARM ARM.

Turn these fields into UnsignedEnum so that we can use the above
description more or less literally.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1c6cdf9d54bba..9d388f87d9a13 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2098,18 +2098,18 @@ UnsignedEnum	47:44	EXS
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Enum	43:40	TGRAN4_2
+UnsignedEnum	43:40	TGRAN4_2
 	0b0000	TGRAN4
 	0b0001	NI
 	0b0010	IMP
 	0b0011	52_BIT
 EndEnum
-Enum	39:36	TGRAN64_2
+UnsignedEnum	39:36	TGRAN64_2
 	0b0000	TGRAN64
 	0b0001	NI
 	0b0010	IMP
 EndEnum
-Enum	35:32	TGRAN16_2
+UnsignedEnum	35:32	TGRAN16_2
 	0b0000	TGRAN16
 	0b0001	NI
 	0b0010	IMP
-- 
2.47.3


