Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E33CFC269
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kW4EyxFRplveLRr+4iJDnejmmKOCrbL0yL/oTxS4Oy0=; b=20b8kybMRhsRwbizEIhVpJLRhN
	15Oi6yd2d/EZnx6QufyU2gty3RZ8PCUnYWYu64uZFs8fCef3c01lY61+ezig1Yr7gHxNUNLokrXhU
	7kP2mdfAMFkpWK8rZHC+KA6eTw3H3tKTwPLZBzqrWLxlQZz4tWOYMenTvB3I2bWrLGkIzBat45pXI
	WyiPj4rdD2bm64/DEbzNFh4Kebge4wYqgeC2wrCSUS03codtvZ56dUAWhbl2tgy6jMz8EV0oQgq9h
	j8+5PUeiYkx6eJWCu1mrkPz5v2hCv1MaQdJiKpoO8XI1igC6kY/nTtIcIJGdiXsaOUJsvp3cCAh8M
	4pb5Bg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPuI-00000008LO7-0X5i;
	Fri, 21 Nov 2025 12:06:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPuH-00000008LNv-0avH;
	Fri, 21 Nov 2025 12:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C8176022D;
	Fri, 21 Nov 2025 12:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C236C4CEF1;
	Fri, 21 Nov 2025 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763726787;
	bh=VqX7+WbzEjRbWfiARZi1O4BEpVb3WUA3Oo+pfFVi0W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEBTj8gyooZy0CocdtbIgZytL3SxTSMOjNLl/zyKqMnhPb4UuY8BnKRixPJ7g1qnV
	 WJyr0yuf4VbIiRQQhWi9UHYAMNMNuHmlgGXbgldsIxjafyKxMLO8dFMC7E234Cv6i1
	 8xzAVPvTt7dY5BT9xUNzjUf+kmDSJYRo2SdlwlcucSE4E+SP4udWzy7ui7uE+1Htow
	 kiK4BRirtZeytS2Awt9s8v/c/vtOir4GAhWNW9cRtyVJQRVB2QnPcasx3ko3cuicd7
	 flNaoM82MM6mbHlcexrYApURdbArzwqv63fbzV5LF61QmqroYnmKDsiR8ob7UO57XO
	 TJYFAyxkeYngQ==
Date: Fri, 21 Nov 2025 17:36:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 00/13] dmaengine: introduce sg_nents_for_dma() and
 convert users
Message-ID: <aSBVwOs3igPF71DQ@vaman>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
 <aR9otpWZkPZrb9ug@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR9otpWZkPZrb9ug@smile.fi.intel.com>
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

On 20-11-25, 21:15, Andy Shevchenko wrote:
> On Thu, Nov 13, 2025 at 04:12:56PM +0100, Andy Shevchenko wrote:
> 
> Vinod, what is your plan on the DMAengine patches? (Asking not only about this series)
> Please, tell if anything needs to be done from my side to help them being pulled.

Sure would appreciate if folks can review, make it easier for me to
pick. Yeah been behind for a bit, picking things now.

Reg this series, looks okay, who would ack patch 1?

-- 
~Vinod

