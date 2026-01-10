Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57B6D277EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niKD7lwOtoha0TRVTxtTbBYIAZIgplZuxoTzqvKJ568=; b=iARQSUaVHEbz/GMptfbVg5Iosm
	vFToDHltL4Gg4AyXxp04/UpbyuyawDGf07iUwmGJmGfKSJGKhBj9ZHT2tYzaMkERnZTW2Lce+pg46
	C2ruQAD8591Z7m2rSRSXLTaJgrgYGzFYdFJAxoZ3wDbhqu/SY/q6xTStsY8n/K8SnoUlLJKUsyGkM
	IvlZtn39l9GlYlhMNYBV76xqjOXIIrSliTkUbsT0PZNgJHsx+MIOG1aA3jd7QcLOrCF+nDuhAwslg
	yTfV8eauart/ZByw02M4mIUUEGaDcYqPn/VDyNVe/XMqzEp9CQQvQrJX7IUdkwL8szXN3BIVEd/7Z
	ZuvCdphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veZEU-00000003TZl-30PB;
	Sat, 10 Jan 2026 13:42:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veZER-00000003TZO-0ltB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 13:42:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso41171275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 05:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768052536; x=1768657336; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niKD7lwOtoha0TRVTxtTbBYIAZIgplZuxoTzqvKJ568=;
        b=J6JU4wZ44Y32ivAyjRAhgiajjz49CCSpeG4g5x/GdToMXx8yPPSP3+jTmFrjHWD4Xt
         m4Tk+IdR/a+Hvw4Qer5pKaeDRC2PfQgcnJci5IKgVlrC6/9JmnwQmVJjhfoU0uMZGrei
         fclSK/sAG4S15AZf4PeQXhEf/KUqya6XV0MfWoRGYmBMfw7JYFnmr3KqpAM0MIXgEkog
         2/eA2y9znmX7Ez3N6xrHh2nxWVSdglud/A9kkkj2iZniIuuyR902l05G0nw6ns5m2FqG
         IdOxKxz9ou8zUb5NpJ79K11a+Ya0MWNhlV2qOwiUNyzCFZcnFnj7pNDiDGcWtlEWHJfI
         jy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768052536; x=1768657336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niKD7lwOtoha0TRVTxtTbBYIAZIgplZuxoTzqvKJ568=;
        b=Vnsrti4IG798MUPsoRR8eCLeDusTVz8D7cdfLxBZCoBtI/4Wh9rQ7mLtNWS3aOGHSM
         PjWuWo0FiFPVTvs/JCwzywRdDBtaRumyV62yEJU52lBsJuGzZaB+jWOSiXNb01Kbsery
         h/0DO/MVcwhqpbkhuedAz1v1pIOJrR9BSjnfuafxJ/SgzAU2VYMcfPrxQr63UzY6iBw5
         5nKkepzxiHjvh1QLFiHMjQxNsAIddiNk+TpDV0EeOfZAddIPAlIRxV/xtY32RS37KNbq
         /RuqDEbjF+fpOAqlTavZaPBeGROJ1Mv2h47oBc4j1xBEd2rbmW7oD1R4HoPpNE4bkPID
         0BOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqsJqnk13GsxTqxbEX2dogbyim6/BDCxY0GuEJZHNxqNXrpbxid6YrvtW1iPirq6Xhrd9bRURlgjW+VrBb3J/0@lists.infradead.org
X-Gm-Message-State: AOJu0YxCaLVENur4+JdtWNhUqyLKjSqiVUZNdsGjY/t0iEEpN1iXwxyf
	5G2qgvRWPL8jwjsnlzSrCFNDGRjWOf6ezEVSqI62E1XlI+xICo3ktJHu
X-Gm-Gg: AY/fxX6nRw47LFMYPkD12qZAYAPmQiXymaNSZq0pNVhVMMCIzY4R5sdO5Sh/Zg5oRZ+
	BFdAN3rW1S1ewwnVtz7Pt2QiJawiv8xvLSTAwg6diuNvHk/VJh9GDqQoeqLmm6ChdTe8uu+YZml
	g66T+cEW5PI1vLB7P/HTxLjxI9bvbhhPAsRXIHtqssyRFmF0YtBcw+MQ6eIH3jps2Nyv6MbwgaY
	LVd1/3UJmMQJoc6L6M0HCUAtkj+GpjgvPZIb0Mo4Oa18zyQeR4jl3Ht3P2Hrt4/t/wWdQRADaSD
	YzFJfz54bPlKDkr3IyDFgbttaCAH8f0RLqdMXaD6P4LcOHRmqXFuhejNvY1D5MTuj7ZlA7Rk9ay
	SJbgMIklA0BP5tBWRnogSbFBVhKEN7PxTQRPRGAoF4nYMtcYxMDDGnyU4yGjlB5uvnr1XlQqKYz
	dRSm2mL3n71NlZXAGNT5qPiA==
X-Google-Smtp-Source: AGHT+IGNmY6EuRXQMgmECxnNtQwrRUp+VeCi3/b3F25cOPZ8t8M9RwpG6+Ph3Pg2FEMSimcUer23+w==
X-Received: by 2002:a05:600c:4f53:b0:479:1a09:1c4a with SMTP id 5b1f17b1804b1-47d84b3b389mr154806905e9.31.1768052536352;
        Sat, 10 Jan 2026 05:42:16 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6968:58fa:e72d:87c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871ac28bsm85184595e9.20.2026.01.10.05.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 05:42:15 -0800 (PST)
Date: Sat, 10 Jan 2026 14:42:13 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aWJXNSiDLHLFGV8F@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
 <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_054219_293761_DF8DED1A 
X-CRM114-Status: GOOD (  42.54  )
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

Hi Maxime,

On Fri, Jan 09, 2026 at 10:38:30AM +0100, Maxime Chevallier wrote:
> Hi Stefan,
> 
> On 09/01/2026 09:42, Stefan Eichenberger wrote:
> > Hi everyone,
> > 
> > On Mon, Jan 05, 2026 at 06:58:24PM +0100, Stefan Eichenberger wrote:
> >> On Mon, Jan 05, 2026 at 05:09:13PM +0000, Russell King (Oracle) wrote:
> >>> On Mon, Jan 05, 2026 at 05:42:23PM +0100, Stefan Eichenberger wrote:
> >>>> Yes this is correct. ERR050694 from NXP states:
> >>>> The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> >>>> preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> >>>> (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> >>>> be no preceding preamble byte. The MAC receiver must successfully
> >>>> receive a packet without any preamble(0x55) byte preceding the SFD,
> >>>> SMD-S, or SMD-C byte.
> >>>> However due to the defect, in configurations where frame preemption is
> >>>> enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> >>>> byte, the received packet is discarded by the MAC receiver. This is
> >>>> because, the start-of-packet detection logic of the MAC receiver
> >>>> incorrectly checks for a preamble byte.
> >>>>
> >>>> NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> >>>> they show two tables one where the preamble is preceding the SFD and one
> >>>> where it is not. The text says:
> >>>> The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> >>>> between transmission at the source GMII and reception at the destination
> >>>> GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
> >>>> across the GMII. This case may not be possible with a specific PHY, but
> >>>> illustrates the minimum preamble with which MAC shall be able to
> >>>> operate. Table 35–4 depicts the case where the entire preamble is
> >>>> conveyed across the GMII.
> >>>>
> >>>> We would change the behavior from "no preamble is preceding SFD" to "the
> >>>> enitre preamble is preceding SFD". Both are listed in the standard and
> >>>> shall be supported by the MAC.
> >>>
> >>> Thanks for providing the full explanation, it would be good to have
> >>> that in the commit message.
> >>
> >> Okay thanks, I will provide the full explanation in the next commit
> >> message.
> >>
> >>>
> >>> The next question would be, is it just the NXP EQOS implementation
> >>> that this breaks on, or are other EQOS implementations affected?
> >>>
> >>> In other words, if we choose to conditionally enable the preable at
> >>> the PHY, should the generic parts of stmmac handle this rather than
> >>> ending up with multiple platform specific glue having to code this.
> >>> (This is something I really want to avoid - it doesn't scale.)
> >>
> >> From the errata from NXP it sounds to me like it is a configuration
> >> issue by NXP. I checked the following ERRATAs from vendors where I have
> >> access to:
> >> - ST STM32MP1: not affected: https://www.st.com/resource/en/errata_sheet/es0438-stm32mp151x3x7x-device-errata-stmicroelectronics.pdf
> >> - Renesas RZN1: not affected: https://www.renesas.com/en/document/tcu/ethernet-mac-gmac-function-issue-0?r=1054561
> >> - Starvive JH7110: not affected: https://doc-en.rvspace.org/JH7110/PDF/JH7110_Errata.pdf
> >> - NXP S32: affected: (ERR050706 under NDA)
> >>
> >> So from that I would conclude that it is an NXP specific issue and it's
> >> not the full EQOS implementation that is broken.
> > 
> > I just wanted to check whether I should continue with the current
> > approach or if I should instead enable the preamble in the PHY for all
> > MACs. While I prefer the current approach, as the issue lies with the
> > MAC rather than the PHY, I can also see the advantage of always enabling
> > the feature.
> 
> My main concern was that we may end-up with a lot of different fixups
> for the various KSZ-family PHY devices, especially since this feature is
> sometimes undocumented.
> 
> I've gone through the micrel.c driver, and looked at the datasheet of
> most PHYs in there, and so far I've found that to fix this issue, we
> need to set :
> 
> KSZ9131 / KSZ8041: Register 0x14 bit 6
> KSZ8061 / KSZ8051 : Register 0x18 bit 6
> 
> So in the end, the complexity appears to be a bit less exponential than
> I originally thought, we may end-up with only a few fixups in this driver.
> 
> I'd say, I'm fine with you proceeding with this original approach as it
> minimizes the impact and risk to break other setups.
> 
> I'm sorry for triggering this whole discussion only to get back to the
> starting point :(

Not problem, thanks a lot for the feedback and the discussion. I will
then proceed with the current approach and send a new version with an
updated commit message.

Regards,
Stefan

