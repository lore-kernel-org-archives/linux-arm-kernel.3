Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B78E7E348
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BscWtAcG2FmHfLMPQAEJmpSFHXHldAlcD3No09GWSI4=; b=nj1SywOaxCAt1E4Ozq88RO9WLD
	vyXrYYcSGCmf8pkm0HvGDTy835YHgmGgfLGgZEhh7D+Q8qOY2Z/0pP1V1Ni5dJLQ/DlVg9VW15QFL
	pHmVKkULb8P5v0gF9dCcrFUKy3dELPIhf1LaF3NqhMedHpFOswy8L+SFgdimVNrUNrj9X2bAdFYcd
	otWNKYlLecMDRVR+IC76pNQkPqvlJJf+ZRcT34IOr2ERWXyz0C2L8DwzPk0h22bQo1oRe3zK8sRk6
	CK2EAYZwUTrskcw0vesPnJIEnrZ4R2LBQ5b2yynzTGlXl/04xk70OdCLEGDVIgH4tMtJ0ey5Z2zeg
	E2IlZX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a65-00000001jK8-03TU;
	Fri, 03 Apr 2026 08:41:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a61-00000001jI2-2eIS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 516714453F;
	Fri,  3 Apr 2026 08:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D9FC4CEF7;
	Fri,  3 Apr 2026 08:41:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] firmware: arm_scmi: quirk: Simplify quirk table iteration
Date: Fri,  3 Apr 2026 10:41:30 +0200
Message-ID: <8577f4b103cf04420c3b67dcaad528daff867287.1775205358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
References: <cover.1775205358.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_014141_688023_6434A910 
X-CRM114-Status: GOOD (  11.35  )
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

The current table entry is assigned in both the init and loop
expressions of the for-statement.  Merge this into a single assignment
in the conditional expression, to simplify the code.

While at it, make the loop counter unsigned and loop-local.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/quirks.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index b1d9cd9fa2427879..2b38ba3f59a13c9e 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -258,10 +258,8 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 void scmi_quirks_initialize(void)
 {
 	struct scmi_quirk *quirk;
-	int i;
 
-	for (i = 0, quirk = scmi_quirks_table[0]; quirk;
-	     i++, quirk = scmi_quirks_table[i]) {
+	for (unsigned int i = 0; (quirk = scmi_quirks_table[i]); i++) {
 		int ret;
 
 		ret = scmi_quirk_range_parse(quirk);
-- 
2.43.0


