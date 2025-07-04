Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C16C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkNu2VPdZ05H1WkOeVUqdreqBFI4sSTNmK5wwP9pjsA=; b=09TTO6gS/OOlUm9ICPDOylcQTG
	t/ML7xSpPoyFKLLhc4pxlFEoOvtb1+KasadZy/J4IkUzQyHD7iChRR0dQAPxLfDhL/Oel7uumNJFx
	WytnXyxn85aSbWla9F7/rjPrwF2gilXeNYg28k3Xh8x6AxLVqDLWCObD0Q6tgDJdEq+5HlKy8MTz8
	XJKAtaIpqoJ60Qdk0u5ttLsJaafBp+ljCbyDYXGlQqk1Vmrgj4cMHpeURhByMS7i23dSOKzITwRQz
	F0MR5cCCJobDSWzSlByFk25XzTxEhn1sq/CPC9CmHm2GayYqwnyODE3SgRil8CADZqPIMrOzXjXQy
	vNuP/Lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjY4-0000000F0UA-37yI;
	Fri, 04 Jul 2025 16:46:04 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3q-0000000EvGp-3z1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:53 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so1516391a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645689; x=1752250489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkNu2VPdZ05H1WkOeVUqdreqBFI4sSTNmK5wwP9pjsA=;
        b=Fdm7knsXi+OYNlrJF3hiZfgCTjL1R3/87A2GLe96R+6ei5ZqHpb9AJZTiT4lXhPZT+
         zUQ8kPdp7mWyojz4P4+Ke4s0SLnszbP/KlMK7bI79OA4aU80DD4yqCs+au/5gtfh4gEH
         +1P8kYjeCIke506Y4Je40gqinimfN0iCTo0g+JPNhkMrM8j5qCJcL745wsNQv3SyCj5L
         kI+LthNDRT4V6evhXbj1fd3C8YmB5qp9euHDivnB2ZUhUJ7qelxotZrHZbgXr2cYUcl4
         cXY5pEa8vmhyx6jN+S8Rn+tiTg7f0WglA3sLjX1+Cyd6+usdB1DHX1GqAo23Q2u1pV3N
         HNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645689; x=1752250489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkNu2VPdZ05H1WkOeVUqdreqBFI4sSTNmK5wwP9pjsA=;
        b=g5Fij/SNgZXaFjkg6rTAVf/zWHEXiPWa794KC4keYV4sepHehNTMlm7LMUoUaMmQcK
         gzpEEkaL4LLu6RMDKZ2Eovt9gt6KyJ06Fq8RT4vn+7SDPk8U8cc/n+Un/zdwyIroqcOQ
         2jRMzI+DZmvs6mZPC7A8OLbAf5zkeBnPW+5Ub3otu2ukXvd93nydWKublCBtHHM16Zx2
         y2c2j3DlvL2WViWPVMUKspqaJBxjN6r2ImHIeHphr6nw1yGEapTivTidUfFImcSg9Oxo
         MdCChGN4lE+ghLw3ayJjXKsdw2/kj59RefVt9ldtddp53919QsvFOiUnDxAJv8tP7Xqn
         +HvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxdNUOAG/w9KDpUFQHxRYk82hMKD/PEBT9HQDGhw3gztxfyn7cTeVd5QnqhP51lBEpkaLKETIoeBx5ve1drK3s@lists.infradead.org
X-Gm-Message-State: AOJu0YwESL6/BFJBfPPQV3Xw/ug06xKxr0FJ9s20vPgu4tAqHwl5uuJW
	iud5bkkiEZrPTk/gxphQ0cTuRuzKGNXlNqfkkCl9az6ZYdayKCIXfZxuUVaWGRXyRLI=
X-Gm-Gg: ASbGnctwkfz5wzcg56NbhJsVH0aZ9jm5pzlr6RaFLxWhcMw3gRNVP02APrfUZBfH6UG
	ouLv89uT1vRJ0h6/UNgdW7/41Etpc89KZZU9jXws0KTRB4//CiUx6B/MsalY3rkC2DRumyBHt8d
	vTEhK3hWFzac099ivAfailXSzGK1G5BbiYrDSi8U6LHhzkSy0zFJ6Ceobg6WXZozoUHASeT4lQ2
	7CnW+KmvXdfqLCnSZi6zTJordNoxchF1CfGRJo2QM/SfxyedudtVAsCxzvpZCL/seoaxdzgvFfo
	5Q7xgiBJkSURIlLMH5pKwq81ZlCPqDvW01bAKef/IQseN/IJBOdlHvcGuiteZ3H0MgO4bTeS4xR
	/uJBxb/8UlLS4dp4=
X-Google-Smtp-Source: AGHT+IF8OBJYopz78uTu4zjr9M4q7cZs8YsJ5lxwKzH9GFcsxUYxUdsvzpbrV/sgFDsSrcOtLDUf2g==
X-Received: by 2002:a17:907:3d0c:b0:ae3:163a:f69a with SMTP id a640c23a62f3a-ae3fbd13e86mr283273366b.33.1751645689346;
        Fri, 04 Jul 2025 09:14:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
Date: Fri,  4 Jul 2025 19:14:07 +0300
Message-ID: <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091450_987683_98DE1BE8 
X-CRM114-Status: GOOD (  10.94  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The first 128MB of memory is reserved on this board for secure area.
Update the PCIe dma-ranges property to reflect this.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none, this patch is new

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..1b03820a6f02 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -214,6 +214,11 @@ &sdhi2 {
 };
 #endif
 
+&pcie {
+	/* First 128MB is reserved for secure area. */
+	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
+};
+
 &pinctrl {
 #if SW_CONFIG3 == SW_ON
 	eth0-phy-irq-hog {
-- 
2.43.0


