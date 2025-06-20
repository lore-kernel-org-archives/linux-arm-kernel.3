Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D9C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SexsvDtdFHy59LCXhZgboYD+J7kOX3/xH1GfCS5qJ70=; b=Uq4Kwdvfwd2bFTQmrWpWqpX6JJ
	BcbhVHIZ4p8NeWlVzvJ+9nbFmisEVj2Y5zjWelcfQA+zi5YIu32FchpWcIxhxY4eTjRBPlLvezCXt
	KMJMX69jGsqTE1vAPuSyIfcv82TieZJqF8Wlfq/Si6GQ9oxW6J7OlW/PRdEzLoMxGIjTeKzIASJ2r
	z9Wxjh/3c8J8HsEcnorbMCWO+y1+HObIF499ZZZGAs2xdbO9vqQ97NehHGrESuQO4dBdY76KovNvu
	KsMQ8j4QFT7YwTv7Sbg6m4oycpeEQjI6hmLpkvwsSfc2/FC/iPFKAnQHA1XIBn8Xilx+vhpZypW/3
	0KOgKmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeve-0000000GAh2-2OHg;
	Fri, 20 Jun 2025 16:49:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeIl-0000000G5wW-3V6i;
	Fri, 20 Jun 2025 16:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750435740; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PRHhROmhmYIWX9VQQTxybnvoc6qtwZl5IIv2lrQyU98SI8PSQRx3OjmL+nHgHnNS8rTURwoaRXTh+vxHmIaDy8fRSwylDuLVuZVs4LIdelQ3u6q54VthaJuNQHNYjtLjqC07mL8d50No7OH95WaHgWlaHrET0wFhPLDDJ6twZ6U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750435740; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SexsvDtdFHy59LCXhZgboYD+J7kOX3/xH1GfCS5qJ70=; 
	b=h9oyyW/ShfW+J2W6xs46kQAwkHnoOUIwW2XBIBgUnCkQKyn7Sr2HJ54u+P+67V7+3KbxMSkO0xw87YpZdv3W2OF9waXajHC6XjmMMn9hADzgWWRHNwFF80fTWa5S7JPjpX68Pc09rHS2Ac7BpWLVefhp+6GPDiFYr9DcGRwX324=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750435740;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=SexsvDtdFHy59LCXhZgboYD+J7kOX3/xH1GfCS5qJ70=;
	b=NI6Skgtfq0cL37ispMMDCYE5YRle5rAWCFeZ+7d0YB8+csnfhvzI2pmpKzi7NAd5
	+oJpfITXVKuhQYJ0oqbIKmMPAJIzaccGQzqlylF2Aghsy29G8FgFRrzb1iMS5kOlCOL
	ErgAgrQqu4yrkemovl4e/k3+8bIlb0kfLjXCP0LU=
Received: by mx.zohomail.com with SMTPS id 1750435737953532.631082223741;
	Fri, 20 Jun 2025 09:08:57 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] RK3588 rockchip-dfi enhancements
Date: Fri, 20 Jun 2025 18:08:53 +0200
Message-ID: <2422670.VLH7GnMWUR@workhorse>
In-Reply-To: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_090915_946151_C7C8A307 
X-CRM114-Status: GOOD (  19.33  )
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

On Friday, 30 May 2025 15:38:07 Central European Summer Time Nicolas Frattaroli wrote:
> This series consists of two related patches. The first fixes the memory
> cycle counter on RK3588, which read half of what it should've been
> reading. You can easily verify this with
> 
>   perf stat -a -e rockchip_ddr/cycles/ sleep 1
> 
> and then dividing the result by the number of Hertz the ddr init settles
> on, which for LPDDR4X on RK3588 appears to be 2112MHz.
> 
> The second adds support for measuring memory bandwidth with LPDDR5
> memory. Results have been validated by comparing its reported bandwidth
> with that reported by stress-ng --stream 8 --timeout 15, which line up
> almost perfectly.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Nicolas Frattaroli (2):
>       PM / devfreq: rockchip-dfi: double count on RK3588
>       PM / devfreq: rockchip-dfi: add support for LPDDR5
> 
>  drivers/devfreq/event/rockchip-dfi.c | 91 ++++++++++++++++++++++++++++--------
>  include/soc/rockchip/rk3588_grf.h    |  8 +++-
>  include/soc/rockchip/rockchip_grf.h  |  1 +
>  3 files changed, 79 insertions(+), 21 deletions(-)
> ---
> base-commit: ba2b2250bbaf005016ba85e345add6e19116a1ea
> change-id: 20250530-rk3588-dfi-improvements-f646424715d2
> 
> Best regards,
> 

I see someone has merged patch 1 into -next without leaving a message,
but patch 2 was not picked.

Could this mysterious patron saint of PM / devfreq make themselves
heard and let me know whether they would like to see a second revision
of patch 2, and if so, what said revision should address?

I am asking specifically as I would like to continue working on the
driver in a follow-up series, and BYEWORD_UPDATE already complicates
the situation by being another in-flight patch.

Kind regards,
Nicolas Frattaroli



