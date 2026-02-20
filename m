Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3F9C531FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gi6+0GPlrxP+T4lvtrMwmXTOoBG7PA7x/GXmqLf/XcI=; b=FaO9kmPdza6E+ZTvYtorHNNNWX
	PR84stDyMbhfrqv5Ca/Y7uHuNXk6XQGfuzuHRuymNg8IiCqaVJ79G8hqgiFYj4j3jyvN8j8G0NG13
	G5wco+biZvXTtweKu1bAXvAXTJpXNi40dGrWl5fe9V39X7qj3IABnjnFe8M1rnU1SfU63uOk6G+jO
	V1/WKJ3j8VT3Yt9U5FGOMgyhjmPsufhnjyWW/JnvJ91MY9ctUlsaKgnJauimxTEIvzqAALSGiLk2C
	URX0pbSBz6GemrVNw8mbtTs4VwPKecAIR2G3PT4NIxioAlaBK7Q/JKJ1sK0ya+OpJQArYOm+sNDAt
	y3s30CXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNcW-0000000DxlF-44dq;
	Fri, 20 Feb 2026 10:20:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNcT-0000000Dxh8-3AAs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 10:20:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4359a302794so1476502f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 02:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771582820; x=1772187620; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gi6+0GPlrxP+T4lvtrMwmXTOoBG7PA7x/GXmqLf/XcI=;
        b=TeOqgEULSwvBbm2NA1FlHgZHY95ArCbERhXtb5g3p+iF1lGuTdT9iU126dlSeJ05lY
         A5Xxgkl3DOYFckFEkNt1KyVdc2WoKExf+Pfh7NRBf7cETScarMei1+XUfN5Qh2jFX1Ny
         bG5zHtSbhlaTv27o32+Ot9CkhPvGnrwGGSM/lhyP9TRXRrrhUHVecUpv0EPLWFK7Q/uq
         KXCAg6KeogSDHVv6ETnuzVcloOtIxKV6oZEav6rPJvwUW0jZsV+MLk6J/5KulRKXqgdK
         Ogd5Trh0P1BfI6ZKncwh9+krVl1E/oJ2VPm0oKpj5cFKZK2y466RDoRH3X++84WfdKXS
         /D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771582820; x=1772187620;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi6+0GPlrxP+T4lvtrMwmXTOoBG7PA7x/GXmqLf/XcI=;
        b=Ii1jvymcl6dxPY5gHLInJ+2KxVo6i1jf/dlUBr0CZtV7w6NfJjILbpEsX8v0FmJAIf
         tR12kqKOdWfa7PyfNY1d/XbKspRzRyPAFu4/l8LrU2wcvkqLqGFtsHzvsYTXubIgd0b2
         VIcAyWWmR/+oiS6ms6KHBesMiZY4UC0rGQbpbQHWt+srJyIF0Tjxb2u3QBSNSLqXVzGe
         /hw0f5BlhqpTkBLEukFoFcS0gJ7RKVenG8EMZcJ1bBrmoZ5BMh5Z0EihLQgqF5a/OO+p
         PQ2rvlSEcoO406uH5Ibk2sUe9m9uSepwDxZwFJ5oJZX0QrOrDqfG4Lx8HxYiUODKyIs4
         jxIg==
X-Gm-Message-State: AOJu0YwYtfgBzLOYI4Ynb6lzja6kRJR9q65GLVpamYS+1XyE8czokhBC
	M9JvlMID+Jx2sy59MPh2UEI5SrUiHew4GqOl0BU9lX5hilG3hXsOKnNv
X-Gm-Gg: AZuq6aIt0U1Z95Wcb5sKZZs7xIMYLrz21XbI3EIylAsFw/gVbcD0eSl+EqXU9CmC5pa
	HUzGpsxYpe4rbs0Z2xli5slzbUoYz8kgUb4ajnUWhz9X0qpfLJm1F70lTvXubbDYi4z74wFWimi
	y0yVyPBluQtpv1JsdN0mtFYGRDFY5+IZ/wRqAf7gD+YJM8xBMGsYapgnoGf5bpYfnCvpExVyqJQ
	veo10pJWiTUl/mMLLaFIUMIy+qD/sWsw3X/jS25eXAOcwjeYweMe7xTIgr0E7h3rG6sdg0Zmz2x
	I9xti5sgm08CGnhKAMZpAxnb2u+IcSjoNUsbQRUPg2kT6BepZ+NwTUq3gfkXj4X4dzaoQFzvrbx
	DDiT+mfYX6Ui/N6tpBlW4fdra/TZzU9rtMT+XxxOaG/OB6BhizVczccDj6raNfcymriaoPgENsu
	d4BNxIRySUVDn+cQrufHayThWBAUTyV8eHtF/vVmk6hiccYGyOjPCo
X-Received: by 2002:a05:600c:358c:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-48379be6056mr351881735e9.27.1771582819791;
        Fri, 20 Feb 2026 02:20:19 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a3df4859sm28039015e9.2.2026.02.20.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:20:18 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 20 Feb 2026 11:20:11 +0100
Subject: [PATCH] arm64: dts: marvell: armada-37xx: drop redundant status
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-armada-37xx-status-fix-v1-1-716180561d86@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFs1mGkC/x2MQQqEMAwAvyI5b8BWsbpfWTxEGzUHdWmqFMS/W
 zzOwMwFykFY4VtcEPgUlX3LYD4FjAttM6P4zGBL25TWdEhhJU9YuZRQI8VDcZKErnbtaHw1mGG
 CHP8DZ/2Of/19P4Ov1MloAAAA
X-Change-ID: 20260219-armada-37xx-status-fix-7478c1d3b1bf
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_022023_134032_4C3A785B 
X-CRM114-Status: GOOD (  10.39  )
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

Remove the 'status'  property from the 'armada-3700-rwtm' node. Device
nodes are enabled by default, so specifying the status as "okay" is
superfluous.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 87f9367aec1227c2c6de52f358d51bcff758c147..6237334833a247855bedb5c5d6c7618f5819a967 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -534,7 +534,6 @@ firmware {
 		armada-3700-rwtm {
 			compatible = "marvell,armada-3700-rwtm-firmware";
 			mboxes = <&rwtm 0>;
-			status = "okay";
 		};
 	};
 };

---
base-commit: fcaf733ca526b69595ed1d227e2cc59ddd24eff7
change-id: 20260219-armada-37xx-status-fix-7478c1d3b1bf

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


