Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51548CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piQCfkikZKIZyhpgKiePfCJ5UWXvcujr4sC7T17z/oA=; b=x9gb3oJPdAwkSZ1A95ezYpA37O
	bHybOAOsZyHWMHHEz5LYS6vIvZkjF10wOsmI77dt2rSce/j77PjW6JSJIUCcckq5YV9VT0U/T6QNv
	67mCWtm0iT+hBC6GEaCQqr1i1t3H9V+s5bqzFoWJnsWkRtilcu0X8+vDI/ETRIt3L2QaFlNnsUEiu
	oovzy6vdGxZFdx2N4U8JIm3JPgK7utTUO3RVHxUP+E0sTGNtkhQ37uXA8EyP+1Py/lSHJgELGwosc
	qrHJHUg1eDJLN7VSKLOoIHqjFs+Gbyt+1HowAfbQaprTn9rMN8m/BhtDxNjbVkfhJSI/F8ug6YkqF
	1+GphyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZ3r-00000008Dly-07nc;
	Sat, 10 Oct 2026 15:32:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZ3n-00000008DlU-23Oi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 15:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791646357; x=1823182357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fjaqr9z0/4IpSNXim/KBiOLW344lFa8Vy7SRK6DoHSs=;
  b=heU3XKam66fIXBINWlLYpiwbt9Id5vCsEDS5K8sJtg8gXOEaawzraitP
   TO8DGgxciiy8jdmM4jA8i3erYRLGq4EA/1sdb4jXJcB66N7V6wjeTzl5o
   SqmiMWz6qYtgGtMzMK8DPQXZbnfc4P5fAnVhgQ7yPixNk127/A6CzB+sy
   L/4O/0MtPz9KvdFAncMMs8Mbu0WteKIMOhC9V4bQVwL5gMwlVnOld3q0Y
   MBfB4YYqpiO6gJ7mbtSWBk4dhdTR/fad6vfBCRdHM/Afk2W9MFBnDJawh
   OFmLJ9NR1yzT/0jMc+NLm3WLfkr6SonBjr24+lkvFQKurRuMmw2c3qaIR
   A==;
X-CSE-ConnectionGUID: /NIkIOrrTamOMdyv8TAVmg==
X-CSE-MsgGUID: ZadMASfBQ8GQ2g2JEM72EA==
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="63905767"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 08:32:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Sat, 10 Oct 2026 08:32:28 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sat, 10 Oct 2026 08:32:25 -0700
Date: Sat, 10 Oct 2026 17:32:25 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Igor Velkov <iav@iav.lv>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v4] net: stmmac: dwmac1000: clear the RGMII status
 interrupt
Message-ID: <20261010153225.s3f5jgrzgytyvnei@DEN-DL-M70577>
References: <20261009201709.1917585-1-iav@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261009201709.1917585-1-iav@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_083231_813752_445264D6 
X-CRM114-Status: GOOD (  14.00  )
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

> Since commit 2e2c878a3141 ("net: stmmac: remove SGMII/RGMII/SMII
> interrupt handling") nothing on the RGMII path reads GMAC_RGSMIIIS, so
> RGSMIIIS stays pending behind GMAC_INT_MASK from the first link change
> on. stmmac_resume() resets the MAC in stmmac_hw_setup(); the reset sets
> GMAC_INT_MASK to 0 until dwmac1000_core_init() writes the mask again,
> and the pending status storms the line:
> 
>   dwmac_dma_interrupt: unexpected status 04000000
> 
> A register dump at the first message on ODROID-HC4 showed it:
> 
>   core int_status 00000001 int_mask 00000000 pmt 00000000 rgsmiiis 0000000d
> 
> When the resume thread runs on the CPU that takes the MAC interrupt,
> the storm starves it: a soft lockup, then a watchdog reset or a hang.
> 
> Read GMAC_RGSMIIIS in dwmac1000_irq_status() when the status is not
> masked, as the driver did before 2e2c878a3141; the read clears it.
> 
> Wake-on-LAN resume from s2idle with the resume thread and the MAC
> interrupt on one CPU: Helios64 (dwmac-rk), 7.3-rc6, soft-locked in 3 of
> 3 resumes without a fix and in 0 of 10 with this patch; it ran with an
> out-of-tree dwmac-rk change that keeps the GMAC powered across suspend.
> ODROID-HC4 (dwmac-meson8b): 0 of 10 with this patch, 2 of 2 without a
> fix on a 7.3-rc5 build. irq_rgmii_n went up by one per resume.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

