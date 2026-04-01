Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BFED35176
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mbj8DRjJ6FjmIEmUsBtCSoKyYAdXduQ+Y0GSwlGLOwo=; b=eyJZGPhaZiqfETV2fohsJVPvob
	FYH6Mvy4s4f+6xRqjOHynuKrgIqq4NhqkbDK/zjyXeA0O2hWQxdemD7ck1zLTuAd3GwctXaj03mSi
	V1d7jUN0gzExnuvihqBKc9/pWaexI8sKLtsUpsknvZlQ9PD8knpdP5lRpxy0FLjDs2rUENhSRAIHB
	QrRxWvWpnwCZ4S5w0rdd9yXtnsQVP2ql/tjgvbi5rF4oVAx8bUlemuMhA1Z34IK8JykpOM32yfwCl
	zhg8Yr35jQEcb1jzLIrcUWs/SPmN0aHUFcCUbOcRUBWkOATkQwJjtud3q+L9Dzp46JEGwknYen+36
	C3fucrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tIU-0000000EaMh-2yQQ;
	Wed, 01 Apr 2026 10:59:42 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tIR-0000000EaLV-3QiI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775041178; bh=Mbj8DRjJ6FjmIEmUsBtCSoKyYAdXduQ+Y0GSwlGLOwo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=V3z41BzUUGsB5URRuoc25DYFE706Zgjp/NYPxzKAtlxQVrQGOHYrKUNQ140FHoUvA
	 wFoDASFqV1q8FwjJ3leJxmvLqW22IcX1BTKOu5hUFwJGoaOzjSKAFFD48dbxbvLkIC
	 UUO+nVlP/iDOoKleOBG6ATnkQmhKxEyFNGJiwi/AcFQPfiQWtAS6NNFvRfp/z7sK53
	 Ii+hoFfO3DLzUJpd9iJ6xdGOS/5OXY+9t609PExSKBLQf+J8QAX8Dk17UKqPjlFhmg
	 iepz9uU+ZMedubGBsGY47kUGw873saKDvQQFu7liDLupgyddHxMUCVkGUDmhSfgqBy
	 MrBp9lSm0cJDQ==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id BAEF25DF94;
	Wed,  1 Apr 2026 12:59:37 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 12:59:37 +0200
Message-Id: <DHHRKZLZFJ8Z.MKILHY9I70FK@bereza.email>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>,
 "Michal Simek" <michal.simek@amd.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>, "Tony Lindgren"
 <tony@atomide.com>, "Kedareswara rao Appana" <appana.durga.rao@xilinx.com>,
 <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dmaengine: xilinx_dma: Fix CPU stall in
 xilinx_dma_poll_timeout
From: "Alex Bereza" <alex@bereza.email>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Alex Bereza"
 <alex@bereza.email>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260401-fix-atomic-poll-timeout-regression-v2-0-68a265e3770f@bereza.email> <20260401-fix-atomic-poll-timeout-regression-v2-1-68a265e3770f@bereza.email> <ZORYRaMAXzaiiK2355T-MbuQTxDy1AU40-E3g_gXEej43XUE6jjbrMSWlOxrIU1uQuvxyxBkv7hyX8OMHBvoiA==@protonmail.internalid> <CAMuHMdWGHzt8nB3EGAToxZibf-O6C5xb9bcWhQQApzL3-6pcCA@mail.gmail.com>
In-Reply-To: <CAMuHMdWGHzt8nB3EGAToxZibf-O6C5xb9bcWhQQApzL3-6pcCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_035940_002968_9536EE94 
X-CRM114-Status: UNSURE (   5.29  )
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

Hi Geert,

thank you for the quick and helpful replies.

>> Fixes: 9495f2648287 ("dmaengine: xilinx_vdma: Use readl_poll_timeout ins=
tead of do while loop's")
>> Fixes: 7349a69cf312 ("iopoll: Do not use timekeeping in read_poll_timeou=
t_atomic()")
>>
>
> Please no blank line between tags.

Fixed. Sorry, was not aware of this formatting requirement.

BR
Alex

