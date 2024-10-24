Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37A7CE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h51FzxuqZx84XIIcsnQe3sKi7dN+XbGmdPwCk73slTo=; b=vEMhz37MXV/doXzvZN1/oz28tg
	F66ZzuUjK2ZSmnyr7KfZTaXImKh4K1LIRVkLgPG/ICKasHw62ADCueNeSeQiBx2i6rRdZAPP6PT+K
	b6vRHP4bPP6Wo0IU92lN9OKhaTVt7W0hhhp0ddSlL+31RN8nqIqT90Mw2D/2bcIEmLjpoQ3iEsEHX
	11nDw4Yb9y3pqLCN4ymSx+fWDM3QclY3l934jpuSU312D51jLHAB9KupjwoIG/ppwT0YyL7FQYIpK
	TIyqK3T0/g/r6YbmtMjKTe1QBId1pPygXL06uE6pn0IsdmNRvOg9UjdhDohm/KuWXGDd1h/bRJDBQ
	hWzyVaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNy-00000000FyY-2rYD;
	Thu, 24 Oct 2024 11:52:14 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wB0-00000000EWv-3tYk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:38:52 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7203c431f93so607979b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769930; x=1730374730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h51FzxuqZx84XIIcsnQe3sKi7dN+XbGmdPwCk73slTo=;
        b=fOkhqLWny7cRPiip2WSpr8YoJfp1fUTqdGqC3Wq+U8kK+uIf6CxjcxuJu/AeohxBbp
         rWhwgNxTA05RhTW+IpNiW9HwlqypJNVLsZH2phWS85YOXw2BpLuNQA/4k0YlPJfntEGk
         eYQDEk5EG8CwOKmMjjlOA3hDmn1vtAFPeoTT/duz9RFe3AF7gUtFx9+g9NCXQlMv5PBm
         x1XuEgTRK4CGy6MfBM2AC2Ceh9KKVNCRWNtH+j1Zer9q+L4t2hltyQntsAjImSaghRn6
         1vX6vZmzxRRg9EReEayvB9vyB2wEqgiLuRrDBRxZ19XBG4RX1jqmSsJ61zz4ByLPMK6W
         Jh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769930; x=1730374730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h51FzxuqZx84XIIcsnQe3sKi7dN+XbGmdPwCk73slTo=;
        b=gtrWp/e+o3ZACoWyTAFteE8cXH/pY1XHmqIe9mdfXGC3VvtjDXnzsKhfehgQhzfZlL
         4lNBzwHWhX2JLzfPKtnFJgFd3uC7uwEvk3pGyb0x6NCIJUhungoNGClJD0lRerVkP2bk
         hONQE7eQInDDZG7HoJlAwmvb7vqXyyHcwbBiZx4OAfi5Bt4Z3o/ZtGpOFaH72MxAn2E7
         x848EjjKKHYZvS54QYYdfUxBUy8Ocsu70ChiQbamA3QEYKYQ/jz8p5h52n/ojVTdlkwz
         4LS8U7N1nBjhXFL0IFqSXq4t2vMbRtJW7p4XLSv2HbVb2E5bHujybnjQHbg01QcDWUoD
         EQUw==
X-Forwarded-Encrypted: i=1; AJvYcCXzN9KhBdvqzxByIobzB75ZyXoaUq1R1D5lO9yPyrHjzhES/Jzs86UnVhl3CRwkOqE7lwVvMXk1Z99d3ZSWoiQx@lists.infradead.org
X-Gm-Message-State: AOJu0YysMO6xIOvth7AFzdNhvJHb449ykr1CLrSPgrb3Bu2ihGevpup4
	NvG9nf63BurTG+Xtga56US5sUufO+bsz/iNJkujiOcstsmq9k9ah
X-Google-Smtp-Source: AGHT+IHY62GgRDdJj2B1P8mJl5CIT+4l632XBQQyTWVwGIj6oa6s+113AuHJDtUpTys50xLwBR9hzw==
X-Received: by 2002:a05:6a20:e617:b0:1d9:275b:4f06 with SMTP id adf61e73a8af0-1d978b1cfaamr8015692637.19.1729769929861;
        Thu, 24 Oct 2024 04:38:49 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d765csm7798029b3a.115.2024.10.24.04.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:38:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: lars@metafoo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
Date: Thu, 24 Oct 2024 08:37:53 -0300
Message-Id: <20241024113753.1353023-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024113753.1353023-1-festevam@gmail.com>
References: <20241024113753.1353023-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043850_989126_0C2D0F2A 
X-CRM114-Status: GOOD (  12.50  )
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

From: Fabio Estevam <festevam@denx.de>

According to adv7180.yaml, the correct property name is
"adi,force-bt656-4".

Update it accordingly to fix several dt-schema warnings:

adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: ...

imx6qdl-apalis.dtsi is the only in-tree kernel user of this property.

BSD does have a adv7180 driver, so should not be impacted.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Explained that BSD is not impacted. (Krzysztof)
- Collected Krzysztof' Reviewed-by tag.

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 1c72da417011..dffab5aa8b9c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -691,7 +691,7 @@ &i2c3 {
 
 	adv_7280: adv7280@21 {
 		compatible = "adi,adv7280";
-		adv,force-bt656-4;
+		adi,force-bt656-4;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ipu1_csi0>;
 		reg = <0x21>;
-- 
2.34.1


