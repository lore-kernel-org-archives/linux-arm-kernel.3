Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E67CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agYKnzn8T/eb4yp1/smbKJD1luy5svsIRxR1kiaXu0g=; b=sh+7Vk8DrTuNOJJq3Z4SbAhH8P
	FY85FIK1LsWrmXz2JM9MP5LFpSgdp2ABXwlOJSP17cOQAyH1JTuMI2nAzXxm0PEfAsMgCmA/C/EvE
	xBujkLk3q1R5GgAxFYbKYUHT6e3laHr5sE7pKakAcacWgXkNt/WoaztHr4XWn63+wZLUJOF3Q3D1A
	vdZYXNqjj+CAUG1LaofbxLuq0Nsf75Ki72qWF26LMim5bqOjpjMO42mpDIPEw6/cZfBTrHnFR58Dr
	4MorNAZfrMif7k6e6IEFKtWiPsKcW9SpboLEOpcWLsqZE+8M+hO6UMK7oQwUs+Pza4IdRc3eRxg/U
	rTxt1AFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuvi-00000003JhH-1Ns0;
	Thu, 07 May 2026 09:22:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuvg-00000003Jfq-0FTS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778145720; x=1809681720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=59tWzzAtxTcAUWtxPg7MT4meYExWqFkXq0PcIIC22U8=;
  b=0G7nn2aueuIv2UVlVOJ+MiHMJCzyg4ZVk8pJmuEao3Dbzl61SBwtilSa
   r4H2yDbTWF2L3tIxGz17gJ4WBkB1L8bpVQ6Okdp0ja8w2ehKisbenG0+S
   D5IStFTO7x7DLJbgS/9QZ3ZVu74wzn3v4tZ8mtJfnZTr3m2PzJxD5XKKH
   lUajIUDbA8TkKhCJublcQ4ps6OgqWEvPUQbgOLmjB4b5DlaGihtGJSes8
   Mj7eDTX95OPFaPNPYHhEb0z+0jffVgWa3QvEwjX5jGdZ8QRcLG2wC5ADK
   Tb9D/cgQoAbfBkv92t0sLQqIIA1FK7cvHfMyfP0ez1aX5sLWqohbUM3RK
   A==;
X-CSE-ConnectionGUID: omU3fqXoTGyYlhpuglZLEQ==
X-CSE-MsgGUID: e1bn+2lrSq6R0TTCN/0y/Q==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="57571463"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:21:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 7 May 2026 02:21:56 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 02:21:53 -0700
Date: Thu, 7 May 2026 11:21:52 +0200
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
Subject: Re: [PATCH net-next v3 09/13] net: lan966x: add PCIe FDMA support
Message-ID: <20260507092152.paw7bfv2d2mh5ris@DEN-DL-M70577.microsemi.net>
References: <20260504-lan966x-pci-fdma-v3-0-a56f5740d870@microchip.com>
 <20260504-lan966x-pci-fdma-v3-9-a56f5740d870@microchip.com>
 <b7399930-ea04-4899-a760-ca1410065aac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b7399930-ea04-4899-a760-ca1410065aac@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022200_169627_5D4B0691 
X-CRM114-Status: GOOD (  16.96  )
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

> On 5/4/26 4:23 PM, Daniel Machon wrote:
> > +static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
> > +{
> > +     struct lan966x *lan966x = rx->lan966x;
> > +     struct fdma *fdma = &rx->fdma;
> > +     struct lan966x_port *port;
> > +     struct fdma_db *db;
> > +     void *virt_addr;
> > +     u32 blockl;
> > +
> > +     /* virt_addr points to the IFH. */
> > +     virt_addr = fdma_dataptr_virt_addr_contiguous(fdma,
> > +                                                   fdma->dcb_index,
> > +                                                   fdma->db_index);
> > +
> > +     lan966x_ifh_get_src_port(virt_addr, src_port);
> > +
> > +     if (WARN_ON(*src_port >= lan966x->num_phys_ports))
> > +             return FDMA_ERROR;
> > +
> > +     port = lan966x->ports[*src_port];
> > +     if (!port)
> > +             return FDMA_ERROR;
> > +
> > +     db = fdma_db_next_get(fdma);
> > +
> > +     /* BLOCKL is a 16-bit HW-populated field; reject obviously-bad
> > +      * values before they feed memcpy/XDP sizes.
> > +      */
> > +     blockl = FDMA_DCB_STATUS_BLOCKL(db->status);
> > +     if (blockl < IFH_LEN_BYTES + ETH_FCS_LEN || blockl > fdma->db_size)
> > +             return FDMA_ERROR;
> 
> Pre-existing issues reported by sashiko (most of them actually) can be
> safely ignored/postponed to follow-ups, but the above OOB (and in patch
> 11/13) access looks real and IMHO should be addressed.
> 
> /P
>

This one looks right. The check ought to be: blockl > fdma->db_size -
XDP_PACKET_HEADROOM.

For patch #11, which issue are you referring to? If its the sashiko-gemini
critical issue:

  > +xdp_init_buff(&xdp, fdma->db_size, &port->xdp_rxq);
  >    +
  > +/* Headroom includes the IFH; BPF may grow into it via adjust_he ad.
  > + * The IFH is rebuilt on XDP_TX and unread on XDP_PASS.
  > + */      
  > +xdp_prepare_buff(&xdp,
  > + data - XDP_PACKET_HEADROOM,
  > + XDP_PACKET_HEADROOM + IFH_LEN_BYTES,
  > + data_len,
  > + false);   

Then no, this is a false-positive. The data pointer is already offset by
XDP_PACKET_HEADROOM, so the hard_start lands correctly at offset 0.

/Daniel


