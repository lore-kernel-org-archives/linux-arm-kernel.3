Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49087EDEBEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Cc:Subject:To:From:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnOXMsr1fKvJfoafP+MS2vYMgdNG+pMu/17zAvxaCpw=; b=JQaTdQdhdC1QS8pCpUsPu9W5uN
	z+/YEqMuT68491m4Sv5rVSlGo+DrrQLYAqeuAJNNvmPhM74aRjGaKVRdsv1hbpmMAZsvu1AsxJJYu
	7inF3W5EYsGf0b6s7d2MyeYbjLnCKUOwDKcENoGhhYx3KfXu02foEF8KxLG3iBl/C8J7fEzLSSAGg
	Pm6yihSXtNP1PVwVthVzrynhLKv6RDuT//AycblzVDyTgwl9Le79KXilNOLSRkyMhfCEliGV/li3o
	vWDvnfgTozkE8W6M5Bu0u2B/yfeZS+BE4hfPjf7p6D3jpZW0yQRF+A9ondaYjWyaQsXJaO78hIgv/
	9BHbMsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW4J-0000000FszF-3Eom;
	Tue, 03 Mar 2026 20:10:11 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW4F-0000000Fstl-0l41
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Cc:Subject:To:From:Message-Id:Date:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MnOXMsr1fKvJfoafP+MS2vYMgdNG+pMu/17zAvxaCpw=; b=CILbhsmeqwjJEoq8Q7ud+gNqVv
	uQVBjs0cGHsIjDTowq18EWbXz/YG/e//te/WwiHgxO16dURU1y9UR0fxT7jVArub9DaMTjO1Ed8vU
	XVOOT4kvNxtqRDoVOiXpAu8P2C+BYqD+/LyDH6TLVhBj7EdLc2Pc8s+yzdp2Itq2IqzOFy5oF9R/P
	pzHiR8fr3nbTE3vEbWMDtvZu/Aw7Jykylpgfsd/whQz7z/1rGkf/CjZRlGbPO8Uoz6speGQetaMBN
	YhRTEXsXHfJRspo28UHnllVOHup6/eRJ3ftufu7PgIeMprDrqVImVLeJzqDPYEwfKGFYg9Ikmq5ie
	QcjXobig==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vxW3p-0003Vp-1y;
	Tue, 03 Mar 2026 21:09:41 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vxW3o-000JEC-2E;
	Tue, 03 Mar 2026 21:09:40 +0100
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 20:09:37 +0000
Message-Id: <DGTF4AVSQZBJ.184UEIYAHWGMW@folker-schwesinger.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260302072433.5091-1-rahulnavale04@gmail.com>
In-Reply-To: <20260302072433.5091-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27929/Tue Mar  3 08:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_121007_553259_4BB24DA8 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon Mar 2, 2026 at 8:24 AM CET, Rahul Navale wrote:
>
> DT for the audio AXI DMA is below. We indeed have two distinct
> AXI DMA devices, each instantiated with a single fixed-direction channel:
>
>   axi_dma0: MM2S-only (playback / DMA_MEM_TO_DEV)
>   axi_dma1: S2MM-only (capture  / DMA_DEV_TO_MEM)

No surprises here, good.

> Debug results with your RFC patch kept, but 7e01511443c3 reverted:
> - Audio playback works (aplay plays normally)
> - No xilinx_dma_device_caps printk output at all:
> # dmesg | grep xilinx_dma_device_caps
> <no output>

From that observation we can conclude that in your good case
dma_get_slave_caps() returns early with -ENXIO [1] while in your bad
case it runs entirely returning 0.

So I think it's reasonable to assume that either (1) the change in
return value of dma_get_slave_caps() causes different behaviour in the
callers (possibly [2][3]; needs verification) or that (2) dma_slave_caps
*caps, whose fields now get populated in dma_get_slave_caps() cause
different behavior in downstream users of said caps.

For the next debugging step I suggest that we focus on (2) but also on
getting some insight into the callers. Could you please reapply
7e01511443c3, keep the RFC patch in place and additionally apply the
below patch?=20

This will exercise your bad case, print the differences for caps, and
also print the call stacks for all calls to dma_get_slave_caps().

Then, please extract & post the relevant dmesg logs.

<-->8-->

diff --git i/drivers/dma/dmaengine.c w/drivers/dma/dmaengine.c
index ca13cd39330b..710da870b8e9 100644
--- i/drivers/dma/dmaengine.c
+++ w/drivers/dma/dmaengine.c
@@ -570,6 +570,27 @@ void dma_issue_pending_all(void)
 }
 EXPORT_SYMBOL(dma_issue_pending_all);

+static void dma_slave_caps_printk(const struct dma_slave_caps *caps)
+{
+   if (!caps) {
+       printk("dma_slave_caps: (nil)\n");
+       return;
+   }
+
+   printk("dma_slave_caps:\n");
+   printk("  src_addr_widths    =3D 0x%08x\n", caps->src_addr_widths);
+   printk("  dst_addr_widths    =3D 0x%08x\n", caps->dst_addr_widths);
+   printk("  directions         =3D 0x%08x\n", caps->directions);
+   printk("  min_burst          =3D 0x%08x\n", caps->min_burst);
+   printk("  max_burst          =3D 0x%08x\n", caps->max_burst);
+   printk("  max_sg_burst       =3D 0x%08x\n", caps->max_sg_burst);
+   printk("  cmd_pause          =3D 0x%02x\n", (u8)caps->cmd_pause);
+   printk("  cmd_resume         =3D 0x%02x\n", (u8)caps->cmd_resume);
+   printk("  cmd_terminate      =3D 0x%02x\n", (u8)caps->cmd_terminate);
+   printk("  residue_granularity=3D 0x%08x\n", (u32)caps->residue_granular=
ity);
+   printk("  descriptor_reuse   =3D 0x%02x\n", (u8)caps->descriptor_reuse)=
;
+}
+
 int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps)
 {
    struct dma_device *device;
@@ -584,6 +605,8 @@ int dma_get_slave_caps(struct dma_chan *chan, struct dm=
a_slave_caps *caps)
          test_bit(DMA_CYCLIC, device->cap_mask.bits)))
        return -ENXIO;

+   dma_slave_caps_printk(caps);
+
    /*
     * Check whether it reports it uses the generic slave
     * capabilities, if not, that means it doesn't support any
@@ -614,6 +637,11 @@ int dma_get_slave_caps(struct dma_chan *chan, struct d=
ma_slave_caps *caps)
    if (device->device_caps)
        device->device_caps(chan, caps);

+   dma_slave_caps_printk(caps);
+   printk("<stack>\n");
+   dump_stack();
+   printk("</stack>\n");
+
    return 0;
 }
 EXPORT_SYMBOL_GPL(dma_get_slave_caps);

<--8<-->

[1]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma/dmaengine.=
c#L593
[2]: https://elixir.bootlin.com/linux/v6.19.3/source/sound/core/pcm_dmaengi=
ne.c#L421
[3]: https://elixir.bootlin.com/linux/v6.19.3/source/sound/soc/soc-generic-=
dmaengine-pcm.c#L206

