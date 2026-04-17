Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF92F8DFF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 18:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgGLav7Gb6QvovV50XxB4tm3UuKBSRBem6o7kf7SUp0=; b=yJZfWMYhBxEDp9Hts8dQI0+Tdr
	uMnT7fOI0TGhRluP/uaEDxUBvuCdA91vfkzffqAdzTZtB0JQetUPQdE5DUAgNaKKPhNUk0/6TUK9y
	E8pI7wNblBlehjas+R6+z085GosMvSpyJhV58CxQRLrkyEn5vW6lGPVUJB+G7YaADkc3xVEAw18gA
	DoRazPZV52krVHjPzTSyvsIHr7pr0y35SluwjjWrA358LoK1ldBqrDk6IwRAR87CV0lHFYL+Wi4ti
	2kMuiZG6GV8FxehsrV7n5aHJN1BmvYeNRLPN1DKpuFwAI1YE5dluI13WgnHo5Z4w27ae+J0nREkst
	MCSpRrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnYF-00000004MGN-1cuC;
	Fri, 17 Apr 2026 18:04:23 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnYB-00000004MFv-3xxX;
	Fri, 17 Apr 2026 18:04:21 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wDnXv-000000007HL-0Cuh;
	Fri, 17 Apr 2026 18:04:03 +0000
Date: Fri, 17 Apr 2026 19:03:58 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Breno Leitao <leitao@debian.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH net] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <aeJ2Di7tuIQ5RniE@makrotopia.org>
References: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
 <aeJjcoHyezEgUG_Q@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeJjcoHyezEgUG_Q@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_110419_989480_D3D8B6C5 
X-CRM114-Status: GOOD (  12.97  )
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

On Fri, Apr 17, 2026 at 10:46:29AM -0700, Breno Leitao wrote:
> On Fri, Apr 17, 2026 at 04:55:57AM +0100, Daniel Golle wrote:
> > @@ -3404,6 +3449,9 @@ EXPORT_SYMBOL_GPL(mt7530_probe_common);
> >  void
> >  mt7530_remove_common(struct mt7530_priv *priv)
> >  {
> > +	if (priv->bus)
> > +		cancel_delayed_work_sync(&priv->stats_work);
> > +
> 
> Shouldn't you cancel the work later, after dsa_unregister_switch()?
> 
> I am wondering if the following race cannot happen:
> 
>  mt7530_remove_common()                  someone reading /proc/net/dev
>     cancel_delayed_work_sync()
>       /* returns: work neither pending
>          nor executing - true at this
>          instant */
>                                           mt7530_get_stats64()
>                                             mod_delayed_work(...)
>                                             /* work is queued again */
>     dsa_unregister_switch()
>     return

Thanks you for pointing this out.
cancel_delayed_work_sync() should be moved after dsa_unregister_switch()
to avoid this kind of race.

