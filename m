Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F627F8DFD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 22:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+92XE54HEAvYemE/ddSO6wnd+3qEgA9igNsTP67Qy10=; b=enW2gi7Ex6AGRMUANHAjaqZISW
	dTs8Kvvowhl9BCT/H6AhT9m+pRheLyaFXgjDAY9mA+2AqgYxpcaVeitqdRWh1wSuhR8YpNePwFwq1
	nbK/edxMQeNpTY84MTHvSrL1/mtXvBhE4YlAP3ELu7V34UmHj4tLYW/ZJVS/HIEQfONLZnIolvAdN
	bHzdeSWTTFi3w/6894pU4X56SWmOPiA7onApUzvy/aKeeXdzhGzMsNGeGgUEKvLzOr4Vx05DKayF9
	v/zGuMT6wzQa08UPfkMDGTFAOylmNJTAxBQktGg8MSPxerz8n3TY1nZluUNO3mXE/tzn71Unpn/zH
	tWlu0iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVEO-000000038pG-3Rh4;
	Thu, 16 Apr 2026 22:30:40 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVEM-000000038op-1GDT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 22:30:39 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E51A1D0016E;
	Thu, 16 Apr 2026 18:30:37 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 18:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776378637;
	 x=1776465037; bh=+92XE54HEAvYemE/ddSO6wnd+3qEgA9igNsTP67Qy10=; b=
	H2zHk1gQeAs+7F8H8ZiMcfuvJQXYBzIi89Br/4ahVCHBtFgRVtclDw2VaL2K3iyJ
	tm4/eaGYdlG15NHUqElaP46wuyoBNO3VJXhVBcjlCSG+sKwioJMg93w/S84F7+YQ
	gvcpmnteRxOgNntvyhn4BjUjhf2m3AIRX+3tiq8Kq++ueXuGeaICyfriMwmWMukT
	ZyXZGjS9ZtbwhJgeOQNIZoWmLotYcPMspHbdP0BAndaUJa1uVKQ25W1aj5ZZUykm
	FZ1aRXyfZ5N/ecnARj/Jp8gkwZ8CmNRyYz69dmXg3VPNi8EJTsHVnluZ8BC3Z4+s
	A20YaZ1bbUzcZgSRTUQ4tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776378637; x=
	1776465037; bh=+92XE54HEAvYemE/ddSO6wnd+3qEgA9igNsTP67Qy10=; b=U
	zxTmvXFYFjfxSCXCZmf+cb7o4CwkiQFA8Azd9P36vatLXqkjWszsK+3IvtNLjQxQ
	+QkOVSFV2RJxlLDYkU0fEeEEtwHH7lpXZQwzABjhaNLkMWDt0ZaDa06Q4ede0Wae
	Q32QsPSAedP1OrMrlNQEkpJXeG/SuFWr3k1dJJCvJVFqQesoVkZJRO/coYsA/Jnb
	VRFsntkvcHGgbDkVV5K8Sz5k2VromFgMJxe3X8IFqyxY4z1Tl9AZfXPSdpEK9AzW
	h9+MT9DtN0MmfYfwhxr+ENsDYybu8V7hs9obxbv4i3IXzoKudrIXpCr9FV+ZSJTK
	BIUJ6KtHsnvk+g+Ujpwew==
X-ME-Sender: <xms:DWPhaSQY4OpVXK6vA3Qg1RrUOqx8Uav_dOFruVbVCHoUyLcqjyLgJg>
    <xme:DWPhaSlz2asAxaE47pHQiYmooPV_SZ6pX0Bg3Epoyh1RUQb3hHQsxSySlaMBBsEMI
    Eh0tVPwDlpW42inXYcEf2rwoCodKhAO4CY33nRJxQ5_bWdAVmlWog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegkedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DWPhab8Ua50KlI1RJk6FnANeLRCr9lIX55IVt47T2hyOvnjpQrBAnw>
    <xmx:DWPhaelVfBjhSn7HV2wKqD-0vWRLZMvfpFdiFO5wFQf6MjmEeAH9Kw>
    <xmx:DWPhaRV9_gUBaZv5HrneSgtubwfVmV33EHpBGUrpnbxt7bCehTLc8A>
    <xmx:DWPhaTFKuTzlp8F0k2UWRqL0WlZKr0tPWwRJKYPOZQ24hd1tSvVmeg>
    <xmx:DWPhaT1l6ZDAp6GukhqEawXP_ucjcD4mx5Y8id3SAzSb2CfHYOzqc4MS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F040700065; Thu, 16 Apr 2026 18:30:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 00:30:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
In-Reply-To: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig updates for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_153038_389466_0101E1E6 
X-CRM114-Status: GOOD (  10.12  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.1

for you to fetch changes up to 07e1a498ee9a9e715208c06b39edd8f7d22f3b50:

  Merge tag 'at91-defconfig-7.1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig (2026-04-04 17:24:37 +0200)

----------------------------------------------------------------
soc: defconfig updates for 7.1

As usual, we enable a number of additional device drivers as loadable
modules, to support the added platforms. The largest change this time
is for OMAP2/3, which were not that well supported in the generic arm32
defconfig.

The Tegra SoC platforms are now enabled by default in Kconfig when
ARCH_TEGRA is enabled, which means the defconfig change is done at
the same time as the Kconfig change here.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable Qualcomm Eliza basic resource providers

Ajay Kumar Nandam (1):
      arm64: defconfig: Enable Qualcomm WCD937x headphone codec as module

Andreas Kemnade (1):
      arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs

Arnd Bergmann (5):
      Merge tag 'qcom-arm64-defconfig-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'omap-for-v7.1/defconfig-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/defconfig
      Merge tag 'tegra-for-7.1-arm-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'tegra-for-7.1-arm64-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig

Aubin Constans (1):
      ARM: configs: at91: sama7: enable LVDS serializer support

Francesco Dolcini (1):
      arm64: defconfig: Enable configurations for Toradex Aquila AM69

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.0-rc1

Harshal Dev (1):
      arm64: defconfig: Enable QCOMTEE module for QTEE-enabled Qualcomm SoCs

Kathiravan Thirumoorthy (1):
      arm64: defconfig: enable IPQ5210 RDP504 base configs

Kory Maincent (TI) (1):
      ARM: multi_v7_defconfig: omap2plus_defconfig: Enable ITE IT66121 driver

Krzysztof Kozlowski (6):
      Merge tag 'renesas-arm-defconfig-for-v7.1-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra
      ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
      arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
      Merge tag 'at91-defconfig-7.1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig

Luca Weiss (2):
      arm64: defconfig: Enable S5KJN1 camera sensor
      arm64: defconfig: Enable Milos LPASS LPI pinctrl driver

Meghana Malladi (1):
      arm64: defconfig: Enable DP83TG720 PHY driver

Michael Walle (1):
      arm64: defconfig: remove SENSORS_SA67MCU

Neil Armstrong (1):
      arm64: defconfig: enable pci-pwrctrl-generic as module

Pankaj Patil (1):
      arm64: defconfig: Enable configs for Qualcomm Glymur SoC

Romain Sioen (1):
      ARM: configs: at91: sama7: enable config for atmel maxtouch

Ryan Wanner (1):
      ARM: configs: at91: sama7: enable DRM hlcdc support

Srinivas Kandagatla (1):
      arm64: defconfig: Enable configs for Arduino VENTUNO Q

Taniya Das (2):
      arm64: defconfig: Enable SM8750 clock controllers
      arm64: defconfig: Enable Kaanapali clock controllers

Thierry Reding (2):
      Merge branch 'for-7.1/soc' into for-7.1/arm/defconfig
      Merge branch 'for-7.1/soc' into for-7.1/arm64/defconfig

Thomas Zimmermann (1):
      arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files

Vishnu Saini (1):
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm/configs/davinci_all_defconfig |  1 -
 arch/arm/configs/multi_v7_defconfig    | 32 ++++++++++++++++++++++++----
 arch/arm/configs/omap1_defconfig       |  1 -
 arch/arm/configs/omap2plus_defconfig   |  2 +-
 arch/arm/configs/pxa_defconfig         |  1 -
 arch/arm/configs/sama7_defconfig       | 10 +++++++++
 arch/arm/configs/shmobile_defconfig    | 11 +++++-----
 arch/arm/configs/tegra_defconfig       |  4 ----
 arch/arm64/configs/defconfig           | 39 +++++++++++++++++++++++++++-------
 drivers/soc/tegra/Kconfig              | 11 ++++++++++
 10 files changed, 86 insertions(+), 26 deletions(-)

