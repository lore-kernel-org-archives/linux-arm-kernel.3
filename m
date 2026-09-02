Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA95EC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqIr+thPrbep/O0pQIu8oOVm6WAFx0khwrPGH8+faaI=; b=lOmHAy09q9+LDvQUUvdscNYqBe
	5uKRdtC5Q16jcrEp+sToyOVRAi2h9FNkGVEo95HHyDlLVuPC5RCUUuvgTt23mkURehvFbfGF8qZIn
	n8OlPYgV74w+6DI7ipkX7eGEWU+yuX1lrCFv4rdMpqSpT+TxXzLKemTXKyzUPnwaCmo2sCgF28j1S
	BiuI4xQVv2wXQnWZSkhJx7lPZO6eguIgKXj6oWtYAE6elL1oU/gCVP+V8yamu8WRRcP2jePdHPIyy
	hKKnw2vfFWaq5m8T3N+hu0JkIIeFqHhlF+8BIxJazBn8AD1LzoNRc93UdBsc42ss89FUE9IQFaxW0
	UJpPv7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kB1-0000000Egli-1R4R;
	Wed, 02 Sep 2026 12:34:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kAz-0000000Egks-0Xxk;
	Wed, 02 Sep 2026 12:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DqIr+thPrbep/O0pQIu8oOVm6WAFx0khwrPGH8+faaI=; b=hp03u8THC/bL/aO0tZNb/guAdj
	6JE1X0XikSOzaUI55ijxAp09/JKsp8VYSxaBtCILzK3/necMgjMbyUS8KowWKVI2++f5v2jYh/SFR
	ft1e9Zn2OCyYQFzftb9gGc0MIseKxQTQiZiDR/nfi2Xv9NdenQD3jOd4KSUxGwsZAgHU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1kAc-002W90-LK; Wed, 02 Sep 2026 14:34:26 +0200
Date: Wed, 2 Sep 2026 14:34:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5 0/9] net: dsa: mt7530: modernise register
 access and add two DSA ops
Message-ID: <e3b0d41a-ff23-4dc2-aa8e-3fc279f750fa@lunn.ch>
References: <cover.1788190568.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788190568.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_053449_183232_FD09D294 
X-CRM114-Status: GOOD (  19.10  )
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

On Mon, Aug 31, 2026 at 04:37:43PM +0100, Daniel Golle wrote:
> The mt7530 driver carries its own register accessors that predate the
> regmap conversion and now largely duplicate what regmap already
> provides, including locking. Most of this series removes that layer.
> 
> It first moves the MDIO bus locking into the switch regmap via
> .lock/.unlock callbacks, matching the PCS regmaps, so any path reaching
> the regmap is serialised automatically. With the wrappers no longer
> adding locking, the thin mt7530_mii_* indirection is folded away and the
> remaining accessors are replaced mechanically with the plain regmap API,
> using the coccinelle semantic patches included in the commit messages.
> The two remaining reset polls are converted to
> regmap_read_poll_timeout() and the then-unused dummy poll machinery is
> dropped. Open-coded register fields are converted to
> FIELD_GET/FIELD_PREP. None of this is intended to change behaviour.
> 
> The last two patches implement .port_fast_age, which flushes dynamically
> learned MAC entries on topology changes, and .port_change_conduit, which
> moves a user port's CPU-port affinity at runtime.
> 
> The swallowed MDIO errors Sashiko flagged on v4 5/8 have meanwhile been
> fixed in tree by "fix swallowed MDIO read errors" and "fix remaining
> swallowed MDIO access errors", both merged into net-next. This respin is
> rebased on top of them: regmap_* return values are no longer ignored,
> which is what most of the semantic patches had to be reworked for.

I only had a quick look at the series, but it seems O.K. to me.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

