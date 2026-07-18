Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66610C44526
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BJFiBGt3rnsgbEqpBZLJArMrhdkhs48oNDcrYNrzXaM=; b=TOCEh8wgsGz5EF+4KtJFr1mfJY
	uVXpq/guJ618DXfWMSwgfgjns0GSGmUZ396ROqwMyWnBPssA5ZbzJzn7qELsUnHbAtyILKUsoZuYc
	MfgeshMM9qEwN+ABTO0xL5LMAIt2olxv+h+6eSYp94c+05c+rcITGsWQtgTMoKhPWYKCLSPIsmgd1
	uFiUM0dpPq2JXvKdJNTfAQqYwqa5sPeq8Gs0gysHmge9RnP6V5lK9+sczysRUnl/1cvaqYkTaWrSe
	cj6thIP9eJQVWp4MWJT1TdP+YOxUkl6qhdu9gIWaeFPLG0oQQu/L+dMjOJD9ncA0VekwD8l2208oL
	BnZwlL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0rp-00000003uyB-1CPL;
	Sat, 18 Jul 2026 08:57:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0rh-00000003uuu-2fBR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 08:57:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495502852d1so421205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365063; x=1784969863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJFiBGt3rnsgbEqpBZLJArMrhdkhs48oNDcrYNrzXaM=;
        b=TSQBXb0MzdUYaeLUnoor/FH1Mf6yJsfOhFRHyXTV2Lip/uHjcUJtuczA4/R9Wj0nmM
         UIdU3R3lvf+l4tiLw7CfCHQqrnnzNJ4N6Fp8B7/cyYXDUPpgHQuSwX89hVpPvXFGLtVk
         CC3AZ0bcmOhsCffqkxmMJxsC6l+FDmW2NXZhFNvnxiaBe4dnvgvYnF7PUfd5cd3Qvg2D
         3a9jlXGPHVGSflZ0A39l1bxevLrT6NzhJ2GEsWOoGiALrD+Q6EGRpFUmszATFprmiPBp
         0rg451IFJY+MRuSJDPd/aMC/G+M3RCxAlE27cb5VjFyAudU2NFtiB5IxM6k0kns3PbJB
         AAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365063; x=1784969863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJFiBGt3rnsgbEqpBZLJArMrhdkhs48oNDcrYNrzXaM=;
        b=JyrPxckfTOtZdbtzQCwkt/nV3oqOGPtwedY7fR+QLgYggE/R6xO15S3BEOxWMILdst
         uzQxDf78INjrsEKFUz/g18mU+xh0Q6ifwvcTm+P2z3rur8EhqT+3v+FCiEqFTFmuPIPJ
         IhsnZbUJdNz9lDf7BVkwS+EoAB/NQTap5or6QI9kc/LvC/IXz+OlCjTJVo92GGDN01Ui
         oYer30nYCQ1hmgryyLc/j0H38GcUM6zkYp+EVe2d94Yf+TjQnYdWX5yTOp9oLFZJd1BM
         1ed4shDciMJMa8lSwlQjdyF7+/5tK9HJpqW2gY0+nA1V/MBA90m9tsdtEmJvyejuIGKP
         Nccw==
X-Forwarded-Encrypted: i=1; AHgh+RpWff9LOIX13xJVJQSg5Q774TQ9XsH7X5/JmExCRDMnr60DNsLWdKDfW1evTbkeDmdxwwGIos5PkkuU/L7loVsq@lists.infradead.org
X-Gm-Message-State: AOJu0YzXD5iRyU4JI65NFe/XsLf0ZbxAu5+x6L/39/Th1smyrwWn4pTO
	2wvSKiXJG3fmLMPc9nVdtzo/pIKZRvjtj0ypie/Y5RP8RNDjmiIOs5DTI/Krqwca
X-Gm-Gg: AfdE7ck9iClLtBNtcsGM6sN7vLPiDUIPyZgbFf0FxVfObaNJ0506C793D163zzz2dux
	v17rjOwA9yYDmUIeejA3r/TEH04zMCqr+2oadTr9lrM9MK/hYEKaIHkkAdjk1CP8aBCs+FzStB8
	ie1V4utrXwmXk/umAPqaBHLYbZ1ngGdi/vDMf2RVH7hDW8r2IrEM8EZjh14oc4vA97ukXy0A4Ei
	sE8bdPVeb+nIGA/W3ZIHLyRRq3/9fKtgNq4AjLx2oWVnYfL5naNyHTB1xwLKSxhquSubyCebjwy
	wbftf/oiD1X0KcAAiClkHZ/p4N7nzDemP/j7S0NNxW9+XFjPj+1jCIIdnLfy00GL/nAoQeNUM/g
	tfXXemvXhINYRS9XajOFN9AAzZGtXgr6GjMm7hMgLqygAvOvDhDjPf/z9PU3HHpshqg2kfpddEd
	s28KBK4dk9qiBky+jlOhCkgh2fL/Le3qaoIHNciZoYNJAjBYJwtFLBS0i9KZXnxxICBrqlgvge8
	QiVeER+Aw==
X-Received: by 2002:a05:600c:4f4f:b0:495:4856:4308 with SMTP id 5b1f17b1804b1-4954a513fd8mr52027345e9.8.1784365063203;
        Sat, 18 Jul 2026 01:57:43 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:42 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Sat, 18 Jul 2026 10:57:24 +0200
Message-ID: <20260718085728.6797-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_015745_723883_887DC605 
X-CRM114-Status: GOOD (  14.74  )
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

This series adds audio capture support to the Synopsys DesignWare HDMI
RX controller used on the Rockchip RK3588: the controller's audio FIFO
is exposed through an ASoC hdmi-codec device, with a periodic worker
that keeps the local audio clock locked to the incoming stream by
tracking the FIFO fill level. Together with the two new dts patches
this yields a capture-only ALSA card fed by the HDMI input.

Validated on the Orange Pi 5 Plus against multiple HDMI sources:
capture follows the source sample rate (44.1/48 kHz switches
included), survives repeated stream start/stop cycles and SIGKILL of
the capturing process, and stays free of FIFO under/overruns via the
clock tracking.

Changes in v3:
- Restored the v1 audio teardown in remove(): the worker is only
  armed while a capture stream is active and audio_shutdown() already
  stops it, so the extra flag clear and trailing cancel added in v2
  were redundant (Dmitry Osipenko's review; the v2 change came from
  an incorrect automated-review finding)
- Renamed the ACR read locals and added a comment documenting the
  register byte packing that makes the swap correct
- Dropped the get_dai_id stub so OF-graph cards resolve the DAI index
  from the reg property naturally
- New patches 3 and 4: dts enablement, so the series is testable end
  to end (requested by Dmitry). Patch 3 adds #sound-dai-cells to the
  RK3588 hdmi_receiver node, patch 4 wires up the Orange Pi 5 Plus
  hdmiin sound card. Both can go through the rockchip tree instead if
  preferred.

Link to v2: https://lore.kernel.org/linux-media/20260715200834.8486-1-royalnet026@gmail.com/
Link to v1 (RFC): https://lore.kernel.org/linux-media/20260715051939.64652-1-royalnet026@gmail.com/

Igor Paunovic (4):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support
  arm64: dts: rockchip: add #sound-dai-cells to the RK3588 HDMI receiver
  arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus

 .../bindings/media/snps,dw-hdmi-rx.yaml       |   9 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   1 +
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |  20 ++
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 271 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 5 files changed, 309 insertions(+)

-- 
2.53.0


