Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947B9C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1l6FHgsDuMiEUcIfSXG1IsXCgZa1bTdz/QloPt8obhI=; b=fPkvoqvYbKEOa0
	dZ8qqJGuDlGhWIH9mxLj/v1PCXJhG3MBUCKwCbKtxFSdZXtVRmLd+tRMoAInA7kVFq62MBS+XcYs6
	amwl7SE8JZQxgnsqBSjjoiVVTdVN3i3lkzie4hZOnbvOG1S8UVGtjTa+UQlP+nJ3oVSIBT0jgAT2i
	tiD6DeehxplQLZ2ZK4n2AutfkkiJqHRZlJBC9m3OPgCiNIUw+mCyW+Co0iVdzdElTIIiocsoMTaWv
	bD5Xei1TGiXa40ke5ZGlsJlXmUyc+4JBhDTAmpy7WYJuYZ2+xn0dgV1RE0WQFrqa+yGJYxNPl/HJZ
	0BQcLS6667EOgg9o22Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHty-0000000C07Z-06uG;
	Tue, 06 May 2025 13:00:02 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFlY-0000000BbeX-23yn;
	Tue, 06 May 2025 10:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746528180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EUt0IX7bUxgf0bzqQLU1D+ki/6BXD4YEaW0gX0tX/TiG7VCy+6Ii5R08/FwnpnQW4ggbrf3sjBqoSxUD7ZpBZPuXpx5M3frJb60LzWZonnT42Jp99LpbyhQlJCkITaNV8MptnHKx0gKpZ/D4nhxahsRn1S8HAd8vQm1ToYt2Lvs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1l6FHgsDuMiEUcIfSXG1IsXCgZa1bTdz/QloPt8obhI=; 
	b=PoGoDyRwQGT5nYf4d9SMTM5afqSBIHaqXUte205nOYYXIScE7gcW93ktbe2YtdgaavosXoJvjmQXREd7nM5vQn1KzEyjBuYr/k/0iqK+gPIsyONBCOYK9h3aTZ1D7uwvURIfOlx0n4TKxsEFxopmy/FYDaZGIFD3Q9ju+DVDxt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528180;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=1l6FHgsDuMiEUcIfSXG1IsXCgZa1bTdz/QloPt8obhI=;
	b=eBdhkGpsGLbPl2SpzGU7sSWWhDSB5HtK+EGRXMj+96K2uVZLWv8zOjuSr/ySY1AJ
	CI0I/eHR2FQYYi8hlmC71YDO1NT4uLFa/yTkMCV09TiFEhiaHPWIVZ/XNsdqv6NyKXl
	4Q8jKPVGt2wdIdIRn2faZ0RvqXtbgnSy/0vOdH6Y=
Received: by mx.zohomail.com with SMTPS id 1746528179569823.6445212545938;
	Tue, 6 May 2025 03:42:59 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v4 0/5] Add RK3576 SAI Audio Controller Support
Date: Tue, 06 May 2025 12:42:39 +0200
Message-Id: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/nGWgC/23OQW7DIBCF4atYrEs1ZmCMs+o9qiwwHjeoiWnBs
 VJFvnspWUSpsnxI3z9cReYUOItdcxWJ15BDnMvQL43wBzd/sAxj2UKBMoBgZPpE05HMLkjfWQa
 NYHvLooCvxFO41Nj7/rYTf59Lc7k9isFllj6eTmHZNTNfFlm7Bkj8gUPIS0w/9TNrW8Wzu2srQ
 ZJm8pMl5N69+Xg8uiEm91riNbWqO9ctPHBVuCdNYFHTwPiM450bUA8cC8eOPE9tP46d/8+3bfs
 F4owIW1cBAAA=
X-Change-ID: 20250305-rk3576-sai-c78e0430898e
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_034312_584869_54ADD221 
X-CRM114-Status: GOOD (  28.83  )
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

This series adds support for Rockchip's Serial Audio Interface (SAI)
controller, found on SoCs such as the RK3576. The SAI is a flexible
controller IP that allows both transmitting and receiving digital audio
in the I2S, TDM and PCM formats. Instances of this controller are used
both for externally exposed audio interfaces, as well as for audio on
video interfaces such as HDMI.

Patch 1 and 2 are boring devicetree changes to add the nodes, including
an hdmi_sound node in the SoC tree which can be enabled by individual
boards that enable HDMI.

Patch 3 and 4 enable analog audio and HDMI audio respectively on the
ArmSoM Sige5 board. Patch 3 goes into some schematic-derived knowledge
about where the audio signal can actually be tapped into in order to
test analog audio.

Patch 5 enables the driver in the arm64 defconfig for both the SAI audio
driver and the ES8328 driver used by the Sige5, as the RK3576 and Sige5
are supported in mainline, so its drivers should be enabled in the
defconfig.

To test analog audio on the Sige5, I both soldered to the output 2
testpads, as well as fashioned a cable to plug into the headphone
header. I do have the necessary materials to to make more such cables,
so if you have a Sige5 and want to test this but don't happen to sit on
a pile of 03SUR-32S cables, then you may contact me off-list to request
I send you such a cable from Switzerland, and I'll see what I can do.

HDMI audio is now enabled in this series.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v4:
- drop the clock patches Heiko already applied, rebase onto
  next-20250506.
- Squash the defconfig patches into one patch
- Link to v3: https://lore.kernel.org/r/20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com

Changes in v3:
- Fix auxiliary GRF patch on RK3388 and RV1126, which were
  unintentionally broken previously because I didn't build 32-bit ARM
  platforms. Thanks to Heiko for noticing!
- Drop "ASoC: dt-bindings: add schema for rockchip SAI controllers" as
  it was applied already
- Drop "ASoC: rockchip: add Serial Audio Interface (SAI) driver" as it
  was applied already
- Add codec driver defconfig patch
- Link to v2: https://lore.kernel.org/r/20250410-rk3576-sai-v2-0-c64608346be3@collabora.com

Changes in v2:
- split rockchip clk changes into 3 separate patches, all of which
  build on their own
- driver: expand Kconfig symbol help text to make checkpatch shut up
- driver: remove runtime PM debug messages, as they were redundant
- driver: move of_defice_id table and MODULE_DEVICE_TABLE to be above
  the platform_driver struct and below the probe function, as is done in
  many other drivers
- driver: drop of_match_ptr
- driver: drop MODULE_ALIAS
- driver: remove the confusing hclk disable comment in the probe
  function
- driver: remove quirks handling, which only existed for
  rockchip,always-on purposes. Downstream does not appear to need this
  quirk for any sai implementations. It can always be added back later
  when the problem, if there is any, is better understood.
- driver: fix hw_params when the number of requested channels is lower
  than twice the number of lanes in non-TDM mode. Without this, playing
  back stereo audio on an 8-channel SAI would fail to set the hw_params
- driver: when in I2S TDM mode, set the XFER delay to 1 aka half a cycle
  This makes the output waveform line up with both what RK3568 I2S-TDM
  and the TI TAS6424 codec describe as correct TDM'd I2S in their
  datasheets, namely that on the first rising SCLK pulse after LRCK is
  high, there's audio data ready.
- driver: treat set_tdm_slot with 0 slots as disabling TDM. This lines
  up with what the function documentation for ASoC core's
  snd_soc_dai_set_tdm_slot says it'll do if it's called with 0 slots,
  but in practice that function seems broken because it'll just pass
  the signed number of slots to the unsigned parameter of the mask
  generation function, which treats 0 slots as an error, making the
  caller snd_soc_dai_set_tdm_slot function bail out before ever
  giving any driver set_tdm_slot callback the 0 slot number. If that
  ever gets fixed (I hacked around it to test it), then our driver will
  be able to turn off TDM mode at runtime.
- ASoC bindings: rename bindings file from rockchip,sai.yaml to
  rockchip,rk3576-sai.yaml
- ASoC bindings: remove extraneous blank line
- ASoC bindings: change resets property to use an items listing
- ASoC bindings: fix rockchip,sai-(t|r)x-route property constraints
- ASoC bindings: remove rockchip,always-on
- RK3576 dts: add tx/rx-route to all internal SAI nodes. This is needed
  because they all can do either 8CH TX, 8CH TXRX or 8CH RX, and an
  absent route property is understood to be just 2CH if the direction is
  present.
- RK3576 dts: add hdmi_sound node
- Sige5 dts: enable hdmi_sound
- Now based on v6.15-rc1
- Link to v1: https://lore.kernel.org/r/20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com

---
Nicolas Frattaroli (5):
      arm64: dts: rockchip: Add RK3576 SAI nodes
      arm64: dts: rockchip: Add RK3576 HDMI audio
      arm64: dts: rockchip: Add analog audio on RK3576 Sige5
      arm64: dts: rockchip: Enable HDMI audio on Sige5
      arm64: defconfig: Enable Rockchip SAI and ES8328

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  64 ++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 217 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   3 +
 3 files changed, 284 insertions(+)
---
base-commit: 580d4593971087787eb1edddeddf1f33e7d590a8
change-id: 20250305-rk3576-sai-c78e0430898e

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


