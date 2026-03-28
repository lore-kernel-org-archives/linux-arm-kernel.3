Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A53C10BA423
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sL0ml+VWm2YV7ulhW2wYXZxFABQP0IsIT5aunFSXxAc=; b=V+y1GWQfCkx9LGyDeyxQ8HpFCt
	m48T/In0NthR0X27PHkHlEMEt2thfLxr84xbWg7+S90UJzNKbT02LwxyU+haZhIellpgo0bQqn6Ne
	lcb3aqyhPt6f6jciwk3Mb4eWs0L7c0F6M+58ULGy5jVn6Hwt3+dx/r2DVGNwZSseuOcAdSk4Z/VkU
	oSUdQ2WYLrabAteKpUtoOLiqwSzmp9fJqnrGeECXvL9gzJpr2W5rYPl7ZtaK2W7AiCcd+S8wiA0jr
	rsnOBB170PeXeU8Nf8+zDuTtmDbZl7yrHM6j1RhVJV5AgrZnCHQob3MEaVBtiCqRCHFyl5b9Rm2PF
	aLLKwvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ZHj-00000009FNN-3MLV;
	Sat, 28 Mar 2026 19:25:27 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ZHg-00000009FN0-16F3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 19:25:25 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-126ea4e9694so3789460c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 12:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774725923; x=1775330723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sL0ml+VWm2YV7ulhW2wYXZxFABQP0IsIT5aunFSXxAc=;
        b=cY94GetbV/afR3ymx9SZDlpg+8qIrnVdfT10vfP7B6vyC693Z/7Da01MPJE7644Uu0
         E8FxWBLC6txU8wu4dw4BKP65kdE2v2rZFyRYvUUhveFwMnzZIeUSBdvkQDYIhnF50snp
         7yNaa9Qd4zHzCs6YMvR9b34qnTwAfYQVGgEu4k/kit9jO+SEY+iFJTAeMICIoiQxORjQ
         kRgHryHT++wr+gZbI5BMUiaxoIgjzCUMkVmoEu49VHygLdCzIZXLEeipY5k5U1SQ4Qf0
         Js0cUSVqEFXD+e7QnsqBQDCidXiOee43voEpePXym9/w1pmzqvsdjn1zMYsuoLo014lr
         aghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725923; x=1775330723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sL0ml+VWm2YV7ulhW2wYXZxFABQP0IsIT5aunFSXxAc=;
        b=pkFHBXDdnu3S0ZdYVVhP/aMUw5NWyCJLysien31OOxCYaPFxWHgj1bWVCxeQRfazME
         Yga6pVg9kKawbaCgabRIRgqxmT8fKPaH8PJl9LUVyej2K44LTRysmL+D3lDpS/Fu0E5B
         eeY8gRw+SQqBqtJc8JPTOZaEXcIkytxI2mKsMpRqwjJzrHyuRZajRfcvlHiXnIkg0kMj
         7Qw0imY9oDl9CbVDOrCJazZq0YP9LHr+xG6K2wKOGpI3cEPEUFR48AGn6EHe/0rK1OWD
         UQSatIIKRSNC5v5aGluJM1SJ/SFCQsao97ai/eHwdevAOMt/Hlv6v9FuMe3HsJGSO2Rn
         1HwA==
X-Forwarded-Encrypted: i=1; AJvYcCW36325lyZ0Ao9l5gf6TvZrzXlAaL4kOD4Ej56x5lzydJ9RUaBKT8k4ixCykrX6LBKLImmx8xJWPJfOdlKD2iPv@lists.infradead.org
X-Gm-Message-State: AOJu0YyMwIyxhEROO4Ei6/s/BD34dUwKeTEg+Hyvj5mn3CaGizIT20bN
	uOY39ZNFwD7SrkmteabZrhrPGLki7ff2b6jTp6w5/EtTOUp8b5Ztbuc+
X-Gm-Gg: ATEYQzy93HyMg2KSEM0AXTjSxpz4MA0oC7x2slr3nAfCpdaKiZ0gwVsuL+P8J0PFffU
	QWH53fUtLqA8KEqt4FURVab9/VQ33hcH8Ao+q0pWeysT4bkmFbX3YZlocaoUrSUNJ0OrkqUPZhW
	Ch+NMiJn55Jjvz/OCNVEr2tYBuYj8/P/udlbvI88HzS2HijvThQ4MJjwMMgE0VpGYrxQggJ7Nnb
	wQx+7oYf1vw/RIZKnnOAfG3KKh+STqpRbYlvQ3YImS8LOEDk5n35nL5Bdng/tYu1fhpz+A0r3ZY
	d75N7FAynZFbtpAEYk8VhlNCNzYLdFid5YnK+scSHj739c2dvmRLoHxZkyQQKA5NA+3bJWzMBSu
	5oyKItpj+uAV4imJQeqLrPz/KYt5jdYVcFob3JOmLM7Cn0v6UEbEE0UlIIBDXbL5HAvJm8i3gcv
	LHiGEW8j/quW0avLu4CDjRmye5qantyXSmcDapDJKslWUp9Odnjha9fwnL
X-Received: by 2002:a05:7022:6707:b0:119:e56b:9592 with SMTP id a92af1059eb24-12ab28e4f04mr4498030c88.23.1774725923210;
        Sat, 28 Mar 2026 12:25:23 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ab97d88c0sm3993488c88.5.2026.03.28.12.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:25:22 -0700 (PDT)
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
	Sam Edwards <CFSworks@gmail.com>
Subject: [RESEND PATCH net v3 0/2] stmmac crash/stall fixes when under memory pressure
Date: Sat, 28 Mar 2026 12:25:01 -0700
Message-ID: <20260328192503.520689-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_122524_305952_2B4AE713 
X-CRM114-Status: GOOD (  17.48  )
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

Hi netdev,

This is v3 of my series containing a pair of bugfixes for the stmmac driver's
receive pipeline. These issues occur when stmmac_rx_refill() does not (fully)
succeed, which happens more frequently when free memory is low.

The first patch closes Bugzilla bug #221010 [1], where stmmac_rx() can circle
around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
a filled descriptor (due to OWN=0), and attempt to dereference the buffer.

In testing that patch, I discovered a second issue: starvation of available RX
buffers causes the NIC to stop sending interrupts; if the driver stops polling,
it will wait indefinitely for an interrupt that will never come. (Note: the
first patch makes this issue more prominent -- mostly because it lets the
system survive long enough to exhibit it -- but doesn't *cause* it.) The second
patch addresses that problem as well.

Both patches are minimal, appropriate for stable, and designated to `net`. My
focus is on small, obviously-correct, easy-to-explain changes: I'll follow up
with another patch/series (something like [2]) for `net-next` that fixes the
ring in a more robust way.

The tx and zc paths seem to have similar low-memory bugs, to be addressed in
separate series.

Regards,
Sam

---

RESEND: Oops, my subject line didn't have `net`, so I'm resending the series to
fix that.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=221010
[2] https://lore.kernel.org/netdev/20260316021009.262358-4-CFSworks@gmail.com/

v3:
- Rebased on latest net/main
- Changed patch 2 to require that stmmac_rx_refill() *fully* succeeds before
  exiting polling, to reduce the chance of rx drops.
- DID NOT use the CIRC_SPACE() macro as suggested by Russell: I fear that the
  perspective shift (first think of the dirty descriptors as the "work" that
  refill "consumes" -- therefore the "space" is how much stmmac_rx() may loop)
  is too counterintuitive for a stable fix, but I'll do it in v4 if reviewers
  insist.
- Updated the recipients for the series, which was invalidated in v2 due to the
  `Fixes:`
v2: https://lore.kernel.org/netdev/20260319184031.8596-1-CFSworks@gmail.com/T/
- Completely rewrote the commit message of patch 1, now assuming the reader is
  generally familiar with DMA but wholly unfamiliar with the stmmac device
  (thanks Jakub!)
- Added missing `Fixes:` to patch 2
- Moved patch 2's `int budget = limit;` decl per the reverse-xmas-tree rule
- Dropped patch 3: this was a code improvement not appropriate for stable
- Generated the series with --subject-prefix='PATCH net'
v1: https://lore.kernel.org/netdev/20260316021009.262358-1-CFSworks@gmail.com/

Sam Edwards (2):
  net: stmmac: Prevent NULL deref when RX memory exhausted
  net: stmmac: Prevent indefinite RX stall on buffer exhaustion

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.52.0


