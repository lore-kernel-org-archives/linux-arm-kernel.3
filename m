Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D3CCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRJbkM4wepO56t2Jx9Mj/0XBiWzZWPdz2VVmdtIvIJA=; b=1efuLSvVq9myBKeHWmf1Nhyltd
	lpQvRE0zY88V+U7SpOWBMh8dnXjwBlTySpAJCWI71xzujL6f+Irt2TdbxYtAL92E41ic1pTTxxtYJ
	5Vw4cb3edj+3Ekpzx1cWXJJz+wmXcWbph/eaaTEaWUxc30RfbULot2nmcpK+CG4QMr22jM2D3bv8u
	tc/J9MYrCiieZKiSlCIbbm4IRwvWXvs61Kpb0FQLlRwnD6x0HCbDfV4JhK+QdGthdMTdlv78mQoRh
	OtXCKvQx+J0oLEt3SqO1g73edtuzKRo/4jutxU8JYdxqw0bf+W9/x7L3VSWqGd19pasCmaaWLYIn2
	eM53tdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWt-0000000EURi-3zZU;
	Mon, 13 Oct 2025 20:52:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWs-0000000EUPV-1Ryc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:52:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so4079289a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760388745; x=1760993545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRJbkM4wepO56t2Jx9Mj/0XBiWzZWPdz2VVmdtIvIJA=;
        b=YmIPjRAyfhuvcxaWQ4bguy5tl6OtIoD21JQc9PyKrv26tGbKXoBOojd9CHqFN8v8XN
         GHPyLUq6ZJfd9Q0V/kVtDRLZEAYmk3F8ThkYDJ4vcqYgsd8yHp+kptEX4J0r1o8UzNCH
         STZQEbMwFNQE9O37EC0Tx46nqaKj3hv+0+dU6jNkhW55ffuLo0yLAN/3sEyu0kLAGFnu
         q0Dc/SjYwz4PaAVIh5Rn0lQlKzJLJVStKEx0Yy6T2Mm/aZI/QqbTMpvZE9erq7SwekoM
         BcurO7xPn2E/iGyj81yeFTUB2W02JwQ9WeqO+/zD5mNMT//2BW/6T82Z/QG7Kkj/XJPu
         2i+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388745; x=1760993545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRJbkM4wepO56t2Jx9Mj/0XBiWzZWPdz2VVmdtIvIJA=;
        b=heWG6n9cobK+cctniTxEb+wLQUe4dQNrr4yfTFT3O+RaVYUtNefNQqOIFIB4r6Pv4U
         yNBg8LIDxpAZWbgHUN/3FmLlmYhTy0uYTM9D4ou2FRk5qvrwWZ2b2rIYVHeNVMyFWKMX
         4jUdST6TW4Y5Vq8AM8YA9GfDHf5P4ylxcrFoGFg4hLvp3S28I8Zkb5nMYEE6z4ncGiW5
         CXJruzajWkyPL4lxqhTFrk7symKkuXZZ7BEInm42Q6UqN6XYjVtrnKUFI0aI7VtgELKw
         GitnHBNvEA97idmk3wwmsEB5KRxlmjZlVIWATgaaHngVnNAZI5huiM4036kTKCF0m71J
         EH9w==
X-Forwarded-Encrypted: i=1; AJvYcCU4WgK2yYeqxWavb+aYgBnmRGTpq7LFT5TDF+BVsxWPSlQ5IGj0cFmtnfca8epPDrzczMm3vA+8muJgVXyTUV9M@lists.infradead.org
X-Gm-Message-State: AOJu0YzYypxkUB9kxHwuIkTt8PxXeJbOWYE/Bqg9R9bSeK6tKbwUfndp
	FInCzS1e13kk8FEMDLFLBBS2qTAmvJFi9JjuP3uOj2wUm/hny0bdrfKv
X-Gm-Gg: ASbGncsOpetChzybVOWL6wVX2a7Tggmd2NGxg58y4Mx4CiM+Jv/q057hVp4fvf3suWw
	NVDZBnAAV/QiDzhwxLaVzAnbLq2tTaGIsiSDIq6mUTjrkV1YiQGRqgnRz9YtHOdWCnVDVJJ+1nV
	Ct9xzqL+JBppquGbWfTo23yeXa5UbbB3ZmsolZqWOFrmTC/TGmgXkVOXH/sBNNsJriBEWuOjMno
	ysBZffJGJNllcT0vbWO4o7Eo3Vz/QX85ltkKfp8iiMzgZ+dstc/D3zITf27HnLfHXfE/+Otd2Jo
	Q83Sr2ZaUv2p/TLatIcxRuSkj9/EupJIJtnIzw8duFWdH6ft7xphymhuQeasQk4bcZnbqwfh1bD
	Azhh/Qzt24pW8PaH4z/EepaXaEFhskL0YGnfacPxAdJHd42l5o9EBBbY=
X-Google-Smtp-Source: AGHT+IEbc0HqY8CLIHs2k8aq/yJ+qGsFrnOrDj32getTUXol/oijADm5b/7xs/AL3ljfJbDbndG3kw==
X-Received: by 2002:a17:90b:4b04:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-33b51105bbfmr33280515a91.7.1760388745433;
        Mon, 13 Oct 2025 13:52:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de,
	stefan@agner.ch,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Mon, 13 Oct 2025 17:51:55 -0300
Message-Id: <20251013205155.1187947-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013205155.1187947-1-festevam@gmail.com>
References: <20251013205155.1187947-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135226_387929_9F5A8905 
X-CRM114-Status: GOOD (  10.42  )
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

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 7381fb7f8912..074c48b04519 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -776,7 +776,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..745f3640e114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1


