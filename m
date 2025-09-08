Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0918DCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=; b=dzaEYuoCr4wl55U4qJOEmq15HU
	t9ogCsNzaaM20X/XxNNtiokPkHkkzarJx7Q1llTHIJwx9ib8tXzsxU1gaD0YzgYYXgaDo8kTAeDSu
	ceSg5pofEjKRQp00VFABr1JgH78yibH27HWEkchAJRzSMTw535iXkGVL/zM8D0YSIME8FVXydu5R4
	MK0gZOfvJyLxpGcKlnw8OLiQUoWczJ6I5/B1JPLdPymhVfl0anBbqs4CuWtYGizOEKdQbpufN11yM
	/UrdaOobfCHXH0wbtjPK2NV6G/eiAECkxfH1O8nOsmU7xFjFIgkyz1jX9iCDAMuf2bABvK/ysHk9l
	9ii1AqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacA-0000000Gr05-37Or;
	Mon, 08 Sep 2025 12:04:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYhQ-0000000GERH-2O04
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:02:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2445805aa2eso40707855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325732; x=1757930532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=lqnUs3vvG+vNRBIox3chIpmPfh5OMQrXp9NSOqDWjd0EX++kRYrn/b4Uc7RtSxQ7/M
         VzKZh2eIyo0eQhx5WBC55PJLTZ9QO/kzOaR8nfps98k6zAhH4wKI8SHkzuNm82Ak+ZVn
         M4cPGuFspQiKTNYCSAZnhjjt04ZMvMLkttD2R3mbpJ6IKfPOpMvzCzvLV3qC+bN0OVrq
         IhwON44VWw6Zzz9pbfVMFHx6J81A2xg319AxjLB/kjAVYLEOmhTW0zSelU85DYy8WZC9
         7tPoC5PsNAruFhbSVhcqx2weWGmGNyejfgX5TH+b//uIorx9N5Otv9KAsdyJ5x/HySYs
         HmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325732; x=1757930532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=S4Y0yCKWZD0x6ceL8oB5E/20olngfbTgDEbJ0QLMzcXQlq+frGn/MHrG97HCZ0vw7R
         x1XZ46rVtTtDZRxWFj3KLa0Lb0MJOR9n9l9FHtN5vxR4pM9vQ3MWi+wu5Q53p1ArHOga
         VKSIzKAV6AiRPoF1bXm+o/DEOmJAj7QHHDj4WP0V4fLRO5bu/jK6c2ydvY7LliwSmg9f
         6gcUukZ8kTjRt7O92ENCdAVzjXWLSN+xJtA/f8SoEiM+WwtXqL1Kw8ktvo0UvZfEN+fD
         sdIRBC4KTLlwDR2j868DKt5uNdeNhFZ4wcHchvqVNvzaeB1rbZLb2d3SqTHSB8ZuV+Yj
         zUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVWI7wi+3yJDNIRoS5ajSP2ayJ3MmsjlkddNoGhz4owJtvAH3QbScmojRry/aLbQrEyI/v2ERMRVepEzxoVGFA@lists.infradead.org
X-Gm-Message-State: AOJu0YwNSISurhkaCbYJBOdIygVe7dR2H3WaZwLgOuRGm1lFe8l3WVdg
	1erRFOSP+W7RlbueS3loqg9GUyWz0ghEWeW3PAoZmV67NzmqSR/Jhop5hCSvjN+sYhw=
X-Gm-Gg: ASbGncs5coWPbcj4BZTNaEdn0hg8rFFuBmkfMdTh9cnr+m7touW+jjrZjATDA1uNsw1
	CoVBgSewZp0TL7zHNZEWsqAAA5V69fqucuQuAkTvBy5aMlz58fyyrb7inGs0niqQvnJWeXvad29
	BsgMiflP5W6MA4tv6T9g3pvFFYebbNstOPvb1QgsHEebuVDzmBhPVexdxpwd+HasEgzP1G0Kvaj
	OQerjM9jOWQEBcBKTXvBSOwzKE3dHvWtCsiU+BP4IBomRQsauCTRU8SXjoWNMkqa3AUlZHd0aMw
	pouMZ8yORMGi9EFIiJW09qaQUY44WObz5mN3DFu/H/pnHVY3tIHWccFTdgeAKRB5YsRwlYwiIB7
	/r0iqb4uFVivs6C53liYJWyRD49o=
X-Google-Smtp-Source: AGHT+IEaOR8JabCaDSqwAtyIemGzOsc6AZgodUmn0wckrYMNjPfuK9mL35dB35gjVYmM5JcfKOQZtg==
X-Received: by 2002:a17:902:ebd2:b0:248:fbc1:daf6 with SMTP id d9443c01a7336-25174c1a946mr104229935ad.43.1757325731677;
        Mon, 08 Sep 2025 03:02:11 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:11 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:43 +0800
Subject: [PATCH RESEND v8 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-19-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K4a8tKqeVL9BaqFzY33bqex26zqvwpxkE6HkJdl3Qlk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFIgN7AzA3zsULl1lyuey9+Dz2gDXqJtM3h
 icR5/bhIDmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JBapEACWJrARmkX9DGZE/hI8fBIDDVdvy5/7k0/9TyFg3XAvBnwIfD4gBCmipg1RtK2chXwzIYd
 YaTCB+YhIraduDc4zMHrItEUQrBaX33oRcsQDoHpIpl+8jFgMvZYejumwotCnhMhIyaGh9XWMth
 BoHK0bf5iUzW+nPz0CB21tD0NAJo79uOC7JFpW4fwteovhN3wvW3fglcBEIfI8jbBmIuuK2IGA3
 5qVD20iehJRzt2M4du+V7HurBDPtyUX2KaFAEjRe1wogOD0xhM4/9VGyawrteSzOkox4xiO2sKF
 PoTkTaVQfpzdtElEXr1iGzHF/OtV0aPdX0fDk2fe8+HmjyFQOWp+0uRAatJZgITH1FzVgnFzh4p
 WylgpiQe1iQFUAK5mTk0C97CgyZPvwGMVMediKAgqMHe8X2p+G0ksahTxNQsObrXk7yAjRrH4o/
 luaaOaUh8cdD+0eICfl46QSRNKDF8+t0sqodYZ5xflNgYde0ZQDYQTAdNqa5ZQKJF9vZmz7Hegz
 +FNTK20rIVVj7M1ry228bt13K/mJLu5scrNfRCxkxjUEUoQYodkQQwtTh9p4VN/+I/yEc8+BMVz
 xrJOcOQTAyDnPoU+Lu9BfP/B+3Zg+TjRBqSukK5GxA6VDVQp1t9ONrJWGHUjr+zI32iNzeIY0gM
 IP7d0vzBi+hNEvw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030212_610931_1178F174 
X-CRM114-Status: UNSURE (   9.67  )
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
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..ac203ac4d6eca75655cd590deba5c361accf2375 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -253,6 +253,15 @@ timer {
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
2.51.0


