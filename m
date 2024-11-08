Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B722D64099
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 23:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI0RTkfn8fY7CiUAn0tN20NLKqfSQ7YP3ZV4hwtV/C8=; b=YobmOwA/7KFMBNLNPHcJB2bl4G
	D2O8VvjHMKy/Y8iv1NoZcKCuWFWhH1N9bcEARr5+722Dyxp3n3BEQZf4QKVLZ4LNq263BYzWr9WwJ
	OUaJkcxTx6515oMvBytNUeEgK/xhFARVA0lSkZWB8zmlW0VYTWqAv4YkgdOhi5ywY9OwIE+A9CoX4
	371Mjrif/SOC5nJfrJbbMcxWgKgjh5wHzScptDW7yiusPA3x6JOv1/nt10rxJY6o57c6d6ZdLJx8c
	ddSW5mUv2LPzvu9rRuPYnjHSuf63GNW6lXzj6LhuZsxSjs5INdoygk5IA3h7IdipyCSDKTmCFCrzS
	8cQmwznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ygt-0000000CFNS-2rkE;
	Fri, 08 Nov 2024 23:46:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XYf-0000000C95Y-49AA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 22:34:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C8DD497;
	Fri,  8 Nov 2024 14:34:53 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD8473F6A8;
	Fri,  8 Nov 2024 14:34:21 -0800 (PST)
Date: Fri, 8 Nov 2024 22:34:00 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Evgeny Boger <boger@wirenboard.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
Message-ID: <20241108223400.460982d6@minigeek.lan>
In-Reply-To: <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
References: <20241025105620.1891596-1-andre.przywara@arm.com>
	<7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_143426_126085_79235893 
X-CRM114-Status: GOOD (  15.83  )
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

On Fri, 8 Nov 2024 23:14:51 +0300
Evgeny Boger <boger@wirenboard.com> wrote:

Hi Evgeny,

> Tested-by: Evgeny Boger <boger@wirenboard.com>
> 
> We had stability issues with some of our T507-based boards. T507 is the 
> same die as H616, to my knowledge.
> They were fixed by essentially the same patch, which we unfortunately 
> didn't submitted to mainline: 
> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af
> 
> It's worth noticing that not only the reparenting is mandated by T5 User 
> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the 
> same way.
> 
> We tested the patch extensively on dozens of custom T507 boards (Wiren 
> Board 8 PLC). In our test it significantly improved the stability, 
> especially at low core voltages.

many thanks for this reply, I was hoping for such a kind of report!
I typically don't test those things in anger, and only have a few
boards, so having those reports from the real world is very helpful!

Can you maybe give some hint on how you tested this? Does "at low core
voltages" mean you forced transitions between the lower OPPs only, or
were the chips undervolted?

>  From my understanding, all Allwinner SoCs need to follow this kind of 
> procedure, however it's only implemented in mainline for a handful of chips.

Yes, I saw, I have added this to my A523 code already, and prepared a
patch for the H6.
Do you have boards with any other Allwinner SoCs you could test on, or
even already have experience with?

Cheers,
Andre

