Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC87EEEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=; b=w1Rg881j3xQN2B15AVoK/ZP1Tv
	s+KUTLVTL77RNdG2uIrlhIi9aREp/Uw/QuelRR/gjys0z4f50sKH1Lo8O0SZ/Ytv/bdV7cQR8tDIV
	lPRus2R9DiomitqcGBN7S4CGNJJodFVMs9C2X5ev4z9uuyXY31ssai0S3gMeOVtebkgLU1v3tV50h
	SnKDeJ1BaB+CfkZMqU2pyKPsRZO6JXBd6Uh//EQlgHmaXD5abSoD5Vyv+PZoq9YWT7py9y+s/vi7H
	EUMfJ+Gnw+CRO1UJegz2lv+EzRDOPKEZdAeRA5l5z5qLdZ8Lk5Sf27YS17LCcmRYzf8HTTWQcBeNd
	HQJb+/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEbE-00000006jwC-1bP3;
	Thu, 01 Jan 2026 09:04:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEbB-00000006jqq-1fsE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Jan 2026 09:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=; b=G+VVdULVvlux8hpazvBpogSxRu
	O13SsRADqOqwQyPSWJUFckAyy8oa4cmxVi9JYx+6h9Kg6wBiOt+b8zBHNYuAwrW8bHw/wkpLppg1y
	Ppeutn6MoUFSJLUsD3Anzi8hLY4jpyqrW/OYXIKPzHHLU2AmHx8sTg24jpzXvDj8cz/1Q61zp4e9c
	J4OFMoh2MIgf7Gx3rkDW/8p8/RGUQAji52xQJDHbt1al9RaVRGTcalNG4FiQYPZXkGCs+N2uAvbQq
	kYtbRuBr9ZWqmzK1J+Au2DQEszm7oU4Z6hoWWNPJS8AVdWLHGeCH3LW1omE6MlWEbijaM95QvKu+n
	TKyL7etA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEau-000000057kN-3c2Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so9851954b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258220; x=1767863020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=JulJwExiElgfsxFagF+0uwP6NFjpk6WLgK1DbEO7kUtO22CpGAmG4mbz9P265+dY6K
         LtJPzD/MwFy5rBMKLMLD5RuN/3HoveDYfekrHNf7KOG05LlS4p3Ggkx52l15kQmgJUyC
         eImMGvcSFEQM6W6PqRTC1LR8f0seCqEDeIUAp8/GlKQ968Zwpcw1hdRB6fmCXudC7M6f
         jMq3FLrhKo1IOKcYZ0IjYlH8WhVtyLugRo8K7Is1e3oGRauouYEVS5EL9WNYGHcIaFKJ
         HpuLX1klpckcg8hh07eqzwAlN6PB0HH252LeFTHYLuhS1iqEDwIoqHgPNFQXVrPRWaey
         cKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258220; x=1767863020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=OSy9aA7l82sop3j+mZ+tZyVTWtJp8H4Rxm69xZ5Xvx8UwMJVlIkbW8ziSjNcYNVcdT
         547rarZJwAo5OqbdV2d2s6EWhgYE0/M1tM0PUZPpK+sd7mnc/JdE2FSfuhAowU1LR1PC
         Z0whP2Zn7zs/+BRSZ7EBfGESTfPayMgPgq40Nf8kSBiHThRFwzEJvp/x+OTLh2/g/+fs
         vI02b0Q+m+N5+lKmxgdg7oZudnE8bPxPA7409yF/zOwU6JS+K80Z5k2hKi6eMqxjOKIu
         zeeA3E8J+FLs8YSkOcqqL8XsSYemciz5DDrQUYmtQEdeyyDUypT8LQaJIuUM+KTCiEFf
         l3kw==
X-Forwarded-Encrypted: i=1; AJvYcCU630/x0sIqMGnhtzd5iYGUwyVz9csyJ14crfwDgWdHeMb+ayr/+ebLYnONyDtiHWlMaK5thCigkEQ47lovkL2/@lists.infradead.org
X-Gm-Message-State: AOJu0YyTb4XAWMbs4XLz/bj45I6yovuP5gVHTD6oobXtHTWnXE9Y1JQh
	T00T431+FJeKrZLM1KRRECm0YwK58itpqwyVDz6sVlPouG3As1CbiQms
X-Gm-Gg: AY/fxX5EAzq8QHHTiVchUwLopwTGMxOEU16/bQ48XXzm2pj3KOjt2+ul6g8tkheWoxU
	EWFEIPxTpIhdGiTtx6I/AwXb2fL+Qi/yp9tHxkKWNqQd/O2DEU0azgsa5GZCDEb5v6ub6isWvtr
	eAPuDTt8WSxdCAjbqI1sTLgZ5nDZqAdigKmVLmERMWz5z/7ioRHhuUhwjfObBmdlLooTpbsg/yc
	7udfdOaQtgMXHkLzFTJSGUpDyqvPV+cBfqiEsC/8C3S7i2DIF2fz/uMDTw41lIOvIv+8lQ+OcJB
	zUjbKpH+u6hvGWo5gn9gFk8lSUsHQEbtkPQx3rQmubfEJv9o0yAx3JjUAPpeXHGQwOQC2iXRUBc
	kLOahHA1QWPZHr+EF8Jw5Pq3DAKPfWRhoc53lauw6PlD5NDqzVjy4SfYB4V0nBceIwLzLrZBB7t
	at7tFQA9FQSLsz
X-Google-Smtp-Source: AGHT+IFe2eYmVWLE8qLLK6tWjkKXLBApqyzquQyvEELPpD7zudq+rhR0KNlRnMSRuoUBRZkLLMtt0Q==
X-Received: by 2002:a05:6a00:6009:b0:7e8:4398:b367 with SMTP id d2e1a72fcca58-7ff66672842mr21088807b3a.58.1767258219859;
        Thu, 01 Jan 2026 01:03:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:55 +0800
Subject: [PATCH v10 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-19-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=OX5KL+MG6sfpo1KjHjEhXoAalFtdpPr6gBFVJvOaFLI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpeeS+UEfUxUfudtiuD+PcujvuHezCHD5z8
 x9ladDrvDeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JC+uD/9SAW9UXMI8I0m8V/UHzOCtWUTPWfbNC2fPY4pLYEu1gNB937JUCCFEL5QoFfVRTabvK15
 RaBDG/EzwT4YHXcHyPN5ehspY9NIIh6kUqh1+oN689J17ZkRtisRM+N391Qfgacwj5XTjypx73O
 y4uihlGk+Ha1D9WAzs7L8OWyVGvRuxZIoTqUjdPWhKgHPxO2KweN5v2giZOpmJ0T1w2uIjjGaPa
 F4yli6Q9Ck8Mx/wQ3ls1nuA7TU/21leS+84f3t0KDBQTByLZTIv4/FtfKcZdncLjlY87evXI1m9
 2l+fLDspjdaFUMWpgmDsLCoir39s98aqLwa8y7M67+jre9zBXMPpHCwK8IDSant3skHQU2mioRF
 QAEsruAQuPI4u94MAtgtfEm3jmL6EZoz1TFRWdo5alsh09Z8/bFFIrurHAAwOrM6ayecJyIlxbt
 YDKh4UZTSvzHeFqIiWudQNuXu0bAZKN0S8VGQZGONe6hPUl8PDbf8HMWLTFIsLakMUSkhvime0a
 Eo3/STxQKgq2S/3rnHxyKSATl7/IdJeZ4QLz+UzJn8VLN9r0We88iZHVfrw1TCZIdN6DIzM5tUI
 lgF3Vzr1oA8AAdrUCjMWLcd0HruyQujEoxW2QLgzBSSUlxTEP4NvsVM/3TwdkIAWalc9qjlWW/r
 tbo3bM8BJ14ggAA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_090344_944668_6D9BECB0 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 039aa4d1e887625e7b6ad789bfd9aa032dc58d01..7f7b0230cd648eba2533f860622f683771197bff 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -329,6 +329,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t8011-pmgr.dtsi"

-- 
2.52.0


