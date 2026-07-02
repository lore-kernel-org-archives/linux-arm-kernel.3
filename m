Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD04FC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SR66zcQVEHB+6IoMmH/7EWLtnBM8ziGmZQt7pgZ3b6I=; b=43pmTBUvR8hS2cLaFpGYlOTdFr
	76xZeWwGjmvC0zTub4w90qMJbtZGXjc1VkQt/YLX2OaGyy0pSWUsFeCTFYMdcPJ5Uu/jUuo1k06qA
	956smu/sN5dNAIBmb/m8ZVaW/4Ko4gcsREyAu3SUvA70enqoPvvmKApLUap6jm9tp29YSRTlbFe1/
	CDKCp0CfzWJBM6YbIB9UR2LuoFCAaP1lDBq6p3ZrW0BA/juJTSKiIGR9TkGMYbMfKDVXfjZySoTd7
	vDEo37O3pXQ/9/jjz+6IHGyszKwIBiCIZ3G9yucPZetHqb985IXRY41hk/pPEH2oLKeZpalrBjBrr
	iMQhug1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAyG-00000003eSZ-0dNZ;
	Thu, 02 Jul 2026 06:32:24 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAyA-00000003eRe-1YxY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 06:32:23 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C4B87EC006E;
	Thu,  2 Jul 2026 02:32:16 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 02:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782973936;
	 x=1783060336; bh=SR66zcQVEHB+6IoMmH/7EWLtnBM8ziGmZQt7pgZ3b6I=; b=
	KwsvHa4U46RIHYQ3B9l9ns6UH/VKELBi6Tt6ezSvm2CUeilJ1GT/Pgba1v2gkZKd
	JG7A85eS6+LDjS1/50de7jLBfGdtGexqcJyunOKGjsU6rWrqO0QjlhiOChG3TOX5
	XXMEy7oSuy3MZHoe7W3Avnl6RdMVJaz6s7QsRVt/uMeCin3bvN9BYDgonmk3qgOG
	JkRSBsX38fquZprck/cge1jCazHlGVFQcduIJpa70tkp7EPpMXpb6/VevOiqBHsP
	TtQ5xMGD+WdNGiQngUaYR4xlDAviGSgxZw9HFvxpyZoMRfkwhHyE3N2U6w8FRCwk
	YSP+ENx0Sb6YK7q2lsxWIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782973936; x=
	1783060336; bh=SR66zcQVEHB+6IoMmH/7EWLtnBM8ziGmZQt7pgZ3b6I=; b=E
	xI8ygPxZpByjAP2rnKuoicG12u29Byy1s9v0qM6IKGNrzAp0XaD5EfbW23PnLAbj
	MV8afn+fEOR0KA2Rw/7vlg0cfbJNkUDC9Cxnh5ccII1brMphqt28VRp18iLV+/6p
	RWdIh9lAWni/wUZcXZQyl13+Ra+Q/JsoZ1FDojhNGCeFSLbebdAcvurwEuWavVdY
	a5m5ANGnmXUjamPwdh5RXAd/7BJtkz8kvvX9OmFLfBQGx46GVDcs8iptgYkkR1Vy
	oyYFDQxMqlR5eKytx1WaCpt2GOvG3br+zBe3l/rnl1klyu2Sa0IoAGTOI1qoWtFr
	+p5Qz5htZ0zAGecLPjJLg==
X-ME-Sender: <xms:7wVGat1xG2veW9TVVmAx797IYLEis7WZ2Gglsg7E6ZMP5cINiBpo2Q>
    <xme:7wVGau7cRrx5KcGEN6pvjORLrtVtCbL5-Q5Dryyjg65FmJAoXpHiSNJmxeHOoW-r-
    8dGQr098AI_eZqpXTRp7oAUacmvLZWKxbIeKhiOd1yALWn4xHFPtwg>
X-ME-Proxy-Cause: dmFkZTFGWkwDnqqlU4OwiA3V6EOPV/SV1NFT8TaRAvGxP7wxL2DUUXDfDJidwjSCqTESqR
    BFQcNTLdfTHPIW2znFhyWHzbaHgh3DwWIN4hRvUU7wnV1IF6WNf07V1lppW4HlQXd6SlcY
    7TtffyOMHdkrKR0YzIAicb6EhN44nRhhe44rTHq39IrDquzweJiEL16vwQ7JdYgzi9e5EF
    AqQJRxE7y/ob8ymIKNBuFH2QV7r8DaGlO14VUX9HujmiNevPUX4ccW5XomWJx3uTF8R3Ur
    pxpzgg/3rJ/lM5sSEoYJVhBwomD8dIxH0MIcFj8lkECsaKqaTdSkL1HUrQde53DnwEKgc2
    7UrNIF4MXUDoy6ujAHJQniTb0IptuEBClQYk5PJAEHtKI5Vb3yTjjvrCpx+iYmFupOJKr0
    PNEp96ewq3UcSQIE1fg9+knBkZ8N5Q8Hb9FJwD0HpYWO8zKHUbieEvse4BL7+v+VR8Tz28
    MA90EAD+KZ9EFZf255+NjDeGLFlN3+5RQYfbcZ+HzLZLoKBY3BMs0oPcgvXFpmNcLOzU0t
    lBdD9cAsiCXN7I+P+bMmeEccAsSEKURx6wHh38hZ23DPZR+QwtCWJ93ZjYx5hTvkv+mAWb
    e5B+8mVNsGdr/5/BljAi5yLuNVZ3S/7aLJUUZUUlIQYq9psATKGU/vvF3svA
X-ME-Proxy: <xmx:7wVGakwdat4gDDUU2VX2YipB7R6zwHX0dHRJUNBowLL078rJ_aMZEw>
    <xmx:7wVGauw2HeV5CXd4t-ZXXN_sDPBzVvzvflkTZ1dII31HeWkXjRo-tA>
    <xmx:7wVGapgLVXVbuQ5N2PTxw0qZuYu0IRXI7T_idOgCxDDA81jUK8vizQ>
    <xmx:7wVGasgUIRxG1AfiJh8stPtLhJYYUigJqwd68mfYk87t5U5kwVokJw>
    <xmx:8AVGarm8sT1IfDr8Bta35nwj2OGx2QUB_NDh00WCJxc_DxNQR4XjhM_M>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 78108182007E; Thu,  2 Jul 2026 02:32:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1tGRektYJZw
Date: Thu, 02 Jul 2026 08:31:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Message-Id: <e654a239-6239-49ea-8ce0-0521ab7f9ac8@app.fastmail.com>
In-Reply-To: <CADkSEUhif4s5sSHe-bMapxEiM4bksaNkS+R5EtWOV2kgsk-29w@mail.gmail.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-6-arnd@kernel.org>
 <CADkSEUhif4s5sSHe-bMapxEiM4bksaNkS+R5EtWOV2kgsk-29w@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] ARM: turn CONFIG_ATAGS off by default
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_233218_482435_82D7670E 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 2, 2026, at 00:22, Ethan Nelson-Moore wrote:

>> --- a/arch/arm/configs/stm32_defconfig
>> +++ b/arch/arm/configs/stm32_defconfig
>> @@ -20,7 +20,8 @@ CONFIG_ARCH_STM32=y
>>  CONFIG_CPU_V7M_NUM_IRQ=240
>>  CONFIG_SET_MEM_PARAM=y
>>  CONFIG_DRAM_BASE=0x90000000
>> -# CONFIG_ATAGS is not set
>> +CONFIG_FLASH_MEM_BASE=0x08000000
>> +CONFIG_FLASH_SIZE=0x00200000
>
> ^ These shouldn't be here - they depend on CPU_ARM740T || CPU_ARM946E
> || CPU_ARM940T, and they were manually removed previously. If they got
> added when you did make savedefconfig, I'm not sure why, given that
> dependency.

This likely happened during a rebase

> Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com> (assuming
> these issues are fixed)

Thanks, fixed all now for v3

      Arnd

