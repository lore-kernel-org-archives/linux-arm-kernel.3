Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2523D75BB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuyF7+8Fz7Mpttrs+fI8NL75TsOEWtX+J92XFGbgaKU=; b=qkDkJ5I3wuWsH2FpkxMoLKAaZc
	aw/TArMmZLSg7vf1yGDOo036jDu1AI7bO3fPBk/gLfHIB5KkLpM/Pb+r/tLtrkDJxGWiLC53nycWR
	4dtUpsxHIyJ+TP8PlfZmBnXhLc0MBNYUo9yjkk8f1xKDOp68YyJRhU4MeprtGDg67/XSbuPYPsv3b
	xx7lwJ52IcdAUyS/Q/yOmKrk8QNUhIWH98tLn7bng0Tj1uvaemqOdv9vAMsLw/2P17V5sgbBuesf8
	+VcOkzSamVelcKZkbpXI90/ZCkyqKwhcisNxLM0m9frSZCsZNwuCOWSVRxX1MgazXelJRdvU4rH9g
	NEHvOEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyy1-0000000GoRb-1EUI;
	Thu, 21 Nov 2024 04:38:57 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyvb-0000000Go7A-326y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 04:36:28 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e382661fb79so424611276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 20:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163786; x=1732768586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuyF7+8Fz7Mpttrs+fI8NL75TsOEWtX+J92XFGbgaKU=;
        b=f7TRQBJ52U9fd0oAG73jYq0NBpbFPKXLTnC0FfklkqRoWv6NcUNLPD/BaBsO2arafw
         LxvkS9eHX7mptKpjPUKUXx9JibEaTEtmH+5DBiZadHIUKbB5Rw6gZVG5dqGSfrJTpku2
         ZRWflz+k0ncTuSAhfbj5N7XfoxYnfkeVvtDeRYebWrpA7KjYR4ZkqrmJa0wPp1IxQyJr
         5T/pwUHadVz7+gS8yWdHYPyMevS3kpybP7IkeADUQMey1Jvlp17QA4XfZAHL6JtxBfOU
         e/J8FEsGQ7SEn4f55efQMdc4H4GgSsS/BMq3Qg4wPmo5HgB8HQYPg+ZKSNijIQKMTGoR
         GAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163786; x=1732768586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuyF7+8Fz7Mpttrs+fI8NL75TsOEWtX+J92XFGbgaKU=;
        b=WwjwQ2oNhyfPRNs26rFlsjgV89xJGxGh2iooJjHxV6EF2Qy1ggmb3PP5HriFb9xBrg
         phnNFtz1IkR49RSWSj74UPz0ZO/cLelNS599VJqsnGabdF3IKayNfrZM76JwqHZQLdk3
         IPqpbqBchZsBFgtLg+zRCCUWY/oCVLI2ksDff4p9SmyDaik9gaZWfvTTmeXYgytah2ya
         3kUXDhbMlk3S3kdEJky0A3uGnhE059qhtR2l7PPKqu3ofmrIjpCPJVwHB5jTM7oaoOs5
         5qDYyeJV9o4Dqne5pJoysTNOpJfKNzuJ2n+uhlfYO27pPN940UqYl9NTG+guQBgBYgV+
         rApg==
X-Forwarded-Encrypted: i=1; AJvYcCUV41aCIpFUnp2YAFzVFvzZEITGboWp0FD8f9tDRfL8gmrSG+8ND4yumBcAAh8T7NRAmSiwbUxMcd4CwiXHYwLU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1JTE+GVE/MeVp94Far4ucQBVGf278FLRYRzysRvZcuXJypkHd
	sY9WEERHFN6wMQe8T9ONYa2iE8sV8+9tjqoWkjJvkaSNj8qFtz7Z
X-Gm-Gg: ASbGnctgPyvldymYj90O16funP4OzOUb1pX+ul7e9L8WxIivDs1iG/fv3PfnE8dHE2x
	K4CtXRdJ9Idq8N/a3wLN4/miQ3ENfKV7+Ed4pmnYcdQwgnDc/1DZeGpcUaJ5vfK4lmxYMNQreqT
	fBM8D0EtFGznqK9VeqvupIUGeb6Mdf5+uucORtF83vKQtlnSReJXYHxP6BUVB9umYoah+pI5Dfb
	uwvDkkijTSAoTsH8AYB38KwjqRzPO6cAoroIci9aOaC4nkzRqVWYZDSqtH/83Nt4AukLLDpCPIw
	URZzlH20cteA35bAnlLEJhp3dIc=
X-Google-Smtp-Source: AGHT+IF30ME5s1gaJATBRjBcX8Rto6d8Elgy0z54nRN46cpfTIYfKGmrsKdWfd4s/uRCQcRBSZkQDA==
X-Received: by 2002:a05:6902:2742:b0:e30:99c0:af7d with SMTP id 3f1490d57ef6-e38cb60dd1fmr4909115276.52.1732163786614;
        Wed, 20 Nov 2024 20:36:26 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64e11fcsm402013a12.15.2024.11.20.20.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:36:26 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 21 Nov 2024 12:34:04 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: catalina: revise ltc4287
 shunt-resistor value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-catalina-dts-20241120-v1-1-e4212502624b@gmail.com>
References: <20241121-catalina-dts-20241120-v1-0-e4212502624b@gmail.com>
In-Reply-To: <20241121-catalina-dts-20241120-v1-0-e4212502624b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732163781; l=968;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=FgpAIoX+4e+QQroE4QsDxMK/L1w728/CM4HFCE+TVtE=;
 b=BICNuLr+vifOMwP7TqOnU1nthYmDGgU8Prg5w33jLmWC6dvW4VwWc/9Zu3wGhVdjBIjx0EDd5
 qUdPwWFlLp7CjHJHpQKpOCBj3RbEa9Xfty41tXlgOVXDhtTrMhVEUOJ
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_203627_761712_12B3CB20 
X-CRM114-Status: GOOD (  11.63  )
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

Fix wrong shunt-resistor settings of two ltc4287 nodes.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 82835e96317d..417c0d12635c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -512,12 +512,12 @@ i2c1mux0ch4: i2c@4 {
 			power-monitor@42 {
 				compatible = "lltc,ltc4287";
 				reg = <0x42>;
-				shunt-resistor-micro-ohms = <200>;
+				shunt-resistor-micro-ohms = <100>;
 			};
 			power-monitor@43 {
 				compatible = "lltc,ltc4287";
 				reg = <0x43>;
-				shunt-resistor-micro-ohms = <200>;
+				shunt-resistor-micro-ohms = <100>;
 			};
 		};
 		i2c1mux0ch5: i2c@5 {

-- 
2.31.1


