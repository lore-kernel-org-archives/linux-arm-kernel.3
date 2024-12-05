Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1910FE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDWgYQBwKAkBmU8mqem4U1vbpJlKGSSLkLEYV7hJT08=; b=vn9xLpA9b7sMT1Q1NdGBxbNacs
	1Wyf0XCQLXFHqjIwt9ddwWuu0yD9aELHJMks+AfYFxnc3Co9rUCSGRn1f+ouC5Iv+8WqkewORhFK3
	JMSHEyrDiigDviFnmqWZEXgv75nzRN3x4U077d1sV5+ed9LX2gfFHGpp+eA8uUg/ZAVvjxiG1HGqU
	Om3TRjPup40TT9Io4atCZ2ZLpN4qhAcL015c4T0Y7jvNMHhIYEBm8hL6AlFVqbwg1/twPrslW+WrT
	yrDCFc5QTxy4Xc+ebMXXZTnYJmSQwS+AMuW4cWLBx2TCkGXXVYTdavlo/2ZdkPL9VzNeIoT/S/bTl
	yja6QH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8dY-0000000FR0T-1TID;
	Thu, 05 Dec 2024 09:59:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7WB-0000000FE2s-26Dx;
	Thu, 05 Dec 2024 08:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aDWgYQBwKAkBmU8mqem4U1vbpJlKGSSLkLEYV7hJT08=; b=T7dlqbKmvwTVZtpFGTgWTJbQQA
	z0/UiMGJTOOtg9RVil7EH64Ebusx+/DQ9aEZ9K0brLm9c4Oa9j6kuQ4v2DOWzP6ONh+G+gGSqyEAj
	xVo2WIb/dvHz7Sn/jBQ+2rwXByqEvpoTACDPQgzoaE9mBMcSxueK3BDVDlXY+Pod5tdXc815ykB04
	ARqMEL1UzSATuOZJTDl7ZRZY95PXLKyqkIgckYhGkbdz9dIgOK6XkoItVbQ+Uf3YnWP16A1Wy7DsJ
	p5krd8w6io0MVMmYoSLOKHDRgVqyPvyuBsTm9SyLGKJ5K4MTwe6p2TTKvcg4hz0ugq0ljHq1FtjCP
	4ryQniDQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7W8-00000002o6E-2xN9;
	Thu, 05 Dec 2024 08:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aDWgYQBwKAkBmU8mqem4U1vbpJlKGSSLkLEYV7hJT08=; b=oP8OJjsWLoKfVicRB2LCXen8Vl
	wH0npdneX8nZoBc05jmy+wn01h/O79FQyoNgPNcTc8jghL1U22uxnxEpjIlQpY4AagQwBuZtxNAno
	hkG5CHYLT4yA4bZTLhJzflIO4ZR8LVMwJdLym5YbBZgHkS1FxoVpgSBzyU9aEsEhUApUUvJeAlMoA
	WDvYf6r2yPGQyZMRcP9AbgqR3pViyuS5kGpBLgl+P71FeW+ZbX9pX/EcXIoyUlXlMl4A49AFSpztn
	6PTFygzbmF1nJhH8VpI4V1LuETGyxsRLGGFIZ8hSZOxjg72rCjkhy83WoBzXpHI5VOWqWeSFfqfL4
	ERYaTxqg==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJ7Vv-0001iq-2o; Thu, 05 Dec 2024 09:47:11 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Frank Wang <frawang.cn@gmail.com>, vkoul@kernel.org, kishon@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, william.wu@rock-chips.com,
 tim.chen@rock-chips.com, Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [RESEND PATCH v3 2/2] phy: rockchip-naneng-combo: add rk3576 support
Date: Thu, 05 Dec 2024 09:47:10 +0100
Message-ID: <5541205.29KlJPOoH8@diego>
In-Reply-To: <e853b62f-2ebd-4520-8dea-15d8102f25d8@rock-chips.com>
References: <20241106021357.19782-1-frawang.cn@gmail.com>
 <20241106021357.19782-2-frawang.cn@gmail.com>
 <e853b62f-2ebd-4520-8dea-15d8102f25d8@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_084724_915062_85330424 
X-CRM114-Status: GOOD (  11.05  )
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

Hi Kever,

Am Donnerstag, 5. Dezember 2024, 09:21:07 CET schrieb Kever Yang:
> On 2024/11/6 10:13, Frank Wang wrote:
> > From: Kever Yang <kever.yang@rock-chips.com>
> >
> > Rockchip RK3576 integrates two naneng-combo PHY, PHY0 is used for
> > PCIE and SATA, PHY1 is used for PCIE, SATA and USB3.
> >
> > This adds device specific data support.
> >
> > Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> > Signed-off-by: William Wu <william.wu@rock-chips.com>
> > Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> Test on rk3576 evb with pcie port.
> Test-by: Kever Yang <kever.yang@rock-chips.com>

nitpick: the tag should be named

Tested-by: Kever Yang <kever.yang@rock-chips.com>





