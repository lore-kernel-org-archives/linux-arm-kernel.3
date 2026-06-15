Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF40CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jC3QU4FZPqQg1AwNqnbDKfJyL5YE4F9tg8zVHB4z4v8=; b=CSrAya339mTkC6Cvd9bs7VjL8d
	jtPaeLrlp4dxxUcrCr0gr6i8oHg5363OICAIdCCUxRcH7HHuZE35LMZz25kCjORlaEayyni+ek3Q3
	g6Lv1P9mZij6I82uKRt4qjIITgozEHFB1LPGebP0df/qYttVizVofhwgx2VF6xrDWlOgQwEJRhQ6h
	Y14uTAb2iaYviGrm6vxCURNyDO67ex4pe6PdA2v18N/fODMJVd3Dlq1lIAfNMd7r3VF9OHntr67H0
	K5/Z+Uo0CIiZGiwO+rFMyhqgFX7OvroOswwmA/YpNLnUoWHOtTB5AR1UDvmqT7GUWCRsSBnZ4uAxm
	1AK+sb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAUw-0000000EbNP-2A13;
	Mon, 15 Jun 2026 16:49:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAUt-0000000EbLJ-1zle
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jC3QU4FZPqQg1AwNqnbDKfJyL5YE4F9tg8zVHB4z4v8=; b=iCrFXoYMz+xsVQ6gls0oFxtpMc
	jD3or/PzwT5ahterKZkNT0Npz5satnfMPG8wH1nDJtBSVmWfwMQ0gi/OJ7CSigQz8oAVDSSut07Ak
	jBgGPKYkpmLEGO4onHobglR0U5s0zscMls0GFQLmRcJbnH0goFxP2CXCDxrl7Phc9I5M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wZAUZ-007pmW-2P; Mon, 15 Jun 2026 18:48:55 +0200
Date: Mon, 15 Jun 2026 18:48:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai93X/cNWHtEQsDt@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_094915_540400_7534C845 
X-CRM114-Status: GOOD (  25.38  )
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

On Mon, Jun 15, 2026 at 09:24:07AM +0530, Mohd Ayaan Anwar wrote:
> Hello Andrew,
> On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
> > On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
> > > When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> > > the MAC must not add its own.  The driver currently falls through to the
> > > generic DLL initialisation path which programs it to add a delay.
> > > 
> > > Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> > > the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
> > > ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> > > 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> > > ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
> > 
> > I'm curious how this works at the moment? Do no boards make use of
> > RGMII ID? Are all current boards broken?
> 
> Searching through the DTS, I found that we have two boards using "rgmii"
> (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
> "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.

So this causes problems. We cannot break existing boards, yet it would
be good to fix the current broken behaviour.

> I don't think any of these boards have extra long wires which would add
> PCB level delay. They are against the netdev definitions for "rgmii" and
> "rgmii-txid".
> 
> But the first two boards should still be working fine since the current
> driver programs the IO_MACRO to add the delay when operating in RGMII
> mode.

Which is wrong, given the current definition. No delays should be
added, by either the MAC or the PHY.

Please could you contact the Maintainers of these boards and find out
the real situation with the hardware.

It could be the best way forward is that you issue a warning when
"rgmii" is found and pass rgmii-id to the PHY. And you also change the
two boards to use rgmii-id. Lets think about the rgmii-txid case once
we better understand it.

	Andrew

