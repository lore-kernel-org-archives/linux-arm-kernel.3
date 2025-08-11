Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360F0CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvqlPWZhSdmmiWIigJMbDMqEPBNiuGmslU3U6YrJSzM=; b=AVcq26ZZd/bh40e9gUIKS73JJO
	EP/3+0Ryp4NZixCSv5c6MhAuenyS6EFEuLv8dHrLwiReWKlyCB0bV9XZUH41gPji4EotCTU22gzvH
	8jADxs/X6YsTWr4y+biQTj2xsnkU212yy/wnBTGPJ9kRhIOxGERhAYzCvppPhIPYYP75COB1tKLS/
	tjex71RnvooTZZDKFNFioNmS2jQPERKpjoRMLUtGisoAsJHK4pHvMO8mn5c6eU0CggodzKIFNsoV0
	oLZCDY20hl3GOPEJ/22GWskmhzMjvcTTKeBvbu3zRQJVY79iyuLu6gVTT2CxFFyo7s8pZj5G53Acn
	AEpXQbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUfi-00000008EuA-1gXH;
	Mon, 11 Aug 2025 15:42:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT1I-00000007uUQ-1CQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:57:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23fe9a5e5e8so29381425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920619; x=1755525419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvqlPWZhSdmmiWIigJMbDMqEPBNiuGmslU3U6YrJSzM=;
        b=RuA1iQA/7fxFxjhRPVmvKGrFZSZqT8Dtn6IZMYozTwjiiBTUhaSiN/JGyi7gzjTAcK
         rZ+m+RzZPeYljJxwuXPPimD31j0rhPlNoWYp1/Mpp0BY2ZfPa7GDS5p8bsSEVz0iIt5v
         r7G756XYGn3ohovVBYI+IYDPtFCub+YTE/yDj8oV3vpBui0EQjhD/fEo712aUO0NRkjj
         NT78/5cqnLXOuBidsaXGIwZeI8FjMCje2rNZNjxCE9l10Fx8z5gxw0uqngoHj9M820qi
         gQ9tYRv1LUkucvichRacCRwnFkk0I5m/GocLMczQ5Zo1am2hXWSZznS/tjLLAHO7gMfx
         JQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920619; x=1755525419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvqlPWZhSdmmiWIigJMbDMqEPBNiuGmslU3U6YrJSzM=;
        b=ddMXnVu1DGwUgfNgpcyaNDYBwchAZ2x+uH9OiphzaoUPI5/wbOIFP2jWuEkCSDAQGU
         WtoQG7Em3xkErcys3q/35nBXZ6MXWQI6kNSeEz2hZhdCClMSm6k92RqQg+kODJXl1kU9
         O0iT7KdhpfjNdD0xAXaopjstmLDfc+9XAC6eCsdphD7OQQPGQxtK5qrcXltqB+bnb1KQ
         z9u85Q6bo7/Ls9W947dteYXC9P6+Kc/sbdyMawq/xn/2JfiIavLyt+4DIY0qFEFLjhcZ
         CD+91cRWISCcHz/MSPm9jMQv1mFKsjECIIFY6F1GQLqesdFoFT8drE4BfD/XzMXxm9a/
         TWMw==
X-Forwarded-Encrypted: i=1; AJvYcCWELvwnJbaM/VHJ4Te+zdY2knJG5vLGaxH0mnumKfDnJxadJvACYnkpFVD3DC50e9SdIjoDYA5vBR9/wXRGZKga@lists.infradead.org
X-Gm-Message-State: AOJu0YyKvnwbGwqWoB4VuBzmITy3dfUy43uWtQj9NifZAqDGcmRQ7nCc
	iJf6uELNJKpG+ToqRx5lu5JUN2y3OnnFRXaNB/6eHmPX77vUGp7oeZXW
X-Gm-Gg: ASbGnctJZqJHuETq787vtMN03OVmOfBX1Nf2+SN9PCeWiBIHCsNOOvKf/UEACWUp0D9
	fFiFNZkOZHlDZBq6JtoK44s8tWBNQsbn464EIOZ0B5ga8d5b8RodTu/s1DuonslJX3oef3Kgkiy
	Ipwz9KEQwjn7HjNy+mk+aHT8A9dVcM6WebUJKfHFl/xra8pg90Q4Qj+vvWjVukKRujgPmiK9tQe
	f+vr57VKT+u1nfYuhWxcnFRv3lQAD4o9EbV3lzWhBg1gkkQtclkBIyYTVuZ5Tpp8JBY614uW0lO
	SbSLIPGP5ecn84wI2ubrE6TLbuio8C5OC46zJ2SJuFxNYykFzbFzeWIxupAeti4Vdo7sS3TvnAf
	33OBtFjjaF2OKmpHVvF0r/3dfCib6qzTJ5rMhK7YbF0n+gpI=
X-Google-Smtp-Source: AGHT+IEsZJ5knQTrKEOjLGhLHALuJ8dOClagIoc9Tqof/fNLEY7nfP5yw4HDIQc+QGY8+JZrhHKDsg==
X-Received: by 2002:a17:903:2310:b0:234:d431:ec6e with SMTP id d9443c01a7336-242c1ffcf60mr188601795ad.3.1754920619514;
        Mon, 11 Aug 2025 06:56:59 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:59 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:53 +0800
Subject: [PATCH v8 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-21-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=GdMW0EI3NHNWYzWITffq+4XFB8Q0kMqjZtAqZZLmfYU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDmmr/1Q/2JTNVlaKiZKNOFPyBC3d7E7Vt6
 4mnI2+zy56JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JExGD/9OkeFtQH+ZC/vyytS7PXJmuvmPxNfmDu6U0St+yQce7QtoCz0Hjo1q0rGhX8jmGit9Ex7
 k/pTldefDseg+/A2BusnYnfNnFSpFaT/6aNUDHDnw+D8ytRf4k3bJyk5SLD6Gzii7R/YSIJQbvM
 j0BUzrfkvSeCgteMUVB9q2sNXDYXYzcy26IXVvyOY6q23GAY+icge4aBGxqUTDjommhs5gvfGLS
 XseKSzF3wZXjqz6MMb1JWsQr6RzHmjVdR1uBW1uHTcfzzri5B+xUKDoPNpx9hmsy6hqj1YcdYHQ
 yK9yJmFoJ8odHHfAzc+yU/Z7jCnbbEVIVuP0+MtY4DusP9+KQXE8oAL9sTxbmDXl36gjmv4KPY7
 uWnPaWvwzRfgqrrAjVWW0xY44DX+zxb25vKFOKpC58aW35SQiHYjm0JP3PxKIy1dZjSSgDg89FO
 JQTq102JSsRBkubQFd4Yw5IGJgHCA2yekAg4KvF8CkZ9Tqk7RcW3ITD7OvCe+EexBMwZYy2ZXzi
 ulxk6MthAl7ZyFWr/E36TdCz9OZWnscCs6REORxOt+b2/9VrGRdpvCv2RdIrpCS20X34UvXHS6E
 U8ePNjBW7+mq/IQibeih0n98a1rsymlgDjH4K1HAXS/W/7MpdPZoVNbG2Th1AoBC+5CLsWJqYYX
 kImyKMr0LMMykrw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065700_335680_5DA26AE4 
X-CRM114-Status: GOOD (  10.30  )
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

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..9bf5157f0e504b7394ef5354411d3d37e8d5760a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -284,6 +284,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -412,6 +424,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.50.1


