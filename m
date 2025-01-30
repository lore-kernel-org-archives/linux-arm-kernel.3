Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0897C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 20:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AxR+YjSVLIjvz2qqmkKbLhZZFVeBOAUSc90bIfkXWtM=; b=qPUBea2tQneEWMSd11lyhNXiZS
	04T9uZQ9Tda8iZiC5TzeZl1eg0ncbuVa4b4uHx0WZMwsa5umP+v9yNu60Wz6WFZODK2b9F0g2mVdz
	IJ4trhAkt7URLsc6VLpNDpS68AabNe77VBYBnGlZ8hhsIbI5TkmRzuiZ+CHjfzali6YXHvMnM938S
	fmKBKAAixgrPqNVRGuAwtx7pQWtghgAqsfpz3kDOfSepXIb6ALuIL2uvOx7c6GStv0qlm2tSkshyt
	rGEGLH4nSVXmLHb4fHRI2JIsc61z6bobleGbefwhBRfLfj76YI1UT+W/aFISkZLWD9O+JeYSI8xIA
	xqRvyXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdbT1-00000009au8-3Ylc;
	Thu, 30 Jan 2025 20:48:51 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdbRh-00000009aod-3i1h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 20:47:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738270041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AxR+YjSVLIjvz2qqmkKbLhZZFVeBOAUSc90bIfkXWtM=;
	b=Eq6hiR9Rj6pWjWkJuwOYI5S5vtJoQ3y3bMWA7y26c5hGAo5FSJknV1UoyevWkL8569TiuB
	redLf9W1vYnoNlzkT7VIMRpYXeN8/sPY+OqyhmTV+8iq3TtYBl4OfOnO3RmSDhBrKYODp9
	XdXIz/qg0YLcyi6cp0z6FtYxKf35d2s=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	stable@vger.kernel.org,
	Moritz Fischer <moritzf@google.com>,
	Pedro Martelletto <martelletto@google.com>,
	Jon Masters <jonmasters@google.com>
Subject: [PATCH] arm64: Move storage of idreg overrides into mmuoff section
Date: Thu, 30 Jan 2025 12:46:15 -0800
Message-Id: <20250130204614.64621-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_124730_363345_6E7B2CE2 
X-CRM114-Status: GOOD (  10.92  )
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

There are a few places where the idreg overrides are read w/ the MMU
off, for example the VHE and hVHE checks in __finalise_el2. And while
the infrastructure gets this _mostly_ right (i.e. does the appropriate
cache maintenance), the placement of the data itself is problematic and
could share a cache line with something else.

Depending on how unforgiving an implementation's handling of mismatched
attributes is, this could lead to data corruption. In one observed case,
the system_cpucaps shared a line with arm64_sw_feature_override and the
cpucaps got nuked after entering the hyp stub...

Even though only a few overrides are read without the MMU on, just throw
the whole lot into the mmuoff section and be done with it.

Cc: stable@vger.kernel.org # v5.15+
Tested-by: Moritz Fischer <moritzf@google.com>
Tested-by: Pedro Martelletto <martelletto@google.com>
Reported-by: Jon Masters <jonmasters@google.com>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kernel/cpufeature.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d41128e37701..92506d9f90db 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -755,17 +755,20 @@ static const struct arm64_ftr_bits ftr_raz[] = {
 #define ARM64_FTR_REG(id, table)		\
 	__ARM64_FTR_REG_OVERRIDE(#id, id, table, &no_override)
 
-struct arm64_ftr_override id_aa64mmfr0_override;
-struct arm64_ftr_override id_aa64mmfr1_override;
-struct arm64_ftr_override id_aa64mmfr2_override;
-struct arm64_ftr_override id_aa64pfr0_override;
-struct arm64_ftr_override id_aa64pfr1_override;
-struct arm64_ftr_override id_aa64zfr0_override;
-struct arm64_ftr_override id_aa64smfr0_override;
-struct arm64_ftr_override id_aa64isar1_override;
-struct arm64_ftr_override id_aa64isar2_override;
-
-struct arm64_ftr_override arm64_sw_feature_override;
+#define DEFINE_FTR_OVERRIDE(name)					\
+	struct arm64_ftr_override __section(".mmuoff.data.read") name
+
+DEFINE_FTR_OVERRIDE(id_aa64mmfr0_override);
+DEFINE_FTR_OVERRIDE(id_aa64mmfr1_override);
+DEFINE_FTR_OVERRIDE(id_aa64mmfr2_override);
+DEFINE_FTR_OVERRIDE(id_aa64pfr0_override);
+DEFINE_FTR_OVERRIDE(id_aa64pfr1_override);
+DEFINE_FTR_OVERRIDE(id_aa64zfr0_override);
+DEFINE_FTR_OVERRIDE(id_aa64smfr0_override);
+DEFINE_FTR_OVERRIDE(id_aa64isar1_override);
+DEFINE_FTR_OVERRIDE(id_aa64isar2_override);
+
+DEFINE_FTR_OVERRIDE(arm64_sw_feature_override);
 
 static const struct __ftr_reg_entry {
 	u32			sys_id;

base-commit: 1dd3393696efba1598aa7692939bba99d0cffae3
-- 
2.39.5


