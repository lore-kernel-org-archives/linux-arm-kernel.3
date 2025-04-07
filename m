Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E6AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=; b=NUiScKWiqjtSfcHs4jqGpZaTRh
	l5+iYMllIogNvSzV+BFzxPF5etpIejcOU3sg4G55Lv7e8CbEG626eToguN96vaT8YclhxnESpMOBm
	hUcFYYVS9FkJAUqsBZIjGmwhKscVLDxXDHX1sMMucFiR1VHgxTS+QtXF488w37HT1VY2ONRs3OXCE
	Mb+hY6ym7wa94Npi4nH0DEWXS6fZvxTLZ/daYdKryFmV/xMgMeQ6aHnsz0oGG8aSdAU81Pn/POYqy
	/gKfTJthYVI3FSrZOwJpudFrLkCfRM3IZ/1Q0hrXWQFyxUPlONlvIacH+LlDaGLzgXFsrQx/nxqf6
	/YH9UwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1esJ-0000000GQzC-3rng;
	Mon, 07 Apr 2025 05:18:23 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eO0-0000000GMti-3luC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:47:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-af55b7d56a1so2656773a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001224; x=1744606024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=kJ1pVY1r4lvyMLsn3dA4W5bRzs35cLmKzbRhWEWqZpNXIq/izjeajbBGdLLQqIqqgX
         zh3lv0IhKeihaDI6J0LY+cGFHrdqD0fhZbOFxXsNtY8+V9SVg2ktUvOsEnSrFkiqlluM
         8O4W/Oo3cs1+20T1I1eKsTtv56fbqV3UfDUcFkGrsk91nVNPjSstqu3CtOWQUBwqxT50
         sCXTLAHCHRVBpVz3DtiBthe7DlPRXIZj9a/2h9GE28eouyagT1nTOSvHhZZXVZ3Ewf88
         iaFokXBrcss3nsNvBKNU0HxYeSu7IudM+F5JIrvKKksmIy/3iECbS5Q8lNt5M0zAP/l3
         w1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001224; x=1744606024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=WiKzLEA6ENAV+CBS7izBOJKgovQ+dV5TJ2Rp6TuPdFogoL+TmmcFsJXyNghYLKTUSy
         Km2bwDL2s7Y8zYv1XllT+hhHWa9n0d4P3q4I8RSatx3zgzWpOxKqIe2afLIOZnp1X6ag
         62/6amnDsir7XUh9BKm58X3qhI+gkbtiOIbOMub9SYS0x/duvPhXKBJwK7AOWjbHJi2v
         Dig48NqDFJCjVaS1bpeE13bUXlc5Y4f2/GVXD48zoGE3UdUpHyOAPLpBGaiQmKGH9KZ7
         lSEYjvERHQeI9nDWiJMnpSQtYEE94VnNXJkKjdT+neZ66UQ+wAbaCRwrzPWQZBkLkooz
         DZtw==
X-Forwarded-Encrypted: i=1; AJvYcCVjUQm8AZgW8Pf5IuTLWZ3JHlO6NjlLEOlqTmLahEIxbTVXTZ3iUini7YAK3/suoaVNEvKRX7UBFMwRoKuuXpwB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3wydn9CDpv4q7to8rV6liI3xUXPE+IEDOASBfkFgIij4mzYLB
	Y+DKwiX5odg17Y9jwHx9cKQMrybLOQORzNZNpEwNSKF6I3xOtxlI6T9cFw==
X-Gm-Gg: ASbGnctgJbJUFAjSkz4Zk9dmdlYmB5Z12BF6+rOaMM/n5+a/0ak1WK2KVLTlLWATQJp
	pxyDz+2kPnuDa4s2rEI8gTZgoq69eVXD9KsuhD26QW/RSYJk6KSUDiYk4IgSsC1LuEMPApOzBUq
	c/kBg04esC6huVq3ojWO+KcgEbvNUxefWoINwjVE2lLRqpP/GIvRJ96HJ1bgy4cJQfD9Ot72m3O
	QqKsP06Hl3+PByelM2Qx+IHDpj+EV6XHm/DvLir0yPdeT8plqoVOtbQBW5kueOINMDyqKAqgJBc
	TgRmHkUDm5sGUFSF1mIlLct1gCm0UPrei5VfQMLYsTXAaJw=
X-Google-Smtp-Source: AGHT+IE0r8ZCa3wPwQVT2JXNI8jjTdmqctdoQ9nSxWYmL0fJFs8RNi2jnGeP8GXAxNy75fDe1TLsxg==
X-Received: by 2002:a17:90b:2e42:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-306a4823704mr15643498a91.4.1744001224016;
        Sun, 06 Apr 2025 21:47:04 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:27 +0800
Subject: [PATCH v6 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-18-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIkXiBrt3zrY3WJU1Kcvs+HkHwDmKaSnZQu
 kGBfrQgRP+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JCG3D/9wNW8HJ5mruLZkPUoQshdnt8LlV1N3TSdbYEVZCHi+53035DIKB6OeCqrhv87BUBlo/Gf
 AabxUgFWRTwl+r+1x7kZ7KjaJbol//DjdhwBPICwk5pVuOTgU56S6jAQjOWh3/6gkMcQ/k378Qn
 E8x21FUSanhbMKKyz8QYeJ4O5IhJ3hL2FPcjug/0fwnDei4SnN6VdEpnorjm7mTKVHqlEWKaHDQ
 Wzeaw8FAVWM50hZYfJvf3et9/hSiBBsq+0P9UALilKn0r1RVboM/DZYz2BEoOFAoUxPUaE81mr9
 /Olcp7mpDuO3E/AqhyobaKSIavT6HPajfQmbe9w8z0o+3es/jad5zxM4H52KANmZZeSrmx4gvR8
 7qK9i8er7GwPSxfLjpUsc0jLEJcP4VkxiqyRFH/+R+ROGoQjZPIqH7UaRhO4z9XsCSDoonxCbUr
 OpDOi5YgL3okxqO4Vsn+k2oGCLuXbfQn6D7EnZEkBYLook0JMWkBAqSApzY3W+JCpz+idbbUvUU
 b/7T+dmzJ1LxHgtt4hu5SlyVR6X5aH3M8ToxUqY5ZJVDXPFf0ht5Y0BMujay7mnERFbMcCul53r
 CaSZIJRO2fuQ3nfgy9IPC4lArYJVBgCyN51pcA4b8jfZqXHrAU08ArLGkVi80thybNCAG61qmRI
 javzEDOo8L9iMaA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214704_938928_3ED85621 
X-CRM114-Status: UNSURE (   9.72  )
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

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6..cbffc84480379cb476d5caaecce91f746e862354 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -243,6 +243,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.49.0


