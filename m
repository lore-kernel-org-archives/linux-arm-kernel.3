Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72664C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ6AZvpz6rhEfIMNob1PWyEst8krux8q3uqPjk7Bggg=; b=L4BBFOgJld/ahpxhMS4PyXc3GD
	xEoVBDmb11SHQF1L/pU3mwt5zqRpwd99YHoilQ8Q5xoWzcu9a+JIxjTKeNoO1dsuT2ruebpALOKaN
	0sJ3n3YwLjrpdTwpSaKF6mdj/z5BuEOKt99Alml7WH2esIwmrUSj0lbid8eY3pporT8DGVvEVPsOy
	PTnD/lSL6tkvxw1pHMtxt4SMdQ1qRGwEMvqgNrs4oOlmE6yvpiSO7OpnHj+jdCTWT1wKZvfjj8ceZ
	Un2/S1QwyKihoc+iZd60ay2Xg6TW4WwhPjxoR7C5MXcIQu5XwqTN7SUkZJo7sfeNiTSdUPm1HzE7Y
	01/84ELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIM6-0000000CbrI-1dPn;
	Thu, 20 Mar 2025 16:02:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHl4-0000000CX1q-3qce
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223a7065ff8so28667715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484274; x=1743089074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQ6AZvpz6rhEfIMNob1PWyEst8krux8q3uqPjk7Bggg=;
        b=EjDLjArSxHCMuSnMiw0Ot8Fqg26ZSXyztqLEDTapNQO2izcoL8crbmYrJA1AajDmCo
         D1jmHdiUdVbav0t4XamgwvDoAriQUbEkX3n3lD4YtbOlRpy+vNTGTiW01pGSE2BHu1PH
         X9vDku66Og7hYGzhuu1/BpQiYbLwJdZEZ/FiN94obk1joScTPfKPL/qKPGh4+W+Qgy61
         dCQklLPxe/J2eucEb7EAIbPQ5JaWpX0erAY8oxXar/gZN08lTzdnkbduXS4rUaSQkWZz
         ms7JsxUoQu7uaHHNnYGP+Zy6WO+2yOhGcm/LLLGEQFXTlNm2XCukolV3Yz7FHbhWKdI0
         Tjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484274; x=1743089074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQ6AZvpz6rhEfIMNob1PWyEst8krux8q3uqPjk7Bggg=;
        b=D/y+m6nWKjI98Z9RiiMqJP3CkJD867D5CCfb+MZXCUiVGiwdb8lM+p5wDJpuvhkFOh
         ODERrNxng2e+WY5YKcJiAyxyZ49ELzWyEKzSD7s7/dKD5lfCSwsZ6NBcltS8GL/FX9iE
         81s7pPb/LlH7PgYs1tWWcchf5IJGxQs6Lom0ZloI0aK3erwMrN+O92sqnBt7MO3rPS6I
         i3K5TB9VMtYpD8rStYH5ZDQlDSL4lKN08UGDO+CCq3KGNlgWdkyTJrJM+XqR/LTGuFMk
         SpBnXFqCb2zgjOcehaDtDnyyX0WeG2bBWL3cwlNa37aimZyY5gr65iKOd98YrWeN/6nO
         LIEg==
X-Forwarded-Encrypted: i=1; AJvYcCVEVeUgq+18YBqnzUWfjCWhli6SBkurVWrjdhPohgLpB0VEOqJLlUTWKGGUbtgr518y3x0S/TK0jpwVZ/VuZHeG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv7Bm7c6JDjebDY7aujfRFs14qB33Fz/8TMj5Hz5qfrzXHK2v1
	wCuBktvbdPHorTPbF2uzuwac/M+/fqZrdyWFlL52S1OsMBhVyesU
X-Gm-Gg: ASbGnctoDgafFroC9i4BWZPCQa0RMFUpbD6XN/tAJn+/JlHy+f1847WOzcuNENR4xuy
	mkMpMqP348Z7lJdq0Fnvv4FkX7cYfocApwJpAz+SI4CS5GuCpZ5PDDQnFCHslV534ZZxNfdpPl7
	HlIrU878MwU89FUGVVl02tEBvppFAQsJsmW5DvlOGwFV3juR1UUVeEh0/N6jAhPiYruAgK95jH2
	+QTpirkq/M6roDXntO81Ca3017nURlXowdy7JqP1HkrP/I5Pc1BxxgTjJGzILU+039BPvNGLuop
	wixi6S0SjwuWmJdADbhkwXoYyaGE4rLrsRbTZhfRNcWX6EVn8Rs5me0kvTETZU5gOCD/iLKsTgc
	4wN0Dx2OTYEyB3rLfRa0rUqECa3RNpss3
X-Google-Smtp-Source: AGHT+IE5GPeE0Om0AY9fiRC5tRfnAcMPwqRX9hgQMpQNbBBAF9NyfQrMJYuDiGjFwNp2dwrDmszp2w==
X-Received: by 2002:a17:902:c40a:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-2264981d956mr117068525ad.4.1742484273966;
        Thu, 20 Mar 2025 08:24:33 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:33 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:52 +0800
Subject: [PATCH v5 02/10] ARM: dts: aspeed: catalina: Add Front IO board
 remote thermal sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-2-e161be6583a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=882;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=P26V4Vll3LYpWjYPKGRYB+hCja9t6ZA02VGXue+Ra5U=;
 b=/XN3QQM8+yPF6MUoJ8BkER6tXXOOmxvF1ngqIsnV8HshnT7+U5Qx3O9tBvAjElM3CeqsBdvhQ
 tNVb5huq7oWCNJUZrqPv9olH4g3qakgYuRJiGu5KgpgYker+N8TZZtV
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082434_963265_7086AAFF 
X-CRM114-Status: GOOD (  10.15  )
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

Add a remote thermal sensor node for the Front IO board in the Catalina
platform device tree. This sensor enables monitoring of the inlet
temperature.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index d5d99a945ee4..307af99e833c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -544,6 +544,12 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			// FIO REMOTE TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
 		};
 	};
 };

-- 
2.31.1


