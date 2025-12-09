Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2DED3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNF4oF6tZY/gCkRoXoRliKrYOLDoPNsc6ELPW7Fexlw=; b=WmH0hL4CAFXIDsRx1nPkNkj5pk
	sgyHMt4HL4nXXvs8eoEdU9ANWH85i7VeouZfmexkLsXoiao0925TgwyX4UVr066ny8r2W003DoGic
	HptJEpy37xvUQ56CekxAh4sBm3gpLGPJCPkw2UXxIRF4WsczBRLXMb43MuHIoMkQimfgoGUuTfaWs
	2hBG5HiiGa6pzF9wtXbnwTpNmYKviMgqWWPXoxizmCCBM9q5FCo/Ix6AmW6Orl9LbM8Bix+FFuqM2
	AgwhNf331CVOfhnWqOYtYg3qykBL+SadiM7z29Onf/z9ACd6kW1vHcm7nnE0SIB5nZVQSC9UwqkEW
	1cYEuQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxLT-0000000EIJV-0BqD;
	Tue, 09 Dec 2025 13:01:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxLQ-0000000EIIc-1Zcg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sNF4oF6tZY/gCkRoXoRliKrYOLDoPNsc6ELPW7Fexlw=; b=dg8D7Ezl56lz7o0YcwxLF/Bmeg
	CcIFUL2XuKHcnirSqdiMQfi1VEwVG2fcRFuuqkmrYMPEWXKozdGNJEyuqGfym/Pd/wazbbPyv10eF
	y2yfSQoSrwLvqXfFmq9RtdW0SEXpqVvIhbPLY4Z4CZ8qfobhMqlqmPvS0qNUv0nJH2ffDb7P08fdp
	koL5meuoOnDJDT5KsosqJJAfDWZL/8erH347C8mGM5dQGFs/O0cdKDEme9Ymkh0PF1nnRGtK8kNww
	O2R5UXMy7B2vPWp6tqgYOtVs8j6LsMz/S99GkiPF9B+1nlwdBEZC4UOXW0fHIoiOUTXXFzyGTcVl7
	q+JeZ6yg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49898)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSxLA-000000000UH-3V0J;
	Tue, 09 Dec 2025 13:01:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSxL5-0000000061g-329i;
	Tue, 09 Dec 2025 13:01:11 +0000
Date: Tue, 9 Dec 2025 13:01:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: Fix E2E delay mechanism
Message-ID: <aTgdlykiar3SlNox@shell.armlinux.org.uk>
References: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
 <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
 <aTFuJUiLMnHrnpW5@shell.armlinux.org.uk>
 <9f0da5db-e92a-42e2-b788-2b07b8d28cfa@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f0da5db-e92a-42e2-b788-2b07b8d28cfa@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_050132_437357_ACD0014D 
X-CRM114-Status: GOOD (  34.64  )
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

On Tue, Dec 09, 2025 at 06:01:05PM +0530, G Thomas, Rohan wrote:
> Hi Russell,
> 
> Thanks for reviewing the patch.
> 
> On 12/4/2025 4:49 PM, Russell King (Oracle) wrote:
> > On Thu, Dec 04, 2025 at 10:58:40AM +0100, Paolo Abeni wrote:
> > > On 11/29/25 4:07 AM, Rohan G Thomas wrote:
> > > > For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> > > > messages show up for dwmac v3.70+ and dwxgmac IPs.
> > > > 
> > > > This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> > > > Agilex5 (dwxgmac). According to the databook, to enable timestamping
> > > > for all events, the SNAPTYPSEL bits in the MAC_Timestamp_Control
> > > > register must be set to 2'b01, and the TSEVNTENA bit must be cleared
> > > > to 0'b0.
> > > > 
> > > > Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
> > > > addresses this problem for all dwmacs above version v4.10. However,
> > > > same holds true for v3.70 and above, as well as for dwxgmac. Updates
> > > > the check accordingly.
> > > > 
> > > > Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
> > > > Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
> > > > Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")
> > > > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > > ---
> > > > v1 -> v2:
> > > >     - Rebased patch to net tree
> > > >     - Replace core_type with has_xgmac
> > > >     - Nit changes in the commit message
> > > >     - Link: https://lore.kernel.org/all/20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com/
> > > 
> > > Given there is some uncertain WRT the exact oldest version to be used,
> > > it would be great to have some 3rd party testing/feedback on this. Let's
> > > wait a little more.
> > 
> > As I said, in the v3.74 documentation, it is stated that the SNAPTYPSEL
> > functions changed between v3.50 and v3.60, so I think it would be better
> > to propose a patch to test for < v3.6.
> > 
> 
> I tested this on socfpga platforms like Agilex7 which are using
> 3.7x, but don't have any platforms with dwmac <= v3.6.
> 
> > Alternatively, if someone has the pre-v3.6 databook to check what the
> > SNAPTYPSEL definition is and compare it with the v3.6+ definition, that
> > would also be a good thing to do.
> > 
> >  From the 3.74:
> > 
> > SNAPTYPSEL
> > 00		?
> > 01		?
> > 10		Sync, Delay_Req
> > 11		Sync, PDelay_Req, PDelay_Resp
> > 
> > TSEVNTENA
> > 0		All messages except Announce, Management and Signalling
> > 1		Sync, Delay_Req, PDelay_Req, PDelay_Resp
> > 
> > No table is provided, so it's difficult to know what all the bit
> > combinations do for v3.74.
> 
> In 3.73a databook, Table 6-70 has the following information and this is
> similar to v5.1 and v5.3. But don't have 3.74 databook.
> 
> SNAPTYPSEL	TSMSTRENA	TSEVNTENA	PTP Messages
> 00		X 		0 		SYNC, Follow_Up,
> 						Delay_Req, Delay_Resp
> 00 		0 		1 		SYNC
> 00 		1 		1 		Delay_Req
> 01 		X 		0 		SYNC, Follow_Up,
> 						Delay_Req, Delay_Resp,
> 						Pdelay_Req, Pdelay_Resp,
> 						Pdelay_Resp_Follow_Up
> 01 		0 		1 		SYNC, Pdelay_Req,
> 						Pdelay_Resp
> 01 		1 		1 		Delay_Req, Pdelay_Req,
> 						Pdelay_Resp
> 10 		X 		X 		SYNC, Delay_Req
> 11 		X 		X 		Pdelay_Req, Pdelay_Resp

I can't fathom why they would use this table in v3.73a, then put
something different in v4.2, and then go back to this table in
v5.1, so I'm wondering whether any of these tables can be relied
upon. This seems to be a complete mess.

I think the only way out of this is to test this - and I wonder
whether stmmac_selftests.c could have tests added to check which
PTP messages and in which direction get timestamped in each of
these modes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

