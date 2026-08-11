Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BB0C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8CJ6QNSqhWJGSffyTY/ffGanQulWe1yCj+00GIgVmXg=; b=tJyVdxMfNGhzWVzVF/Ct1Jysu7
	t8NAVj3UX5MzuvSCP6l1kf7GTbJg0Dgt9/IrCelB/5uq6thgaJsgeNgOrUVlkpv4W8KO26axf9TQL
	H5FsMGtXip/7661SFbhI1hA6YyXFaIlR66v9rhjLiI1X2vR2eW86Ve6oJyYdCqhYfT/n/K14q9g25
	9NpfXldInQZ+SENA/DKDjf3tD8Y1NlMFL0f7jFwfSvv7X0EOzCONsBcotl6BpajmumgY5BEFIPyyY
	dzW+TcSqYo3HeL9scqhXhSJyRO0E49BOXpfmnnK5nJWbtBppOHAhJmN6mgXN36OH6BbIVSOxYEcNN
	0w6sWz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wts80-0000000Epva-0UnN;
	Tue, 11 Aug 2026 19:27:12 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wts7x-0000000Epuw-1L5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 19:27:10 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51c08df8513so2363411cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786476428; x=1787081228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8CJ6QNSqhWJGSffyTY/ffGanQulWe1yCj+00GIgVmXg=;
        b=Rk8t4frC/TRVzLTlh+Nlc7qr3S1LT+jE/OxJ3YT0TC8eEQHJ5aoFParAGliOm2+N7C
         bgrtgrHjLpS+pCjPYlRr+u3QLJvrrHsoXd/HL9HvKWqd+0zIHXC5cmzgu+JAXFRJM+ZS
         3Z6Pmw6ricJugmdOB/8lld9dpx57U5fyorFJ3BOvFxmF7GyEh+DdF9i7nMwskAdueOIg
         CvvhOkVWxJiV+rzhe7Cfk/8FTXHTx3Eg28SK1XNiXdfT6KcX8ZvPhDIqWY5vG9KE7S5j
         a6Fnx5GR7qsPtIbZv8wzMGVAcgZZRG047vQ/Rms2h6Qc2ew4LcIk1FsGlyc/i3Dg92X8
         Of7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786476428; x=1787081228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CJ6QNSqhWJGSffyTY/ffGanQulWe1yCj+00GIgVmXg=;
        b=WorSGJmchw7wNPXIyVplWdkQ9Zpt3jWVWyL2I8ava5X2f8WihXKVQntRlYYc9ku/sB
         H9w4bREEkO2tCC7jSoyhXg2P/8o7jT4SLih5wdbmgtBlGk6eVaialjYn8UiTOZqGGGVm
         MH4/mPGE6cIcT+4CjdIKi6I8ZimTtbJcVoBLeJi3TBcGCAfMulJ60L/uwQc24ZlhZCJh
         cXOHd+m0QbUJu1aTlKp/AUUwIPU/dtdds9ujlkPlI5oulsddFQgNxzOYTNqESTSxU2+m
         QAcUkytmu6l+aou4eHgKiuwFniwIJgOipaHaeUBsK8qSdRLELhirBuj/ZOixGh8gGgHH
         XvUA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6xwA2BhSkF7YrGw5+oODVjnJPbWbHejiylTTzb/aXKJ1GH/HHKOs+R5AmWZkERh1OB4PbdvAt5GFr75J/q1Y4@lists.infradead.org
X-Gm-Message-State: AOJu0YycIIZmYoyAXWIW1O+AIR5WMATewtytxlCIKo5Cuwh0d72l6hAS
	2QtyaGUDjewX6H6BiYWM2goVEReOLOYAFXvF2B/U5YiemaRLxmK0vwKKc9YHBUxAtD1GxgDdt0I
	lhVjkJfE=
X-Gm-Gg: AR+sD10mN23E0kHqWn7A8a116nhVnZtXN/aG/LkJbM8XQUbQQ6jvyg9E2p81jWjpN94
	BZiLyCQT3elsg3Mrq1IS7l+H6jp9BHoKADE7W2+kBg3pvJT2Rkq7oUcKV53G9TKYvX8vdx8te7q
	CTyWBkOw82rV/HxjCAP8JEENdMB7yW0+w3YJ/wwNBJJc7WgbtyKQTTJehF0O0Zx3QVXp+L7btGN
	YShkvOMYW47dZSFqYtHEXXW1OWcuSqYmnqjzZ+whodOfFPyYaOZukOe4kgvfyiyEWey9I0VJ20d
	6HdN3ZIiy9Y5rd3/DS5SSJsAcwLIavpg/7Hv3wbqAj0RUuS1sTDK8utTPsMUd7qeqlH4pIeXwkh
	qCNlbWaqaRR4alT5gwjp2yl6VXA3ug4PqVblJkXv3eIlcLnYcpGHYJFiQEgnjMVizVrL+ZjoZ0L
	WurFqIcDlNESfzLgqPjLe06uEEwonRvaG5gcUR7ClZbTnnlivfiChESslnWHk2U941nXGIKLRFK
	ZY=
X-Received: by 2002:a05:622a:5592:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-52d58614af4mr54547001cf.28.1786476427825;
        Tue, 11 Aug 2026 12:27:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d61a399c8sm3228451cf.0.2026.08.11.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:27:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] net: stmmac: use dma_addr_t for DMA addresses
Date: Tue, 11 Aug 2026 14:27:02 -0500
Message-ID: <20260811192703.1765416-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_122709_370877_DC2DB2A0 
X-CRM114-Status: GOOD (  13.01  )
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

In jumbo_frm() (implemented in both "chain_mode.c" and "ring_mode.c"),
an unsigned integer local variable is used to hold the value returned
by dma_map_single().  On systems where a dma_addr_t is 64 bits, the
subsequent dma_mapping_error() check of the returned value operates
only on the low 32 bits (whose high bit won't be sign-extended).  In
this case, dma_mapping_error() would return 0 (no error) even if there
were one.

Fix this in both spots by using a dma_addr_t for the local variable.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-devicetree/20260606010122.21A211F00899@smtp.kernel.org/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index fc04a23342cfc..ec25193d287bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -20,9 +20,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
-	unsigned int bmax, buf_len, des2;
+	unsigned int bmax, buf_len;
 	unsigned int i = 1, len;
 	struct dma_desc *desc;
+	dma_addr_t des2;
 
 	desc = tx_q->dma_tx + entry;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 78fc6aa5bbe95..664d8cfb58cdc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -20,8 +20,9 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
-	unsigned int bmax, len, des2;
+	unsigned int bmax, len;
 	struct dma_desc *desc;
+	dma_addr_t des2;
 
 	if (priv->extend_desc)
 		desc = (struct dma_desc *)(tx_q->dma_etx + entry);

base-commit: 31397cf1819210bd63fa3d2c7d8c24f7c8667d99
-- 
2.53.0


