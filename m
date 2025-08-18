Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F65FCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+Eig7+s4wxy6K1zZko29utmP3JAwA+vR9Jyfi2tqEQ=; b=vNdIwk+3/umuRDyX5TSxYhl7Rn
	X6FRvw0xzMWnt6vlGYM7+jVDcbaIuG+F3W7LC+cvxF2QHiCLKSzETZciD8h0EK4KA1zPtRTAw/dBI
	q71q/3KzvgX8LUyFjY1CwSzRPdqswI15qk+V0Rd21CYolbwCjLJzAM7Hi585XpfxL0YNLTEHpS/zJ
	SPDouXT+KrxAL2mbV/vg7klVmSSGy6CLl/s9wYFTfFcN9/xxXVv9d2J/4ydUlZS+owv2+T2l7jxn2
	SQsWjDWtibwyO2VIuej9h0R//pD++RtFG8FHOjxaTjldr9M0UsyIi7Y/sgosLHsYVLLwUbmie0yz8
	5SB+mZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5ej-00000008XBc-0L50;
	Mon, 18 Aug 2025 19:36:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo52k-00000008Qbp-0uV0;
	Mon, 18 Aug 2025 18:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE95B600AE;
	Mon, 18 Aug 2025 18:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB86C4CEEB;
	Mon, 18 Aug 2025 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543427;
	bh=LLrbrlWI1+1Wrpjrc3PeIRE7Z93HYyEAJTPMZ/3akPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ayVDIn+8U8Wx4EDu34txQp0k4cUvEI7PP0j0IId9lGTOOiHRy6gfy0+DzeATALLY8
	 jTSbQbPNF2xefOSoqneA1b0kFBHRCVNapPVfsbVQEzdlrvh7zVFlMA3GvX4CyPwANC
	 klwjkKeEzA+boXeqgbEyzx2Tt3TM3uOUX/DPs5/P0XDlvo4pUMPgdghgDSofFnAKgz
	 UUdxX76YVQgDB2rGVCLIUQFQ4TJ0SUyq+3wiAg1Osm7lcoByulhsoNb7ZnbbwDUfPT
	 BJZ1ueDbYSGUwQZ3nK6YFm3QY/yE9B/0Ir3H7Q2ZmRc16A5/XDoUGAvBWLcVK/S+eO
	 ozRWNrUGUdxEQ==
Date: Mon, 18 Aug 2025 11:57:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Phil Elwell <phil@raspberrypi.com>, Jonathan
 Bell <jonathan@raspberrypi.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/5] Add ethernet support for RPi5
Message-ID: <20250818115705.72533d08@kernel.org>
In-Reply-To: <68c3db9d-daf5-40ed-91a7-1d08b9c8cb52@broadcom.com>
References: <20250815135911.1383385-1-svarbanov@suse.de>
	<4c454b3c-f62c-4086-a665-282aa2f4a0e1@broadcom.com>
	<20250818115041.71041ad6@kernel.org>
	<68c3db9d-daf5-40ed-91a7-1d08b9c8cb52@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 18 Aug 2025 11:52:28 -0700 Florian Fainelli wrote:
> On 8/18/25 11:50, Jakub Kicinski wrote:
> > On Mon, 18 Aug 2025 11:02:15 -0700 Florian Fainelli wrote:  
> >> netdev maintainers, do you mind if I take patches 2, 4 and 5 via the
> >> Broadcom ARM SoC tree to avoid generating conflicts down the road? You
> >> can take patches 1 and 3. Thanks  
> > 
> > 4, 5 make perfect sense, why patch 2? We usually take bindings.  
> 
> Because that way when CI runs against the ARM SoC tree, we don't get 
> errors that the bindings are undocumented.

Hm, my understanding is that validation should use bindings from
linux-next.. tho I'm not 100% sure. Perhaps DT maintainers can
clarify. This problem exists for all DT changes, unless there's
something exceptional about the patches I'd rather follow the default
process.

