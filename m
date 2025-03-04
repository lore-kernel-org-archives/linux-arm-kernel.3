Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8735C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx3ABjWk1ldP5FCol6X6uLC9GxswBZMZjKTR2QA7emY=; b=ym1kM14kKxwQcsHz2KLPcllk1n
	a3uLg7sFO0IqCwB06l3nMdtMvP7MuNXazJf00YT6EIxwXIi70fOfSRv6GcZ9vRGbl9hfGVlsaw7nh
	fQ855s7yWl5vzAHX1WbFoC77zQCC4clGn+raY47rxPu8OKPggWXkJK8SV5a9u9YRr+tcUaf5CFGK1
	59QfyHYp443B3jrvfINuuQwAyoH00LktIIzVTd+7oznrcj7q3BfhJ8HPPstxRVH95sqiRcb7N4IoU
	GT8ezZtINEP1/aQE+3Hl2wbx0xiXgBFkrCqy3lRgrtu09w3ufYynQKlfasjBdl1R5nmbDjwpJ+1ne
	2Gc6s5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpY7f-000000063nW-0mG5;
	Tue, 04 Mar 2025 19:40:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWzK-00000005qLk-0KyR;
	Tue, 04 Mar 2025 18:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Rx3ABjWk1ldP5FCol6X6uLC9GxswBZMZjKTR2QA7emY=; b=U1QHWCT9UD8B5CFoYhbQgwOvsF
	OOKGwJGGFZqykpEBZCeKHycT6lngMmBvJ5vbJ03Z7lsGsDBznVTQST/1zQL18qCDqAzP+ImzogFHa
	cc/tNE6MeW59JiTn9y2rR3Jcg/7psRvSLpMxfxFnRY3Eqn4q0fCNWZu2yj1WgLwl3M5rA+/SVMpTp
	1/Mbvvqf9tRei7TBZhgfDNKkCIcgtvxplRB3+lTt4PDbPTfTVu7N+MJJQq4zCgzLk7uQTLGCuk55k
	0pZVOZ7MNMvhrjPGPbIVAHQYzwSuBQ2XdsxMceuMA3JDlIh3zpkvOaI6LqcTuEgjMIheV6KgKbgg4
	OFD+MdTQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWzG-000000009vl-2ZIS;
	Tue, 04 Mar 2025 18:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rx3ABjWk1ldP5FCol6X6uLC9GxswBZMZjKTR2QA7emY=; b=NnwGEh6AY17SgydLVqzuydkcBe
	jteeXwmvTz7HIE32jeBKVj3KCJF8qYd8Izu3NvV6ORUZEGcWgIFUaA13CMp5L4My6GAaS9AH0/dof
	GU99zZRbYbpiSAVjmL79REoXvj4bW50wcp9pVtYs8Upj3tDRuuNrmz0Ab26iwZpw2+FKkUTyuiF2Q
	1HbV4v0wuXy8as4HO56T7BdhU5udPybpBKcjRj8ahSOZSLJpkR7eC8PYoh0F3oi7UoHtoJZblRDuB
	nlkwGP46Iu5mQq8pp/kFEjcG5pWhjCjuV1Q8ADcwsBEL7r6nGzIPz6TvwcrBHirL/7SIXNaTvrq6y
	B0khax1A==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpWz9-0005NR-IB; Tue, 04 Mar 2025 19:27:19 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] rockchip: Add support for leds and user button on
 Radxa E20C
Date: Tue, 04 Mar 2025 19:27:18 +0100
Message-ID: <8941439.NyiUUSuA9g@diego>
In-Reply-To: <03c34bdf-d470-4c99-bb06-0eb7496465a3@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
 <03c34bdf-d470-4c99-bb06-0eb7496465a3@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_182726_812038_C83F1CC5 
X-CRM114-Status: GOOD (  19.36  )
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

Am Dienstag, 4. M=C3=A4rz 2025, 19:13:10 MEZ schrieb Jonas Karlman:
> Hi Heiko,
>=20
> On 2025-03-04 13:02, Heiko Stuebner wrote:
> >=20
> > On Fri, 28 Feb 2025 06:40:06 +0000, Jonas Karlman wrote:
> >> The Radxa E20C has three gpio leds and one gpio button.
> >>
> >> This series adds dt-binding, driver support, DT node in SoC .dtsi and
> >> gpio-keys and gpio-leds nodes in board DT to support the leds and user
> >> button.
> >>
> >> This series builds on top of the "rockchip: Add support for maskrom
> >> button on Radxa E20C" series [1].
> >>
> >> [...]
> >=20
> > Applied, thanks!
> >=20
> > [1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
> >       commit: ac32ad07a97648eb8330b2c4cb840b0ef46903ae
> > [4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
> >       commit: a31fad19ae39ea27b5068e3b02bcbf30a905339b
> > [5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
> >       commit: 0d2312f0d3e4ce74af0977c1519a07dfc71a82ac
> >=20
> > Patches 6+7 depend on the parallel saradc support series and thus
> > do not apply - and need too much rework to safely apply.
>=20
> Do you want me to rebase/reorder and send an updated version with
> remaining patches? Look like the iio saradc patches [2] is pending apply
> so maybe not needed?

Not sure how long the that test run will be taking ...
and where after -rc5. But in theory things should be fine though.

So essentially up to you - and if you actually have spare minutes.

Heiko





