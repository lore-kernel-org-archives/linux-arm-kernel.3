Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F5FC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cdFBbeenO+uHrbtVeXeloGyoRqp0CSAoLqw72jhnBdM=; b=rA1Y2yqORvcwaZH+J51VxHhDRC
	GFIzZEjET/CUX7ZtLfO2WPa00MSKNIQjig+boGn8JA0EUreVsB3avrNDBVciG0AeWPZI+4/xqCqKt
	ca56B49cwhKoqqJ1k7IqjOWvPaYtbM8JMbN9Ga4L++wZ5WyR/XVIArdawdbmgRLppOGFNYihSnSpf
	KYDB2TmXKlt6QWD2kv5NXXOa+laMRD5mAHkRQwmSbVVCdhBqPBQk6HqpUE/vBD0rUDCbP9XPPM81N
	bCoW0erGG5CK6VYIoSss1BeN61LXTfXpyLJX26KOXPPFaH6KA4R8BcfXKfVy1zbwQtxvWkparCcBx
	F6IoFibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOYA-00000008VcZ-3hPj;
	Tue, 18 Aug 2026 18:28:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOY8-00000008Vbn-2URo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:28:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5b01146b205so174222e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787077714; x=1787682514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdFBbeenO+uHrbtVeXeloGyoRqp0CSAoLqw72jhnBdM=;
        b=E1KaZ2+DEhsWMl4XYfTgrkL/GZcsW54J/JivajIw+iVDAHre/ztG53Zdysp4IoTdrT
         rdmMuvYGzTpVPTGO6Kgpoe9AH4v//eyHrI3euA0t17FCdvIamGug5iZVYPLVd4B9D3C2
         ETAqmABXuddKtsnCPHR7PwV571GBYBg3EhugZ0JNsTI5wl+ePA1yVT7rjc9Dlz+Fn6R8
         wvwg0VEA6wS3TnHgTrob0/yBhA+eGpHVcq6kS4hbaI5qpoGhwWwVIp/mvUE0KaVMXoxO
         b8seWuRXi1tw67y0XAC5xuw4gVWfDzC+a+BYZBafKA4rLcivImEydj6+zREvFMfJ3KT+
         J6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787077714; x=1787682514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdFBbeenO+uHrbtVeXeloGyoRqp0CSAoLqw72jhnBdM=;
        b=Gdihsnk29F3awaXdUUVAFpFSJ6RySW4DF7ple+vF8qMVLmecI4uaR6xPJMUAEskxE7
         aShburkRu1EX9mwbPLOS69kZ7zf3PNaFSbcTvdr9RrY4+BTBVZbpX7bG/W2jcjGlC8oc
         8QGuQrIOCeA9rnPDyTPY+cD4HUq82Q9Mc3IElKKEv4OVY/gI7b0ccs+cxC/eu0Z/27Dk
         wx5Mqr772Z6yAOvVMSShR7VhAqMpCrpxAl14SK9bYH/xNUY0/X28xcg2RbMkZM33OPhI
         IYVZVSO2txsBQyZcyZOgGHoYxEexhWdKmk0zMRWUSknz/adFvMWZqyy8QYwUP/GWFRWi
         eqXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpa0ZI2oLuin/bVbxv/pAQgPIoLaCDf5To7OVb9W+J3GB+mmBJTh7eRr/EVJ+R0gSDaVJeOji1Icv/BM4zoK7jJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwTz1hMbaHMIEHe+FvaIK1LLLQ3tPPHOWtLKGL2CiTdHl5XgkQM
	fqqqsQKbmfTPigQHLo3RG8KMy5GHD4P1o+GIvdmUYGza+cFSRped2SE=
X-Gm-Gg: AR+sD12PS0HLVvdStedcbnlOoJi7Csoa581fEAACjWSxrfjJVZ6p0m2PNN8t7NDbehd
	E2wTehmpIpGpB8604ov10kP9hk1JEWq5HqHd/ZxFHpTKKkx2qWOczwurxnDoFEOXsf93hWh0PPg
	92v1xcjpiV6+EVhZ0cs5XPpP6Z+HRjL2o4nr6/LRaQ78zvFnj61sKHvI3B2FRIgituu2xg0k80l
	GOwbsy+En2XLmASGYH3y5dqCZLFq8ZlMzGGEzB9i0s7SeFN8P9HObKtqZXvrRjuvAJrqliJpqtw
	T9D8bj9Wky/Cupc5zO3aBpHEZZSj8Q7MhnIUI9OwCiqqq73vgegbPnMFtKStEqAaf6ISQa8A/Rx
	7luVR6GSQcZYjUrRcERBobRGtUHnLAj4SKG3W0pY1k1y04gFIY3imCXhMeiaRXiCULrCZM0XJ0W
	uiJoUsF/quOqvloIf188wG392K+xe6nm3phQvXGnT5W6ysl5ZipqGjl/6msNzYj+aCM3Axqg==
X-Received: by 2002:a05:6512:440b:b0:5b2:a316:6113 with SMTP id 2adb3069b0e04-5b477cab55amr125716e87.9.1787077713492;
        Tue, 18 Aug 2026 11:28:33 -0700 (PDT)
Received: from i-UX410UAR.lan ([2a02:2168:87cb:3900:e3f7:5eba:c5c7:2efa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf960d8sm1460494e87.2.2026.08.18.11.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:28:33 -0700 (PDT)
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	yangshiji66@outlook.com,
	Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Subject: [PATCH net] net: dsa: mt7530: do not advertise EEE on MT7621 switch
Date: Tue, 18 Aug 2026 21:28:29 +0300
Message-ID: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_112836_659341_09772D50 
X-CRM114-Status: GOOD (  15.12  )
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

From: Shiji Yang <yangshiji66@outlook.com>
Date: Sat, 28 Mar 2026 23:29:56 +0800

There are hardware defects in the MT7621 (MT7530) EEE support: with EEE
advertised, some link partners cannot establish a stable connection.
Notably, on a 2-pair (4-wire) cable where both ends advertise gigabit,
1000BASE-T training cannot succeed, and instead of falling back to
100 Mbps the port flaps in a loop and no link/DHCP lease is obtained.
This is confined to the WAN / phylib bring-up path; the DSA/LAN side on
the same device is unaffected.

The MT7530 internal GE PHY advertises EEE by hardware default. The
eee-broken-100tx / eee-broken-1000t device-tree properties only take
effect during the late PHY config_init path, which is too late for these
link partners: they negotiate EEE before the OS disables it and then
fail to fall back cleanly.

Commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
advertisement") removed the early EEE-advertisement disable from
mtk_gephy_config_init(), on the rationale that "disabling EEE
advertisement before the PHY driver initialises keeps it off", i.e. that
the DSA subdriver already performs that early disable. That rationale
holds for MT7531, whose mt7531_setup() clears MDIO_AN_EEE_ADV on each
switch PHY -- but it does not hold for MT7621, whose mt7530_setup()
never had such a loop. So af3b4b0e59de removed the only early EEE
disable that covered MT7621, reintroducing the flapping on MT7621-based
boards (regression reported on ramips/mt7621).

MediaTek's own recommendation (Landen Chao, 2021) confirms the hardware
is the root cause: "EEE of the 10-year-old MT7530 internal gephy has many
IOT problems, so it is recommended to disable its EEE."

Restore the early disable for MT7621, but on the DSA side -- exactly the
location af3b4b0e59de assumed it already lived -- by clearing
MDIO_AN_EEE_ADV on each switch PHY in mt7530_setup(), guarded on
priv->id == ID_MT7621, mirroring the existing mt7531_setup() loop.
Auto-negotiation then falls back to a stable 100 Mbps link instead of
hanging at gigabit.

Tested on ASUS RT-AX53U (MT7621): a single clean
"Link is Up - 100Mbps/Full - flow control off" + DHCP lease on a 2-pair
cable, where the unpatched driver loops. Confirmed on kernel 6.12 and
6.18; also confirmed on Netgear R6220 and EdgeRouter-X (both MT7621).

Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
---
 drivers/net/dsa/mt7530.c | 9 +++++++++
 1 file changed, 9 insertions(+)

--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2518,6 +2518,15 @@
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_40MHZ)
 		mt7530_pll_setup(priv);
 
+	if (priv->id == ID_MT7621) {
+		/* Disable EEE advertisement on the switch PHYs. */
+		for (i = MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
+		     i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT7530_NUM_PHYS;
+		     i++) {
+			mt7530_phy_write_c45(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+		}
+	}
+
 	mt753x_trap_frames(priv);
 
 	/* Enable and reset MIB counters */

