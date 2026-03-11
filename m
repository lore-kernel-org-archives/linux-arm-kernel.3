Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B851125839
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbMjDz6Ajv6xSvXYmB456HfPgEAht61nTIyuU/EkImg=; b=vF3or0gTbaXosZTwVRpTmTTVd0
	/XtGuxr9Q+QW3WzEHJeE5/lRgdMWaIQhpPR5dNTo94nOs+BI64by5GcHbDZ0TXtLqqPCPKfqC3v4i
	W6tbEWkSPpAzPbs26pFcvjBnVSeHfYzjxpbks9BZns2k02E7rrWhVs/C06MSFwrJow0TfuGNGloi9
	42T8d7DOnzZ21qeuy3gXq97gbbL+fDkR57VWrv349MvTOCT4WKOGQXnL5j3eJgeaBYiOWlCe1oEAj
	RMAOT/w6A3iSYSsp8MkBwS+bDDkh5cdbkv5zewu8FQIh6SvA+oJaVuSNadJ9QP2JlAWklKUpHkU02
	EdCAX0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L0C-0000000BkRZ-0rYz;
	Wed, 11 Mar 2026 14:57:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L08-0000000BkRC-1ahk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nbMjDz6Ajv6xSvXYmB456HfPgEAht61nTIyuU/EkImg=; b=UdiClr4B7nCGlOQl4Plk5yGbwh
	zLGbdnOhrmCBrYOnpSnvesRGPAm7kU9izji71GHSO8OAQjna54BNJi37ckHcIAH6rMiP434SBvXqI
	3AK3r+dmsGw1OQFIwG3lPvnmyD00/I0hhOM341kBvWZaiBQEc/kepNApG4N1/Wp2HJcg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0Kzp-00BCD4-GF; Wed, 11 Mar 2026 15:57:13 +0100
Date: Wed, 11 Mar 2026 15:57:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Message-ID: <98307b59-c22d-43a6-83a6-ff551941898e@lunn.ch>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
 <E1w0GEg-0000000CiSj-2CVA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w0GEg-0000000CiSj-2CVA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075732_419102_B81873E6 
X-CRM114-Status: GOOD (  11.60  )
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

On Wed, Mar 11, 2026 at 09:52:14AM +0000, Russell King (Oracle) wrote:
> Add helpers to fill in the transmit queue metadata to ensure that all
> entries are initialised when preparing to transmit. This avoids clean
> up code running into surprises.
> 
> For example, stmmac_clean_desc3() (which calls clean_desc3() in
> chain_mode.c or ring_mode.c) looks at the .last_segment, and in the
> latter case, .is_jumbo members.
> 
> stmmac_tso_xmit() was also a problem. If the metadata is not fully
> cleared when cleaning dirty entries (or, in the case of resume,
> freeing all entries) then .last_segment may be left set, which then
> causes:
> 
>         stmmac_prepare_tso_tx_desc(priv, first, 1, proto_hdr_len, 0, 1,
>                                    tx_q->tx_skbuff_dma[first_entry].last_segment+,
>                                    hdr / 4, (skb->len - proto_hdr_len));
> 
> to mark the

That sentence appear to be unfinished.

	Andrew

