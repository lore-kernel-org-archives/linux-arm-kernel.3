Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B70606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wxrp0UA9;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RsfrEJLC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNRVR38d3ey44exqQ8HnB3TSKDb0dhwLcVuiN0wut7A=; b=Wxrp0UA90/bv6juXZ43YVez5n7
	URchwozkjjKoKYXK9A+S9jKvtOQXYvhNKU1lmTaDY6aFN2R71zNbHDrE24Az8FcvLvEm0+caH7qwc
	rYFWkoS51Z9U18ELOU2/SixDUKNK4G93d1jDOQsxqeTy5FWNDnQt0WH+ZwwnimKrxkXOyyDqnISqk
	DMv185yL9lw5DWtoBi7CSpjHqQUv4LbkslpWBhT2hTi2CR/4XVLryGqH60HmcnkeGa3KMLpPoW9au
	/JyZwBexPZrcA2PjASUvgUO7zNRvW8rdgxjl/6keGWHRHnmZlTOOeRRzEEz+zwqLsXlsovOAgRvoA
	zayvFIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8xb-00000009fKO-0J42;
	Tue, 20 Oct 2026 12:28:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8xZ-00000009fJX-1GSl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JNRVR38d3ey44exqQ8HnB3TSKDb0dhwLcVuiN0wut7A=; b=RsfrEJLCHO5hSv/GDMbRHFTY/L
	vYL6IYeg0ApurcmouAUx8GR/SVM6grwYlMQEFsKs3n/bE0m8ohLoafSrkCe7G/kPSBL/ldA4JepEk
	MP1rcWc9TnjSZN3OhVpMfZyN5zVJwK38ldDujk0/wrXc4IdiEUPmOV2mdMDwW5XoOWBo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xJ8x8-00Bqa9-R1; Tue, 20 Oct 2026 14:28:26 +0200
Date: Tue, 20 Oct 2026 14:28:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
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
Message-ID: <3ca537e7-c9a3-4306-a2f4-9c7d57123bfc@lunn.ch>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
 <6d1d99b5-1c3c-4e59-a0b2-e4d671e594ce@bootlin.com>
 <ata8k2EVDCDTmeE6@xhacker>
 <atbbRqSJIJ_glwuf@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atbbRqSJIJ_glwuf@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_052853_339167_2A1953CA 
X-CRM114-Status: GOOD (  11.75  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > Here I want to query a generic rule from netdev maintainers:
> > can XDP frame enable HW checksum on dwmac IP? Per my understanding, the
> > dwmac can only do HW checksum for normal particular packets layouts, such as
> > TCP, UDP. What about if XDP transmits a non-IP frame?
> 
> or a generic XDP guide from netdev maintainers:
> Since XDP can tranmist arbitrary Eth frames, so how does the eth driver cope
> with HW checksum if the HW checksum is intended for supported IP packet
> layouts rather than arbitrary layer2 frames?
> 
> choices:
> c1. Simply disabled HW checksum by default. Then XDP prog must provide
> checksums themselves, lost the HW offload cap for IP packets.
> 
> c2. detect the frame in eth driver's xdp code path, then enable/disable
> HW checksum accordingly. Then how? Any example in exisiting eth drivers
> is appreciated.

Why is this specific to XDP? Cannot the network stack transmit
arbitrary layer2 frames? Isn't this a generic problem?

	  Andrew

