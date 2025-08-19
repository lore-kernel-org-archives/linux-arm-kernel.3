Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D948CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afUEtVliVjZtOeNo/hdpDwYyKku5Vsn6emnpI81Aarg=; b=HR+9uI4+BrcjPd38OM3Tcp+Wt6
	ocgp9K7otXv0GiRmsxN7By3McYsWJLJ4eMoMLAplFr2oiTnJrOZZ8CqkthElOXgIPNuutWdLJQuZw
	hIl4FpfMXPnhZr4N4iex1uOWv9T9x2nIj0LwfnJ1UXtecuNF1lQtvEiyY2GOkbYJ9uxmfjdHGtvg0
	at4hL0xAAenTTu6fouSupBMk64H6s6I5vHCgVk5Dg93AtF4NTI3OvlNkC+Y6dvNlCVxZBZpK2BpEj
	/2Cfpt4nt2ZY8FJ5BsrfqB7KxLI4qLlVXblPRDICO7n0pXJpAssFq26MMAEw79TQurxQPNdKOApT3
	MYMaCYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpk-0000000BCFy-40jX;
	Tue, 19 Aug 2025 18:13:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMD0-0000000AZEV-3F5k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb78d5e13so83978266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609421; x=1756214221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afUEtVliVjZtOeNo/hdpDwYyKku5Vsn6emnpI81Aarg=;
        b=xMa/bVewqtaJ/zSz4xTCsFHK1EiJuNoQ/Tet0s7MRUD7Cr85StkxJHKXeLMC45xXn/
         xXTvDVoesKx08L/mvyYTAkKXZyhxMyP7Ck2dn+kUKI7O2o3nYNOK0EDGqebPK6eoqJqv
         UHuI9PAguuCKP7NG0uRPh2A1F0pJeeS8mAWu4JblLi9OqD2kzDw2m17SWNMBiPOma8WQ
         Vln1T5tcsewmwBfw7g6wbbSNPIx6FjduWwdUisEgZS0CFf9HyizKlFDh9FSj1cBpBE+J
         ByDybl/EmOp1OxV9XicTnw0V52DtftzWCb00pIwxXoK19bHzsdkWti6QbrEqYvM9iTQP
         nCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609421; x=1756214221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afUEtVliVjZtOeNo/hdpDwYyKku5Vsn6emnpI81Aarg=;
        b=AOlo3cztOSxGEi9LkVnDzc1fwBK7436sdkLIR+J7LmNFWM88FDo/DK0c9Le0cOcCW5
         pwWVmw3AiP7IeYonLnz4hMZAdDRxDKmptEku5iRsu2T7+LJxY5NXD69/OfvczhpmDrln
         8jnMhV5BiI35uT3x3zUG58jbre1BGdrN4jFcVgd2uiaTYD3y9QJ+L+IxOv4S80DD4rYA
         UY3/vDhm/G4OkZf88mTjM1PZVPva/oOLi8XZWUn/SP3clVmGHrx9GR4Kr+3Auv1yjpDa
         3AQEJQMAzA3juzyVzBSYAO9xSPWpM83D+WXLL+dInVXb/kLNPPsZfSdaiheted+J3xq7
         ZpHg==
X-Forwarded-Encrypted: i=1; AJvYcCXvLBUdEbTWDCuEUse/UAwo2dbpuNLEZ1Q3yv9JrrGo0uZKwszNhQi4fYuxy/DES8/X8zQwp5h3L/i8yl4doXJQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8VoL+lbdaqdz0ALSJNtOwW98QT4ie/m3kvHUYNGQMhC3sYTTL
	UpfcD78PNJNpTv5B/bFj/SGrhM7W1uDOWA6AeTNT1syohPkRoW39vaMjNZyXBNJd9xY=
X-Gm-Gg: ASbGnctd3Na7fO61EGpzck3eY14TBQ48wn1dq6oP3n4Bo8glFLcqTAjY3cIqIwNDM0R
	E5sFomvqIG+QiwMtqhAtx2F1bPyFVv4aBf6ii+2FbJHN/ODx01eEj1k1syMUbaC6xhFIOzied6a
	SerPkVbRTCT6msOE9ERt2GOGcQiokHz2xvYdWzHbA/Dj/2ytwmDp24dc1MK8Y+cOZY6IZuTIsoi
	DPMnYHZIp6FoMl51grgtPBB0+OVqbtTl+LBH/uBJa0x/fHqHdi2sc0UY2CwgPJY1HMLFYlRc9Nr
	MD2yQaP3W5Dvr8bN2KexVEw/WBufED1lnAohm8OGPtgynG0awboBuXaMsFXDC5T5zB03S10q/6P
	DZmeGOzyHlyUXH/RuV5NNKORau7sx7qmcow==
X-Google-Smtp-Source: AGHT+IGtLL/rMQjhxzJkRlPZlnKvsoJ1pZE187tn2bkOK0e/dPzM5466KD0MC8NA4ckzjg0aedgAGw==
X-Received: by 2002:a17:907:60c9:b0:af8:fd22:6e28 with SMTP id a640c23a62f3a-afddd1f804fmr139748566b.7.1755609421010;
        Tue, 19 Aug 2025 06:17:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm1005948066b.67.2025.08.19.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ARM: dts: omap: dm816x: Split 'reg' per entry
Date: Tue, 19 Aug 2025 15:16:53 +0200
Message-ID: <20250819131651.86569-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
References: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=DurH8t9HvSvsgH3oRg+Ms+SKw2PItKWRZVBe+tEhchQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlED2RNTR+gOn2Nk2+yeF1Ihk8AB0mmN+Q6A
 BV9PMIiEuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5RAAKCRDBN2bmhouD
 1yCQEACXqTIa98/3bq3O1JqYDp3gG6RAC1NUdM2KPR8Em28++Xh3z8FISafVDmkIsiK9DZGl/DG
 eimvXk1Y8oHTqKOzA3SSL8lMcT+v/nn/l5BBZDTYv3jmrizFHdah18lX/Ay2MAcTD0Zd988g38P
 1aN+Q7fUFiCofVUskLHo4UgNOWab9pNsqP9aCdD4Y1xp8V1QZp50ExH3c0qKxPCjsQgmXZ1+9o2
 jW/7FUo7ipHjHdmTNlH5X3ulXI4qRfcKU5NFleIH1BcBpTBEb7318kwlDSkuiaH6s9PuJ1bqFWW
 QvV4e3sj0Bc50dYmjB+CM103UFaVy2uRw7i0LC5tWVYFPgeZrPbKYVRS7MY7o65OhtiJGMp2IVA
 YPcBwDmDcphdcIm7ERMneVOe4GIBc377EuuhOcENPsu27Mcx492FNhIzXsY/2lpUvWm1ePqMbMW
 +Fzdk6VswXWJFynrlOHJuwi56zY7Sd6jty3/Pwe/dYZ3we4czC4QzUNbpLNPgViNA02XaorY+Ne
 yuZPBJFllB5Hf9ZbUc7/zhK2/DentWxlmgquwXCEVxxHQnbnxQEbRxktZKrebYFDyZUBwMN7ynq
 KBQ9MCU9F1ijlY1iouBVP1kt/fg5Ek2iVfBPou9csJYu8Ev58kkHbgqKGRvfiXkJRq/2RT1cdIN oyHSeQgK4x/Rv0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061702_808479_FE0744E5 
X-CRM114-Status: GOOD (  11.00  )
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

Multiple entries in 'reg' should be encoded in separate <>.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index b68686f0643b..407d7bc5b13a 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -643,10 +643,10 @@ &cppi41dma 26 1 &cppi41dma 27 1
 
 			cppi41dma: dma-controller@47402000 {
 				compatible = "ti,am3359-cppi41";
-				reg =  <0x47400000 0x1000
-					0x47402000 0x1000
-					0x47403000 0x1000
-					0x47404000 0x4000>;
+				reg = <0x47400000 0x1000>,
+				      <0x47402000 0x1000>,
+				      <0x47403000 0x1000>,
+				      <0x47404000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";
-- 
2.48.1


