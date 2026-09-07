Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8FFC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1KlFUrFQByY5HMeuJRtMe8QamhdpHtavT/1/TB6eNY=; b=lrYEwfBtLqFAYeGoPN6pP1yZoI
	DM+8WF+bDBPJfVb2dlknHqkI1As75o2nvBBxBzfHOzkyjcg+XhPsqygPIN7HS93qlwnqK4lmrJPS4
	opojOKQQA5ztdcGpPn5bOBeAWSHz1VSrpUUyKr+S0j+qaFwToaZXYWRpJhhRCd1Jy3ezFr1Mr4gor
	ePYYxFi3/iE4eTsbzEtAVN92L031vcPUytzjsTOaMt8KP2G7gaLL3oGuveeHqiyd+Mvkxiux4KjUb
	MkZg2fr61VG+Gse3zTHL/gWb14yQcqH7AXvvS49no/Q6SgEUB61pU0ABPddtxt3X6eAvbTVddb3jI
	/7+ayC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPQ-00000007LsJ-0alq;
	Mon, 07 Sep 2026 16:41:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPE-00000007LdX-11d2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:41:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE5E1602C8;
	Mon,  7 Sep 2026 16:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1905A1F00A3A;
	Mon,  7 Sep 2026 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799275;
	bh=l1KlFUrFQByY5HMeuJRtMe8QamhdpHtavT/1/TB6eNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ks4cUze2H8K/HkyakRaX2J/XJEk4oNPa0foT0KVPO870JyklkD4Fkepd0rVYr5erv
	 bN1hQ7DGY3rRb508vdki6oZIUyHNU6T9CHyWOa3zN0tMhSPx+aJnsLlV+NvKsCOe72
	 NH7fmblAs/qhx5wOmpf6bXdNMNx8mHDG6A3AfMFQF/GboxoT99sZ6g1FLiokIksELx
	 gbBtceCZpvXhVbhgdECaWNTXqxtpvL0PRQRHFBQ0v+GB+Vl7iaYVIJFfw7pHB7is0x
	 MGw/v4Qhrr/DMYZEMuehtuyEeMygp1ksSBTOAPMx1jV1sKrMXXfS3VqgtUtHril+xu
	 YYKPqPifTqAJQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 14/19] firmware/psci: Cache PSCI v0.2+ version number to avoid redundant SMCs
Date: Mon,  7 Sep 2026 17:40:17 +0100
Message-ID: <20260907164024.17164-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Secure monitor calls to EL3 aren't necessarily cheap, so cache the
PSCI version number in memory to avoid asking firmware the same question
over and over again.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/firmware/psci/psci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..8bb3f7c37678 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -155,7 +155,12 @@ static u32 psci_0_1_get_version(void)
 
 static u32 psci_0_2_get_version(void)
 {
-	return invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
+	static u32 version;
+
+	if (unlikely(!version))
+		version = invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
+
+	return version;
 }
 
 int psci_set_osi_mode(bool enable)
-- 
2.55.0.979.g7e5102b832-goog


