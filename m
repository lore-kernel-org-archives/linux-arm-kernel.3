Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA178D597B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmaF3NlubL54V5+IH9CvKXoD4K1OzTYmIrjW7EvYFc4=; b=QrIpu/JOVfDtq038YWl8ulxjkk
	/hPod8dhACKXhKMLSks0Z7HzX6QeAWquX4jx+wEpgazYiHdJDpqKHmsnGbRqoRR1MtvxzObtw5wn9
	bPjWorKaz4BEnnCSAKUWmlYoJNui5ZyhKZkmRZo1HgFRsdlGeNMJyj+6l8d+Ky5xe2zCH1bZRNn6h
	cK52LHljefb6Jt/KxMQWVWuuJFc8XzodTCyjVcL823WYRzAR+x8JA++JNHyTpxdVaG8mxs7yDGPS6
	YWq55CLrnz8TP00HqN5jhW3nL75Gvk5lzlvcLzSwYE7Dby12dmYhaIzrP4l6ixUITa7lbbL4VZDNU
	dYZriPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzcG-00000005B2l-1vPu;
	Tue, 12 Nov 2024 22:44:08 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzaS-00000005AmH-2v1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 22:42:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74B4D1BF203;
	Tue, 12 Nov 2024 22:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731451329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmaF3NlubL54V5+IH9CvKXoD4K1OzTYmIrjW7EvYFc4=;
	b=g1Yf5QN7KzgUfBDkeE+lIR43of5g55rveEuBu5jG3b72qHRRuUgy56D7vqigFMz3WYgoSg
	DTA9HvjfHzSFlqGF+5LF8LIOSX4F0pWK/bZU/nBLBX1KEKo71mo7mQNkVdsopehW4K3BeV
	WkBpBVTAXTWKXT1ZUyKStlFoDhanRWNXSkaYbVD5S8GOnxOJktSpcODI0almPAz22CSpam
	uAyiydzOB5ZWokmaUFkclZ5OUAdMdl7kNeaPeREh84Xa3Do3XJa31gu3ehX6gILtBkt+tN
	WiIgeLW8E0xuMEIJzl4PtEPSOQ0VKITwBKo+sp/yUO0z7jocdyLx3jjZfYblJg==
Date: Tue, 12 Nov 2024 23:42:06 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, "Lukas F
 . Hartmann" <lukas@mntmn.com>, Michael Turquette <mturquette@baylibre.com>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
Message-ID: <20241112234206.558d5d5e@booty>
In-Reply-To: <20240531202648.277078-1-marex@denx.de>
References: <20240531202648.277078-1-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_144217_167457_C49D0354 
X-CRM114-Status: GOOD (  17.45  )
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

Hello Marek, Abel,

+Cc: Miqu=C3=A8l

On Fri, 31 May 2024 22:26:26 +0200
Marek Vasut <marex@denx.de> wrote:

> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> Allow these clocks to reconfigure the Video PLL, as that results in
> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> clock accuracy is low.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

I'm afraid I just found this patch broke my previously working setup
with a panel connected on the LDB. As we are at 6.12-rc7, and this
patch got merged at 6.12-rc1, I'm reporting it immediately after a
quick preliminary analysis in order to hopefully find an appropriate
solution before 6.12.

Problem: with this patch, my LDB picture is horizontally shrunk by a
factor of about 7, measured empirically.

Configuration:
 - lcdif1 and lcdif3 disabled
 - a single-channel LVDS panel on lcdif2/ldb channel 2

So this problem looks like different from the one reported by Adam as
there a single panel and still it stops working.

The relevant rates in my case are as follows:

                            video_pll1   media_disp2_pix    media_ldb
                          ~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~
at boot, panel still off: 1.039.500.000    1.039.500.000  1.039.500.000
requested LDB clock:                                        503.300.000
before this patch:        1.039.500.000       74.250.000    519.750.000
after this patch:            71.900.000       71.900.000     71.900.000

Previously, the resulting media_ldb clock was not precise, but close
enough. Now the value is clearly too wrong to work. Also (but my memory
might be wrong here) there must be a ratio of 7 between media_ldb and
media_disp2_pix, which has become 1 after this patch, and this perhaps
explains the shrink factor of about 7.

I double checked the rate that fsl_ldb_atomic_enable() is requesting at
[0] and it is 503.3 MHz with and without the patch. This is proved by
the logged line, before and after the patch:

fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (519750000 Hz) do=
es not match requested LVDS clock: 503300000 Hz
fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (71900000 Hz) doe=
s not match requested LVDS clock: 503300000 Hz

My preliminary conclusions:

 * it looks like a bug leading to an incorrect computation of the
   video_pll1 rate when media_ldb is requesting its rate
 * the bug does not look like due to this patch, but exposed by it

I still have no idea how the video_pll1 gets configured to such a low
value when its child needs a 500+ MHz clock.

Any clues or ideas would be welcome.

Best regards,
Luca

[0] https://elixir.bootlin.com/linux/v6.12-rc7/source/drivers/gpu/drm/bridg=
e/fsl-ldb.c#L180

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

