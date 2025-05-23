Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2CBC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 22:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/JnkXPK73+jyylcV6ryL6CGzS49ASbFWgmp+uGzB8Mk=; b=esJC8ZpiRS9gO6jYHIfsC9pYOj
	J5DwvsEDsZdgrO+RFpKFBgtKDCRovJIfO7Vh+f+In4dwouLIaL7EmDS1loIpmNB9MbQ8P6XYSMR1I
	zWWR0nbXRbdgc4hGTO1Z1Fqy4Qz11DPWSD7pU8kQmpPj197KWyddf0agk21Lu+UUvA1qIBssq36fJ
	+BGkDI+6l/P4yFhehhvXCOwoYjPl7jEMTRd88g+m0Pl83G6B1mHqldVfE1J0G3vRuDQUZUtVugStB
	UsFJsdW2kXznKmvNwxSs4i2ac/9c/LqqIwRRgc3t8YA8KTtNaJqwfPjjKoBXiMra/gncAexvOBrca
	tCl+cTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIam2-000000050OQ-3UxJ;
	Fri, 23 May 2025 22:21:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIajx-000000050Cn-47su
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 22:19:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7426c4e3d57so59954b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sima.ai; s=google; t=1748038785; x=1748643585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JnkXPK73+jyylcV6ryL6CGzS49ASbFWgmp+uGzB8Mk=;
        b=O6FytvaSamtU2m3kt0KOOvhMJ99RWhWOHFJ2RfcSST6aUMRlUVToB+YBRmtgPa4wnw
         7wJ5MxlcxoB/m0FrBOidKijTp6x9wln78XHDPOTaK9k0P5vs3kYi+hH3HpFt4YYd3J4y
         pP0wdsBNfvnC4u1HMmJdXp2MzddP9KGunPzQ72EwTHHSkoAQ6KX9kCg8x3JR+F0t39xd
         u3sWqgiVNs22AswtY9WVBVSh/fNjG+Mc88SMLoGSw13OnnWR9SChEIn9JD02BLddodqR
         UntyWirFsJKmFt1KU0LXImhyorSokhpkyI9yHJRi5OptI2An4IB7ZvKzafgAhPo+x869
         4eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748038785; x=1748643585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JnkXPK73+jyylcV6ryL6CGzS49ASbFWgmp+uGzB8Mk=;
        b=bVvoeH9RzlA/TPpGUvA3vEtJBcPHOQ+LInKGAH8/VrsR9I5jlq8niatsCs/Jcd0ZSY
         C2/o6pyPSLCqLU0rSTh8LCj+n/I58PVfhozsIts/CxbgHWZsQrDt9T/1nxGT2KNopLyq
         iXfVnK+MoVwNS1k2DAP+0iLpfUeH6+rMx6czvMRC75GDqfkbgyDk8/RaVnORCKJi/aJj
         THj2hmjdSDVzZx00N/51SDPEh327pXzQxw9ZvKntAM7nnvjETPZumSvesriZvUM0UR4P
         toMCIdCpNm2Bg7BwokhAQpc25zjwJ9apnWSSYqPZydm7TttYQn/WKw/eRk5LC5WiRKEu
         qmqw==
X-Forwarded-Encrypted: i=1; AJvYcCWWtyUgMlTFOav9b4vBlrdMDgAPyjYbt8OaweWFTv56cyhACo5CFeAN/2SHMe+bv5f0FuGoa8s4TfkY9k+XhmwN@lists.infradead.org
X-Gm-Message-State: AOJu0YzTMHBMYmxz8FC4ITs1+JxTbJHcIejXvyu4KIpbTbFwpIjniAw0
	aUQ/HOT9zzOPQqjyo8GOLN+N05FX224GCD5hAYPtXc1XHWSLZLg+qCiycGozlumSzE8=
X-Gm-Gg: ASbGnctpo1ULnIvyEBnvSXDxOMk/TQ1rALxLm2JJWY282/S+PBeTF5i5t5sa8RCMBn1
	rg2LO76KghPxyziYRzEedEsfyELARRQxS+1I5xO8g/HnrMAS+nFnKcSHqslhpRO3b0lYX2z3l/u
	1En2IsSxF8AYfsB4ApfFAJ6cFYGBwV/4Q4qa2xnvxfmyyBKyLrnT0XiifLP9KIOxrhrlp8TK3pE
	RXH4pKEFvOyM0+cPsAxwXsE68MkshOGE0kS2f4CCD0xmt8XEXCdWCPi1W0Q0Jiwk513VWpHf4D0
	zEgF/X+beJoutWMP19HvV8lTxwWpvRfPkoGK2JaxIPuP8UmfaqudnhiPYGJR/98LkLIttA==
X-Google-Smtp-Source: AGHT+IH4iorXbLRI5th5BQNEszM355fKXRMdiHktjuRWLWFcJzliHo+SpZz99EM6pMvifOreU1FWMQ==
X-Received: by 2002:a05:6a00:8083:b0:730:915c:b77 with SMTP id d2e1a72fcca58-745fde77910mr655216b3a.1.1748038784743;
        Fri, 23 May 2025 15:19:44 -0700 (PDT)
Received: from nikunj-kela-u22.eng.sima.ai ([205.234.21.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfa2fsm13309759b3a.2.2025.05.23.15.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 15:19:44 -0700 (PDT)
From: Nikunj Kela <nikunj.kela@sima.ai>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk,
	0x1207@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nikunj Kela <nikunj.kela@sima.ai>
Subject: [PATCH] net: stmmac: set multicast filter to zero if feature is unsupported
Date: Fri, 23 May 2025 15:19:38 -0700
Message-Id: <20250523221938.2980773-1-nikunj.kela@sima.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_151946_048947_AFE1B1EE 
X-CRM114-Status: GOOD (  11.93  )
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

Hash based multicast filtering is an optional feature. Currently,
driver overrides the value of multicast_filter_bins based on the hash
table size. If the feature is not supported, hash table size reads 0
however the value of multicast_filter_bins remains set to default
HASH_TABLE_SIZE which is incorrect. Let's override it to 0 if the
feature is unsupported.

Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 085c09039af4..ccea9f811a05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7241,6 +7241,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 					(BIT(priv->dma_cap.hash_tb_sz) << 5);
 			priv->hw->mcast_bits_log2 =
 					ilog2(priv->hw->multicast_filter_bins);
+		} else {
+			priv->hw->multicast_filter_bins = 0;
+			priv->hw->mcast_bits_log2 = 0;
 		}
 
 		/* TXCOE doesn't work in thresh DMA mode */
-- 
2.34.1


