Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFCEC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4Mw1ewD/jb3yXkm243uxaRWKqoUXL01sdFnsTQHgvY=; b=fvA/le8Pj2UHs/QwsBKCTmRIGu
	6Qs0x/iZEj6HGjNYY4wD+UTyuJ5T6AWdGrJf0nfsstv+qUkaD6b7ZN1MkHMj+tql5JpSuW3KltTfC
	EhNBfVLfdHW4EfBbJo1+FvodQ2egmTyHn6KLLwGwx5oWHo0QGfTM1v9Km/dSBwBhtG31eXgKkuUWZ
	k1ATqz9+8v+TJ8D1e6CaqodEV/Ef0CAoW+1Jp9T/R1iVu+0lhtZV+sYhvShtjo7xpYz9lBHPiRXJ6
	1zMEYo59KhEqrKBCc664rGf4as2uD4y/z/jQUIm4X6hx24DV2IjTxI37Dk3SdeItWcbfiy9Z+Qa0q
	xPpb1/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesLW-00000001KPG-3vf0;
	Wed, 01 Jul 2026 10:39:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesLU-00000001KOj-3QU3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:39:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91C4643F94
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B751F0155E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782902348;
	bh=q4Mw1ewD/jb3yXkm243uxaRWKqoUXL01sdFnsTQHgvY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CvmIMQlpDPun8oKUF6snfTgD5R960tQ39+Ad7gri+Glzo8M3xcUmIR/X/ChVXo/NM
	 LoBkt8GTKKxOJnKW8icgGzjR+KTlrxKeiu1OZOpzSQ9BahiOOvwcXZ6Uz2w8/KYIqt
	 5VJj7HSvLi0ub+uEPGKsvoJQROh/cFbWhe+FazUqVutSc5DVw944YTwxbbd7aZB3z4
	 2JWwgkQM538t/UZSdLP8CHDFRFmJw/hlH1T3TwFf1xJSvK8HsTtarZ2Y0umGA0QNZc
	 v4REPnfaTuzUCQABmQV4nHd2lj6bZ8npdl9tiDVtlygmu9uuzv8Jy9bVpHCYrzBRSQ
	 +5m7bRYHZ8lOA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso501500e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:39:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqsKQz0f3pf8tHjSEx1HgSvwP9jOZO41TIz6CvNCKVDGMKl1dYX5HEPX4eT6rCcsUm5E0EqYze6t4HU1H29mH6f@lists.infradead.org
X-Gm-Message-State: AOJu0YxfJboFVW64y213xDG9SK7RvPQ/Gu+YV0Y9VpCwr0lkmvg6qMo5
	L5G36BYdIpzd+Ro7kzBRO5I144h8sC82OF6yqElL/YjcVonLuwr99wVBCWNqDUjOmTcL8xNkViE
	b8a01XXySe874rZlmOKBr3HQvsXBleig/KCDZylB/CQ==
X-Received: by 2002:ac2:568a:0:b0:5ae:9fb4:6740 with SMTP id
 2adb3069b0e04-5aec742dcbemr246886e87.46.1782902347033; Wed, 01 Jul 2026
 03:39:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 05:39:04 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 05:39:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MfgAB8bc6PD-6jw_KR0uNBfH+PO2XtCeL1SUF2nCiT0xg@mail.gmail.com>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfgAB8bc6PD-6jw_KR0uNBfH+PO2XtCeL1SUF2nCiT0xg@mail.gmail.com>
Date: Wed, 1 Jul 2026 05:39:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfA3OuuUUb063hAaN-0Byt=ToEf+uLtcR2DoqED6dZ+Nw@mail.gmail.com>
X-Gm-Features: AVVi8CdM4YB1YNAKK21RhumfGngKAr8KUFWynreeOPd7b_5_r_J6FsxJ2sTmC58
Message-ID: <CAMRc=MfA3OuuUUb063hAaN-0Byt=ToEf+uLtcR2DoqED6dZ+Nw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bjorn Andersson <andersson@kernel.org>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
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

On Tue, 30 Jun 2026 15:44:16 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>>> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>>> > driver instead of the MAC driver where it was previously. Instead of cramming
>>> > both HLOS and firmware handling into the same driver, I figured it makes more
>>> > sense to have a dedicated, cleaner driver as the two share very little code (if
>>> > any).
>>>
>>> I think you are mixing up DT bindings and driver implementation?
>>
>> Should the bindings change if we have different driver and firmware
>> implementations? Isn't binding supposed to be agnostic of
>> implementations..?
>>
>
> The way sa8255p implements SCMI is with SMC exclusively but - since even base
> support is not yet upstream -  maybe it would be possible to expose SCMI clocks
> like some platforms do and reuse the same binding.
>
> Would it make sense?
>
> Bart
>

Scratch that. The firmware on sa8255p does not expose SCMI clock protocol, we
can only use devfs with this PHY so it's either the same binding document with
different properties depending on compatible or two separate bindings. I prefer
the latter because it's cleaner.

Bartosz

