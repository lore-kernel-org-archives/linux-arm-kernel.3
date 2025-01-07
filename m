Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDA8E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1iRQLDB7T+T6mcX0QSHuvP8QOBEcY1WYeSSWjcXJNfA=; b=Pwjf3tHbm3fcTRSEtJMhSPXqA9
	suU4DslCeVa4QWwSKHQr9GMOdTVuxbfRt7vr2kS2ycZ7iPMNACWQNk/3/fbmPtrvfXDRCh723nMFR
	BgrjzkjFgZfGHN758/e3PVrZddvqkP7oTxgOrNyxm6Y6VINK18ePxJG8eGqSLOPEPJcm2ZQRRdwBz
	hoeaAC/5xkKX3ogyivausDgp217qVsPLsTPd1j4E0fN7e6dYNDiVRDxX0yuYLZNNyHQxvjbq8EiGE
	37GtIwa8Jn+iFLztbp9xJ1hi4bs3Lxlksmy+iQ+5j2uDPobFGyfxTwbsOYcMfmALnFMX9kwNEnbsY
	qpoqMC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8qC-00000004npU-1Z3O;
	Tue, 07 Jan 2025 12:37:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8oq-00000004nPp-2RK7;
	Tue, 07 Jan 2025 12:36:25 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso27125179a12.2;
        Tue, 07 Jan 2025 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736253383; x=1736858183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1iRQLDB7T+T6mcX0QSHuvP8QOBEcY1WYeSSWjcXJNfA=;
        b=jiQkjSbIK90mw7fP2bHTWODv+T4xnQOV1FBl9of8hr4S9/5bU1oEO7KN6cecccgMZ6
         sZ+AOwMpu73SqgevJUUyd6XTwyjJe41cS2xAGYEr8ZhQ0PZWcMQ/nyxSCgonUrjO+5d+
         rn+feph9St+TLTl6IOOqucOQONBsfetQHH+yoeq+OfiUZMIVdPZXKZeEjeC9ceqRYoYC
         TssfFbJGDKZ5/e9eFOqgFmSexfI5nKaC3y4Yjyk6B8bcrhHMItOcP+dOvP7B5aeO3nM/
         RL3Cmsa4kQeGruZyRe7XsptfUJ/khnWFQdxgNGMSNhOBqeCay6skcalDmFk4Oty1TL6I
         qcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253383; x=1736858183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iRQLDB7T+T6mcX0QSHuvP8QOBEcY1WYeSSWjcXJNfA=;
        b=moD2HvgwCd/QJcQdqOPGcHdRHPIidky+AAe+0wlSCBOjNOJxq5qlKwPYFgVpXAf7HD
         MuNYL1+/cAJuK0bhenBLga/6ZsVIPndSbbfGQ4OX4WCSftctxlAqx0pyrEZv1DxOTNI6
         yCfB28njpvWbI+DsSGfiYkvK7+D2y9LPyeKgSVbA0YwQmKkqKZrQqiW8nzyXazqvj+lD
         6MJToJZQ5egL/PrpE2HSNweb6jW9b+us5Cm64mOPH4N2YJlm4XEdSM+MF0NOrxtzIjMl
         sS9zuuZr3wG4OxO3MiHrX4PbIjsKF6wCSH6lWt+X6kc72tDeffsd7j9znR8HO3OMVbUZ
         Rbaw==
X-Forwarded-Encrypted: i=1; AJvYcCWtHRwcIeBQSA4RQXUUOx9oQEtRw35WOQ3ZuQ/evYqMCtOePCBP3T6oqSa+JQi45edSCLdhrGKU5BdMb4WhaDKA@lists.infradead.org, AJvYcCWyeCtKCGRz3f+pjKUtvWHz87dRXRz3JHmlz+NArbdfK0bGVSrORUZmE5RYMrn0iytTRAJUvUU/hEnX27Fc1hw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWtD3scVHemYdU7rj+lZr+v4K6p6xzb5iGnNmHY6Q3cd92YcNH
	QfdUq/5Ux0Ky1EJ9rt+JVuf1FBussd35thGHuN2g+Ml/x2aG/kbs
X-Gm-Gg: ASbGncvHZ/VujMVprBljvjeaDVUZshZgeSIM52/CtffG6O0GVvNybfpgF5lVN6xdCsV
	hqGl+VPBZ9XCm0Y7t7peq4DFwMesu85frfUIODVY16JAW6KgQKbWEBam1RwfnRviregw9v0SyEY
	PQJnhD6Etg3pqYjV1X5AHC9BhIPwlda9zfI0ZxUZZUnWEPjIDN7uDN3GRmv8FFeQz8K6IuHhMUS
	jhDJ1bwAmZgDvrZeoHaIFVHl2j5NyflCOPyHdd9OFEHEoR5p3BIf3DtxCN526XXGqRLGX3jNITm
	AJYQpYWp3Yr3KXuYAnjvNT94wt/h5xS+Po2Yn0a66O7QoD46+yvyoqLHbxicTErX2rgAxOlCVQ=
	=
X-Google-Smtp-Source: AGHT+IGW23CFpUMXDq22TqAb+Ssg5WtHBDf4GPbKhJxZxOpLIHvlqjNy2qcYwN7W5pI330PsYIomtw==
X-Received: by 2002:a05:6402:2802:b0:5d2:723c:a568 with SMTP id 4fb4d7f45d1cf-5d81ddf3ba0mr62395981a12.10.1736253382371;
        Tue, 07 Jan 2025 04:36:22 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c8dbsm24148450a12.40.2025.01.07.04.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:36:22 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next] net: phylink: always config mac for (delayed) phy
Date: Tue,  7 Jan 2025 13:36:15 +0100
Message-ID: <20250107123615.161095-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_043624_619044_D1370CC4 
X-CRM114-Status: GOOD (  13.12  )
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

The situation: mtk lynxi pcs (eth1 on BananaPi R3) with a rollball
rtl8221b sfp.

When setting eth1 link up, the phy is not immediately attached. It takes
a few seconds, pl->phydev is not set yet.

So when setting link eth1 up:

phylink_mac_config: mode=inband/2500base-x/none adv=00,00000000,00008000,
0000e240 pause=04

When the phy is attached the link an mode does not change and
phylink_mac_initial_config() is not called. No message 'Link is Up' found
in the kernel log.

We need:

phylink_mac_config: mode=phy/2500base-x/none adv=00,00000000,00008000,
000060ef pause=04

Perhaps forcing phylink_mac_initial_config() always for a phy is not the
desired approach, so I send this patch as RFC to see which approach
will be most suitable.

Log before this patch is applied:
[root@bpir3 ~]# dmesg | grep eth1
[    2.515179] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine at 0xffff800082380000, irq 123
[   38.271431] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/2500base-x link mode
[   38.279828] mtk_soc_eth 15100000.ethernet eth1: major config, requested inband/2500base-x
[   38.288009] mtk_soc_eth 15100000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
[   38.296800] mtk_soc_eth 15100000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
[   38.306362] mtk_soc_eth 15100000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00,00000000,00008000,0000e240 pause=04
[   39.220149] mtk_soc_eth 15100000.ethernet eth1:  interface 2 (mii) rate match none supports 0-3,6-7,13-14
[   39.229758] mtk_soc_eth 15100000.ethernet eth1:  interface 3 (gmii) rate match none supports 0-3,5-7,13-14
[   39.239420] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
[   39.249173] mtk_soc_eth 15100000.ethernet eth1:  interface 22 (1000base-x) rate match none supports 5-7,13-14
[   39.259080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
[   39.594676] mtk_soc_eth 15100000.ethernet eth1: PHY i2c:sfp-1:11 uses interfaces 4,23, validating 4,23
[   39.603992] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
[   39.650080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
[   39.660266] mtk_soc_eth 15100000.ethernet eth1: PHY [i2c:sfp-1:11] driver [RTL8221B-VB-CG 2.5Gbps PHY (C45)] (irq=POLL)
[   39.671037] mtk_soc_eth 15100000.ethernet eth1: phy: 2500base-x setting supported 00,00000000,00008000,000060ef advertising 00,00000000,00008000,000060ef
[   39.684761] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,000060ef
[   40.380076] mtk_soc_eth 15100000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off
[   40.397090] brlan: port 5(eth1) entered blocking state
[   40.402223] brlan: port 5(eth1) entered disabled state
[   40.407437] mtk_soc_eth 15100000.ethernet eth1: entered allmulticast mode
[   40.414400] mtk_soc_eth 15100000.ethernet eth1: entered promiscuous mode
[   44.500077] mtk_soc_eth 15100000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off
[   44.508528] mtk_soc_eth 15100000.ethernet eth1: No phy led trigger registered for speed(2500)

Log after this patch is applied:
[root@bpir3 ~]# dmesg | grep eth1
[    2.515149] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine at 0xffff800082400000, irq 123
[   38.989414] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/2500base-x link mode
[   38.997838] mtk_soc_eth 15100000.ethernet eth1: major config, requested inband/2500base-x
[   39.006029] mtk_soc_eth 15100000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
[   39.014818] mtk_soc_eth 15100000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
[   39.024368] mtk_soc_eth 15100000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00,00000000,00008000,0000e240 pause=04
[   39.960119] mtk_soc_eth 15100000.ethernet eth1:  interface 2 (mii) rate match none supports 0-3,6-7,13-14
[   39.969738] mtk_soc_eth 15100000.ethernet eth1:  interface 3 (gmii) rate match none supports 0-3,5-7,13-14
[   39.979409] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
[   39.989153] mtk_soc_eth 15100000.ethernet eth1:  interface 22 (1000base-x) rate match none supports 5-7,13-14
[   39.999063] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
[   40.334663] mtk_soc_eth 15100000.ethernet eth1: PHY i2c:sfp-1:11 uses interfaces 4,23, validating 4,23
[   40.343980] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
[   40.390049] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
[   40.400234] mtk_soc_eth 15100000.ethernet eth1: PHY [i2c:sfp-1:11] driver [RTL8221B-VB-CG 2.5Gbps PHY (C45)] (irq=POLL)
[   40.411005] mtk_soc_eth 15100000.ethernet eth1: phy: 2500base-x setting supported 00,00000000,00008000,000060ef advertising 00,00000000,00008000,000060ef
[   40.424730] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,000060ef
[   40.436368] mtk_soc_eth 15100000.ethernet eth1: major config, requested inband/2500base-x
[   40.444539] mtk_soc_eth 15100000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
[   40.453307] mtk_soc_eth 15100000.ethernet eth1: major config, active phy/outband/2500base-x
[   40.461653] mtk_soc_eth 15100000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00,00000000,00008000,000060ef pause=04
[   41.170029] mtk_soc_eth 15100000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off
[   41.187047] brlan: port 5(eth1) entered blocking state
[   41.192213] brlan: port 5(eth1) entered disabled state
[   41.197404] mtk_soc_eth 15100000.ethernet eth1: entered allmulticast mode
[   41.204358] mtk_soc_eth 15100000.ethernet eth1: entered promiscuous mode
[   46.600038] mtk_soc_eth 15100000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off
[   46.600057] mtk_soc_eth 15100000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off
[   46.616926] mtk_soc_eth 15100000.ethernet eth1: No phy led trigger registered for speed(2500)
[   46.634003] brlan: port 5(eth1) entered blocking state
[   46.639155] brlan: port 5(eth1) entered forwarding state

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 drivers/net/phy/phylink.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 6d50c2fdb190..6fd66ba9002a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3424,6 +3424,9 @@ static void phylink_sfp_set_config(struct phylink *pl,
 			     phy_modes(state->interface));
 	}
 
+	if (pl->phydev)
+		changed = true;
+
 	if (changed && !test_bit(PHYLINK_DISABLE_STOPPED,
 				 &pl->phylink_disable_state))
 		phylink_mac_initial_config(pl, false);
-- 
2.47.1


