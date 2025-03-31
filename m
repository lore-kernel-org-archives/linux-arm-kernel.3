Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794ECC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XsAGRyWXlsCCSCYWQ6bHWQzVmNAffE9jxkExONXDaSk=; b=jtsaGrJrWRRAao+A2wGggHwvNs
	nVz6m1h4iyZ49mq4BvXM+S4wP7663yB8TeWqbw9puktE5+ughPXEK24wG5/W68WDdMq+DV/XRTYS7
	S2ZflmX7s/GwnBXV8/pVPCRwcTkfbiBKR7xotbfq7DZUysXn/Dkey95r+zOTHu54h8H8fCroUu6ka
	7XgHS4A/TLwubf8RZihnd0UTnfh7PFDmghU8SL3y0ms376qi8gjw7hjCm08OFoJNVbm5HZCVgU60E
	bKdJDY1i/jt0ebXRkFR1oRzO6eDr1FRWh1YnDdsgka62nxBt+TNTZOzkEkC4eEQhQwj6y4M+Qy8K9
	k6hkqh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHMd-00000000t1z-3KR7;
	Mon, 31 Mar 2025 15:47:51 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHFJ-00000000qoH-3I7E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 15:40:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2264aefc45dso116162865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435617; x=1744040417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsAGRyWXlsCCSCYWQ6bHWQzVmNAffE9jxkExONXDaSk=;
        b=a3UT6bSCi7d4EwHdFrLqasTPOiMS5d12nc+ScCjeWq7YMvz0cDwr+t2BmJgRlHYJbG
         k+M77pG92PwjXiT8Sj4OWYv7Fn+Kpu9TOT8nLMctCpJmAiCAeLXIiam1KhrzCvg5cC4M
         mqNwk1JODZQnviLVAzUJaIb/KCSVOQGA4aSHd8Cw0krHgWXXcS+EXa1pwNv8R2/ZsLyx
         MDnz3J3lAJGJdiDTixQXhnvz3/e5fUdSQFnoCoZ+H7PQ6eFTC05hnKvBU4Pga45Z8cwE
         hDXpfa17P/iIyuhboBQMaXZBNSkcjgA701Gt0ZxC1Tz/gyz+AnSUXUTYMM7jmNQKxW3v
         lMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435617; x=1744040417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsAGRyWXlsCCSCYWQ6bHWQzVmNAffE9jxkExONXDaSk=;
        b=d+pRv8Ktb0ff3MYbw+mmXnorFRCGq+XP0zlTQ86wZzZo5PrYGV/D9kOSg2oqDKwFLx
         DaFWMAc8QaLDYU7iwxHTrX5+qfLsJ954sbwHJRRdIWf4q9THHf07Fw7Q8KJaGCn9NHVn
         AmyWfWJxKAjn0drW4qTWQsjiPUtVDlA0sTtCaIq0Pwj4PT/xbJya09dINsFxE5r4EJMP
         SB3JJzkLVFRUhQSosfubsOQvfVXOmOgSfjb7WZF6/TZ+Oc5mx8ONO6HR/rd8LlUKhusV
         DlNfMZRnlETki85WDIOH7nmdfvIzYoRNaXf9KvdoTaekS9QKabbAba1R+pT1MSLiJk1h
         sDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyPLeMGGceEDAQK1Kq1jxeLmtiMcB0do5phi/cXgO3xWAvBL5GxgC5y5lIb7PFkcc1UczYYFfHDUnP479KZaC3@lists.infradead.org
X-Gm-Message-State: AOJu0YyvUm8AS5TO4epZn9+u0oNciTGr3xb6CNO4NGPXNMhFGQfsOa6O
	HPREuQJHFVKRd1AsUPigzNdMgqNj63CwrKGBwQoP+Ste9bFM4Ktj
X-Gm-Gg: ASbGncuDBTZ3ZXLJoLk7eqDChNcVR+/T6cbUnhUDJ/94Gmjr3owt3IL+SFA5r+vw/zJ
	+hp9+Ea8fCqP0p0I7xnhxbJvv5MFQAs8NL+sLPPDNIR6PQsrlp+6BP6qv0iUW3fLt9zE9Adj2+E
	IuwbIua/7RIu2efNZroDuNvDpHu6YEpy6CMAPh9c4IyFpHXRp46Z0r7aG+dE03WV+hIxRZ7Yo5L
	H2sTbH4h2wRzFqhtPVbjIGQLgEAE+UBT5ehxsmne2OpTbQXobw+6NFHJf4RdqPOxiDHlGT5UyU8
	hywBtoaiYtZCfezEUOKlbx2meupOgLhlv5gF+DqJ2UkjmGkPZG/pSAn5yIOHwtvS62K+6WE=
X-Google-Smtp-Source: AGHT+IHSO1Ey1kpUT8XPplPoBZfv20w+evu2v0hemvn7yrxYUmFkPgnracA41hSVN0cDgqnpaIbOJg==
X-Received: by 2002:a17:903:1a05:b0:223:619e:71da with SMTP id d9443c01a7336-2292fa1acb2mr167510495ad.49.1743435616821;
        Mon, 31 Mar 2025 08:40:16 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2293648e525sm44573135ad.32.2025.03.31.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:40:16 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	bsdhenrymartin@gmail.com,
	gsomlo@gmail.com,
	arnd@arndb.de,
	u.kleine-koenig@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Mon, 31 Mar 2025 23:40:02 +0800
Message-Id: <20250331154002.14128-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_084017_820279_C993CD0A 
X-CRM114-Status: GOOD (  12.35  )
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

devm_kasprintf() returns NULL if memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, leading to a NULL
pointer dereference.

The corrected code adds error checking and optimizes resource release logic
to ensure no memory or kernel resources are leaked in case of failure.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: The enhanced code introduces proper error handling and
improves resource cleanup mechanisms to prevent memory or kernel
resource leaks during failure scenarios.
V1 -> V2: Removed blank line between tags.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..b79365a34baa 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,11 +200,16 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name) {
+		rc = -ENOMEM;
+		goto err_free_fifo;
+	}
+
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
 	if (rc)
-		return rc;
+		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
@@ -221,7 +226,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		hicrb_en = HICRB_ENSNP1D;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err_misc_deregister;
 	}
 
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -232,6 +238,12 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				hicrb_en, hicrb_en);
 
 	return rc;
+
+err_misc_deregister:
+	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+err_free_fifo:
+	kfifo_free(&lpc_snoop->chan[channel].fifo);
+	return rc;
 }
 
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-- 
2.34.1


