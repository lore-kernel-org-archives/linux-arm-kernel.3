Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9059DCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dVA3vBrK0gehsaJDlrDCf+J85y55CGbA83KA248s5yk=; b=igInyVpFmReMSLABOC9be9CYTH
	UBkk/8mxNQCHFjtdL1maB2nigmlxjj4dQ80j66OnLCi0RJkp/JbWxrq5K8srRq6b7P7ZDbYTR+Ug8
	FQM7rehh7mxmmZGMdiyNMMmw1aepPwo0FUzBMxEw1+E8xs9hmYxizEYBCZon6PaFvv+Az+7YWMh4/
	iHSOEAbeRCHqznbFySyUpnyimK5VyTvkhSEIX7w0T/j3a5E7+sulRYqU2wlrZ3009iFQLhHqCFFKj
	kyEN3LSlOyVuzvUkTikGoaZX6g7AR8G14wXmPiZbyUsw/50vyYPRBYI4YQh3tmagCNTng8DQh/Lkl
	9WiUeOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd6l-00000002JHh-2jev;
	Fri, 16 Oct 2026 08:16:07 +0000
Received: from out-145.mta1.migadu.com ([95.215.58.145] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd6i-00000002JG9-2zgx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:16:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TZE6sUf/S8FoDtbPPweh9nK7pgeHraoLy/S4W8tvQQk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792138562; v=1; x=1792743362;
 b=sNwThq5T7I2TpNa1qI2/dNmu6gKPuMKQRqw6+wN2DQuRobDHWFQTRVQNIRkOSGzyzhqlRtt4
 7heu+1Yif/cKa1MQQbfyeM1vCtrkXOhFlQxsS2TyWGbUEXtY0iUnXBg9xtj6Da7y3h2iA1CwlZd
 bvL3ELzPHIinfe/9bVY1a3Ok=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a7304d26f9b833f3;
	Fri, 16 Oct 2026 08:16:02 +0000
X-Mizu-Trace-ID: a7304d26f9b833f3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Set HCR_EL2.BSU to Inner Shareable for guests
Date: Fri, 16 Oct 2026 09:15:58 +0100
Message-Id: <20261016081558.805411-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_011604_975147_43AE3BAA 
X-CRM114-Status: GOOD (  11.02  )
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

KVM sets HCR_EL2.BSU to Inner Shareable for guests, so that a guest's
barriers cover the TLB and I-cache invalidations that HCR_EL2.FB
broadcasts. However, since HCR_BSU_IS became an alias of the generated
HCR_EL2_BSU_IS, it is the unshifted field value 0b01, which sets bit
0 (VM, already set) and leaves BSU at 0b00. A guest's DSB NSH is then
not required to wait for a broadcast TLBI to complete on other CPUs.

Build the field with SYS_FIELD_PREP_ENUM().

Fixes: d0f39259eff4 ("arm64: sysreg: Add layout for HCR_EL2")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Found while testing Marc's HCR cleanup [1]. Its patch 1 carries this
line over as HCR_EL2_BSU_IS, so on top of this fix that hunk would
keep SYS_FIELD_PREP_ENUM() instead. I can also rebase this on top of
the series if that's easier.

[1] https://lore.kernel.org/r/20261015173605.1072963-1-maz@kernel.org

 arch/arm64/include/asm/kvm_arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 4bfbd827c5aa7..b3e9dd302730e 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -98,7 +98,7 @@
  * TID1:	Trap REVIDR_EL1, AIDR_EL1, and SMIDR_EL1
  */
 #define HCR_GUEST_FLAGS (HCR_TSC | HCR_TSW | HCR_TWE | HCR_TWI | HCR_VM | \
-			 HCR_BSU_IS | HCR_FB | HCR_TACR | \
+			 SYS_FIELD_PREP_ENUM(HCR_EL2, BSU, IS) | HCR_EL2_FB | HCR_EL2_TACR | \
 			 HCR_AMO | HCR_SWIO | HCR_TIDCP | HCR_RW | HCR_TLOR | \
 			 HCR_FMO | HCR_IMO | HCR_PTW | HCR_TID3 | HCR_TID1)
 #define HCR_HOST_NVHE_FLAGS (HCR_RW | HCR_API | HCR_APK)
-- 
2.39.5


