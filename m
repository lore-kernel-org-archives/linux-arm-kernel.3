Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8E6C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=; b=mbY8whlNKowc5QR7zuDCMPTZaH
	BlvLsSqb3wFygy8BxhwiJEnMS3hippAw8hEWeQmCYzMNjyWGe+Jwz1NmYqH1wyhnUmW4UcZ6tQxyr
	LjqmgDgOwUwMxCtRfwbLZb0TUo654Cn9qPtbMSJA7Ev3W/lKgoFzrE1CVLFRzW97EikaoWxe1JGoN
	nLfkv6RD3y/CK5HsSpMcEAx/PykwqP0NzZEFWEMAo68OkRg7/an2uQqtsEXbSEdR+JpQRbZVZ80F7
	2rOLQDRF9WMXoX+qyuJS6zlxw014CUIVriTP5FCOV43i7SchFjUAsD7SMvhbqIu+ii++T1HwbUK5X
	W4+MyVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tns4c-00000009k2b-3fIz;
	Fri, 28 Feb 2025 04:34:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrwo-00000009iyu-33Gp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:26:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2211cd4463cso32598675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740716762; x=1741321562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=T95OXTFCYM7HCG5oV93V/BzCr/hVsLC2BI5f8GjzoOR4OLZ31mW6xLaNtn5SFtbCGR
         Ksy6KFv8afmx43HnNpl23aeTrYQdVtmNMjV7qM5lVrPfxP+5WjahHPbOhZQicpr6ti8B
         i+by2k6KfysQz8fGH1GHR80Dn3SbE5pBPztXLF0AUIEY8g9Vt9coP+gRM+1LiH4ZJG8h
         xIcmq0zx6627MSStMufNAI5n5JzO5rlR8z4rksOK6H8P1+SfIX3OmYn8xJGa067TqKGF
         QA49QOKUxb68TyOt6W2qAFLS4jcX/sm1+yLHqZwf38FrX90/QjE3NBTP5BR+weiQSmxS
         LNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716762; x=1741321562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=DCd3qDb+FDeUa7seB/OrlzxPJBN8X1eflLJ/WSbhLnY7NQvO94J8Wd7Wes+muQRosa
         kwRPbG3HQgXqsogxlTWtl0g/b9XsEE/QCpe5+ymvJLOPbw6T634n7aBgD6BlavdiMKry
         mv+R9lQMatiufq3k/1JaUZJvG2dYZUus/F9pnmpo6SGkObhl916KslJPQ42PNvPVqSSs
         HQPLwcb2kh1igsDNltpkb5cLAX9TrjllqdaTfoXTJcH8ecmTIOHqFHdmlZgdfZwW8jiY
         S2g2SoNIVPs2H6MABe8HA4D7wPX2AIsez+XFSf8f2xz5djz5FBfr342nzVzvUIRQ2aBP
         zt9w==
X-Forwarded-Encrypted: i=1; AJvYcCXwCZBsbtgDEkzhZQ6Vb0hZiit5o3gG0WULAwAK+RTv4haGIOEiJHipZxcn63gHqZH54e08YobuozxxVLTrkVKO@lists.infradead.org
X-Gm-Message-State: AOJu0YzYXOEH3cCsp+81BBOaKpDkcj6ovntka/BGMm5DxQ8OPI5guFGx
	8UL5KGsgrvLQwwRQk5d0xrp7Rb07soz6jev585cHR1pw+C3zXr8N
X-Gm-Gg: ASbGncs3ZAfiunIebbwI9A1oOQoTO1KZfqHpgNIZWJc9EDHDGNH6DadhFqocjD4x02b
	+8nHynkRfmNuEfmny9y3B9+zF3qqdWaptcQpDLkBMVcD56nMjwJDWzAuHDYugXp9DN6BF3pkVxD
	cdZnZPLLQsRTozTdgO/6vFksiq9I4hciKRobVGnPolsxFJXJtPnhyxMhcsQhZ3zNY8SzlK0lM6K
	DBIcQNFNrZqdYOOulG+Qby+8vza4+ftmJndGj/Du/9ubACdthTXA/oRL3V5il6wVM6UDR0ZsnOn
	0pwcJDGYJHpHjG/ogjo2HChPBg==
X-Google-Smtp-Source: AGHT+IFN9RDW8T0Nw42judDpKoBGP38GDULwt+Z5nlzyDmf4maft+vUwsQUJG+p5WveGNHv5ketPNg==
X-Received: by 2002:a05:6a21:99a2:b0:1ee:a410:4a99 with SMTP id adf61e73a8af0-1f2f4d1a4e2mr3348169637.24.1740716761890;
        Thu, 27 Feb 2025 20:26:01 -0800 (PST)
Received: from [127.0.1.1] ([49.130.82.63])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm2738318b3a.131.2025.02.27.20.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:26:01 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:25:32 +0800
Subject: [PATCH v2 1/5] arm64: dts: apple: s5l8960x: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-1-4243fe8647a4@gmail.com>
References: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=BydltNMBU6F6QLU63AOuc0xk1HyAvUD4tBSVKN7rc/0=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTrQCWUFfgSa2s3Vd3yBbA52m0/0+CdUSIB5M
 Jjdg/pZlIqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E60AAKCRABygi3psUI
 JAanD/4nH6K0dM5YgtmL+DcnKJqZ9WPb4GXPbawmq+XCH8MJdyqz9lLdZjdtMX2HfI43IfahKQw
 +VIXnOPWUXcvI7PtHoSnSxqFwjydRo9xOytIxAjK4kIuSv8VzIS3UZ+SkMBX6TWAFymwxMuzpKL
 JsG8ng3zvr5Php624nywp3jalOJUceyduFKsRQ/F/aO5NCVXqHGxroPhruqbwo6bcBmx4aoUgHN
 3atpNlRxAWP+fG2szqyHZ6H5u20oQPKRSl0D9SmMV5r0xDdo26utpO+c9rrM/6PSeAwbL4oqjsd
 3+QewRoJhaOpHEdh1mXPEFaMezhim6N8SWlul7BCVVHswE3hNVMw45xTOPOZqosVG56m6P+I6fU
 A/kXidChB0sKKsT5HZnKKCSX7JcK2dVTsmrU1AUPGD91AlJj/C0R5CVPYE+fVpTs/YFHTXJRo8Q
 7Us+v5i4wtIb0SJhLK2l62aN+dVMOgMerQk7vocPwOCmP0joDiP0FU5xtqG5KahareH7GyeDmhk
 Z1lzNOvtc6dTaKAUCoQMnPx0WzwJe+Y3DPh8lyjNpdDZ7cMFP//4D4GvBjjCSWkgmGI/UYgPL0I
 cjAHhSfShPy+EMSAWymtFVo5ePQUw2F54chcPUfIrvdyyiO8zTWL1cNNKs8V1aw7T62olWuppg5
 V+qnVKowqh/9kDA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_202602_770379_BF8F34F7 
X-CRM114-Status: GOOD (  10.28  )
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

Add DWI backlight controller nodes for Apple A7 SoC, and enable it for
iPhone 5s.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index bfbd2629e206736822a157431ec959e1aa70f41b..8868df1538d68595cfe92c80b1fcecee42d348df 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -51,6 +51,10 @@ switch-mute {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &framebuffer0 {
 	power-domains = <&ps_disp0 &ps_mipi_dsi>;
 };
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..d820b0e430507f681a5f2aa13a498be98080e1db 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -100,6 +100,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1


