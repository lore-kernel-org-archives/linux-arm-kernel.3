Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDF6C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqkiB/8Zof/flippJeM//+dGGHfhVdDZDTGF2jIZ+ew=; b=Cx1xD00mLxPftvpDgCe9Ry5TqW
	RjxL8jDz4gUAT/ejB/wdPBLP9I9Ce7GrkEWvsf2rxJzsfW1bLpQE0IVsmRD6EcdnX7esiVx5OAmD4
	7Yl6ABobkVNzJTLZ3mCftZMLXivyLjSe76wQ1Oh6CzwLKRs74OBdc6dLOOznI3ODgFnGdC+2enB/q
	ncu/EUUPSEXO/+oT00KPIB9u+GnXn6runfetGnNjB7FOVo+9poY2p5dgnjK749qot4fCawbpJzvsy
	X93jSgpA9yp3UN4EtT22KsiSh4WqZgAgOm+0/zTzKHfHguIdzrIqTe9XPiGCjjfHjTxkhXRvzlRp2
	ca7pIlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujP0H-0000000DoJg-1pL3;
	Tue, 05 Aug 2025 21:15:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOxe-0000000Do5s-2BTl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lqkiB/8Zof/flippJeM//+dGGHfhVdDZDTGF2jIZ+ew=; b=lnyULp04t/hZCr2kjdegtJ/A0/
	ruVQbsWFlHwZEAl7uRf9yIYLfYGQCGuflWVvYMoo9brF1utgvyRpa0Era4n5cSMq3KtmBFx7j1/LR
	lArVxdHOa1lCrqQNe/BnSpozQj8Kt9mVDL1I0yDOCqhccrFH0arLkOd/nogKzitgLLns=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujOxW-003pLx-OU; Tue, 05 Aug 2025 23:12:34 +0200
Date: Tue, 5 Aug 2025 23:12:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH net-next v4 5/7] net: axienet: Use device variable in
 probe
Message-ID: <05a1234a-6da7-4c4b-9459-62db40e0267a@lunn.ch>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-6-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-6-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_141242_567488_2932D6A0 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 05, 2025 at 11:34:54AM -0400, Sean Anderson wrote:
> There are a lot of references to pdev->dev that we can shorten by using
> a dev variable.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

