Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622ADCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=; b=qPKesYhwjfYRwbszRZdPPCSjCM
	ZC6Zn4EY5lyOclcVhbiewRXl2+fR7CxtwV0jRxx2AaRTm2+ngrtYxellZFIcvfojjPv3cBMh790A4
	UmVAamsmBmBFcx6LvogLb5ipdGkGHfWUjUBjf6Lqcy7fRRe8EKygvRcqgSgdB9fKt1I7xVvvWN+r7
	7FRM+XLBmhBttmTsVPJaSIdP7C4T2HTs0BmkX5HTrPdHRoMtRsVTgGKPAa8U3/MtzaWkNjJDr/j0F
	uQeMmHN96e6zN2HKubyAM21+ezN/QPmED/1EaPmqnPlJDTgp4Nnxvx32+EtenYyl6tXKdJigXd2JS
	/D757/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRW-00000009z5o-1uXZ;
	Mon, 22 Sep 2025 10:06:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRH-00000009ytT-1qwZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3f2ae6fae12so1149684f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535590; x=1759140390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
        b=mztBs60zBFVNU6EUsZbWcb5dqBn+AGwgJ6HWjmVDoUJaXlKoyBq+9Ru6cn8jfW+xlo
         FXHEwx4kAQIiSeWzYyWY7qSUb+c8xOZMc9BaEH2GRN0BIBc4tj+ELVM1Q5bU6R/iwREm
         yM1UmUVF17ZKalL3FUueofqD8ZaO/Xm5FOXUuV48v+BJOlYbn3J9qO6OI+a64z//ebf1
         6Oyoq/9gEJuF8Hvd7MRI7BJDy+jXoR/XdmPQENvjy7iCS2V4qf0ag0nrYtkgN67TKsbc
         mCLU9JN10dFAvG4wg6/rDo3aGjkGo1JrpB58vRiAU9TusP+w6xRA9DB3n3VdE94jqmUL
         pYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535590; x=1759140390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
        b=Z3gLqpID+kUSYXUAkraHnahBR5ULLRV9RIlHnVDEyjZR69bTsNzdhtGch9of4oVKbQ
         bniaVtSIk52Phq6rj/D/dfrkCVnogirpCAYuTHteiGiaZHTK+j2IzXJ8TWJG4cjonAq0
         3anrNgmRvM0TYGeeBaxV7G6oIiQMPR1kiLbu4wGwWfgvkN4fITAVhyPLEP7kgoK7L1j8
         /IS7+k7MNpKZlv9NoZxkNPzlR/rIjfed2+2VxR9dz+2c9/+AzYPHo7ovhKXRUAPXcLXv
         qNKOALTy7E0JXdVAptpdczPURRMBf3O++uTqug6nwlbRbIO3qCcRe4vzDM1sJzT1MtTU
         hgFg==
X-Forwarded-Encrypted: i=1; AJvYcCXN594nljWDlF0pvF/TS0aAzecfLfNyGcZ8Y65MdFfM0ZjUCkl4YUHUR7Ft1ZqZ7c1KH8QiFFWjYbJg5mc3dw5Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6zpOUZU/8l4WfdxliM3D6+SZDErDbywNSqdVPaKZpqv9IOKpI
	Q55NDkQcYJ6sIB7Xi8vSsdHg7RTZ05c00UMefAkodWYlzBuAxz1+KTt4
X-Gm-Gg: ASbGnctGLCRDMJSQ45wCDHMK6Uwle+mMiWVo0dpCbEh5ileH50h42WW1P3UGgtJtjI0
	GpVCpZDYj0+FeLVASyCfiXq4Klt0zUDnRbZ5OyrV417vag+jYl9QkvsguUIQ1IAViqhQe9VtZYq
	hgANN0CGEIUvrvAuZp82a5avT57wPgTNOEzywO4OHeuHfZhQfy8ZsfyMrOLUS/JKqwPsIz7Dj1r
	JXsFZaUIde/a2lAkdFCLca9Q9OIwX1/cX8hAZgX77whKizlpUaOjcWwu9N53Hzm7LOFb84fBxdw
	INcmTltjy20IKMQw61lu632QLTMLixtu6uxuF2ZJIF/9N7v7wEuCPMtxfVYMULfzZfMNqJAPrOg
	kMc9gHptdlD1q9+8We+53szRggUK1jEF6Rh9mtx3P/Psc+y2irt02o6lqPIKn//3eKP4cvwib1G
	3SBqJcc+3Mw1a2PnCk
X-Google-Smtp-Source: AGHT+IFMdYeYi2iaeAdjrGDcnkGPmrB4GjWSDhVK2rF2FgfKPc6GjT1SHKlJ9mXDLcRp77TRnBlKDg==
X-Received: by 2002:a5d:5d88:0:b0:3ee:13ba:e140 with SMTP id ffacd0b85a97d-3ee7e1059b9mr9638251f8f.21.1758535589473;
        Mon, 22 Sep 2025 03:06:29 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm19867335f8f.37.2025.09.22.03.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:06:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:20 +0200
Subject: [PATCH v7 7/7] arm64: dts: st: add DDR channel to stm32mp257f-ev1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-ddr-bindings-v7-7-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030631_501016_CA356264 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits DDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 836b1958ce65..c4223f06396a 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -41,6 +41,13 @@ pad_clk: pad-clk {
 		};
 	};
 
+	ddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,ddr4-channel";
+		io-width = <32>;
+	};
+
 	imx335_2v9: regulator-2v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "imx335-avdd";

-- 
2.43.0


