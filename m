Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55C6F31E28
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M02TVSfJ/9vSNYEyU/7aDtDFaJupWn6ab5dtRvMPr8g=; b=WdQuPXBNrB1LYkUWsTxlZEnEbx
	1hgEyXSQNKLuAdiyjuBjVnqHsxJLzpoRQRCY7yEAs3XM8yH99YP9eCOlUr5/qo1r+sF9Z/zReTLQq
	8L9bgVOf9zj8KmM0l9/n0TGBAzH20tj5rY+jypdxbDrWgkr7y3/JkVs4Nk7i6LcPsTz4gUQLyDS15
	VtLGA2u5Dooz95bw4+bR8Fl+7XNBwfSQFOOfu8VWqy1zskicl0IO2ZrO02/eT9ENnY0G6r2yHujP2
	ca4V4zliCmR/Hcv39mc1EL3yX7KlmddyZrTcxMP7Cv+ZnnQ2VB7kqvZvuDaCvG+YnGwpqUYThDtoq
	c3INGBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqGk-0000000AgXb-3LZF;
	Thu, 09 Apr 2026 14:22:06 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqGe-0000000AgSZ-0OR2;
	Thu, 09 Apr 2026 14:22:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wAqGT-000000002Iq-2EUP;
	Thu, 09 Apr 2026 14:21:49 +0000
Date: Thu, 9 Apr 2026 15:21:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Subject: Re: [PATCH RFC net-next 0/4] improve hw flow offload byte accounting
Message-ID: <ade1-dlugvWF7IzB@makrotopia.org>
References: <cover.1775739840.git.daniel@makrotopia.org>
 <adevKeasLkEB5zZ4@chamomile>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adevKeasLkEB5zZ4@chamomile>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_072200_504606_CC2911DC 
X-CRM114-Status: GOOD (  21.30  )
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

On Thu, Apr 09, 2026 at 03:52:41PM +0200, Pablo Neira Ayuso wrote:
> On Thu, Apr 09, 2026 at 02:07:22PM +0100, Daniel Golle wrote:
> > Hardware flow counters report raw byte counts whose semantics
> > vary by vendor -- some count ingress L2 frames, others egress
> > L2, others L3. The nf_flow_table framework currently passes
> > these bytes straight to conntrack without conversion, and
> > sub-interfaces (VLAN, PPPoE) that are bypassed by hw offload
> > never see any counter updates at all.
> 
> I see, but that is part of the feature itself? Why pretend that these
> interface are really seeing traffic while they don't. This aspiration
> of trying to do all hardware offload fully transparent (when it is not
> the case, not mentioning semantic changes in how packet handling is
> done compared to the software plane) does not sound convincing to me.

Please explain what you mean by offloading not being fully
transparent. If the MAC hardware offloads VLAN encap/decap, for
example, we also maintain the counters correctly (it just so happens),
just the flow-offloading case results in a weird overall picture:
hardware interface counters keep increasing, encap interfaces (802.1Q,
PPPoE) don't. That makes it confusing and hard to understand what's
happening when only looking at the interface counters (ie. "what is
all that traffic on my physical WAN interface which isn't PPPoE? Can't
be that all of that is the modems management interface, SNMP, ...")

> 
> On top of this, this issue also exists in the software plane: Devices
> that are bypasses do not get their counters bumped.
> 
> Maybe if this is really a requirement, then this should address the
> issue for software too, but is it worth the effort to add
> infrastructure for this purpose?

To me it would feel more correct to see counters increasing also
for offloaded traffic on software interfaces such as PPPoE or VLAN.

I honestly didn't think about the software fastpath, and yes, I think
it should be addressed there too.

> > This series lets drivers declare what their counters represent,
> > so the framework can normalize to L3 for conntrack and
> > propagate per-layer stats to encap sub-interfaces.

This part could also been seen as an independent fix as currently
conntrack stats for the same traffic differ in case of software
offloading (pure L3 bytes) and hardware offloading (L2 ingress bytes
in case of mtk_ppe).

