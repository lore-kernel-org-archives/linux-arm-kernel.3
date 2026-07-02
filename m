Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECZSUW9hSj34SFz4G8bfbFkApIByTwPPDgQgHBlg2lY=; b=o9kr+7t5Ddrb7rf3MCu9F0dzQ9
	9OG/4Y9acFe3IqKMqnVuFOt4zUb/OQ6qpkoJ0xakzqDQayCB5h/1JnOf4csGz53ucuB7LfA/mN+gp
	ZxZKcLNJyqeM7HjYSzOhlDJNaO/UbO3gYRhj1PjjhV3xZOcX7NJxJ3QUvjqoXbSl/kYqMC+3MOWZh
	+zlcjaOMcbyPBpLyjY6KKVINMxLkeG8cGRh55gKkRKVXiEuJs3cZlBv07vM/MiHz9q1bjUEreZ5Jm
	X0AgfcbMZvibJGWN6Tx6mx3niLjW+YP8MkH4ufeqeyRnCz6PYwI5pADU/nxBZ57YfOvgknT0wdOV2
	WxhW900A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDye-000000045Ag-3PpR;
	Thu, 02 Jul 2026 09:45:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDyd-0000000459m-23wv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:44:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3D8060125
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 09:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425F31F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985498;
	bh=ECZSUW9hSj34SFz4G8bfbFkApIByTwPPDgQgHBlg2lY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CM1pHfbLgxMYkSotRohphHAwfHiS2Jq6WgdNtLNVx9uS9WhtbtNpBou5sFbv3Zfbs
	 t4EYEkBRrQ2RPOdC3sKXIYU/bXdz1i/2PmuYsFxoCMwyYQGcvrEq342mZyLtAsgOpG
	 w/sfT7k5FjdRPizXj5j9sXzzoLSxaH4bXp0ZuISOJV1Aj9GCea4PDHBExCwb2cLFYk
	 vD2m1iI2wTjiyqshwUVGQuj011ZBWZgfKMQS8l8tVqa50gCgevokuKhUvpXzlG1EZ+
	 4tnuwDISjYXV/puQzCG1Qd5pr3KEdBJbwvMtN8gpQX6Ik/85EwSf3YqBWFGGYzSx4P
	 2QjvHhzDq8Dhw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b293079d1so15739521fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:44:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDI7eCMtD6DfGMf95VC+uG7ou6h194zRY/PLl4uLE7VemD0MmdXV5S2VYIYUzO2tCgcoTGAzo7q4hYIQJSm4dU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz32wWhcEWFHWZmWDW9GwWnSw67UyRQ6Mx1H5zRPzfDZMZo8lnF
	ImrZS+OqIwCtRXZ68W2pgTV8Ovfdn3DaCdX6upk8vhbN46tdb1xgqOW+P+G3ulhX/CbN6OkZwvr
	GH3KEUmbo7CFFQZwDGGf2U5eF4FY0pNb3CVBMQuwltA==
X-Received: by 2002:a05:651c:2129:b0:39b:128e:ae5d with SMTP id
 38308e7fff4ca-39b36e539cdmr10506381fa.9.1782985496830; Thu, 02 Jul 2026
 02:44:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:44:55 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:44:55 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
 <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Date: Thu, 2 Jul 2026 04:44:55 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfwB_51OLjX_19eagZ1m3UUM2iHny5rx6besR6+Np_A0g@mail.gmail.com>
X-Gm-Features: AVVi8Cfm4QcPsY-kBu80DyHJVbYDW8Jkdy81l2_sPTIAALqyBLBgGUF_GjAGTTs
Message-ID: <CAMRc=MfwB_51OLjX_19eagZ1m3UUM2iHny5rx6besR6+Np_A0g@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 2 Jul 2026 11:16:22 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>> >> > driver instead of the MAC driver where it was previously. Instead of cramming
>> >> > both HLOS and firmware handling into the same driver, I figured it makes more
>> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
>> >> > any).
>> >>
>> >> I think you are mixing up DT bindings and driver implementation?
>> >
>> > Should the bindings change if we have different driver and firmware
>> > implementations? Isn't binding supposed to be agnostic of
>> > implementations..?
>>
>> I've thought about it some more and I believe this question is philosophical in
>> nature.
>>
>> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
>> the same Lemans Ride board and it becomes one or the other. Yet they are not
>> described by the same DTS and the bindings differ as well. I don't see why we
>> wouldn't allow the same approach for the this PHY.
>>
>> We treat it as different HW variant when it's managed by firmware - just like
>> we do with the rest of the SoC.
>
> DT describes hardware, not software policy.
>

I'll defer to DT maintainers then for that particular case because it affects
more than just this platform. For instance: Qualcomm Nord[1] is already being
upstreamed with a similar split into common parts and then sources specific to
the SCMI and non-SCMI variants - even though it's the same SoC.

Bartosz

[1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

