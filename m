Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1958CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=; b=k0Hr3AjLFhLlk5kYtyYpmorqwV
	CpiwkMx/9GNfXkFkM3liXN4U2ORmdg4aXS3t+0rON86O1bgoImGXJRKtxT6qoAK4Rnmtt5F/CGkrq
	O4TWkUwaKehwSnu3H0z28aC8+JqRvdhsmXigIVW0FBfr1iAXtUc4uwL5UPoxHGAMS8zZJbbrxbjg4
	sZRbV7ZV1yCiS2Pjz/0mf9eI06kIRIsvEr9kEtSwVpoUfoTXrV6Hsg1wgoboNBm6WYLzLWlCSy5GX
	PA4rVyd/4xFObYQw0QI+xRpVWGJQTSYqFiZm3yNsYu0Tz2D7cetGr7Np4x/nuKL0q95r7x8FrfoHc
	sO7reXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0U9-00000008CXg-3bCz;
	Tue, 09 Sep 2025 15:42:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvL3-00000006HjR-3TYD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3dad6252eacso2434894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412755; x=1758017555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
        b=ceYLfmB2pnoSBN62gMILtOztZHmB5eTAyFh+Yj425P1voCr2JT6S0kY9ecph98WpA6
         fRTTZddY8g0/HzbMWbZ3cCFswbVPOMEwDSvkQLzt0wYMjnd1X5oCVWvKspriNcFvmK/4
         ZKlSdhgPFmSfRGBWJ9NhiLikUgnHeWlUszKJ8QEtWNC4cQkE47GOR1rFvvqtTOxyzs7r
         mDLXhJMW0dm4fYFjvM3nRzWiA4KLtnMBcx/pJSiE+p1IoOj7liSkB7EF3nZWpXO/V2aY
         1vXCSPD8Ye58eXKC2+Mtnm043Am1EDathfJHD/3jsowORm/MJXWapCJ1RqYyMDHiB8sB
         JcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412755; x=1758017555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
        b=nJRRLquv/R2rS35LGnX/tChDbpWD15Witj5C0bX65OnkMk92mnYebq/iywi+ykyNrt
         vDhTqStvVNyFBu4arQ1989kZxqgPeaHipa9e99sIc9u6mKG08SLe4SHve/q2WWTPwtwj
         1xYETHx4sbR/8cTcksya8R55i7zhwWPSc97mciytvKn3HMCq2+63FpzOQVlG+pllNB6N
         cHQORxKwaHIMoPLSEYxnf7PN7IVBw19/A4Tz+hnJclXJUMquBGt4RN4IVFCF3TG7R/EA
         o2ALxsJJDZB8hr/7EhgayTUxdbxsyZ7Zb1Vb61NHmx79ADw1DfkYGEdUy3nlIcGnQsTV
         XeOA==
X-Forwarded-Encrypted: i=1; AJvYcCXjz+Zv5/95RyjRReLM3ptEr6lBMPuk36s/S1CfVMhYXoewkHx1XlFYBJUTrJWbubPRUbFcws9eIx4YTuU3iFQo@lists.infradead.org
X-Gm-Message-State: AOJu0YwwG4aViiu6y2CR0FcDxr0EnFlf5E5L3a4Kl1PoGpNtYgVwDVVq
	691VeUhdlvfjy9AQMSDGqTFdvdhtH4qrEmTOUdYNZC9hriIE8NvArF3f
X-Gm-Gg: ASbGncsp9HaAwkyWm8dA5VZi97OxvXgNJe13nESIl+/xiKJTiS9bMX2uWDMA5jk9hDD
	Na5rnurzcB/ih21o7Xpl1Ksvk8oHsYaVK891vMxQytLApOIzR3n2Xp2rH6dIq/nqxuLD6ugZz0/
	N4Cbt3tfoBtl/Pdy4lhB/v9/rdcQ+nSvbp5IlgWwm/0EFg1Y8uThQ5CgXxfGcyzDZgzLeGSmvdG
	g9Z22jbTlmVKzRctby5XJuGSrCgEOQtfnRhV+r7q5YlUxorM5f6GEOReGQLW8wRnRMgFYIyAblr
	ctidawUSUm90PF1t3UPJ498L7ZB0Oju/nZPv2mYNSjLGVJPaMJIy4sR/qBNHHLlQHFfNjTTwhNU
	sJtLQCKV7055SORDXnExIMEpckdNyBrIi+YBGvq5o1NVPLbmPPReYYcTClgnxO573ucykCjPmVy
	8ZSa+zS1NUygJeiKLnVLot5X40Yg==
X-Google-Smtp-Source: AGHT+IGkhJ0ZatSqTvrdN7sVofatAvU35CszjTeWZR69spsiQKrhVoFE96C4gnQYc/Sc1XJis21p+Q==
X-Received: by 2002:a05:6000:2285:b0:3e7:4334:2afe with SMTP id ffacd0b85a97d-3e743342e6cmr8608316f8f.5.1757412755107;
        Tue, 09 Sep 2025 03:12:35 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224cd1dsm2002355f8f.56.2025.09.09.03.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:34 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:17 +0200
Subject: [PATCH v6 10/20] arm64: dts: st: add LPDDR channel to
 stm32mp257f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-10-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031238_040535_22121014 
X-CRM114-Status: GOOD (  10.45  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits LPDDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a278a1e3ce03..45ffa358c800 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -54,6 +54,13 @@ led-blue {
 		};
 	};
 
+	lpddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,lpddr4-channel";
+		io-width = <32>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;

-- 
2.43.0


