Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FFACCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTfpf08gKm82xJzh+/YgRX/EW9PYKzo9ugoBxZCUXNs=; b=FokdFLVFcZnI7d3bLy+rR550Q9
	3lgduI6ME4U5YezYA1SNd/vdMdCXd8y/x+D/wAFyKNfXAmp7tMI/wSP8czq3IAsTxI22ZOb05lz1N
	CQb6/P+DmRCgs71jmN4RKC33ISlAU21VNvvljpt29FGxG26XFJAVrBI0sfwAk+K/fa4U5yOJ8W+La
	wJI+QoE1iwQ2vJnhWWZ9Po3FEBnBLep9c5QxeyLnjpVJTR0Oe0p07HeEpI9HDmIB6v0rvPumELbe0
	GnqAqwl6djP3a4BydLm2FmCAd4V5cuFzZDVw8rjtyKDZKvZBY9lelQzGr09nnxoKI7RombGMWEOkM
	QFc9K94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNe-00000002uLe-3TrL;
	Mon, 29 Sep 2025 16:05:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNA-00000002tx0-40de
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05D0A48BD5;
	Mon, 29 Sep 2025 16:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8A3C116B1;
	Mon, 29 Sep 2025 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161907;
	bh=myl3kJcHcZU+j81WLuyOyt+RJbJ0t5SjDn5XC0asxto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ja6RLET7ZPulgjDtRzKVsBAeH0Oanr9WlhZtHrBHWSDHJgjU6AWzQKzHZT7GKHFed
	 kt/S2teyqQWKkG7jA5SS2vKT9o8A++5jIE1Hj7zLrTRcekQ2ImZa/KqFlF1sP60q86
	 omXjUJeNcOZqYnSZYYUW+OlnYF/3fwVvu2W+r+CEv1XNJ7uV7wC/kZvSrR9IT6J7xf
	 6g+G1IHqbzP9WHruY9sekPpo7Lc5cCc4p83811mmau3tfgsr1lTRC30/+KCmgNZ+WK
	 rBQX0m4xLp/8pJ7htVzKftekJj8MOAPdEFcwG6X2LNlj8rEONwb73IcCOX9+x71jlQ
	 3sPDg+BVaGNqw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN7-0000000AHqo-3bVX;
	Mon, 29 Sep 2025 16:05:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 11/13] KVM: arm64: selftests: Make dependencies on VHE-specific registers explicit
Date: Mon, 29 Sep 2025 17:04:55 +0100
Message-ID: <20250929160458.3351788-12-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090509_106085_0528482A 
X-CRM114-Status: UNSURE (   9.73  )
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

The hyp virtual timer registers only exist when VHE is present,
Similarly, VNCR_EL2 only exists when NV2 is present.

Make these dependencies explicit.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 011fad95dd021..0a4cfb368512a 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -65,6 +65,9 @@ static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(SCTLR2_EL1,	ID_AA64MMFR3_EL1, SCTLRX, IMP),
 	REG_FEAT(VDISR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
 	REG_FEAT(VSESR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
+	REG_FEAT(VNCR_EL2,	ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY),
+	REG_FEAT(CNTHV_CTL_EL2, ID_AA64MMFR1_EL1, VH, IMP),
+	REG_FEAT(CNTHV_CVAL_EL2,ID_AA64MMFR1_EL1, VH, IMP),
 };
 
 bool filter_reg(__u64 reg)
-- 
2.47.3


