Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB4C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFrJLj18UJdxq+mrgR/d/RjhP838Qu4n1KrCTvahUpM=; b=i5D3gJE3MkHQrdzs9cMwiy6f4w
	1jVikOYV2zW5Oo1XDRlj/CGfZkJSscIMw+hrQUZpKWG03I5JC3DmL2cZ9htv/8TeoJLZipAOr6ZYB
	uL3cqcF+dY5mOFSufw3VUHCyScdiGl6n37SHU0HCNLO3438A33RlQVTQwEIB14mku+X58Y2iMuf75
	BouH9Y0fRIocHL1rX6+oiu/6yWZ9kwGKlnpmttcX93fYctCBC35Z7oMIFBGZjWe4feNmmXshHJguL
	ie9zEb4haWrxaUzubzuAq2YcEwaqlqn3K6IBVl+s7/QCCDWQZdFDS+bODtllnWmPwe0Qbz9hUd7SJ
	ACTSJ/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm2w-00000007h7P-3A2E;
	Wed, 05 Mar 2025 10:32:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplak-00000007bXc-1mfa;
	Wed, 05 Mar 2025 10:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=SFrJLj18UJdxq+mrgR/d/RjhP838Qu4n1KrCTvahUpM=; b=ce12IDh7WbjhbT8FaupfUSx/iw
	k+IBNB8OPV3U2vQSUsCWsZ8mYVe67eB55YVhUA2izjrjYCHNipbLYGjr8PuLKR0y6MgzD8UBafLEC
	oYjJz6WDKsk4hA/4Hxh0ATChfohjRfVQeeMQPwMSmtO39EFXBLxnAYBfrWEeyOc0MzKghRri4XAl7
	hADLl8R+bfT8KEyIkeQxcAPLAoxOI1QDIB/r2+giUfifp9ckZVbr4LoJLhLU768N90R/R9cno0Ybs
	TchdORc/CqBSGjkOJv1b/xyQHse+QR806mq1akeNg0W3WhqwVhKs/gTFoiXRnf0fFa3zaTn3hmRWz
	+qpyDuRA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplah-00000005Fl7-2Yqc;
	Wed, 05 Mar 2025 10:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C3CFA453B9;
	Wed,  5 Mar 2025 09:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73786C4CEF2;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741168979;
	bh=qch7huQ3IX9eDJtDp+CrMjmAYNzCX1pjwyDdnZ1GCVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AhkzWp9ua1HWcqtPPxpbXBW3gcazCitDXxmBOabSxJmBRTdowWbdesbo++NyMGK8K
	 U64gZ8f0qUhws4DU4cN0D7/spPo8gApfdv8NnsOgSJFz5noc1tsm5mTtVGBOJZMnbZ
	 C083xr4rNWouSy/e9hW6ueR9g7fsBufH64sb6qbRjntSWacc9pA+t9GcDDlsDF9Sbz
	 M1baqtHTBH+yLpDVXL5DFy+PFKDA1ihXCRCnhko0NAlCEmzFh78XhvhFIu+mfkhUrj
	 GxEXCP1tbbE8ja9jJssnXdIbt1rvyJXVl1MWXssjBg87K0TBl9q5bHVSrbcdfqHM6s
	 rFtLBn54wU4wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66706C282D9;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 05 Mar 2025 18:02:58 +0800
Subject: [PATCH v3 3/4] arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-irqchip-gpio-a4-a5-v3-3-1eec70352fea@amlogic.com>
References: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
In-Reply-To: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741168977; l=1190;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=QC+CPrCwcCU8cBlAO137f57knOzl0UVfLJyIMFfXkFY=;
 b=PoBdOcPfugu3ByNyFY44yiXXXPnNKK9QME23lhCHLCeELEF91iF0e9U6ZrDk1ZLY/CUMvRWcA
 Hk34oEI7ZSYDG/67Yf+lU0iZLcEbIT4NA2nduVlP9V2NV/p3a8TFN0g
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100303_761585_1668D4B2 
X-CRM114-Status: UNSURE (   7.69  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add GPIO interrupt controller device.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index efba8565af3c..fa80fa365f13 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -51,6 +51,25 @@ pwrc: power-controller {
 };
 
 &apb {
+	gpio_intc: interrupt-controller@4080 {
+		compatible = "amlogic,a4-gpio-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x4080 0x0 0x20>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts =
+			<10 11 12 13 14 15 16 17 18 19 20 21>;
+	};
+
+	gpio_ao_intc: interrupt-controller@8e72c {
+		compatible = "amlogic,a4-gpio-ao-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x8e72c 0x0 0x0c>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts = <140 141>;
+	};
+
 	periphs_pinctrl: pinctrl {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;

-- 
2.37.1



