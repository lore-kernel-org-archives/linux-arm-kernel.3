Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2BAC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15dX0WlwKL5bcJMOivsSURnwdcljPC6/Eyv5kiJGgNQ=; b=KGKrwg+CsxpkSTGngFU2jKXAYM
	rjPalDbUjxcP7H0zadeXkpvvj/M2c8lL+yTtjsAsW6JJShHSSLR+GD1oDSbOS1BD4sfCgKV824/6i
	2uTqDJ1lDb4TyoJwnqIZe37CsMDoJ6w1yDMT98Ysf6Cpnxx/VhIMaDBu7Mk6C5+uA2yn3hlGTRYSc
	PbHoVHKTvHCicZeC3sH586R9mrEVkUOdCr/Z+KUmTQlaEJODEM2lVvPNPtVkMjLBtGOhs+bTGuqPG
	2C91VgNvHNAFAZCCCgFLwB40gwt44/7mgx19oiVCv2q7n18MNpll7aW3ADriLWUaVeFgqGRQ+6nX1
	ptU05nhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MRK-00000008J0b-34Sh;
	Wed, 23 Sep 2026 12:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MRJ-00000008J0S-2GoQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 12:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=15dX0WlwKL5bcJMOivsSURnwdcljPC6/Eyv5kiJGgNQ=; b=kSvaPXq8VvEcF2CIR5cPmyjJE5
	08ihrLa0eqQo71W54D6ordi2FSFDqmuYjSkniZkEj1DNl0/wc9aS4YyDeyoAu/i0A+TEiQblpORc6
	nRj6aCPTXS0h6uqxMvzskW9eVL6vjgE24ynCi+V2fqCItSetTEYSOz5DShY+Q3+nv8XhfWHyG/fkQ
	9eD2XAzAiT0+IHvRP9w9QjqC3gnpq7roO2yjHv1Sq7FFJGTo5Kf53k3sZeOaPHzRkiLUMmcE5ETNn
	LbpppIO4R4tPyY88LmP8buxvr5ClQazP0+9qfcXjyS4xihvLthKjXUqZfdV88OT85ZdaYNNV/ueao
	FPQiY3gw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9MR1-0000000Elux-3E9C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=15dX0WlwKL5bcJMOivsSURnwdcljPC6/Eyv5kiJGgNQ=; b=xoCiV1Yd8jTY6caTFeswdyRugj
	h+2ypVn+EzOauLmoSBxXPaiBS0ngaPMZjo8tp0P+rFdnqKX/6zWzCBeKth+pAfQ3s+lHBlHTrfR5K
	vkI4ueuiM24bdfOFVh4CDL71kurS1Ibp9kRakgvIlRVn/1TkpPWgD8Tu7oxhpxwyEOZc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9MQq-006nyx-7X; Wed, 23 Sep 2026 14:50:40 +0200
Date: Wed, 23 Sep 2026 14:50:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
	mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Nord ethernet followup
Message-ID: <aa9f1765-ca8c-445e-96bb-4c768ad55623@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_135103_838942_68D8B0A2 
X-CRM114-Status: GOOD (  10.13  )
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

On Wed, Sep 23, 2026 at 04:49:18PM +0800, Zhangfei Gao wrote:
> This series verifies Mohd Ayaan Anwar's patch set:
> 
>   net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing [1]
> 
> Tested on both IQ10 RRD and Ride
> 
> The full test branch is available at:
> 
>   https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
> 
> 
> [1] https://lore.kernel.org/linux-arm-msm/?q=qcom_xpcs_nord_emac

Please don't submit two overlapping patches for the same driver. Wait
for the first patchset to get merged, and then submit a follow up
series.

Qualcomm has a number of Mainline Linux mentors. Please talk with
them, because these two patch series are not great.

    Andrew

---
pw-bot: cr

