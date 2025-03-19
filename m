Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAFDC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 16:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynDxjrYa7FoAeUzjxX8ebcosN+KRAaBz3z6tbCcoZ00=; b=dfpSif6IuG7uIcos2CviOKkURj
	JRuATz1WVes/s8+fnDrKT1w7vHfMcBw3pqsm94vekfdjTLpOocbazJKP2FylQWeviuyS5BhDg5lDg
	QjgJNnlvNLaa9d6zWA+ue4fT362rSRJbcQFS/XNKjhL/T8rEq7C/ea+iYVjpWWTYoXs9InFgy+JC+
	qnFd1Tu0WKyyrdhx1lmI9xzq2yZP73YUYGVhpGRtETYDk/btYncinIwBhIlluIm68Q5hkaFtE3+lJ
	1KRtHBf8T+lbESs5k84TrOaBJezdp4LUdHPB8d/geQ9hOmQxE8C2eKFijZZ27vImxXNcqGFNZFQhu
	F/p+5hgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwkV-00000009cId-2zwt;
	Wed, 19 Mar 2025 16:58:35 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwcE-00000009asp-0tmP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:50:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso1628893a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403001; x=1743007801; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynDxjrYa7FoAeUzjxX8ebcosN+KRAaBz3z6tbCcoZ00=;
        b=T1Q7cX/A400nxhFqpyXVh37kod+Ok4Lx2t9aC9ixosVrn6kPUvBoDvj5AV/hUThoCS
         +fKkHo+6AcreUPnmyVzBEVkkRFjzn59J2l+YRxaFg2yNHfmO14jiHokp9U5JPe1TCaE6
         tWYll1EMTIo2lQZdEYBhhd/9TccKxw8kPMnvj7qmvpi5qJ2ZNwZUwtImXn19BDhxliyi
         BKbGRpsf2SncMIXLqbvxeGzK3CgaiKGDnYhg6gvqYU2npNHJXAtheU3Nmf2hg5m7R0ls
         NxEyzggsmicxaSmjypwpz8oxzIVMRoRB5IIzayYa08wlVsUnoVPED+KbtEYMxLm20/gV
         ar2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403001; x=1743007801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynDxjrYa7FoAeUzjxX8ebcosN+KRAaBz3z6tbCcoZ00=;
        b=I1T7nh8ncB5X9h818zLgZj0ePcwXyEvoBg3TVRlYMBGyzu8JZOxNdR+HKLwjQyN0nL
         rYeUKT/iTTtSm2Wwd5BTK5KxQuWB1MpXwpJbzximx3BUhuU42s/vKNgwScSjFNxInaU+
         j62XhhjZhCnymjvJe/o/tt+KrihnrjY+91F6WujpFW0lxjTJWw0l/sDaKF0TIVtmmA9N
         ZzQAblajQ6CCtQK5OiK8Qma2ZNJ3Sz9TS6njd9ONpJxXgdTSbUsfWR21ylbXQ9Tm3UGy
         xM2TZTNq9cQXsiczPrSSknyPXgf9T/YxCcTpYYiDFZLphq7hEcurGmvXMno0txA+cGko
         1EHg==
X-Forwarded-Encrypted: i=1; AJvYcCWOBP/8xdKyZfLT9MzI2ndZ+yE7JJSwd+ASihjTTi6mEEy60WAMX82yofkJA3ntWZq3u5uiCjwDIlIRO9InkuhG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg6RdmEu92NK8XEQChtuSk2aX9//jFG0DRXAufWSxyNG/9cNSC
	xowmMhktvS42oG2nu91yYLjdIXl0Wu5WAlPM1SPilJ8KW5wrjnt0
X-Gm-Gg: ASbGnct9GdO0YRPsRaQQqRFHkXHzswS0DlgYNsFc50ELLJPPbFZDjCl4b9gG5khpxFW
	nGFaoyfl4xQJTOux6fm9f5VtUXkkKgpmkIigQiqCTtapokwG6t09PjvEnRfapk8ze3Rmvirvaew
	RXbpvS0JaIPwxEPENXQhmA/aGyrIpgDJEz2DjZ9lHEnS0se7h9f62PfuS/OOfjKiVaky3G+PNyX
	Pg+ZLpeReYRryErWOmIIjhPi4EUurNXiNy0FT2SWjMqW0fxrBQNjiG2ragua4fKKJVMss+pFRxk
	1wVJz/nm51h/vEovRkwTbQqMlJlo7ricZQ6yPKhkX35Daqm/8czGQ915Qyhmlk3XSBXehJTIVbf
	m2FvqoTLCrcEHUCCsx0uq1Q==
X-Google-Smtp-Source: AGHT+IEPzE9naIMttqXOLhoUWRFXUcJblI/+wc2t76fDOdhnGHN6yVS446XwCmDa/8Wd9X7f1CLOGQ==
X-Received: by 2002:a17:90a:d2cb:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-301d426aa83mr318882a91.3.1742403001305;
        Wed, 19 Mar 2025 09:50:01 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:50:00 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:25 +0800
Subject: [PATCH v4 4/8] ARM: dts: aspeed: catalina: Add fan controller
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-4-7c34b8139014@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=1019;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=t7ANTDBR075H8RBppIiRK9+hZDXy+IIalMi4npH/zVg=;
 b=DZjKoG8cTWZG6sPj/bGcrkU6N6K8GsHjDI6C31PtF0z67BiheTqcD5gV1mBny5NXifJpwOO9T
 sFU33e0hGu0C7S0SK2ayEIL1wcZ+3oY5Xc/XwUq5BOtwgsp4dM0E/tX
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_095002_267162_0A362EC7 
X-CRM114-Status: GOOD (  11.25  )
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
index db999408e397..0b513829f2de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -526,6 +526,15 @@ i2c1mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x2>;
+
+			pwm@21{
+				compatible = "maxim,max31790";
+				reg = <0x21>;
+			};
+			pwm@27{
+				compatible = "maxim,max31790";
+				reg = <0x27>;
+			};
 		};
 		i2c1mux0ch3: i2c@3 {
 			#address-cells = <1>;

-- 
2.31.1


