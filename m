Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33FFCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N/phbLYd0o/FqwOfVkOi/HM7CKYifodRDTpT06KsdKU=; b=0ePIe4Dhknsh77
	lyhdgzl3eUz6y++3G3k0VtMUVUuBXLuIIgLB9YHMdlAbwPGgo9G3WHmFzvEAic12ruBXUywUMuzfT
	eV8U2/R5290cXrD3dPpq8JM7sRM/mEOCaAXg/mMXcUeL2HMr4z9NZntj0vJ2HNUKLKS2kWLaxMp1N
	bxctzft9BdOh8jrunt90ndlTRZJCKAK+Xpp4/EyUGGDBrSuQczw7nOJiwU9APhYQU3j+X1E9aOeXr
	qq9P2xniBaLvzoy5JWoZSSC73HtRLn3Eb5LHfM19E7niCYmion1jm9dYkwQ/JSq6f676epinLQ6C8
	apNv/OSVl2T7Y+aZ/7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrBF-00000005eaL-1PGo;
	Wed, 30 Sep 2026 10:04:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrBC-00000005eYy-2xzK;
	Wed, 30 Sep 2026 10:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=Y9n9hZH+mnhTp9vnyXSbiLthx3Dq0IHUxNJU42AUj1M=;
	h=From:Subject:Date:To:Cc:From;
	b=CIXJsM0eUpbAfQdHZxnNVJLenbQNfZl8wKKcdWkP60800mvGkyO40Cvp42LmvMSAa
	 R4l2iY2aXpSxUjkh//a+XlNnZA2ZxymqEyr/JmhFq2x7w+A8BM2JLC+lgtMMxzWQv9
	 gmFrCJnOLjcziQc8B28gqjr1Upq6cOd8o0+1N5tNCfEzwDyVZauGLyg/I+O1UL2V4A
	 uGMTv3kR8qqL8RsYT9AruvgdutVuVjaMsSSUD4xDTEAulE8KVYfTuCTxwKUZdDHOQS
	 CEjYEtN8K+pZMOBleXd93Brv2m8PlE+3EsGVmxbzKWvDbDxAd2Pk10yu1HajGSYbwh
	 +Yu0rE5tAbRIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EEEB17E0C41;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0D05848002B; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v16 0/7] phy: rockchip: usbdp: Clean up the mess (part 3)
Date: Wed, 30 Sep 2026 12:04:29 +0200
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WR207EIBCGX6XhWjYcer7yPcxewDC7RdtSoa2aT
 d9d2q4aNUa9Y2DyffwzFxLQWwykTi7E42yDdX0seH6TEGhUf0ZqTbwggomcVTylOqXewQM0dqB
 T0Gag0KLqp4EOyo+SAqiCyVKiRkkiZfB4ss+b4u6412HS9wjjir12eHyconvc20iHIahNXSdXc
 faTdY5PjJYMBXBuOGB5C65tlXZeHcB1q+E/vDWFeKOajBWgOS/S01+o4vN4zBPIj+rcThi5eeR
 ykSuBFZcS5HeuVgFpPHd2rJO5OEQGcLLOrrFhdP5l21b84Tar9zy/LWaPVClTMZVmeZV9VR+XZ
 XkFmyXmQxECAAA=
X-Change-ID: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4236;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Y9n9hZH+mnhTp9vnyXSbiLthx3Dq0IHUxNJU42AUj1M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r7Ka4MiIKkoZiuLdRM6XMean0lHusk1d
 vzLIngWg38GeokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qa+WIQAKR8KUScRo4d7pZWsXKJd7qTzAMgHA66AlhLhYzsIDKnUVuOz44VJKVhkPip3YNh62N
 TpRcukdwYuchCzdd1wCVCs6CYoIgzlSpmJ3iXwrMBM+Qe4RJ8gVogjtGV9SgsvyrUAs/mJ5ZGEP
 XKi1OS/gTKCSwY2uAlzBn50Hydp+14kVNUD3bjDfG1xCdPEHTi3jB618a/DjNIXAQrhHoQUOvlq
 Oy1jI0lDi/RF1IzDHYBcYPmafv8trODI9RgXx5ieXcQUVqDc1+e8JjJo/z7175ZBKk+ud0nBP/k
 xmZpBPn2QUMWrGg5x9lo/ylFncQksRzAceLFkJyeaLxbOV6TUO1hXQdVvoiJCgftq/P6P0n+2GS
 6rxdL2pvdjbn8TkcV3PFDmhyCPpo8b2Cab6haKLETjCr0ev/It3Fv9K7vj0VyVDfMJq5i9Vntra
 Tj/2rHNoKBQBTJeNnK/Z+di73UeRlcf7YacEdSfU+Xp9xoTJq8t5Xc4cLfHAXVgaFHMida6xlhp
 wQlDSolGfUPfKGs5lLJdlDC9+4yVTkEbCQirrvrgHmsYuLLGpMFBP0momUR5xcljJw6h6iuDCQE
 LC1wrJyXjKGpryVnB/nT3orfh/OD1l7t/NyshAWYwShTM74jkNMbD+d6ecmTMaDYuYh/ggnhNOu
 7X1lHFC6TjejafPJfKSAvnA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_030450_906864_7397C2C1 
X-CRM114-Status: GOOD (  11.64  )
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

This series was split from the USBDP cleanup series and contains a bunch
of critical bug fixes for the Rockchip USBDP driver, but the fixes
depend on the cleanup and features added in the previous parts and
cannot be sensibly moved to the start of everything.

This part depends on the cleanup series part 1, part 2, as well as the
series adding the new DWC3 glue driver.

The most important change is the first patch adding PHY reset
notification support (i.e. the PHY notifies the consumer that the
PHY is about to reset).
    
Changes in v16:
- Link to v15: https://patch.msgid.link/20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com
- Split out "Disable USB3 port during normal power-on" from first patch
- Collect R-b tags from Mani

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Split the series, no patch changes in this part

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (7):
      phy: rockchip: usbdp: Add phy reset notification support
      phy: rockchip: usbdp: Disable USB3 port during normal power-on
      phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
      phy: rockchip: usbdp: Rename mode to hw_mode
      phy: rockchip: usbdp: Fix power state handling
      phy: rockchip: usbdp: Re-init PHY on mux change
      phy: rockchip: usbdp: Add USB-C state without DP enabled

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 237 ++++++++++++++++++------------
 1 file changed, 144 insertions(+), 93 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
prerequisite-message-id: 20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com
prerequisite-patch-id: 27d601f203e30baebffc3486a1b787a2d280f5f7
prerequisite-patch-id: b42efbccabb13cd37252ea9bbc3873141bd5b8f8
prerequisite-patch-id: 8b416e19148a0b90c71778ff4fcc032b52ed49ce
prerequisite-patch-id: 04b986df824850902431339cdf43787d8036ac5c
prerequisite-patch-id: c0a6f7da1f986c76248c6271b0c04d8dab21e5cb
prerequisite-patch-id: 12bf844fd4a355c1860812522fdb16a1ff4232ea
prerequisite-patch-id: d71d6a6a232b59804f0775ba5c87d71bfdbbea61
prerequisite-patch-id: 301c705f92061ccb1a1923ec5d3bdc1fdceca24d
prerequisite-patch-id: 978560cb9620a16f57e14c424e8efa4ad7178747
prerequisite-patch-id: a6562299bf87dc57d4b14a8079d2b1e3fe407702
prerequisite-patch-id: 1b90e6acf41e9093636c3fe8791f46492b583520
prerequisite-patch-id: 60f32afe1f50ed33d48041b41e7ec8a5841d0ebd
prerequisite-patch-id: 8a9a01d462e581e6539bc9fd07b13e0f32933126
prerequisite-patch-id: fbcfbe4a42de5c488052e865bfd146260be738fb
prerequisite-patch-id: 7f3c3811dee1e11e0386ff2d8b4080f07bd68e88
prerequisite-patch-id: 831ca526a0099f3f7292f2060df9888bdf3055b4
prerequisite-message-id: 20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com
prerequisite-patch-id: aa7f5784cc227e8dd7e9fe376dad1997828aefbc
prerequisite-patch-id: 21ff208d83fc75ac5efa9f69d8aa36455d1ae94e
prerequisite-patch-id: 4f721e51f1f4d57284354cc0b99b6a092b4603da
prerequisite-patch-id: c5d9d7bf27e215f9f60ac98ce9cc2117b5041d38
prerequisite-patch-id: e1cefd986004360890e009dede50fc849ce927df
prerequisite-patch-id: e2788d7c6dad4f9b3352ed59c5b4bedd7c55529e
prerequisite-patch-id: 45c0c6cdd117dba967ae3616531d7229fa853075
prerequisite-patch-id: acca212cc347efc4748dbe8d74a192e0f58f0133
prerequisite-patch-id: dabae3467575f218da2042bd26aa7314f599169e
prerequisite-patch-id: 4208007b7e8ce5710399a7a1cd93a45b2da0007c
prerequisite-patch-id: d2362c993cd9289d8849af2144a05da1bb5d84c9
prerequisite-message-id: 20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com
prerequisite-patch-id: 14c0d95ef04887c85fa5b00910f128416efcf17a
prerequisite-patch-id: c2e1c453454a7589a691fe391dc79e86f09ca7b7
prerequisite-patch-id: dadeaf9e369e04d8b3329493a1a0756ddd6140f0
prerequisite-patch-id: be213d23cea80f1c646983de557fb1305d545f63
prerequisite-patch-id: 62b492b7b6e9957282f1029a02aaf258b63e990f
prerequisite-patch-id: 3de1ce97765d8dfb34358b864b722b4be0d2162b

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


