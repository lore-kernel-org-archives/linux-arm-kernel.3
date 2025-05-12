Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B3C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 07:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytqX/F01ndp523dmwe1T1okPPKLxxtdr/r1cHBhyS74=; b=Px/iMydV1W81bTZIvKlb6NYMt5
	NbgPXZKJ2lo+2NmONZgZW5X8NiT7FrSXjxOh+Ngu54yckBOeCs1cnBZdfZHgS4HBJifZ2YLXuhZ6+
	Lw4WDyx6p4yk38C3IDLQUUD/4gish8b79ewQrtzuydMRJXY8f5CatrIWm6WxS01kRtoT5W6KXqNt/
	E6zYUB9P34LDNaIHn9eOMtsq719DAHegIRpUUO9g95lXDQ7dj48neOQes/ioxkPgX4bFRdmRSk1Wb
	2lFHfIo/XApF6CRU1CWs/7Yr6z82H8Yt+i8cKvQkxqTVamgv1rsXuTYU0lgNC0xI3cSgVsorvTKcK
	Q86kPNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENYO-00000008cY0-1U2x;
	Mon, 12 May 2025 07:26:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENWM-00000008cO1-0kno
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 07:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747034658; x=1778570658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PeXyXIHP/RU8DBQh7ZsPnR78m2y+ncwDffB4JH/enLM=;
  b=noMAwCtaREmdMKchjf4dGhk9yzHgUBTWB7SZPWEJYPlfWBvsGt6q7uVe
   uIkeWqSMJ+6DqLFCDEMHyU/wd6EjbaPHbKs2zTjh9b9HQ86RBkcVgir8Z
   jJ1+Fx/33ChCv54jmujZTZ546QZFdgSWF6NXuaLhf8Nh6vK5mGnQL8IKX
   w8LqEJOevL+w0M9vL1k0YQ0NoTKB2su0qvShCchrVu+VIzSfLIUYMHnz7
   6eCeMGTKBtSKWPcKzbqIl5lqbLkRXTXoS+N+BXJGbiS7DJ9Un0vQVpZkL
   XKRgvKGb66hmx64ihxUDUdMlQcvF73VYoirZJmtlhr2X4ZN5R7c4BqQEo
   A==;
X-CSE-ConnectionGUID: 091CbATtSFuA8m3t6yrqew==
X-CSE-MsgGUID: /Wt3H8mkQnCi7uvGKztFrQ==
X-IronPort-AV: E=Sophos;i="6.15,281,1739862000"; 
   d="scan'208";a="41986285"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 00:24:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 00:23:55 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 12 May 2025 00:23:54 -0700
Date: Mon, 12 May 2025 09:22:27 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Vladimir Oltean <olteanv@gmail.com>
CC: Jason Xing <kerneljasonxing@gmail.com>, <irusskikh@marvell.com>,
	<andrew+netdev@lunn.ch>, <bharat@chelsio.com>, <ayush.sawal@chelsio.com>,
	<UNGLinuxDriver@microchip.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>,
	<sgoutham@marvell.com>, <willemb@google.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>, Jason Xing
	<kernelxing@tencent.com>
Subject: Re: [PATCH net-next v1 4/4] net: lan966x: generate software
 timestamp just before the doorbell
Message-ID: <20250512072227.wseiy7kfxyxbnj2l@DEN-DL-M31836.microchip.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
 <20250508142157.sk7u37baqsl7yb64@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250508142157.sk7u37baqsl7yb64@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_002418_395195_E7287E49 
X-CRM114-Status: GOOD (  35.98  )
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

The 05/08/2025 17:21, Vladimir Oltean wrote:
> 
> Horatiu,

Hi Vladimir,

> 
> On Thu, May 08, 2025 at 11:41:56AM +0200, Horatiu Vultur wrote:
> > > > > -       skb_tx_timestamp(skb);
> > > >
> > > > Changing this will break the PHY timestamping because the frame gets
> > > > modified in the next line, meaning that the classify function will
> > > > always return PTP_CLASS_NONE.
> > >
> > > Sorry that I'm not that familiar with the details. I will remove it
> > > from this series, but still trying to figure out what cases could be.
> > >
> > > Do you mean it can break when bpf prog is loaded because
> > > 'skb_push(skb, IFH_LEN_BYTES);' expands the skb->data area?
> >
> > Well, the bpf program will check if it is a PTP frame that needs to be
> > timestamp when it runs ptp_classify_raw, and as we push some data in
> > front of the frame, the bpf will run from that point meaning that it
> > would failed to detect the PTP frames.
> >
> > > May I ask
> > > how the modified data of skb breaks the PHY timestamping feature?
> >
> > If it fails to detect that it is a PTP frame, then the frame will not be
> > passed to the PHY using the callback txtstamp. So the PHY will timestamp the
> > frame but it doesn't have the frame to attach the timestamp.
> 
> While I was further discussing this in private with Jason, a thought
> popped up in my head.
> 
> Shouldn't skb_tx_timestamp(skb); be done _before_ this section?
> 
>         /* skb processing */
>         needed_headroom = max_t(int, IFH_LEN_BYTES - skb_headroom(skb), 0);
>         needed_tailroom = max_t(int, ETH_FCS_LEN - skb_tailroom(skb), 0);
>         if (needed_headroom || needed_tailroom || skb_header_cloned(skb)) {
>                 err = pskb_expand_head(skb, needed_headroom, needed_tailroom,
>                                        GFP_ATOMIC);
>                 if (unlikely(err)) {
>                         dev->stats.tx_dropped++;
>                         err = NETDEV_TX_OK;
>                         goto release;
>                 }
>         }
> 
> The idea is that skb_tx_timestamp() calls skb_clone_tx_timestamp(), and
> that should require skb_unshare() before you make any further
> modification like insert an IFH here, so that the IFH is not visible to
> clones (and thus to user space, on the socket error queue).
> 
> I think pskb_expand_head() serves the role of skb_unshare(), because I
> see skb_header_cloned() is one of the conditions on which it is called.
> 
> But the problem is that skb_header_cloned() may have been false, then
> skb_tx_timestamp() makes skb_header_cloned() true, but pskb_expand_head()
> has already run. So the IFH is shared with the clone made for TX
> timestamping purposes, I guess.
> 
> Am I completely off?

Sorry for late reply.
I think you are right!. I just want to double check by actually trying
it.

> 
> Also, I believe you can set dev->needed_headroom = IFH_LEN_BYTES,
> dev->needed_tailroom = ETH_FCS_LEN, and then just call
> skb_ensure_writable_head_tail().

Thanks for the advice. I will look also into this.

-- 
/Horatiu

