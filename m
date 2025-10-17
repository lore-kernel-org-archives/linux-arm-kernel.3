Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D33CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=; b=mH2zbCm7MWKiPsTe7rF4jauufd
	pyVrKfNx0rCTkyteJZcQDjnDew684Hy0asw01GC2XTZX1Rbj75VSFwGu0hrKvvG3CRr9Q4wn6V/AS
	P9f+iKvB7rATkDsUuYictPn32b2PXlNA2r8+htXTkC2vbaAzN7ps7u+fxi0kUVewv8Nyg6XJiWVy8
	XHe2FMaZhLE9Zg8ukU+MPtbHIfAbUIPwZAbOVvQv/BKqmwuQm1oKcjueY5NnM9lSc4t2a07T71Z55
	ZczCD+0zwA/nYjFs8aJKAp/9uMQnTHm/zOqkBJfRYzr94ju1w4vq8W1TzCXUyGD2WLwbPJYq7u2m7
	eEpgTaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iXo-00000007fOC-3QY5;
	Fri, 17 Oct 2025 11:22:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iXn-00000007fNA-3p7t
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 11:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=; b=DiFO4mmtJUoVVflI9Zh8tJBRyo
	LHLPfYOaYpW8oWzZsn+Bz9xkvTYvSRJkmRWcAuxLmejzPkjU8HmCrrbgcYLYrjrwOjQUIdhaLn5ls
	GkHtzaXRSQoy9GJwca8LbgKfix+FIvkK+1O6/HVrU7AaRCWFmWOPODq2K9xbzZt5ChF27epy2/zu3
	IDQYDQS9Q1xfMBJknjH0dBin+fqAcGutD6YmHbXGJgIftIhYQyGIaCTWhz1FF7GMoySgdUA7KoqEb
	N4Hm9x4khKLfU8JqM+pv8yT5MbHVsCBFDjH+bKu4kH4VNkUIkApdYXnCnmyxKEbUoW6a+qhRZDRMt
	Lq77zCnQ==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iXB-00000007WRw-0Zj5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:22:46 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b3da3b34950so287867366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700121; x=1761304921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=;
        b=m5Y5KcBs+F6ck9g7Wd8atZDbVfnzcu3xER7A/4wiffVzJqr/xvG0NmgJ+AQ4mAp5oG
         7cBzo6ZuqTh7Vurg8Ig6KVZiwin7KguNVNADmTu+b7GFWu7hZmfXJSrM82/zz9a4X3U4
         1kubTpdl25eRMfiqq14rBp84eG8J5JaTS80KjHNqVCCXwrJ734oO2hfF9ahCq9CO0lTv
         1n4z/rrMclfS1nWSartAZpQDckIw+/opk5cXpLSBx8cjz0GyOr6iyBAwFzCs3AWH+ECZ
         F4q9tSqEC4x2TyNlo8/4gpHZlCE1eOZPkn/8SSegu4hrxTqa6pveYHCYX/cu8wCu5bpa
         +0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700121; x=1761304921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=;
        b=sJrT5WvVtXnqvrcOFUc2ySdar+LtljlLpBsxH+lr6nTSnrIsxx3+P+p5VC5zXvp5B/
         0OBQ1yAkv/laNmU5L3WubEjY1bGfO7jk0PCcj7+AoyD8iHXSzbae5IBpgTehMrLoofmQ
         byS4B3G1YABYuB38Yp/tQaVSGVF7RXy2kpqZMID4h4IxvzZpWclGCzxzxic+ixkwbkLr
         BfHpn++04yBfXie48K6a5JSx5HC3BFzpqQhx9RYgsAkJ+S9Ub2E7HmxXyeiBysL+te3m
         RuhY5rvdsbDvXQtQY2k8oKmL4V8z++HqDftyd7WHsL4N1lGr0oHmrV7gYCF5Wh5oIBxq
         pv/w==
X-Forwarded-Encrypted: i=1; AJvYcCXvZJ0lderWdq5Sz9twhJmFqAc2+nrMaTrRSjhR6r9/mGCnUyjA7sYxPTWft+Ys4cpC7Jp7Y9pLvXyuyEQB9MUS@lists.infradead.org
X-Gm-Message-State: AOJu0YwahArgZpGsSmPMHvvqjCS57ShZTZui/OilWXWY98cHbsuZMLk+
	WMbhAU4i/rY+o3jd0dXROU4UNAkkXMZ31OYL9shoHz4c0r7xdIVnYt+f
X-Gm-Gg: ASbGncvmHrCPG7WQwpRySlI1gSRrnUY8i3XI/cLG5G0/Y1+ep0kh+LOcWT0VWnWl7LG
	t5q8Ix/pfNk6vcaQy6gs93Az8xO3/dAiYPz6iAYiCYDHUsBOwBfN06SFMGFunsmZev/JhrOaZKO
	wWWprix2bPovxRB6VkgA8u2ZgvLgcXFsqpIaJFLaAXKxBx22LvwAbj5A6xKM/jNKSsovKLVQd++
	XrLT+Jf3nFHGFLx9P1KClcQfw1wAvijBzhHApa0NJtKhTus2Gtolq71fXMRzw3/7eAfZ8DsWmnb
	1zDk69u3y9tCPR1SMwoSSEnEpaz56Rr+h95T/onl0vwyhbB5itUlY08K0e1Q+nAJDkT1f7WhJrJ
	ZLFcYWjG4krYF8IZmP/embymJ7s9KU2BYjgBN84VFMVoATqHwrr5wFXfpFU6KbWaADdy5hon6Ze
	vd+3H23jfQyp2HCL0IiiSylQH6JdO9/oFrZxC3jg==
X-Google-Smtp-Source: AGHT+IFm4WIQFISVomrAFV51FZBLIpyrii3K7EFFJhRI3QtwYUrQCPmRYno3c3emRFDyrsQdPdKFXw==
X-Received: by 2002:a17:907:7ea3:b0:b41:873d:e220 with SMTP id a640c23a62f3a-b6474f18597mr313933066b.50.1760700121004;
        Fri, 17 Oct 2025 04:22:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:22:00 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Fri, 17 Oct 2025 04:20:25 -0700
Message-ID: <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_122240_580950_ED05EE00 
X-CRM114-Status: UNSURE (   9.99  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..676535c3fc84 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0


