Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88227CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=; b=CsNxj8IjETRvqOk+qYtWszAT2Z
	v0ECLbD1dvARxBElHMuJxxhihwN0J/dlQo5o+56iE8JvelCy/cdXqmugtGdpqOtV8oYxCYa1DtEcH
	yR6i9KgXYMqQYYsfdCXlCqImtjNeEJ3OwcPFQg9lbMC/L7TgJdIbFJIfEm8G6amVPW+QhyB+bsOae
	YdOVZNQWQd6oRLTkyXyfkO/jBE5oJ/22Lvah7kD5udjG8IVsQFyi+6sgJ0cmgucEN7U9GLQ7hq+LE
	DsbMW/3raMmZRy2OQ2zg2y0NwDiVJusQSyGJRkFAmD9olINCCpgfSURRzd2J7VE2HudjiWXQDBWyu
	IdsFVYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj88-00000003B1j-1ppH;
	Fri, 16 Oct 2026 14:41:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7m-00000003AjG-1uRa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so120015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161692; x=1792766492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=sk+RwwtNBr1BiBEEvwIi7klem3MpTNgp+grWWlddy6X+YR3QTSoRQODuER5Nf3Lnci
         Ob21fdDbU4pisGEKeWjouBHObL44yaR6KBkjrRiD20SI/4B3epzcd/gcqlrdlOFXhD4E
         RCyKpWKwHekhCwDq13MKpwNWMt7T8eVLz1gsJmwHvbU8zKHTKhZuA+NN6j7T4ELrC91o
         4Y/PJheN4UUN2//hSn5LQBmW7n1GLDkeuMW54Ukv+7T9fxXK2toU2qPL5HixmybJPVTN
         96mwCaHqZFz3aRx1gy0n6vVgK16Vz6Wsfo4ebYlPTU+Vg/gGNOFS8h7CjdzmLr29CtTb
         Lcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161692; x=1792766492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=TveacO05GIJjKa9TvSGv0d9VFPdb3QlE0NxNZ9dT9eye8TUM43nkEHO8Z+uBhpnkMg
         43VpCa/LXDx+ySEvY/Pn5vkemHuS7CsBFDvX9fGz2bsgjhbywAijTA7g7ACzh0vfMqGN
         /R7i7XR5SaJNVC+V7UjqOtXKUOy2WnvmEKZZqVNgu3sqsoG/VE5elki0zaFAtMvrM+jg
         lDWK2h+m2tE2Pz5BE6CMDnUCfU2Cj5FW+RXd+681vzleOg+BbQgVEjjjdXRvmQnni9lO
         pw3GRoC4x6Gw+mN3sc2t+IyN/4XJQtYxChp6t12egKYStxwMowMS1NVtSzHcaEP1LR5T
         SExQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5k56a6hlh3B/YaUNt0VD8Uy8sdlaYbsY/Xeo4gM3mGhufh4xTeevF77otF+q6opARcBbpIbnGTVpjdQD5GMfK@lists.infradead.org
X-Gm-Message-State: AFq9FYKcvtqsK88f+yyUoMuNJwX6m6D8ipTmh9uI25ZWT6vg/feDqEuT
	Msw7sfWrkQ39Cj8R8bHkyDEYVJfhKO102V/ohV8j8uYBhNDrTd8vet3VyA/6n5e2shk=
X-Gm-Gg: AYBFou3wxxUxPql+kRt9LY5AHmfob9C6lfibXeDIuHCyDNRqCG1z9/npx63XS+lGZEc
	vYiKMI6UekIRo+H5Oft5yARqVkVfarX9RxcjKAHKREFK7zrmvT9hq5qaM6QAfZIDEeVi3dC3kBh
	3XVlck+aQbMqzjxWEvkUVQRAlfiTnd2dPEiThUVL2nyYOU7NQ8f+u6sl0peKkR8kcQCubimfeJ5
	LR2g8dXKUgrZnmzzfFwdyBVd96/rfvz2KDnQ9jM2Y2d1zx6uRpR6+NjY1U0pHOndGD9mZrR50dj
	ivuQp8bBitQDLLBkUv1+ik76QweFvvorZ9VdnCnqrPXaK/XmDa4xD3Oh4N45pgrIBOWAkiH3N9s
	9GnnTJTKNjCPUzWROJg7rfhTweNFYtjTyFCaiT+8CJoUfMB46MeuUh00qr8YZ8M86Odxl4gd8L0
	4IM4e7pezF4vZMdoadq9Mod5a3mdcVJpci2AqKRx+U1R/k3Ilnxwza0stYfIPPV4hnBE+EKSMDM
	8uV+lKGNf3s3tKo5EeTzqLbv5t7v3cxsuAS/Ul5atSfwhXKKedGdi60k35vzq9w6q/HEQ==
X-Received: by 2002:a05:600c:1d11:b0:4a1:d307:b52a with SMTP id 5b1f17b1804b1-4a1d307b62fmr25383325e9.19.1792161692388;
        Fri, 16 Oct 2026 07:41:32 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:32 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:23 +0200
Subject: [PATCH 08/10] ARM: dts: omap: dm816x: Correct speed for sysclk5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-8-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=905;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=PhDr6kpoBVqdoNYvmZIO1sO7TmGrj5fxqBZLDfq+g74=;
 b=YKJqXfJGsRC6h2W9mfs7+8pUluzq08OblX/xnpGffG9iXzk1/OGVF4+5i7Vufvm6VIO8qJ/T1
 gCQZ6eud/OwDFLxETFckzoUsSrtJEOZrnbegit/K746Fvy0zP3XUpeC
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074134_516906_60B2264F 
X-CRM114-Status: GOOD (  13.84  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The default code for setting up the clocks results in sysclk5 running at
1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
divider to be /2 to achieve the 813MHz speed.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
index 76ebc6c3c3e5..cb990773b098 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
@@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&sysclk4_ck>;
-		ti,max-div = <1>;
+		ti,dividers = <2>;
 		reg = <0x0310>;
 	};
 

-- 
2.56.0


