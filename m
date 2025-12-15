Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A2DD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 12:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juPpp4zwMaR29F4s6SX8P4Y9o0HZhkn1aHpIS5UX6nc=; b=395vLRZobD22OF
	63nSn/DCZGmv3PsQodcIYQcnHF2wsSvrjZnkfMnrYGcaX8uNi/TRkmj20wvh4jofVIeghg5urffeG
	ZROnfbtHROwDmxKiudaer8oULxRFo7pfKFaDXG6L+RsNFoLGSlQQFgCVPPg7H2+bMV4ndPBhfCDm9
	1Vc9K88f+MruTq5XJqw0Pxr/XnemUG+buquz/Bj2zb34y8FP0qiZZSo3vaK7/dZdwdr595Xb3OYN0
	DyoSzJ4dHHP53SrmSbFil1U1uyl1RNUhM0yrW5C9SXKZhLZcQgd19vJwDDhBjNLqZUjkTN9YKnipx
	JLuIWa+DQ76vTNcpOi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7iN-00000003cfy-2IBa;
	Mon, 15 Dec 2025 12:30:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7iK-00000003cfF-35nH;
	Mon, 15 Dec 2025 12:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765801796; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Je1nxOP1Dfsjeh7PQbSGDw5GZEWWv7yyb2BAfvx6nHclb1zZk//RR8yaH03KOJJKoaJxzd7Mgxiv6qvgCAHAqWMGfpXskRJL3drB5Rtyl3kO/6RGMgPg3NOXWjf7isV7JI3x6W6o1ycYorVOwjcgN700Elv/7rv2ayISvDHrwfA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765801796; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=juPpp4zwMaR29F4s6SX8P4Y9o0HZhkn1aHpIS5UX6nc=; 
	b=aEpUbidBM5btDVfhTkZMODBOEgCNPsjjoMvJp8Qj1Qj/cUpd6rQ5ebJQKP3jj2gkUak0WqhUhSFvC8BrPZXHuvQ+JH5UdBhVx9tWd5AFigP4/ECaDXI4/gZQMN4ZU3OemEWgYOLRW09PuGMNxSSGpRn0eUR5eZkaS38MV1AimEU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765801796;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=juPpp4zwMaR29F4s6SX8P4Y9o0HZhkn1aHpIS5UX6nc=;
	b=LuJ7FXfUDrJoKmushT0WrJRcHjoGiVwwFaaOSN88sKmj4Yc9QnpPucMmPy15z1KR
	mqzUx/oYYc2Jjdcje7MYiYDmL5SGHfqguGv7/ABUecwqhh6Hjb1Sno4Xdcf6e39QJ5Z
	a3dkLQ2XGna6zVlw5qnb2JYO7dUlbymPS9vlVWKk=
Received: by mx.zohomail.com with SMTPS id 1765801793005302.7427697539812;
	Mon, 15 Dec 2025 04:29:53 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/4] ROCK 4D audio enablement
Date: Mon, 15 Dec 2025 13:29:28 +0100
Message-Id: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACj/P2kC/1WOQQ6DIBBFr2JmXQxgq+iq92hc4ACVVKUFJW2Md
 y/VVZdv8v/7s0LQ3uoATbaC19EG66YE/JQB9nK6a2JVYuCUX2jJK+IdPs6KyEVZR9AgrQwrhaQ
 CUuXptbHvXXdrD/b6tSTrfByhk0ETdONo5yaLZc5q4pHBL9zbMDv/2V+JbE8fqwX9X42MUEK7A
 oUWRskar+iGQXbOyzypod227Qvmaucf2QAAAA==
X-Change-ID: 20250627-rock4d-audio-cfc07f168a08
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_043008_836585_C3F2F803 
X-CRM114-Status: GOOD (  13.93  )
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

The ROCK 4D uses an ADC input to distinguish between a headphone (i.e.,
no mic) and a headset (i.e., with mic). After some searching, it appears
that the closest we can get to modelling this is by sending a particular
switch input event.

So this series modifies the adc-keys bindings, extends the adc-keys
driver to allow sending other input types as well, and then adds the
analog audio nodes to ROCK 4D's device tree.

It should be noted that analog capture from the TRRS jack currently
results in completely digitally silent audio for me, i.e. no data other
than 0xFF. There's a few reasons why this could happen, chief among them
that my SAI driver is broken or that the ES8328 codec driver is once
again broken. The DAPM routes when graphed out look fine though. So the
DTS part is correct, and I can fix the broken capture in a separate
follow-up patch that doesn't have to include DT people.

Another possibility is that my phone headset, despite being 4 rings and
having a little pin hole at the back of the volume doodad, does not
actually have a microphone, but in that case I'd still expect some noise
in the PCM. Maybe it's just shy.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- Drop HDMI audio patch, as it was already merged.
- adc-keys: rename "keycode" to "code".
- adc-keys: make the keycode (now "code") local a u32 instead of an int
- adc-keys: only allow EV_KEY and EV_SW for now. Rename patch
  accordingly.
- adc-keys: Add another patch to rework probe function error logging.
- Link to v1: https://lore.kernel.org/r/20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com

---
Nicolas Frattaroli (4):
      dt-bindings: input: adc-keys: allow linux,input-type property
      Input: adc-keys - support EV_SW as well, not just EV_KEY.
      Input: adc-keys - Use dev_err_probe in probe function
      arm64: dts: rockchip: add analog audio to ROCK 4D

 .../devicetree/bindings/input/adc-keys.yaml        |  3 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 90 ++++++++++++++++++++++
 drivers/input/keyboard/adc-keys.c                  | 88 ++++++++++-----------
 3 files changed, 138 insertions(+), 43 deletions(-)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20250627-rock4d-audio-cfc07f168a08

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


