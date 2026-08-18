Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BEC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0US0ozN7L3SAjOKyepRf84tawF861oB4+zMdDmmleEw=; b=2YG9w+LOP4g0lejRapXR4mFaJU
	lgkWm2Afv10w603RVnXqbcTTVkSON8Muj7muszZD2ewF4sLP2Ii1jKZo+TF0lYIdt/GpgvnJGPada
	J7c0ph1LixROOjSTgFREY3fpKVtvvHmwkWMuMm111TTIiy8MDXPEYT42gmj/CC92pZYB+rwN95mRi
	4maMkjrDca1+/dM28xnTVaQEl7xmLyUHlTlqhXANduSybr/kDJ93TR7G2NUefAl5UuGDxbanV8iZ1
	eJXOsRxY9NaoYlapD6t8gcPJ4GqPyIt+CXweiToRMic4ZZjYI+tmEdzSmPmCFV0dAV94c4x+1Q2dO
	Fn2OUtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6r-00000007ioi-3dTu;
	Tue, 18 Aug 2026 10:31:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6m-00000007ikt-2hiX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:31:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so3752625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049111; x=1787653911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0US0ozN7L3SAjOKyepRf84tawF861oB4+zMdDmmleEw=;
        b=SQHQyRQlhhYvf20siqP8ephQlqdvm6u0fJWZLv9zm6H54EhthuP1aZFkWMM87WmJ7S
         XLP4Qek4KOe45Rm8yh0mPkgI3U0mKv3QFQme/vXK56VuoMurRhPbrl4zeFDqv3cvmeYg
         eBLOcDv+xM4yjuP/qlnAN6qfHURRBgeCgsTxwHUeT22f6RRytgz+ECluxm/cLQf6c9vc
         SKaOc7bJs+B77ZDKnW7KmyPwpu2RmRgjS5tA2vOD7bMHKXmTjcCSBSsSV91rC452XzTN
         GiqrcY9V+cncN1/aT6weMEhW9HI6bJiPvzmKc3MnAnPxd6hDbpo8ZcMbCRa7UDQni9MW
         J3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049111; x=1787653911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0US0ozN7L3SAjOKyepRf84tawF861oB4+zMdDmmleEw=;
        b=ONID4dpwP/Mp42Xa6EDirVInq8wlMMaYkEwlv51NnIcKyXUbOOPtLAmUU5bWZUILbu
         RhWdvqHCE8h9/s2C18rcEc9GODBYBWmMQSUnE1iSVI/TxUb2bwl+1oqO6HgXVvMqQT+K
         v2cF26S6F3NEVbJf8nPmgNSdRh0/q8LoBep7KRDEW3NL46GkdGYfIwqfqn4+9HxJ1qFG
         /ZjjTU76l2Dvjlg+PEKMgHT2LIezgxGENGhFAIsfE5EMWFEEYu3IrhiscAF7OIqsI+xd
         RMKIw9AxV/URGGzOTt4AolAWCKq35Uy+YYpXm910f+5IbbnEDTH5Zwy0Q7xfoYQIvPEL
         pVXQ==
X-Forwarded-Encrypted: i=1; AHgh+RphN6cnIOyTufSHx4nPrm+QB2bkN6SVoqxRBYkUkZQdb88TZAABDsbFg2SCeP+eXSYLIqfvgI1nFxqlxQ2YlES9@lists.infradead.org
X-Gm-Message-State: AOJu0YzGTGkHMOzEHTWvlUOPuulgFGCcuzPcP/UILtfW0QSNFEBgpzvy
	fsuSFFpEnFFlX/uQ78NA1uIVFvELHV7muLGF1/Q4JDIcT752jftgAGmAvnlYJxEODJU=
X-Gm-Gg: AR+sD11DR3ItnwSjbrYLEuWdM5/t4yy8y+jdCY7HjpFloavCxVc5rqUoEniHBHxyovs
	wFkKnxv5eikTd6QkfEMu2lMX5LSf52XPwWsU787He5b3bBEOCnYVB2zXG1rsa3/VYBQQxMMmP23
	cOaEshY+PT9eX4NCCWMSLrEn7En+W6KGaRQH7+BqvgOBn8yzMlSsJLsbRoxc60RGrER/rlFK0UB
	9SBkma6dFpdZVZ37gE4ZpkJVwrfRMKl2ojnnpc73mT5gbsTTuFVs8+1LPtgw0m+xYC8NOM9C7zu
	w3AaQAtno9KCbHYcdH9EuBWWkqZNboCiBiPdF3R+592WxbFYW2Z6tr1sIhia8OKHZyPtkua5Q7S
	JfXoiI0hKztNJ0lkbl1lAa3TT3KjLk4uNiuxPds5W2Sx99GEhY77HAzQocw05FmywZ1t3fhMbzI
	UlrRAYbSNZtNjMKVX8UlKcN6s2Lo5eWgxQHfF7t2IWr5xyxdsI5I+6wbZzAGmPZjIa+Sn0d/d7z
	rDIp4SsUJ9RoKgLr30UfRl3+9HA5bMTisQudXcZTpb0dD34fFViziOJwujt
X-Received: by 2002:a05:600c:1d27:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4999fae4e89mr107830385e9.2.1787049110979;
        Tue, 18 Aug 2026 03:31:50 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:50 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:18 +0000
Subject: [PATCH v6 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-5-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033152_710267_F3C81A9F 
X-CRM114-Status: GOOD (  10.27  )
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

Use the ast2600 compatible string.
Make it more precise and enable specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index edf4b74f5aba..c952e2075b4c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.54.0


