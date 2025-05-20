Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1EEC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Gu7fSXqVz6YXitjQqcMz8WKZlHClHLtMRV+5If/JFQ=; b=tk+t/oIp2hCNxNMcdZ9ucvmYfP
	4bfcWr5PSNpKTvcuDItEULTYg3IV4gXsw7LeigrN1X18Dd6ovqdrEGqI/TYqnMQL0DdlzLXLWc7aV
	KCbmagtjFU2M+L+BjywPQyzqI5xfqxYweSXGHwVP1j99nCsfy/izhupzNsj666/78rU0/nutPCTkg
	soTilSdqotqSXiOF9Ce0Cst+3jQeDf7hBdEeiENteWsxcl+6HmcTxTPpmes2Cp1z2biQhtiwDC8g4
	NkPPxz5htob8ogOCLQvCxzrKemASIJyujEl5Hu9pvLLZZVkF+TfviVei3qxMnvqe4lYEa4GdrZTqu
	NbtvTQqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQYJ-0000000DeqE-3W0j;
	Tue, 20 May 2025 17:14:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQU3-0000000DeO5-3Sdx;
	Tue, 20 May 2025 17:10:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 370541516;
	Tue, 20 May 2025 10:10:16 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CB553F5A1;
	Tue, 20 May 2025 10:10:28 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: ulf.hansson@linaro.org,
	heiko@sntech.de,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com
Cc: linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] firmware: smccc: Stub out get_conduit()
Date: Tue, 20 May 2025 18:10:16 +0100
Message-Id: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_101031_926130_DAD9C192 
X-CRM114-Status: UNSURE (   6.88  )
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

Various callers use arm_smccc_1_1_get_conduit() to guard their
arm_smccc_smc() calls - since the latter is already stubbed out to
support optional usage in !HAVE_ARM_SMCCC configs, do the equivalent
for the former as well to make life easier.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 include/linux/arm-smccc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index a3863da1510e..97dc4d47c664 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -315,7 +315,14 @@ enum arm_smccc_conduit {
  *
  * When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE.
  */
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
 enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void);
+#else
+static inline enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void)
+{
+	return SMCCC_CONDUIT_NONE;
+}
+#endif
 
 /**
  * arm_smccc_get_version()
-- 
2.39.2.101.g768bb238c484.dirty


