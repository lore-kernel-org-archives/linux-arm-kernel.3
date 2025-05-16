Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FF1C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtgMeFB8RrC94cCAvkvxf9A+3JCML5ZxUFcc1oF3lVA=; b=hQLjVrl8DOrGPgbspPxBw/5v8f
	hfss04JORpVWKjbt5Ycp12PiXSrlcv43609CdTOPy5nJJ5GTPnfeiU+Mz68MOQoYQXFgynZ8lcqh2
	ws+o6RC7mGW9q4VgvupCwZisAq2dGpV4fT3Yv7qqmNPKsQjNrJZicL9KzL1uKeUfPQPxRmDjBPcDy
	5Za7LYMEwYE8SDSifo8MTMPcRLXS1+o11oqiSJCx+4Cs+bPMIiZ5AD6wM5SuPA8XOAcQheF5qJZ94
	pfhxpA7QgkXxhIsIKs8h0J3ALhBU8XhCK/PsdgT4epf+jwjMJfrpzoXdKyIVS9JlEmh0rGQ1qjJx/
	B29nbOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwez-00000003msX-3Dtp;
	Fri, 16 May 2025 15:07:41 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwG3-00000003hGl-20Ri;
	Fri, 16 May 2025 14:41:57 +0000
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 8B1152003C8;
	Fri, 16 May 2025 16:41:39 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 0F44CC4D6; Fri, 16 May 2025 14:41:38 +0000 (GMT)
Date: Fri, 16 May 2025 14:41:38 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: Searching for firmware timeout cause (was: [PATCH]
 firmware/raspberrypi: raise timeout to 3s)
Message-ID: <aCdOooM5a_zx6MO4@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
	Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
 <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
 <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
 <aCZqVzM5h9lwbfpQ@Z926fQmE5jqhFMgp6>
 <77f25ee5-1079-4729-866c-cfdeeff1ad9a@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77f25ee5-1079-4729-866c-cfdeeff1ad9a@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_074155_675135_DD0A3725 
X-CRM114-Status: GOOD (  34.89  )
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

On Fri, May 16, 2025 at 01:17:41PM +0200, Stefan Wahren wrote:
> Am 16.05.25 um 00:27 schrieb Etienne Buira:
> > Hi Stefan
> >
> > On Thu, May 15, 2025 at 07:48:04PM +0200, Stefan Wahren wrote:
> >> Hi Etienne,
> >>
> >> Am 15.05.25 um 13:48 schrieb Etienne Buira:
> >>> On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
> >>>> Am 15.05.25 um 11:44 schrieb Etienne Buira:
> >>>>> Hi Stefan, and thank you for your interest.
> >>>>>
> >>>>> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
> >>>>>> Hi Etienne,
> >>>>>>
> >>>>>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
> >>>>>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> >>>>>>>> Hi Etienne,
> >>>>>>>>
> >>>>>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
> >>>>>>> ../..
> >>>>>>>> Out of curiosity and because i never saw this issue, could you please
> >>>>>>>> provide more details?
> >>>>>>>> There is nothing connected to HDMI 0 & 1 ?
> >>>>>>>> Which firmware version are you running?
> >>>>>> Please provide the dmesg output, so we can extract the firmware version.
> >>>>> Firmware version is 2025-02-17T20:03:07, i also attach the full gzipped
> >>>>> dmesg, as long as a patch of extra traces used.
> >>>>> I did not specifically test other firmware versions for the timeout
> >>>>> issue (but i did for video output).
> >>>> Thanks, i'll try to reproduce.
> >>>>
> >>>> Sorry, i forgot but is this reproducible with a recent stable 6.12.x kernel?
> >>> Just reproduced with pristine 6.12.28.
> >>>
> >> okay, i've update the firmware on my older Raspberry Pi 4 to the same
> >> version as yours. But even with your configuration i don't see this kind
> >> of fallout. So I think we shouldn't apply this patch until we really
> >> know what's going on.
> > Ok, thank you, did you make sure a powered hdmi sink were connected? I
> > noticed there is no timeout if no hdmi is plugged (but there were when
> > monitor were powered off, maybe specific to my monitor).
> Yes, HDMI monitor was connected to HDMI 0 and powered on. Raspberry Pi 
> OS started as expected.
> 
> The fact that your SDIO interface triggers a warning, which I also don't 
> get let me think this is not just related to HDMI interface.
> 
> [    3.603736] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> [    3.603739] mmc0: sdhci: Sys addr:  0x00000000 | Version: 0x00009902
> [    3.646852] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt: 0x00000000
> [    3.646856] mmc0: sdhci: Argument:  0x00000000 | Trn mode: 0x00000000
> [    3.646859] mmc0: sdhci: Present:   0x01ff0001 | Host ctl: 0x00000000
> [    3.665697] mmc0: sdhci: Power:     0x0000000f | Blk gap: 0x00000000
> [    3.672214] mmc0: sdhci: Wake-up:   0x00000000 | Clock: 0x00003947
> [    3.678736] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
> [    3.685254] mmc0: sdhci: Int enab:  0x00ff0003 | Sig enab: 0x00ff0003
> [    3.685257] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [    3.685260] mmc0: sdhci: Caps:      0x00000000 | Caps_1: 0x00000000
> [    3.712672] mmc0: sdhci: Cmd:       0x00000000 | Max curr: 0x00000001
> [    3.719186] mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]: 0x00000000
> [    3.725708] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]: 0x00000000
> [    3.732230] mmc0: sdhci: Host ctl2: 0x00000000
> [    3.736724] mmc0: sdhci: ============================================
> [    3.819205] mmc0: new high speed SDIO card at address 0001
Hi Stefan

I think this warning is because there is nothing in SD slot (i boot from
usb).
> >
> >> You don't have another Raspberry Pi 4 by any chance?
> > No, i don't.
> >
> >> Another cause might be the toolchain. Currently I use a not so fresh gcc
> >> 11.3.1 from Linaro.
> > Previous tries were cross built. I tried a native build with (Gentoo
> > packages) gcc 14.2.1_p20241221, binutils 2.44, and glibc 2.40-r8; but
> > got same result.
> > Will do a software upgrade overnight to try with more up to date build
> > system.
> I will try to update my toolchain, but this will take some time.
Ok, thank you.
I updated the whole thing, but no change in toolchain versions. I'm
trying to get a gcc11 based one.
> >
> >> Except of this, I noticed that your configuration doesn't enable
> >> DWC2_DUAL_ROLE and the LEDS_TRIGGER.
> > I have no use of them (and i have a lot of things to disable, but i
> > prefer to do that starting with a working system).
> I this case you can disable DWC2 completely, because USB host is 
> provided by xhci driver. LEDS_TRIGGER is used for the ACT LED as heartbeat.
Ok, thank you.

Regards.


