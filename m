Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547E8CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcXjW0jr7/qK6CNgi/Q2cQHGNIor+1nf/h/zXx4hXAk=; b=l5iCyGJSG3WawUTFCdgY0Hoo9p
	+H0aioaT4ZCEM8fm35+Rp2sasuZvXQmNU18VeoQxFYRBPt1qwp63V0VEzmWXmaPFb+vtz/lQjC5Na
	qx+7PMdKS85EK1Vnt0tWWutt1x2MP4ztEq4qNhHhZPCjYbrzoRf2l2E4SVP3PklobcQWZYPG0rwOp
	i3hbMzmDOVInLvZ1IDFlB5/qNdzqhniA/FcwFsr+fNlByJdJqYXvd9KRIXLwIpHxZTdjKjJKfIza9
	liTiO3p2jVxHjcPw0CcVaJ95p1gXXm/BZ9CTZ1eOUImHma6kYU7dhP7wfkwz7Nf4IrG1i7ZO4h8Ew
	PxbomnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fz-00000001JWV-0jF9;
	Tue, 07 Oct 2025 05:55:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fu-00000001JS3-1EB9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42118466F0;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09983C4CEF1;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=K+mV0LA83Am8H34UCJxxQEo/9VCQGbqlqQLtnpW2bCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OYKlUm1oyajR1y/HK+mhaJwzbrb3QZzsDTEKnnjQVXC7dvROMyBsv8hlrFYM80Nxh
	 rapEKkyu4AHdX2yNllKQVWL5TAkXE4eCkEolyULClXiju6MSWg2JEeVyi+mNT7KcV2
	 r1EczcEi3WmDuydxpb5IQBDmXQi+PY8w2MTOTefU+F7W8cLQbvXmqzfhLkFVDGizhJ
	 d3C2cF3Vwd3wYv0SGfqhgy1KretVsoYq2EwPuYE1FqXi0HtVdmn+GqhHRXiONFb7/j
	 otkpmnb500TjxVVTnoNbJdHLU9t0AcZ3S6WPGN7QoxbUNsNFTbP5fDGd8bc3LZckZR
	 5WnCdHACmoB9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BE8CCA476;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:43 -0400
Subject: [PATCH 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-2-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=940;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=TAZ8h+Se0PSb3XgiQbE/VSfox9PXBzmPNJ0YRRHz/Ic=;
 b=dHmobOe9t9LEcaj7OJicda0qIXVIGW8QxfHvSJM2RW4OYPe8bRJQQ/yfkyt5y855RCSiokiLH
 /3r7LFYUvIZBEX68feWyq3hdrRzsJx6i3KvApe3r+Imp0Lus9NqYYFS
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_225550_366137_585F7E59 
X-CRM114-Status: UNSURE (   9.48  )
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
Reply-To: alex@me.ssier.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexandre Messier <alex@me.ssier.org>

Add the NFC chip used in the HTC One M8 to its device tree.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 9c3859069aba..4026d6fedfbe 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -65,6 +65,22 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&blsp1_i2c3 {
+	clock-frequency = <384000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 144 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		firmware-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &pm8941_lpg {
 	qcom,power-source = <1>;
 

-- 
2.51.0



