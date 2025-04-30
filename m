Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A58C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F+Ts31OxWQ0WA/XXfCrTbdTi2PZ2UUmlCJRckaG2TDw=; b=UCXfQPSW90EKDb
	MdhfEUf59O0K7YoeSWwnFhNsBw4O6QPiazU/55KNFFS7CqD3vVdktk0YurgODChERUjPlZNJhLwk3
	Z7uIX8TrGhcOYin58YxKFuPmqV8WAw2ZYwA6ktKozj9eHV4bKjDIxiV2pc1FeLH9UjREvY2R3uNos
	xyFRI/qvxkiu7IqKkd4K/F6pBd1qK+GvNWO44ci3zaXUR74rm4zPRdgEljNvxiCnVwnZRNhgRQpxO
	RLmPBNfOE5/a3dgFXqVK9wowIT18iCkjMHFDusJLFeSHR9+0lfM7u9JnWYJknGNgBWbvB49p5edXN
	q0e8LRFXkzr4wkSi8WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAAa-0000000DPvw-23DV;
	Wed, 30 Apr 2025 16:20:24 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAA7b-0000000DPHH-2AN7;
	Wed, 30 Apr 2025 16:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746029812; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B287je1pCwj5KlUdHqnWjILCE28CeDyD/RGttZ73msudPqKOQJa/HpKQzsv5GWQKR1XvfjRGkqhMcaHqZRzYQEjgwHyK6Ygpz+Apl58/sSUOv94GhXFf5QtK3g80fTd8Zc/EwVE71e0fxaAnZ+iQfuU9+6BvyDJbIvruac/Hhxo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746029812; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F+Ts31OxWQ0WA/XXfCrTbdTi2PZ2UUmlCJRckaG2TDw=; 
	b=WWi/OEwYNLm6TdqHoo9nv5gmmobRI5mQY/qYcMw2YeXjW1y8WzGDVaJvi6JL4//FXEO9P1AZu5/gJsTsorRtwnNY/59RIjJspK44fiq+988lggByD7kYQbsX6ajA+5ONHWSVcjqAf4419LIM+IuM4442cj0sedhXw05Cx3GCbIE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746029812;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=F+Ts31OxWQ0WA/XXfCrTbdTi2PZ2UUmlCJRckaG2TDw=;
	b=CtnL4PV2iszZr2tLD1X+Rxo0+MnLVjzqh6kPbne1NbQidAZESyn4vrjWd/EgVct0
	fD2vXblzP/zTS2ETW0XN9QaR72t9n7aXuRBQ26zKcVhf4OzikZOOL68dKiymAbEe7qi
	horD4tl69PFbvVzR7jLvOrne4Bu3Pfms0HOplmZQ=
Received: by mx.zohomail.com with SMTPS id 1746029810436360.54725368726145;
	Wed, 30 Apr 2025 09:16:50 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/3] RK3576 Hardware RNG
Date: Wed, 30 Apr 2025 18:16:33 +0200
Message-Id: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOFMEmgC/zXMQQ6CMBCF4as0s3aStlhBrmJYlDrCxFB0WpWEc
 Hcbicv/Je9bIZEwJWjVCkJvTjzHEuagIIw+DoR8LQ1WW6eP9oxyr1x9wvEjccAmVLrpXW2MJyi
 Xh9CNlx936fYWer6KmvcRep8IwzxNnFsVacn4l6Hbti+PAwAKjwAAAA==
X-Change-ID: 20250429-rk3576-hwrng-8c308b5711ae
To: Daniel Golle <daniel@makrotopia.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_091719_675849_60D07559 
X-CRM114-Status: GOOD (  12.32  )
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

Gee Nicolas, how come your mom lets you write two Rockchip HWRNG drivers
in a year?

In short, RK3576 (and RK3562 and RK3528) introduce another HWRNG IP. It
actually has quite a few cool features, but I ignored the cool bits and
went straight for the true entropy. Some of the cool bits someone else
may wish to add in the future: AES-CTR PRNG that's regularly reseeded
from the entropy, adjustments for oscillator and oscillator ring lengths
to maximise entropy generation, automatic continuous quality checking of
the produced entropy by the hardware itself, etc.

In testing, it seems to produce about 2 mbit/s of high quality entropy
on the RK3576 with its default settings when we read the TRNG entropy
output directly. That's less than we'd get if we had the hardware use
the PRNG to stretch it, but I've decided to leave that up to Linux's
entropy pool implementation for now.

RK3562 and RK3528 probably just need a compatible and a DTS node to
enable it as well, but I don't have any RK3562/RK3528 boards to test
this with, so it's not done in this series.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (3):
      dt-bindings: rng: rockchip,rk3588-rng: add rk3576-rng compatible
      hwrng: rockchip - add support for RK3576's RNG
      arm64: dts: rockchip: add RK3576 RNG node

 .../bindings/rng/rockchip,rk3588-rng.yaml          |  5 +-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  8 +++
 drivers/char/hw_random/rockchip-rng.c              | 73 ++++++++++++++++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)
---
base-commit: 4e0a9c660788594b5b49ac07f0fbdccd2218431e
change-id: 20250429-rk3576-hwrng-8c308b5711ae

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


