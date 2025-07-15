Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBB2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuiOFDsb+Yy7b83u6Laos/vj+Kfk3b+KNqzjnxRQGt0=; b=gBz43GqoZPV45sP/gd0ZpMNZFa
	y/5K057MNC8m7M0i/PTtSD5MsGbLffnYunNh2JZQFlCjQRYV4gpabn/EHmrhzkXh57ZS2+2iPt03q
	p7qECiVVG/ZHtH4iEb3WGrQ5nz7JpIIees+mULOJ4FHwIL1g61r6sjL4ij19CO7/vQf4zR8SXm53K
	EHUWMUKH8HMhEnD3Y/WA/4MEJ4RN8j3PajL1yLIg+0Ujui7VGbvrkdtxwN5zz5wcEDCBcB+guZmof
	SaqVdEgRvaAjB+XFOLWaP5AvI03K4dh4t0E8k8ZCCZMBmVK7Vmo3yy+LDawJTQXjn+uJauws54+jv
	ieBilXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiXI-00000005keH-45vE;
	Tue, 15 Jul 2025 16:29:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhAo-00000005VbZ-19UY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 951D94541B;
	Tue, 15 Jul 2025 15:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A969C4CEE3;
	Tue, 15 Jul 2025 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752591745;
	bh=exdnCy6Q0C3xztw8Y5wA0w4YeM3tO9kw+ROGW6J34Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3nVs5JArxYZr5IH2Ok+/K4hHyHoWBVdGIoU6WY8tNh0eZVhrimCIIocOoTFKgPJd
	 ZY8KvLnsN9tFCaasqmMFKfi17RPbEEOvbvE1XJIf72g/np8VLh7I+KENFzR+c6mJ1/
	 lREjBaJpi3lTbwvoKrglymKwsd2cFD6hR2i+eNWA11UDOgOzp+dBD2/d1FHvGiZMOO
	 7smub8SEg4+w2NOnrTOBV8tyvOb5iUl/7hAf/J63avI/ml4S8tKpDgM6GIPX8N/Qqe
	 0PRTfmcpzkLp+wV/p2hKVJhMhgdC9QZH8kjTRduAUoGsgh6ImOHdA7WFvZKdPrx1Pm
	 mBI+wFd67+pHw==
Date: Tue, 15 Jul 2025 10:02:24 -0500
From: Rob Herring <robh@kernel.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Le Goffic <legoffic.clement@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/16] arm64: dts: st: add LPDDR channel to
 stm32mp257f-dk board
Message-ID: <20250715150224.GA1319886-robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-6-cdece720348f@foss.st.com>
 <20250715032020.GB4144523-robh@kernel.org>
 <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_080226_331316_196447C6 
X-CRM114-Status: GOOD (  18.17  )
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

On Tue, Jul 15, 2025 at 10:32:09AM +0200, Clement LE GOFFIC wrote:
> Hi Rob,
> 
> Thanks for the review !
> 
> On 7/15/25 05:20, Rob Herring wrote:
> > On Fri, Jul 11, 2025 at 04:48:58PM +0200, Clément Le Goffic wrote:
> > > Add 32bits LPDDR4 channel to the stm32mp257f-dk board.
> > > 
> > > Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> > > ---
> > >   arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> > > index a278a1e3ce03..a97b41f14ecc 100644
> > > --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> > > +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> > > @@ -54,6 +54,13 @@ led-blue {
> > >   		};
> > >   	};
> > > +	lpddr_channel: lpddr4-channel {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +		compatible = "jedec,lpddr4-channel";
> > 
> > Not tested because this doesn't match the binding.
> 
> Hmm, I've tested with make dtbs_check and dt_binding_check and it didn't
> complain on my side.
> What I have miss ?

Oh wait, we already have a binding for that. I was confused with your 
adding "jedec,ddr4-channel". Sorry for the noise.

Rob

