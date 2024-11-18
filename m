Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52D7D43FEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ao01Wk1L8ovJSFzyxIoIbtQwcFpPjau3arf6TnsWC4=; b=BbQp35TjKl2FM7zsX6iR19vdBz
	IhiHmRw9T6qIsoi+RKozdIPyn5HiczhQMTADJMGRc5Fg1azdDstWnrq2hYOBFJBeLsrLwXzIHOVa3
	UdETGgfDxhfdy9mUV1UpDg28FSnJV3WI4as1AUxhp7XHE7Vz8n/UaMuRp49FsdR1qAa8SNaJ1Pd5Z
	ovwC2MGwY8lFD4TUVqifbiaRah3Ba712S42gEBGr2nzzNMcC2R3nqzcBthHFB6zvMhDFCjOvSSscu
	5biVR7MSkdf09cD0aO9UXdKHgwSGHcwqL+ZPIIosBpypELymXNCsWJMe7/USLCfz1atXlD4O1Z9zF
	Mnp2+fxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwvs-00000008jda-3R3i;
	Mon, 18 Nov 2024 08:16:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwuu-00000008jZH-2pbE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 08:15:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0533BE0002;
	Mon, 18 Nov 2024 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731917725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ao01Wk1L8ovJSFzyxIoIbtQwcFpPjau3arf6TnsWC4=;
	b=F3SrVFMzOPWBSm+hSsjdDXiVsczBJ33ByJQPYBX3fp6umBwWmRSAOZhVWX0UjZFbr5wrhD
	um5RDAD6YqWpEQcE3YqesmtIx+nlNf9u1v72CBS4jBVM5qvoA+l8AQCeUOrN36b/vz1VK0
	1WkWqHBAwsuAYgxgD+BUMUCEyxSeO5oQPsWdDcKQR2iYsgqXKpeM4n0Trq/KqWr7rvp5kf
	u/57eTMf35GfdBMq3RYPirtNtSa5ZPmA/rEChvriHpB8RP4iMDZl4NmsALBPq21iMvUzoA
	C1zQETxrvWInJ1pMRkg4i7zog0p7lps9U2X5Hipv06jmAH4fhT8q1rUKqUX/aA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,  Abel Vesa
 <abelvesa@kernel.org>,  linux-clk@vger.kernel.org,  Fabio Estevam
 <festevam@gmail.com>,  "Lukas F . Hartmann" <lukas@mntmn.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Peng Fan <peng.fan@nxp.com>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Shawn Guo <shawnguo@kernel.org>,  Stephen Boyd
 <sboyd@kernel.org>,  imx@lists.linux.dev,  kernel@dh-electronics.com,
  linux-arm-kernel@lists.infradead.org,  Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
In-Reply-To: <6bc5b8d7-ff10-4860-ac46-1460a7d850da@denx.de> (Marek Vasut's
	message of "Sat, 16 Nov 2024 20:47:07 +0100")
References: <20240531202648.277078-1-marex@denx.de>
	<20241112234206.558d5d5e@booty>
	<79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
	<20241113120622.3501db73@booty>
	<130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
	<20241115180936.4ab56be3@booty>
	<6bc5b8d7-ff10-4860-ac46-1460a7d850da@denx.de>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 09:15:21 +0100
Message-ID: <871pz9c606.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_001529_131072_D80C5D0D 
X-CRM114-Status: GOOD (  16.72  )
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

Hi Marek,

>>> If you really want accurate pixel clock for your panel, you need similar
>>> change to 4fbb73416b10 and configure the Video PLL such that the
>>> accurate pixel clock can be derived from it. The Video PLL cannot be set
>>> to pixel clock, because the LDB serializer clock are either 7x the pixel
>>> clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL
>>> has to be set to 7x or 3.5x pixel clock of the panel, then you should
>>> get accurate pixel clock and a working panel again.
>> I found that I'm having the same issue that has been discussed in some
>> related threads: the lcdif2 configures the video_pll1 to ~72 MHz, and
>> later LDB tries to set it to 7x that value, failing.
>
> Right, which is solved by configuring the Video PLL to the correct
> frequency in DT up front ... unless you have more than one output
> supplied by that Video PLL.

No, this looks like a bug in the imx8 clock driver. I would expect the
core to handle such case without DT hack. It is not okay to fix clock
frequencies in DT because drivers are failing to do it properly. I
understand there are advanced/dual cases with very specific frequencies
where you don't expect it to magically work and giving hints with DT
assigned-clocks* properties makes sense, but here I don't think we
should consider it as a proper fix.

If I may recap:
1- a simple display pipeline works
2- the pixel frequency could be more precise so the video_pll1 parent is
   used to dynamically compute a better frequency
3- the video_pll1 parent is too low in some cases which breaks the
   pipeline
4- we need to force video_pll1 to a value in DT

How possibly 4 could be a relevant answer to 2, seriously? May I return
you the advice, if you want a better video_pll1 value in the first
place, why not assigning it up front in DT?

I understand your goal, and I agree with it, but please acknowledge that
even though the current patch looks fine per-se, it is exposing a real
bug that is now visible. Hiding it with DT properties feels really wrong.

Thanks,
Miqu=C3=A8l

