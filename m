Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8837CCA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKoAFSTyhxJJ9frySV0GsBnYnyW00C156g62nhJmL7I=; b=UEx6f4nqJJzCt7uImJGU0F2fyz
	5yKVSlQzjMFgDNlf97GRteiDtxsEMfzWOv1oHgcMTdIwja/R3QyQ9uRzowEPdOI7hD+w2jVqumu2y
	im7fP5hSZfs7y1ow0oLGe+DLsxi3i3oTvLRXCGA4eItXEY2vL4qdlhSA2jAxy1nRbO7PIxqV8ojkG
	ZxImX8/8OCOFww3F3zQa/3oKCmO8MEyfvL+H7ZjjBqOWwc713PTewaosC8p6d/BmaloPKSF84FZj2
	i6tMsL5uRzWmDgTVKGP6DWqyjGO4EBBZq5fzjhAkhRQ410s4g84RzBQqYZDrz2mV1QTrUBXY5PP/x
	l7XBehtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF0L-0000000184p-3U7e;
	Mon, 28 Sep 2026 17:19:05 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEzu-000000017kv-3ut4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:18:40 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b926f0so2099486f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615917; x=1791220717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKoAFSTyhxJJ9frySV0GsBnYnyW00C156g62nhJmL7I=;
        b=r+aXL8/LYcgD7osVTvxO5vNSvaodC4Lgfrp8jbC4U2LcNPrl8k1c1puJv5bakCWYoV
         EhVXqTHbH8z0maM5LELSis5ibrsEnCz+mWQ51Fz5NBNkyPbx6vLlJuUbIdBDBbT4wxwP
         0CKah7KcXZ+XFYdYaNZwJdxS28J2SQrhr8xJchofx0Y75S6fE3utCLmnaox4JeC8JSFc
         VNY5vh5GB5tXt348cvz39l7uPzV2RlxPlvLBHjXa1VmPY/X9PkUau2gQg4u2rAX+Jh4X
         n5JirKuOJ385kVZHvTBiFFu9CLH5MrfItFB4NKPWwW/Zo4tgq9oxCvBRZ6qoEsQh7nbX
         h05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615917; x=1791220717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKoAFSTyhxJJ9frySV0GsBnYnyW00C156g62nhJmL7I=;
        b=sjw7vs8HVwO587HHyA2D5Plkzo0f1tGlr6/F3C3R1U1B8pQv0mxemE+OQ9ww5HXkwc
         kRr3MpbEaVNYUaCzUsu6fcxA4L6VLRca80jsuXTiWc+9SjD+/YvW3ko+Ldn0AkNoOXea
         xVVP7TQk0e2yENN53z8AlXcKuCiTexZlo1fY4hzNnwONVxhzJNWXBzw5wgY8sSdAJMIv
         e0BiAYUIZXzAh321yTjopU9ZQAAMzBd6WK+lhyES7Di18wse6hjCq5uQz8eI7RyqVEbs
         i+4G7nviNN44TI+tzsOSP70vZ6vNA02PS4V2MSCqFk8Q5v7pYhY2eTTjNjOIc5Rp1hMy
         tDzA==
X-Forwarded-Encrypted: i=1; AKwUvBxVWIei6oSQ4KdrYpynbNzhg0F1C9Sdi8LEBzaU/+qsoSwVsGyWshxagTDSWxygq13JivD9ukYwkOvNmrQj+bFm@lists.infradead.org
X-Gm-Message-State: AFq9FYKFrm4/lvF2wTMKouT70fLjb013kBjdPr9qCzaU7T6kWog34NmY
	Ii0LTDCItaty5+3Qq8nnyXOlYulLm/1KE4g+eyWumt8W+x9cofuuxnrJ0Za3d/bMZ04=
X-Gm-Gg: AYBFou3o1XV1SYu87KW8rkqsk/cfAOCiZoL7rMZtNjzcMDxxlZuwnJT7TfoLCbVFLdh
	FwfRmIKHFW5jurUw73Raj1LpC9ZXph4yrjpdHBz11+dfPY18Lt/S3E2Ia5v1OlKTGvlhTMEsnA9
	XZTVx2ap5p1j0f9ACOHcHorpbF8+C0cx7XNfWsH3ea52DUMgkfl2XeLdaMTqGn7uWTzSGpu9OJa
	8Qr6VfklwPNn5JKN7AVJDmn8H2+cMxqq+/pmhBUWc6f50diWeCHMMrIuPNsMRukrykQPvctPSXs
	N8TeWTHoQpfEWGPcR/n+MLKYmM+4Cr15QyfTOIabeNuGgFX0uGY943aH7ErATA4RrgMlghYmb8h
	lb1UqXqmnSMGFkU8EUOqksKAU81RgtvKue40/lNvpJV44HI7LRlCKSc0j5FbcKSLqgLoVaWskUt
	dRyRDaC/1zNBFkyuN+Bu9TTuvN5r+CU5lyOdD2Ef4zON2baVyDPbOk19WlWvgxCn559nxkzOg7u
	3LYztWvLo/r45aS
X-Received: by 2002:a05:6000:2211:b0:487:a3f:1ea6 with SMTP id ffacd0b85a97d-4887171417cmr25452794f8f.11.1790615917277;
        Mon, 28 Sep 2026 10:18:37 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:37 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:20 +0400
Subject: [PATCH 5/5] arm64: dts: rockchip: name the reboot mode supplies on
 RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-5-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714; i=alchark@flipper.net;
 h=from:subject:message-id; bh=GSDTTVtVozpx3VJNNfeRSYeJA9UCPSmKB3J4qrce5Vk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhhfLzE1objgdFrER4kj67Xv6uS5Fq0Sv/X5CXc90
 9eGpgnrOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqb6cZGRauctbcWyvRt/REtjnT1WhdyZehG1dG3G4LuafFJPFC2Z/hn7JD+Ey
 HiZqxx79dfRSpsVRALGraiop3H688uBfhO/lPBisA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_101839_011639_34D34DD0 
X-CRM114-Status: GOOD (  14.11  )
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

A reset that carries a boot mode request has to leave the mode register
intact, so it also leaves the regulators as the running system left
them. The DDR firmware that runs next configures bus QoS in the
interconnect, in CCI_GRF, DDR_GRF and NPU_GRF, and faults if a supply
behind any of those is down. The NPU rail is the one most easily left
unpowered, as nothing else on the board needs it.

Name every supply those blocks sit behind, so that requesting a boot
mode powers them regardless of what the running system happened to keep
enabled.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 4c82980a9f63..55951f290906 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -957,6 +957,22 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&reboot_mode {
+	/*
+	 * A reset that carries a boot mode request leaves the regulators as
+	 * the running system left them, while the DDR firmware that runs next
+	 * configures bus QoS in the interconnect, CCI_GRF, DDR_GRF and
+	 * NPU_GRF, and it runs into a synchronous abort if any of the blocks
+	 * is unpowered when it accesses them.
+	 */
+	ddr-supply = <&vdd_ddr_s0>;
+	ddr2-supply = <&vdd2_ddr_s3>;
+	ddr-pll-supply = <&vdda_ddr_pll_s0>;
+	ddrq-supply = <&vddq_ddr_s0>;
+	logic-supply = <&vdd_logic_s0>;
+	npu-supply = <&vdd_npu_s0>;
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sai1m0_lrck

-- 
2.55.0


