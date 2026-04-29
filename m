Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F27FF8877
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bpnoez2NGQmvCzUSolqwnCKtIwauKm5spi5xIDs11As=; b=DyqWYUGmXiItYW
	X8IeD2kG9J18DK4rPT9Vs6N6QBFr0kXx2qV/TNXUr+4dFXRP4lriBv5GckgAheIxagBGX/h2h0y1S
	9Eu/KxeaW+LWWL3BiDuJnCsvA20wg+tdR+bmf0F8b0vDUfXat+PvuFkPL0R2+83rJhUzvzWFEhB10
	s/EpOW8gBwn4TXtoYicCDVcITvYh4gnNEF6v5fAoRDdB7PEqNRSrEQrc3U6IrCzEhlCmXMXT9Jylh
	uUMYhw7lDJuNosppSYPYB8DsxJEkvDhqVjYLRocC4VmHc8FinfF7QtTNgzoiaIMBV93zmRStRKFT5
	WSBRTuGVQX++SMn7tZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Ti-00000003Mjf-2mho;
	Wed, 29 Apr 2026 09:45:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tf-00000003MiJ-2Rzd;
	Wed, 29 Apr 2026 09:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455904;
	bh=lq7N+2TMLsd9INSTBHiMUUyVQJXO3AKC2EQZHsgXO4Q=;
	h=From:Subject:Date:To:Cc:From;
	b=OjJHnibvt90JzFz9DoM6y7imNJLIYUNK0ExTlH1LfxLIX/tjy9/3jJ009JpuWruoF
	 vzJ18QZSfEO94XppPh6W3IdssYhzPO/ZYL/wCjXnBO12ceNF97wREOJ6YzJgsIDKXT
	 18ZVh3Wbo1uzpXb3+v+m5TWkdQ9xeKwZf0V1B48mFCGh163kcZMm1t2mORVezE5okd
	 vb6gTzpa/Nq+nWiIalJKj8s8CjosvK/lyezTVy/SOrGcmbha3aa20znbYnBtcf+rJu
	 Yd0dOlKu1JD4OaOataB/NIgne+U9NV8vjsSyog7XczfYikpLmAXtHNwXXsRdsOfr/P
	 AOXYhWm19ddqQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04C7A17E12E5;
	Wed, 29 Apr 2026 11:45:02 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/9] MT6365 PMIC support cleanup
Date: Wed, 29 Apr 2026 11:44:13 +0200
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNQQ7CIBAAv9Ls2U2QVoL9iukBYVs3ClSgpknTv
 0tsPM4cZjbIlJgy9M0GiT6cOYYK51MD9mHCRMiuMkghleikRk+OTaEnThQ4oi+qVRe0LzJhmVF
 Z53Rn21FcNdTGnGjk9de/DQcnei91Uw4Jd5MJbfSeS98EWgv+VzDs+xcBiL26oAAAAA==
X-Change-ID: 20260428-mediatek-genio-mt6365-cleanup-6cdd84c3f098
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=2418;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=lq7N+2TMLsd9INSTBHiMUUyVQJXO3AKC2EQZHsgXO4Q=;
 b=HJi/WQP85IC64GbSSISNtK93roWE/r528Oy00lWKTLscMvosH0AUECdbPfAGGlPy3SY0FzFgw
 VK4zU5VAE5sCa1yzCNGFRUVJSJx6wU/4OwUQXavHv1nepfMc3vv2Bl1
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024507_777098_36F4BB30 
X-CRM114-Status: GOOD (  11.98  )
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

Several Mediatek and Radxa boards, based on MT8370, MT8390 or MT8395
SoC, integrate the MT6365 PMIC, that is a MT6359P variant:
 - Mediatek Genio 1200-EVK
 - Mediatek Genio 700-EVK
 - Mediatek Genio 510-EVK
 - Radxa NIO-12L
It is compatible with the MT6359 PMIC.

But both MT6365 PMIC support and compatibility were never expressed in
the dt-bindings and there is no MT6365 include file as well.
So, since these board support was introduced, their devicetrees use the
mt6359 include file to enable this PMIC support. 

The goal of this series is to clean this support by adding the missing
compatible strings for this MFD main and subdevices in the dt-bindings,
and add a include for MT6365 definitions to replace the MT6359 include
in these board devicetrees and for future ones (like Genio 520/720
EVKs).

The series is based on linux-next tree (tag: next-20260428) and has
been tested on Mediatek Genio 510, 700 and 1200-EVK boards.

---
Louis-Alexis Eyraud (9):
      dt-bindings: mfd: mediatek: mt6397: Add rtc for MT6359
      dt-bindings: mfd: mediatek: mt6397: Add MT6365 PMIC support
      dt-bindings: input: mediatek,pmic-keys: Add MT6365 support
      dt-bindings: iio: adc: mt6359: Add MT6365 PMIC AuxADC
      arm64: dts: mediatek: mt6359: use proper compatible for rtc
      arm64: dts: mediatek: add MT6365 PMIC include
      arm64: dts: mediatek: mt8390-genio-common: use MT6365 PMIC definitions
      arm64: dts: mediatek: mt8395-genio-common: use MT6365 PMIC definitions
      arm64: dts: mediatek: mt8395-radxa-nio-12l: use MT6365 PMIC definitions

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   | 17 +++++++++-----
 .../bindings/input/mediatek,pmic-keys.yaml         | 21 ++++++++++-------
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 14 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  4 ++--
 arch/arm64/boot/dts/mediatek/mt6365.dtsi           | 26 ++++++++++++++++++++++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  8 +++----
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     |  8 +++----
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  6 ++---
 8 files changed, 77 insertions(+), 27 deletions(-)
---
base-commit: 0f3ef35b0747832b58b97171bad99011d084c6b1
change-id: 20260428-mediatek-genio-mt6365-cleanup-6cdd84c3f098

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


