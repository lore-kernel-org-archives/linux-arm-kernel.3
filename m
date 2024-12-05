Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98277E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=mLDenDRPK7pHdBBqgvNx5/4MGW
	6MRMsHR6lhys/5DJQPwfhLatXFJUi6N9aLT1Hsd4tZObL4gd+wuLZR8f/073U15m7dJV2lfvdMU13
	QtfSvxwGfT+57tfTJfl7MKvldDMorAyp3I9AGn22p1Vx/56Mxyi6SQUpfRL9R4260r8UceWIYjhQH
	clv6dGPykUu9EUAZFr23CtNB43bZ0CadZai+btEk6hmOnIp1+LP1h3HyxuwO6iI8vO6h+MM/ABDCj
	VFoZPB4fAkl/vvucIz6Jn+LQXDB9DgRuAgX5g607tRH7hIKV3xEGGg3NbC/KKx1GCaz4pvBw9kWLB
	izTxutpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJA1W-0000000FiiZ-2oC0;
	Thu, 05 Dec 2024 11:27:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9ti-0000000Fgd3-3dTp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa549f2fa32so153885266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397593; x=1734002393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=FR4zX907IyvLSWMrFndYvVLe3uFGvV9lHSERH8b/yP76HTomk4E4Ubt61tLXkAWKG4
         R/SExHx9usfJUhxJq6v1zXCWf+E6gJpcR74MqWURkoYg7nNevGx8YU9qFD73JTIWimRM
         3KtNucr13lrFQwLh7x3Y0vbaqLkeGNs3biuJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397593; x=1734002393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=S9JHF12pGemfSMmLzuLNKTs5elB+B8djD+KmqoPv0ZGARwAeqhMaGIlW1qv01eM6X3
         vJP3W+KojJqhfH7WLVYVEmSbCFb8WCKX7sitVEuAjah1NIGZxNsryh5VfJtobqr85mwV
         cZrpORnkS6rDlzAYeQbyR95FNh9KhB5J/B60s0Q84am89/XgWC7rLtbH+J+d1cd1EHyX
         JWG48mMQQrei/fr8kiwlNuDoY8/hVk3o9A3lde2skBpDqXzjnrVEUHzu4+PoPAkIRg37
         Y1K6LbYacAG92xoTtxSJpZFEUyyGmb7e5ji6LuFgqQsMHJ37qTrpDV26Dlje93yOcbD9
         u1BA==
X-Forwarded-Encrypted: i=1; AJvYcCVQzvyH1SVzihYgzJEqJT9bqMr5/Iv1mR7VeH27/QejwaRxOp6bQQ/D86ATISCx1X5UeprMkFyvmSeyV7x27fb0@lists.infradead.org
X-Gm-Message-State: AOJu0YwvxNz/aSaYQ+cK/Ztf64/8KeFQWbwxx2mVdP+Q+EhWoJTnLUEs
	MHDErB4qwX5NwcPnYl6qgZsul6If5m2SW4dN0ty4m6UlT1iau1h9McubCeHnb6Q=
X-Gm-Gg: ASbGncvUbiIPRk3U+sRPr26IOk9avc6h65CFrwOz58tD6rGbn8hZsGNM/GzYVx4Y/iy
	t/6mi7zdoign1Z/xUsjmK/GxPmAmJxNPEZXWkTzSiPMFUJe35A/M+3pdJRqdySmaTFlxYV1OkGR
	tWCnxBcFeQ0Y6q2GEPgKN0X6HuIxKhmUYBw3dM2ayoOpkWlrSK3oaYWf/YsnhEVQNAZFHxML0dj
	IwrWOxTeU1gEAl3gduJGrpp6LofXvrDDqtmrphSlZvTk7c8Llj/FkTmTU79Dd7x0C0L7v6TLUfX
	7YWXcMPRwUnrECbqBFiZlhUam6alRuqlZgvksDQAab2sWg==
X-Google-Smtp-Source: AGHT+IFlIqOIxRQlaaVKv62iWGPtDqL1DgvwbVPP6DdzsmH7KN4sRitNwb9/Z7vHbZdE5W91O5vUFQ==
X-Received: by 2002:a17:906:9c1:b0:aa6:302b:21e4 with SMTP id a640c23a62f3a-aa6302b2e97mr32793966b.16.1733397593185;
        Thu, 05 Dec 2024 03:19:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 07/20] arm64: dts: imx8mn: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:42 +0100
Message-ID: <20241205111939.1796244-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031954_900099_280F8D52 
X-CRM114-Status: UNSURE (   8.88  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


