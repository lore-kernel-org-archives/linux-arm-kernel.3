Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CCCCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE1IDuBuOlQUFZVSkvS8DjOZpWVgs41LPrZbzAl68oE=; b=aGKLyfJgsAEBWvmRuOSFKrv9DV
	E8zyPXrAnX2+pPkb0xU4pvs6sUGCdq80223AuVvWJYnrxlTAOTThzANT/LFdAkxtMAXCuMThDDPKj
	dmCFu2lZbQJq0hmH9vtGpvFKAR2z4GrGJ4zIpNJBO+111m5jvr9Wi9+hadgp2ZCaog7V4XwmXU8cZ
	jm7J6ddEKi6f1GRbyAewYBw3fVtsyH8eJa9CVaBZb0vZay/aaNii6DK9Tw18D2AycOPz/vRxK1rnW
	EbDX5fXeDnIenk/717mgQePF3C7Rx/86DGo8NM+avgHMKxe2bBapHGRyvCnDvm0y87kHMb00+Rflq
	mzoCHh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxOq-00000003j38-0B9U;
	Thu, 07 May 2026 12:00:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxOn-00000003j2H-0gH2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:00:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BA5743B06;
	Thu,  7 May 2026 12:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F70AC2BCB8;
	Thu,  7 May 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778155211;
	bh=4P63+pMF5hPGAISna7ea2oO0XmA+Gl8rd2gi9zdqbEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dj6NZvVvVdOgDw+LjcXmghm4lgzB0yLDuhWRWp6+T1Ab+ZYzJKC2uAEiWaO1m8cmY
	 6fFESU1DwxI99LL4EouzKOWCzyS2GGh9n5dErai0qC1ZuojTipZeVZEbk1Q94thy4d
	 P0VP9ZdJ2RiUYT2vfZ31Gr2SVPLgg5n9ba0LinPQ4w8HC8ywZ764RI8QLKbVhBFDno
	 36OuvxzmLV7EDgAIy6A9MdahCwYHddaXy+bLHpaCkPBW4GLNaKzCV2gGN2zzCeJT1v
	 jh8ToM18pipZRbdpWWSgbSr3cU2OHxam70kBlSkRnXAUGiRxib+9on4Q4WWMvjhu2n
	 jdKoP6EWKNK3g==
Date: Thu, 7 May 2026 13:00:03 +0100
From: Lee Jones <lee@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, willmcvicker@google.com,
	jyescas@google.com, shin.son@samsung.com,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 03/10] firmware: samsung: acpm: Drop redundant _ops
 suffix in acpm_ops members
Message-ID: <20260507120003.GG305027@google.com>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
 <20260420-acpm-tmu-v3-3-3dc8e93f0b26@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-acpm-tmu-v3-3-3dc8e93f0b26@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_050013_238438_20124561 
X-CRM114-Status: GOOD (  12.10  )
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

On Mon, 20 Apr 2026, Tudor Ambarus wrote:

> Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
> `dvfs` and `pmic` respectively.
> 
> Since these members are housed within the `acpm_ops` structure and
> utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
> creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).
> 
> This cleanup removes the stuttering, leading to cleaner consumer code.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
>  drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
>  drivers/mfd/sec-acpm.c                                | 6 +++---

Acked-by: Lee Jones <lee@kernel.org>

>  include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
>  4 files changed, 11 insertions(+), 11 deletions(-)

-- 
Lee Jones

