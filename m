Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A265C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sbfWbfjMC1wrYHIy3WQJtaogDzSegLbn5ptdiNsfQE=; b=GTUHX178GB5poYM5Y6ODIwB+BZ
	eziUi5wdu/N09ym1UtwIlhQ557x3Dn37KIVgmov0kzQyXA+YiNx81Hei2tuCxUgdJevgaCEkaH/Gp
	NWb9Fk0DIJlCN9rXohPs4QmainUVnc+ujm18x6uS9qqQqRiA3x2o2hhrjDIoqMDkbHHIq6pbwusdz
	G3W62NuezPqVUGZVnx9vCzLfLRBK/dIlMFRLrbcI9lTVOgEBUmNlAvkauKxN1UXLZSeKqWumViGJU
	Zr0Uzr1RTF6UfEh0wAm3R9jqmytzr4UZnUh1zEzUpNFftgKpQ7/5bdyONBhz/dyLYkUbZN65c2AX/
	GrR83D/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriV-0000000BIRU-2ZVa;
	Tue, 12 Aug 2025 16:19:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmJS-0000000AVyL-2bMn;
	Tue, 12 Aug 2025 10:33:03 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 49A983D5;
	Tue, 12 Aug 2025 12:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754994728;
	bh=N/zIXxDe3G/XcFSJ5iLcD4wYwc9bg47M5HzamE2Ado8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9NDDkggCX2zZjc9kd+xyESuqoBhnKN+B6QOO6dCfmIcyIPR8dsmG02S9uS6Gacky
	 XsvwDKo2NU2ZdfNIZc2pUokrqIX4arAHMesCPqh7Y6EtJHfu3bKP9D9VQinWU0TDde
	 cxSl6WM2Xv6aJ9OPGJ5YW1miOGdCXHCl2cQiKFBU=
Date: Tue, 12 Aug 2025 13:32:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
Message-ID: <20250812103243.GK30054@pendragon.ideasonboard.com>
References: <175308758352.3134829.9472501038683860006@localhost>
 <m31pq9y98z.fsf@t19.piap.pl>
 <175326599663.2811177.16620980968274114885@localhost>
 <m3h5z2vw12.fsf@t19.piap.pl>
 <175344176070.2811177.10693943493658922992@localhost>
 <m3qzxyug1s.fsf@t19.piap.pl>
 <m3cy9futcj.fsf@t19.piap.pl>
 <m34iumujcs.fsf@t19.piap.pl>
 <m3zfcet41n.fsf@t19.piap.pl>
 <m3a545t789.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3a545t789.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_033302_797085_7E33B317 
X-CRM114-Status: GOOD (  18.96  )
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

Hi Krzysztof,

On Tue, Aug 12, 2025 at 07:54:46AM +0200, Krzysztof Hałasa wrote:
> Hi Stefan et al,
> 
> BTW I've added Lucas Stach and Shawn Guo to "Cc" list.
> 
> The problem is the CPU core power supply voltage :-)

Ah, the dreadful overdrive mode.

> - while the reference manual specifies the max ISP and MEDIA clocks at
>   500 MHz, the datasheets show this requires the "overdrive" mode =
>   increased CPU power supply voltage. In "normal" mode the ISPs are
>   limited to 400 MHz (there are other limits, too).
> 
> - I've tried lowering the clock rate after booting the systems (with
>   a CCM register write), but it didn't fix the problem. I guess some
>   reset logic is affected here, and the (lower) clock rate must be set
>   right from the start, in the DT.

That's interesting. I wouldn't have expected that.

> - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
>   the ISP2 MI corruption. I'm currently investigating PMIC settings
>   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
>   I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
>   though.
> 
> - the question is if we should lower the clocks in the main imx8mp.dtsi
>   DT file, or the overdrive mode should stay there, and the changes
>   should be made to the individual board files, or maybe the U-Boot
>   configs (PMIC output voltages) should be changed etc.

I think it would make sense to lower the default clock frequencies, and
provide an overlay to enable overdrive mode.

It's also interesting that the issue only affected the second ISP, as
the first one should also be limited to 400 MHz in normal mode.

-- 
Regards,

Laurent Pinchart

