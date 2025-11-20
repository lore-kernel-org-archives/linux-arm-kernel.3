Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FC4CF64BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 05:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU/h/mkFSU1P3uYOGjiw2k7fKpuyOTI5NTYh7ZnlqF4=; b=IsRzSKSw/28ZZr3DklBIqL1L6k
	ZeWDdlsTEgh/GkmaeI9UoCW92WJRU7YTDpTilLbpCvYvWJmzkF8xdsiSwaSmdOkyjpgM3NSgahIp6
	7iujE901OPQ6miVc7iEadgfTQcZcAFG1RsETIdxUFleePUCkYJZHlMVGBAmZgpcdS440hRv045wED
	eQ7DVTVN6ZZSFHm01QwZ0rYr5seoFO+R6fxYD/md4aYOcazq9OCWlRqX9AkbBC3brZ5bSzOmZHvxy
	nQ7tmk3R4ph3wQF5Fhkoe/ZUwGEaNCrmTus/ix6gKAyN/xY28DxvgPlsKsIg8WU8jhedP8v5FCary
	zeYreBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBR-00000006B6X-2x7B;
	Thu, 20 Nov 2025 05:26:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBK-00000006B3h-32cY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 05:26:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2981f9ce15cso5840705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 21:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763616370; x=1764221170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU/h/mkFSU1P3uYOGjiw2k7fKpuyOTI5NTYh7ZnlqF4=;
        b=ZhOpo/N8GpbUMfHyKzuxgKrVz6EGUXkQBmI5smm/+GGv9PPNGb8T58IJB8d9Ahd/li
         4Fb1dnIypDvRl34hcfwbPjR3uTCqYiHxl0/R9u4cY5A9+CyCx7AaT80dDrwKzgDVhMA4
         sBxLTy8O01ffdbwP4x+MZgDDhSNhynLUyY50fh0xfgYPvlpMxaPlf5hBW71Qxml23Lp2
         K1az66zUi2nSlYkHEQLgkQM7JROMSlaEawjF78sTVxg9JcNFb43yC2R8E/pkBCftNNVu
         Y4RTLZHELygjfI+HJYEe/kLLziis4VEN5qdRXfZq3WR6Cgwy8CUF9DiQOwImiu0CZmDE
         i+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763616370; x=1764221170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GU/h/mkFSU1P3uYOGjiw2k7fKpuyOTI5NTYh7ZnlqF4=;
        b=KL7TNZTCC/qD34mnoXLoNisH5WTQChmrqdik4luwg97Gsfkx4dmlR3NW8AL+gm2Eep
         Fvao1VeOypwqdF9MC+F7+F3PH48oInM0iT4e87ABERwNPkV/yCGMCrbDRMyTvfMJqNoy
         yHhNiXasg/vyjA9hSWxe/aQS4/SqXEFhsL/3YDbwj6vq5zVYFw7D6pVMPSMHWY7PqjPA
         ogNrjoZ7/A2rXik/BQaudqwz2JiUkHelpbRub337SARKasbz/ZNZwg/KAYmsnyAddMOj
         4dVc/tEYRAYa59d8GsOq5JfLudTq3VWLoXIp3eK4Q0l24d7LKUMyfL6SZjzJn48b6fdH
         QU/w==
X-Forwarded-Encrypted: i=1; AJvYcCWi7ADvFCdYbcRtKvZJVNomLUVgrvBcV80zszoBCdxw2CohC+u3YZpenPstLsIIKkgOWZucPFO9hAfS60HXNmy/@lists.infradead.org
X-Gm-Message-State: AOJu0YzwNnounck/NB3bk4XnGpuoQoJswQqqdojCPgGqf+eLWaXzDX1q
	lkJnjMsRqzDQk7gNWNCZOzT4Su6sioty0PulW0cmRzR4la/RUSg63cDz
X-Gm-Gg: ASbGncvH5HlPWiZy/txu/2khJJnNFjwzL6YnvK3dMiD9JkMpWf6Ny1L30EPvd9UXcjd
	CC7JTZbWzgYUUT5KqaNc+9d/lWVRnMM1p/uKDsstKJawEZtgmik2/HG+YDc/IEN6P33EnFZn4QN
	F+bYY6jfeRzjbAKZzoCVJT/8eXSpmrI2fQldKoZiLr90myPiYDMyRZK2MENPATTeaCf29cyEmsv
	PmATEZn9OK1ldul+D6MMRKap4c6bSi2ckM4INJG2pqjNubetwV4nzojbXvKRnRet32CSvM73OCb
	fUZwXOCSPsNWm4+51gQlM1r127fbZBK3EphCKShiveY7qchvIJ4XfON+IFKvbUlTOSLr9467YZH
	h3KxvDajFQKo0443pTAHGL3Nubw1RbguFuE8kQK1VFNMIBYquQutowb4FYYtZ8LhxeOIRaspLDt
	xAqVV2fpnK0M+lX0HA8S2TjIY8G0WEiZ8YJw7HpIrFxFlfObllqH769cxCOVOjnVxK4FtIoelux
	Ks5DYl3bLzywqF4IYoWMNFx0g6LTC00l+p8btu37JYxurDEzBnMnaldfSL1zJcH09rVQUjJQjKP
	0d+/ajwcYsAeemKV46ALEw==
X-Google-Smtp-Source: AGHT+IH1kC4FzZhZJC7qjzvkCN9yK8lkB75RjjTIxK4P6hUplCLnQeTxkuiC3gLGbNI+oIn9tu1MVw==
X-Received: by 2002:a17:90b:56cf:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-3472a60ffbfmr998453a91.0.1763616369935;
        Wed, 19 Nov 2025 21:26:09 -0800 (PST)
Received: from 2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net (2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net. [2001:b400:e301:38bf:be0d:b72c:6bec:2812])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm1221342a91.9.2025.11.19.21.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:26:09 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 20 Nov 2025 13:25:59 +0800
Subject: [PATCH v2 2/4] ARM: dts: aspeed: yosemite5: Update sensor
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-yv5_revise_dts-v2-2-4d7de701c5be@gmail.com>
References: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
In-Reply-To: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763616361; l=1118;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=040YJWLGr4Ks08VhoS2kkw/5EcGAtC35AnEYoaywOPs=;
 b=hSIrVRC/ywFomV3U56i0mrilyeENlg6RI8jm5+PWTkra48id9dVtyFQXO0xS8uIlRo9Ww5heq
 ye79i3P0uAhAfyYmcI0pBcQJraUqv9/SKq8pIZWp+zrYY4B/M3rWicy
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_212610_759965_1ECA037C 
X-CRM114-Status: UNSURE (   9.56  )
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

Remove sensors 10-0040 and 10-0045 to align with the latest
hardware design changes.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 7991e9360847532cff9aad4ad4ed57d4c30668a0..45b8ac2e8c65a4f672e64571631b7f6944f26213 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -674,20 +674,6 @@ gpio-expander@22 {
 			"PWRGD_P3V3_AUX","ALERT_TEMP";
 	};
 
-	power-sensor@40 {
-		compatible = "ti,ina233";
-		reg = <0x40>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
-	power-sensor@45 {
-		compatible = "ti,ina233";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
 	adc@48 {
 		compatible = "ti,ads7830";
 		reg = <0x48>;

-- 
2.51.2


