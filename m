Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAC5105F7B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgHcLh85D6RIwPnhEQeV8kJ5EKZn7RVlARTM/mjlfW0=; b=16o+S+Tr2YiqIdfnW8TxR3SGIb
	g5g3af7mVjWPi8+01SqT3GXUFgquXqNWqSAUUXl1SIjFv7VHRm+5J+dccceezWIT2+pIVggytfzev
	21w8mTHrWZu/o0MgfGYM3eE/2edqXuP9c97oK/b3HzglAdNGWgXZps7r+amiNd3r3kH1XkVRJpGYs
	inEaWFRSGGuj4xaM1PmrWAOSm/N9PYcoiQYrsFHB5kSkL9f/p1Zhzh874mFsTw+YE9u9ea5M1TZkl
	yYL09TzWkhQ+foWHxbeoemh1dPwbM+Cek42NDB9fbPZ9CjHkZ2en4sPY3C/11Cp1xPWgN6iycfgSX
	0EBwAgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KTg-00000001de2-1vVt;
	Sat, 14 Mar 2026 08:36:08 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KTd-00000001ddb-2FPe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 08:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YgHcLh85D6RIwPnhEQeV8kJ5EKZn7RVlARTM/mjlfW0=; b=KIZvlHTYTuLBuzJS5wB/91kZ/9
	9EL+MVOeirSz2hFFikWkmWzT2Y2SmzvMMBSC42pzy4Hb93lMF2dSK+yAuJywsKJeCwDFfaP/gAKnH
	SW3QuwJy+qSfjxTm579/DH7fdhKelpnI9WlFI0MzFSASm9WSSmi6sjytsRz6Cyhmi8UXz4/DO0BA8
	mQ5vA4TvS2IWpMNxxgK6ZWlykePOl/QmkzqiBHWY6Sl+C1QuTlAy+9P3x6AYXURHrxQNpYn5vkzYN
	zcl3wEzOB4HdkcVLX1EBUDRXQj5giMujhxT9KKh2D9K0XdeYh+TeLaEQpD0I0YEUkEX1lqk4KP2od
	ES2XfWpw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1w1KTD-000GQP-1T;
	Sat, 14 Mar 2026 09:35:39 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1w1KTB-0000Qo-0t;
	Sat, 14 Mar 2026 09:35:38 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 08:35:35 +0000
Message-Id: <DH2D8WNRXPUD.1205964NAEFPF@folker-schwesinger.de>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260309072822.5016-1-rahulnavale04@gmail.com>
In-Reply-To: <20260309072822.5016-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27940/Sat Mar 14 07:24:47 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_013605_872481_921EFDDF 
X-CRM114-Status: GOOD (  12.33  )
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

On Mon Mar 9, 2026 at 8:28 AM CET, Rahul Navale wrote:
> I have applied provided patch (with kept RFC patch and debug stuff) and w=
ith
> 7e01511443c3 applied. logs:
>
> root@pdm3:~# dmesg | grep ptr_res
> [  198.997591] ptr_res: ptr =3D 0x00000000
> ...
> [  199.242820] ptr_res: ptr =3D 0x00000000
>
> Also I have applied provided patch (with kept RFC patch and debug stuff) =
and with
> 7e01511443c3 reverted. logs:
>
> root@pdm3:~# dmesg | grep ptr_res
> [   60.480754] ptr_res_no: ptr =3D 0x00000000
> ...
> [   60.600877] ptr_res_no: ptr =3D 0x00001770
> ...
> [   60.725869] ptr_res_no: ptr =3D 0x00002ee0
> ...
> [   60.850877] ptr_res_no: ptr =3D 0x00000000
> ...
> [   60.975869] ptr_res_no: ptr =3D 0x00001770
> ...

This confirms that the residue_granularity field in dma_slave_caps,
which gets properly set since 7e01511443c3 affects progress tracking in
the PCM DMAEngine layer. Since Xilinx DMA advertises residue reporting
with segment granularity [1], PCM DMAEngine switches from software based
[2][3] progress tracking to hardware based progress tracking [4].
From my understanding however, residue reporting of the Xilinx DMA is
incompatible with what the PCM DMAEngine expects. So the progression
pointer is stuck at 0.

As I'm neither an expert in the PCM subsystem nor very familiar with
residue reporting of the AXIDMA (and its limitations), I can't propose a
solution that fixes the issue for you. I did a quick check of the code to
see, if there is any way to force the DMAEngine PCM layer into software
tracking from your custom driver. But I think there's no API to
force-set the SND_DMAENGINE_PCM_FLAG_NO_RESIDUE bit in
dma_engine_pcm->flags from your custom driver.
Maybe there's a way to establish compatibility between PCM and AIXDMA in
this regard. But to figure that out, I think more eyes on the issue from
the audio experts and Xilinx/AMD engineers familiar with AXIDMA residue
reporting would be needed.

Just to double check, and to make sure the regression you're seeing is
not a combination of any additional, yet unknown side-effects, could you
perform one more test?
In dmaengine_pcm_pointer() (the function we just patched), could you
replace the call to snd_dmaengine_pcm_pointer() with
snd_dmaengine_pcm_pointer_no_residue() while keeping 7e01511443c3 active
and test if this fixes your issue or not?

[1]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma/xilinx/xil=
inx_dma.c#L3284
[2]: https://elixir.bootlin.com/linux/v7.0-rc3/source/sound/core/pcm_dmaeng=
ine.c#L136
[3]: https://elixir.bootlin.com/linux/v7.0-rc3/source/sound/core/pcm_dmaeng=
ine.c#L235
[4]: https://elixir.bootlin.com/linux/v7.0-rc3/source/sound/core/pcm_dmaeng=
ine.c#L251

