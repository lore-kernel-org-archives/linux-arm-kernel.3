Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F2FC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2bV4/erAwfXPlPi2hHxXtxfl2Kz2FSJD4cbVQEOlp7w=; b=znwONCXxcH2bnF3lGv7fmJsQYY
	vd9xGFXVfQQ/Zb1IjF6QAGhmqkFH3O1UAT+Io+WUi7lESRr5Omlpj5rIHUEcFqVqUQ/Ik2WL+n5sz
	CJg7JceX/03F/4J0ONnjwLiGANvQunrP4fsh4bGI+dTLzgO2bCSVn/oB4S8O7UCWHxSNsdmkUMnXj
	VcOrPOT4psrz2nLOpY4GqcwkhB/2HwnZacYOX6UDq/aU/F+I6VtRse5ua4SHD0mmRzqtfzVXT/1UE
	/4/5ke80lqpTt293oJSt8IUtUlLll6rRKs8cpbgXC43ZjvLBzEyAeIA3xukaQ2qXfRUakzTqriiQR
	Zhkxd6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjeZ-0000000GerA-2Qd7;
	Fri, 20 Jun 2025 21:52:07 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjNr-0000000GcnE-3HJb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:34:52 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3ddda0a8ba2so22741875ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455290; x=1751060090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bV4/erAwfXPlPi2hHxXtxfl2Kz2FSJD4cbVQEOlp7w=;
        b=CJiCo/BeajoBizA759lIr60/+x6HKZxt6oEexBVPkmWbnbbgA3HB5HgCjW8FOA4hy1
         1TuT84l5BB7Y04WwV8HmRAcOsb070fv90oVlUfMz/U+aFyLgEejt8BnWobOFq1B5gpe9
         v8Oo4W3XpPiuM04kO4J2CnOscTuWq/UdLsxIS9B9Lc0cC0ytqCxxdxUSdQgu7uVuUvhD
         qqpeesFVuH3fKI0K4ej9gSnEVX6zPy5ttQH6pdoNW5bObnHEVLd2D6vRsTEurAMpSf6k
         YFSvPl27FigzS3tMgJFayJMGQx/8s9fEIxCcLTCaJODjuh42MvLQt3MJx0VDhQT4q/Ok
         m5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455290; x=1751060090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bV4/erAwfXPlPi2hHxXtxfl2Kz2FSJD4cbVQEOlp7w=;
        b=SBv1/Nm3M+AdNoKuM2xVbsNV49NiuZSB4TWEI7BmBDrTQPFAwSmK923KI5VU4HTykA
         jaouS+W0rmj0xjvk9pk8QL87qUyR63Lq7I3jhqCog1k5ONjSmfvDImovHP74BlFGzvWB
         AdPpspwjNWssClcTI750pu3AebrnuvISG5Fb2e2osf4ttDlc5inggJkl7oHjwTVb6swi
         YfwfLOHZevZbwwjCiosqfc6tzpW4+VZD6CW43i+BQ01B+1sJEgrE0ArAne6cTKVA19D6
         lUXgeyEtsFvQe54erBf55CpkmnBxyYYhuf6EnU9iQMccoKGJvQe8LyWsv4SB5CuwT8gJ
         XUFA==
X-Gm-Message-State: AOJu0YxwwC6HhEFOPpiW5gcU03pcGMat88Ihi0JWbGSVDlJ7cOplJEde
	1QL2FUruwSUd67f0SaBhonqPP76FxgP7aN2cyPXhD+tKMhINQtdAteby1+t1Tw==
X-Gm-Gg: ASbGncsCD+OmNSYih5z8wEMAWTLrsA/LwXAe8SXPIzlZoYxRSnHhBFg2XCllrhDPFNU
	qm52D4xYkpiC6eYnCeiEMozHJoyTZ8kix6jzRZHTwccmHQX9GWS1o20BpvJKkH0ORk3/o3O4E1q
	rfm5Cs6lVn+ZpwqR4mn1M+ErKi8gslxWyHSmI9ntucsjuFG+uIK0y2HtEcHH2/ZYlfPuPBlFrCd
	GC9M6HBMxzRWc4Y88ZfcsTWyhqd0jkx7wn3vzRdeKF26LE0t5s0Sf3rS9idaZm1qWcVgCBleOzR
	LmAjjXxF6rVnw3xXbCeUBj//+3H7luU6P0J445YDG5oaPxdVs09tgC8BrMhn4NXVaeoODTl+dGd
	J7G3XzmByUeKugqIE/OGPfMnFZq34X7oM2VCo
X-Google-Smtp-Source: AGHT+IFXCoHIdC1hxKQ8Wh2O6ePURz9GDmLlEmjUZKSPhjqSp4Y9n5TQYb99KGPA9gmaBHSnoG7uqw==
X-Received: by 2002:a05:6e02:228e:b0:3dc:87c7:a5a6 with SMTP id e9e14a558f8ab-3de38c1e68cmr54940105ab.4.1750455290137;
        Fri, 20 Jun 2025 14:34:50 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e0d03e7sm546707173.139.2025.06.20.14.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:49 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
Date: Fri, 20 Jun 2025 16:34:45 -0500
Message-ID: <20250620213447.56392-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_143451_817020_FCEFE739 
X-CRM114-Status: UNSURE (   8.35  )
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

The reference manual for the i.MX8MM states the clock rate in
MMC mode is 1/2 of the input clock, therefore to properly run
at HS400 rates, the input clock must be 400MHz to operate at
200MHz.  Currently the clock is set to 200MHz which is half the
rate it should be, so the throughput is half of what it should be
for HS400 operation.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 21bcd82fd092..8287a7f66ed3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -294,6 +294,8 @@ &usdhc3 {
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.48.1


