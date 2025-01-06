Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED8BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tYngp+0tGgTHKQ6I1Sn7h1pVz+z67CiGfUZ8/I0y7MY=; b=Ua7Up8hgsfU0TltzpIqo4u8+HE
	mQpK19vIHFZ9TbIDnW0dgoKCSx8gpVwCIXgyVdnPK+gl3YRQ+U+ycn5LMpbEK/puUbfaZQItJvI2K
	v5iKKVaDjnBBqLXOAo6y/q++C0Fc/xRYX7raawBdkBjA8LeL0NB6ViO2WrQzDzGs0ZsZyDomIZx9H
	1rf3qAnMNjwCipNxXstEZmVx0bPv8PHodGSBc+x7IYEGG+Vl8ifZKiCYm9xRsxB69RmsG0QPvwfdZ
	1q4EB5xlT8GutbPlRrm48Iwo1cN+N5wG8yOZmuYcEt7UYnOqXS/e5+/jfiPv2einioIiOOuqDsU38
	XayPDRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgcs-00000000IjJ-1L83;
	Mon, 06 Jan 2025 06:30:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgbg-00000000IZd-46nt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 06:28:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so20239286a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 22:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736144936; x=1736749736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYngp+0tGgTHKQ6I1Sn7h1pVz+z67CiGfUZ8/I0y7MY=;
        b=jgVkq87sYQVz53iU2PHlYdQ7S5IFX7HOe8ujUJWjjX5hN6nNEAGz84arjpqV4kkL67
         geXsgp2gGIQtjOmryKII3lvE5wGJIgyBszJyKbfZAhSicU7xY7y10Fn3jrCAuM5EIkKE
         9Jsw2R8EOw13V3inhLv1VnpltyluZvwKQtrSJua93qB/XI/xDtpoG8VK43zDmFeGbl6r
         3caYVNjhx5m9T7U4dMaJIwX5MuGqacBCxK++RzqlxH4x4fQg6jlzCgCo5Cq/4rw+3CGc
         uVoo9OsMSwhf42a48AaCD7p6uz9MQSQ+eDZQBMW6qDe4jUcFAFIZXXleP6x8RpP8peCe
         oSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736144936; x=1736749736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYngp+0tGgTHKQ6I1Sn7h1pVz+z67CiGfUZ8/I0y7MY=;
        b=lWDZGGDiGiWff6ZsUTk1MRB5XmXcyEgIW1Fm17Dux2MiV1I+RY3sMxp/JyuHxVgduX
         IJcuewhs2h7STo8Wy7enIToskb9wJfT2b1XuxGc5J3C9nQKpy6EcextuHAtnVM7nVD5G
         l3PP4vGgyeLgxVwaAIi84QvXiNR45SIr3q2arIACEBcCrSOHWQCEXxIgf1UITtTBJvbJ
         s1JB3N06SCcWE9DGAfMaPazjGn2FPMYcdBsl/7Ja2PEkpyHxcwk6ydWJxZc6otjK+su/
         JgeGIrAT+zBx4jZM7/2O48akZHixuFf+Fkim3oJQFHmg12m5kSiNChEms4jd1MPPTjO1
         OAHg==
X-Forwarded-Encrypted: i=1; AJvYcCUCAOGFc/w2AMnjNu+sBHyY0LBQJJDM13s1ucifNKqRyXIMGE8dF5f8MeeDG2RtkQHUcdiAX8r0vQ0JmchmqbrN@lists.infradead.org
X-Gm-Message-State: AOJu0YwJlIvGWB1Dsb29IoFV6ZM8hAYMsjHMtwDux2kVqIltBkOSUoUw
	JTw+7zet0jORXvXfgyB96JxxEjUpNrVW2Ohm0M+aK1DGyKjQP0c/
X-Gm-Gg: ASbGncsrOAz7xPpbBi6lII2ErwQYM6r3hFjAEgzd0p3lLK1gbqY7mkmZglxcUsEpSzD
	cj6jzTZ3Z7YPPEOMzDiijfLI3dMRcfFg9D53RexQrOklIj2OEjdnvyov+GMbsN0MH9CKUirckMa
	w3oohPfEkhpedqFELYNneICA6tM9k6C8ia0KqZ6ErpP4A4LCeaszgsvr9dQrmqhAvqSYTMN/QXz
	8aI0U62iO5w1706x4AUf+XlPwZPBIfMQlwBSOwGWwI0gR02jRGtbNgXQUj82DM4Uul3PQ==
X-Google-Smtp-Source: AGHT+IGuTNnabIlYRQUcGvQBWWJUxIneQ+plJz0/THIdtZNbQlkm7E3w2PkIyku4BmKuXXI3eBVv5g==
X-Received: by 2002:a17:90a:f950:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f452d258bfmr101856874a91.0.1736144935767;
        Sun, 05 Jan 2025 22:28:55 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm38807091a91.15.2025.01.05.22.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 22:28:55 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1] net: stmmac: Unexport stmmac_rx_offset() from stmmac.h
Date: Mon,  6 Jan 2025 14:28:45 +0800
Message-Id: <20250106062845.3943846-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_222857_043771_B291F210 
X-CRM114-Status: GOOD (  12.82  )
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

stmmac_rx_offset() is referenced in stmmac_main.c only,
let's move it to stmmac_main.c.

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 8 --------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b8d631e559c0..548b28fed9b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -416,14 +416,6 @@ static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 	return !!priv->xdp_prog;
 }
 
-static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
-{
-	if (stmmac_xdp_is_enabled(priv))
-		return XDP_PACKET_HEADROOM;
-
-	return 0;
-}
-
 void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 99eaec8bac4a..37b21d2d6f4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1308,6 +1308,14 @@ static void stmmac_display_rings(struct stmmac_priv *priv,
 	stmmac_display_tx_rings(priv, dma_conf);
 }
 
+static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
+{
+	if (stmmac_xdp_is_enabled(priv))
+		return XDP_PACKET_HEADROOM;
+
+	return 0;
+}
+
 static int stmmac_set_bfsize(int mtu, int bufsize)
 {
 	int ret = bufsize;
-- 
2.34.1


