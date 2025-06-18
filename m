Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080CCC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaC2N9KHzJbhysR02ov8ibJkvDdyqhU6Kan4KMDEMvc=; b=cb7ybbbJzunJw9pm5c3WNg14r4
	rt32B215qIeNAsbfD9jI+VlrzgR03j7KxEsogNM/Tcq8Ix5tLbR8TbN6g3LsGYvzbVWOWNJ1loQUg
	fpkf5RItrmy9Ksky6cmtwQamg9YZHnpTJNvbf/V6/aOltp1IBnERyEDmhSXB1SChDl7EU+4eAytkd
	x5sSJ5j/w2B/CwwgpNP8jqep5zm1rg8L5VQBFqvuLMhJmMakzQDxZen684++GZm21AtVn/kVbO3rl
	MEU/vuGKFURBRNZK3yYfxa3ZjWb5Za54EtFiEu7dOnId/VCeMMjU64YdF7z4pUht1VRVC3pa6T8aA
	Ts+77zVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpKa-00000009dvl-2QMG;
	Wed, 18 Jun 2025 09:43:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRp7c-00000009avq-3PWZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:30:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A01151D34;
	Wed, 18 Jun 2025 02:29:59 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA2303F58B;
	Wed, 18 Jun 2025 02:30:16 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 5/8] arm64/kvm: expose MTE_STORE_ONLY feature to guest
Date: Wed, 18 Jun 2025 10:29:54 +0100
Message-Id: <20250618092957.2069907-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618092957.2069907-1-yeoreum.yun@arm.com>
References: <20250618092957.2069907-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_023020_891015_FCBB9232 
X-CRM114-Status: UNSURE (   8.70  )
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

expose MTE_STORE_ONLY feature to guest.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c8c92cb9da01..7bc99ed201eb 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1620,7 +1620,8 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		mask = ID_AA64PFR2_EL1_FPMR;
 
 		if (kvm_has_mte(vcpu->kvm))
-			mask |= ID_AA64PFR2_EL1_MTEFAR;
+			mask |= ID_AA64PFR2_EL1_MTEFAR |
+				ID_AA64PFR2_EL1_MTESTOREONLY;
 
 		val &= mask;
 		break;
@@ -2884,7 +2885,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_MTE)),
 	ID_WRITABLE(ID_AA64PFR2_EL1,
 		    ID_AA64PFR2_EL1_FPMR |
-		    ID_AA64PFR2_EL1_MTEFAR),
+		    ID_AA64PFR2_EL1_MTEFAR |
+		    ID_AA64PFR2_EL1_MTESTOREONLY),
 	ID_UNALLOCATED(4,3),
 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
 	ID_HIDDEN(ID_AA64SMFR0_EL1),
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


