Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A983C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oiQL4vtCj1XtBg7pGMq7wHVCDTKmKNmeHi1gPKpQ8jM=; b=hNFddjS5cj1lEBNiDlqyQjSOa+
	4CxogXTUlOv/elBe0tI+LOXWSqr3ZyMN00FTUFp8N31wqXhvGhs9bFRHZE1hlLnyBrT6KKLwxAIcA
	EdWfbcdHg0sUljairF07vPNKDifYpRPinjovyLwOhFMN9wRFrdYPGLIzWe+WYKShrS0iPNeUfho5E
	0jubSU4L5EOmiNWs+buYffrwOWHxEDLP1nV/+kui2f41/mBXCBsxqJ12WAIMXVP7Bm0c0zPrVaZjj
	nt0PCED2Ylts9dO72yhz6fWVIf/HwBDtwAjlPkddBPHb8y3tjQZ0ijTKgKfYVmOAXASTUcC4OnLt3
	ox9kEKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLOv-00000009ngS-2FAg;
	Thu, 17 Jul 2025 09:59:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKw9-00000009jQM-1TO0;
	Thu, 17 Jul 2025 09:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8283F601EA;
	Thu, 17 Jul 2025 09:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C367C4CEE3;
	Thu, 17 Jul 2025 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752744596;
	bh=BSK0uIAcmO4oPS5QlKIFn6TVQZfBtcq3Y0E6j9kT5u0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=k3DjxbjHiBnXKDWDbeU4sh6wy6dGKnkrK/K90bPDsn8nRdTPYMOXN1M6NCCcWFvGW
	 X4L36ehDXoxdW0teWmyntC04XTzyKOFN2GYkamarDOa1Um8qOIDcdMEllBhKbTJ9sz
	 pEbJ7GVg2EmNQC7kvrahZvzw1OFuCYGQbH3FdqFWKgvsNEXGY/KltIdGc9TNVmA8iy
	 0a3CoFDsru6mp1vdBlWo7Dn+OZhXjUpN98IidcXDyhnwiJCpuoLbiBfCTLKsrExnGu
	 QoxXZ8dagNkcUh593fPM1igXd914U0Nf7dhc0H1HPrcPdjkNK9b3NVSPhzdfbI5Rro
	 6Hl7CoAgQJYLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2204CC83F1A;
	Thu, 17 Jul 2025 09:29:56 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 17:29:54 +0800
Subject: [PATCH v2] dts: arm: amlogic: fix pwm node for c3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-fix-pwm-node-v2-1-7365ac7d5320@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAJHCeGgC/3WMQQ6CMBBFr0Jm7ZhOY2lw5T0IiwoDTCKUtKZqS
 O9uZe/y/Z/3dogchCNcqx0CJ4ni1wL6VEE/u3VilKEwaKWNsmRxlDdurwVXPzDWxKO2d9fUykB
 RtsDlP3JtV3iW+PThc9QT/dY/oURIeDFKk7WWR9fc3PLwk/Tn3i/Q5Zy/MEzEaKoAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752744595; l=1176;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Gl5aQb1KI68vaz1xI6GSSxa1gnslD6ZLVXgkTOwj19o=;
 b=ndz6krIm5rTHcF0VCgZszdjiIhZ9+NkgcPqV41Y1+BuN0ax4ZI3OVdxiPxYwolQ3HkunwrNXV
 jRLiAD5X/tdAi+pBzR4xvpRvheVKtmMezVlUdfm5OusW9s+D9+EZ2ya
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Fix reg address for c3 pwm node.

Fixes: be90cd4bd422 ("arm64: dts: amlogic: Add Amlogic C3 PWM")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix c3 pwm node reg.
---
Changes in v2:
- Fix commit change-id about Fixes.
- Link to v1: https://lore.kernel.org/r/20250717-fix-pwm-node-v1-1-45021777efa9@amlogic.com
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..71b2b3b547f7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -792,7 +792,7 @@ spicc1: spi@52000 {
 			pwm_mn: pwm@54000 {
 				compatible = "amlogic,c3-pwm",
 					     "amlogic,meson-s4-pwm";
-				reg = <0x0 54000 0x0 0x24>;
+				reg = <0x0 0x54000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_M>,
 					 <&clkc_periphs CLKID_PWM_N>;
 				#pwm-cells = <3>;

---
base-commit: 58abdca0eb653c1a2e755ba9ba406ee475d87636
change-id: 20250717-fix-pwm-node-61ef27ba9605

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



