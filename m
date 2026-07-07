Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ECBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Joa5f766kFQG+VDx1xi0qljvrOXZ8cpEpg2lZW0VgAE=; b=ge24G+8X0vtH1brqhDzjKFiWzW
	9NMXyNJTqmg2W8i0w0DQfh/I6tqkDDNNQDqtRtEGBq7culeQgHtnROx0V50oFBG9MxL9DZKBqGIIQ
	3x3yjvVfe9BNxQK7ycBMPb0NsGx4wqwcn0aeyx/skQiY3BDDqOx3KqzNcQ2Cs8jgYEEscNSgWJANO
	207dFatVPTYid9ssKj5gjNgVdacFKEGjR3f82l0M4GMrOvfptiSsJ6XNohNaLCw4otNClGlIrKnGE
	mOmwbbuPKGB19U0OhfT0D3ntzlbLNvMQncy55/rVwdX7jP+Y8JfHk3KqofBTWPxllzH+/j0BnyyAt
	PMdBX3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwOJ-0000000E0H8-15iK;
	Tue, 07 Jul 2026 03:22:35 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwOG-0000000E0G2-2h6O;
	Tue, 07 Jul 2026 03:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783394487;
	bh=Joa5f766kFQG+VDx1xi0qljvrOXZ8cpEpg2lZW0VgAE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RZs1rvn8clkEsFajZvmc63LcCjz9VVvCwaHOadCLiKgz/67dVo77oQPM1rftTfYbH
	 qCVqpQWygTrhuBCtkC+dydyeBl2HDT+SAwLVCgU2Or6LhtNnwMQTEeRlSvqxZaIeGS
	 VdJhJRONyF2ThTqR14LWVLVfprKGBv1EaPs1d/bY=
X-QQ-mid: esmtpsz18t1783394468ta66ff50c
X-QQ-Originating-IP: OHa2ywK7nMDSursBl1DEWqW1dmcItOyUIsCyNfbG/H0=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Jul 2026 11:21:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12717493362023860116
EX-QQ-RecipientCnt: 12
From: Xu Rao <raoxu@uniontech.com>
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	marco.crivellari@suse.com,
	neil.armstrong@linaro.org,
	raoxu@uniontech.com,
	samuel@sholland.org,
	vkoul@kernel.org,
	wens@kernel.org
Subject: Re: [PATCH] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup
Date: Tue,  7 Jul 2026 11:21:06 +0800
Message-ID: <8976A02CE2417DF2+20260707032106.985208-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <d8042dd2-303e-4f24-b7bf-74ae080f4ae6@arm.com>
References: <d8042dd2-303e-4f24-b7bf-74ae080f4ae6@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OSjTqsWSa+11SUZPfN0haWXCoqWGFfmDFrPvqk7F+sObVw0C8KD7shA9
	2ryURV4Oj7O0oYBhXXX4DgLzEaT7uaFejjtdFsigP7K0umDYnVtWf5J0stkaB2otGGx5j0t
	aCEmkJ6Fj2TdTSLF/iOo6EMzYe1v996ZCZIZ3FNWpzgZaltRr9y7sa8u+mdqjYHggH4bL7w
	QgmDbEOXWBsC3orv1UxIfTP7fqsw8d+2xYn5dD2y8z653zJ3DiVCKY1scMESUIXi9UgiMdQ
	htzBRWfx8HbmMU+V4z3zPMDU3wASmE1nIgK0UJiHeNa88LBMJ+NLOirgONWBe/sFgpaqhc9
	BHzdbMFgynPv8x3XuKcV5k5TVoF/NtVhnudlrgqtY0aWYEjzYNbt++LSfbaBnkEpOxAevVv
	Oh2yZzKBPGCsF/DnecN3QPTlnk3LRdfaPdRs9ZOBz5IL+I4s+6GaOW2XSoZs3TZVbh+IhRU
	bmcFwTB1aGLPXXrHHStyP/fz+bRkHl3sn7XbIDGTrv1ugx/iWDpwLu6OrpH8OQehvrSVn/O
	3u38FOrf6m9uxqP8ZksRcS2p9WxEol+f1LpWZBj12gpbOSuTUcfSC9gODXPWk8FD8unaH6E
	0UmFgUDSOYyA0SGPOClKdsPoimtCRBK2JJwHR28t4wuo/N85Js6HMj5VhrKEC1C4m0kHSCx
	MktgWiaEes4BAUYkhT88pP/MNOMsZuVvtr5VmQ+VaRE9B19P2G3fvxoJ9E5d8lhs0lo7u8L
	c1jRcVqqqO4nsHHL586LyqDf5AlBtwYZnCm4EXvom0YF3PCEEW4AiGPqP3Raimj1r1UXiHo
	u1GezBox9L7b94sdrnW3PbF8paIBrTfjXdbYxbPehZME18wlgiVWUu5KY2R8ydtYCMKGebJ
	aWBmUrnLHeZwM+GhmmOPqXOP9YSKWhKnmKpHR9cb5gNg5XJxAdsRzJ8UBF1CONTWu6yvzoQ
	wCbycOuRPGGE95kUlOZsQCE8cfEv4ovK7dVoWGrkTpKll4XKYhBQB8pquX4a9FLFcIAd3Mh
	hQM6LCKQeQI51FaTPO
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_202233_038395_986F007B 
X-CRM114-Status: GOOD (  13.91  )
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

Hi Andre,

> > - clk_disable_unprepare(phy->clk2);
> > + clk_disable_unprepare(phy2->clk2);
>
> Interesting, this looks about right, and matches the comment above,
> noting that phy2->clk2 is just temporarily needed. I don't remember
> further details, only that this workaround was quite annoying and messy ;-)
>
> However I am wondering how this worked so far: This should sabotage the
> access to the local REG_HCI_PHY_CTL access in the next few lines ...
> Any idea why this worked nevertheless?

Yes, the current code is wrong, but the visible effect is limited.

In sun4i_usb_phy_init(), the auxiliary SIDDQ path explicitly enables
phy2->clk2 and then accesses phy2->pmu + REG_HCI_PHY_CTL. So the clock
that has to be disabled at the end of that block is phy2->clk2.

The current code disables phy->clk2 instead, which is a different object.
That does not undo the temporary phy2->clk2 enable.

The reason this has not shown up as an obvious functional failure is that
phy->clk2 is an optional PMU clock. On systems where the non-PHY2 PMU
clock is not provided, the wrong clk_disable_unprepare(phy->clk2) does
not actually disable a local PMU clock. In that case, the practical
visible issue is simply that the temporary phy2->clk2 enable is not
matched by a corresponding disable.

So the failure is not that the following local REG_HCI_PHY_CTL access is
known to break today. The concrete bug is that the auxiliary path enables
one clock and disables another one.

Thanks,
Xu Rao

