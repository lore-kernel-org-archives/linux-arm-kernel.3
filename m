Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE4710F3DF4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 19:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=; b=f/CDEkQtToDsCJHvwJYlF4SbI1
	GgXRFSiyyCUjd19AD22BaX07ZjDzKz4WyZHiJ9TvehI27nNfgjbStGzwKfg8SR1Y+s0FbfGthbx21
	uUXRWffFY3cOQQueBlfUi3ZhNESPr8f5im95dpoFsS2tCp6xkeSL3Sj4YqXD15ZXFsp8wDmzazhXK
	Wn2YKEM/Wjvp9g6YCA8AC+6Ha5ZYuTpJsLW106BWHbJTfhsGVx7Ol7RqKsUOmsKr7GNAZryf4AmF5
	afVpwFqXGKgrNXVGYpzoAmeWC9PMSamZMqZBU43puTC+H0iyIf6M/z85/Mm+/nUFqhchJ43dGu7qF
	jOBRGHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ZHw-00000009FQm-0uI2;
	Sat, 28 Mar 2026 19:25:40 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ZHp-00000009FOS-1Mhi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 19:25:34 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-126ea4e9694so3789679c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774725932; x=1775330732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=;
        b=QeuCcsTHkKyd2fE8ty8rGYl+pcMsmNnuC/caL42IcyICrIXaToL2m17COpF5n78PBx
         Zerrr5MdTU5hOevxA+n4IllbZ3I9pKOr/PCgo8H9wEzQltVjDwXosWBbtWHM/f4gHKBm
         xRSiTD9N706gWr0tLPzwGHMTukdI+MM8Nwjkhhe4ZIMe3uD2J0YPmUnYk+IdBTM/VXGx
         MYsv+oRYhV4DFtIJyxD0KjIAgQSUUZ0hRqG5luKouVN7iV/+ODha2kK4sUFb1o/qhFWY
         j4BOY9E4NRJgiTR/3OuYWAhik478z8kXofHE+0RvThAY3SkhZgdAx6joeIX8iWNCJKuZ
         ixTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725932; x=1775330732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=;
        b=cjKAyYnTI9N5b3MqXDkmD5U1lK3uEhxY8q6kfxzZZLIiwgrSRBQP68xhoNsgwBp0CN
         N8QATID81Oa0/RzcQIy15jzIxd8smybal1q4nwHQzT0Hl9VDNmfmrb6eRao8VEgBllo9
         pL6jOhPit2qURZ2KBGenB1hyidraiHeUSYZaEQSjLw7ENCGTNLiRPqEEyH99FTSFN2Lq
         CPq68EQzDC0vWgvJ+qUjcAgEdbnHVR0GMTsaFpe7lZqdU+WbeyvMKE8SuT7nOcT+SQMA
         5MLFG/5MfLCMk5DdllbrOSSV2B0/1ItuXC27WStnKb5lGpCMQGziTrFQegnj1vvSwKoX
         QiQA==
X-Forwarded-Encrypted: i=1; AJvYcCVd4yL2/KHsVmCNtEuBztl6Q55q2t54rZcBZ/OM9cHkn+ZWj9cz6DPTG8ay1vRX4LeC3yKtKfHErFkQmb1jizqj@lists.infradead.org
X-Gm-Message-State: AOJu0YxcZ9fp9ZHUdKmATIusHfuMi7Fm+MgTQrvf/AIvES2aUeKy4FYg
	VXRFa7aXMwyZZZH56RQ8mnrYbOxIU1m5k7mPI7ZR2NSO7x50pmYlouXs
X-Gm-Gg: ATEYQzyNlA1I8SwdspEYqMOmM/AW1quI1Ku39ezZMbeIQCNeAXsEDk6flLyH0T2y7Rz
	qA55AVt6/YHx2pJD1jEAgWxSe1JdrJNPCLzkBg6rAWxniN5E9zIURjdGieqpLHDf+YjKAUTneXg
	sYcVWlQdUdEZqjgki4uL/zuK4Nvp1dUwrU6+4IUKrs68/gjIXNbu7hvD/vt772nfdpykwXgdXNc
	kCcQa3OwuKJdX2FNfM+ug8dPBjGr5Dagl1X2AgyTQO6EGFDIbWVOHaWcKDG4HhgDMnbz7rGHZJg
	wDD9rbaL690m/+5q2wQc8Xm9xm1CFoMO/scXwDQ4g/hA71H7GvxIXck/Toa0ewscC98J/F1WECh
	/R3nIz6QYk2IKHY9JTmicVUHc3R7wD809j4iaBwLkpfDVj92fUidHNyOlp8CnPn/2mHrmoUuzMX
	viYGYxk0uIMeGcJg7ijZmjIwoI/4yuel45O/5SH+Ct3aOrgIluFGQIclaQ
X-Received: by 2002:a05:7022:92a:b0:11b:9b9f:426b with SMTP id a92af1059eb24-12ab28e4dd5mr4350751c88.20.1774725932423;
        Sat, 28 Mar 2026 12:25:32 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ab970da7fsm2819438c88.0.2026.03.28.12.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:25:30 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [RESEND PATCH net v3 2/2] net: stmmac: Prevent indefinite RX stall on buffer exhaustion
Date: Sat, 28 Mar 2026 12:25:03 -0700
Message-ID: <20260328192503.520689-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260328192503.520689-1-CFSworks@gmail.com>
References: <20260328192503.520689-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_122533_363421_B7C2CF26 
X-CRM114-Status: GOOD (  17.23  )
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

The stmmac driver handles interrupts in the usual NAPI way: an interrupt
arrives, the NAPI instance is scheduled and interrupts are masked, and
the actual work occurs in the NAPI polling function. Once no further
work remains, interrupts are unmasked and the NAPI instance is put to
sleep to await a future interrupt. In the receive case, the MAC only
sends the interrupt when a DMA operation completes; thus the driver must
make sure a usable RX DMA descriptor exists before expecting a future
interrupt.

The main receive loop in stmmac_rx() exits under one of 3 conditions:
1) It encounters a DMA descriptor with OWN=1, indicating that no further
   pending data exists. The MAC will use this descriptor for the next
   RX DMA operation, so the driver can expect a future interrupt.
2) It exhausts the NAPI budget. In this case, the driver doesn't know
   whether the MAC has any usable DMA descriptors. But when the driver
   consumes its full budget, that signals NAPI to keep polling, so the
   question is moot.
3) It runs out of (non-dirty) descriptors in the RX ring. In this case,
   the MAC will only have a usable descriptor if stmmac_rx_refill()
   succeeds (at least partially).

Currently, stmmac_rx() lacks any check against scenario #3 and
stmmac_rx_refill() failing: it will stop NAPI polling and unmask
interrupts to await an interrupt that will never arrive, stalling the
receive pipeline indefinitely.

Fix this by checking stmmac_rx_dirty(): it will return 0 if
stmmac_rx_refill() fully succeeded and we can safely await an interrupt.
Any nonzero value means some allocations failed, in which case we risk
dropping frames if a large traffic burst exhausts the surviving
non-dirties. Therefore, simply return the full budget (to keep polling)
until all allocations succeed.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f98b070073c0..81f764352f3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5604,6 +5604,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	int budget = limit;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5870,6 +5871,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	priv->xstats.rx_dropped += rx_dropped;
 	priv->xstats.rx_errors += rx_errors;
 
+	/* If stmmac_rx_refill() failed, keep trying until it doesn't. */
+	if (unlikely(stmmac_rx_dirty(priv, queue) > 0))
+		return budget;
+
 	return count;
 }
 
-- 
2.52.0


