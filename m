Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0890FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pyeX1fCE1r0zvV9wwJ1gCpuCvVhlIzctRjDyzHOqBC0=; b=3HoTMtTLWVTpqB
	7JO/pMnLX481GTrYPlBP33VksZT5XBdAKoeZeRHWJkU41CE20N4cNjUs82xfycFmSt1Ii+VH2wkYE
	lOJTIdgWk5ozMGuYMMuX3CGUR8mfI9jhgd2nGupNapECDMbSpCtCPR67DTSTZH8Ne3o39bxtF9Tp9
	68NGvotCI6Z6fElHxBBF1kvpcV28XY5Zeeq42KEV1+wS0FGQ9gL7waa6s6G7CT9aN0470SV0YTjeA
	A6kfr2kJ+Y4jchTB6ZGIQR1zIvw4nKsmXfK2r3YPxuyR/seh3OyLhvxkLxkmb/juThT7zUoIoC0r/
	esyM6HzI+DGCFERIyPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUyu-00000009xTh-29XU;
	Tue, 18 Feb 2025 21:18:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUcC-00000009sSk-3RQM;
	Tue, 18 Feb 2025 20:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739912086;
	bh=vBUNOnqBjWLVeVhdw5eyFkY+aGATqfPN9HO6x7rP1xQ=;
	h=From:Subject:Date:To:Cc:From;
	b=Oov72omcTiL2NCLqUyV3GmRpH9qXVL5qb++fQxd+V3RpbhP0471n2V89tvSsscYL3
	 JwXtOrBPi+olWxGGKsp/A7yiWdZN0Gm5OTb1Pmp96imUQjMSQzEL9Q9ISZikWrg3Hz
	 p9sbhufnM4vN4o8rAJ6l77rF2Ma4w0uSYGG4hu7FF41BmXA50wzYzSK8ir9+UYQxF2
	 2XXLJNdJFNrqvQiN5DwO/N7AcFFbWQ1b96GAVCoZKjyj9eVMeZg030/4LnYmY4dQ9Z
	 XVigbWNBCMKABwx3jTsgUiekHp5FTit9Q4YTYdsnT57pPxuLP7AvXwdcIX/CeUptQ0
	 I3kXwAFhGMsWw==
Received: from [192.168.0.47] (unknown [177.33.139.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 809A717E154A;
	Tue, 18 Feb 2025 21:54:42 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/6] Enable DMIC for Genio 700/510 EVK
Date: Tue, 18 Feb 2025 17:52:13 -0300
Message-Id: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP3ytGcC/x3MQQqAIBBA0avIrBNGI7OuEi1CJ5tFGgoRSHdPW
 r7F/xUKZaYCs6iQ6ebCKTaoToA7thhIsm8GjXpArawMFDmNiNKf7KR3hmjyDk1voTVXpp2f/7e
 s7/sBChFmqF8AAAA=
X-Change-ID: 20250218-genio700-dmic-dc6ee9dc0638
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_125449_036902_7DD814FF 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

This series enables the dual digital microphones present on the Genio
700 and 510 EVK boards.

Patches 1 and 2 add some required clocks, patch 3 adds the DMIC DAI
driver for MT8188, patch 4 adds the DMIC routes for the MT8188 platform,
patch 5 adds the DMIC backend and widget to the mt8188-6359 machine
sound driver and patch 6 adds the audio routes for the DMIC to the
Devicetree.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (4):
      ASoC: mediatek: mt8188: Add audsys hires clocks
      ASoC: mediatek: mt8188: Add reference for dmic clocks
      ASoC: mediatek: mt8188-mt6359: Add DMIC
      arm64: dts: mediatek: mt8390-genio-common: Add routes for DMIC

parkeryang (2):
      ASoC: mediatek: mt8188: Add DMIC DAI driver
      ASoC: mediatek: mt8188: Support DMIC in AFE

 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |   6 +-
 sound/soc/mediatek/mt8188/Makefile                 |   1 +
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c         |   8 +
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h         |   8 +
 sound/soc/mediatek/mt8188/mt8188-afe-common.h      |   1 +
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |  28 +-
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c      |   4 +
 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h    |   4 +
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c        | 754 +++++++++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |  14 +
 sound/soc/mediatek/mt8188/mt8188-reg.h             |  18 +-
 11 files changed, 839 insertions(+), 7 deletions(-)
---
base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
change-id: 20250218-genio700-dmic-dc6ee9dc0638

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


