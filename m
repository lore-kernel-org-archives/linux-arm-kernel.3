Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDDFCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/TwANByS8GbPPy4BtdqH5o/3ijPPSO7Y5K83ExNaD4=; b=iAhLloGwOktcsZ4mb2gNSwtmPq
	04Tat1qj3AgaAfjjL+PF393VP2Z2T92S8xThfSYExLLomjZnMl2j0McvXLG+SSIPwTlguttN7F8iD
	GykBRlYei/PhEp8OCMqKSxrIn+VYPE3nISeSFZVLgeiryZdOfGr0GXqFpvEfTWV1JdYYOZZUqPTYb
	o0kpU2DpSapENkCRI6FZeykdVoVVEtUTUEc4NqVGcUXJRcb8XfMPns/FrOyf1HIVzUUv17nPNqTpN
	E0EmsabsqrktvQb2/Qonc6a6I/Tg0tghBD0MZi0JC2nxrYSXaSQA4ErDiogZS4LUZ4d00BvEUhAoJ
	sNxZsvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSMd-00000007H2D-1dQE;
	Mon, 25 Aug 2025 08:15:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRcK-00000007AJi-1wKL;
	Mon, 25 Aug 2025 07:27:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756106849; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mEPfe+LalKrrED4ZK5hjFQelQk78dSO66JLcyZz+RAmvLO3g8HM5Pm3SbGFXG4yOXX0/Rm7cmtOYhbujBqyAun+tKkJPoRckkoDxuUeNcbx4nnvdX25nKAu1Cqv2BY9PlDQS+onShisZ3icAiCmCL2EJDB/MDr9s+z0PS3w9Rbs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756106849; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M/TwANByS8GbPPy4BtdqH5o/3ijPPSO7Y5K83ExNaD4=; 
	b=VRMDlxMy6Ow3JvjULJlwASYl3/3F86yEo/usN9SjmdntDVkrDTuXlzJFwEUZ9lGn0SO7+cT/so7iiCRdaouujuyDCRcbCxc/nfptf9efCvtpWnkz7V1i7rdPnFqbcJ7p0lOdv9l4cz5J5qEaLvf7ihGk3PNoooMjpAzHTzZSeps=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756106849;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=M/TwANByS8GbPPy4BtdqH5o/3ijPPSO7Y5K83ExNaD4=;
	b=Idm4c4//UOrazztLZtVF9PkLSf/WuAxutdVS1v3bOR/RjiHPa2EHOZffvBd+fMPx
	My2PtOpzd3oV12TdAHpylBo0CGEjrjW9fawJAi5FzPxPysZ86eABz47sj6Yhhm94Ii7
	aPDtWeWom/MbM+6bfYIotPgU0XXTx9kPzqPYh+H4=
Received: by mx.zohomail.com with SMTPS id 175610684796468.22818037101536;
	Mon, 25 Aug 2025 00:27:27 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 09:27:08 +0200
Subject: [PATCH] arm64: dts: rockchip: fix USB on RADXA ROCK 5T
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rock5t-usb-fix-v1-1-de71954a1bb5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEsQrGgC/yWMQQ6CMBAAv9Ls2TVttWj4iuHQllU3BqrbQkwIf
 6eB40wys0AmYcrQqgWEZs6cxgrmpCC+/fgi5L4yWG2dvluHkuLHFZxywCf/sQm611ey5MlAjb5
 CVe/DR3ew0G+q33JICD4TxjQMXFo1N2dzQ4kX6NZ1A18a/nONAAAA
X-Change-ID: 20250825-rock5t-usb-fix-6b0d04e2eae1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_002748_584361_F6A6C5BE 
X-CRM114-Status: UNSURE (   9.64  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The RADXA ROCK 5T board uses the same GPIO pin for controlling the USB
host port regulator. This control pin was mistakenly left out of the
ROCK 5T device tree.

Reported-by: FUKAUMI Naoki <naoki@radxa.com>
Closes: https://libera.catirclogs.org/linux-rockchip/2025-08-25#38609886;
Fixes: 0ea651de9b79 ("arm64: dts: rockchip: add ROCK 5T device tree")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 258c7400301d7f77517197ab433946bbfa39cf63..6acc7a8a5a12eee9cd3506910b40235813ec43b1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -95,6 +95,12 @@ hp_detect: hp-detect {
 			rockchip,pins = <4 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb {
+		vcc5v0_host_en: vcc5v0-host-en {
+			rockchip,pins = <1 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &vcc3v3_pcie2x1l0 {
@@ -103,3 +109,10 @@ &vcc3v3_pcie2x1l0 {
 	pinctrl-0 = <&pcie2_0_vcc3v3_en>;
 	status = "okay";
 };
+
+&vcc5v0_host {
+	enable-active-high;
+	gpio = <&gpio1 RK_PA1 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&vcc5v0_host_en>;
+};

---
base-commit: 89d926fa53d0a6c257c4e8ac1c00c3d9a194ef31
change-id: 20250825-rock5t-usb-fix-6b0d04e2eae1

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


