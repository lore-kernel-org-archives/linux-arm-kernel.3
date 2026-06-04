Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09598CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaCXd5wjCRGzbKHIR9+FYqT0US6hNPWlc17eCJ4MZU0=; b=QB+9fajI8W091vgaAjGnV8bOrh
	IB0XsFNoL69SiXghfZhw2e1OIr2rfshsINs/Y5F8b26kieCVX/G6r4l9qXEtXRg0XyYdpszua60zM
	BJtc4eJ/9ujkA0g/IHimJQ9MeLuatMpyNwS5uXomnr23/Ox86I62k5IGFnIy/DouhKlI5WdQurm8c
	vemf+gypYmHhG5MZowCEypyOC99gNg2ZheV602SEE+6i7pxgn/Eq3/T8xoR6DCiZJwjiStIWw50vS
	mEXep7cSrkFsNnbdfF0Qr9Oc+MbJ1RMOBLnIeEOC/FmtHzS3OO7PCYw3ZpJnG32xNF+zL9Ide+Yrm
	6//arpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDmF-0000000HDKX-14g4;
	Thu, 04 Jun 2026 19:30:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDmC-0000000HDK7-0JuY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IaCXd5wjCRGzbKHIR9+FYqT0US6hNPWlc17eCJ4MZU0=; b=slfLOmVxzFHAm5z3XOZdkZKopo
	dhmJyGySYYNgAvu5KAP+LUKa+WlwLx2EyIvM7tI163tOWov4+J1zp5j1fB0gnGbYsG6VWegbN/SVL
	zAqVHmqWXW9v4XE4cENCeyHruvjQWneXnzm/KJXPDPBLYvIhK1KbwcLeB44qOZPBlFCo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wVDlv-00661J-0o; Thu, 04 Jun 2026 21:30:31 +0200
Date: Thu, 4 Jun 2026 21:30:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
Message-ID: <5e912b43-7c06-4d04-9ba0-8f929150429c@lunn.ch>
References: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_123048_139802_EC7CF1D3 
X-CRM114-Status: UNSURE (   7.31  )
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

On Thu, Jun 04, 2026 at 01:30:37AM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Read the L3FM and L4FM bits from the RX descriptor status word (RDES2)
> and increment the corresponding ethtool statistics counters. This allows
> users to observe L3/L4 filter hit rates via ethtool -S.

Are there any more bits which are missing?

dwmac4 has RDES2_L3_L4_FILT_NB_MATCH_MASK for example.

       Andrew

