Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BC2C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6tnudjnaqnDvuJLZWbdA1XYcjcOG/KRBYhK5fxSl2U=; b=YqGqU4GchJ5e9MPhVYDfFYMPHF
	1agwmXE1ycv1TZyMTmgkG37u7x509uiVnyfmNUZLkd60lWVnOuBz7iLdeJFUx9c+99F/NsrV1beqh
	yGQ3+hhmAmrTl7bx1ZEJd/TvUdZOxdpsR0NRvRuJvwrDmcHHP7vuSX8FumkYsUhdaLT910Hwt7aA9
	F/wAyxhB7a9fys++nw6IYQVlZcrOTpRnXvObNsJ2Ww6gD9WKbsuCnxb6FLE+khJP4GLQ5R+ejCBHu
	zlgr//gexkem0oZBWOUYAkzmA97N1lO3hHR6E/vdM9DtT98Wmzi6NjAJk/n/aA0K/+SEPhmLM3D3v
	FQOa8A4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gaa-0000000Ah6n-2EOi;
	Thu, 24 Sep 2026 10:22:04 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gaN-0000000Ah43-1iGt;
	Thu, 24 Sep 2026 10:21:53 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 89BA61D00100;
	Thu, 24 Sep 2026 06:21:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 24 Sep 2026 06:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1790245309; x=1790331709; bh=W6tnudjnaq
	nDvuJLZWbdA1XYcjcOG/KRBYhK5fxSl2U=; b=YV226EbjfVpuElFcw2Yq0ZEOf3
	kV4oD1yEgBOGzqiHUWiGBUHsmuZWVgsCJn6s/sTW1jkG562sllnRbXnT1M+JSELY
	Zq7awi+A4dmbEFQZ7+okF12O6itF/CxLx3TMAiHtctqB1kEMndbbrmrI2vlBk0Ba
	XYbUEW3W70InY421d7O6sbJPaygVK8oL73OW89OVuXUbRzWTnkaWXWwvGtnCa3JV
	7eskiX2aABw4Blhzre4ogXQtco0DYIeEDlJeWU5UZaRrxoHvb9CbR4taKSWEPB/n
	sdoymmnO7c3wE+k0aJs9YPSv56gwVLdBgm0AETs8sQKNxIiQyUtVyWZtMOZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790245309; x=1790331709; bh=W6tnudjnaqnDvuJLZWbdA1XYcjcOG/KRBYh
	K5fxSl2U=; b=kh2tFI+C70MTIXe/YX+q8448PWaZCZnhMa5jTmFR1nMou61UJcn
	3WzJV+5IltfZrse2IpGQnglxx9FQZSd7rVblvWFZmqJQBxnrBOfOorgin2MRol1p
	7GTIl/h47gfMqkO5WlEFQRGked+S8dxfQw7RG545ESliULywNkO2Qx5Hx9ThYn8j
	nh/tRRBjbnioJwxB5HMlsLGLW+2Gl/aHQUMYACBSsEAo3f8tb9AmOPdf9xHoco3C
	EVE8q1HQj6CrJx0/ZQZUP78PC1BIp9aqiXGjjWtSgSkRIL70tyRk/NRpuyBxa9xJ
	S0Qvt0mK0sgHL8pUxHP7lrwawcp44DWbETA==
X-ME-Sender: <xms:vPm0avPHMDwn28tloF3tMSEyu8VxF0-yiXQT0HsAbMGQFOGRv59D_Q>
    <xme:vPm0aqvSQ30pPg-WEW7otfxJ7VOHupprZl9Nln6n-luqCRE4x86mOLUkQiJquwlmT
    8kqev4u9lOuFsqkJNX5npO4SgiGf73qmqNwFMfAM2VaHTbC4UqsvEs>
X-ME-Received: <xmr:vPm0aiGUv1jl5nzFATDJdBh4YPod_dURrATFLHxrFQJGEguGf87N8DiHfW9QxPYyoVWy8l0DIw>
X-ME-Proxy-Cause: dmFkZTGUBsuQ8u1e21jVcr3eLNYG8Ga4Cps63LL/fYxHUubIriJLI2yezzT3bzXM0DpGzH
    qkZsA9N9aBi9n2Y//Yi0OHlpEZJX5Bnw5YcMHpUTVUO0A8DdY/D5tvhfY4JQtyBJkgAFAw
    TNXckoesIyFctYvXVe/Yo5XkqpKs0A5wEq4b+dKkkqErTVFOzm2U0Tqf5wP76p8dip0AEW
    6goXFoqaPcnDdHoe8hK/ilbx/bv7lys+91iE7/Vpn/kNTv2VZk73o5DQPwhe3rGxKYgLLO
    NoMtnnrti5i/YjyeP2uj7BGXhCqwtaB6+EwJplu7fHaOam2PsrbS75wAJYWOARwLKIr9OS
    DPI/daDD++KB0WfxHB3zjHMjqNV9vZYf0wOy5M8lMuV0ULxpgCD6jL7ucgWwhkGq9g9783
    Z9TyFguJ6VUEk3MHSGQ6MdIT1xTww7BiozZzx9xuSDFh5IhMlwK+2xIpfoV13jYDwHIAnV
    jqIv0OdUCnHJYM+M5qe9XAget8mEh2DuV935JroNa8o8cDgx95KRO5U2Reaw1BbfPvyG6x
    p75wqGpVNdSXqXUO3rxHI1jVOITR29X4JLt+ZAFW720YnBULxO/I8Xwje52RdiLHEfbleN
    dqAns0cW41qUL8d047ZJggRqksth7LcFfxDruC5W93OmRI2UsyQh41lNQWzw
X-ME-Proxy: <xmx:vPm0alRmLW-fC207vPYU88tB4X3W1sYpm4gXSIhoogYbRN6k9_SHXw>
    <xmx:vPm0amj9Of0_Sc6lVVIi-35IpePezVZYs4b6rN9Ae3Ck6cb98PE9HQ>
    <xmx:vPm0apZ7rprtTFURlb7CwWUcijiQ8Dh8h-GqaMleHSRjlNg37b7ZRg>
    <xmx:vPm0anVkLpvzJvhB7q-vVOsUXaic03rqhvimGFh9nCF1pHIGlszOkQ>
    <xmx:vfm0ajvYafMq3HjSolhWD51Kegqh9Jhm0fEBs5AvIOIkpn2yyLWIeKF5>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 06:21:39 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v14 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
Date: Thu, 24 Sep 2026 22:21:20 +1200
Message-ID: <20260924102135.92217-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_032151_942706_C045ABA9 
X-CRM114-Status: GOOD (  14.48  )
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

This adds the RK3576 NPU to accel/rocket. The RK3576 has two cores of
the RKNN block the driver supports on RK3588, with more clocks, two
power domains per core, one reset instead of two, and a sixteen-bit task
number in PC_TASK_CON.

1/15 is Igor Paunovic's patch and also 05/11 of his DVFS series;
whichever lands first, the other drops it. His 06/11 edits the same
binding as 6/15.

Changes since v13:

  3/15   The comment notes that a core still up with runtime PM disabled
         is left unmasked (Sashiko). The message quotes Igor's re-runs
         on v13; his earlier summary is behind the Links. Igor, say if
         you want it back.
  7/15   Heiko's Reviewed-by.
  9/15   Message trimmed (Ulf), keeping one sentence on need_regulator.
  10/15  One reset, not an array (Philipp), and the pointer is cleared
         under pmu->mutex before it is put (Sashiko). Abel, the code
         under your Reviewed-by changed; say if the tag should go.
  12/15  Drops a claim that its test was byte exact; it was within one
         count. Its comment on PC_TASK_CON now says the count clear
         lands inside the task number and inflates it, which is what
         happens.
  13/15, 14/15
         v13's 13/14, split as Heiko asked. 14/15 gives 786 MHz at 750
         mV as 11 to 25 wrong words a pass; v12 and v13 said 13 to 20
         wrong rows, which no record supports.

The other messages, apart from 1/15, are shorter.

On Heiko's question, 9/15's delay at 0 makes the first power-on of the
NPU domain take an async SError, also with vdd_npu_s0 always-on; at 15
us, 536 cold power-ons were clean. Details are in the v13 9/14 thread:
https://lore.kernel.org/all/20260924090824.38493-1-gahing@gahingwoo.com/

Routing: Ulf offered to take 7, 9 and 10. 1 to 5, 11 and 12 go through
accel, 13 to 15 through rockchip, 6 with accel and 8 with the DT patches
that use it. 15/15 needs 9, 10 and 12 to 14 first; without 9, 10 and 13
the NPU domain comes up with no settle delay or reset pulse and the
board takes an SError at boot.

Still open:

  4/15   whether you want a fix for the asynchronous put, and which
  5/15   moves the line that ZhaoJinming's "accel/rocket: Fix
         iommu_group leak and unsafe IRQ register access" changes;
         whichever lands first, the other conflicts
  14/15  both NPU domains per core, as tested, or one
  --     rocket_core_fini() puts the IOMMU group before it cancels the
         timeout worker: fix it here or on its own
  15/15  hold it a cycle, or coordinate the three trees

Link to v13: https://lore.kernel.org/all/20260915104328.45901-1-gahing@gahingwoo.com/

Igor Paunovic (1):
  accel/rocket: request the core clocks by name

Jiaxing Hu (14):
  accel/rocket: take the completion register writes under job_lock
  accel/rocket: wait for a running IRQ handler before resetting a core
  accel/rocket: let the core suspend after a reset
  accel/rocket: factor the completion tail out of the IRQ handler
  dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
  dt-bindings: power: rockchip: allow resets in a power domain node
  dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
  pmdomain: rockchip: add optional per-domain power-on settle delay
  pmdomain: rockchip: cycle an optional power-domain reset on power-on
  accel/rocket: select the per-core clock and reset counts from match
    data
  accel/rocket: add RK3576 NPU (RKNN) support
  arm64: dts: rockchip: add NPU core domain clocks and resets to rk3576
  arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
  arm64: dts: rockchip: enable the NPU on rk3576-rock-4d

 .../bindings/iommu/rockchip,iommu.yaml        |  28 ++++
 .../npu/rockchip,rk3588-rknn-core.yaml        |  47 +++++-
 .../power/rockchip,power-controller.yaml      |   8 +
 .../boot/dts/rockchip/rk3576-rock-4d.dts      |  22 +++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  86 +++++++++-
 drivers/accel/rocket/rocket_core.c            |  32 +++-
 drivers/accel/rocket/rocket_core.h            |  11 +-
 drivers/accel/rocket/rocket_device.c          |   7 +-
 drivers/accel/rocket/rocket_drv.c             |  42 ++++-
 drivers/accel/rocket/rocket_drv.h             |   2 +
 drivers/accel/rocket/rocket_job.c             | 157 +++++++++++++++---
 drivers/pmdomain/rockchip/pm-domains.c        |  89 +++++++---
 12 files changed, 467 insertions(+), 64 deletions(-)


base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
-- 
2.43.0


