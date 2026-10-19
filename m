Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE187CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTJK65vtCWoQGAdDX9KjcA0ppmoYfDkoKSIPicrNvA4=; b=EX+myclqef8pIi6hKh9T2KQ93F
	TqFbIZyk2IGNlZjRKR8zolgy4s8cOUzd64Sjk4SG62lt6NNmOdCbYRSeU57eEaC/EcljvxixFar57
	UWGq7Q8ZNh0JnKIdL6ZgUPDjNrRu34Z6FF/wzI0C9EeRrbhS68AaRZ3pA4goaGwJkWe3hmnRk76nd
	WMyvUwDwjG37ZiiC7jJNvJQTIIJWMTjB33d6BO5BF48xvsJROmH5wu/BmLtSxKi1MSAtU6ilv0Ovz
	hRiUPvVx5sGlV1olyXs7wLS23a7xQ8OR1i78XPM2TV+3BVSLiQxQdLDay7Q9eDuONvV5b1qzZmPJ2
	GTFuduIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImxM-00000007Rof-3txQ;
	Mon, 19 Oct 2026 12:59:12 +0000
Received: from ocn-ckd-mts-119c39.ocn.ad.jp ([122.28.130.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImxI-00000007RoB-27z9;
	Mon, 19 Oct 2026 12:59:10 +0000
Received: from ocn-spm-mts-104c1.ocn.ad.jp (ocn-spm-mts-104c1.ocn.ad.jp [153.128.190.232])
	by ocn-ckd-mts-119c39.ocn.ad.jp (Postfix) with ESMTP id 42FCF340032D3;
	Mon, 19 Oct 2026 21:59:00 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=docomonet.jp;
	s=20240125; t=1792414740;
	bh=yTJK65vtCWoQGAdDX9KjcA0ppmoYfDkoKSIPicrNvA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EEu0Ruv2yoOrQu9N3zcQHbQaBcjmQgV6wRhead7Mde7vWztBjumtNi063EO95Yfoq
	 YlgSwrDCAf1zp2dQPZonG1C6joXrrLrn4J5FC+byIg+0C37gkRG9Km72XISExQlfkb
	 58WD0a8EP9qw16xQAxiIspVer1ndV1xQGKN0E9H4=
Received: from ocn-vc-mts-109c1.ocn.ad.jp ([153.149.236.232])
 by ocn-spm-mts-104c1 with ngmta
 id bfbdb06f-18dfefb5a722c3ca; Mon, 19 Oct 2026 21:59:00 +0900
Received: from ocn-sdpx-mts-113c1.ocn.ad.jp ([153.128.117.211])
 by ocn-vc-mts-109c1 with ngmta
 id 283b07fa-18dfefb56136f94d; Mon, 19 Oct 2026 21:58:59 +0900
Received: from docomonet.jp (p3688129-ipoe.ipoe.ocn.ne.jp [153.238.101.128])
	by ocn-sdpx-mts-113c1.ocn.ad.jp (Postfix) with ESMTPA;
	Mon, 19 Oct 2026 21:58:58 +0900 (JST)
From: "Asai, Shigeaki" <y-asai.0816@docomonet.jp>
To: iav@iav.lv,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/meson-gpio: Allow the GPIO interrupts to wake the system
Date: Mon, 19 Oct 2026 21:58:58 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailer: HidemaruMail 7.42 (WinNT,A00)
In-Reply-To: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
References: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
Message-Id: <FDD5FC99B1D1792F3006A@docomonet.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_055908_925843_993F1768 
X-CRM114-Status: UNSURE (   3.91  )
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


On 10/10/26 20:20, Igor Velkov via B4 Relay wrote:
> Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
> GIC parent.

Tested on an ODROID-GO Ultra (S922X), where the RK818 and RK817 PMIC
interrupts come through this controller (GPIOAO_7 and GPIOAO_5).

With this patch, an alarm on the RK818 RTC woke the board from s2idle
4/4, and the power key (rk805-pwrkey on the RK817) 3/3. /proc/interrupts
counted each wakeup on the right interrupt. Without the patch, neither
of them woke the board from s2idle in my earlier tries.

Tested-by: Shigeaki Asai <y-asai.0816@docomonet.jp>

(This reply was written with the help of Claude.)

