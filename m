Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CBBC44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 00:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CSkd1TSKu5JCz6BkVBLXlO8GJdhBnnjUKfmzFm6Rjo=; b=u2QJB7i5iBPzH6PxqpxLNlBF2K
	yp3XLC+faRM5Cwv2ZPxWFILvMyUjwfmIsyGoN4ayJ7CTDP3/T8zGMbWOOA00NuaeQf8qh2bsNWPdj
	Va3Q/iMOUBrjBhOxMgdDB+nTv3MjY8au3vNrrfaamFUJyc4AN7DA7ZZk8wJf/RvgvM2URv5LS5xjL
	QYWDu90sNShrSUEVTey42igTX6NuGHflTH7jRnELx2OJJgnGrrkRLxqKeKrac8r/9srGUW691olTS
	+O8BQna3WskbIgnaNyY90WQTonf4lGCHx0YOELQ0VzcYCdWiN6mB2tOT13aisMQETwiPMIFF/ATXH
	9HmSbsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyWP-0000000893S-3cgZ;
	Tue, 21 Jul 2026 00:39:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyWN-00000008932-2ulE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 00:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1CSkd1TSKu5JCz6BkVBLXlO8GJdhBnnjUKfmzFm6Rjo=; b=fCT2cKtyZSmrLbQJwl0quLDz4K
	mbzneRcAfsrLdlsiYC3UNxkZYsv3tWj2XYkc0R44yJeJyb+SEk7HiAgimdtvVCBtgShFfKv+7w5aZ
	Eg+if4EeduR6gQGXJ0F/fLOolhFCZ9NWGrd/2TNFmCXaUIZxIaPixwLGDGcwjTQAkEOQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wlyW7-00DLo9-0Z; Tue, 21 Jul 2026 02:39:27 +0200
Date: Tue, 21 Jul 2026 02:39:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
Message-ID: <6fa4cb27-20f8-4425-95c8-202d7c7f010a@lunn.ch>
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
 <ae82997f-537e-4a2d-abce-d163fcf9d868@lunn.ch>
 <6ac12388-60de-45aa-a8d0-62fcfaf7bea2@linux.dev>
 <1e640dcb-43ce-4a3b-a74a-ed8e48706b86@lunn.ch>
 <d4f606b9-d793-47c1-8c91-9c9da0e68b4a@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4f606b9-d793-47c1-8c91-9c9da0e68b4a@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_173943_733961_87CF651E 
X-CRM114-Status: UNSURE (   8.57  )
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

> looks like it won't work now. we have to create helpers in phy to fix it.
> I can work on it, but I don't have such HW combination to test. Do you have
> some HW to test this combination?

I don't. You should ask Richard Cochran. He added this code.

  Andrew

