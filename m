Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DF8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3us1EYcPhA08D2V/YJ+nWiOnRiCmeZ4lZeMhncdG0g=; b=q+2cGXNU/8U/iIzJIL+ZsWGpA0
	BE8m/uasNXdqYF8U7g6WhuDU9jaj0oFTm/JZWu6wLuhTZ4RRchKpYSR3u+3oLT2TBRV6io1bpdxkF
	qRFxd5UPeXXUibpFP1QfirBg70s65KnLj6hFSmYEezKQ6M9sykU0e941MYDFwj67Q32LgPcmXFZ+w
	2SkfHf/hfU3p2NY6of/bHC6Kw5k/VrX/UW9EA+bNy7sJuA1DOWVXLUIb9Wt2nD2S/u8/H9Fr1g/kX
	kJA9z6CUfJtn444a5C7NhxsUMlgAZcTxorLWwuQwk7i1Y3kmoQI2H+U4blzy0VGIyV7/C4zyZ2brL
	anRZNZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDTZ-00000003yiT-2AL4;
	Thu, 02 Jul 2026 09:12:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDTY-00000003yhg-0QSt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:12:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B8D943C26
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 09:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F2D1F0155A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782983571;
	bh=z3us1EYcPhA08D2V/YJ+nWiOnRiCmeZ4lZeMhncdG0g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CkM0BKN24F+HnXi4WaE+4fAv5Vr7UTY8L9dUWejrdBJF/jPRDOuV//xYqUgtFJazT
	 yKqnvPZ4Z6zQClmiWicl1ZQIjIBR7wR46f+31rNYfwqn4cQYLWsye7jQCr65Leb+/4
	 zzgcGpZ2d3pKBzx7dY2dnHBNE29vOmxpqRR3npVJZTkScJEVgs6av6H8IvDPg+MH5r
	 AVEKQgo74mXWKKBqPyyavnRneQqrcsFo/8XpA4lXns6tLezgzz4pvY5TFk4LEHT+Zv
	 6K5/hLayKxOm9GehXu/SwzR0dzDugS3Gm9SE14B9ca6fEL8XWopQoPgbmTQhBCuH9a
	 780RmwAwFHpVg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b38198496so8059881fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5vqIZK9yWAHDhX3H7NMn4F1Z1erNW0gMA86GktUVA64G6KpsPyZ8NgqE3Rxb+RV/L0HiFpJx/ush6RxqYp8wl@lists.infradead.org
X-Gm-Message-State: AOJu0YzhM7O0QdM1jdaz/nmZYbNj2KSrNk+0HLMlcHhNfNhS9q3Z+DMF
	5OSisGDMpXlnuSFEK+UONMMSCCrtz3i2CjG1CO1E17vxqhW9/ZJtncL0JXcxLB+2hPb5O+hqG/j
	KWabk2mGlqAaNnlutyFujHoUYncrv8IC6G0pGds8YJg==
X-Received: by 2002:a2e:9c86:0:b0:39b:35bd:e705 with SMTP id
 38308e7fff4ca-39b35bdebfemr6340391fa.37.1782983570078; Thu, 02 Jul 2026
 02:12:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:12:46 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:12:46 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akOZFIowVvprnAMf@vaman>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com> <akOZFIowVvprnAMf@vaman>
Date: Thu, 2 Jul 2026 04:12:46 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
X-Gm-Features: AVVi8Cc0cbGsvWIHn6Ltbm1wzcUWjyqAHy25YdAMNK19MIl0j9ziewcxopNMKrw
Message-ID: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
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
	Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>> > driver instead of the MAC driver where it was previously. Instead of cramming
>> > both HLOS and firmware handling into the same driver, I figured it makes more
>> > sense to have a dedicated, cleaner driver as the two share very little code (if
>> > any).
>>
>> I think you are mixing up DT bindings and driver implementation?
>
> Should the bindings change if we have different driver and firmware
> implementations? Isn't binding supposed to be agnostic of
> implementations..?
>

I've thought about it some more and I believe this question is philosophical in
nature.

sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
the same Lemans Ride board and it becomes one or the other. Yet they are not
described by the same DTS and the bindings differ as well. I don't see why we
wouldn't allow the same approach for the this PHY.

We treat it as different HW variant when it's managed by firmware - just like
we do with the rest of the SoC.

Bart

