Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F857CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhwGhRTjppBgNw8HHFKEmC3YfseR6UOeLF4WLAZNcaw=; b=tOdw/HzwX/Kxb8dxoCu07gmp7G
	CKffGVgj/Z9sJVGosDaLBwgnyzOpr3dGUbn41qnLzdR4QBwYbcAKOPvLeAE6afqqE2pAmBoCiGDNq
	lrScBHvvISPHsq0z0Hac7SjSPFWhFhkgS9rI/yxp71a49RU0Ol8CApAzzOZcF0iLORY+Y3EsriDNN
	r6ckPTINdqSxDReyLkedINe7gRXnYcV4+CChVNWgQB4otFcsqcIQXY/PoVyBh6+9DEPENSDxKWxm5
	p1pT6BE9j/sTDz6hzHF260RDFnhLzmhyHwBrusde/ixtAJ2LXvc/iGgk+kJSdr6PjcEdsulBgfIeZ
	Oq3jCOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXakA-000000090U1-3MHi;
	Thu, 11 Jun 2026 08:26:30 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXak4-000000090QP-08Rv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:26:29 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260611082616euoutp02e0b3b5a4668239149d189816b51a24ea~3_WHL7kx21726317263euoutp02a
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:26:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260611082616euoutp02e0b3b5a4668239149d189816b51a24ea~3_WHL7kx21726317263euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781166376;
	bh=DhwGhRTjppBgNw8HHFKEmC3YfseR6UOeLF4WLAZNcaw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WP5fVf7bqkbo4VdgHWn8qqtBKF+RHRqV6LI00ZwUCFzhaBP9Eq70e7Py9u09YikTW
	 Fm6zSKjRTYXbF6SnqgLbnVCAvgIU09OXFAIR8ifTes5554DpJgawudUQOPqaZxhgZJ
	 BjdWLYKrK2SjvkVRm9a5LiwWmJee0pVSsXSXo/Mo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260611082615eucas1p2e0d075707c644743cc2b745ed838d646~3_WGwPZ402819828198eucas1p2c;
	Thu, 11 Jun 2026 08:26:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260611082614eusmtip15addb285747362b715188d44fa381fda~3_WGD3M962800828008eusmtip1H;
	Thu, 11 Jun 2026 08:26:14 +0000 (GMT)
Message-ID: <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Date: Thu, 11 Jun 2026 10:26:14 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy;
 restore meson non-sleeping
To: Viacheslav Bocharov <v@baodeep.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
	Blumenstingl <martin.blumenstingl@googlemail.com>, Robin Murphy
	<robin.murphy@arm.com>, Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260610153329.937833-1-v@baodeep.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260611082615eucas1p2e0d075707c644743cc2b745ed838d646
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260610153425eucas1p29d20a835114a28b15cb12ea00534e074
X-EPHeader: CA
X-CMS-RootMailID: 20260610153425eucas1p29d20a835114a28b15cb12ea00534e074
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
	<20260610153329.937833-1-v@baodeep.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_012625_471813_C2EF28B4 
X-CRM114-Status: GOOD (  17.72  )
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

Hi Viachesla,

On 10.06.2026 17:32, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
>
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
>
> This was reported on Khadas VIM3 and worked around for Amlogic by
> commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
> sleeping"), which marked the whole meson controller sleeping. That
> workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
> no longer detects devices, because its IRQ-disabled read slot calls the
> non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.
>
> Patch 1 fixes the proxy locking generically (always a sleeping mutex).
> Patch 2 then restores meson can_sleep=false, fixing 1-Wire.
>
> Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
> gating on gpiod_cansleep() change behaviour. No current device needs
> atomic (non-cansleep) value access on a shared GPIO -- every report
> (Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
> (eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
> which is what the proxy exists to vote on. An alternative that keeps
> atomic value access (split locking) is possible but adds a second lock
> and new race windows. I went with the simpler, verified approach and
> would appreciate guidance on whether the atomic value path must be
> preserved.
>
> The two are a unit: patch 2 must not be applied without patch 1,
> otherwise the original VIM3 splat returns on boards that share a meson
> GPIO -- please keep the order. I have not Cc'd stable; I will request
> stable backports separately once both patches have landed.
>
> Viacheslav Bocharov (2):
>   gpio: shared-proxy: always serialize with a sleeping mutex
>   pinctrl: meson: restore non-sleeping GPIO access

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

This probably also affects the similar changes in Rockchip GPIO driver done
by the following commits:
20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
7ca497be0016 ("gpio: rockchip: Stop calling pinctrl for set_direction")

I've checked this patchset with these two reverted and no warning was reported.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


