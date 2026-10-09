Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2392FCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhKjlNMbTO0uP/eZkxb7YfCPIOitUMHa55FaD0BoXhE=; b=wXa5vZHQKxpvw0h43EIghjFZAi
	+3AqRU9dGOmuSn+aUsGTMz/arIiHeiBtXzbjb1vr5svzhTuLiCutVve1zdRrkZDDRW2cDIEZi7k1o
	O4V68DKptb8whQGvv4fALtRV3mWU2B1m7Y7AU7PYSw5F9+e2WTOJprm3KpKCNFUMhX+82T1AKNdT3
	FKZAAAgsuN3Pyaya6NDMOoiJunftQlPHHf/BLOViSN123H8CXWyMEDMnt/15RQjvpUT2TqI6rnyx1
	O3RI5lMm5xKstslXc7Ni3bWCWjRJ8jbOZO+66lGXhDoG+VqZBVnwLXrZfVKbUaHjjNaj5IfQLQrD+
	8Vlms1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7X7-00000005znJ-1unE;
	Fri, 09 Oct 2026 10:08:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7X6-00000005zlr-03Ob
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C083940DA4;
	Fri,  9 Oct 2026 10:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720EE1F00898;
	Fri,  9 Oct 2026 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540535;
	bh=XhKjlNMbTO0uP/eZkxb7YfCPIOitUMHa55FaD0BoXhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gdCh8m9dXXKFl/gO4wrhxz4vNsUAqUmoCWwjnjYu9K8XGVuUelgKUV3dLbfiveiZx
	 ANzgLmDl6kCcxta8WMdcdt6fC8LWeaN1lbmyXTXLgWkFtP1TKpW2gwI2kNWb0VajIY
	 n+OrbsjNSvT6ABUVRLsjsUqOKMLVEnYDpfWiLMM7cInG5joTF90rkYQ2eUWbZRaVjR
	 cqtE0SKdSP8QrZnfyNdwjXY1EEv4LMItJA5Pbnb+qJKR2nrRvbyt2YAgB7i5OclHYa
	 bxmIM3M56MXnGel7KCXgyWOfoHyxZ1FukuEyb0PTPYcj6+ByYXtw6OhDdikA63VSEH
	 AxEtlP0mKF/dg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 18/23] firmware/psci: Cache PSCI v0.2+ version number to avoid redundant SMCs
Date: Fri,  9 Oct 2026 11:07:29 +0100
Message-ID: <20261009100738.31288-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
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
2.56.0.385.gd3acb90ef8-goog


