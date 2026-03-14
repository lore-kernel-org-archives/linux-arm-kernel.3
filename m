Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A566105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg0oVFRscnlmYy+Eh/DH0v3AyH+o/BdVyC5aCHMXo/o=; b=dRA3QVP43FwLBOdzyC3H8Qvfds
	9GcSITi/U/d5PhIvI5xrZKWTmmCOMUJ9R/Rw4gBcPykBvQ4oobvwn4kX7zt00knX7WdSLJaWOgdGk
	+QVRzl6RhrC2g35+DF0IveNonPyFadDd6Uh8/1ay2ildbXICv36RQ/8UBOKAVMctZYy5K5pL5zPvq
	yGaY00x9Xfu0EcYn1xniNc74tgcltvaU2rKpqsjBGtdB025HJ/LWFvpkHjerjfaE3+x5gxpc9TqRS
	COvtZT1GHpMJzzGhRj5Yyw7Rk1GK/0epd71Xc1wcr2UGuRXaagFpvnyvyxtHHY7Rm7vmr/yfsaZod
	5vOIyCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Kcm-00000001dzv-2xa6;
	Sat, 14 Mar 2026 08:45:32 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Kci-00000001dzY-1alo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 08:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Pg0oVFRscnlmYy+Eh/DH0v3AyH+o/BdVyC5aCHMXo/o=; b=q84TXm9tunwc9vj6azWkRxpIy2
	FWFOuqEtx3jMzqBnQWhpH7NpVz/H9lUPGti7Ex6ittsHQ1TZtvJlwwyCJozJweSAhyzLlO/979lBu
	rXgeSzdPzA99Zord2OfPYzXyER2kehKQy2AyIktwzprg/yZsd93OFyr1C3yGLQbaOV5b02HnwtFY0
	R+/Tfz15ro0putZ9g6np/gVVtolTo9gXIhmCpZSTRZI9KSzo2R5RTP91wtg0tnNP1QmDz2CwVVX/H
	Z4BcjAHSlIVIIY2J9cRk22Lpcl1K1yGKTk++7EZ5yebeqlMbe74bRGiXMkNQhoYKYQXXKAI1f3uaj
	oW9XTfjg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1w1Kcg-000HtS-1S;
	Sat, 14 Mar 2026 09:45:26 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1w1Kcf-000M4O-0A;
	Sat, 14 Mar 2026 09:45:25 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 08:45:23 +0000
Message-Id: <DH2DGEG9CHLG.1WO05WV70B987@folker-schwesinger.de>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Cc: "Vinod Koul" <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>,
 "Michal Simek" <michal.simek@amd.com>, "Suraj Gupta"
 <suraj.gupta2@amd.com>, "Thomas Gessler"
 <thomas.gessler@brueckmann-gmbh.de>, "Radhey Shyam Pandey"
 <radhey.shyam.pandey@amd.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Rahul Navale" <rahulnavale04@gmail.com>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: <dmaengine@vger.kernel.org>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27940/Sat Mar 14 07:24:47 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_014528_423175_F1285DA7 
X-CRM114-Status: GOOD (  15.17  )
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

On Tue Feb 17, 2026 at 7:49 PM CET, Folker Schwesinger wrote:
> Since commit 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device
> directions") all channel directions are aggregated into
> dma_device.directions so that dma_get_slave_caps() works for IIO
> DMAEngine buffers.
>
> However, this caused a regression in ASoC audio on ZynqMP platforms,
> that causes cyclic playback to fail after the first buffer period,
> because ASoC dmaengine PCM expects fixed per-channel direction reporting
> from dma_get_slave_caps().
>
> Implement optional device_caps() callback and override caps->directions
> with the channel's fixed direction. This keeps device-wide direction
> reporting for IIO intact while restoring correct per-channel semantics
> for ASoC.
> Other dma_slave_caps fields are left unchanged from their respective
> values initialized from dma_get_slave_caps(). In case there should ever
> be the need to override other fields, these can be added later.
>
> Fixes: 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions")
> Cc: stable@vger.kernel.org
> Reported-by: Rahul Navale <rahul.navale@ifm.com>
> Closes: https://lore.kernel.org/dmaengine/20260211140051.8177-1-rahulnava=
le04@gmail.com/T/#u
> Closes: https://lore.kernel.org/dmaengine/CY1PR12MB96978AEBD6072FC469DFEA=
F1B762A@CY1PR12MB9697.namprd12.prod.outlook.com/T/#u
> Signed-off-by: Folker Schwesinger <dev@folker-schwesinger.de>

@Xilinx/AMD maintainers:

Even though this patch does not fix the reported regression and there
may not be an immediate need for the implementation of the device_caps()
callback, it might be an improvement to the Xilinx DMA driver. In case
you see value in that addition, let me know and I resend the patch with
the necessary editorial changes.

Also during the debugging session, the following was identified:

> From a quick trace through the code I found that in the Xilinx DMA
> residue_granularity is set for AXIDMA independently from the SG setting
> of the DMA core [1].
> However, in xilinx_dma_tx_status() one of the conditions for residue
> calculations is that SG mode is enabled [2].
>
> [1]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma/xilinx/x=
ilinx_dma.c#L3284
> [2]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma/xilinx/x=
ilinx_dma.c#L1293=20

Not sure if this needs addressing, but this could have the potential for
subtle bugs...

Best regards
Folker

