Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3557ACA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Gx2teK6F7i1hMuyruZkpWGT+vGdKN46w5EzNWLw65c=; b=YSZmdEXvzaDVQ3hkr+CZZS+n21
	ef/G9VjLO/wKluyuJBg8xUOHo0VIxtBIq2OhKZH0QaoL5C0OgfWJGVc1btFXPTuz6lAyjzfOw47ne
	yFMAIEXDgYSh1ZMM3F8jqdPpOOHuIClL7umi0WBXeLlOWQh71XuCRbO1v6b4LcUW3d57KTK54fRTy
	DP5HO2F/jDSq0DP/69uLxHdJPAFczD+2dN5jvcInn0PYKoyLXbry2zQ8bE0R4NiXzQ0NSqGT2aoam
	jgXdHQ/bMO+tkM6jf+i2/axQyvCMYw1sFTTfo+FODuUK+EYLGgppvg9YbM60KXbrEDNtKY2xT0eAV
	tGokPvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgh-0000000BxAN-1gTc;
	Tue, 12 Aug 2025 20:33:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultgg-0000000BhsF-3KY7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 077A3461CD;
	Tue, 12 Aug 2025 18:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96EAEC4AF0C;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755023129;
	bh=63ifB2UNg7AJZpvKq4iGRrTwpRB8tb+yLkJzjM2n5lA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fk2zgRVrLT4mojGFu2aLBKsIMMTKCINompo7OsWLUwFRq0XC3D0b4ULuZrwavryGS
	 ZCNN6RIZ+1EBp9FU8tIdgVEdHApW6D7NeYiE6E24td8WQsuoWXVoZPsdyIcoQ1dZBs
	 9fDdTgIapMkHSwe3tN5RXy7uUARwiOORJzZYtLz2o+U9b5b852/XpCxOMfgZ6faKNo
	 5tS0Y4yVp3TEoXqE4frEuwiGA60VTNXFgeR44GDh2XxHM3O9QY+D9HWAkRxuxhd5xW
	 qw7ZUkJdSy6pzWoRPL4wGQZ8UvvqQzM7wtoSb/wZB4CWBs70/f+HCl+Z1hn64bU53d
	 s/xQitVDbIJPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C6CCA0EC4;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 12 Aug 2025 18:25:17 +0000
Subject: [PATCH 3/3] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-wip-smc-rtc-v1-3-66a8e96dad60@kernel.org>
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
In-Reply-To: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=63ifB2UNg7AJZpvKq4iGRrTwpRB8tb+yLkJzjM2n5lA=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8bsdrFXpbt80jVMT1u8Pu6utUjNomDqHVOZJv03zlH8d
 eJH7BZ3lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACaiaMXwP0q1O2n15tUtrhMK
 sxfIHuz9HJFxL9o7mSWXecluFj3jNEaG3ie6ZVHZ2RW734dYft+yN3UH283TK+7zW5luqSzmLNz
 IDwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_112530_877062_B11F5F46 
X-CRM114-Status: UNSURE (   9.09  )
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

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2abcfa6a730f58d5c6b9914f22f00b0..f715b19efd1679e5cd384a967d6e2a7c261ee679 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968741b745651e5133dffa7d8d20f6d..59f2678639cf47f469dc699c0ecb5b9e50a45ab1 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af1f7760088aa552589494d67347fb..6bc3f58b06f703ed79578e89a030929a18d57796 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.34.1



