Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66DCC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InBvecGhedFSGu5Dcom4sxZqi83xWaTBh5VQlTlnfP0=; b=17wUAp4R09Q8Kyux+fOvRiMQc8
	zWWiH85ct85m8okXd8XHaZF8Y1Eibmz/S/r7zGiJ0BFWdy8aEMRNNExfuvMsGD8cta94gSHY9K3pX
	NkS0W8OjEgQhYIu8JjPguXubQuuvhprpKnj7o7iR9IKHccfdghliaATq42e9CWJV3OP73ozXqV8DR
	6fE/dZ+DYCqW5kOFdSWyaucxwwJ+dVeTh9tPhLiszRPuG29l+LLRUegCUE7oqoRVp59Ww0d2PopYT
	+wGCb/fEJGr2g79tBZ9JASg7u/Hg7Ezn2anWo2JtV9SPhDKWVbT34oCyx1V1CVuyItZq1SQu9ML36
	SH69nbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTi6-0000000846R-1z0O;
	Mon, 11 Aug 2025 14:41:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSyj-00000007til-05pP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:54:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76be8e4b59aso3633911b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920460; x=1755525260; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InBvecGhedFSGu5Dcom4sxZqi83xWaTBh5VQlTlnfP0=;
        b=EpXGziBqG1vKPIW3TLsGUWxUPBvURe2jen4XCfUuzp4BIOYsox1r5ch/C6jkyCpASF
         hCZtMvn/BA7fJyMXCAWqIF8pQECratNBClOq5t+TlbpuxrJ70LGyZqyWisV+2t8+J31K
         CcrN2uMzYPxnIPwH4DH9cKY+DUnh22LJEiDyXhozJBg8idpoXVa5ruNwj8wF63CYQZOK
         TO+MIbin4T8R96LsMulJx0qxUK6ZMEJjGdSGU1LaXEhfAJCI1Zuu2/D36n+pnbiYMnFK
         TAzcqrB5R2U7LHcwV8wbuXhV9GQMVn5Yt3uxYut7veMFEv/AgAGLCbwYC17ySyjWB8JF
         IqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920460; x=1755525260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InBvecGhedFSGu5Dcom4sxZqi83xWaTBh5VQlTlnfP0=;
        b=kaLfVO37E5fRppAYqsvdIMIye9lN2vITBjO3Z/1ksN05ccdblK3UQdWMfZmUs//dVv
         rsTorb/abyjYlblUx2Kgw0Ui/2roUoBGmMhBS7MK2tqf65N47TcWqYAfhYsC2GRnr1+i
         0qrk5uGTZqCDd3Ctbv1whj91ZdEADg2DRhs17M4VdPi/nbYpagDV/tnupPlLoWwzY5ou
         39PS2UHaZfxrOjLdopSNgAWXlANkJyEH4mcE7qxvHy1I73GQ1wZRQE83AgntjyALPepI
         cnmgsRZu0CPxP17dkadyhtxCMaTJRMVbQp1snANeiVWDnsKCRDEi0ldzCsaeHJLXvT2C
         CbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1EPitGhEEmICXEJqHtos9PTms2uRMP2mT5fiC9q4PRxutMiCiijwj2q/rOSAjkRjo6xEimuT+1Ug5OgqjYD0U@lists.infradead.org
X-Gm-Message-State: AOJu0YyrToDw47xN4HlWz55k/ZA8LQ3iaP0zbFCXMRrWQvDIngMkyKSM
	1HhHSC+sf5ICkoxYU5JH+O5vk0zpSMXXLl4mGGlKzEc8uk6sSOwv01H1
X-Gm-Gg: ASbGncs+6i3YW7IlJFJYH23Bts2w1AqVuB9gpG7fncdZWSVQkMnuHb6/SQyVgrHna9K
	o83mvc/nVtuPGE7g6nsQBdz+GT/yICUYVUQ7/RcevbRf008D5JceFco3CHM82URpaYAH4QZXDlL
	BqaF3TuQJwwTQOJdJ+vvB5O7ybITRGK+2BJzDlCgWVcwYCC1+23F2739ehKneRvryXxun0ZRw7w
	VaHgI48Gumu61dl0f8VrjF9I6APe96QxBibBrtEM2c6bIu2M9I8Of+lEUG3nU0YBZnGpMpKVQsZ
	u6+B/iqpY824SlVzhiy8EU6V1dHDctgAhm2Kkp2tZRPNhXQpncifuQcqmatZRY3B3LECMVKk7J/
	bfyOBwQiBocnUmSWAwGIQFOBZL8F5pSbUO+nFzS5AfUmjUho=
X-Google-Smtp-Source: AGHT+IHgqw9wE0vqk9PZuypkaZC6yHDvfMteYcqaUMA4xnpqeQP11i3EVr07/a/IvVKndMHAC1zZqQ==
X-Received: by 2002:a17:902:ef48:b0:240:640a:c560 with SMTP id d9443c01a7336-242c206b2d2mr204600595ad.24.1754920460174;
        Mon, 11 Aug 2025 06:54:20 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e899d272sm272976285ad.135.2025.08.11.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:19 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:53:57 +0800
Subject: [PATCH v2 3/3] arm64: dts: apple: t8015: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-t8015-spmi-v2-3-a291acf0d469@gmail.com>
References: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
In-Reply-To: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
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
 h=from:subject:message-id; bh=6sIMtSPHhd2FTXHOBnTqWI7MAFm5VIlJ0J7eqlFrmr8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfX8sfXf48Z+wcbAk7YpYAspcIELf649xiWch
 cZHfEwROuKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn1/AAKCRABygi3psUI
 JKJ5D/9Y1nweI6YbiXz4vEhpuwsR1nPijEazr4bvFRnZa7AM5/JWnAyXvjTss6IEo4DvNWwOCiw
 oZJCdJLdJZFXtXSlIBbnHu+M3GmN0fyYz/Wk6vw6HPPykNNzsuXW/4V9DbMiahRr35U46zm3SOQ
 2+ijoFe/tbo+gExdIPybeYBE5OWq71rRwvWq05/jhxNRHq45Vrj5xW2TWUKHmETC8/2QH4KhSGv
 6ezyoEw3GEld9pI1g2LO/dWa84sQ+7Qj2ELQHcYzJEIah1mmxTksRhK3eHnwcRO7wboij93Nnfy
 bRKD333sg0NG0Qv6WrFR1i1csR97yL3/BnTG/8hYTrH3SqckRSl4R04IziE4SunVZPlNMtJ7VRu
 TC+JFS+SdYqFX6CvWG9LI97VeqGKmw8/6psttZpxeYjqZyVflbT1g3oY7lbicR2Ky7xoeSXsgw+
 ffI3JstSacuFTAitzHP2rkZj1JMxE9x9ggU4IpokQe1n37R7beeP5Aoj9LKWRSc37kig4YYV7R1
 CU8XP/L14mmhf/cKCdh57vLF7W6DByI0G1uQilwTupfL711HWBRyfVpd9Ub/hFFmE/ut7flSxih
 XdszsFkWHB46QlAkLdVKdrjsoKt0EzypgnTC5arXHK99rOXDr5aquDAXPQz/NdVhLLa6kucgGv+
 7WUw02KZDuxft9A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065421_065473_EA9B0D12 
X-CRM114-Status: GOOD (  11.56  )
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
2.50.1


