Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3139C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnHPSO7MQZ8t48b1iS+bJTxLKBJSgkTBWMXEEM9ZhIA=; b=ujo7aNPjNeh77RngDsxwFG/n2F
	MlYAhXBG4EpH1A31v4dVEUEFqQZBXmKxDF89LcPICIK0R4Na0RyAecpMwCn4gO5Q5ssdIc4Yd/IdI
	vJjyFONK2eSp+yC4ER3j4FABa+tELpdApxMOfgYR0XKFrB+sO1pa8l6aft66+YNBT4nUOM1Be7GwA
	cwYGzjMLJtIrSoAyWTPEQLtnGVJJS4DZTASaxHsoNIf9Javi0PgVJf2aJDO4xRDSz3mVlzPSxXcfk
	SJBWKoOHhpxYnUh6wBpmOqtW/20gIS977GCr91GgdmEirpb6EEmeZUFwFu6dBGAdGkb6tmSpk7cV9
	OVtxKC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56we-0000000ATUJ-2fY7;
	Wed, 16 Apr 2025 17:53:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56sT-0000000ASor-1myD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 17:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 399EA5C3A54;
	Wed, 16 Apr 2025 17:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0408C4CEE2;
	Wed, 16 Apr 2025 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744825727;
	bh=v4XwhaUeZk3BYsAXaR29UkZdFjLWFGa044ZokdLWR8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdBVAovmhB1UljmHHNyLhF0hxqGhhRuRKXZwqcyO/adBY48zZBRbdDbJB9M7PJs+9
	 0j2ko3cmHZdfFrkH5ZvxYdo9QFPEclZ3dj/jgrPIp3sr9duFHwG5JT2pijcIt27V07
	 ZNX2u2l/RkL/hLsy/MtGuWmctwaG39Vfk7ejLVl+rzVAMCzANGUNVa9rlfzZYwIuNl
	 AxFhvAvI0iDRRAQnzJZ3nFXpyy0F9M4Jmp8pKWFsEjPqMUDzjlZl99QnYpNx1IAIHf
	 xvazOMDRyHkBglCDin7oFj4gJXMJRW+IYMi4GP7mzpkt1qGQpeus7aotP6Kaj8CDgY
	 wlFKWO6r1sP8A==
Date: Wed, 16 Apr 2025 10:48:45 -0700
From: Kees Cook <kees@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>, Geoff Levand <geoff@infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Joshua Washington <joshwash@google.com>,
	Furong Xu <0x1207@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jisheng Zhang <jszhang@kernel.org>, Petr Tesarik <petr@tesarici.cz>,
	netdev@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Shailend Chand <shailend@google.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] net: ethtool: Adjust exactly ETH_GSTRING_LEN-long stats
 to use memcpy
Message-ID: <202504161047.79ED8EF5@keescook>
References: <20250416010210.work.904-kees@kernel.org>
 <20250416110351.1dbb7173@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416110351.1dbb7173@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_104849_542474_6379DD6A 
X-CRM114-Status: GOOD (  20.78  )
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

On Wed, Apr 16, 2025 at 11:03:51AM +0200, Kory Maincent wrote:
> On Tue, 15 Apr 2025 18:02:15 -0700
> Kees Cook <kees@kernel.org> wrote:
> 
> > Many drivers populate the stats buffer using C-String based APIs (e.g.
> > ethtool_sprintf() and ethtool_puts()), usually when building up the
> > list of stats individually (i.e. with a for() loop). This, however,
> > requires that the source strings be populated in such a way as to have
> > a terminating NUL byte in the source.
> > 
> > Other drivers populate the stats buffer directly using one big memcpy()
> > of an entire array of strings. No NUL termination is needed here, as the
> > bytes are being directly passed through. Yet others will build up the
> > stats buffer individually, but also use memcpy(). This, too, does not
> > need NUL termination of the source strings.
> > 
> > However, there are cases where the strings that populate the
> > source stats strings are exactly ETH_GSTRING_LEN long, and GCC
> > 15's -Wunterminated-string-initialization option complains that the
> > trailing NUL byte has been truncated. This situation is fine only if the
> > driver is using the memcpy() approach. If the C-String APIs are used,
> > the destination string name will have its final byte truncated by the
> > required trailing NUL byte applied by the C-string API.
> > 
> > For drivers that are already using memcpy() but have initializers that
> > truncate the NUL terminator, mark their source strings as __nonstring to
> > silence the GCC warnings.
> 
> Shouldn't we move on to ethtool_cpy in these drivers too to unify the code?

I decided that the code churn wasn't worth it. Perhaps in a follow-up
patch if folks want to see the removal of the explicit memcpy() uses?

-- 
Kees Cook

