Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5C1C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKGzggxqR/JI7t8XueEDBWptW6/F6u3t8TVX1C7g4ps=; b=scAor0AqZjz7PvSGxqJBq/3ulJ
	3xFsfaconPl41e7E7YPpqXCj26I2/sCpoeNhp2EXKfpwgczasVXcwnpKySAh2De6otwVk/ryu7VDT
	7FlYBnhSLgfF/M8h2O5hciAg7wGWNha22y6MeS4R93Ybe2ktiMhWmM7Z+12KDuXCEbrgEXeYZnZEi
	hqDhb+UFLt6zn0TgUr3QqpCQQgDSra8WfnFaSj5Xl12+e+Yu6rXROjqrJ6m9s9mbe0LTOiACUMoaa
	DSH5Ke4z0HPMTdM5m96ROpYZiwpxGmPKruUwoXyy7pgNbP6dymCtVImY4hKqxjNB2wry6qkP5Rseu
	Xw83KvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWw9-0000000E7Ns-3BbP;
	Fri, 21 Mar 2025 07:37:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWo1-0000000E64B-3Iym
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-225fbdfc17dso26624975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542117; x=1743146917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKGzggxqR/JI7t8XueEDBWptW6/F6u3t8TVX1C7g4ps=;
        b=g/SsJq8Pha7crBkH7nsLa/pvE/nACS+HWwbVbQ4CmVBrV8kUpMBhWIufkIK81mUXSV
         uyuSqxgFpoClGOYvEtQPsOtCOMpb3wz3SK8TDk/+KN+u8owgAuJGxdj6CocGEVu2AaLO
         Vg1qhpZQpYNJeJooJ2/z4URQhdLo6SR9RvK+5VT5hMj1POxkTvxFJrKAqJOd7yuBiyU6
         Jt2x2H7HlPJFObCsChMBCQj8vhJOI6axldYHhtyY+8/9cC39KehNm+TNEA+Ca9DWbgro
         lt2O1toBfRHWG9TJR3BLKDRapm/nzTj8/puOdak3LeaZGUkGbjJQNNX8ucPk900ycTkt
         khjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542117; x=1743146917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKGzggxqR/JI7t8XueEDBWptW6/F6u3t8TVX1C7g4ps=;
        b=fSJ+1dZ1MhymzXKzIIJvtZsFNaAdmwEG3mzPhQZD0AoRh2A+VWgitiqRHXBDiG+zNM
         lL0v181Ce2vrY/KsqzYqMswPpMRmYiPJRvNn7NDC5UjXirmj4yP1bhAGZWofVf2zMtfW
         91r5IIgoG7RwDn3lNtPUpjaDENhFRfyvqnlSP+dR5yVxS+2aGDL/WSYU4FSi4Xn0RKF0
         voYieu4VzniGjITf0GMDEMExYoP/y+BP5hna/+kQ5m+TpNQKemcrKNW3Z2QGvLtyqzhH
         4CGjWNiSGQf9/c4Qrp7158mmwuDPEqlDaqAh7uV7bRGDrBnS5ewHNl9fJ1RGEo53c+Fw
         QK6A==
X-Forwarded-Encrypted: i=1; AJvYcCULakjiaZPrbVnbVeLvN+sN6XCp3VtVHlRD7p+7UZc9PHDQ1psoFMMYiH8/yhM+0tG7tcqZMghfIn7mka9B9730@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb88fOjsHK9lgNq1X4r/+X7sJfDtg75i7XHtmr4prqYDdS5l4Q
	CTLpQ4MUFjBTRTzU30oysqm0K6zmdLiMvTD8pSEG1ES3A3PwZj9jol2DjA==
X-Gm-Gg: ASbGncvPTBshNda5gR+2JYTOGTLkvqRNJ8EqfpcohvqufpYb3CmkVhcXMS7jlMhVVr+
	EIMjFXNpZz9P2Aeq6tjUrDq9iy3o4rTrK1AyUAd7OpWmJDCF92ts9e6Hc7ktL7EwmcwprFCSTS9
	y+gJZ4WhoEDBDSdgaNWEcYy5Qu7ca7w9Z4rG/pBTJUNfoSAE0VReszD5aAI7Cl1S1l7cd/MKGj+
	D4+Qvz4Oas4YoIsNcq5j7WZjKcX6LC1MPWJ4R3YO4485vbFpuN0XKzng4aiOrVhrJGKjY8oQCsm
	p59WaLJjwn6Ean6SyAGMVkY33To3IsG4mNTaUUVbn/x4UZFawBUD4CSkylVmIV98lxnf7tvLBlu
	EOayBhl6S6sjyhJZT0T2QOQ==
X-Google-Smtp-Source: AGHT+IG4Ey9POVcNaA5EGYOeSpcSkXZH34RORqBkMDNOebesXmi/pjhykauo5+xRwD9ve+EX6szv5w==
X-Received: by 2002:a17:902:ef49:b0:224:24d3:60f4 with SMTP id d9443c01a7336-22780c786c8mr40390675ad.15.1742542116766;
        Fri, 21 Mar 2025 00:28:36 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:36 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:05 +0800
Subject: [PATCH v6 04/10] ARM: dts: aspeed: catalina: Add fan controller
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-4-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=1059;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=ulbtp+kTE7qMNV9lUn4Tys8j+TjW1Jo7Lvsg5SrWzbM=;
 b=JffdhqzDNi+p7Ljhq9yTdsOYOGNKOk8fYUlvKqY8GbPQyJNDTlH0oW4aQKk2VDjnBCxsfBLX0
 xEZpBXbA+R3DaTWCTvQUw+39xUt7EswRSzrHKgKWxD6u5I2ABVAvK4q
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002837_828908_93635DCA 
X-CRM114-Status: GOOD (  10.35  )
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

Add device tree nodes for the MAX31790 fan controllers on the Power
Distribution Board (PDB). These nodes enable fan speed control and
monitoring, improving thermal management and system reliability.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index f5f47245796a..792b739b1103 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -466,6 +466,15 @@ i2c1mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x2>;
+
+			fanctl0: fan-controller@21{
+				compatible = "maxim,max31790";
+				reg = <0x21>;
+			};
+			fanctl1: fan-controller@27{
+				compatible = "maxim,max31790";
+				reg = <0x27>;
+			};
 		};
 		i2c1mux0ch3: i2c@3 {
 			#address-cells = <1>;

-- 
2.31.1


