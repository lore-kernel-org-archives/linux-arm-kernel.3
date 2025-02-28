Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19C6C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OQv/Ve/kfM/vHA3jvLbfQID2p9DPI+BPLVA6oix+lT8=; b=QykgFaFy8miGRcSRfMDZrxZQmx
	Czkkt2ti1CtOpuiM/l59xi9mnDDmRlEDKMW7vnH94Xn3WBUjkxpLnZ+XqKo3igzMhRYg5EIm+3Khc
	Y4KU/0irKvEvE5m0PDtiEGcLYIQwT4hLbCYf4J6e7ogvkMnWL6QsZMPrRoIALEO4dcdfvKb6KQuz/
	x94RWx9pmYw6Q8VRNKhhK3YaKLELjYHUXXuN3OCyM9g/paVlpsERwQ4SKU0pzThenpRYljYUTrnhO
	L4vQdhGO3SW6Vt+qoY7c4JPTF3IUfClD7lAh8VBACqZ6jfplkfpppQFSLDXWpcAHr3qsn8RJoGna1
	WnY4Nu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvQx-0000000A6wF-1bdi;
	Fri, 28 Feb 2025 08:09:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvMK-0000000A5SM-1C78;
	Fri, 28 Feb 2025 08:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59B915C65C3;
	Fri, 28 Feb 2025 08:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D17D6C4CED6;
	Fri, 28 Feb 2025 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740729874;
	bh=x2141hNFezK6mYwqWQI9537WXt7YCIJnzh0zwLxszv8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ggHJbmaVVOISS/Zmur3noPoa9ob4zXIkPHN/yvlkzVW30sINZG185Q7hEHhYiN+eR
	 yen0N5/zOSKn8GEgJHuBTwcSFevgaUGaTUK/F4awi5n/IELEwzVhtQ+8D6inTliy62
	 wAJeMGLJ3qZAmGSqNqnhzCwlg6khEWpO6JAu3DFbEuKe+xTetT+TUW/4LT9UU127ew
	 WQM1C8vNbbAElSCdlxqhkoDHn/Re8zYCFGaI6Z06zI5+Eb4EBOuVecqulbYYt/ZQ+0
	 zyLB/BBEFBx+QdgbxotiPFjxLEYt6PNVUS3gs1+EBph/xJWce+wNqG5N0I1UICA4Q2
	 Eb5P29/iNrRsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF6DC282C5;
	Fri, 28 Feb 2025 08:04:34 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH v3 0/6] Add support for S4 audio
Date: Fri, 28 Feb 2025 16:04:08 +0800
Message-Id: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhtwWcC/13M0QrCIBiG4VsZHmf4q0PXUfcREebc9kOboSXF8
 N5zg4h1+H3wPjOJLqCL5FDNJLiEEf1UhthVxA5m6h3FtmzCGa8ZAKPm2aK/tCGhC5QpUwsNVjb
 ySkpyD67D18qdzmUPGB8+vFc9wfJ+IbGFElBGtQWpFOuENuxoxpvv0e6tH8lCJf7LOci/nJdcK
 K2hM0LZxm3znPMH59QOeOkAAAA=
X-Change-ID: 20250110-audio_drvier-07a5381c494b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740729872; l=1652;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=x2141hNFezK6mYwqWQI9537WXt7YCIJnzh0zwLxszv8=;
 b=D0A/1LXJsQqSGXP7YG/LoMPSb5KDruBemjmW99wLhc4KV+CLVtukH8eStEK+HV3PGNIo4yL/o
 9+irLhQOedMDqh4SfvL/ccR5s7Ie9UnlESjSA7Etj+eVhwTWTgYbH3T
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_000436_413230_DE746CFA 
X-CRM114-Status: UNSURE (   9.00  )
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add s4 audio base driver. 

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
Changes in v3:
- remove g12a tocodec switch event
- Modify the incorrect title for dt-bindings
- Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com

Changes in v2:
- remove tdm pad control and change tocodec base on g12a
- change hifipll rate to support 24bit
- add s4 audio clock
- Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com

---
jiebing chen (6):
      dt-bindings: clock: meson: Add audio power domain for s4 soc
      dt-bindings: clock: axg-audio: Add mclk and sclk pad clock ids
      dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
      clk: meson: axg-audio: Add the mclk pad div for s4
      ASoC: meson: s4: Add s4 tocodec driver
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  18 +
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 371 ++++++++++++++++++-
 drivers/clk/meson/axg-audio.c                      | 410 ++++++++++++++++++++-
 drivers/clk/meson/axg-audio.h                      |   4 +
 include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
 sound/soc/meson/g12a-toacodec.c                    |  51 +++
 8 files changed, 1081 insertions(+), 4 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
-- 
jiebing chen <jiebing.chen@amlogic.com>



