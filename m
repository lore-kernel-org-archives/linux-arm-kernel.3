Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F7C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 23:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2IwalmKvII2wjdNIZlzpaAimkHRlXVRsnIocmdujjKQ=; b=ee4gGhoTmJLzhu
	WusyN+gwHD3nFoNcxn6BfLrNF1UbjHyLGQZXUPHW22BWkVbbf5Zt1EOxsUg8Ovs62ohghAHanFmw0
	MnIkk7HNsopfuqycEgu+9X8osWC67aYwDRJeaJqckAt7fyAbD5xBmF2pu/yLC/qfAII6a5ZB5wJeu
	QHdVM5Vj0Idz7x9X1xiXYqpg+2mhS3JKuoQnXk2DxgLncgPoC60M0/GznVpgbAwmfzIkaJOUuiVxR
	vaq5bp9U8h6FmZzcPTqfklAgLTi9Y13NR4TDAVj/CE3uvujVQLWT6/hXO1xzZUGoIBduEW9bpHgLi
	Nw49tbjy0EbapI8B9SaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjRjo-00000000u94-07ux;
	Sat, 15 Feb 2025 23:38:20 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjRgv-00000000tYN-1lSi;
	Sat, 15 Feb 2025 23:35:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739662504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H0f8h1UNsng7CEtVbo53pmVCmAmNgqG1K+hLVRKeEcomU5XTOAh18wBstErMKh6Hw2FK3gUAC1dbA8We+yVsz9aUijeqAekFF07kj/Xi5DFh8AtlELheUtk8lw+vf2Yau7ttmpEfNmx0rBsJeWUjEJvRsr3QkhgGBbnADZOOsvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739662504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2IwalmKvII2wjdNIZlzpaAimkHRlXVRsnIocmdujjKQ=; 
	b=UBX/iciIGXZ8T1EY1+SI80SJ6mVfsxZ4ODXRYLkFLbFlueRf6lNVnppjAlrfzGr8tQ4JyXcmkyaERmQ+V3WpBq14f+2Qjv5aqfJGBIpBE9Yr7P0k1YcF+4capG9+r9UAppK4Cb4/+eTcZwxZD4hgH5n3D0cbbaAr5ZfW0/zzv+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739662504;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=2IwalmKvII2wjdNIZlzpaAimkHRlXVRsnIocmdujjKQ=;
	b=VdUaNEpTfhrBgz3yCxJzRhkxyYY5GNurBCa8pmxnME/ZtDHwcQc0nlpt2+KurSty
	KzJw55z3DxnXck48z5u7/MsTpR6alWj2HV7YgfNcxHUASd0QuF90wFCR1dwkkPR2R51
	+nntNRTtBUYqfAr0cJBgs4jgRKl7i8/7SGxPtF3c=
Received: by mx.zohomail.com with SMTPS id 1739662502809296.039531409702;
	Sat, 15 Feb 2025 15:35:02 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/6] RK3576 thermal sensor support, including OTP trim
 adjustments
Date: Sun, 16 Feb 2025 00:34:49 +0100
Message-Id: <20250216-rk3576-tsadc-upstream-v1-0-6ec969322a14@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJkksWcC/y3MQQqDMBCF4atI1h1JotEqpfQexUUaxxokajOxC
 OLda9Xl/+B9CyP0FomV0cI8fi3Zod9CXCJmWt2/EWy9NZNcKi6FAt8lKs8gkK4NTCMFj9pBjty
 IImny7KrZ9h09Nnbe3Wd1tMfPtPHhGJlDIr3zZXQ7dS5lqgSPhSjSIktAQIu2Gx7UBzRtXOP9b
 780IZjBORvKqMc5wHmXrFrXHwAAv+7SAAAA
X-Change-ID: 20250215-rk3576-tsadc-upstream-7e0c193f768a
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Ye Zhang <ye.zhang@rock-chips.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_153521_571559_C31B277D 
X-CRM114-Status: GOOD (  19.65  )
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

This series adds support for the RK3576's thermal sensor.

The sensor has six channels, providing measurements for the package
temperature, the temperature of the big cores, the temperature of the
little cores, and the GPU, NPU and DDR controller.

In addition to adding support for the sensor itself, the series also
adds support for reading thermal trim values out of the device tree.
Most of this functionality is not specific to this SoC, but needed to be
implemented to make the sensors a little more accurate in order to
investigate whether the TRM swapped GPU and DDR or downstream swapped
GPU and DDR in terms of channel IDs, as downstream disagrees with what's
in the TRM, and the difference is so small and hard to pin down with
testing that the constant offset between the two sensors was a little
annoying for me to deal with.

I ended up going with the channel assignment the TRM lists, as I see the
DDR sensor get a larger deviation from baseline temperatures during memory
stress tests (stress-ng --memrate 8 --memrate-flush) than what the TRM
claims is the GPU sensor but downstream claims is the DDR sensor. Input
from Rockchip engineers on whether the TRM is right or wrong welcome.

The trim functionality is only used by RK3576 at the moment. Code to
handle other SoCs can rely on the shared otp reading and perhaps even
the IP revision specific function, but may need its own IP revision
specific functions added as well. Absent trim functionality in other
SoCs should not interfere with the modified common code paths.

Patch 1 adds the RK3576 compatible to the bindings.

Patch 2 adds the basic thermal nodes required to get temperature
readings and device throttling to the rk3576.dtsi device tree.

Patch 3 adds support for this SoC's thermal chip to the driver. It is a
port of the downstream commit adding support for this.

Patch 4 adds some documentation for imminent additional functionality to
the binding, namely the trim value stuff.

Patch 5 adds the requisite OTP cells and tsadc nodes to the SoC's device
tree, conforming with the bindings modified in Patch 4.

Patch 6 adds support for reading these OTP values in the
rockchip_thermal driver, and makes use of them. The code is mostly new
upstream code written by me, using downstream code as reference.

This series depends on Heiko's OTP series[1]. You can grab yourself a
spicy linux-next based tree from [2] with both changesets if you just
want to give it a spin on your own board.

[1]: https://lore.kernel.org/linux-rockchip/20250210224510.1194963-1-heiko@sntech.de/
[2]: https://gitlab.collabora.com/fratti/linux/-/tree/rk3576-thermal-adc-4

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (5):
      dt-bindings: rockchip-thermal: Add RK3576 compatible
      arm64: dts: rockchip: Add thermal nodes to RK3576
      dt-bindings: thermal: rockchip: document otp thermal trim
      arm64: dts: rockchip: Add thermal trim OTP and tsadc nodes
      thermal: rockchip: support reading trim values from OTP

Ye Zhang (1):
      thermal: rockchip: Support RK3576 SoC in the thermal driver

 .../bindings/thermal/rockchip-thermal.yaml         |  45 ++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 239 +++++++++++++++++-
 drivers/thermal/rockchip_thermal.c                 | 280 +++++++++++++++++++--
 3 files changed, 540 insertions(+), 24 deletions(-)
---
base-commit: 6f5eb5a1b91efbc9317ac7a55c5c9e74be3e358d
change-id: 20250215-rk3576-tsadc-upstream-7e0c193f768a
prerequisite-message-id: <20250210224510.1194963-1-heiko@sntech.de>
prerequisite-patch-id: 8b8d7c74c83755b87a59b37dfa1c335a84f4fbda
prerequisite-patch-id: 39def5e1f0f4ae6f182cf50b42e1e43a90d0991d
prerequisite-patch-id: bf402264f426cb53f5a40b36dea74e0e2def5621
prerequisite-patch-id: fb7a67402ea0d8792cbcefed9239ad141689e33a
prerequisite-patch-id: ae942d1f9e0e9d8e0b0ca493b8ec0bd5994365ae
prerequisite-patch-id: 12e5d422403737e300ba9563f7d4338e356d0299

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


