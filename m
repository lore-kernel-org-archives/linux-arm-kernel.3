Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD27CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Egv4q97ghG6oqT2h8uxYWEJx97iLxhYm/0+T/pO2i4=; b=wh/2lHp7xg8iJAHOyxHeVmB/qo
	Kx8zRKZPisPFhWhe/+DBGdpvgXpwa4XnQ3pUoV7XG5m+7bMyJt+5+gkrKQ+Hy0m5q8KElyKw2F4oR
	i3ahaIT3W9Cyu2KehNtxbfQ92IuTGS5KvMxHAraaPS+5Khcg7HNmERVnU0QXJk/GGI++B4yOhU3s0
	1W/X/ArJmEG0vcBZSvlm8/uyzCdhggrjjgDuMCy/L689WdS/ufOL7MXjk8r/2O1to45MY22FhtSCa
	cPsS/iDpCB0DGbh/kynpvzJSWebFMtQ4/4v18Dzy7LXFvhBYJJtxmiTR77OJn1qBAvrPhm95sTr6I
	1D0meCyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0qr-0000000Dd5p-107W;
	Sat, 03 Oct 2026 14:36:37 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0qn-0000000Dd5K-16Mn;
	Sat, 03 Oct 2026 14:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791038153; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kLHYAhye2LfTlMwX0V6q6TTBkux+wUFvoV4mXNTnSVevlJCYF5FyMMRkdeFkH0XszsbgO+qYY2nuDmDtmuWaPe/Qry8FJt2ZBs79Ypjdi3fNNl4hpSYv+BiOAYPvjEGr930y6mI6YFb29oTMGzg8MfOcXrhEuaUKicppeQkNN0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791038153; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9Egv4q97ghG6oqT2h8uxYWEJx97iLxhYm/0+T/pO2i4=; 
	b=kRHyPxPAhgGthdAaCK3cR3qk8LPjw/tJr7goGPLgT4hdbGXJLOiOJ1lqY0IdtuTXa9XDacMAmTO1f4RS03uNFPlHZxXQGT2pAIugaTweekvCg9hn+GKltqoM9snXW4m7nB8EGOvghDWut1qOUqMP68/t2wHIXMBOcPKR2QN3pmM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791038153;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:Reply-To;
	bh=9Egv4q97ghG6oqT2h8uxYWEJx97iLxhYm/0+T/pO2i4=;
	b=aVP6eu9QquEmV95y1DiK1BJcTJUnvthZ3+boRCVkxLohCUk8OTC/+kQtbqhGdwwC
	V3gRD61LqmAqz0zOpqvCC3f+OHP72cIIbFN5+2qPbvitDeoBI/XjkIeRaTIsvgm5ev7
	f6L/Rn7N7zv+L3ETm7cY0TEXFhKrt4FIczIQYM5w=
Received: by smtp.zohomail.com with SMTPS id 1791038151074231.15688188388413;
	Sat, 3 Oct 2026 07:35:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 22:35:41 +0800
Message-Id: <DLVA17A4RRG7.2ECQKV3SJDAGI@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Richard Cochran"
 <richardcochran@gmail.com>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Enzo Adriano"
 <enzo.adriano.code@gmail.com>, "Andre Przywara" <andre.przywara@arm.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Yixun Lan"
 <dlan@gentoo.org>
Subject: Re: [PATCH v5 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
 <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
In-Reply-To: <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_073633_788384_77AC9C90 
X-CRM114-Status: GOOD (  22.83  )
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

Hi Chen-Yu,

On Sat Oct 3, 2026 at 9:37 PM CST, Chen-Yu Tsai wrote:
> On Wed, Sep 30, 2026 at 1:27=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Add support for the main CCU and the PRCM module (R-CCU) found in the
>> Allwinner A733 SoC. The clock architecture is derived from the previous
>> A523 design, with the MCU_CCU removed and the clock tree extended for
>> the additional functional blocks found on the A733.
>>
>> The A733 introduces a "pll-ref" clock that normalizes the physical
>> oscillator frequency, which can be 19.2MHz, 24MHz, or 26MHz, into a
>> consistent 24MHz reference for the PLL clock tree.
>>
>> The peripheral, video, and DE PLLs provide multiple independently gated
>> outputs with programmable dividers. Model these outputs as separate
>> divider-and-gate child clocks. Also follow the documented hierarchy for
>> the derived peripheral PLL outputs. The explicitly named PLL_AUDIO1 /2
>> and /5 outputs are modeled as fixed-factor clocks, with their divider
>> fields initialized accordingly.
>>
>> Also extend the sunxi-ng SDM (Sigma-Delta Modulation) support for the
>> dual-pattern register layout used by the A733 PLLs. PLL_AUDIO0 uses the
>> dual-pattern SDM support to synthesize its fractional output.
>> PLL_AUDIO1 does not expose fractional rates, but its SDM controls are
>> modeled so that stale settings left by firmware can be disabled when an
>> integer rate is programmed.
>
> Some of the clock controls, like the PLL and AHB/APB bus dividers, are
> secure by default and need to be set to non-secure for Linux to be able
> to use them properly. And there is also a TWD clock in the PRCM that the
> user manual says is secure only.
>
> Have you given any thought to this? If we end up having to convert to
> SCMI or something to handle those clocks it's going to be a bit ugly.
>
> And presumably things work now because the secure/non-secure access bit
> isn't in effect right now because you aren't using secure boot? At least
> this was a thing in the past...
>

Thanks for pointing this out. This is indeed something I had not
considered before. I will try enabling secure boot on my spare Cubie A7Z
board and test it on actual hardware.

For the PLL and AHB/APB bus clock controls, the user manual indicates
that the relevant security bits can be set by TF-A to allow the kernel
to access these registers. This also appears to be how this has
traditionally been handled on sunxi platforms. So I think we can do the
same in TF-A for the A733.

For bus_r_twd_clk, I will test whether the register is indeed always
secure. If it is, I think the clock can be removed from the kernel and
left enabled by its hardware reset value or by the boot firmware.

>
> Thanks
> ChenYu
>

--=20
Best regards,
Junhui Liu


