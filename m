Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36501CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DkBAAsfyV6LHd7/MmlCwhNuJJcA3WELhZpHBrkWxRP0=; b=4Dsk1eS6xfFRbPagrB+/K92CdD
	IjU1yh02v9CMCi3n7RPzyrxE6V3sPD+bNYqQDWkfoxmqpBupvU7ysbSdjB49BiE5t58EZByTMxpSa
	BVGtvZLGGEwa6a/EBf+GMJxsIRRtU865QuXXevkHFKmCTY79XdrJaboqzznrkhwwMd21aV8LlUQEd
	ej1MIS3Zf6bDuZyhPd9Y7BtRluuGmGy89fIjanx27CBnSDSEKYXWknwgiMcqrTwBdYbjz38XHeiw9
	gQF45ZF+XHW/wBUWU7q6GNPVxdxAG0v4+1S3qB+rbVzgu+1J1bcbEpuuP4zSyGyjkDBhq96x0Xb0r
	dczwgNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphk7-00000003wQM-0fC1;
	Sat, 23 Aug 2025 06:28:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQfE-00000002Rpy-0d33
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 12:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DkBAAsfyV6LHd7/MmlCwhNuJJcA3WELhZpHBrkWxRP0=; b=IIS0EJdu2xCACF4s5GkfzQs9IX
	+WE5TuifQw5boPf7I5PVDsB9HOijbqggKwuV0NAbBjMheShtmORPbr7cf/NDFiQYsYL8TUfyNWMcc
	LdD99k585Cp4uEToeGj5FqvbQqspC7IndgRefYG75ZVC2ca2cVjOcLrlHt7Ct+rXz66k7ZLT4PrLD
	WNb30LP9qh3DIAse832cnwrsbca9OUNKUZqrarEBhcDvMh2I2/Ipq/GIriN7kzpPrUXDtjy5N7U+C
	HKkwmrksQv39dEReg6+Wf7WdvRoQG5iMdSA8Jb3HKVDaiqTnbVLqth9qjA6PRv+keNd81mL/Ehd1u
	xFA3hMJQ==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQfB-00000000u7v-1Fsh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:14:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-61c1d397fffso82420a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864871; x=1756469671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DkBAAsfyV6LHd7/MmlCwhNuJJcA3WELhZpHBrkWxRP0=;
        b=VTYvEtMgtbxBA8T22sT1b0AXhTMj2g5HDDW6Y+pcTYIrH2RfFb3lMVrbPJ34qpWLjw
         YLEn/4Io8p46Tng4Lem65jN93tHmKSF3ZDnWOOuJ+8Y7DhWwYWs3kxmHneMujyscWAr+
         64SNPx4FYTGALFGjRWgq5UVsMMLVseklhgoZxn62kXlvYbLaPNfKEW7AHNWZmiCboJwr
         1X2MuesZgk6qE2B3u9wFsyNWNV5C1KuXmSPkndjBvMx70Hwga2JULW/h98IAbWi04nbs
         hTwJLFQ3VZQFNh/ckIL2sJhCOux9KkQ1D8bUBuNp4KPS5Leor2sJ/9GXSs1Pda1yW5aW
         6XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864871; x=1756469671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkBAAsfyV6LHd7/MmlCwhNuJJcA3WELhZpHBrkWxRP0=;
        b=aZCZtf5qTHDaR5KmpxuxASyTEn1S7FY8iYPRC2/vgi/jURCSu9eP19upZHNoFKIKot
         Ekok5ngcZ5UTG1EIPKYm7Dz+SI9k01ZMvPLOqHs0oY535vuBwp0T0Evg/6Ny2ser6kba
         rLR2TV/hUt/leLA3XSZbS6+EaL+XLJWZ6thQp+LjJY304/pLmc9JJkIUBgnvQUI0j6aZ
         bFzKN1OU1rY4+x9yGSw2La5D2x54mLfA2huJsmL7BQONk3hOZ1JdITsNDA1EidNYjmQJ
         xBi17eD06eGaJW4ZgHvpl7XEWlns6fBAG1U4nywVS+shD0YXOu7giusQPAycyHpNcFKz
         egCg==
X-Forwarded-Encrypted: i=1; AJvYcCXVd7iFkq4y0b+NjAm9Qhavfk2v5enUWfh2u2f81cBu99/Ue+gF0rHH30XPC2BAGzJGQCs5fC7yY8rZYSfpNCxh@lists.infradead.org
X-Gm-Message-State: AOJu0YwEXuqRg8kCU+CGspcPvweW6Sm1fHZ2P/p/MAJoWi7ntRh5blzc
	7/3wVhLhHkdmI5hZ3eKgNppTRJTH/bQrYJxZuiai3IcU2sBYGE+HNf2QssmPGak94/I=
X-Gm-Gg: ASbGncu0hYudyPrmfma0BbPKAt0svGReY/gOcbCKFMN4hcX1pdVaCu+xhEIMslrOOjL
	5hMHnVBjYwZT6l0cBJ5fKQoJj/Gb0Jp8sdEacJ4JgxFC9ZZafM/UIl+0nK8e9h1eHnDaqixBfAs
	HMnR/UTjnZ6pGMBLKfdG65U9jiJjgmyXo6bYA6LDUVgCvJhNeEJkB5M8Z48TK8011vAIxG/aCTb
	ACguB1p9dqn9bGbqhrmRVs7gLGPlpyLeKOpUHlziDac1Iss3K6c5tr/nPniskKdhl71TiMadnl/
	43cXSf/LaaEHLlAtJ91UHOvQWEhES2IVVK8i+Duc74o9XgLaYKPPSHmgKC+6GFJZjP4MlrXWA8Y
	sZSPC4f8jt1hJNEWXti0ssxrPLJQmhOoMrQ==
X-Google-Smtp-Source: AGHT+IFs4WBH1bJhJTxlQHx++FWWCdHXe96mTCh87JmHiQTRMMJIfTGjozNDivKIUBJBc92gTGlIvg==
X-Received: by 2002:a05:6402:5251:b0:615:c741:ec18 with SMTP id 4fb4d7f45d1cf-61c1b45ca84mr1190009a12.2.1755864870953;
        Fri, 22 Aug 2025 05:14:30 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: dts: exynos5433: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:24 +0200
Message-ID: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5IK7visueTFPJvwe8aBx75t2Dc2ShuOFkE1pHPlyTJ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8fG4TdtYM0cmBodGvFcfp4CgidVvnzzwGRR
 hF5QnIYt1GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfHwAKCRDBN2bmhouD
 1xCJD/wOs1s2c6cZkJlscMJv54fg1CFIqLecvrsXnlikIuOSInwpa8sCW4lL/PckSmRAX/wJGIf
 /RFOn0k/+skDBPFigKH3lwK1HCTnSQTTNtsYThsHBcZHKlXDVnFFycRsNK3U4rfldltdnl+ItXG
 zhi50Yh2vnjg61l/51jX1LqvIcpPyyJ+1AW8TADnOKG4SVZIL94sGd+iP6BSRQHVpos6jxYCY7S
 NiZ9szmd1Nf92KtIOIadb48c3W6lWpLNrHwY5zfeGdzzmv+pzqXSRKRWYVT2N+kSfCCM8Y4AIWz
 44rMBbe3uV8TrnQ+NxtOCuY7MQIMazBWtGZ2EiOt+CKBugQ2i1n4lxEAl+i/EIZC6SadTVwXN2g
 JhgFGG3Ifzuq/Q3lSpER35OX87hA0PnlOR82yzRrSMqLvW2biSmWy8+nrg2dMMUErBYrGF6/IDi
 NtPn/B4MfrPYu7c1u7eJmdjzyiOyFtsCLw4Ug4DuAZcwi+i5oQbq/4PKYDHebaNwBwKMKX4VV6F
 tKbHslXeDzJcvbZuE7Eh5Lnp586PhTQWynD2R70Wco6g4tvewvMhGJ8PVWd3p2oOpkH+7nas0+n
 LkFxeMQdnVtsqKTVXVhfRcKKOTRpd2L/TAZnM02eQBrk2F+3zhz0h18KYzmGEsYYd1pi4M5Pw16 ZKH/3SJXFYLGrYg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_131433_427800_CFA66DB4 
X-CRM114-Status: GOOD (  10.89  )
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

  exynos5433-tm2-common.dtsi:1000.2-41: Warning (interrupt_map): /soc@0/pcie@15700000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@11001000, using 0 as fallbac

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 0b9053b9b2b5..fa2029e280a5 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -937,6 +937,7 @@ reboot: syscon-reboot {
 
 		gic: interrupt-controller@11001000 {
 			compatible = "arm,gic-400";
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x11001000 0x1000>,
-- 
2.48.1


