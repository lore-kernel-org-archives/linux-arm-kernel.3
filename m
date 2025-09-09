Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38B8CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVN6e9/gMIu0hHHQf3JvYRaMhSi/eSM2Lfync7IeAQQ=; b=MgQxx+6Ttqy8UavKR3uRjraCod
	NbEWNzKEOSxnD7QYkTBH2HHJea3IeDx+k/1ZJIlQHIvFq7km6BscOLVhNdRfrKzTUmr/skBc2lf0c
	duVt0gydHis5/UxQ46Mt0+83/tH3g86Kg1/vH8UL+kc4pAKi6Yt7zLAwzu2AuV4UA7zuJXhQimie/
	95T+6O/b5W8tLzsSD7+52urE6FXP9ZIbrbqFX4HWr/9JAvlGFW/aZZ/Hh5r1wQBKzwTvKl9NJ1mIQ
	QKU809CXiN8Wo6JGlPiiaZJNAOTqoMVZ8duaCy/ZbiO0J8y85ialyLU9aVOkFyTE+qzJhDd1M5Vh1
	+JfDGq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30N-00000009OTT-3E2I;
	Tue, 09 Sep 2025 18:23:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30M-00000009OSe-1dp1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 18:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rVN6e9/gMIu0hHHQf3JvYRaMhSi/eSM2Lfync7IeAQQ=; b=CFJCU6E1Ptwwviqnzi6QS3+lRp
	Ub6AEVcWUkgYDcPz++BCBOSA/exT9Zc0hk5ajhJ8PvFtMabMPLnw0YTsKZUgxyVWXl+vZ0Lysr9yT
	OtA/fvHxhW/ubVobH20gjo7wJWxpt16gOzROW7ZwV/WF4V8/DhjGShyr+JF6UuGh843LZMhtUmGQt
	2ZDa3i81Z+hKFJ6tzUq5LaL2MTjsk0QZZllGOFzPCuwqkkXPPbighWuJsHQ5AhsZXDHf0gTmup0sC
	E2qu4JpHWIFIFcXgV1hyFlYCVlfMs9dfSCjlJwYRrPUu1eUVXuiabGOyJsBBpgnHKnfliBKU74ppo
	mhXX2aRQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw10w-00000005QUJ-17HJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rVN6e9/gMIu0hHHQf3JvYRaMhSi/eSM2Lfync7IeAQQ=; b=yFYNWH5iwzs0JKw/mdBpnsuOtj
	8Z29eY8pDLH4SvwUR8ENLWzW4aL2f/wHvAq3ZH5jHZrq0bdq7V+eeEowZhAAp/83CT2NeUsOASmnR
	/etpnhjiRIus+3Bl4Nv1h0DkycxGTwuLfLtZrXqYEoadHSDmMNaN0XAPuA1Bv3r6R/5w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uw10m-007ow0-MI; Tue, 09 Sep 2025 18:16:04 +0200
Date: Tue, 9 Sep 2025 18:16:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos: use PHY WoL
Message-ID: <5bf7489f-1256-4c22-8c8f-f1aa32eae810@lunn.ch>
References: <E1uw0ff-00000004IQJ-3AMp@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uw0ff-00000004IQJ-3AMp@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_171614_387480_A9480019 
X-CRM114-Status: UNSURE (   6.80  )
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

On Tue, Sep 09, 2025 at 04:54:15PM +0100, Russell King (Oracle) wrote:
> Mark Tegra platforms to use PHY's wake-on-Lan capabilities rather than
> the stmmac wake-on-Lan.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

