Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CA1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdO66wmJYQ3an/CxnUlug2JV7sb1pt8dsfeshj9bVHI=; b=3W4LFhrvTEwmJkM7W+tDPPaXhl
	dGD+XCOmgV+gJVZI0mSZuC3hHHWwyNuACl4Qlo4pKy05LhHVIqWloBW7ShKd2WWTlWPhc6kAu/zV8
	tOp80PyyCeVgYqrbxMRThFJog44vHGTBd4cd5OtbvnoMTKMX4Ag9RllbEYx2M9tcGqeFD6Zvb7vw2
	DtRRi46n0RW9Le+1f+4YeGI9rLpukp1YDhGubL2qjUqEvhEtject0Gyj7yXCB4HBnA+4ofzQUmKqe
	FLrj8lVFpCzrTfQTiXJLOM37m1OqurGpVDotC33Rl0ciF8SZbnbd+p0TOp145KacR+FHUHiVwKMiw
	FIienqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIM8-0000000Cbrf-2FyH;
	Thu, 20 Mar 2025 16:02:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHlF-0000000CX4G-0xie
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22435603572so18254505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484285; x=1743089085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdO66wmJYQ3an/CxnUlug2JV7sb1pt8dsfeshj9bVHI=;
        b=Y9A/WBdi3WUps/fnAm0Tz93lLnnsXg79pAP9z3miLTks1YROjEjQIy6c9iBd8exg7c
         RV/gIkadASoE3HmC4S0DkdQwNxBWdnekZ/2oSXNI3nU5/wgBovJdJ94YX9YteMqCCai0
         pG3G210VI/1cMs3avrD20o60XCu9VFbTzUzNUBwrNzisPfTJxdylH/X8f/fydU8VhbQK
         TWP7K+U4hfMJ7866zaXzT3+U6+C4WovacYFWx5Aj034aH6lIKRmBUPg3V/po+zosDdUj
         Kk5lcgbEfsKkzEyKmfYiHvHzLLpTX/kOwMxLOMEzBogWm5eS5V76f9fbnhC634jSyI9/
         soGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484285; x=1743089085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdO66wmJYQ3an/CxnUlug2JV7sb1pt8dsfeshj9bVHI=;
        b=udRGZ8/goOGXtX68YMNy5FjR1fZ6M5VkDAyHTaygDdYg3RnE0cJOOlA7WDPHGGwT9j
         +GCx1J3BVX/HHXDET7PptVu+enYVLCtJMfyF2aogvFS8mUMq1RB4t3/JUprsaGL/wDBM
         cnx2U77sUmDv0VLP2BnjwrCfIbGt09BK+xfEbQY2Wyu2gyOO6hA09ghIShRVr+cAz1HI
         Kcl3beY8FZxkggLIS2dJzaCSh+THxlQlYz2Syj6JhDSVBrjfZl3OpnNRDPWVZz+khNMW
         caB2/BNtUBZXIRLxfd1fcImdi0RaBLk8c1ChaxPwBrhx0cnyI71TXXDosY+z7d9H6QIz
         zoeA==
X-Forwarded-Encrypted: i=1; AJvYcCUzy3UObSgJBOYMbNazJCpVOBUAQjp7kzVe6iFXPofbSpgMTIvxJm7dOCwuqozwvLyOwrWZ6nn+iVisEJxZlXrA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp2S8gZQ31qoPLh9yQ3x1nnfl5rlS0UbHraHOoxZ6uyl52Q4Uz
	HWD4lE5uyi3KStUPcbU2GEmjMigyeIxe1bQSVPdSylMHG2GtUXqE
X-Gm-Gg: ASbGncuaRXm85houHfXRASRAEAKA6SAawcdFhfxC3UdDx+zIQ9MnuqXqGRggEQGLtij
	oSTnm/3KYINo0xT0T+YgL75L8kZTGEw+Xz5kOuWcTsM/u9y5/cEINz9JaNEA2TjuwcdUvJsA9NF
	DUo3YX03ZebAZlhtoyiZ2ZVP35rVWIjbFOTZYYIz1Zak8ePdG//OWnDGZC5H6Is+2qTQ/eMiF+a
	gSbDrT5RqKTHG00M1K0pAthCzaK/7VNCFBas6FOlAvOfGmaf3wN6ag0/Qx/xU/ExnL7aBs9kgA+
	A69gf9P3pM612yTXO3VABD/G4M/i1dENThC8hE5B3bhTmq5mthz6f8kza/IUNhfIfCikyGMZNTt
	8Jv3O8YfQ0dd1rf6AEjY8Bg==
X-Google-Smtp-Source: AGHT+IE0FDg/RvatznD5nSPBO0u6iFrPVYdj39Zl3XVqmYw9j17E38UUu3Xc7F1pPw2qEsugW3y4Rg==
X-Received: by 2002:a17:903:320e:b0:223:fabd:4f99 with SMTP id d9443c01a7336-2265ed68d0dmr64182055ad.5.1742484284467;
        Thu, 20 Mar 2025 08:24:44 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:44 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:56 +0800
Subject: [PATCH v5 06/10] ARM: dts: aspeed: catalina: Add second source HSC
 node support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-6-e161be6583a7@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=979;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=bBJquWmbhZlBT0E9fzqTISanbT0nOLqq8zl6vtcWbDs=;
 b=nY7Z5IkRbcS1V5IGJjWbsZaB1Q3BvpU6kh56rBgCZUHC3bvVeo1uNTaxziEpT3fNRvoeEldAt
 plVdW1akqN3AcuEdgCyo2mqwpTyxRFgQu4v7AIIo8yta+XVuO35qHk9
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082445_269106_A5D94CAF 
X-CRM114-Status: GOOD (  10.63  )
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

Add device tree nodes for the XDP710 Hot-Swap Controller (HSC) to support
the Power Distribution Board (PDB) with a second-source configuration.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 9cbb296dcd9e..cf8a31b50074 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -562,6 +562,14 @@ i2c1mux0ch4: i2c@4 {
 			#size-cells = <0>;
 			reg = <0x4>;
 
+			power-monitor@13 {
+				compatible = "infineon,xdp710";
+				reg = <0x13>;
+			};
+			power-monitor@1c {
+				compatible = "infineon,xdp710";
+				reg = <0x1c>;
+			};
 			power-monitor@42 {
 				compatible = "lltc,ltc4287";
 				reg = <0x42>;

-- 
2.31.1


