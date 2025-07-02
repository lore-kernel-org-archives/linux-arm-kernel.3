Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F36C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXmso8g2COR1WBKWaY8Z/xRycJZ8eCt0dgwiFP5AhaQ=; b=IjKcJ1e8GYchWCSOr9Kn5TikdO
	pLKkDQ14pdNqVRgN141UzbRHWNfmQqN8D5kyGWNwyIrdVYfCf3E4iw9J3fP8hmvJYGCobNlOFFHu2
	f+n7o5OifgHKpSoOl+IOaUU2NFqzr1B5uP/onsHyEO63OzzquIKAWMzVKeS/o3PGjsHlHzMiA4ItO
	2luhh02twqsFhZ6/rGZ9ATFSWmsDGdRFqTwVTliHhHRdNx99joIT/oy9MueTGi5Tk9vHXPePzfAMJ
	9a01uA52FiRwGTKk+zQYX3LtrJiQP8kJTlVOjWqnrGtyZ/PFNh0c+TvcgcNLl6iYos2IWYyB+YvOl
	piUevyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpib-00000007FFh-120x;
	Wed, 02 Jul 2025 05:09:13 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpdz-00000007EQl-324y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:04:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so5176954a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432667; x=1752037467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXmso8g2COR1WBKWaY8Z/xRycJZ8eCt0dgwiFP5AhaQ=;
        b=EDhta21nNXaXkGy5+Ph9oq7lQXEs6Dh0cdj0y3gA804R48h4864Yt8Fsrp2IQ1fOEP
         0OjqziWDsXFWFgpip7UujX8OUS1dMp0LxgqZ32HFfl4C0C0PUSGmGdze9DNYrdgU+51E
         L0TbJLH+jmf6icU9BITftTshL5VqG0QVx9FEED1A4FmNCLpG2p7on/FE0Xce+FrYUTYI
         IgHUNqwavQkoMC/A4yeRA4BwsUquQtaYJJ0iPcj31Ouu7J0b0vyJl6P29P/Yomn/TC8l
         hT1jCr5WMJHfJOzwtM6eT7MhDLdSV8dSlEeipVNlO99CwStpXnl/VRUBlAVsv86w9+RQ
         TMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432667; x=1752037467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXmso8g2COR1WBKWaY8Z/xRycJZ8eCt0dgwiFP5AhaQ=;
        b=m6N2YRXNpIXr7dsassT8PoBXM2nQb4APven/QKkPhtig2L00vWGsfhq4g04inDkh3s
         S9l0Yy0lVc2NeSHWmS009T3p9ECRByzgzSlrHpyfvfASducJABIQurV4q7JcF5qnICDe
         upJbj4cVtmHGcDCPjynak8+wfeaOWhDuy5e0J42eHjP/EZsO9aF0T6Q68/+D/kGXF2m7
         1/35j/gfyVkPEzmLH6RcxUBXiDa7iQ4NgWQve1gsNyqGbN1CX4No2DT5Z6J4SUQ3qAGu
         MvAr8x2iTepBPvCeM4EC45mfQLvDb77AN48gVlNDSscJeWZpREKx67+yOwxtAvdBfopv
         vrAw==
X-Forwarded-Encrypted: i=1; AJvYcCXux/Ntkn16807Lv8z8zf6BOheMfyYUoJj2eatYdE43OCJ6jog55ba5DTANh5t1nSHtsJeaxOAdvWY5xKOnEcQm@lists.infradead.org
X-Gm-Message-State: AOJu0YywQ2pDY+qbOvuacc8fH0SoHoGFO+EG0/49MGy+0DwbV/fnqO7I
	M6JBcZ2q7XpaopvSvmCA4bb2Mw7Y49qc7mLXcz3FJ25SodzA3wtCgFZfns//aKqU
X-Gm-Gg: ASbGnctQAYkKK5Apn9QqoVO1glvnawBHN4INvR2CjPs+qOnNmfSxfrxDLGvU6SsIl6P
	RAWHuHcCM1RuPgNcINGyKXRqbFZdm5z3DSYcjR/arAXu6klXeiyREWMeWf1h/SSDDSTviecTFtN
	ZULlhuipbTEOLnddXumzG2BDS2I6p6A17cdwOzFiAdKa8MeovmIUmCSL0DU918IB8oOz9uMoq6A
	+Ae0PKPs7p1WIbulTgAXjBQzzPhc4JsDztwuDIL5fRd1hzBJ/GMUOsPZPYwdlmPyr2q+AUpP2Uu
	clUWuowmzyby+kqM+2J8hBzkePj4yuEzBUhZ+QmomhsrK3JznkUdAiNo5Lks65JD65P+rpMhz6D
	qokbR8BJ2FGdUX2yyKmWJKsBVWV0uzU26WEIgrac=
X-Google-Smtp-Source: AGHT+IHUG5YCrucrr/166eG7coq7r8DcPuqMV7G9sKstOJsamQmMYN1ozIbRh3jEQoxq+KuGWSkBRg==
X-Received: by 2002:a17:90b:2812:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-31a90bd4786mr2068529a91.21.1751432666963;
        Tue, 01 Jul 2025 22:04:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:26 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 1/5] ARM: dts: aspeed: Expand data0 partition in facebook-bmc-flash-layout-128.dtsi
Date: Tue,  1 Jul 2025 22:04:12 -0700
Message-ID: <20250702050421.13729-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220427_760648_FC9FDE26 
X-CRM114-Status: GOOD (  13.35  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Expand data0 partition to 64MB in facebook-bmc-flash-layout-128.dtsi for
larger persistent storage.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
index 7f3652dea550..efd92232cda2 100644
--- a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
+++ b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
@@ -32,19 +32,19 @@ image-meta@f0000 {
 	};
 
 	/*
-	 * FIT image: 119 MB.
+	 * FIT image: 63 MB.
 	 */
 	fit@100000 {
-		reg = <0x100000 0x7700000>;
+		reg = <0x100000 0x3f00000>;
 		label = "fit";
 	};
 
 	/*
-	 * "data0" partition (8MB) is used by Facebook BMC platforms as
+	 * "data0" partition (64MB) is used by Facebook BMC platforms as
 	 * persistent data store.
 	 */
-	data0@7800000 {
-		reg = <0x7800000 0x800000>;
+	data0@4000000 {
+		reg = <0x4000000 0x4000000>;
 		label = "data0";
 	};
 
-- 
2.47.1


