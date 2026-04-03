Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE6FE7E345
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq/YTf95kGeaDjYkaSsg2oPHYjyxb8/9uACG8CKd2Wo=; b=d9PYudbr14RF8VSjXCj0VCK2Vk
	5F5LKgvIsKhSpq7DhCt7a80ntRELKiPujs4GIR5AfTsq+3HXnokuM1AGe525i+N5HCfPG0dlSUEy9
	N3c98UzDY3624VUhk220S3V+OgztUoAC/H71UnA468+izwP0iIQF+6ZioDvz7e2O0L2uxLcyi7gfQ
	P/eYqrb2nG8vi345CzwjvJerfOgYBaX56litnMCG2+AfsEOLxv015Fe4EW6Wes3+cxK+mpBF14TgB
	urzhMiJq9KD0PMeVVy7sFNKWdQlbNw+u4D7aEioLt6XzqSrS7cb8Rbe3/CEmjeRONZyluXmvoFXXN
	hK6ZxmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a62-00000001jIJ-1UNW;
	Fri, 03 Apr 2026 08:41:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8a60-00000001jHN-0OSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EEEC40D9D;
	Fri,  3 Apr 2026 08:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21C1C19423;
	Fri,  3 Apr 2026 08:41:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range parsing
Date: Fri,  3 Apr 2026 10:41:29 +0200
Message-ID: <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
References: <cover.1775205358.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_014140_152351_C419E4C3 
X-CRM114-Status: GOOD (  12.19  )
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

When a range contains only an end ("-X"), the number string is parsed
twice, as both "sep == first" and "sep != last" are true.  Fix this by
dropping the superfluous number parsing for "sep == first".

This does have a harmless functional impact for the unbounded range:
"-" is now accepted, while it was rejected before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/quirks.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 03848283c2a07b72..b1d9cd9fa2427879 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -238,16 +238,15 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 	if (sep)
 		*sep = '\0';
 
-	if (sep == first) /* -X */
-		ret = kstrtouint(first + 1, 0, &quirk->end_range);
-	else /* X OR X- OR X-y */
+	if (sep != first) /* X OR X- OR X-y */ {
 		ret = kstrtouint(first, 0, &quirk->start_range);
-	if (ret)
-		return ret;
+		if (ret)
+			return ret;
+	}
 
 	if (!sep)
 		quirk->end_range = quirk->start_range;
-	else if (sep != last) /* x-Y */
+	else if (sep != last) /* -X OR x-Y */
 		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
 
 	if (quirk->start_range > quirk->end_range)
-- 
2.43.0


