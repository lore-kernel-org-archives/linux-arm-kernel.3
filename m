Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F274CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dmXcSmUeGXx3nL3phdW0mGHdFDemcCiAs4uvRov1PM=; b=K0lNLTj5ygjCgSln1EdlELh6DT
	/66gim6zjIP11mEeO24DXW5mPOCUsczJy+2uuRH19ZfTWKvBy14NlYrVYoe9yEThxts8fDkUCAqIU
	xzemI1KrCJ1r1jI12rimKbucHIfch9EtHzhcP0sIfM86FbMUVxx52PyWsgGibzRj+FSXc72vLzpQe
	sS5XDau7eTk7tT+BRpwxzIYA3pgm/pg1EJOELfZrudJ2yNzPpJ+9myG0ecpm5oVnnDQF5Mc2Lo50R
	1cDmENaYP8fzWWav8wBS5h4HJJXy3FQpSqpt34JMLgp/xX3jlDJGDLyJvrqLkYyFcUW0gZLa5Xluy
	eCCp8eTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphq2-000000044rn-0ra4;
	Sat, 23 Aug 2025 06:34:54 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrc-00000002dLh-1P2l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb74bef86so32689366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869487; x=1756474287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dmXcSmUeGXx3nL3phdW0mGHdFDemcCiAs4uvRov1PM=;
        b=S/NGnpNHEdLnUmpr7oe3KDTVOnZgEK5jWEvlzVDYZA4lbxlAieJxZKtQi3jFiGR7xw
         xNMqCOb3t0bd0ZYudQ955Sb3sRmBHyXuQIbh9Ba3kOl2S2ycpw4knM71RtfdZ/3NSdRQ
         T75Dce4C4J5zio/do1la/lQgAd2tEUVNJoexiO9MZih5gLWU4T/e+FRMNePYvGIbgmbj
         5vpO3GKgBgGKvOl+e2xfhyCabiBkuv53DDCArD3ZGLW7O1dAwyzmAP75CqzZyf0hMAs/
         vhh/2XLdYMmvKldSZk/rl6ue3pizp4SEanI+LKdhJ7vbhnysCXLYgItsMnEa/VzRcYqp
         cMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869487; x=1756474287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dmXcSmUeGXx3nL3phdW0mGHdFDemcCiAs4uvRov1PM=;
        b=QZxTt3MofP3X+ixTNKQTg6zLz+hXAt6/dDbEeuJXrm8dW6K0MjVGTX1FS1keS9Q7P0
         tAWEU9ZXtvLGVHfnydaByJeClxTyTTgi0eGrWDItvpDHF7t1lblOlYxEugZFS9dbuwJf
         gpKbbVF3lDgl52ArLqJX6S3He1eFNxmnGzf25XBNMwVySX+Rx8to9PS9KMZ+5pRHhyvO
         5Iq6dq5gcJJmdoGSYrQ5UYM6Z/C19LoBMZQO7j+9BPGuq8Vc5pS5q+67tCXzsK2kHJRP
         GUCs4JW3OkrkuYky8R9ypBiANsqP38ihEH2LkO5lY3tC5ocUrv5rhSqP8kKzx4Fux+Jo
         bcfg==
X-Gm-Message-State: AOJu0Yy9XQFlF4IhwxaWagi+kEZZ+CQ5HBdzPeBt/OIOqBVMlHX3HJf7
	KoGOduxOnVDvSgoR1G/HTUZSpJSy9tlf8ConIxBGCfgxldCU43aGC043yeYkJ6afkD0=
X-Gm-Gg: ASbGncstQxbB6Vg6at5kw/t+Ui0mF12fVoT/jxFXJ4uLt6Nwmj1MEpPpaQD4rV6CI+T
	g8MCDr0qcrMTyWz+dy2SPQ3J0mTBk6mIGs0a2MMNBU4eQQU5R/DlHawFmHkEdyu6wkuraCn7G1n
	00zf1WOJsw8JfDOUuJW/CODROzAhGwLUnt4qXotQ3EOSMJdMDrDvA3CPuUNjXgb0FbO+liRMsRh
	0ZM3yMO98rtuC7p7SHtP5Xxgy/YPBCPAQ9qp+bx+MV9n+/+JafdF/k8mmiKDmiN4ZJirHDm8evT
	R90xQfkhnRk+lExezIoUFsZUxBhcre8L71aDDH2fyOa9bvX3CbsbVAjJz3NhxZWeyJTcJHjjXSf
	Joiqzr4v4mXUuqQm3Yn5AdE1wIjfhMBqLLw/16/c=
X-Google-Smtp-Source: AGHT+IEuA5sRAstE8e/rjpyTg7g8U8xiEnXD0mREcr+QwaSaZg5p7OuKBV5B9Je9ZcQwkWGnedj8EQ==
X-Received: by 2002:a17:907:d88:b0:ae3:bd92:e6aa with SMTP id a640c23a62f3a-afe2943e844mr157976766b.6.1755869486899;
        Fri, 22 Aug 2025 06:31:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:12 +0200
Subject: [PATCH 03/10] arm64: dts: fsl-ls1046a: Add default GIC address
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-3-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LwVTDYBupuAcHM+FBGEUCmwg7FAt9lhCXjGxqLhE3Ts=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEhPq/IurFRNWgjcOAKuyTeJQ536JU0iROCY
 4b40fpK7iqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIQAKCRDBN2bmhouD
 1y1uD/4kk4nlwoMPLW0/2dm1wiY+/mE7GCwvrFBlIrva2XGyrDX6cbToe5FoLb25Bfy6A3Jys6U
 xRC1vMKVBeyCpy929fMlpYgZXUTOefH8YMKvZ6m36R9v2DgPl0zzGZ9FY/2Cmh9gOH6qaO6bHir
 z+0SjDDjVhC0kT558Me2i44GC7ROX/vAtwT2Y9dLCopgKRn/qYEC60sYKArtecoARZju8bU6eqo
 F8kymsHBhMGbrg8sU9VVX6AlO5wqZF+UxAt0lffpl+CO2HODEgo/gXAYibZ5Pjdil+NHjbiegNN
 fuNDaYRtAih560jnFASGDXG2dnsUxdsLr+lInNhZtKREG/8RxJTjeppOan/5qNy50oAuWgk9ebq
 P//iH01m/wlBcYzgshF4lS2CZP2LbVKIEgkW7oGaNna9gntA9e1Kin6nGq6VIbajcqmEzRcRqjA
 OINRGwnle1bYltacmy0KQRIkUeCTdwpDLKTaJIobeDlSmiCEEq9PKi8J2l3uyRO5i+v4mMdwY+D
 ApbcqZRbbOkzv+pmyFv6JGcYbxXJXFRxZmJ2CmvYERVWZCLWow9klpHVMeXvtJ0xsPeBju8Qhjp
 oZ8nOIZRJ7fc9Yskwrs1/Cq6bVSWSonHniPvV/4k/DG9m1uTQ5+c7sfrcfAMM5PUBJjOQ781FgU
 a2IfE9ZWXeTaKFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063128_375460_D3598BBF 
X-CRM114-Status: GOOD (  11.56  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 4a22fde38bea678ffcaaf44e9984ded687cd2297..770d91ef0310d971d044a1f55cc5e2cb738acc47 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -260,6 +260,7 @@ pmu {
 
 	gic: interrupt-controller@1400000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x1410000 0 0x10000>, /* GICD */

-- 
2.48.1


