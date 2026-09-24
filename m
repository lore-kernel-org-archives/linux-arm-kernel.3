Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152E4C98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHMlTAryYkKRHoZj/xsR4dPiUEBqRHg26hGB5/0An1Y=; b=j9/WhnrmhQ/v+CQ1160XA34/7O
	0R3XIzoZxUJL2lcOduObslvm3FYxhz6amAF1AK8f+TrWq+RatKyhsNC6iptR3++7fpL21yOhJOzO6
	jkGeAq84ccg5kllEiw9QUj5U7cCdkSemjzs6LqmzypdtaczGA7vbtk4xLB4sCCK0KwGADnG4UtMHG
	WvuZvZdzTONn1eilFmBVLMrEqKX90EGMb3w97qMv5wtwvHx8zmLPpeME1+5ziBQem8Ud/YFV/m6Fg
	Til6BoxMwOJ9ZJx1Ama1C9b1305mqvfnw1caOSxr1dRoxJKY7Qa1nOxw1/uh1GXuL3qBtdsmUTVJJ
	sfR2x9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dLZ-0000000ACOS-47LE;
	Thu, 24 Sep 2026 06:54:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dLY-0000000ACO5-3quD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:54:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4483B44057;
	Thu, 24 Sep 2026 06:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053301F00898;
	Thu, 24 Sep 2026 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790232860;
	bh=xHMlTAryYkKRHoZj/xsR4dPiUEBqRHg26hGB5/0An1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lU+IVIffzxwk0PWWjvKyEh2hofKBLn/vVIfLQFveYat051QDQyIkJw34Ugrp7ZRXk
	 1bHk6nwLRs7pd7vQWP19O2uUYRDNSmPp0H4n8t+rqn55djKlwrUGli3hyUz7zlq+wJ
	 rql4H7YueoNrqG8cYMHpm1thmGcRxU380rc6uqo6VMSp01WGkF+q21uyvdeFMCaaKh
	 QS7OVQey1p7xPwwM1xgXJ9VMdXwmb7gLkEq2QTVKVCESaszMiFY2ezIAxtuTcLKfGK
	 rmMQqpR8VOgrsY6M7qrc/zHKF9qDAIGGalu7rd92CC0xdZCD7KoHK9ftXc3KNoD7wX
	 7VAw+i8u3cRiA==
Date: Thu, 24 Sep 2026 07:54:13 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 13/14] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
Message-ID: <20260924065413.GA13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-13-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-13-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:34:05PM +0200, Daniel Machon wrote:
> The ATU outbound windows used by the FDMA engine are programmed through
> registers at offset 0x400000+, which falls outside the current cpu reg
> mapping. Extend the cpu reg size from 0x100000 (1MB) to 0x800000 (8MB)
> to cover the full PCIE DBI and iATU register space.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


