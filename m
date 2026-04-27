Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F0FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8thP6qhPrOgal4uMGkaw17Qz6H+fZluoqd+J197DkA=; b=zlA2382Nxq2coYOrFQceI/fIow
	x/0OjRnZGSS5bUpf+7wfXwcypxUJ+81HHiOvTarl3/YexWt+hSnniMTch8l6FjTMRQpEoQBmVfK5G
	3jscLBrok2YwphYyhhsVX9HyKwyhgpEa8nVTEDPApmODqG78MTdLEJ3KQC4uwGjC4fy+TVVC8Mw01
	R1jDrcNXYTgLLu77uOr6fLArj8OEy9MJv3e9bXPjT9X66BlOIZ16f6PmCi1nzehpUt+8LaTswL7sX
	/Gu2DV5gIlJXdbXkiGbI0wZEAUt5RLeti4Z7VojmnDNOAXA16dp+XZUbz02/MbpGVG2XoLrU4iwf9
	ow/0xS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPYk-0000000HQ8k-1iP4;
	Mon, 27 Apr 2026 17:15:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPYi-0000000HQ8K-0o6R;
	Mon, 27 Apr 2026 17:15:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2DEF4457C;
	Mon, 27 Apr 2026 17:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEFEC2BCC6;
	Mon, 27 Apr 2026 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777310146;
	bh=sq1+qESM1wlT/vwSuEnbxCmoVbaCa6OozRDKCDMNaJU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AFRQycP/TI0kAFHPNQWNXin9rnss5JlxCniueDahA3tGRk5NHMC2cfaKGiHUxEnaZ
	 sLBiunrMJL9DOCI8z3HaC0A0M37K3FOID21f8BULAntPT56uXpJczpLD14cGxrpGIQ
	 4WPgFGDn2yq857zHVbMlgupj1TbLFDwmSKX0VNrUvJYKC0P+YZkjftuvmEypaX6Ws7
	 YNxj+Br3Yp+PbYDaKmmXIgRshr/sbql1Lw/K3nbyTU6ZWVLF/xiCdmwIWW3BJm7Ms+
	 RRoEMiEsrsVzr2snExWMqlR3YkJA91/UQ1IRz3Cix4GyrGQbbKBqrarSvIhB986ZyB
	 H9mAcCZmaBnVA==
Date: Mon, 27 Apr 2026 18:15:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Salah Triki <salah.triki@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6359: fix unchecked return value in
 mt6358_read_imp
Message-ID: <20260427181537.46c2f20a@jic23-huawei>
In-Reply-To: <ae9JFucpXBPwwGzr@pc>
References: <20260427085458.38546-1-salah.triki@gmail.com>
	<ae8pAGBGGOvsURka@ashevche-desk.local>
	<ae9JFucpXBPwwGzr@pc>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_101548_277366_A8B307A4 
X-CRM114-Status: GOOD (  26.34  )
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

On Mon, 27 Apr 2026 12:31:34 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> On Mon, Apr 27, 2026 at 12:14:40PM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 27, 2026 at 09:54:57AM +0100, Salah Triki wrote:  
> > > In mt6358_read_imp(), the return value of regmap_read() is currently
> > > ignored. This is problematic because if the bus read fails the variable
> > > val_v remains uninitialized.
> > > 
> > > The function subsequently assigns this uninitialized stack value to
> > > *vbat, leading to incorrect measurement results being reported to
> > > the IIO subsystem without any error indication.
> > > 
> > > Update the function to check the return value of regmap_read(). Ensure
> > > that mt6358_stop_imp_conv() is still called to clean up the hardware
> > > state before returning the error code.  
> > 
> > Sounds like this deserves a Fixes tag, but the problem is that the whole driver
> > is written like this. Why does having this fixed make it special?
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> >   
> 
> You are right, Andy. I noticed that several other functions in this driver
> share the same issue. I will send a V2 that addresses all unchecked
> regmap_read() calls in this file and I will include the Fixes tag. Thanks
> for the feedback.
What's the bus in this case?

Whilst maybe we should be checking them, it is not uncommon to forgo those
checks in internal busses.  In general they should be more reliable than
something going over PCB tracks like spi or i2c.

I'd be tempted to fix the uninitialized variable by setting it at declaration
rather than worry too much about checking all the regmap return values.

> 
> Best Regards
> Salah Triki


