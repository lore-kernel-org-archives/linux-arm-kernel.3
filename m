Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2648606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=avpSPVB9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zbvy/0NS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VhH6+z3kKO1Bl5/znvKizz61KSkOxaasQ1jNB2IaQFU=; b=avpSPVB9oB99PjdvWXIv2TrRky
	xUGP/es2FB/nOrou1d2o9iOfKmZ6oEFONi0uKKfATAwV/hJLvlep0U4lWIZkutm8dPpzM/kD3B54a
	R2GwK5ovxDq5v9c0Zy4BhGVkH7UcGVxfo+t43WZvrpi4KACsq46tN4Od5vsJZw5YkzFScofJEjufB
	HdY07OaBaXLnFlmXdVscP2jWmMUdhCUQLSawjwKkuGL+zq2ypBoVH2OVoUsxSooa7YWq6A6q5hRUN
	l+25yTrwQDU0WcTEkwMF5OLcmx3Z/015PbGm9ivbL5w1vpYv29Iw8znC6zl401m6rJiKnuYlZywH0
	D/Dsm/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJr4r-0000000E14L-3jh2;
	Thu, 22 Oct 2026 11:35:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJr4q-0000000E14D-2nOa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 11:35:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10ED0418E3;
	Thu, 22 Oct 2026 11:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772231F000C2;
	Thu, 22 Oct 2026 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792668919;
	bh=VhH6+z3kKO1Bl5/znvKizz61KSkOxaasQ1jNB2IaQFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zbvy/0NS5hi8ZwGaL0mHdj6PEHhtbpZcgsb2Xp7eB8vNm91KXm6vAJ7shxoujBAe1
	 dhfj5zW9GQjv2ICnLKITKYEVzIPUmr/T43Jte0mZvaglbKkhuJTD/V6vQcS26uTCFt
	 OXasMXASP+V7SWvLS7aqv6WgFIHv/Z8rVTdNyptNUr0oy2H7iDd5b7kUaf0Cyoam5X
	 uCgKS1SFyrbOMkuvNTg7wMFXssb/Zd5v96NUXlFCeDqopZEQD/tE8951DjZUUkufjP
	 zYi24h+tNP9MH/3GJ/iZijRpORTplyqr7Cmi85uhX3LidPPNuictm20cp7A+p/XIxm
	 nQb5r+beBBOWQ==
Date: Thu, 22 Oct 2026 19:15:12 +0800
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
Message-ID: <atnwQKwf8mfQT-2n@xhacker>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
 <6d1d99b5-1c3c-4e59-a0b2-e4d671e594ce@bootlin.com>
 <ata8k2EVDCDTmeE6@xhacker>
 <atbbRqSJIJ_glwuf@xhacker>
 <3ca537e7-c9a3-4306-a2f4-9c7d57123bfc@lunn.ch>
 <athAoWfW-xesPhFP@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <athAoWfW-xesPhFP@xhacker>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:33:37PM +0800, Jisheng Zhang wrote:
> On Tue, Oct 20, 2026 at 02:28:26PM +0200, Andrew Lunn wrote:
> > > > Here I want to query a generic rule from netdev maintainers:
> > > > can XDP frame enable HW checksum on dwmac IP? Per my understanding, the
> > > > dwmac can only do HW checksum for normal particular packets layouts, such as
> > > > TCP, UDP. What about if XDP transmits a non-IP frame?
> > > 
> > > or a generic XDP guide from netdev maintainers:
> > > Since XDP can tranmist arbitrary Eth frames, so how does the eth driver cope
> > > with HW checksum if the HW checksum is intended for supported IP packet
> > > layouts rather than arbitrary layer2 frames?
> > > 
> > > choices:
> > > c1. Simply disabled HW checksum by default. Then XDP prog must provide
> > > checksums themselves, lost the HW offload cap for IP packets.
> > > 
> > > c2. detect the frame in eth driver's xdp code path, then enable/disable
> > > HW checksum accordingly. Then how? Any example in exisiting eth drivers
> > > is appreciated.
> > 
> > Why is this specific to XDP? Cannot the network stack transmit
> > arbitrary layer2 frames? Isn't this a generic problem?
> > 
> 
> network stack normal tx supplies the skb->ip_summed metadata, and
> dwmac driver specifically can decide to enable/disable HW csum
> by checking the protocol which is extraced from skb, example
> stmmac_has_ip_ethertype()
> But XDP path doesn't have the necessary metadata, and I'm not sure
> whether stmmac_has_ip_ethertype xdb version can be implemented or
> not. That's the reason I request generic XDP guidence from netdev
> maintainers.
> 

Hi,

Given above, I think the dwmac hw csum needs to be disabled by default
to make XDP always behave properly. Since this patch2/2 has been
merged, I will update my patch:
https://lore.kernel.org/netdev/20260929121025.20821-1-jszhang@kernel.org/

1.rebase on the lastest net-next or wait for new rc1

2.update the commit msg of my patch to include above reply.

Kindly let me know if this way can be accepted or not

Thanks

