Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34507C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=olVi47cfDDwShzUFdBWycem44Z+dyrHJb9D5B3ac60w=; b=ImGUa2S/HkFMCJr3nAZSy2vkr6
	xgTfjezN8zKrvN18FuASIxm4fxoxQIvDBvgAfsAfBEZ6SNsm4YiTsh9VCk5B1ACY9HwlzO+R2HroR
	exLmzJqGKmdw8vjhFw0pPROoPSQsNFdLJR9R28yXpg3hAiMZD/HDCP+Z43WFe1b1Vfkj6XGlSKfOE
	ByC7gFkn68qcoJQS3kVNmYaxEJ/OJSlBsGt7tuJ8lejA2ZjyNfOh/vyRO/sf/T7wxWRQVJOGR0C5/
	4BVAuMI9bDdG/nV2JhgIJEKR+93cNTUKjKXdP084KiTsFNgd3GEgH+JDOp/BCnDJ5Jj6D8YoiqgUF
	6DHWNaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4AZ-00000008Y2R-0A61;
	Tue, 21 Jul 2026 06:41:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4AV-00000008Xzc-2WAV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:41:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4706f016316so775837f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616089; x=1785220889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=olVi47cfDDwShzUFdBWycem44Z+dyrHJb9D5B3ac60w=;
        b=XZwwSdCX3J0HuDJTe8pQink1u4AOPTEF104ikmFayKU/kkreryPbhjEBGgiggQc2IH
         WusEz2yolnwbcl5rmfIZXGZDIxo7lfQVBTUStyKHpObo0Wh0tF5fENrO47WHgEkUv+qB
         pzX9H87uj/xLuYAADJDKXuFDz8ET+4vYzawqbeMimZso3mcJTc61SB56I+qOQwVJnQXE
         j7LkZImWvWPuCI9bTB82dRZg1yeK1o3E5LtBMXGC4XDpBZZtmzjDTbeiwLjq7vYO73Dm
         WzE7cE7kunHbduSCyyR4fFTj5VEaT7i3UJ6NOroqRrGZVWrd2jg3miuapsE7Eq1n7kAB
         7F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616089; x=1785220889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olVi47cfDDwShzUFdBWycem44Z+dyrHJb9D5B3ac60w=;
        b=GqyyOx9/XkM2pNyh9H/KtDJPZA+OVQDoH3zS7m1I+DutUWgttOy2gfAxg2RP+CXRaR
         BFCzhFViFUXQuQda4UO3iyYuwbS9jCXoLHeWzgoqpOpk5Ly08q81rbdhQIgaTC2xp7Di
         7f+35GodZLKcUkrPy1xqdajnqdXkaUdzOnU+RKmK51oeenlq7y3xtpz0S395o582LHd8
         CvTKNPVFWeKRw2Hne7Sl8PaNA+jcomh/rQbPztkaR9cugJGfLwOr8ILucjYBMSVGodqy
         OXLv23XtrPU5wflaDxParWVVQ7AO5gn1/XKkFSQutHzB6awfnH8+dxG4V/xxzwb6HnZL
         x7tw==
X-Forwarded-Encrypted: i=1; AHgh+RpS4UtDVlnIf9LlDnfORDMvct0wfqvHGh44Sje3xl/eiB32S1PQcLR3XtsLgTNSh9JiIl6szd3TFSasmDwPPg1U@lists.infradead.org
X-Gm-Message-State: AOJu0YyuTqDmOhR/sqAZc0qkfbM/cv/GPzuN4/fT1ogsws6NxhYB+s+y
	Qfpu71P0D7h9ghkZVj074MSUfCsBf70RvKM69fyn38MCGgl5rumYcj5g
X-Gm-Gg: AR+sD10tyftG+erhCUI1Cf9xvP3YhVuNSpZpYJyVRaVjMf8nwhuYoO1/GOKn+Y9Bd8R
	JNlvWtuSfIyr/OjLLni4+GQ+jzhDqA/xrKhOlqGnY27igrH6YnGsLAoVSsO4S3TPFsbmOeJ4sd9
	pD+s0xr/JZxCxU5V1FcoU6icq4F4JMdPbTOaJrItfJNhJw8CKvVWQZlZ+aTJom95pNQ6N5Kxno+
	TMOdHt0fAz4ts0pnggcbIpSryAb8FVVlJ9ZNVn6PBqtOSM77Gm0TwFsFSM4BkcYVc2btXRK3Wms
	R7a+/MnEtaPHfU4jbqYjED89s+Fk8vspAn3WB2kB9NlIY8UIOgOJv+0nfw8pMeO6NeXCpw2VByA
	rON4pzZdaKMUKbahcyA65/fdceFxMNwBX/ch7OlB+fVPfQCsw8OhDHLcS2G/61UFHiTV9DKefj+
	fQDlajaOTztFOfz1Tqc+5tTG+h2R480r4lfpaWzkuGjAuGFSwaetRXLW59+YsVT0r508pxwYFl4
	fnrNucMh6I=
X-Received: by 2002:a05:6000:4023:b0:47e:96f2:52a8 with SMTP id ffacd0b85a97d-47f7fdd26d7mr1154379f8f.1.1784616088618;
        Mon, 20 Jul 2026 23:41:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:28 -0700 (PDT)
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
Subject: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Tue, 21 Jul 2026 08:41:11 +0200
Message-ID: <20260721064115.64809-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_234131_651022_8D17F6ED 
X-CRM114-Status: GOOD (  15.91  )
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
tracking the FIFO fill level. Together with the two dts patches this
yields a capture-only ALSA card fed by the HDMI input.

Validated on the Orange Pi 5 Plus against multiple HDMI sources:
capture follows the source sample rate (44.1/48 kHz switches
included), survives repeated stream start/stop cycles and SIGKILL of
the capturing process, stays free of FIFO under/overruns via the
clock tracking, and now also survives system suspend with an active
capture stream: audio resumes flowing on its own after the cycle.

Changes in v4:
- Driver: support system suspend instead of the -EBUSY guard
  discussed on the v3 thread (Dmitry Osipenko's preference). The
  worker is stopped before the controller clocks are gated; resume
  fully resets the controller, so the audio path is re-programmed
  from the last known sample rate and the worker re-armed while a
  capture stream is active, through a hdmirx_audio_setup() helper
  shared with hw_params(). Validated with an active capture stream
  across the suspend/resume cycle.
- Driver: use swab32() for the ACR word reversal; readl() already
  abstracts bus endianness, so the reversal must be unconditional
  (automated review, valid finding)
- dts: the sound card is now a shared, disabled-by-default
  "RK3588 HDMI-IN" node in rk3588-extra.dtsi, mirroring the HDMI TX
  sound cards; the board patch only flips it on (Sebastian Reichel)
- binding: reference dai-common.yaml, switch to
  unevaluatedProperties: false, and drop the consumer comment from
  the example (Krzysztof Kozlowski)

Known limitation, noted on the v3 thread and under investigation as a
follow-up: a second suspend/resume cycle in the same boot can leave
the audio datapath silent until reboot. It reproduces with no-stream
suspend cycles as well, so it is independent of the suspend handling
added here, and looks related to the cold-start behavior described in
the v3 testing notes.

Link to v3: https://lore.kernel.org/linux-media/20260718085728.6797-1-royalnet026@gmail.com/
Link to v2: https://lore.kernel.org/linux-media/20260715200834.8486-1-royalnet026@gmail.com/
Link to v1 (RFC): https://lore.kernel.org/linux-media/20260715051939.64652-1-royalnet026@gmail.com/

Igor Paunovic (4):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support
  arm64: dts: rockchip: add HDMI RX audio on RK3588
  arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus

 .../bindings/media/snps,dw-hdmi-rx.yaml       |  13 +-
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  18 ++
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   8 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 306 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 5 files changed, 352 insertions(+), 1 deletion(-)

-- 
2.53.0


