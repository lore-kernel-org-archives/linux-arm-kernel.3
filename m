Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB69C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=E/6pNP46Mb+xgwbh7/2KxCBK+/
	lIKDPLJ7S1G8ke1lB12XvyDuBJ2WPIQNIwOO+LXDfzkcqbG/NZifHfLqkkAOz8Y92oe0SNM7sXvPB
	p46K12CjkJKQNPkSLYyyPO5siShR2w69hb7NnE1b98MY4/GxBpv4fwjCq8cVOkY3I0WDrxMgwQf7Z
	W5TvET93qxNZm2s+7HEO9aJUKGw7KFS8/9wzt485BeVrSBWtHRSQaQimGHkYg17uaAXomz5tMbEMv
	phTMdxqlFAnDLxvblDoxFYmzuZWilKN8OdlH04AkgoLMTNrpBbXa8+OVnQ0Ap8iOm5QJOv+bJJmHG
	9LP9GgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAMj-0000000AvPW-04Cv;
	Thu, 06 Mar 2025 12:30:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9R5-0000000Amjf-0HWd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3912c09bea5so413117f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260641; x=1741865441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=X3jt/o0wqRfQlfYmW+6wfbGaeIxe4c5MedUU9zRKaKYD7utGIS6OxAhgREa96/u0RM
         BYH568rPeEZmQo5z0ywWAq/5n37r0nHJY/fGCaTFltIvWAbBK+X1z9bkI+N2NfcRDqHZ
         dhR3mxGlPm8ifJyOLJYSPvil2Sp/sW80F/ETU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260641; x=1741865441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=aHwgCalFlVKYpVld/T9WJo7suzfLYAsG3deCEPghhoaWWM0+7M5KBoKky2yIertj1b
         UujJIjiGhcxTo3g5clElvGd5TLKPT7WcCLWu5YM8T4FWEZvNMfpDvrNXfJFCcw8eGiZ1
         z8q7tN/mzt9a1YNaeFsUpXEeLYuM55e3L7RnKyHXF/H0H3ap88AtWLXyUzievnBH+SHf
         0QEl3/ixlhvFx6UBRVYRyQBWB31IllSTBalhrnWY7TL5PNCbzd2PpkbRnwNtrNLHuc+p
         aerMd3C39XajGrffUp+8yguBfLsrZ0ojPDAf6Xai78wlQVjRySAmTOtctp2qd+upeQfI
         7uoA==
X-Forwarded-Encrypted: i=1; AJvYcCVriTTHawo5o1Wbb7B/8689Xkhyyzjc4X1waLw3HnltDDCVZSnIEAzfIRiKwXG+9z90g1ep7EK/63PVrv5CLT0O@lists.infradead.org
X-Gm-Message-State: AOJu0YzdKNBXDfSpqJIMFhdOWzki0etzTi3bXbBUwN+QPAKde1FPuzYI
	0eKa9CUidolJe2ygh8rmy1Gc2Sw3GRiPVu+dRfHfdO0GvEHz41IZqh6cdMqJ2QE=
X-Gm-Gg: ASbGnctuFgjncLnrvtrOS6h7x1n/YTsx1YIzvRVxv+HN0lcAq+Pc5U/6pvkVssw/Uq3
	zqLV1+FQgzUveglgYHamY3vwN+BCXhq9ouJF5V7HZPMn/ocbLZ/yp3PohPfuoIRToAaLnv6fMWe
	gCVcTO2IgBjUHTw05bIDdrVXiSGoebGR8m/Cwwwu39mGyHuvcSZLeWa6FAELZ85QxipO6V27ckq
	zQIS2SdO/EX40Ea8FSS1QygFqcjKDqAM8d7pw0mwWHpa46nXbox9qUVLa1sOUJB5+KT3PKqEcgX
	pvap2I9Qe+uKV3BrgOBHtcb6YKeqjsLXQiYTTdXw/NtdlCX2PnA0F/0CcyOAx+mjoCmg0B4W5id
	X+pFQsA==
X-Google-Smtp-Source: AGHT+IF9wWpzzMPt0CHbMykHM/8iRPLGJDIu7l0jbjUlhGcWSWneZbVlhN0tXEjKICQJwrYTnSq4zA==
X-Received: by 2002:a5d:59a8:0:b0:391:23e6:f08c with SMTP id ffacd0b85a97d-39123e6f191mr4148028f8f.47.1741260641317;
        Thu, 06 Mar 2025 03:30:41 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v10 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Thu,  6 Mar 2025 12:27:55 +0100
Message-ID: <20250306112959.242131-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033043_103214_93F8D858 
X-CRM114-Status: GOOD (  10.37  )
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

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


