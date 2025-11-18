Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76645CED26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHVbT19SoV5m4YcosKHhTcv+qnuVQe5xO2ZctZWhciE=; b=Lnl+2fzfhtavexEwA+tvO2NiDe
	GG51MgB9LXMhNRacva3AVByxx/hQWWIJTZyhYfa9CnEgnrz7SS5msjNDI3sbsC1bHOVRPCno+fXN4
	YQJNanNp74UoeTrNjqdHLG46KrOgipuenduPlzpb/pXj09I/nDk9GRhqcVlUZFqrBhg3KWvZnrb7q
	C/qjkfkgPiCFu+6dMISpxyEULsIcgLpXYdKWH9s4YuED0QBoPi9jrw9KCkITV+UJPFaHT3VBiCV0r
	L/XuUueN8XO9ROjaQpBsrtOhaUUNHg2C2taDtMsY1wMEhCiYCc3IF4j3zPkKkWIVChXLDmlaBQjjV
	sy7j9y2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJLI-00000000HZR-2hHF;
	Tue, 18 Nov 2025 10:53:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJLB-00000000HWd-0BDK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:53:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-299d40b0845so39939585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463220; x=1764068020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHVbT19SoV5m4YcosKHhTcv+qnuVQe5xO2ZctZWhciE=;
        b=WIMKpjYJ1WE12e+wyGmcilXy45XR0Ftbj2fBbU8ZYbS/eAjNiwtJsnsJR7PiWAj13v
         qQ/XerHPLVOxO9LemYqXRCe6ZSQndF0hwTVFaA1QJTVhWqJg4xkDMLwacWozD/Wz5eWO
         v5EJQDbJ0doeBqoYJOHctsHRzFFNSh41gtEkRL/u/kj6TH+8vrTqckO2Usv5sGQoa6p6
         U7bljZPtZQWOmyzqEzedubiAH5TvN/RZoVvjj6F4bmwyVpXmi82fQEDMzfKhgfEC9u4H
         s+z7KqyY8wssBrcR+R8AGu8iVnlM9xLX6fqbqs4RchHKmt1bx8f0XrIAi7103nTHZcLa
         gUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463220; x=1764068020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHVbT19SoV5m4YcosKHhTcv+qnuVQe5xO2ZctZWhciE=;
        b=ZJK1Zr2EI7bOUWR+IbP6fs2RAu9t7XRfHkBzcMU0wHmNDsaUK6SGjZqs5x6Ech6qM8
         zxBCz+Yh93i45pYbZlxAPUMCfClitpVw0K7pYz5FSkoKnby6y1o7SLRxx+eC6rItemA3
         6b0eWRMXwXPL+cgQsLjTwcSxodJmCHRX56I55sfFwcbIRurjPNIZJgwG9iApBpbQa8BV
         N8TStk2zftFTM2KRSJJJbjTZFjHTaN82GlaqtpkoysGoPeSo57KaM+hm3xM6bIV6aWIH
         BYj2Sbj0xDB7HCHsSv//2o6GhFhGK0fewuuvqF55DF3dlvviJlX+Ccm8KImdeXCunXV2
         0UXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfebK8MNlMP4XMhxZkEbCLfd7/yDxzM6y0hbYNZNtHO0APaGnlagiThVg2JBLFQpS4lUy8C7Pyk7y6mBT1u7lL@lists.infradead.org
X-Gm-Message-State: AOJu0YxT7mj7osi3MwfKXc5gxcQv86EcHEoYvFEXNp3163o5/AbC2cmv
	synfNm09e1N6nA7cH/lSddYYCgFXLr3t50n8VBjGc8kEKQ9XS7dNfI0u
X-Gm-Gg: ASbGncsgwaZ+bcl4Ozq5HxPCDh4USODcVYKPlAfb+0t7CRXHNu0wXIOMGuBDNWBMWJG
	48XYL2RViUK0HTMCWwxdoU9VqIoye5i21buBuvkppwkXQvdt4raQM1HUzfUWbn8q1qnsZdXm59u
	UAjSvkF4d7bDst/aQ+6vdNXM4sc86JvDf2RsUgFgX7CC4EwUlBY4xeSm752z30+P7S6n6gBZ8UZ
	rIo0Y1Xil6KxrszP6NwGD/LEVntjYA9EIkBK8G5n9f5FNQpS0wRxUcWaDOk9ucpvqJc51d4TzCY
	iUXJoY3noeRXkxZrqRhS2BK3X2EaamTcynYLV/zfFKvpgxRSv5cyVfYj1zEyK76z6a8uWCb/wv5
	uFOldr4AZr3J74hT8L6Ce4dI99Sflcr+ghpyzd5z6M17UgBC+b4ukTZYAwd4T5MN0N/Ur89d7XH
	5cezeb1sGuhq1k/oYEoRC3edFEvMdy9aVp2BNm4wNdFKfg/UQmuyehODNU9/b4CR3FfZBYFsod/
	ICIC111vfZ8vTHqhfR2vz+sqc3yJ1zUhRJs91cGqpNvus05i8SbthJ0wPpyJ7cakmCoaRsMFdHv
	H+sf9N86Kg==
X-Google-Smtp-Source: AGHT+IHtRhbx1WQdiUDG5aFG9T4qFsxGHKIp2R0JtXKiVt8V59WsATTy92beJIoZk8kXpFVbidfKkA==
X-Received: by 2002:a17:903:2b10:b0:297:d777:a2d4 with SMTP id d9443c01a7336-2986a752800mr183541415ad.46.1763463220093;
        Tue, 18 Nov 2025 02:53:40 -0800 (PST)
Received: from 2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net (2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net. [2001:b400:e30c:5507:a914:c4dd:879:41e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be368bsm16274111b3a.9.2025.11.18.02.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:53:39 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Tue, 18 Nov 2025 18:53:20 +0800
Subject: [PATCH 3/3] ARM: dts: aspeed: yosemite5: Rename sgpio
 P0_I3C_APML_ALERT_L
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-yv5_revise_dts-v1-3-fcd6b44b4497@gmail.com>
References: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
In-Reply-To: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763463207; l=877;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=OEoDPVAl+S0COKkIlbVNnqQ2XcG7pPYJZgZLJdWqaeM=;
 b=4USKdt1HV3IaiPmMl+bPEbtszHgor0AgWJDbq4gqBruxhvUo8q11T/z4s2G7YCnQuS1soGZLw
 /YGhiMgDbX/DINgsGqQnz5J9GP4ANI7VTQb+UhQKnY16LLvQDl8qHsK
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_025342_839343_3BF2BE83 
X-CRM114-Status: GOOD (  11.52  )
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

Rename P0_I3C_APML_ALERT_L to FM_APML_CPU_ALERT_N for clarity.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 45b8ac2e8c65a4f672e64571631b7f6944f26213..060757b7211a6da777c51d9f0c886796cf2450a4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -964,7 +964,7 @@ &sgpiom0 {
 	"FAULT_P3V3_NIC_N","",
 	"FAULT_P12V_NIC_N","",
 	"FAULT_P12V_SCM_N","",
-	"P0_I3C_APML_ALERT_L","",
+	"FM_APML_CPU_ALERT_N","",
 	"ALERT_INLET_TEMP_N","",
 	"FM_CPU_PROCHOT_R_N","",
 	"FM_CPU_THERMTRIP_N","",

-- 
2.51.2


