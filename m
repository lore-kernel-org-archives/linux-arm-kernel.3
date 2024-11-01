Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF2E67490
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbrqKqCKy/69ZZEPCdhI8cvH56hgsKYmyoMVj5JoKhA=; b=KG311YEwki7nQaGpgRPLLEGp5f
	viMe6/57DC52EVbpbnT/v/hReEguIgGUZSjesrA4TwYqEMyd7eekM1s/I8+ZzWnJs9Bz3JLmMwzQ7
	D7SBL+AJi7RQKTyK2ZyGyC6ZDakKj0lmo5TYFFmKwVdA+fxEc/stezGJJs6qgQeWv2S1O4tMs3+h/
	EB6x6GNOqAktyDOtk1eG05aWXmvjKklzjlZQ6cJC9jKYj6s785iI50rGWfZf0MRj/icHGOLUY02Gr
	E9PKwbvBLyAfMyertcj0JgWX85HmWRLvzM7yUbeBYtFnClnibRXiyW6smrRoZepFgQIkB8VNYXAqZ
	XFtqfi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fMW-00000005H4U-2fpq;
	Fri, 01 Nov 2024 00:18:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fKr-00000005GkM-0x3h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09F4AA44C36;
	Fri,  1 Nov 2024 00:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288EEC4CEC3;
	Fri,  1 Nov 2024 00:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730420175;
	bh=r4jj0LH5RQvdecZM1M4ycQJejrglh2pgKdlUTHIpaFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mKNmiPW7+Ov3Ib7mGxuDadu1x8DOtgI7AFtQjgFPc8Q2gQjZi8DuQYIDtS9Moe4iw
	 8thCv71U/qrfAU8wOObC7RYDdeIwWX7sBsGWWvcsUj7VVtojCrkZAUjp/00TkDznGU
	 ge37UIa/kJC8I+QqUaDh53HpjUPUd6lpf3bI0lowU8LlfbPH0oIy83kPQv9z1kbR2S
	 ENnBOjg4RIyU8AxJMB14K/YAMeOigVHNddy4WUrUqSoJd+2LmXIcBs5OwgOdV2zUU9
	 JnHSZHPQgFWIm1Yfja/kGT17jz7nxrcz9bMaXDJCZDOjxtRTqLPpeiCWvlebMP1VSg
	 QnvLO3q4A2LQg==
Date: Thu, 31 Oct 2024 17:16:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <horatiu.vultur@microchip.com>,
 <jensemil.schulzostergaard@microchip.com>,
 <Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
 <UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
 <ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v2 10/15] net: lan969x: add PTP handler
 function
Message-ID: <20241031171613.565e6eb7@kernel.org>
In-Reply-To: <20241031093628.faiupqqny7oco7uz@DEN-DL-M70577>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
	<20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
	<20241030180742.2143cb59@kernel.org>
	<20241031093628.faiupqqny7oco7uz@DEN-DL-M70577>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_171617_372216_71C6E229 
X-CRM114-Status: GOOD (  16.13  )
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

On Thu, 31 Oct 2024 09:36:28 +0000 Daniel Machon wrote:
> > For a followup for both drivers -- you're mixing irqsave and bare
> > spin_lock() here. The _irqsave/_irqrestore is not necessary, let's
> > drop it.
> >   
> > > +             spin_lock(&sparx5->ptp_ts_id_lock);  
> 
> Hi Jakub,
> 
> I agree it seems wrong to mix these.
> 
> I just talked to Horatiu, and he mentioned posting a similar fix for the
> lan966x driver some time ago [1]. Only this fix added
> _irqsave/_irqrestore to the ptp_ts_id_lock - so basically the opposite
> of what you are suggesting. Why do you think that the
> _irqsave/_irqrestore is not necessary?

Oh, I thought this is a real IRQ handler, not a threaded one.
I haven't read the code to figure out whether ptp_ts_id_lock
needs to be IRQ-safe, but in other places you lock if _irqsave
so yes, let's irqsave here, too.

