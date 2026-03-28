Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F2410F3DF2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kRYmUmQ7Mq/jFHkE7dAWv8ExhZDNQBLjzCpbwIU4iH8=; b=yNswKKfk5w5LvbKSip7idY5hBu
	rLvQGkPnJMQNRYxGbmQakXMybsGFlnpdQ79pmPeHmpIjnAtagZWvSVIcOmBHjiAi18x+TGVmez76M
	BSpIQGp8sLfVfa7oU/JPmmM4G4XVlguCqnyvBWvWzGR7nWCEXrDyUGiTvaTfluA0ZGoJAg8Rhiy0W
	x8d7QWDc9Nc5wkCMyv1srn7qERpJOX09JreNpfF+jkVDt24vvpU7ACMbHjap9mj26tKerfHggxAvR
	wlBiBOJ01dpLLkZ7QLKae6IQRo68lr4e16s2BwHnZoN2HcM+BF6KoCaCHwyUF+ZjOkPE2YVyvEOrk
	9ykqPqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Z5e-00000009EHR-1hZl;
	Sat, 28 Mar 2026 19:12:58 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Z5c-00000009EH5-1RWp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 19:12:57 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1273349c56bso3927659c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 12:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774725175; x=1775329975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRYmUmQ7Mq/jFHkE7dAWv8ExhZDNQBLjzCpbwIU4iH8=;
        b=LQ7eQzM4SVCOi6NZEaTdSD0QHXpC/yTq1xCKFW0ECIsAxyzq2kTThCa5BrLm+i9xvO
         hVvnVuXn3kilJZGnEygEcLCONc0sgj23GNwOMVBbfYG0azoA8kfV39PkOGTsYXHoan0+
         xAvYGoz4tXPs0inreVBNzZ0AotT0DH6E+4GWGYSfutmx8ntGxV/BSsnDbPyOU/ynHdO0
         yVBb0VJvbZyM2oUIGdqd+7OXwE58Y/TMiiIPJmpUBhtWhf/MuroZLvT44z7ARxzR76sb
         mVgl8kH6RDHYcVyCwDeMglLyhFRxW2QEkEuw/MdaHd5luaYTP4unxdByqQuHRPoUOVxd
         bs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725175; x=1775329975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRYmUmQ7Mq/jFHkE7dAWv8ExhZDNQBLjzCpbwIU4iH8=;
        b=eNQfhSSREeHYUUaPZ2G3kvs56kMLqpAYzBR26YcTV6KBfcyCzoY4BX0pPgke9eTP6G
         6tLLdBECpuez+AOBtkZN4vdMpP5nN5RBo/2O945bat/UdwjGA9gHVqD6oBic4DeQsNK2
         CAtCwfsrXAmglNng6o7j9XfhTi8l/OXZcLNpbnQKkt+NhGj0y09iueINmc3vfgZg70nV
         PfvUevIa+bMsCqrgQXz7vGkwZD4Ix82Lf+IVSJo02yglM8dK52TATtLLfLwzdGtOYXpE
         ry+CNrbxEi2WByBAVMkHbUpyV2KM2vnOphAFVg1zAtJ1wMTo35nz6ZWbTMKUbfte2xQ3
         lEKA==
X-Forwarded-Encrypted: i=1; AJvYcCU5qmbLBFxAXEhaURiA7LOKYMQ9FfWG/rqyxVXwFPqHayUvF7qDFKREm1bQUVAs05I17FtTrC1n8HMe4Fy0lIdW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2qaqNq1iLYZgWot+F9ahZNO4ZA6V3qcScuO0ZWgx53YWAqTUw
	M3ruY6legK7f4pds1d5K1hsZSvDHpl4D41nZkJwlNGJvM4NjZBZpNvNP
X-Gm-Gg: ATEYQzwQ23YCTY3AnPCtOODFAEYV0r02JlaNVcsGZ0RH3rNOm3mjfRfHYXhYR0F7WQH
	IK2uCV7A708UlWtgVxaZQ9eJibeyVtazpG2zOxqE6eSw2wt7B/uycyOIWQfyUrw5u2S3Nj0rr9+
	LOsfk1hjKTATnmwNFdXdeLxDjrlOUUXKc3IK4/IXkjfOtH74orFV7T6+rp3PC6OfLSkJNp4Y/GG
	9Pwpgp55jWYtss4U0bjHqC/poGrU07ymYSm0s8nSnMgsgsa95y8qkX9aByT1lyVZJInYhNwpN3T
	eAQvB+aYRloRgiHUI0gqZ4IFpuQMwRkrPOAqQmFOz5TVkUycd0Cu8itWU/E01dcZiFpa6mSaN99
	WENJ4Dv5Dep7WBEyCkiSJ5MkEdQNU0citUaxYyhMKZY28wp7TXNNOJKhN1hQI/+AoMnH1rNO/mD
	yO1DBmtFRyIJNk1IUN8NEKL9KYiRjiryiXUjMmtIbUexOBFgdtA6B5gw/x
X-Received: by 2002:a05:7022:4582:b0:128:cea1:7e3b with SMTP id a92af1059eb24-12ab28e9980mr3867709c88.23.1774725174855;
        Sat, 28 Mar 2026 12:12:54 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ab97cb08csm4086782c88.3.2026.03.28.12.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:12:54 -0700 (PDT)
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
Subject: [PATCH v3 0/2] stmmac crash/stall fixes when under memory pressure
Date: Sat, 28 Mar 2026 12:12:31 -0700
Message-ID: <20260328191233.519950-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_121256_390875_5E37BF46 
X-CRM114-Status: GOOD (  17.51  )
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


