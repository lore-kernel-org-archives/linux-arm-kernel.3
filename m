Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C774D3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PoG2ltFbfN+WnHJpt5RjjG6F3QLPQGH+biFB2YP687g=; b=EpiEAEY9oFZa55itOB1jsWWDk/
	3CXjcbCE3w09yoCRBUbvMQtQb/gwAhxHbiOnsVuvxhZtTWZOO8nIBnCRLsfHZziA3UxNao4obEYrV
	pO/Yz7Ivkbftl8G9xPMg6Kf3lkJXysS9Hy9pTu+ZyxbbJ5vK0NQYOQo4dEkj4yvyK6w8+N7X9Zkmf
	vc/bEKL8lByBCVQVf8pBnvYAxcfO43I+WtVnEu8KPl7i2knvcUb/d7oTIg9WSmvZv0R4OEoD4iLvD
	KtUObCa34ivSy0vf3R/T9IZo7l7HftvVbDDDzCttxfJeruJiT/AS0VnrvaOtBQVv7UwyJtfEEHidb
	vgxHZzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qPm-0000000FOhN-0rBK;
	Tue, 29 Oct 2024 17:53:58 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5prR-0000000FE6n-3d5V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:18:31 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e59a9496f9so63177307b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 10:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730222308; x=1730827108;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoG2ltFbfN+WnHJpt5RjjG6F3QLPQGH+biFB2YP687g=;
        b=ObnqJZ036/02vPChliZOKVGcEHR4P/dzsj4xyuu9wJF7zqghlC8yMn/y43mC+Q+35H
         MZb0LwCI/5gUmokLtWsjSaG7DbsTBvEHvQC5Modq72BQDGDhR1M0oXlm9o8eOCdPypvs
         67Lvg9FtlJnIebMj8Ph8EJ29tnNVAJDOKEtdwNOzG1wAX2d6FHA/I0G5Xt+PGhq8Bm6c
         7d5Y3PX+JxUbiyNhZJ6/SSFfaLgV/DU3FaEwRuNCka0Zp8a8ksTx2Q/pIY909LRfdix2
         sXzq1ZkRsjlM33yFM/mKm9VMZR3TaMXQyjWfcUIISgKlgr6bfi6vwGZKpCRe/s7D7ucO
         ZxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWDx/rbvXkShDQLEVJVgmuRS7JV/H+yD5ekcncbdEyK3It0ORFBNJv8aLlQk0nzgAePWfuQEW6I+jri1QxtJOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzWGlt4EH7vuJRy7L7I41c0b8maBOP4JwqiNOQ1M+E0PLhtVZng
	x6W96/okJqjH5qwySm1EYnGK+hPBzgH6qfpBY6FPgfMZuEW19wLbcDM02Que
X-Google-Smtp-Source: AGHT+IF7Yhe4SxMlho4lzmKbR3FbFlZyW4Wn20WSHeNKZ2kWgjnPJ9WXhkjGyuHdwPoeTywNhic6Ew==
X-Received: by 2002:a05:690c:6711:b0:6dd:ba9b:2ca7 with SMTP id 00721157ae682-6e9d8b3c6cdmr118799427b3.46.1730222307781;
        Tue, 29 Oct 2024 10:18:27 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c977adsm20310467b3.120.2024.10.29.10.18.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 10:18:27 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e390d9ad1dso47223117b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 10:18:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEVxCwC4tx8lclSyjJmvHkaAP9jZp4i49hJ54bIiyjr7SqYO586MdY5t57158qvwu/aOSXQ8CSg1vYFlxJNaZG@lists.infradead.org
X-Received: by 2002:a05:690c:6885:b0:6dd:fb48:118c with SMTP id
 00721157ae682-6e9d8ab3d0bmr135385657b3.31.1730222306713; Tue, 29 Oct 2024
 10:18:26 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Oct 2024 18:18:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Message-ID: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Subject: BeagleBone Black Ethernet PHY issues
To: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>
Cc: "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_101829_926142_4C1DF0BA 
X-CRM114-Status: GOOD (  16.60  )
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

Hi all,

During the last few months, booting kernels on BeagleBone Black
sometimes fails with:

    +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
LAN8710/LAN8720 failed with error -5
     davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
driver SMSC LAN8710/LAN8720
     soc_device_match(cpsw_soc_devices): no match
     cpsw-switch 4a100000.switch: initialized cpsw ale version 1.4
     ...
     am335x-phy-driver 47401300.usb-phy: dummy supplies not allowed
for exclusive requests (id=vbus)
    +cpsw-125mhz-clkctrl:0014:0: failed to disable
     am335x-phy-driver 47401b00.usb-phy: using DT
'/ocp/target-module@47400000/usb-phy@1b00' for 'reset' GPIO lookup
     ...
     cpsw-switch 4a100000.switch: starting ndev. mode: dual_mac
    -SMSC LAN8710/LAN8720 4a101000.mdio:00: attached PHY driver
(mii_bus:phy_addr=4a101000.mdio:00, irq=POLL)
    -cpsw-switch 4a100000.switch eth0: Link is Up - 100Mbps/Full -
flow control off
    -Sending DHCP requests ., OK
    -IP-Config: Complete:
    -[...]
    +cpsw-switch 4a100000.switch: phy
"/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
not found on slave 0
    +[HANG]

Adding debug prints to smsc_phy_probe() makes the issue go away, so it
must be timing related.

Adding specific debug prints in the failure case gives:

    SMSC LAN8710/LAN8720 4a101000.mdio:00: genphy_read_abilities:2859:
phy_read(MII_BMSR) failed -EIO
    SMSC LAN8710/LAN8720 4a101000.mdio:00: phy_probe:3613:
genphy_read_abilities() failed -EIO
    SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
LAN8710/LAN8720 failed with error -5

and later:

    Generic PHY 4a101000.mdio:00: genphy_read_abilities:2859:
phy_read(MII_BMSR) failed -EIO
    Generic PHY 4a101000.mdio:00: phy_probe:3609:
genphy_read_abilities failed -EIO
    cpsw-switch 4a100000.switch: phy
"/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
not found on slave 0

Adding debug prints to __mdiobus_read() and davinci_mdio_read() gives:

    mdio_bus 4a101000.mdio: davinci_mdio_read:444:
readl(&data->regs->user[0].access) = 0x3a0ffff
    mdio_bus 4a101000.mdio: __mdiobus_read:900: davinci_mdio_read failed -EIO

but this is a different (and unimportant?) early failure from
smsc_phy_config_intr(), and that debug print actually makes the issue go
away, too.

Ignoring the early failure reveals that phy_read(MII_BMSR) failed due
to:

    mdio_bus 4a101000.mdio: davinci_mdio_read:446:
readl(&data->regs->user[0].access) = 0x20ffff

Anyone with a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

