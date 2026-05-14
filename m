Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9BDCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaiJUWYwDpe7hOORI6a2Qhst3/wwfFfCwfzes3xRWD0=; b=qmUfjYQYfsQt1n1oXluY9Bt2CI
	gSWWE4ljXDwmoPBO5IYnfGygTUXS9Nw5RRJ4v6K+vGEGjW5VCIBr/5cKmpyHQtx3TM7Lnk0jBlomD
	VEZlLI87MwlcCeKH5Br3WKLESxA3se/aHvZunIAB1Z1hiA9ydpM09ODsjzAqsWnELZRwlwu0y4El3
	9cvxJ1cNwxZGINCDseLuwrQsrrqgj1siGevisbySfc0FGiF8Xbxe36CrqhHI2qF6EogQUUCvd0neM
	erJjmFtr5kTRhmf60PEPg5r9yM+THk7ZT9kMF9bd8aE9bonD4IPV7RYaaP1tkrYlRcrJUeQ9m/sWq
	rlCiJkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaZk-00000006HuV-3P9o;
	Thu, 14 May 2026 18:14:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaZg-00000006Hts-2WuO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778782460; x=1810318460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BQ7qpMLSNXeBFl5qOYux37jkMV7llWRcNVE9SfAA2MM=;
  b=oVMmY7+Jtlx/XgeKQ5K2+b2ntCYrFOwoEBc8gZ2st3aAHNhecoy7Shun
   OGBPfXqk+SE16lgBSYWGcNVhfYbZdr57ttLVHVST+D2rbD3M9gMeryPLv
   FshW/0/YQJVHYhLmpX3OzcOEp00WW6MTiZUUYDChLTYp9mIDV0+l+nkBB
   9qw7SW1koJFOR3CjwbenuwtoMV2NTBncFiWSOg7uv9VLWH274zqy/1hGP
   Hh2O1rv7FFMMplUDEt9GE9s5BrFSM6BfqYPn7vlDnFP80nj7xXNK+xr1O
   mcflrositLQX6hIlL4SkjxjYpqNRPWF2a1lNlHvS5A0rvkGrvvMs7KMjl
   A==;
X-CSE-ConnectionGUID: l6cMKygMTVSs5+14yW2K1w==
X-CSE-MsgGUID: vnaWtqheS02Sq0tvd0rzXA==
X-IronPort-AV: E=Sophos;i="6.23,235,1770620400"; 
   d="scan'208";a="288887666"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 May 2026 11:14:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 14 May 2026 11:14:17 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 14 May 2026 11:14:13 -0700
Date: Thu, 14 May 2026 20:14:13 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, "Steen
 Hegelund" <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, "Herve
 Codina" <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v4 09/13] net: lan966x: add PCIe FDMA support
Message-ID: <20260514181413.n7o6jwwfoez4up6z@DEN-DL-M70577>
References: <20260508-lan966x-pci-fdma-v4-9-14e0c89d8d63@microchip.com>
 <20260509082720.503A6C2BCB2@smtp.kernel.org>
 <73a19f89-ccd7-4762-8e07-812d8d95ead2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73a19f89-ccd7-4762-8e07-812d8d95ead2@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_111421_101854_03A2D522 
X-CRM114-Status: GOOD (  26.67  )
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

> On 5/9/26 10:27 AM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
> >> +static int lan966x_fdma_pci_napi_poll(struct napi_struct *napi, int weight)
> >> +{
> > [ ... ]
> >> +    /* Get all received skbs. */
> >> +    while (counter < weight) {
> >> +            if (!fdma_has_frames(fdma))
> >> +                    break;
> >> +            /* Order DONE read before DCB/frame reads below. */
> >> +            dma_rmb();
> >> +            counter++;
> >> +            switch (lan966x_fdma_pci_rx_check_frame(rx, &src_port)) {
> >> +            case FDMA_PASS:
> >> +                    break;
> >> +            case FDMA_ERROR:
> >> +                    fdma_dcb_advance(fdma);
> >> +                    goto allocate_new;
> >> +            }
> >> +            skb = lan966x_fdma_pci_rx_get_frame(rx, src_port);
> >> +            fdma_dcb_advance(fdma);
> >> +            if (!skb)
> >> +                    goto allocate_new;
> >
> > If napi_alloc_skb() fails due to memory pressure, does branching to
> > allocate_new prematurely break out of the processing loop? Since the hardware
> > interrupt was already cleared, and napi_complete_done() is called below,
> > will this cause the RX queue to stall permanently for the remaining
> > unprocessed frames? Should the code drop the packet and continue instead?
> 
> I went over the series and sashiko feedback, and generally speaking the
> series LGTM, but I think this one is real and should be addressed.

Thanks for reviewing. Before I respin, I'd like to sanity-check the design
expectation.

I had already looked at this and concluded it was fine — the reasoning being
that any leftover DCBs (frames) would be drained on the next IRQ when new
traffic arrives. Same pattern exists in all other Microchip FDMA drivers
(lan966x platform, sparx5/lan969x, ocelot) and has been running since their
introduction without a reported issue, AFAIK.

Is calling napi_complete_done() with DCBs still pending in the ring itself a
NAPI-contract violation — in that case this is a pattern that needs fixing
across all four drivers.

Happy to go either way — just want to make sure I understand the problem :-)

> 
> Also it would be very helpful if you could (for future series/revision)
> reply to the (wrong) sashiko comments individually explaining with a few
> words why the are off: decoding the context requires much more time for
> whoever has not wrote the code itself.

Ack.

> 
> I understand that dealing with AI feedback is a pain, but, paraphrasing
> a great aphorisms creator, I can assure you that ours (maintainers) pain
> is greater.

I can only imagine.

> 
> Thanks,
> 
> Paolo
> 

/Daniel

