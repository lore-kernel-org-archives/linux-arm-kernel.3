Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FF4CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vni583dy1qPpKoeI/BvuSUANKkix8/DHWprmu6YA31k=; b=Gtab4BEihuVNEZ0zbAVtBRFyJg
	qpDISdfaYA0QfhAEUJtTDzE4Q96k7uzlYr9o9tJBfd82btLQklsrhHHtGy+3cK1g1wwnC/XWgviic
	1AwVkIygMrc4KA5SaFuZ7yXx1hmQN0QQ3BQIItQ+DHDeGr5orY7OXSMW/N++3mw4tYWlamTMqyh/Y
	Rr0rYn+AygXMv3MLhjAcc6WEAw4Lb3kuktn5DChgPw65A24od/AoRFd+99NBzfH8KeL3Zx34Hv2uC
	DDUhflf7WA7UWyIhRyIqBrzYyZE0puKoMWCVh8o+KVEM5S46W9ndMkVV9U7syRR+ABXHqDL8gIQMR
	KG9HRlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXdq-00000000iqC-4AEt;
	Thu, 28 Aug 2025 08:05:54 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXOe-00000000fyN-20AI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 07:50:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7720c9e2900so848814b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 00:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756367410; x=1756972210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vni583dy1qPpKoeI/BvuSUANKkix8/DHWprmu6YA31k=;
        b=FPzl4dGsCh6UgUAFnxgTUIoA77PjxOCjHW0pRaF8OrABhtNjgljjmuH6aAEfxJu0xJ
         UjTZPl9slnpQwD+RpqJ/XxVkxK102hbDUDmVL3cKelGfiv2+b1mJFNES3aMJjhhTOWtv
         nDAyBSK7qDGEb6ENeSsc4Clki8mb4Kl0lhovocBpM0pYOq8DziHsGz8INva9h1Lt66hY
         wI3Z+s5H3xDeBUlWOHxAofmz6jZW++NdSGA1prGvSti61B6tt/0OTpV5P9ttXzgg/3Ez
         orE75cmuS6OgtiU+gwEfFD8EnNAmxBzM23PIRI835NLyoNijkL0gI6R41jSIHFlsU1cP
         2/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756367410; x=1756972210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vni583dy1qPpKoeI/BvuSUANKkix8/DHWprmu6YA31k=;
        b=mfSS2CJ3rtAgxvmndEMSM1xbe2Zg8jendC9/RBX45Q0ISa3rWURGtIo4GFLg2yGSXt
         xBpkEk/P9w43WX+sCR72lHMez/NtAuNXQ/zvejVjAWdtNsvP+B/z2IA8YsDLk26yewoq
         clpzkvpm0vt51Z4kNh8r8EBNn1xR0sGvdyTlWEritjX2CCkeYuQtoU+TjrHrjMN+5Bfn
         6GqxjCV2lik/dLAAoX4eYd9AR2p4tUrl93mta3H6dsI8qud9BxTD5MdoA4IZ9LAIcsC5
         KDBVhWtK/QWeKMvxg0ZUVnWFYAJi0Y2xkeNlTsdJwYDW83OK6pr1eXIdqva7+g1WdEhm
         Gepw==
X-Forwarded-Encrypted: i=1; AJvYcCWFuEZLF7cfcL94rXVl/CpdMZeD0q5JdDJLhnh5CNtslNOavOruDGsJaBSMJ5OP4196b2Hlcd4RC+3jOo/v5BK8@lists.infradead.org
X-Gm-Message-State: AOJu0YwU8/7r0hTYalwbWXZ61ETjl2CwhkNqU96GDK1F7CdLp4Y6Fwoy
	euL635Iqmkiwiw8I98vButMLt1uZPXHFY8eGa/R72iRsyojAZV2pQSLv
X-Gm-Gg: ASbGncs5HjujAeohOEChLC8qfE/v0WU05w8/ai7G+FuuQTBOW9D8nupxGKF1O7nHDoO
	58tABoz0XF+AWaeB2UPVhBq7kMywUm1np2Sa/uH7mMkZWetbtdEocOgnsFgkf2borr5v07m0Ssm
	mtvJNzXXvKty920urQUsq5Col++ae5GXzVmwha4h30Jh8U3oFQffKILLbqRqCg89LG2qItNSzUY
	VapDB8eMzethMuTfm+fDGdi8zpdYd+3kl2IiU9bqKAKZGynhLJvJVDH28dPCxxOzyQHs/7XdxGm
	VwBYzeUVM7tVJbIeYGwZT8gndopFkborOnuqhrPmKL+ha+N2nFrTxcOQw2VoB7yDazDrKk+oPeT
	xv8KKnyf8j/fif21c7zvfb/f35NFpVGNiLlASzey0+fthBsXksJy9rqGVRSbyjO8WwzdIdqA6PN
	onO1L4ZE5m8i2qjsyt+szFGyYGKATn
X-Google-Smtp-Source: AGHT+IF4HC4PbFCqww/SIqTzmzziaZEWvmMs4ySjP/B1BpUGSc/ehDGuZDBlPqwuqZKik/CkkD4VWg==
X-Received: by 2002:a05:6a20:a125:b0:243:aca2:e500 with SMTP id adf61e73a8af0-243aca2ec8fmr2970429637.29.1756367410222;
        Thu, 28 Aug 2025 00:50:10 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e35e-4238-7ad6-5c9d-99c8-92d0.emome-ip6.hinet.net. [2001:b400:e35e:4238:7ad6:5c9d:99c8:92d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb9d226sm13272038a12.41.2025.08.28.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 00:50:09 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ARM: dts: aspeed: harma: add mp5990
Date: Thu, 28 Aug 2025 15:49:53 +0800
Message-ID: <20250828074955.542711-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
References: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_005012_594047_D85A7CAE 
X-CRM114-Status: GOOD (  12.83  )
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

Add support for the HSC MP5990 device on the Harma platform.

This change updates the device tree to include the MP5990 HSC
(Hot Swap Controller), allowing proper configuration and integration
with the platform.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 81278a7702de..23eaf47a38e8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -520,6 +520,10 @@ imux28: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			power-sensor@20 {
+				compatible = "mps,mp5990";
+				reg = <0x20>;
+			};
 			power-monitor@61 {
 				compatible = "isil,isl69260";
 				reg = <0x61>;
-- 
2.43.0


