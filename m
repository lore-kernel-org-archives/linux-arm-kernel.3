Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F9FCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TMfc9eA7/FJxuIp8+Try5tXIsc3Y1RIaSKtGnBEg5M=; b=eiFbO9h85BIYbPN0oMMeuQ4LYx
	2lJg3Ub6vkQ2hRIFI2OyvKhyLLbwvkfojdj2v6E0w5ZUV5S6JvU0otJCObRjMGwgIZsW0oOcRYp0s
	TozLzKgDx1/6GfYAnnl+HI0x3MvH7HU/dwsphHB4Cf5T8O3kbxGKyuJfDCtjoDlEkcG2PG6MAzlym
	RrOi/5edItq5VMHpQjX5Yf3xpcnvWNWRFZQ4TkiLs9a1iRQXWMVfJ1gKh14sPTQCZRJNF20BdDKLK
	uu2PpA6VbTRZ5zUD/8shHfEHFILB93gc4Xh4YR/Ru9YzlvR0ComThbJPxZOmjRIJHklbNvEaDLXdp
	CSLxL9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvrh-00000007mjj-1Cqo;
	Wed, 03 Sep 2025 22:22:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsNS-00000007K6J-0bw7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 18:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91E23601A9;
	Wed,  3 Sep 2025 18:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D90C4CEF7;
	Wed,  3 Sep 2025 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756924717;
	bh=j8OqivN37U7s/3MXyiGRY0V9zEvCu9lIMomm6PVYCJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4MvYT+4HWfKOeRmVv/QVqMHo0ZHV6viDUD5TCHmInuzXrQC9briLLdhe6nPf254m
	 DJHpH8YKEbcC5AhFSqObCVrYvSw7CXSXGHTkRvroq8y6MEJckf0cuUTB+apvw+m0Tb
	 fSCqoc/XeI/Ddcia7IcAxJj49Md8mgTxdJLDkT2Qz1tnDtcbqEO0MjlWT8G+fJcDXB
	 7Yxy06GTC2TJ4FRJ/lKMxjkA2Ol1ouTfpGgn/wj4+/04GEopzIeRGv1rFslRQVaRWC
	 W077qbNHaIattrXPS4xVpttQ82fH1ifGj5qpod/COxwqlYlLtF2HNxQvnaDG1N26sx
	 j4sPqLpu04VnQ==
Date: Wed, 3 Sep 2025 19:38:32 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: correctly populate
 ptp_clock_ops.getcrosststamp
Message-ID: <20250903183832.GE361157@horms.kernel.org>
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
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

On Wed, Sep 03, 2025 at 03:00:16PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> While reviewing code in the stmmac PTP driver, I noticed that the
> getcrosststamp() method is always populated, irrespective of whether
> it is implemented or not by the stmmac platform specific glue layer.
> 
> Where a platform specific glue layer does not implement it, the core
> stmmac driver code returns -EOPNOTSUPP. However, the PTP clock core
> code uses the presence of the method in ptp_clock_ops to determine
> whether this facility should be advertised to userspace (see
> ptp_clock_getcaps()).
> 
> Moreover, the only platform glue that implements this method is the
> Intel glue, and for it not to return -EOPNOTSUPP, the CPU has to
> support X86_FEATURE_ART.
> 
> This series updates the core stmmac code to only provide the
> getcrosststamp() method in ptp_clock_ops when the platform glue code
> provides an implementation, and then updates the Intel glue code to
> only provide its implementation when the CPU has the necessary
> X86_FEATURE_ART feature.
> 
> As I do not have an Intel card to test with, these changes are
> untested, so if anyone has such a card, please test. Thanks.

Hi Russell,

Although not strictly related to stmmac,
I am wondering if similar treatment is appropriate for:

* drivers/virtio/virtio_rtc_ptp.c:viortc_ptp_getcrosststamp
* drivers/net/ethernet/intel/ice/ice_ptp.c:ice_ptp_getcrosststamp

And if some sort of documentation of the behaviour you describe is
appropriate. Say in the Kernel doc for struct ptp_clock_info.

