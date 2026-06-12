Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEFDCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mXbZalzcxo6/TsrxZQxu5oks4UtJk6D2CPv/MBaaCkM=; b=QK+IB4dZNhzrrX9X9Fa0rh8hHw
	WLMTZSJzmPPXrJH/P9kgmyRkKqv7XMcw3yORog8KwGbFIj9B+sH/x4rkG8x5KSk9RdymcpoXPVd+D
	zteVuvAMCCfZRQJ2F7vlWZZp3Did4l9j738TPR4KZaO3uuufO9TzGEKfL3mNO6GISK0EAtz802bng
	geRJ5rpKBaopavRBJkAlP3G4EyLY/m1emdC6jd30jtMNrZ1CxPXt/ML3E/4ilqJ0jFECFPQVphikR
	n1f8N76X5QYQpcgSSJ357MFKw4yiD50g20zanFx0rA+GAa2MmhILf8/tMnDUj5pbfzOnRczst5TJ3
	VeADmP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyL1-0000000AgLy-3Q9z;
	Fri, 12 Jun 2026 09:38:08 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyKx-0000000AgJu-1l2K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:38:04 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-842cd900ee0so377940b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781257082; x=1781861882; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXbZalzcxo6/TsrxZQxu5oks4UtJk6D2CPv/MBaaCkM=;
        b=k2Mn0P/uUC9ed2mETbi3bhZABZUXOdqtG+gu4dKTv0TlXGaJzHbbH4PZJEAilf622f
         xBTiUQW4Rzklw8Q8MrFzhWXU/DlRw0LESMxw/C3b7cpj6rysbaMBsLNZv/X2zD0I00XD
         uEutpbgkhlfysriPphR866zaf3BPBio7AhCcrirpGde0+C8Uebyp3O6rnTsf4t/vElX2
         ycxad0ab+tq21EbkL97pOFDc8az/zTiF9zId8SYMQ5cnVaNpz8uFM7QRcZqu0DBd97i8
         NfN4PkkWSSRL2//p6VsB/cbvZm5ZGaRqF84SicsjvmjgsriTZOmQ5hHU0uJRbhOoA04M
         WNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781257082; x=1781861882;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXbZalzcxo6/TsrxZQxu5oks4UtJk6D2CPv/MBaaCkM=;
        b=JCqvoRqTKNLcFUKSv5Qr4XbmVWdKtFS3MrZcsttaDN1iy+ZAIj/79ILjxiHkDAykRf
         rGVF1vqiH8NsPiJwNXVEX+NrOyBvQNuNoliX8QAhBkaCNRrX+pNNb2Dopdr+D56FdrJJ
         5udqsSwuLY15SwzZbsuvAZZxEwnMMPk0WVU0NvrG4t/dvr73YfnS9hsKxLmFNChhT3pz
         ab+n456Olus7FyyWLIAk88KxhEf406/+XeH+H2H0j15MoO5qF/2XAFnSBDuyZwIgM+Tg
         ZaYGqdtu2xIgNU9/gLzlwqhzVU6moG1nX7EAYDXB2uQMHnqZt2jZdZZQmpt04UlQaZ/z
         Ri7A==
X-Forwarded-Encrypted: i=1; AFNElJ9OMRWuphPHtKZyg19trcRasq6/Uubq9qNeVFPvemNEVwF2ZpdGcs9OwH6tM9yb41yBzukgpmK2lbpG+oQUXpGq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2cNMmYbPdocdoP8juR7xDppOncTuIQX+U9UE1VgN/3/1m98Sq
	vxDNexgsMnnt+r8EJSghF+6BVsnv6T8ptHHne8jLrKffLoght0E83Yf6g059G+Cd
X-Gm-Gg: Acq92OEdm6oY/yIN+bnYzX2FJ1TDzrJYv072f6tTqbJyW1UjkUo8ZSIM+0tprrKX6j+
	PoCsRTBC/y/8nV/EhBAWOM7AK1GISi+v7jNACxwWPTvfQi3fp+7AFGNJm63p/SZ7jjZZJA+uTTg
	tIYrsD5iIAztfz5p7ZkK60e/hUz3Jssj2rl1tc94/uNaduBcI+p0wD5+UDIF9xrT3MpAWzgN+XR
	KOwrj7h81asrh31EMA3AJD5BiGXvQb/D3ugQE3FUhKKukxW0MJVOWXDHoYYdEpwsLGWWsRyoQng
	2jDpVVB5n9E8tpzGnG10BmfjgQ1hpUftyTR0mfy3jEm/7GzDZretvx1HeaR9EnmTv4yzWBzvH7P
	qem/c0i4xVdq7V0/BiVRAqHywXAF3qONTRNv1fvzNWR2JBOsR6ozxRBG0W6CicPaQM2xVii8i7f
	4yrtfEdWDSA2YDfyn+
X-Received: by 2002:a05:6a00:12cd:b0:842:3801:47f with SMTP id d2e1a72fcca58-8434cec2dc3mr2271540b3a.17.1781257082521;
        Fri, 12 Jun 2026 02:38:02 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b04b6bbsm1724054b3a.56.2026.06.12.02.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:38:02 -0700 (PDT)
Message-ID: <6a2bd37a.4034e349.1b41bb.1caf@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 17:37:00 +0800
Subject: [PATCH v2] net: airoha: Fix error handling in
 airoha_ppe_flush_sram_entries()
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_023803_464796_FC585DD8 
X-CRM114-Status: GOOD (  12.17  )
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

In airoha_ppe_flush_sram_entries(), the outer "err" variable was never
updated when the inner loop variable shadowed it, causing the function
to always return 0 even when airoha_ppe_foe_commit_sram_entry() fails.

Drop the outer "err" variable and return directly on error, propagating
the error code from airoha_ppe_foe_commit_sram_entry() correctly.

Fixes: 620d7b91aadb ("net: airoha: ppe: Flush PPE SRAM table during PPE setup")
Link: https://lore.kernel.org/netdev/6a2b40e4.4dd82583.3a5c46.e52f@mx.google.com/
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6..a124f15 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1330,7 +1330,7 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 {
 	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
 	struct airoha_foe_entry *hwe = ppe->foe;
-	int i, err = 0;
+	int i;
 
 	for (i = 0; i < sram_num_entries; i++) {
 		int err;
@@ -1338,10 +1338,10 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 		memset(&hwe[i], 0, sizeof(*hwe));
 		err = airoha_ppe_foe_commit_sram_entry(ppe, i);
 		if (err)
-			break;
+			return err;
 	}
 
-	return err;
+	return 0;
 }
 
 static struct airoha_npu *airoha_ppe_npu_get(struct airoha_eth *eth)
-- 
2.51.0



