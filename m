Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722FFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Tr5FyN1yFpthV3VK225kkpXsZ1+Q0ewXRFUsrX48A0=; b=1kklGol/sDrhK28BwpF/fvtftU
	he5nsqzc+ny0e7WbN4l3MxtSASUlZOB/+2ORCMyTBQNd+6WU2jRJQNVWOQrSuSR4zrI0CNrhcNZxX
	230jWA1N3K5I/G+5psI2eEOtzmYHT4WS60ZAqxQ6lcXtp374jgQhYmGjeyeNdjuGFhF5BDDH3/bj2
	VivOwPrqW70n2gkL76T2qfgsP+76Vn0LV/3c0/L8Q0wDST7YfM2KTXkGoomTGlSQYnUoTglxgf+//
	WkzLLY36exvtGAKre6kghJQRtMvS3QVtxbsofYaIF2FFNJif3ggthaXcuN9+fa7zh5sIXgnIjWFiN
	8FWSPCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjY9c-0000000BFmi-0Olx;
	Tue, 14 Jul 2026 08:06:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjY9Y-0000000BFle-3Mev
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:06:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 357D44E40DA4;
	Tue, 14 Jul 2026 08:06:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E510B60346;
	Tue, 14 Jul 2026 08:06:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B570111BD3B23;
	Tue, 14 Jul 2026 10:05:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784016361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0Tr5FyN1yFpthV3VK225kkpXsZ1+Q0ewXRFUsrX48A0=;
	b=UUhvAR3DyUsKeZ48khLzz/RdRv84xOY22/Qhm3XoX9CbNw1gs0svpqNBm/qEokdnu5EIv6
	v2O/ILj+ugqfNoSd/d+H1e62p6axvHGjlaSXuvAcTKF4VTXhJzWNhGSnE/SVr6yPSn+k0r
	ZPD5zjXlnrjRtF45RE5zTLOb7ltACN5ehJNzBp5GKmphkdqLx9VWvnWm9gmaIAI3Dgvox4
	D50HMojooGQIcwQyNqnlsi3y9KknvFb5Np3S4K71bQH0De5Hva7q0n9O8bT7W7gE16xm5E
	49uaXhN7Pj7/ukVgFASP2sPi635Tf+Cv0ce3x0zd9vLu2iscHZYFFubD1syBGw==
Message-ID: <edc373ca-fef8-46e4-8b4f-8afc257c2349@bootlin.com>
Date: Tue, 14 Jul 2026 10:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: intel: skip SerDes reconfig when rate
 is unchanged
To: Markus Breitenberger <bre@breiti.cc>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Markus Breitenberger <bre@keba.com>
References: <20260713171619.192452-1-bre@breiti.cc>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260713171619.192452-1-bre@breiti.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_010609_003707_C44C3788 
X-CRM114-Status: GOOD (  13.56  )
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

Hi Markus,

On 7/13/26 19:16, Markus Breitenberger wrote:
> From: Markus Breitenberger <bre@keba.com>
> 
> intel_mac_finish() is registered as the phylink mac_finish()
> callback for the Elkhart Lake SGMII ports. phylink calls it at
> the end of every major link reconfiguration, including the
> initial one during probe.
> 
> The callback selects the PMC ModPHY LCPLL programming for the
> requested MAC-side interface and then power-cycles the SerDes.
> On Elkhart Lake that ModPHY is also used by the on-die AHCI
> SATA PHY. Reapplying the programming during the initial
> boot-time link-up disturbs the shared analog block while it is
> still driving SATA, so the SATA link fails to train:
> 
>   ata1: SATA link down (SStatus 1 SControl 300)
> 
> The disk carrying the root filesystem is never detected and the
> system hangs at rootwait. Ethernet itself comes up normally,
> which makes the failure look unrelated to the network driver.
> 
> Before mac_finish() runs, the legacy SerDes power-up path has
> already programmed SERDES_GCR0 for the current interface. The
> 1G and 2.5G ModPHY tables selected by mac_finish() correspond
> to the SerDes lane rate, so read that rate back from SERDES_GCR0
> and skip the PMC reprogramming and SerDes power-cycle when it
> already matches the selected interface.
> 
> This keeps the disruptive reprogramming out of the boot path
> when the SerDes is configured correctly, while preserving the
> previous behavior when a real SGMII/1000BASE-X to 2500BASE-X
> rate change is needed. If the register read fails, reconfigure
> as before.
> 
> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the interface mode")
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Markus Breitenberger <bre@keba.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


