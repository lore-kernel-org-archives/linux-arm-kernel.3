Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EE5CC6B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sU9N9t+rSJbdzfZ3EGowiDCPXCTLK+Yw+P9GxmRYz1g=; b=2eS3mgPVyw3oFy
	W6DszTTCs68MSXUfUauvYlcrsNHuGxyCnpgdDxaDpXRtGRzs3g5gRur0XCh8pRM9wK49RCHvOAHll
	y4oUwJUyUagL+MGPqsi1Jc0jTowzXNxBspAwXb3gN/6faKLDe4x/EbSvwoJl20uuMyQP/UNpdy0wB
	VftzwVH0Pg9sIZ3UbbG5yzRVTLuP9hdgW3L12gFRTSKm6ZYzzglBeZsfrJMy5gLZIQ2TdbmRvwoSY
	cNrSMwxZd2nQfo7T7EbZxl1/uk2QV5gBSMx7Oe690Fz3eOLc+0UutG88aeZIuuLmUw775Zdofxo0Y
	YV8QrK18X6Syi71t8QVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Zz-0000000GKVm-3jwQ;
	Wed, 14 Oct 2026 21:32:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Zx-0000000GKUJ-1r9g;
	Wed, 14 Oct 2026 21:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7A22447A2;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BE61F000C7;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=sU9N9t+rSJbdzfZ3EGowiDCPXCTLK+Yw+P9GxmRYz1g=;
	h=From:Subject:Date:To:Cc;
	b=lH4XGLptaQqNsFgDjcW/GtR5HeupPmlqTRIhQZ/oK7A517/GBqdkroZNLZ9SGkD4U
	 yZ6ewNhlbTjyttPD3qhRbwdHoHRuVMkAubxgG7zOsz9N9swBy1FYt9czSqi8/Rsah3
	 MFh5eCEG6Xu8KFw8zFwfG18LML4FNGTqDAWFBdMoqaKI1E9mPtRVGsaLU+C1NYwLD2
	 0ucp+hF5Akv951WlgkYh9tX9YaTVbSVQkPF61FfJCzasiPnoKPeClQ790htjXOjfq8
	 8/pQkcAMYI11DoIAqajqoVtxPhp+eYDt9igSb7Xro1UlkJVVFLuimpQ8p6KTKmx4q4
	 /TgRzxDhSeHUA==
Received: by venus (Postfix, from userid 1000)
	id 68603180A50; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 0/4] Add DP AltMode VDO definitions for DT usage
Date: Wed, 14 Oct 2026 23:31:48 +0200
Message-Id: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0Q6CMAyF4VchvbbJtggGX8V4UWjBEh1kHcaE8
 O5Oufxycv4NTJKKwbXaIMlbTedY4E8V9A+Ko6ByMQQXGu+8Q16Qnvk1syBnZBk0imEgqqk9d5d
 mqKF8l1SGz797ux+2tZukz78Y7PsXRUYHJnkAAAA=
X-Change-ID: 20261010-dp-altmode-dt-defines-2aa5a94b76f5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Mb7sbWbMfHESa0aAXF7BdF35M8lFzlOgXSETY1QlwaE=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TQGcp6wF8P8bq+yUhm+bV9dkEdDnyOEi6TJ
 0TsUKTp+aaJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00AAKCRDY7tfzyDv6
 mmQWD/0ZLmcrm2qIQ9ZwFK8Gv/BjgvkaCFGmaFJSQFBj0SQj6/lUOFBMauA0MvE6ZijzvCpoyoE
 azqANY5G7eMKlZ106ByVaQQ1BRTBpNc2OzCFXIP5/7bfkHmx1SIAhAI8YLn+ktmIhHgjTQ6GMQ+
 afcbVr0ffREqfRNEJa6bkB6Q0SslaeHR9eHcjmN8gWJnKOFvUKlNxUTrQbABmMD0bJuRYnmajjU
 oFX3d7cknM7xSa9hTRvKBUuv/t8cj4ZdMtEvWD529oYYvzn3oC3SjJMztPh0HIm7L51MRXJlQCq
 oDyMl2yjdXacK0GnPl6ntPpVRuEot3qewQgqjjWoFN4CzmKsHlAQpegNnCqIObc93PDAhIkntAw
 JLhUanvzkKzdAuD1DrEVgQ6JdiCVB4mnu+zZhwx7EI4rzVwtYIV2EUJAkd5zBH4TaqvLT0XIAbU
 7Vev4VT4rdaf/Hw43Wf12nRvMSkwuBwVSbTGgYAXjvCqcZ/Ma9Yf+aJTVRHyzbTqx75p8/F0KFL
 9ezMoyhf1QDnAUjV4jAm0DiYQeOezqEqO8i0B5Fn4OOeu1jc74lnC53M1J1lLyoc3oQCRJuIyZW
 Ny6ZiKJQs1n3IqSnmVi3tVbvGB988CwipdVPqw/M/NkN+pUj9Z5/ZhnjiqcNMqfqHzSPdqAFOO3
 bLviFcfj1uoO8Kg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

Make DP AltMode devicetree entries more readable by adding a few
defines. This hopefully helps to correctly describe the supported
DP AltMode when boards are being upstreamed. Apparently right now
all upstream boards with DP AltMode *should* have set their VDO to
0x00001c46, which means that they can output DP1.4 with C, D or E
pin mapping on a receptacle that also has functional USB 2.

The patch series is based on current master.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (4):
      dt-bindings: connector: Add DP AltMode VDO definitions
      arm64: dts: rockchip: Use DP AltMode defines
      arm64: dts: mediatek: Use DP AltMode defines
      arm64: dts: qcom: Use DP AltMode defines

 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  8 ++-
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 10 +++-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  8 ++-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  9 +++-
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   |  8 ++-
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |  8 ++-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  8 ++-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |  8 ++-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |  8 ++-
 include/dt-bindings/usb/pd.h                       | 58 ++++++++++++++++++++++
 10 files changed, 115 insertions(+), 18 deletions(-)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261010-dp-altmode-dt-defines-2aa5a94b76f5

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


