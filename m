Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0FAC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=; b=loYdQk/Oog9FaTGrGYwxj9aw8s
	J/qFhjMA8d1lYADg+NALlVT4XG+xoibCMK1ziy6uLv86j2J6qCbR7OMx3Jm9YEK4iD4RCZ3+mpcye
	aLCXLqWqjZuDs7FTufcpIXPRp7FlXFAObL7uuQq1JRhajBBVAE38EEjtsgLkTdcKqfbzhL4RnQPmO
	DavoaajW3J57DBShejBNXcNJfIviQcCn8xi2yMj/Q8pPoaOroyOjD4muYy/2VbhrkztWfkPw5SVr2
	ePiAZRUUCnEYAFSs4jl/gxKp4QQzk4FVORLWcXo8kgSFeSmQe006Nlyyh3xHPJbBBs2AG+CqTjz+E
	fjyql/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPC6-0000000FEyL-1HdM;
	Sat, 26 Sep 2026 09:59:46 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPC3-0000000FExf-2zbZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 09:59:44 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-398cb5615deso1358391a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790416782; x=1791021582; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=;
        b=SSbT78aIxiKHlzqdGmZ+KoYP95RcVdyj2MvVnbR0Rib1SE7uMg+8jJ3+gokvy9P3jd
         1KckaG+Rqn/REa+q3w/1ucA9IzpMn23qmG/i3Ik7PXKmK+5wSJg1fzBLUUXa9PNeFjW0
         jU0OzM4M6AbpRjGF2YHt+9LtKWhSA1gAPpeSwpOYisvh9E9LvMoZV+XATVuC9fDiuQl1
         LiQNBS+acyNICn4S0YqzOMx79WY2UCGWD7XEd08moyYCvZLcOaSeFgJJlewg1VjfyEAQ
         r7HHVJI37hA2TCJvunihYomZ8a3ebhFmlXJlS0GUQ7SYMMoqT8E9pacCgtpc6RASUA5g
         eD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416782; x=1791021582;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=;
        b=MEUjS2i7lxtyEGykvgDmA7sg20zSHdHr9EbknOeCDRCTISzhqBDp4uub2Ym6NjNajW
         r7GS4MvDKX81eOXI1KOROeDkq0xKJMQH8oUoO9rFH2CvpZhmiwy3hNugp48tzTRPVn0N
         7eM5ubGq0yl+sVQ1XpTi+D/6dn35QRhmzQGdX8DPVlABxAuVnTbJ46WFM47h3B0tXH16
         ft7dvbdKjUdv0s/taREBjuc1NFalo/pzxH3AgcODffYfSE3dKNKKbwdc+/aRWtrRhL3+
         cDE2Rg+1w1virS/9tw3uwWEmx437uPw7mttxyxjfqVCtffIaBT9RU9xkEie/4hZI9vgR
         1y1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzenAjvF+3La74qeJUxuKOCrwJZSc7idXlAeDkXCFh4jco+4br9AByqbif+Aj2P31AHA3pC2/QEX/gVCcfzpqmw@lists.infradead.org
X-Gm-Message-State: AFq9FYIyFf7qYwXe1UW3ZNGYfYXvzyX6idXK6z2wsU/q2hHDgZc56WaA
	zFPDRv6QaY8mj1FCgQUkrFrVo6SbX1stEGN8IwEUjvxPR3MtS8xFiWIr
X-Gm-Gg: AYBFou0tx8hUp2KQlisssGJpA6kru0dOyqDRWC2Ff303oJtjCdZBMzxhXmtrBLPr+8b
	BzP8IwnKwILBMnveFGV1x7QMFWeyxTI3HuxhD7zZwqa0MYShfCmX8e4ELOnA5lwN/5h1PevhSQp
	/8ddSGDSOJvMGLVC+TudSpI7kFFCM+ercTmx3A6cbz0k34OJqtusPbA5val1f4kMWz9FB0fr8NQ
	mGV29ISEGegm1/uRbyeBF1CNysNiiN202NzHAzQjXNJRFqE7SEdscD1n0WgjpPHrCvSAI087uMj
	hHBVGHfpm0k/iyta2SlKa9xYsLoLI0Q4SfpyTcW4KHQ+rai/C7bbc3Q0Qa005Ak709uufXdR5mG
	ZZBR0wK4lIJz0HBdmuUCrILBsETRxVbozEJK9UKBvwo3xqbkUU+o61m70Ae660XAlTqjP+NWw0F
	5MqfKrSNcHK1DTgqve0EaT/OsXlBeBTzSLgJkJXpEvd5ouKd3KkIhxSqGk8cKP2QD28tkZIMYnW
	EgHAT0tLQ==
X-Received: by 2002:a17:90b:4a45:b0:39e:1633:d29e with SMTP id 98e67ed59e1d1-3a098d43634mr7056631a91.5.1790416782257;
        Sat, 26 Sep 2026 02:59:42 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f7:25d7::3c5:1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09766210bsm15033663a91.8.2026.09.26.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:59:41 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 17:59:28 +0800
Subject: [PATCH] pmdomain: mediatek: scpsys: add MT7629 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTuxVlPAqxAXbRlkEqlkppoaw
 t2tLt/i/w2UhEnh2mwg9GblZ6o4HRqIs093Qh6rwRrrTG8dhgsuuXW2R42rfhS7bjRxOrfRkYW
 arUITl/9yuFUHr4RBfIrzb/Tg9CqYqOTj4jWTwL5/AfKwaoGGAAAA
X-Change-ID: 20260926-b4-mt7629-scpsys-88d0cf37c6e2
To: Ulf Hansson <ulfh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_025943_784079_9EFEF5E4 
X-CRM114-Status: GOOD (  12.50  )
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

MT7629 currently uses the MT7622 domain table through the device tree
fallback compatible. Attempting to power on the WB domain triggers a
warning during boot, and powering off AUDSYS times out.

Add an MT7629-specific match entry to register only ETHSYS, HIF0 and
HIF1, matching the domains exposed by the vendor driver. These occupy
the first three entries in the MT7622 domain table.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index efc8f276ffce..2b5bd8d61cb5 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -1073,6 +1073,17 @@ static const struct scp_soc_data mt7623a_data = {
 	.bus_prot_reg_update = true,
 };
 
+static const struct scp_soc_data mt7629_data = {
+	/* Reuse the MT7622 entries from ETHSYS through HIF1. */
+	.domains = scp_domain_data_mt7622,
+	.num_domains = MT7622_POWER_DOMAIN_HIF1 + 1,
+	.regs = {
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+	},
+	.bus_prot_reg_update = true,
+};
+
 static const struct scp_soc_data mt8173_data = {
 	.domains = scp_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt8173),
@@ -1105,6 +1116,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt7623a-scpsys",
 		.data = &mt7623a_data,
+	}, {
+		.compatible = "mediatek,mt7629-scpsys",
+		.data = &mt7629_data,
 	}, {
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = &mt8173_data,

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-scpsys-88d0cf37c6e2

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


