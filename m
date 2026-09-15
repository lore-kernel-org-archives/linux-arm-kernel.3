Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE1AC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYcdF374Pa9T0avVKuHqJFN69BWIvYlMq0B1D72dSGY=; b=vrp5ohGB5K9QuUlj2IRh3BdQvW
	W3pX27lztospbXvDHFJqPejqnUGNmXMHEXDqnAscZ31y4L/LXKNVLW4bGJcPkX4rN3Nb/5cQ8+jv1
	7KF4JnaZV0Sy0eJDnnhMHXhF5ubh2VTqG9hBiwRFgPoCl1ta3TFTk+KNB0C+aHxOtaiGhFFTT7HCY
	mRy/8P2wEEQpdHcu2mM1fw5UYA+hlET9Y2THBX+FWtMtFX5lWJycGdyHtxGLXX7vwEXJ37ESApOSu
	4ZcmdPPrT+3pmYDntDh9wcFSQbn5OceaZSngPNbeCDctz/CNtQjE9sgW1bzNTbSYuj1zWe3YbYTKG
	00uhxirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Os0-00000005hDC-48Tm;
	Tue, 15 Sep 2026 08:50:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ory-00000005hCc-1vjV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789462225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYcdF374Pa9T0avVKuHqJFN69BWIvYlMq0B1D72dSGY=;
	b=FjAF2v+o8f8pC29Z+bmLppVS55khpDGOuxP8y69/31kuUrFcZTX1N6ND6aJeSJx30ae8nt
	e0XYGbQEa9T6JEfJ5LfPEyuaQQLs9q0T+76fM+hHQpfcdZeAYdzYQRZ9arkSQrwhTxL1xI
	tsNrasiBvcXu+vaBAcN7QL9gnqYeqwY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-tDT_SLcZNPa0hMkH5xxaeg-1; Tue, 15 Sep 2026 04:50:23 -0400
X-MC-Unique: tDT_SLcZNPa0hMkH5xxaeg-1
X-Mimecast-MFC-AGG-ID: tDT_SLcZNPa0hMkH5xxaeg_1789462223
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486f77056cfso2307223f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462222; x=1790067022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYcdF374Pa9T0avVKuHqJFN69BWIvYlMq0B1D72dSGY=;
        b=b5Sx48vLpStv4INCIWNg2+Gsg7oODnk7XL5teKloGRKleIRMG97Gk1qualUInyb053
         yGNElZ1p0kWHkPhVSp9DwnAo7dXevNHdPKdqJKqU2qkywJKBZSx1yvuh/C2iZVDGEtjL
         O2J1WkGaZ//FTU8D6fXbtE+iGY8dbELqZvPMPFVxb7B3C+eHm2xlERUoH7sDRyWlKNOG
         bQUe5FYqy998Mlv7RKcdctMeHYFBxCWsboQXeXbb/WLKvG/NMycDxl42Aw84/gTx0AgC
         X4aQkqf41uBPKQHljqV+nsY9/7SNQsJjgJofSsNDKfKyj8GGzy9Q4cZLEk7LvN9+6xRE
         JACg==
X-Forwarded-Encrypted: i=1; AKwUvByxNO/+OcyHoa4J4i1iSdDMpTIK19IzmXTOW5GwsZA7xwTvK3PQCp0p51WiWPWY6wtF6nRUr+CFsucfU8fx7fR6@lists.infradead.org
X-Gm-Message-State: AFuF++niEs1byxL/0TFXLcLoGbuCl9Rv9z1tutemE8DldhE2DVixAwcj
	Z99BP4lY9hO9DADXpZ4ycWLgdqocb28hq0KGC2eppovAuzYAxT+NL7Yl9ZvcIwatWMTvj0udv/p
	BY6UzdwSm3top260n9GxIL5Y8wroRSQtrzSY1TmqU7R0BHlmky+bDVkkpPCo4BmPrFlb5e9fvh7
	Mv
X-Gm-Gg: AYBFou0SACrf0tjUeIlfiXcCYPBx0TQ945wZKDR5f8TazNa9U6aEYwlm/VFmg5DBHqq
	IjjkaXVt+DKams8147EqAmWDBygxx25btxyN7t0mTuP1sANe0ITfhwgj00HlttuRPPNkLT96F4C
	l9wKhzIMfZkZPo9xD/j6/4Bn7x4EJZY/HFk5Vt06cMESjvGssVKtvU5iI6QpGaKNG2feZ6gFQmA
	Y0PYwa/utCBXNRTG690woYu/uqspm6RXNgyPZW/3XKzsdHuYUMc+ncLBFqhx54n3vrAOBIfHtPh
	m+E/cEk0xR3NoM+jhNT33fBJZIv35LkmjT+mllcwjF+PT+PPIVs4aFXtYtn5D0AqtCJSl346SE9
	eb9a+52m0U19/ZYar2geRA6b75CMLzDIlfJUf7YziYl5a2bzSIBGrAfO+4lR2F5bigR+SaCw+sA
	==
X-Received: by 2002:a5d:6f1c:0:b0:487:970:ca4b with SMTP id ffacd0b85a97d-4870970cb5amr941595f8f.25.1789462222471;
        Tue, 15 Sep 2026 01:50:22 -0700 (PDT)
X-Received: by 2002:a5d:6f1c:0:b0:487:970:ca4b with SMTP id ffacd0b85a97d-4870970cb5amr941559f8f.25.1789462221970;
        Tue, 15 Sep 2026 01:50:21 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm32623392f8f.9.2026.09.15.01.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:50:21 -0700 (PDT)
Message-ID: <0d85afb2-c738-42da-aa1a-aa16e5709948@redhat.com>
Date: Tue, 15 Sep 2026 10:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 0/6] net: stmmac: More selftest-related fixes
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 David Laight <david.laight.linux@gmail.com>
References: <20260911212028.1497613-1-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260911212028.1497613-1-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WkZc-5rpXCxNumnbjbm2WjLM0ZBvfRfloQfH3bt-vBg_1789462223
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_015026_581523_B8959A0E 
X-CRM114-Status: GOOD (  26.21  )
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

On 9/11/26 11:20 PM, Maxime Chevallier wrote:
> Hi everyone,
> 
> This is V3 of stmmac selftest fixes, adding a cap on EEE test as the
> timeout can get pretty long, found by Nicolai.
> 
> This is another round of stmmac selftest fixes, mostly about the selftests
> themselves but a few things were discovered w.r.t MTU and buffer size
> handling, see patch 5.
> 
> I've continued expanding the test devices I'm running this on, more devices
> should come in the future. With this series, _almost_ everything is
> green, except for some flow control stuff that is either a false positive
> or a real thing that needs investigating.
> 
> After this is merged, I consider the selftests to be now reliable enough
> to run them nightly on every stmmac series that's sent, and I'll be requiring
> clean selftests for new glue drivers.
> 
> I've been running this on :
> 
>  - Altera CycloneV (dwmac-socfpga, dwmac1000 IP, v3.70a)
>  - NXP imx8mp (dwmac-imx, dwmac4, v5.10a)
>  - Allwinner H2S (dwmac-sun8i, dwmac1000)
>  - Amlogic S905X3 (dwmac-meson8b, dwmac1000, v3.70a)
>  - STM32mp157a (dwmac-stm32, dwmac4, v4.20a)
>  - SiFive JH7110 (dwmac-starfive, dwmac4, v5.20)
>  - Motorcomm YT8061 (PCIe, dwmac-motorcomm, dwmac4)
>  - Qualcomm IPQ8064 (dwmac-ipq806x, dwmac1000)
> 
> Tests are OK if return is 0 or -95 (-EOPNOTSUPP), tests are KO otherwise
> 
> Before the series :
> 
> Test                     imx  socfpga sun8i meson8b stm32 starV mcom ipq806x
> MAC Loopback              0     0      0     0       0     0     0    -110
> MMC Counters              0     0      -95   0       0     0     0    -110
> EEE                       -95   -95    -95   -110    -110  -95   -95  -95
> Hash Filter MC            0     0      -95   0       0     0     0    -95
> Perfect Filter UC         -95   0      0     -95     -95   -95   -95  -95
> MC Filter                 -95   0      -95   -95     -95   -95   -95  -95
> UC Filter                 -95   0      -95   -95     -95   -95   -95  -95
> Flow Control              -95   0      -110  0       -110  -95   -110 -110
> RSS                       -95   -95    -95   -95     -95   -95   -95  -95
> VLAN Filtering            -110  -95    -95   -95     -110  -110  -95  -95
> VLAN Filtering (perf)     -110  -95    -95   -95     -110  -110  -95  -95
> Double VLAN Filter        -110  -95    -95   -95     -110  -110  -95  -95
> Double VLAN Filter (perf) -110  -95    -95   -95     -110  -110  -95  -95
> Flexible RX Parser        0     -95    -95   -95     -95   -95   -95  -95
> SA Insertion (desc)       0     -95    -95   -95     0     0     0    -95
> SA Replacement (desc)     0     -95    -95   -95     0     0     0    -95
> SA Insertion (reg         0     -95    -95   -95     0     0     0    -95
> SA Replacement (reg)      0     -95    -95   -95     0     0     0    -95
> VLAN TX Insertion         -110  -95    -95   -95     -110  -110  -110 -95
> SVLAN TX Insertion        -110  -95    -95   -95     -110  -95   -110 -95
> L3 DA Filtering           0     -95    -95   -95     -95   -95   -95  -95
> L3 SA Filtering           0     -95    -95   -95     -95   -95   -95  -95
> L4 DA TCP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> L4 SA TCP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> L4 DA UDP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> L4 SA UDP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> ARP Offload               -95   -95    -95   -95     -110  -110  -110 -95
> Jumbo Frame               0     -110   -110  0       0     0     0    -110
> Multichannel Jumbo        0     -95    -95   -95     -95   -95   -95  -95
> Split Header             --95   -95    -95   -95     -95   -95   0    -95
> TBS (ETF Scheduler)      --95   -95    -95   -95     -95   -95   -95  -95
> 
> ARP offload's still there as this was a net-next patch and I've ran these
> checks on the net tree.
> 
> Jumbo frame tests on dwmac1000 started failing after :
> 
> commit 23680bf5f8c6 ("net: stmmac: restore NET_IP_ALIGN in the RX DMA offset")
> 
> This commit is OK though, it just made the selftest reveal the cracks
> hiding beneath the surface of MTU/bufsz handling.
> 
> After this series :
> 
> Test                     imx  socfpga sun8i meson8b stm32 starV mcom ipq806x
> MAC Loopback              0      0     0       0     0     0     0    0
> MMC Counters              0      0     -95     0     0     0     0    0
> EEE                       -95    -95   -95     0     0     -95   -95  -95
> Hash Filter MC            0      0     -95     0     0     0     0    -95
> Perfect Filter UC         -95    0     0       -95   -95   -95   -95  -95
> MC Filter                 -95    0     -95     -95   -95   -95   -95  -95
> UC Filter                 -95    0     -95     -95   -95   -95   -95  -95
> Flow Control              -95    0     -110    0     -110  -95   -110 -110
> RSS                       -95    -95   -95     -95   -95   -95   -95  -95
> VLAN Filtering            0      -95   -95     -95   0     0     -95  -95
> VLAN Filtering (perf)     0      -95   -95     -95   0     0     -95  -95
> Double VLAN Filter        0      -95   -95     -95   0     0     -95  -95
> Double VLAN Filter (perf) 0      -95   -95     -95   0     0     -95  -95
> Flexible RX Parser        0      -95   -95     -95   -95   -95   -95  -95
> SA Insertion (desc)       0      -95   -95     -95   0     0     0    -95
> SA Replacement (desc)     0      -95   -95     -95   0     0     0    -95
> SA Insertion (reg         0      -95   -95     -95   0     0     0    -95
> SA Replacement (reg)      0      -95   -95     -95   0     0     0    -95
> VLAN TX Insertion         0      -95   -95     -95   0     0     0    -95
> SVLAN TX Insertion        -95    -95   -95     -95   -95   -95   -95  -95
> L3 DA Filtering           0      -95   -95     -95   -95   -95   -95  -95
> L3 SA Filtering           0      -95   -95     -95   -95   -95   -95  -95
> L4 DA TCP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> L4 SA TCP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> L4 DA UDP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> L4 SA UDP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> ARP Offload               -95    -95   -95     -95   -110  -110  -110 -95
> Jumbo Frame               0      0     0       0     0     0     0    0
> Multichannel Jumbo        0      -95   -95     -95   -95   -95   -95  -95
> Split Header              -95    -95   -95     -95   -95   -95   0    -95
> TBS (ETF Scheduler)       -95    -95   -95     -95   -95   -95   -95  -95
> 
> ARP can be ignored, and Flow control needs some more attention, but
> we're getting there :)
> 
> Thanks,
> 
> Maxime
> 
> V3:
>  - Bail out of the EEE test if LPI is over 5 seconds
> 
> V2:
> https://lore.kernel.org/r/20260910151404.976753-1-maxime.chevallier@bootlin.com
>  - Snapshot before sending the frame for EEE, in case we immediately
>    enter LPI
>  - Also return -ETIMEDOUT instead of EINVAL
> 
> V1: https://lore.kernel.org/lkml/20260909074740.1247762-1-maxime.chevallier@bootlin.com/
> 
> Maxime Chevallier (6):
>   net: stmmac: selftests: Support running selftests on DSA conduits
>   net: stmmac: selftests: Validate EEE based on the actual LPI timer
>     value
>   net: stmmac: selftests: Check the dev->features for S-TAG offload
>     testing
>   net: stmmac: selftests: Capture all packets for vlan checks
>   net: stmmac: size the RX buffers from the frame length, not the MTU
>   net: stmmac: selftests: Account for alignment shift on dwmac1000 for
>     Jumbo test
> 
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  20 +--
>  .../stmicro/stmmac/stmmac_selftests.c         | 121 +++++++++++++++---
>  2 files changed, 114 insertions(+), 27 deletions(-)

It looks like that the possible ETIMEDOUT reported on patch 4/6 is
contradicted by your testing, but the other not pre-existing 'high prio'
findings from clashiko look actionable to me.

/P


