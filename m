Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932B2C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Udh8uRDFFJUfzxnnMCbUXMeEOOBUXXwIj9CxP3a/cSA=; b=LYfcF4h5YIQRWkUi2HZPmaSC+o
	G58q0mcyiE/oL0oZbWcmgyr//avudzEpG9ixWB2pd651yKgf0sZgSTT657qSuZDASMOj0c7G6SbOv
	w9SDGIX8lxt0oRRxoP+0nZQiOhAmvrI/UwDPVzyYSwrUq1M+OHZVpO3xcfqLjaSZCdqWIjET1GXaX
	ZL9QPTLLnHEUcBUpE5yEH8PCiqLTAPevtilB1V9HGLyATF1nvRdTm/F5qVJZm07DBAWviJDE7w3JV
	OvA1pTrxolE3Ef6eRsLp84d/a5g+DRBiZEZu3gvqYAooj/Rfm8G+n/gVs+ORWvHxxpYmxe38JwyM/
	aBkNGi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYhN-0000000HBzh-0ijq;
	Mon, 24 Aug 2026 17:43:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYhL-0000000HBzO-1Crj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:43:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41A5760120;
	Mon, 24 Aug 2026 17:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657CA1F00A3A;
	Mon, 24 Aug 2026 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787593381;
	bh=Udh8uRDFFJUfzxnnMCbUXMeEOOBUXXwIj9CxP3a/cSA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=n4eJX8yIFWAL774dvneolSQrQozT6DR+74sYyr06cxlX2Pqk6Yp6NrM8bvNSjTa7X
	 SHqPQtLYzMERMUnqr5N7Uzvxx68dd49bX8VFWN0zWcCXyBg9ho0eOxJ7UbIGpvu3RC
	 UPqiPYuov6FJMOlswd630H19m9vPGDGnseijqVIyxzkureVmGA7LTSu6LBfahX06oA
	 T5bql7TSbto2wZBTI978PP2jh3dfolH3MbgZs5IoLTmU37ulbqaV7esS/AUM5B1VQD
	 R89moxNtLys/PHRs4iLIZkkRujgLGpeKSWTF0ZXDwOso65il7aUd4XlkzVLVk3L8Ie
	 sEjdpIQyuj7kw==
Date: Mon, 24 Aug 2026 10:42:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "maxime.chevallier@bootlin.com"
 <maxime.chevallier@bootlin.com>, "andrew+netdev@lunn.ch"
 <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>, "shuah@kernel.org" <shuah@kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>, "yi.fang.gan@intel.com"
 <yi.fang.gan@intel.com>, "jun.ann.lai@intel.com" <jun.ann.lai@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v2 6/6] selftests: drv-net: Add VLAN test
Message-ID: <20260824104259.374ae2c9@kernel.org>
In-Reply-To: <OSCPR01MB12769466CF2256ACC6FCCCDD4D3A02@OSCPR01MB12769.jpnprd01.prod.outlook.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
	<20260821170959.79708-7-ovidiu.panait.rb@renesas.com>
	<d614d8de-0da2-4673-bd11-02497d8a37e0@lunn.ch>
	<OSCPR01MB12769466CF2256ACC6FCCCDD4D3A02@OSCPR01MB12769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 24 Aug 2026 11:50:12 +0000 Ovidiu Panait wrote:
> > +            no_change = False
> > +            if current[name]["fixed"]:
> > +                raise KsftXfailEx(f"Device does not support {name}")
> > 
> > I'm not too familiar with the self test framework, so i could have
> > this wrong.
> > 
> > It looks to me like you fail the text if it is fixed. But does not
> > fixed just mean the hardware does not support it? So i think it should
> > actually skip the test?
> 
> I compared the XFAIL vs SKIP usage when a certain hw feature is not
> supported and it seems that most tests use SKIP (tso.py, gro_hw.py,
> hds.py, ntuple.py, etc). I will switch to SKIP in v3, which should also
> allow for some reduction in code duplication across tests.

Please double check that the test passes on netdevsim (without NETIF)
We can't have skips in SW mode, all drivers/net tests are expected to 
run against netdevsim, really. If they don't they should live under hw/
(where the SKIP vs XFAIL distinction does not matter).

BTW there are ruff check and new pylint --disable=R warnings in the
python code, pls fix

