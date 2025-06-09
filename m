Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C82CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogtXiXkx4WZqH8G79S1Yssb18krXPU183LuPTKY7I4U=; b=pbke2Ad++1NAv5ir0V0PwU3Ac4
	JuwDrOd9dg6q1bgEsIMyujLAFcMqFOWQHgrJOGCPi4WOyP4oOhoSSrASkABye1WXnc1TG0KhV2T5Z
	1FktvyuSLZO8xqwQyYO4rHWUm7CwDrjEVTnvQ6Ll6b1DmaqGkP8szhRayPii5G6HDee879V8DXyD0
	4uLGZcZJNB5zVQ9OUsDNqXa0e63AxC0K/UO82C56lob7s3f3Ztx11oZfu/kyWH+HJlqm8/E6+TUMk
	nWaj7fv9WH97yl87DFDNBDIPSw1RC50815r6hpDA+RikQbpepYYI3TnlHYdl+1mkBz6bpbMtuNqwi
	34AfuJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOePH-00000004WTG-3axV;
	Mon, 09 Jun 2025 15:27:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdyq-00000004RVV-2gmQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:00:09 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-747d59045a0so2996610b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481208; x=1750086008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogtXiXkx4WZqH8G79S1Yssb18krXPU183LuPTKY7I4U=;
        b=IJlPN6Ywgd1r9XNzcSyYYy1xqwGhJFQXZkgPdFw3e2R74J9Fnsq1+uXV0wD2Arcpcr
         vF6YhPGJE/5c03FX3KKllb1E61/XtZ0OZ44BYhwCUExDhfgrNd8sOyDO278GyJ8fj5CD
         moRvLmX6VNbXyyOmnqtRddkf99Cjx9C2iO1vFtcsdWJ8yv73NOYji3G0oZbmrS1S0ko8
         uxs7ZtZzRr5H3GR93VpeI/+trhYuEtgzzm8NocmnVbiPgIaE/uxpyuOpqbr81ouSrMBI
         4MUKVQVCoGxq63Q/PJGFFnwrRJSvNP9Q2Lc+VArmxHO3H7QVBurRBgjqGC4o0HAdCiPr
         6b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481208; x=1750086008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogtXiXkx4WZqH8G79S1Yssb18krXPU183LuPTKY7I4U=;
        b=GjYTZCtGUCCsqlk7cCuidmrsrnwAT7ExDprNRTxiMimFsuY0qu4NkZrx9/W7eUxZGI
         WWPUR738Me7lHhDHRdKhiej2nD4yiQefoX9g4h+Qxnvk5Ud8e8fZ61/Ct0f+lXGdz+5b
         6TLV5586HY4M4CiNhkAK+XVWl6lAPZa8OIFWxFxTjDkp6rmSEa0Anv7aybh0i4LeyskQ
         4ORoaOv8lPCyzkH2zxmhfe+onhcg6Y6tWgNOKTyqntOx52Jk6vLcF1DHu1vAvtDdHUaZ
         azo8QShZa2nTHJYBP09Ekin9gBiexZy0/VSEWMMw0oM4nSukVE1jMVe7vqRL6VRXzbmN
         yhsg==
X-Forwarded-Encrypted: i=1; AJvYcCVQJ+3toPuxHsxviUdx4wZj7hYeuc/g07+Y4bH7y8dNmKz9NiUPhty7peWNOnU5v8yZTDUxKhgleHcdHXSHiMz1@lists.infradead.org
X-Gm-Message-State: AOJu0YzqB/HudCuCJM5xlOfCFRYfcvwAkTAYqPaW2Btkxput0fSFhh5W
	T9Jhll38UxS0HXwlCZ7F9A9WUeOtIRdyEfzdDg0wRV1njRAPeWbhKnEO
X-Gm-Gg: ASbGncvg5pgA7VhpFwi7Wnu+5OHg2D1K1DZHZBmLa7d781kEWImH/x7nEPCn2HpjHvx
	O3U59T+RxDQYfr++nA2Wa/fmTgSzSq6TY3MTYhML9cvbFhG9jeyN0ba4Guh7zOmi/CzqEwpUlBd
	DQqtKEmHPkLkUc5/ypEmZhzygHuh/f1fljBVtt/69+/LXtpCWMJjuz1cJsWdnUBbNsz27f4dxxO
	yScE9b95AW3VKSk7aWyTRWTej0ixTtpl6CQfBvn3vxknzxhXDYo1O8bql3v+Ttc+bSQKFpx/ZsR
	jytROWyWUKypDK0S6IrN9YalhfWO40ZqlqTnJXQiZ34c4BhKdu2IdDChJsV26Vcs
X-Google-Smtp-Source: AGHT+IEhXOXewiBTFc1amD6QITaRhM/nY252rISVeVNy52heMhbRNrbj/wYyN5a43z3WhemAZTQl1w==
X-Received: by 2002:a05:6a00:3cc8:b0:740:3830:4119 with SMTP id d2e1a72fcca58-74827f1284amr18716284b3a.18.1749481207756;
        Mon, 09 Jun 2025 08:00:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:07 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:42 +0800
Subject: [PATCH 3/3] arm64: dts: apple: t8015: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-3-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8Kq9YB0zmyNVXKjcaI8KvRlzGiBun9FEnKT9ppjA9V4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbsVEm9DwSwD7k+OQ2G5s5bkIeio917XiMie
 sYqiyO012eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb27AAKCRABygi3psUI
 JLmuD/0Q0Lc9FnDAJK7JKlsO1+iodTtVg7weyNeZx56ktb1/6T85I0X8E7qq2ppwrPjrVEcyZK+
 4uzg2VY80xo/TGM5w0lSo+r/9IIAB/9szxZ32RA4LjEOzF+VeiwB9csxdUt/ggkeRuYRbsvgG58
 DFfuTkol7cT9uKpSmGhnoo8zANLRCmGJ4aunZ9R/nfwVOMO7tr0FH/bWiOy8iPhYIMUkp3FQVy8
 4gOZzkSB1YU6uhjbWITrK/JBrMAKjGZqZOtAkwfLYCHJs4YDLosuuN//QbAzVNAoSenzd+bGhoT
 zhK/rITZAJ5N/PYDGY50/sUfvYCfCQSEEtiifDP+R4FcXkbhCXwwKoP1HWYrky8Qf0Mxxky7Sa1
 CbAJyTrTvKr+328UjWni4h3vOPclPFYFEusodryMAqbVShdGHcSYg+51tIQXi1V9tJE9rR8z+Te
 7+RFEBup3ml3cl4ikvzY5jf7RmZGZi2ZM/H8koTwGVG7mvd89ZZaq3UvFduN/z7bE9aPdKKDFhp
 MBdK3ksGQF2eGo4GU/u+EXipTUi0ksqmQeZz5hHNQeRUlRMu+S5mb28YqjFSWmmCaEOhsXkygPj
 /Rshm9rrXQULT7Sud8d5hXdgmmIhOXrjHQejzsOD2mjgXvkSKdAkw/0dKOJW7KcuVZOPVGfSFOG
 R9UmA5+bPKkO56g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080008_689495_9D2630CF 
X-CRM114-Status: GOOD (  11.09  )
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

Add SPMI node for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..2eb0d9092da3218f75e731e49132a9f8ae4d0c9f 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -344,6 +345,13 @@ pinctrl_aop: pinctrl@2340f0000 {
 				     <AIC_IRQ 141 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@235180700 {
+			compatible = "apple,t8015-spmi", "apple,spmi";
+			reg = <0x2 0x35180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2351f0000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x351f0000 0x0 0x4000>;

-- 
2.49.0


