Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1CDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hgy5JuPjVy1Ktg+h6y7pjxgeVZYeInv5W4e6HXGjOvk=; b=cckSRpXr5k3aki0x7zkHtOpjR2
	DgqvEo4UJLq5E803jmv0ylTj+T4sUXxoicqaGuYozXEIIfslQM7NNaOSqsHjtZXd3Nwij1PSiUf/0
	eCXmuArcV/v/Jj0HzgEUajm1NuwYRYGyBW20ZoxJG4S9mUXs2/+hs0f+ijoEQoFqn6L9f9sa3Oud8
	cG1kuOvEqKqDQu6Def03PbnBvqw4lEFtxBLg7tCSoTQ9+ISbJWgkCh8hM+A8wDlG7d04jqhD0O2U1
	ptFCnCivIXsdss6GcQKrKwackNXhHpY8Rj/T9/PNGBOEJyvs3wSvAgrW7qudbg2fomejKky10egw2
	LtkhR9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urNCJ-0000000Gp5S-03qv;
	Wed, 27 Aug 2025 20:56:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMpD-0000000GmSW-1R04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 20:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756326775; x=1787862775;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y9997n1KrMbMeAMj+IWy2kERVmk6DJGRSqufvzXc1uY=;
  b=GgPhCbla2GccWEXy7WUaPpRNB0i8jmMVZIbAWomf92a8xmjy7rJHkpCa
   O3jLh4L9bwyzX4NOSlzylctQbpY8NOylJLUxmJV8vssqnO9+B5UwFZWkO
   4CPtypYd/t0/uFXidtafs2lu2CnlGkAmNFc5FTq2uuqsoqYNm+RfVwXIE
   Jy341Qpqd79ixzUTCyvekeyIcApWV3bug4NW/C/EYTyZt78d4VH99pMKk
   y+GeuFsI2L7Z/bUigpl77yXHSXUv0AFXxRCb9aKwxRO0Z/9jYaApYTDby
   UzPlrJZ3/qjd0tjeM51Q+V3hgAWw18GVSGVYLDkT2kfdy0RBs/B6LL2iu
   Q==;
X-CSE-ConnectionGUID: DtXPaCWgQLGobwENlPj6ng==
X-CSE-MsgGUID: a2obzWYWSJm3Ob0XwFZKDQ==
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="51382651"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Aug 2025 13:32:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 27 Aug 2025 13:31:41 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 27 Aug 2025 13:31:41 -0700
Message-ID: <af762c93-c9d0-485e-a0d1-7792e6e37c09@microchip.com>
Date: Wed, 27 Aug 2025 13:31:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/32] clk: at91: add support for parent_data and
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_133255_611422_836408FF 
X-CRM114-Status: GOOD (  20.10  )
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

On 7/10/25 13:06, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This series adds support for parent data and parent _hw on the at91
> clock drivers. This also updates all the SoC specific clock drivers to
> use this format as well.
> 
> This is a continuation of the V1 of this series here [1].
> 
> This has been tested on the SAMA5* SoCs, the sam9x* SoCs, and the SAMA7*
> SoCs.
> 
> Changes v1 -> V2:
> - Remove all the small sama7g54 SoC driver changes and put them in their
>   own patch.
> - Add the SAMA7D65 and the SAM9X75 to this update.
> - Add a patch to move all common used macros into the pmc.h file.
> - Update changes from v6.6 to v6.16.
> - Remove patches that where style fixes and include those in the update.
> 
> Changes v2 -> v3:
> - Adjust each patch so they are fully atomic.
> - Add a patch to have the SAMA7D65 systemclocks use parent_data and
>   parent_hw.
> - Add a formatting cleanup patch for the SAM9X75.
> - Adjust commit messages that no longer show invalid information.
> 
> 
> 1) https://lore.kernel.org/all/20230727053156.13587-1-claudiu.beznea@tuxon.dev/
Hello,

Just Bumping this thread.

Ryan
> 
> 
> Claudiu Beznea (28):
>   clk: at91: pmc: add macros for clk_parent_data
>   clk: at91: clk-sam9x60-pll: use clk_parent_data
>   clk: at91: clk-peripheral: switch to clk_parent_data
>   clk: at91: clk-main: switch to clk parent data
>   clk: at91: clk-utmi: use clk_parent_data
>   clk: at91: clk-master: use clk_parent_data
>   clk: at91: clk-programmable: use clk_parent_data
>   clk: at91: clk-generated: use clk_parent_data
>   clk: at91: clk-usb: add support for clk_parent_data
>   clk: at91: clk-system: use clk_parent_data
>   clk: at91: clk-pll: add support for parent_hw
>   clk: at91: clk-audio-pll: add support for parent_hw
>   clk: at91: clk-plldiv: add support for parent_hw
>   clk: at91: clk-h32mx: add support for parent_hw
>   clk: at91: clk-i2s-mux: add support for parent_hw
>   clk: at91: clk-smd: add support for clk_parent_data
>   clk: at91: clk-slow: add support for parent_hw
>   clk: at91: dt-compat: switch to parent_hw and parent_data
>   clk: at91: sam9x60: switch to parent_hw and parent_data
>   clk: at91: sama5d2: switch to parent_hw and parent_data
>   clk: at91: sama5d3: switch to parent_hw and parent_data
>   clk: at91: sama5d4: switch to parent_hw and parent_data
>   clk: at91: at91sam9x5: switch to parent_hw and parent_data
>   clk: at91: at91rm9200: switch to parent_hw and parent_data
>   clk: at91: at91sam9260: switch to parent_hw and parent_data
>   clk: at91: at91sam9g45: switch to parent_hw and parent_data
>   clk: at91: at91sam9n12: switch to parent_hw and parent_data
>   clk: at91: at91sam9rl: switch to clk_parent_data
> 
> Ryan Wanner (4):
>   clk: at91: pmc: Move macro to header file
>   clk: at91: sam9x75: switch to parent_hw and parent_data
>   clk: at91: sama7d65: switch to parent_hw and parent_data
>   clk: at91: sam9x7: Clean up formatting
> 
>  drivers/clk/at91/at91rm9200.c       |  95 ++++----
>  drivers/clk/at91/at91sam9260.c      | 136 ++++++------
>  drivers/clk/at91/at91sam9g45.c      |  89 ++++----
>  drivers/clk/at91/at91sam9n12.c      | 106 ++++-----
>  drivers/clk/at91/at91sam9rl.c       |  63 +++---
>  drivers/clk/at91/at91sam9x5.c       | 125 ++++++-----
>  drivers/clk/at91/clk-audio-pll.c    |  28 ++-
>  drivers/clk/at91/clk-generated.c    |   8 +-
>  drivers/clk/at91/clk-h32mx.c        |  11 +-
>  drivers/clk/at91/clk-i2s-mux.c      |   6 +-
>  drivers/clk/at91/clk-main.c         |  16 +-
>  drivers/clk/at91/clk-master.c       |  24 +-
>  drivers/clk/at91/clk-peripheral.c   |  16 +-
>  drivers/clk/at91/clk-pll.c          |   9 +-
>  drivers/clk/at91/clk-plldiv.c       |  11 +-
>  drivers/clk/at91/clk-programmable.c |   8 +-
>  drivers/clk/at91/clk-sam9x60-pll.c  |  14 +-
>  drivers/clk/at91/clk-slow.c         |   8 +-
>  drivers/clk/at91/clk-smd.c          |  10 +-
>  drivers/clk/at91/clk-system.c       |   8 +-
>  drivers/clk/at91/clk-usb.c          |  41 ++--
>  drivers/clk/at91/clk-utmi.c         |  16 +-
>  drivers/clk/at91/dt-compat.c        |  80 +++++--
>  drivers/clk/at91/pmc.h              |  66 +++---
>  drivers/clk/at91/sam9x60.c          | 117 +++++-----
>  drivers/clk/at91/sam9x7.c           | 328 ++++++++++++++++------------
>  drivers/clk/at91/sama5d2.c          | 168 +++++++-------
>  drivers/clk/at91/sama5d3.c          | 122 ++++++-----
>  drivers/clk/at91/sama5d4.c          | 129 +++++------
>  drivers/clk/at91/sama7d65.c         | 156 ++++++-------
>  drivers/clk/at91/sama7g5.c          | 111 +++++-----
>  31 files changed, 1134 insertions(+), 991 deletions(-)
> 


