Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCBB10F9305
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dFONURkaqW7NTmmG72z2KFu2mOMfbPaei0blX1R+FTo=; b=pE3g/u823DWR6Lc1BVU3d0AMis
	LPobBXDLgeWaoUKb/GBlEXWdfg+d2bpKGa/YAj8EyMFcT6ZBXycxfhKueLc66vzbeDRs/65B3eBOt
	gNRdMBQOa1h9F4Qn4IvO81+Wx9C0kXsyl+i9lX/kMcileB0FigcZ7ZnoHlYA+z8AoZIyQQf/V4ww5
	JrF3E2Lz+6XMGqddIwOkfCjae/WGv8vX4EdCSlcMtyyN341IC5tCGnb+XcV6U4k9iwygS/dqHobsL
	rwhNAvDUlpAOW7SJQCh0N+V/1WIwPewbH93BYLC713AqzEJszYeOZsO50cPoKVQpkv94AzEkleLwl
	thFJv/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3N-0000000DwHS-01ZJ;
	Wed, 01 Apr 2026 04:19:41 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3J-0000000DwH4-2chq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:19:39 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d7f09aa39fso7883148a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775017176; x=1775621976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dFONURkaqW7NTmmG72z2KFu2mOMfbPaei0blX1R+FTo=;
        b=WihKuznSp57rVYgF3xDgLOM/h7F/M6YenBmevYmGgs3KWd5Olya76m4D2UrQ+gEoS7
         MQZlgIbmv9RYxiBbklPMaEaO1k52TSB27cUyaKc1+NR4m2bJjUzPwOGUrkvhQF25wQUY
         VlVjQ4dmIQIuPqBu0+K5epI0Vz7nozxIot5M2AyG5Ztr9CBGNLcZEIhGzOI5FGp5JKjl
         +jpYkuBYsM2jBCTfuX3P1k23JNI1phSlpNvu1iEh4gzf8R8JQPBZXGLkEFGgPeiluE+G
         bLDD9Ew0QrhWmNRqTwgbRDhOW/vUmG5JCT75wglDB9FUEoz4IZT0WGcSGfMH3BzWXgH6
         7doQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775017176; x=1775621976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFONURkaqW7NTmmG72z2KFu2mOMfbPaei0blX1R+FTo=;
        b=hiW890JrufK/zfhYtlFiYjHV14xMfpJ5rUMonrtzkDk6oo/8E5ZOi2dvIMd4wCU8AN
         1JZTRVEJRPeTu1ncispc5t73E47GbZurY/OQYeYiEQrnZQk1uu4YTOvP2chNBpP9wscn
         oGIQd3RQ8jh4Ln6uZNIsQXoT4u49SiiN47jJVXy0+8EVwXCrn3Gag0kn5LMqvfvSY54D
         Z/ajBbwwo1T9h0D2ORYlnWePVWDvULaRImuMaaUqNKKb3mIFTBngtDGxONTxZWyuJF/H
         MMcdpx9Qr8oh/eO4r8lp1MH8AOe/cfomwoHQVs5iI3+MM6U9ctkyDXDG6X3mtIzxRWpp
         mtiA==
X-Forwarded-Encrypted: i=1; AJvYcCUfLiKO7CFILMrpPAYiTSmH6sU9zIZBVy7tnuYrrESMXSa0wWfqsxP+f3tCOtPKaplhnXytfVyNg0eWluXqIY5H@lists.infradead.org
X-Gm-Message-State: AOJu0YziEKYB5E3nCiioxWL27XXIreuxPijM7KGR4M8YLI4ZkNbGOdMP
	naDpAJ2Iqo1WcMBoBjb3G2/UJxCWYoLzIALkF6X+x06FWObwzOhvA1Id
X-Gm-Gg: ATEYQzwx8IBDUfMl/YNEZlZk6CkZdEESpeRAdhYTreyL+XvRBy1US8iHgga3BqBe4Yk
	ni9/msJPur+WQgS0q+ew5HGw5jO9hxUXa4FtN5AjcjQDpOPDIKO5gvASf4SDX0vLbOdoflWba43
	EL5bLAWkw3UwliPrI6yWfUI4fyTnQ+c1vfZY1d3hh/WPa0eIdpV6o8VQFatl6xcRt8Dzx6TquVz
	VyTV9PBn1/vDgZq2STfunxEVpYv6DUxlAYxiNsVbI2yF5kaNODElvGnYdImg8tJIwRSVTE31M8I
	d2uCQBmTD/bDW62SZwDUdPJgm8h8nJOCl5g29plw6c7+ldjo0aGB4NdeKPVXz8N8Z+69rK6Lc06
	B7ujK9rOChs39ulblXenteN7xA5UzV2ahRPxXuRWicCFy1xxU7I5N6HjnTqGdVPdr5bI7abnDjI
	oyY73IVjsXLs97AHchZiTi4QDPzu78+gx60DcPES27MZhDHZdwByHb5N5yVto=
X-Received: by 2002:a05:6830:43a9:b0:7d7:fada:89ca with SMTP id 46e09a7af769-7db99343898mr1622685a34.15.1775017176031;
        Tue, 31 Mar 2026 21:19:36 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7da0a335440sm9588380a34.4.2026.03.31.21.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 21:19:34 -0700 (PDT)
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
Subject: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory pressure
Date: Tue, 31 Mar 2026 21:19:27 -0700
Message-ID: <20260401041929.12392-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_211937_670779_220A6CC7 
X-CRM114-Status: GOOD (  17.93  )
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

This is v4 of my series containing a pair of bugfixes for the stmmac driver's
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

[1] https://bugzilla.kernel.org/show_bug.cgi?id=221010
[2] https://lore.kernel.org/netdev/20260316021009.262358-4-CFSworks@gmail.com/

v4:
- Changed patch 2 to tolerate dirty stragglers up to a critical threshold (the
  same threshold tolerated by the zero-copy path), to avoid nuisance looping
  during OOM conditions (thanks Jakub)
v3: https://lore.kernel.org/netdev/20260328192503.520689-1-CFSworks@gmail.com/T/
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

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.52.0


