Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5384BF531CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 21:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIvSVDNyRXVMKIryJy1tu7/f3jU7uICWZPfOZkml13I=; b=gNiFixyE7s7XlF0gFh+yOb+ofc
	aw27eoK/I/8Wor381v5kH3Jop4XXm9061Yr/roxLqGrrocGqhyEDdQ1d7+0CrxA42y3tARsPGyDTv
	cnfwjJ+VyYC/ilEaf9eV6c3iIaj8EDuE8eVxBMdPDh2661oqvQhSXbdORpu1ODz8czocyX50Ckfmg
	/SuUr4n7H5L1t+a+ChWx2q8j1XGRh1NbSSnpvxanLE5BY5cojNSwmZnm67JVcVxwKgAipxfhelbOv
	1t99OobIZMzq63hvhdkN3A/mjntE0afv9VJBgJNXY46Seh48M98YZzq1fsheSpbVNTprkOXdorGUx
	bSHydejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPF0-0000000GPnh-2G7R;
	Mon, 13 Apr 2026 21:54:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPEy-0000000GPn3-3Cuo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 21:54:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43cfce3a195so3075078f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 14:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776117283; cv=none;
        d=google.com; s=arc-20240605;
        b=ED8Q+ZiZVvelbN+nuVnxcNZPTRkRlH7gGOLkKKoe+p72fXuRFbg+hKqicFL0z+B3uC
         y2S99eKwK+M7ziEEewgt0yb21DQD8EovoKNw7SwDM8tpff2jxssm9vXT11jlzmBnNPx0
         Xj0WpozclhxBL8vxRWgfWgRjK0ND4hNOT/fwznmXRNt58IDG2RXZYfs/PTfE5Gy/RkM2
         YGE59OdZedb0ti15M/8Efr5JPXUVCLdv6UI9qoCZScYuZR6vY4PRxD0Me1SFcactGwh+
         MHEcYUUQ17Tn8UWVv9K2KF3nGUiSYzyXMTT+a5BtdjDCjVRrZfnT9NvxcdeyDR6+pHkf
         K39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OIvSVDNyRXVMKIryJy1tu7/f3jU7uICWZPfOZkml13I=;
        fh=xx9mPaeIGRw3lA/ng0XZtzT96lHUBHbrv2I75XU4DY8=;
        b=PVNDNXFayVylnyiwIzcfUo+6lCs4JsolQtOjjgImNwvccnnKbgiCcki/Qc25BSGh0+
         8mMmQeNZPqoMGJEPdQbNq70tl3T95oBn9emAF/Dbk0Rr0EMyjzhUabpWMJliWsNIseFs
         Ef1fhbjWE9gwl+M9emUzbWCDhB6pXXILnFdcvV+jireBiyO41Nbx9LxjXlBj4Yk+MSMH
         CDwa7sDO5aLIAmo2qMf2gTEiBEOOQKDrMC9Tr1/Hud1L7o36+HfSdEf/uVieR/SsS7M/
         Lc4CioJrmJhd2ZUtsJs3pAiEd5Zv12M0DDBIHXAE4AgGs1xeIb53GpLLKDzqj6dOX322
         z+dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776117283; x=1776722083; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OIvSVDNyRXVMKIryJy1tu7/f3jU7uICWZPfOZkml13I=;
        b=szviB8uH2WzwAvHHudTvlR8/UeSNO9TwANv0+djtkLBouXzvoFbtwRJ6CxGX5b+ICc
         Wo4CuddB/AthQt33EAEtAE8Pi8Jba9mOHeU+ZDRGheLeJ+lYAYYtYXc+8+h/acqKImzH
         K5QKA5bRx6GivFOrHnI0C2Ho5pAcEWCkhXJrODONsgza7syYanKMzeWMh3szXc1v+jXo
         94u+LYxzEFf2GqULIFM3mJNIavtWwrWmyycHUnyhMv0tYNRVaEnoy+ekrxVmy+j7nyd5
         ZoQWUbHFAhpNAO7lZqRUC+mMXW4DZM4D/bIVCoFKML+uk5mLgspEkNqVwYOBFusWbL87
         VSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776117283; x=1776722083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIvSVDNyRXVMKIryJy1tu7/f3jU7uICWZPfOZkml13I=;
        b=CcPStjtc/MMJtF5qrsg0o6HiG0wnFLrD0ww93KRhWh788wxAvEAiRP7ZRJ6MZdPeFG
         JVg1WbuNqpl0KeLk+bbyB7nw15q+cAWg2dmbwicqLdw+MYgOQ/NB9eMsFQaaY4F9hrew
         MA9bNgkwd+0vaFcD6yBQJWI3R5sUblCir/z/H+tA3AqPByyr82udGOYvOo9ItW9XHqQ8
         5E19Hykk7qkRH4sUNyFZmo5LeRc+LFzR9WIYBe7m70NJX18dmEmP1u2fP3QRBo0ZyOYe
         nJ1Hd1wqqJTDLpyJKynQ4MZWh6GS79rLCBC3kMyC+L8PTK80VSglU5TrG2ata5QZzwvn
         nFoQ==
X-Forwarded-Encrypted: i=1; AFNElJ80rOpAx1k3BnZQL6d9IjNguWj+HqaIdgTP4zV7YDPP2/0L/OE/pcoEhgcGmbXGSCCbbQNM+f44PBu2SCz20AB+@lists.infradead.org
X-Gm-Message-State: AOJu0YxoLRfaTV6/nh8+WKCZyomzAQZ9Gi8Pk/nmhrrjOq/42PlNshdP
	wnZpbKglfPK/R0LQ7N4xMzi1N6/5P/ZLC0wlh2mNkIfNDu1SJFT+xxkUhAD07/WH3xZ4lCuV1cH
	bMA/LdWJvmvW6bYoIORZOEba3c7xbuf4=
X-Gm-Gg: AeBDievwemJP6fJ3BpKjM7ryaIigMaVsxan0Vf16v27KTe+a0vv0qBvLwb5OCO50OrN
	oZldP/y8kxFUXZyJCImdTE2p64fuRvZ/94XlW7Xy8IFlsFqJo80yuKLHg5tDEE4gOxlbaXcVEkM
	edj//MoAWrCS4kpoxXbyGyYRUDM8ImYbAtUWlmWm2GpkIhVFwd3zPCHIzt5CfkL6AbxdAsxzfgp
	Ps2al2FLUcpPBPGD09VUvBCcfC5d92X69ft/lnrI0oSGDpOejEOkB8oOU5G1+HMTGEYHNP3fCOs
	NzM9O3A1H4W9z5Ld+k3ZY+0ABvBM+XFIXNOqnLr0R25vbCbkwPI=
X-Received: by 2002:a5d:5d83:0:b0:43d:5ec9:246 with SMTP id
 ffacd0b85a97d-43d64250a83mr20728904f8f.12.1776117282589; Mon, 13 Apr 2026
 14:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
In-Reply-To: <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Mon, 13 Apr 2026 14:54:30 -0700
X-Gm-Features: AQROBzDMFq1J1BHeTMkIhkt-_OIJqPvCL5sV9otRjtVQgF6B-9x3ogZe80tOPWg
Message-ID: <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Linux Network Development Mailing List <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_145444_844438_4E0D8F03 
X-CRM114-Status: GOOD (  48.71  )
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

On Mon, Apr 13, 2026, 11:49 Russell King (Oracle) <linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 13, 2026 at 11:02:22AM -0700, Jakub Kicinski wrote:
> > On Fri, 10 Apr 2026 14:07:51 +0100 Russell King (Oracle) wrote:
> > > Since we are seeing receive buffer exhaustion on several platforms,
> > > let's enable the interrupts so the statistics we publish via ethtool -S
> > > actually work to aid diagnosis. I've been in two minds about whether
> > > to send this patch, but given the problems with stmmac at the moment,
> > > I think it should be merged.
> >
> > Sorry for a under-research response but wasn't there are person trying
> > to fix the OOM starvation issue? Who was supposed to add a timer?
> > Is your problem also OOM related or do you suspect something else?
>
> It is not OOM related. I have this patch applied:
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 131ea887bedc..614d0e10e3e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5095,14 +5095,18 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
>
>                 if (!buf->page) {
>                         buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
> -                       if (!buf->page)
> +                       if (!buf->page) {
> +                               netdev_err(priv->dev, "q%u: no buffer 1\n", queue);
>                                 break;
> +                       }
>                 }
>
>                 if (priv->sph_active && !buf->sec_page) {
>                         buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
> -                       if (!buf->sec_page)
> +                       if (!buf->sec_page) {
> +                               netdev_err(priv->dev, "q%u: no buffer 2\n", queue);
>                                 break;
> +                       }
>
>                         buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
>                 }
>
> and it is silent, so we are not suffering starvation of buffers.
>
> However, the hardware hangs during iperf3, and because it triggers the
> MAC to stream PAUSE frames, and my network uses Netgear GS108 and GS116
> unmanaged switches that always use flow-control between them (there's no
> way not to) it takes down the entire network - as we've discussed
> before. So, this problem is pretty fatal to the *entire* network.
>
> With this patch, the existing statistical counters for this condition
> are incremented, and thus users can use ethtool -S to see what happened
> and report whether they are seeing the same issue.
>
> Without this patch applied, there are no diagnostics from stmmac that
> report what the state is. ethtool -d doesn't list the appropriate
> registers (as I suspect part of the problem is the number of queues
> is somewhat dynamic - userspace can change that configuration through
> ethtool).
>
> Thus, one has to resort to using devmem2 to find out what's happened.
> That's not user friendly.
>
> For me, devmem2 shows:
>
> Channel 0 status register:
> Value at address 0x02491160: 0x00000484
> bit 10: ETI early transmit interrupt - set
> bit 9 : RWT receive watchdog - clear
> bit 8 : RPS receieve process stopped - clear
> bit 7 : RBU receive buffer unavailable - set
> bit 6 : RI  receive interrupt - clear
> bit 2 : TBU transmit buffer unavailable - set
> bit 1 : TPS transmit process stopped - clear
> bit 0 : TI  transmit interrupt - clear
>
> Debug status register:
> Value at address 0x0249100c: 0x00006300
> TPS[3:0] = 6 = Suspended, Tx descriptor unavailable or Tx buffer
>                 underflow
> RPS[3:0] = 3 = Running, waiting for Rx packet
>
> Metal Queue 0 debug register:
> Value at address 0x02490d38: 0x002e0020
> PRXQ[13:0] = 0x2e = 46 packets in receive queue
> RXQSTS[1:0] = 2 = Rx queue fill-level above flow-control activate
>                 threshold
> RRCSTS[1:0] = 0 = Rx Queue Read Controller State = Idle
>
> > Firing interrupts when Rx fill ring runs dry (which IIUC this patches
> > dies?) is not a good idea.
>
> Well, I'm thinking that at least on some platforms, such as the Jetson
> Xavier NX, unless a different solution can be found, we need the RBU
> interrupt to fire off a reset of the stmmac IP when this happens to
> reduce the PAUSE frame flood on the network.

Hi Russell,

Should that reset trigger be RPS, not RBU? My understanding of these
status bits is RBU is just "RxDMA has failed to take a frame from the
RxFIFO" while RPS is "the RxFIFO is full." That would make RBU our
critical threshold to start proactively refilling, and RPS the "too
late, we lose" threshold.

Thinking aloud: Do you suppose the RxDMA waits for a wakeup signal
sent whenever a frame is added to RxFIFO? That might explain why the
former never recovers once the latter is full: a manual wakeup needs
to be sent whenever we resolve RBU. Does the .enable_dma_reception()
op need to be implemented for dwmac5, or have you tried that already?

>
> If we can't do that, then I think stmmac on these platforms needs to be
> marked with CONFIG_BROKEN because right now there doesn't seem to be any
> other viable solution.
>
> My intention with this patch is merely to start collecting the already
> existing statistics so other users can start seeing whether they are
> hitting the same or similar problem. If we're not prepared to do that,
> then we should delete the useless statistics from ethtool -S, but I
> suspect they're now part of the UAPI, even though without this patch
> they will remain stedfastly stuck at zero.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

