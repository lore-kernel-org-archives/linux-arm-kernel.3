Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE23C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swmBPPZvqw9puwvINxYD0gIoPNZ6bGflNoR4ejQ954Q=; b=Z//DsrShQBqXX5dZlK8FCJP0qK
	XqV765O0V9UkgrvgfMvu3M2AtYD4KogS01Hne32YnQPRquCbBuVammHdu6EkVlIOwj5s6vrGpKb1a
	KodtKTOgJ3S9NDPK9UOdcQExuSygITx7dk6Q9OWw0GB7O7+Ngma49IKsZmH9iUpMUkYxcnAuA1T1E
	SWgj4QeBJaJESXfqaxjo+1j3Fe/NYGIa9KgZ6CL9oigcjqyIninB58FJpprESXQyuY/d1OAIDF0iH
	QP9+CT9/OGrBW0/sTXkJfMNf0gVxtQ3p0/61USKRMa4JZw0E4OA/51pNU+38+sASsbvDW9PXDjSK4
	yAaeFibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkNe-00000004Itf-43Xz;
	Wed, 05 Feb 2025 18:44:10 +0000
Received: from mail.bugwerft.de ([2a03:6000:1011::59])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkCR-00000004HAg-3DR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:32:37 +0000
Received: from [192.168.100.34] (p4ff24055.dip0.t-ipconnect.de [79.242.64.85])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 39D57281C3B;
	Wed, 05 Feb 2025 18:32:31 +0000 (UTC)
Message-ID: <adbfeb77-592c-4b14-9a0c-1e63bf9affad@zonque.org>
Date: Wed, 5 Feb 2025 19:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] pwm: pxa: Use #pwm-cells = <3>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Duje_Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>
Cc: =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Daniel Mack <daniel@zonque.org>
In-Reply-To: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_103235_941620_F18F44E0 
X-CRM114-Status: GOOD (  18.55  )
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


On 05.02.25 18:53, Uwe Kleine-König wrote:
> Hello,
> 
> this series' goal is to soften the special device-tree binding of
> marvel,pxa-pwm devices. This is the only binding that doesn't pass the
> line index as first parameter.
> 
> Here the #pwm-cells value is bumped from 1 to 3, keeping compatibility
> with the old binding.
> 
> The motivation for this was that Hervé sent a patch introducing pwm
> nexus nodes which don't work nicely with the marvel,pxa-pwm
> particularities.
> 
> For merging this series (assuming device-tree and pxa maintainers agree)
> I guess keeping the patches together makes sense because with the 2nd
> patch applied but without the 3rd there are a few dt-checker warnings.
> 
> So I suggest to take it via my pwm tree as I guess drivers/pwm/core.c
> has more potential for a conflict than arch/arm/boot/dts/intel/pxa.
> So please send Acks and tell me if you would need an immutable branch
> for pulling into the PXA tree.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>    pwm: Add upgrade path to #pwm-cells = <3> for users of
>      of_pwm_single_xlate()
>    dt-bindings: pwm: marvell,pxa-pwm: Update to use #pwm-cells = <3>
>    ARM: dts: pxa: Use #pwm-cells = <3> for marvell,pxa-pwm devices

For all patches in the series:

Reviewed-by: Daniel Mack <daniel@zonque.org>

> 
>   .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml |  3 +--
>   arch/arm/boot/dts/intel/pxa/pxa25x.dtsi          |  4 ++--
>   arch/arm/boot/dts/intel/pxa/pxa27x.dtsi          |  8 ++++----
>   .../dts/intel/pxa/pxa300-raumfeld-controller.dts |  2 +-
>   arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi          |  8 ++++----
>   drivers/pwm/core.c                               | 16 ++++++++++++++++
>   6 files changed, 28 insertions(+), 13 deletions(-)
> 
> 
> base-commit: c98e66144b7d07ee9a3ca8241123b628a8ac0288


