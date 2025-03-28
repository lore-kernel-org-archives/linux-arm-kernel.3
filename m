Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7795AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEirBUBZll/2CNmNMKcH5j/pk8NKD9yNsuFDYjiUshY=; b=ixph4Lieq342J1WWBfQWoc5TdY
	rD37wz9sDy+VxVkwQl5DFMiBtbULye0pKgH3ONo54HKXZE7F6QZxIRcvJPbbndmtci3J068XN1FH7
	eJwXIiBENkJ7kmXlKQ+Hun5+fK6TZK0ekgeuXgTHG1OKmAGMh3X5D9m32MfiBI6Cme+x8I8TT5AEb
	IzLbOlSED+Y/jboTrtthS6cWl6YjUBani1zc0W5JPkLZanqJ/tugZlh7vsOQBL+3pcjWTAbjYlT5b
	JOf9GbFAZG6Bm658xMsDJWc+lMgfL0WKcgx41iQICRkn/SvoiN6I8WQA/NvCW9g2TlT/v08d3/cP7
	l2AIofhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Ug-0000000CqMh-45pF;
	Fri, 28 Mar 2025 07:51:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Nt-0000000ColO-2OYu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so1983932e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147848; x=1743752648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEirBUBZll/2CNmNMKcH5j/pk8NKD9yNsuFDYjiUshY=;
        b=gIkEPdCkd1+vtr0yrfFAIJqTPZktTLdh1Tg/c0ZELWtZBsd4aV/SZEh/kyn36cD0in
         DO8L7YXfmIMhxTs+uPU6//4rHNhn4eiUzonijCkHALlYCG1tNvNrzQV184Y7IhheRRUN
         vtN4igl/QJoSVzY0Tb/84VDnSqfGS5ht7oeBCVsFViNiOo8wX+9KSFIQmCFwXTvPY+ZJ
         VMEHaBAQntXGM9o18LzKstX6PdtGp0xwaAOnB45Jss+OVUoP5DY1ezSNeZtGlUYNNjom
         s5pcROiTSNvPfusECGL49Gh1Y33rwtjCodSQr6qJshT9ZnaM/BXu8BThiGt3ZrnHh8br
         D2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147848; x=1743752648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEirBUBZll/2CNmNMKcH5j/pk8NKD9yNsuFDYjiUshY=;
        b=NJPsn2uTn46NGAbUqk43bTleS3caXXIhGpPKgvA7iw+/Ufw5rInL9TVB9G6l7uWDVH
         7cx/CTTGN1kD4B4efpXh18Snuorh5dhiQ5+a5ohdfInM+2Cs5tvdxmsTg/sQG6kSkkAq
         sQyyLktpb8vFRQmHsK7omtF23UXget8Ket0BhdYuf1hQQHh9g3Tb+ApAsHGl6BhAVPwJ
         MjnUxV+4Ao+hZubWLR2hJLpdzWxAoY1iN/fmGF/IcsFSNrdmNkSbpGb4jPg6Id5Jm8U/
         HTS0A71fX6mX+2p1CC/7dx59OCYue1kaTUj+hFpfghmJJU4AkyS6C5UO4zt1YsMwadtc
         u/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCULgG42hWJd93hDXx49E3FSrerAEIxA3GoRjtk0ujIHJoNX/jc9p3y53Gw1mC7KD4ycw01Te6Y+u63zhsa0yPSn@lists.infradead.org
X-Gm-Message-State: AOJu0YzuOXCWG4vCs0LeHWD6wmqOQui8SnCIbJoVmkynZ/LbFR9tztj7
	OsWL14WQxOLIaFJGEeC57oTeu2Pu+502JbVXIJMEuYVmLR20hyG1wdDPvJrYxCk=
X-Gm-Gg: ASbGncudJbXJVVkc8A19ORKCw/cezpXTJcka3LHdzhRVebCEmqxR77PViKIH3NlkbCb
	DrGOw1EYYUuey7+Frt5EjF20EZ04EcNmR+rmPDmGF3dAgej/8GVIHWzhfaXtdsgmrDRIvvmimjQ
	xWsk5iOVBsUzqLoaNbJDk4Dx1HScfMXolxUrB+mp7NrCECWMb4xUDapAfPSoptQW4QsDRZXoEj0
	fbB4ko+7JUJxge9Uy70fuGFUcZc2AJvG6NL4SSPS7LBc3WHuadCym6VkPozqcLXuYeojwz0qDZo
	Mk6qMiA8D/eQyLxdYFkYJ1He09o0/SllmFWTcKgIvdNYD59qRYATylc=
X-Google-Smtp-Source: AGHT+IGZ7IwtSD+rsiwYaWCAmSHkc24I3XE28ZvKsRaUNPPNFoNoNkWcCp9SfiyRprQhmO6Yvld/ow==
X-Received: by 2002:ac2:4e05:0:b0:549:6cac:6717 with SMTP id 2adb3069b0e04-54b01273163mr2319734e87.53.1743147847926;
        Fri, 28 Mar 2025 00:44:07 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:53 +0100
Subject: [PATCH 03/12] ARM: dts: bcm6846: Add interrupt to RNG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-3-e4e515dc9b8c@linaro.org>
References: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
In-Reply-To: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_004409_618904_97A79D46 
X-CRM114-Status: GOOD (  10.12  )
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

The r200 RNG has an interrupt so let's add it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6846.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
index e0e06af3fe891df3c3d8c2005cf1980d33a7762b..d36d0a791dbf4ca3442797691957c3247c7187e7 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -196,6 +196,7 @@ uart0: serial@640 {
 		rng@b80 {
 			compatible = "brcm,iproc-rng200";
 			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		leds: led-controller@800 {

-- 
2.48.1


