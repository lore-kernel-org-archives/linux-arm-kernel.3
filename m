Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7E11091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UkL9G5F8IWfaZsPq/S8Wu6RBCXk3sjjW1IZ7vLbDtek=; b=UKvfDiwaggHmJI3E8shGfGd3De
	vaoesk7D7/G386oShTu3ETIhnIO8zwpgfBpBirP5FzSmWARAPO/A17ftGM4MEtnzyPLDc1lDQ4icl
	M0OhFMPwaQO+XMgQQ3QK64QJiZ1ATNJp+oKXSng8TaJrSYMP027It68tQ9apIEdkt63Pkm5uEJ3iP
	5niDfIFdJuCYxCYVxN51dvKoo7otFSKScnELr9rz05PawlJns/sAugEboNglOlElbh7idIzxxBsTZ
	W9wmvaHawCGma1bxCzl9Ze2JEQLMo2/ecmDqbAPaWAzXWm2bnd1XmenA5XxnF5YK6CUzsTSCknDQL
	hndmUdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IIw-0000000BN3A-2psM;
	Thu, 19 Mar 2026 18:41:10 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IIr-0000000BN2K-44db
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:08 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d74dbfe84cso862323a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945664; x=1774550464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkL9G5F8IWfaZsPq/S8Wu6RBCXk3sjjW1IZ7vLbDtek=;
        b=duQn5ZjfjiiWHEdNUAUXp47XGHKkiY2cVV0UW5oPcyQPBxG2YKNav49cxBzlWoCFoZ
         Tos3LMUNtJwyF6bi1R7QGg4Dg6KpTyyV4M4psQ9WfnAnACuRsetAS22S+W/8SfDNP+nW
         RH3xgoCRXB1/JWSTJ+EfrIxu/RH6WccjVGKg1qauVMBsLNGMa7trfqYYbXEfVjspgzRR
         2PLABn2/GOYF3121A9RWiXApJF/CrYBKE0ou7M2/9MG+aHaPvIQrloMwAjyQplGJOMt9
         /7YSyyxnkSrNTN9s3OhBB21/AAQ2LydaTE0ev5EMI/pH44PciAcOn1FKH0ZIHE2P9Nmt
         8CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945664; x=1774550464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkL9G5F8IWfaZsPq/S8Wu6RBCXk3sjjW1IZ7vLbDtek=;
        b=PKxS3BXU1XiSS87RYHT3Yxwz6udBFP8zSVWFSOnGUoeeJGvlsBD9xwECnhouVEy0MF
         1S+DJ58Wd94dydzQpKa89NY4KDnasshvWRoIgidZsdy3nU4/3y+pZmgX6ErJ6se1Lz2Q
         yj6PzwlZ/u9pWefhiYZJ17Ro0sFTSBG4Kz0iesMsbJYmsGMKI5CU2QXijaeLJA6aO5l3
         I7k3e9dsfC47t81/k0Ey28qDictn4WMqEWubwXDQiz9JSZPuT9q89KL1grkfIZo5hwMh
         ZQo8Lsuu7ZHkicQvP2IyfFe/aDfEawPO2E9cQCNAyi3IcqZWkKtGlwjVC0b1ZvtNVggX
         H0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWLaPfMEmkvija1SLaUiiQ0jLXaK/I2DFaIyUXLAg0MjgbW+/z0PmI35qRX39oWDM6mhmr7IPn6ux85onlP6oEE@lists.infradead.org
X-Gm-Message-State: AOJu0YwevmcQIrzUrPm2dJvOzC+TTGh14dVpx9KAfvg+oI74Dda7tZvN
	0UVIGVjmxdbAhBSZZNG/wyIcxXeNnDgYozsotymYrhwGqqT0wTJykrGtp4xAhacZ
X-Gm-Gg: ATEYQzzw85FUlbZzBQ+R3jom87q4scHfmGtczzWUPSj8dNdmxH3ZBkZo62R2w/aA+Ao
	ksD/59v/4cl7RrDEwDAgBvh89XX0Yt0JBFNHxqbFtv3dxQlV1B+0mcHSUZchEQZyUWxeprV4YMG
	/mLbaHaO8i9v9zEreC1EmOO/THis3LM8YqfjjwF0T1j7A1CC+1xMQTgHiTgLf0pK1KtGsgBfGCZ
	vhe0KwVjM3l6RE2B/ulG6ERaoKLXKd7TBSg+Z2rSzif4o9PdBPA9PmTQH6WGn/ym5xQkbL6j+SD
	pCsheR/a9Zq7lpr0f6iIsvfbRh5QSEnqVBZpCYxVqLYjUIov/kVMxo1C8cxu0MjhCNfxLtDfAvI
	WEzcJsawjZxsEsQaDH888yHGhERz1+Jq0XQNvJa8PIZf6d2BmD7OMYvDj9fblmy5LBu3jxV32+Z
	2VqGc4N/PhnjpEIhMRrsGxWVZ7EWUqH2yOEPd1DoSwqVVHEmlwm2foAglUrCFNZq6U6YMyinejZ
	CDFLVGaQKE=
X-Received: by 2002:a05:6830:3e07:b0:7d7:e8f4:4800 with SMTP id 46e09a7af769-7d7eae7e608mr222164a34.9.1773945664407;
        Thu, 19 Mar 2026 11:41:04 -0700 (PDT)
Received: from celestia.turtle.lan (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadcb757sm181486a34.15.2026.03.19.11.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:04 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH net v2 0/2] stmmac crash/stall fixes when under memory pressure
Date: Thu, 19 Mar 2026 11:40:29 -0700
Message-ID: <20260319184031.8596-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114106_017486_DB4E9EA9 
X-CRM114-Status: GOOD (  13.52  )
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

This is v2 of my series containing a pair of bugfixes for the stmmac driver's
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

Both patches are minimal, appropriate for stable, and designated to `net`.

Regards,
Sam

[1] https://bugzilla.kernel.org/show_bug.cgi?id=221010

v2:
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

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.52.0


