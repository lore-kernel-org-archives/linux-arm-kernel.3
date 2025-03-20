Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23927C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05OyaXbL0WKbLYpImlnz0xJZmG54ud3JNw7Cj+unigE=; b=I7YWS9wWdibBC4VH0yjEq6f8h5
	Ik201C6Xg3SpPOEVZwvKem3qwAQaCLv6pD8HSpyy3yanzI1iMMZp66LgYm3x3zJ9GQg/4Fr0/lA/m
	w+1yXSovIT6Rvs8g3i3MFApAQSSHDS1C5eTNd9kipdYSb2ctvIt6JYK3eXjNwBq89yO9zKrSg5Z2X
	SpQAlB6PKwCxhuJA6TWeXviLShMKbqQhRr9L8Em1NQxF1iqE5ORnY93CU7XtZp1l9SkDbx6hXCdt5
	BYfP/gyNo634CcOq3X/vMLx17d8OzuevdLo7bpUdZr0YRUBiMiDG3tyh6TS/Ld/2926m/uxgCB9ET
	ufSJtGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIM6-0000000CbrM-3t8r;
	Thu, 20 Mar 2025 16:02:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHl7-0000000CX2W-2jjt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-225b5448519so18085245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484277; x=1743089077; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05OyaXbL0WKbLYpImlnz0xJZmG54ud3JNw7Cj+unigE=;
        b=VDB4IZ5yqiWegHphoukf9UEqIkZPQuZ0x9MkrZFImNwO6M7r3hyAfcJqIbVH6YcQDk
         3b3Y2UtVhlYUaPMEte50BsnaPZjgz37EmnCZ1KPTR0m7mbMYDpWzI30TRYnfU0tq9R+q
         dLwYVvUQbIkc9DNjkonbH4jwAjGtfFlOeH+j5Tb8NiQlzEK8MKjJxf3mC1XhcGRGxuHD
         vBp12apS3RoFMFbuoL6rVfuGFqNYjksn7y4B5UjerFuDNzqdRYsXx8nEZmwTLV9WfSBg
         QaiATd+AJDdNb+UfJ0pyeA+eNbqZGn55cdbddwb5p3mOV+7N7RGpchfvkST7ZHUoY1VF
         rqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484277; x=1743089077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05OyaXbL0WKbLYpImlnz0xJZmG54ud3JNw7Cj+unigE=;
        b=TOBLpyNa8QlIC03WCXQFCb6p+RNuWq9UG0f4dunwgGt9n3YpYfSowyK3E1ndh1hefo
         UmpsAU+u7D/DNWJnjlwTkR1D8Dk85OQPs8kqsxqVtZ9GBMzisazwRxPgg0olTVAvTMkr
         9iLndVcHxFL7G0/aPdKJC4cS3xCoCLATiYlQqcTvCT+Kf5M1dBr87IJ6OYRevfrK0IQ/
         0kiOPmeGkIRVjCYLImYoeauWhlooerXz7swSlQyP54SgD6NAdfxvaS0je2rIEJ+h+bhW
         22lckjYxXENpjfNkl5EBXARhQlDJ0oHLYlFDwDdRxeDh9wFQzyD4Nx5jhT/l/aBWCVkD
         +lAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5nafhUD4IMDHEm29yT1yoZvCzJakpgOWcU8yheumPLoJF22AmUz8g6rwUj0OIH71uhpUDUqoXCBwIau+k/Ohw@lists.infradead.org
X-Gm-Message-State: AOJu0YzrmeOP7M5DyZbafKCnX9XBdLj5egk1C7/MzYzfzU3Bg4KOkldH
	HD5qq8gdsGzUugpu9cXQUvE/bF7o2gsCUnPHOin3pjh4HyxVtLN4
X-Gm-Gg: ASbGncsE0K0NF9nQ0JBXFY7C6y+NnLlCQMhO5zkb0mJR+YBGgoLyXRoHy2TpyrfCrNR
	beQhonWDGTOQMP6txJYOo+i2je4uXgKwAK4MgNloDF3LMiRXnIu2IL4hT10vLsuCWZKGSSHprV6
	I4Wd3gMo+fLJxZKpF5BiwOqvl/obon86ukyL8jeTtPXiRa0tn4dZRgIEY7x6/qMISdhm9ClWFw1
	x58MsbMVds7BAqYSqCRnfUNgpACTCPo3e+MTlsDemifmmGmxvpFvXUXDN1oPThoBlYj0RmO6WM2
	slayJZIzBLG7Xr9OLdzpnNOKMomii56XRIWsrP6vAJ9Mkz/nT69Z8oEK5yvZTO5q85s5tmki33Q
	CQ3URGNR5+CHizFfO715ciA==
X-Google-Smtp-Source: AGHT+IHj1hKtEvHY4K2obRAbNlNDdOGviaxrQInMcRrSsFARmQxza4ZWUoKeC3VbewMkZiKEd3E/Ew==
X-Received: by 2002:a17:902:e952:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-22649a39147mr113462995ad.27.1742484276613;
        Thu, 20 Mar 2025 08:24:36 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:36 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:53 +0800
Subject: [PATCH v5 03/10] ARM: dts: aspeed: catalina: Add MP5990 power
 sensor node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-3-e161be6583a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=843;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=BbOh4hpBKP+yiYoTLN8aSP+ooMjZZlQ3ZAt1eegwZSA=;
 b=t3XeTPeMe/feqDs5kyWMJO1V/KGXDZV/e8pSivSrIpjBo0AGxGT5K/40MgRoH34PqMC2NE2Ao
 STCG4dYtDd7BiMAKbAO6DBcz7ALnIqU7gxBuIE9ZodGDZH1RkiU29DZ
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082437_697882_4E38DA56 
X-CRM114-Status: GOOD (  10.65  )
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

Add a device tree node for the MP5990 power sensor to enable monitoring of
the P12V supplying power to the fans.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 307af99e833c..f5f47245796a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -428,6 +428,10 @@ i2c1mux0ch0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0x0>;
 
+			power-sensor@22 {
+				compatible = "mps,mp5990";
+				reg = <0x22>;
+			};
 			power-sensor@41 {
 				compatible = "ti,ina238";
 				reg = <0x41>;

-- 
2.31.1


