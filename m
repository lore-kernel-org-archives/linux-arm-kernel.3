Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A097DC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj1zenE5stas2VJD+6DRjlrRKD4iBr3hZsqLVnUv8iY=; b=oLzwM2UZak14vxVtkOXZ6+z+qS
	kSXMMCvF4XioMUng/pysENsZfija6r2o2f44rH3bfQNg2yEqyJPB/4YyjPGTAl//kJHu3tain7c+C
	+x4my7FD/J/FtGDo+yyeVu/TyCyeVEZOkLQ2uLvGKkss3ndqechekqO+1Scl9/Pdew4JkyTt95YCt
	6ljvuLi1SVK9YLG/vGs0rJNo46VcIvCxUJAsg4PMy+fKiLRDUxus+JMzulSe7aKSi/R+Q3JbmDE2n
	by4EgkaWCm7qSVMxKaZ86cgfek1wW0vzeOR7giSqxOMuEzXdfqm0vImI9UJmyPwMKkzBatgWHsCDc
	teq+nR1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHvG-00000009UyB-1gwm;
	Wed, 11 Jun 2025 09:39:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGSi-00000009DGY-1Uir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:05:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-234fcadde3eso74664095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629131; x=1750233931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj1zenE5stas2VJD+6DRjlrRKD4iBr3hZsqLVnUv8iY=;
        b=k9Ss1dSMvM8gStL37CafPgBqEqSO5Z2HkFZol1s97kmCpQ3uJCkCyEYtPYSzyBwKZ2
         OJGoun0rGQDo9AjO5ZDNUG8bcUqmrL4jHu45HJKlaBMFy99j0X6syAMlsMla9BFMp0J/
         wx33VtSJtQp82PblRt5pQbqsu/Kr74mLKsRMoeIud0Xu9ggaNutdmyjAv7iAqCdq9kse
         8QnSgIzRGbBIZdLEt8h+PE0By17jX7UYkscmOB6jmMQm01P9r5OEWE6c0jbmjAgUPnHP
         ni+Dvd0zGIMrbbaqZv+5DSPu/F0sENOJjXNvhBjElRb+0LIOeVx3wTdpxPgv1PrTL1Vw
         syOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629131; x=1750233931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj1zenE5stas2VJD+6DRjlrRKD4iBr3hZsqLVnUv8iY=;
        b=vqb7tniT5GNP/ZVB4CHXrdVVk8ZgLWW8HKR0nsmOiUjfcEwbqS5XyLuxpOddPzplbf
         Uh+FEzJi1sfI7YbDh6tPBjdKi2zuxtt7Xn8CJKXnEIN6zcri8lVAq/+GqbcWeV6zP9XN
         jibseV7AJo0gWLfNGXNM76UsQYNyC5yyqf5jazkScZstvdF/uBZrXeOEzkk+XhANsQYR
         O3fF+5wb3q1EIMeZH5e6DavU5QdP/HeYmSuic4DfT/7CpjeSGRafrwoBvAVKfYYAv4nl
         t9FhNnIv9oOElqhtAQ9exmheUfn7Vnk+LWRxGLdBvQ6QQmhbDhFLHTmo/qO/LAMfdtko
         ezZw==
X-Forwarded-Encrypted: i=1; AJvYcCXOAgpA++cvLwI+zTt4I9nbBEgxzWygrWMHiXlavmuyy0gDpgTYDITwbNom6ectpXs8P4G1g6T5VbLBLOBZz+2G@lists.infradead.org
X-Gm-Message-State: AOJu0YykJL8A/sojd5e3Mo1uM94KO8NLrCuA1LtYzmF8VtOJf0Jp+rsp
	wg1Egm2CXFe3aCes77zV9cUuNhWby/N1vnESNURrUGlogpumhXNcIa/q
X-Gm-Gg: ASbGncsraTqr4Fxp+QGwXlx+niRhJDAbGSCD0zkh9d8eGZysU6V1CFX+JWEpq6GUGjK
	nhk11+ohaCtxuaLusZUC5//iN1Z7W66Hiu+0oafOvbpvamBJJFI2aL4iOnJL9gfhj3ilz/wU89N
	3eIZ1usaF4zI6PAAUISiDvRwQza3Bo5SmyyNI3MXSNB5r6yiEofN1byjpUYBQ++KclbGEobHcKO
	zSepdYREqlDyGmcV8EqTDTkI+ne8FeiuTJf7lkVRPCSUUCrRVXIs1VKISlkpBG3Z7rmdyctRhZQ
	heWIPW53QOSs6tVz1y2isVrTVtltq/J0ePjY0KuRR/OohlQ6gW7OB5sp9cO8OwJ6Lkmm48paO++
	m/vnCGRlKklQGXBc7vM0wysKmKlPKau+O/KaIgsBq5FL3Bc1+N2SSS+pt3Dd5bWMv89HNP9oXRm
	FyTP6bybdP8OOIIhNX
X-Google-Smtp-Source: AGHT+IGEE0NB+KOJm2lcRtePsnbhbM8oKjwg0jXC41etm70J3PNq57ezKYYToT/robpvQ8dfHs0VAQ==
X-Received: by 2002:a17:902:f645:b0:235:15f5:cc30 with SMTP id d9443c01a7336-23641a9aa11mr37444245ad.16.1749629131598;
        Wed, 11 Jun 2025 01:05:31 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:31 -0700 (PDT)
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
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 4/5] ARM: dts: aspeed: Harma: revise gpio bride pin for battery
Date: Wed, 11 Jun 2025 16:05:13 +0800
Message-Id: <20250611080514.3123335-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010532_403307_F3004E19 
X-CRM114-Status: GOOD (  12.80  )
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

Update the GPIO bridge pin configuration for the battery circuit
on the Harma platform to reflect the correct hardware design.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 25b873ace2ea..fb026c8fb0ee 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -643,7 +643,7 @@ &gpio0 {
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","led-identify-gate","",
 	/*V0-V7*/	"","","","",
-			"rtc-battery-voltage-read-enable","",
+			"","",
 			"","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
@@ -728,7 +728,7 @@ &sgpiom0 {
 	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
-	"FM_CPU_CORETYPE1","",
+	"FM_CPU_CORETYPE1","rtc-battery-voltage-read-enable",
 	"FM_CPU_CORETYPE0","",
 	"FM_BOARD_REV_ID5","",
 	/*G4-G7 line 104-111*/
-- 
2.25.1


