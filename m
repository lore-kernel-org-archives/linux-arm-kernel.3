Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F2CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=; b=KMQnU8V/qLz+GMWCmY2gWWhgrQ
	Ig00AmJ+4LGvfpdJvxjy7krbGMyhlIs6wi247rHCZWGtlj0aTuWD9b7r62967SIh78O65akW1g0QT
	C6qC19sxenYJ3avYKLFMBivovNtUu6rdvq3qw9F6CDKTPobs7YIcJna9bzFS8GY2LJdGD7/W2dcsG
	4mO7eIiFoPRjXMgN4RLRfJGGUCE/aTzKWHlhshqk0BvwYeU/oMmleU7/OqH/vfPzv9W6yxBHnsH4n
	7GknuXOLgjI4pWawxdrd/TL/s2DO9cpEVpr7O5aSJDWU5YBg7tV1EiKWIs4huFqeBOY1saZkcImrY
	2DQePaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4K-00000005qhm-41KI;
	Sun, 18 Oct 2026 12:32:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4H-00000005qer-0zrF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:32:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so6896555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326767; x=1792931567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=D5CUivzEG5vNuURFtocjkZJze/fSKhyTvY73H9WXauzr4zzpy9DR6n21E2LwTQ+Wh+
         SlMHJCC9G5vHBVzts/cgNQya8kozLbyHNyZbvdD2p5d21EH/WngOfZoXIUFnEKI8qo6P
         uGp4nyB8VwcaPY8JBO8j+11+VaZHsAIsY4aOz1eooZtRHxNPmHJRGPcPsIYiIClzavNc
         JmA98uNASOv1YsZTEH5KU6Uqptil1/ExFk2p1fKXhXc8I8lZmyNKCZeuX5oI7tN5FAh4
         WHbCUWyRAc5O9PCqxwEpDlE6Vp2pcDWYibTOu29vvp8HUHlbvpHcSDDteyMEiky2l7Hw
         nYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326767; x=1792931567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=Au2gzXQTdA0AbTJ+ICc1g++G0vzXob7MRWwApPs6i1nB5t/z7Ff8IVvlNh8zvAj6yD
         gk1u+1IiMTdP+aOz5GFRoLVZASsik3FkwPRIU/0Y+QEdsXqM2H+z2b88zl/QrQDckh6l
         5UyhvCbvDn2v0I6u4eW+ir5F9DdNHN4fqJKBX+yXJ44wYeNzRbqVNIDOsWid6P9ljwE6
         i+7zgOdtcYX1QxMxhoH4R2dYDnPF8OFRdaIo3ixCW3XpkbO/Z6DqCWTm0a3YBfCqgMvj
         goB2u57lg4YalAlLaqUM/ywwboZWbLtwuo51mfV/Hlp6Za024J8fgvyLDfMptujpSgM1
         HiVA==
X-Forwarded-Encrypted: i=1; AKwUvBznb0pvWRlqYu+F24UnQtIquChu1uwTaRWyHbzE0rF1Tc1ACQ1AGvxifV9UR0+c5/8I3zdLj80qMqxQeiU1FD+W@lists.infradead.org
X-Gm-Message-State: AFq9FYJx2lze/gOqRfwMcfB81hVm9/bfwDq3nM7LrsmgZ/EDFyEu9ZxW
	GZuYOlQnRCs63qWLCXTwu+Hvc4MkJGjUMbzPvd2FbTXaj0z2QP0/KHq3
X-Gm-Gg: AYBFou1kEBApJoOZEPmKQpB5kmWDGaAz87x+9obfBp7YkXiLP9i7HgLIzAVTLRdMPMj
	IzlCLAs4rmWvQGNVjbeZzaycy41aze56oZ4rOurSGplOkvPWx2GkY9RVCSTS+XvtpLDkYbB4mWV
	wVxAWR1vXSWJCudY44UOVINSJsT45bpMeQagLK/y3ILGE5oYvE6q0Ox4dUSczTNkWY9/1xPTsau
	rZW2rscNfvbti5aSFu1b7fFD/a1KHlq4AfpuxTzK2Ntja8M158dB/yTmwT1g4zYKYAA61OPn34J
	ouI29HxCW8kSTkEsDDNKLFqh/r160QfwUKUe1XX085AZQ01o3HoUwEl6TZMDFU/1Nodq8Lftabk
	vndmdWu46QSs1D0iNfvb+VAZ/IkxWpUiIAKQxQr1d3JCi6ccqf/C5sBB/voq0Q+U57Wq8Pfq0+s
	7CUBAtSqFsPEPki/8gJ3m2Z/ob//nJWP/CsPfE3WJmHjIJgR3lgitx76dPmhyOP3KL0ukn3yoEe
	Mzelv4SqK8EJtgsOkyXv7vjdkDuQbmWL3/l4XxJ2bZEYyqdaCQhlTH7JPsNcaR6GYyhxJhoGLZl
	zqYA9RAA/q6z9ke5FHmH02w=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr103844675e9.34.1792326766510;
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/4] arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:24 +0200
Message-ID: <f591f8cde74ef4b3bd0e2fcc2108b8564b195e90.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_053251_203640_ADAFAB7C 
X-CRM114-Status: GOOD (  12.66  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C3 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
index b30a0d8a81ba..a90a784f1966 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
@@ -89,8 +89,8 @@ &lpi2c3 {
 	pinctrl-0 = <&pinctrl_lpi2c3>;
 	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
-	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
-- 
2.47.3


