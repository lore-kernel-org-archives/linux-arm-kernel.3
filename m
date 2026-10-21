Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF642606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 04:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RCuM3m4E;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMLszvUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY7ZTK1khhR9HlmoUz9qcKC7kwN/J1ah6/E5o6LMewQ=; b=RCuM3m4ERiG49HjlRf3Xpcl8Ao
	/Tbl2du6KghY0TMpeZYbLmbVglxvdgJtWSNRI93BHGGNvDxU1BYqSbYfzIl/1yM6vGcjM7JFxWaR4
	ybM/WU2zkyOGvL8FIbe2i/8CaBvT2/M6KKtn1wx3QCMDaLzElHQ3NGlp6HeSgJsD+/HjKFK1gSrbb
	jVxXLojIQyJ18EvhXPhn5a6cGsdBBkNeutzf40zPx2dW/ec5Z79l4Sz+nTFmXcU7PVhixMwB7HQan
	arWUB6FKva+W/LWabszggnpeL6Rggx9rX57RBT/eMDf8SBj1wNCUP8a1qyScFhgkYgqPSyvVm2cHk
	OFSXe8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOKg-0000000B45E-1S9K;
	Wed, 21 Oct 2026 04:53:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOKf-0000000B457-1GRO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 04:53:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D0FE60098;
	Wed, 21 Oct 2026 04:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532D81F000C9;
	Wed, 21 Oct 2026 04:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792558423;
	bh=fY7ZTK1khhR9HlmoUz9qcKC7kwN/J1ah6/E5o6LMewQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eMLszvUQs7ukeFBPwrJfmZWfGvBTWdq70mWd/uZXoS+bgyJHJ9rwlonaRNdYiSOqH
	 iLs+tPhNqfnvqH8R5g5MbzU688cdJjc+FxOhbnx6r+Tib8sd0Eu30SeBpeMOdavbYp
	 JacSgzHAaWwm/j0EjD7R+ZfsbSwit7aYXTYaKLjhenT8/RAOOm195QBGrRfFodO+4D
	 0/0IXJHsogxgYgYYBwo3uWrkWGpF94iz/9a3FALSNOalfZLbG5YkyH4Xny5gQuqQoF
	 LG3os42pqfsozDdhcjpY001PbJS2GJVG3/inCrm7bgev6v2n47VoElwiWWWiLliR+M
	 HDI1MgUE81w8A==
Date: Wed, 21 Oct 2026 12:33:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: disable TX checksum offload
 for jumbo frames on bugged cores
Message-ID: <athAoWfW-xesPhFP@xhacker>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
 <6d1d99b5-1c3c-4e59-a0b2-e4d671e594ce@bootlin.com>
 <ata8k2EVDCDTmeE6@xhacker>
 <atbbRqSJIJ_glwuf@xhacker>
 <3ca537e7-c9a3-4306-a2f4-9c7d57123bfc@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ca537e7-c9a3-4306-a2f4-9c7d57123bfc@lunn.ch>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 02:28:26PM +0200, Andrew Lunn wrote:
> > > Here I want to query a generic rule from netdev maintainers:
> > > can XDP frame enable HW checksum on dwmac IP? Per my understanding, the
> > > dwmac can only do HW checksum for normal particular packets layouts, such as
> > > TCP, UDP. What about if XDP transmits a non-IP frame?
> > 
> > or a generic XDP guide from netdev maintainers:
> > Since XDP can tranmist arbitrary Eth frames, so how does the eth driver cope
> > with HW checksum if the HW checksum is intended for supported IP packet
> > layouts rather than arbitrary layer2 frames?
> > 
> > choices:
> > c1. Simply disabled HW checksum by default. Then XDP prog must provide
> > checksums themselves, lost the HW offload cap for IP packets.
> > 
> > c2. detect the frame in eth driver's xdp code path, then enable/disable
> > HW checksum accordingly. Then how? Any example in exisiting eth drivers
> > is appreciated.
> 
> Why is this specific to XDP? Cannot the network stack transmit
> arbitrary layer2 frames? Isn't this a generic problem?
> 

network stack normal tx supplies the skb->ip_summed metadata, and
dwmac driver specifically can decide to enable/disable HW csum
by checking the protocol which is extraced from skb, example
stmmac_has_ip_ethertype()
But XDP path doesn't have the necessary metadata, and I'm not sure
whether stmmac_has_ip_ethertype xdb version can be implemented or
not. That's the reason I request generic XDP guidence from netdev
maintainers.

correct me if I misunderstood something.

Thanks

