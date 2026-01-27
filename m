Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3417DD3409C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+eQpvZcIHMJ+DM5l/PWrPzpT4wb2zMZwzxhd7OXn4M=; b=4+9hdR1QOFd0wU
	fDQ5+B9aybdtK3TPsii9GlTatzupD/pYzRlyPq8HveIg1XwObGHc2dWIU965/KMjxB2HuIm8BTr5d
	4AQ3yJIb8TFwjgrEzG9cO/IAq85Gyf6F9W+60MOgxnTBobrT9ZRTPU/u+YWcD4oeKRaiKZtayQFtp
	9YWGitl9qBXZnKQzf2XI6WgabgNbKdU1cy8HhIT8Ed0DT2APDCrSwTBykQAYTt4ZeRa0kanTaioX8
	BWA2R4wwojGynwYyXTEwNGE3GA1C44bYUXh6xXOv2ByeCm7S7hGrtQGvbFYo+HzQVMO9BwI+WApEH
	SvyXMBWXcskaM21o28Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcd-0000000Ec0r-0LM3;
	Tue, 27 Jan 2026 16:08:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklca-0000000Ebyr-2tUm;
	Tue, 27 Jan 2026 16:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=/T2aZbWQYbxx98eibpJB5+OY5gsOeKfgeJT1TgQzpek=;
	h=From:Subject:Date:To:Cc:From;
	b=UKgTf2Twc2fnwyI/icMXZcMnylUOmuNu1vNOiXeFXyDf/c3UQXtUO/913C9wzd9NA
	 hBL3REXTAFoxOab1Bvp58iTmRtejVL4WxWD0rGBAn0Ui3Ivs/V/PMM7w0WKB/EO3/i
	 9NpiqhKApGX6T8odQo1BXW5muOSK2nf8mv1x/dpSskO8M0Eo8N7OcIzQ//YwuMT8H/
	 cBf5wpkclFvb+qjjMa5jVc6nXPAWzwcECWMAb7hedwn9ghwTQzq9BEFRbC/9AA8RAs
	 H2SeozwPwuhDZqo5Sx0lpS98Tf7ch9xHutqIgHawt2o3ix2/O1oahtR4HvZWDnTkCI
	 AT72WVx+us2+Q==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C09D17E14F2;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 32A01480044; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 00/10] ASoC: rockchip: spdif: Cleanups and port features
 from Rockchip's BSP kernel
Date: Tue, 27 Jan 2026 17:08:20 +0100
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPTieGkC/x2NQQqDMBAAvyJ77kKMGmm/UnpIN6suLWvI0lIR/
 97gceYws4NxETa4NTsU/orJqhXaSwO0RJ0ZJVUG73xwrQ9YVnrRIhktJ5mQ3hz1kzFqwqdVuyk
 hXXvXDezH0DuopVx4kt95uT+O4w8kwA1adQAAAA==
X-Change-ID: 20260126-rockchip-spdif-cleanup-and-bsp-sync-c94035e27640
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/T2aZbWQYbxx98eibpJB5+OY5gsOeKfgeJT1TgQzpek=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xA77Bb6AfgV7b7ypFRt0LyLnZnYGdS1f
 uKYvaJHNwMGlYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qaq5IP/3id/KXkGg9KLhhF27rU4MPk19/mdz3R/A+pjTuvzU1dvkPaB0aKEGtBYxtKSTh2TJ+
 K64fpjV5m2NwNoB04K+kZ6g/qz8Aawm7oCb8KYwatXMtjkW82ilN49Erc6K/EDSxo1Tyr3xzBff
 IpeVw/e+Pu8oSUa8vmHuySCpx1nfvz8EuG7um9mAEMPWqdzXjZwE3msDCVCt0UlM9cruiXGYv0K
 BsaCyMoWUCdvFmhjjOmeskGepwE5eWwmUZ39lfqnH72kP3iC79cd5AXreYNfFnbfwkCYK69DjB5
 Y8lCIqPRnQZJpLOt4DjC3Kf8iNeHEAFsMj3quJ2Ky4c85L1IR55VF7qMpcGzDJmG9fSu+Qwo9PA
 BFDo1y5fIPpH/grZ58IcvgcH51Y0LzdewvJBG+jA7Btd5ZvwfxiwIZPky+Pq1fMURB+mYHvwrh+
 CqGj05g7M4Csyc7kOdZ0lDSnurBX98k72/M2UycWFcv3TxMhjqBFlnUvntcshhIP0B4prAFrDgZ
 Snh+36fCbQSoqBYO75W/U9eYln218UCbqA4YulSS3LOPYsmE0u2F2HDwwhqKFH1pEQp2lWWZf5z
 A+AlRZwHY9aFBsJANEdMTjzA5+3HkPOqpXUoZ9VlyRZEmrCZXf6hbnuaZlb5KqID/C3yA2lqSUG
 OEo57gxIY2juolWLuoN807w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080852_916089_F732EF0E 
X-CRM114-Status: GOOD (  11.26  )
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

I'm currently working on DisplayPort audio support for the Rockchip
RK3588/RK3576 SoCs, which preferrably use S/PDIF as DAI source.

Apparently the upstream Rockchip S/PDIF driver is lacking a couple of
features right now, which are necessary to get things going (i.e.
setting the sysclk from the machine driver). I found the missing bits
in Rockchip's 6.1 BSP kernel and ported them over. This series effectly
brings the mainline kernel on-par with the BSP driver, but also contains
a couple of cleanup patches of my own to bring the driver to the modern
age.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (5):
      ASoC: rockchip: spdif: Use device_get_match_data()
      ASoC: rockchip: spdif: Move DT compatible table
      ASoC: rockchip: spdif: Fully convert to device managed resources
      ASoC: rockchip: spdif: Use dev_err_probe
      ASoC: rockchip: spdif: Convert to FIELD_PREP

Sugar Zhang (5):
      ASoC: rockchip: spdif: Improve sample rate support
      ASoC: rockchip: spdif: Swap PCM and DAI component registration order
      ASoC: rockchip: spdif: Add support for set mclk rate
      ASoC: rockchip: spdif: Add support for format S32_LE
      ASoC: rockchip: spdif: Fill IEC958 CS info per params

 sound/soc/rockchip/Kconfig          |   1 +
 sound/soc/rockchip/rockchip_spdif.c | 224 ++++++++++++++++++++++--------------
 sound/soc/rockchip/rockchip_spdif.h |  57 +++++----
 3 files changed, 175 insertions(+), 107 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260126-rockchip-spdif-cleanup-and-bsp-sync-c94035e27640

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


