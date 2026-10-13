Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F1CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voXwZ9GHELmdvfKeQdsY789oye86zxpZWfwrsUceQ0A=; b=TRgLwD1DTYpW19eOl2ZPVUwIMW
	jIFomsSeA0MH8xGisWYcrZbTGii/ljhXJGtHgFP1g0Yn9mVHrUN8lwPXCuRdzNz+WtfHjLptc7qYh
	4CctkCibjF7dXqzhdbPPZ4hnzc4xWjmrwACsrR3hIB4spyIBFyMfLT67evHUr9+mHBfI/7Ha6M6ZI
	Y20rk1G+CMZtUgb98J9+InBWH/r5eLKbStsaG5UuqhSjS8GjBS7ry7ii/I+xb3s0F5DdX5EBBKwFs
	ehoBDOJ9zAcPGHVH5nDA4m8RmrDRKDc8o6CZJdlKaXJExv3AkGoHiib/CX5HFkz0mX6VjK4b8vd4z
	V8jMOc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbsK-0000000Cqrr-0Xtd;
	Tue, 13 Oct 2026 12:45:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbsG-0000000Cqqx-2nyX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:44:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3C0EC653E9;
	Tue, 13 Oct 2026 12:45:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E83760362;
	Tue, 13 Oct 2026 12:44:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5249811D71222;
	Tue, 13 Oct 2026 14:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791895491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=voXwZ9GHELmdvfKeQdsY789oye86zxpZWfwrsUceQ0A=;
	b=B3sUm9TwgIx8zQVOu4RffReXIr80NLD8nNv0kqomZGwBCtHfHil5I+1reMgrb5UWlKEZQN
	AJNa9S9bZ519Mi+BLt6S33dLQU1qXUgZAxuTSGXaMQhDiPj6sC8qOo5GxTVQwlEBB1OwMX
	8rNiKZfJYkHASy38FTN6JRZ/MFaMnZJNHbKwl10PIMdJ1XLktrbzMyM9pK+LeiYgsctnvq
	oM7l4qmK9CuSR+M0RZD9+EVcvheewhUBaXeK0a9P3ZiMBlunTIEI0DPL3Pf8r53NWrUh2R
	igVVTPwmwHjTARPRaXVWPSNy0uRFegT5QLCUgawMJkJQze4lABxUThtV3cF0og==
Message-ID: <466cff3f-e3bb-4581-9e79-f4a980570244@bootlin.com>
Date: Tue, 13 Oct 2026 14:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/2] net: stmmac: Track and report the TX DMA
 threshold per queue
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 xiaoliang.yang_1@nxp.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_054456_902161_78450DB5 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Ovidiu,

On 10/13/26 13:45, Ovidiu Panait wrote:
> On the Renesas RZ/V2H platform, which has two dwmac4 controllers, we
> observed sporadic iperf3 TCP TX failures on one of the controllers, with
> throughput dropping from >900Mbit/s to ~1Mbit/s due to TX underflows and
> the resulting retransmissions.
> 
> Commit 3a6c12a0c6c3 ("net: stmmac: bump tc when get underflow error from
> DMA descriptor") made dwmac4 raise the DMA threshold of the queues that
> report TX underflows, by increasing a global module parameter 'tc'.
> However, this logic does not work correctly across multiple queues and
> controllers, and can leave the TX DMA threshold stuck at 64 bytes.
> 
> This series fixes that logic to track and report the TX DMA threshold per
> queue for each controller.

That's a nice cleanup, thanks for addressing it :)

Patch 2 belongs to net-next though, it's not a fix and it brings some user-visible
changes in the stats.

Thanks,

Maxime


