Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6953ACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f7rAIIfQRjf/DZlHIopzmqG8GHaCqWeari8L74hauSs=; b=aAxu5w7Rf64/u7ghw6jG/RKKfk
	rvA07a7FuHI+LDtHFALHEGRJmRmA8X/6Ctw9bDipghsDSTvADjT3RvumNaYanJ1EIXPQt3oKcbvfi
	x840Mss92wf0oLYHHZfhPuVimONVCeXi7t+g8Jrp4+6RuQjLhlXxYa0AeX2p0xsi5E4x6gUPt5IDG
	yF5mi3fwS9wP7XffhCIeGMxuTJc4n63AiAqCo0ZJfI0YTjcxxvDdrsJ+iuN6BlGM/FfD7ENMADPrJ
	07a0DLRB2TMvmsO0R13Wi/UXT4fAii9SWbN+bKY0SQWT57IOAe+E2iTE09BY4d23SgKgdVi+AgbDx
	FYmie27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPv5-0000000F6uG-0mDd;
	Sun, 04 Oct 2026 17:22:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPv0-0000000F6ss-3ieu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 17:22:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3a49623b865so488499a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791134551; x=1791739351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7rAIIfQRjf/DZlHIopzmqG8GHaCqWeari8L74hauSs=;
        b=BZNh0Kp7PsFGDPKlJjmq8/qsFSsJOeiQgI7Ijd3pStENlNeId3zHxJ8GikVwshY4ng
         5+mQ83X7CwscggvHgh+oCbYtqK9HViA8ApHmDzAWx6v+8Nirz6rjvlhtowDKg0qwNdHv
         g4c8uSHUtHIzzySEFICc4LYq1nm6Z6asYNiFONf8QupAM45mqwW9jN1blTgTd88NOGDY
         q5MLXF3HOH8/dYKZCIwveZCXNx+lvW9N73OhpIFYD8VbknsrO7Ri8TOWspn+bEJESMlw
         1C0MDLGKyn1+YqDqJHCt+7i/zkVKW0bC1Pyw1Dz3l4yFiZJr3yoJGJ1kMaOQ02tCLf9M
         ji6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134551; x=1791739351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7rAIIfQRjf/DZlHIopzmqG8GHaCqWeari8L74hauSs=;
        b=0qMvZhM6ArubvK3lTwlHkSQ/UiZeg9yjSTm9oxYXy9mYwxKVi1+yC+sp0cozAKpPrm
         4G+xS8k/HAFFM761YhFAPSmxwHSZLwhDBk/vBA7uLj2fXtVwvYVMuEFiSmno5o3GdqTv
         Y9XNQIoCRyBPEomCPr42WKL4JnhmFI6J1Ms8ao0NfvssGChzpqQ+uvPyjhxaMxN2mpwO
         2yZg1HRxX1q7N1aGsMJfnXIJIFmaKdbphW3mTGfJah+x+/VagXVRYl29khs9IWWh5ax0
         7w6SEJCFUvnN+d2UsrG6dyasA6X3i4vN9Z++kvtz1Jym/PRuaL2y4HPI2kfJCNeXmykn
         cG9g==
X-Forwarded-Encrypted: i=1; AKwUvBxKxRrDDlh07I/pXQxB3ifhDRajuOP7dZC4CXZgWer2uOZf/r42xGsg3w0x8f+cWXjXkJ8xTT3ntZM2isBK73gU@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5W59ySBhUcDujfAB/kq2FvQTFcdtVI6cGB8X4IB61NL7wpGYy
	V+L2RFrD/b9fOeSicxmhFrPKHBbiodc4QOlkxlHUl0TKRF7UP7V9Cz/W
X-Gm-Gg: AYBFou3qF6cEdpjMgc7oEaSkES7zYjAerCuJj+ljFDGMfzA9u2U7YMEYfWDZkNxUc4X
	QrejhOopWn79+J6kSNbifnziJOhbgxm0gh/2tWEEEOSoihOngNEqX5OxIEw72S7aT/cGT9093gU
	KDr4C+5WSqnguPgVDdAbsbppb7V+GkdsMtsT08KzFYf6rQvFIP9F8830tI5+BSbdxd4FclSHRKt
	XTBZhr69ZhzFxhNwXU3D9FznhFc3N9255HJ0gzM1W1X2eT+vxvVn/wQoeW6PXLr8qOiJCjjKLI3
	S6bphxzU+ZW6fKW4pGxXg4BEnLcLn4u/7aSz4CPlJmOvoa7nqAolaRM7C3twomIfd718inNCgko
	zkAiLut/uQxqiTeM9Im4UgTJs8X97ROEBtucdHXLRVa34QZt6PJWkDbhIcgAKpLjm45jXUlRdlY
	4HapbuDWmQK25GeN0ug3BYxX1ASMcjf7kYu6lF9034Su6dcNvZPB98/VCOA9yWFW4qHcUZFrOxj
	+RovfpLHAmAGg==
X-Received: by 2002:a17:90b:4d:b0:3a4:aee8:76ef with SMTP id 98e67ed59e1d1-3a78717db57mr4586561a91.21.1791134551329;
        Sun, 04 Oct 2026 10:22:31 -0700 (PDT)
Received: from SonYoungWon.skbroadband ([121.125.40.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd4bd483sm5847677a91.4.2026.10.04.10.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:22:30 -0700 (PDT)
From: Youngwon Son <yoson5375@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Youngwon Son <yoson5375@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Enable the NPU on ODROID-M2
Date: Mon,  5 Oct 2026 02:21:15 +0900
Message-ID: <20261004172115.5105-1-yoson5375@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_102235_995412_E3D07F18 
X-CRM114-Status: GOOD (  12.04  )
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

Enable the NPU cores and their IOMMUs on the ODROID-M2 and wire up
the vdd_npu_s0 regulator.

As the regulator is now controlled through the NPU power domain,
remove regulator-always-on. regulator-boot-on is not needed either,
since the RK8602 state can be read back.

Tested with the rocket driver and Mesa Teflon (MobileNet V1).

Signed-off-by: Youngwon Son <yoson5375@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-odroid-m2.dts   | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
index 4e98fa3349..ea4d86a588 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -320,8 +320,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
@@ -441,6 +439,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
@@ -514,6 +516,36 @@ &pwm0 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8_s0>;
 	status = "okay";
-- 
2.43.0


