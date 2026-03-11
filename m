Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E301FD0651
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPwJgKN6+i2fkhgWXr9ssxGXQOB/c1Bb1Dhnaw7Q/H4=; b=eL3lRV0vDXm5x0Y9FnujyVRv05
	Y0OE3PzH3SXpbznjysvFOwbUDP2FNPrAZuGIhC5nWfFMjuLsGor/c1S9XY59y440DRnI1qD77y0Vj
	mbxUlEfzBu2vo6z8N8k2Ni44kN4Y5q6Rv6BU9UoVZ1rvAgGA2etrQ3n1hZxTd0FOqaePou4YrQQJ8
	NIwvX6h+Woms79b1s9UnWbrxgNFGTFXCSqfRO6ADq3W8AGdbApSYuVXxht7Y5+ZEU+Og27Nczc1Sq
	lMZ31/9YUhrh8YBmy+T9y9lRWuuBBgQmaSbLso8nuaKoUpL6D3lIpUaQTNLR6b9m3s2n13ndM9LOh
	3iBpMCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L2r-0000000Bl0Q-0IxM;
	Wed, 11 Mar 2026 15:00:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L2d-0000000BkqS-0Bb8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xPwJgKN6+i2fkhgWXr9ssxGXQOB/c1Bb1Dhnaw7Q/H4=; b=qahkyRTVDsacLrl04M9RmIhn9+
	OI8AZhjjI7pA/18IdUzUXeoQElePPdxJ0w2FDm4PUH1V/2HFfFBEChw2FW3UUOZcXK2lYEHf6DLj9
	Ur2LAWPmWH+ZNt2eNvKvb6FWqhZ3vnX40FHWgPQ+3dqAs1aIfH/MjN9GzT6m2RI3Ib/+o4Z+A4370
	N0RZfcWd6ytwDx6xHQ5bM7xcU0QrSU56uCFhWdADUSD9tjrbhqbHT+P4stpHVujnTPzI8tS/leGDt
	AZnKX3isTUVs1jLxVXdNB3rDcGG2aRGhIa5+VTt38eyUguDZuQNWJ5HQcIPIawu7AxXmaXzZDOnN7
	rgrbzAkA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49286)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0L2T-000000006Wc-1bGq;
	Wed, 11 Mar 2026 14:59:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0L2R-000000006K8-1Qog;
	Wed, 11 Mar 2026 14:59:55 +0000
Date: Wed, 11 Mar 2026 14:59:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next 02/15] net: stmmac: helpers for filling
 tx_q->tx_skbuff_dma
Message-ID: <abGDazGzEPAso5gm@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
 <E1w0GEg-0000000CiSj-2CVA@rmk-PC.armlinux.org.uk>
 <98307b59-c22d-43a6-83a6-ff551941898e@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98307b59-c22d-43a6-83a6-ff551941898e@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_080007_088876_3E32D53A 
X-CRM114-Status: GOOD (  15.04  )
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

On Wed, Mar 11, 2026 at 03:57:13PM +0100, Andrew Lunn wrote:
> On Wed, Mar 11, 2026 at 09:52:14AM +0000, Russell King (Oracle) wrote:
> > Add helpers to fill in the transmit queue metadata to ensure that all
> > entries are initialised when preparing to transmit. This avoids clean
> > up code running into surprises.
> > 
> > For example, stmmac_clean_desc3() (which calls clean_desc3() in
> > chain_mode.c or ring_mode.c) looks at the .last_segment, and in the
> > latter case, .is_jumbo members.
> > 
> > stmmac_tso_xmit() was also a problem. If the metadata is not fully
> > cleared when cleaning dirty entries (or, in the case of resume,
> > freeing all entries) then .last_segment may be left set, which then
> > causes:
> > 
> >         stmmac_prepare_tso_tx_desc(priv, first, 1, proto_hdr_len, 0, 1,
> >                                    tx_q->tx_skbuff_dma[first_entry].last_segment+,
> >                                    hdr / 4, (skb->len - proto_hdr_len));
> > 
> > to mark the
> 
> That sentence appear to be unfinished.

Hmm, it's also not relevant anymore because we fixed that problem in a
different way.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

