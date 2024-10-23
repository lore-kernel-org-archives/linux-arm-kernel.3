Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75533CF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYolit0oEDPjKKIauLDGCJud7Hae6w8ED+2L2v/ZWTI=; b=cTZ28Y/a+qUnXou/Lg+F/SCFtk
	k2TEl+1o/YHRqgjtiFT2KbyQowsgGRm4ocuFjeoSQT+5oYr0dXYVYrYG3rjzBifQwPswHwo5u918k
	a2LzjWnWOsT432q7KRx1n4yFlI5k3uUwIiY0uPnRivDUSlsXOHYw9KEbK9n8RoN19BofBGUeKho0q
	54p8td49RCpEXS+OLbTsJcVUtJuUwbJwgVY4bVQzeBeNWQyNV1qjPDyqG3bh1UEA0DKegw0tyVZs6
	lsftE+CBzkPFcRx5RMWZcIish+qiM8FiVY1dMTjSNwTXb42BLxAS4r1Q6vaAdhjo+oiDn70ZMPNBA
	oGMB2tSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cem-0000000EngA-0L5T;
	Wed, 23 Oct 2024 14:48:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cZ8-0000000Em4G-3b4W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:42:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cdbe608b3so57086805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694546; x=1730299346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYolit0oEDPjKKIauLDGCJud7Hae6w8ED+2L2v/ZWTI=;
        b=lOc2f/rssxcKS7EhI2FkSlTRz+iPd1w8AETMFfgvfwGANHMkXEbBZGCkP8n2wyBwDX
         0z4u8Z5VaovFc9ekbZa6Dzp6v3IWJ7JKjj1IS1ZeeWkyGryDYLfNPAM4G+PNe1s7Kdeh
         jINnPFQhP5KbKhQF8brncSOPqtDDbllzM5cgafKS/wOz3jKE6d42KLrZkeo3IMSkS/PG
         WLv5dlfyBKH0+d5/l9K9su95flrE1EdZEdW4YZPlON97PwtlgmW9eykQTpRthscaq4Sn
         gIGqGGoLNM/hSl2kTsiTJFTC4C1O3gz3nY6i5evnxPQIeBe5FJpGtsFimeBw7fC0LBhA
         TltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694546; x=1730299346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYolit0oEDPjKKIauLDGCJud7Hae6w8ED+2L2v/ZWTI=;
        b=HkbxsknBJq/ldCUnMO7vTSW8AQKeB+qiiI+0oM0lNDPsUmdKx2S2cdHm4/ARxncd0f
         ZbURuQzgxRuDxuz2VdDjoar8YSLVO/j31aBrRaG7Njcqmz/PPsUSeQJg26N+DZcvmT8T
         +xHYd2QVcZUUdy5pLZ190T5kmGSGUiQU+D4/yGHtT4BCBUVhSAFKlGMz2GtoCqvlmVCY
         5TQvk4k6k6DCeKvgWZvtNtM1wW86DVnHON9W3+l3g5coHHu4P1Kg81RpV/wHrilWpt4A
         CoPM4HHjxZ7vz5W55qqmJqG7laRLs2QLIEWPpQXqEKzgG6hbri2+mUOH8vsiHrwNgvIr
         zudA==
X-Forwarded-Encrypted: i=1; AJvYcCUOLL2C2NcUmH7ZUiRjyCAOCyi2RyTI5+I+AXKJYjXT6k+OU1eDVLv1wfVjvIiiG6WKsfkyFCgOQp1dNr8BC3Ln@lists.infradead.org
X-Gm-Message-State: AOJu0YzFAHtN880kvbKsemxLYa+GBMAPwHHuG/MuZGv0XnFtgvqHnmKj
	NCQvYqs1+qNyrWuolr8Mf2AuLPTA6MirmRjpdYreauZMgxpe6bgS
X-Google-Smtp-Source: AGHT+IHG7wVN8sv+Wk0L7DfW42pyBFghSXVRbiqAmmc8nei7NQaHvNsehM/Zbqwa+6Obc4oF8ba3/A==
X-Received: by 2002:a17:903:22c3:b0:20d:f00:bd26 with SMTP id d9443c01a7336-20fa9e68136mr37239775ad.36.1729694546188;
        Wed, 23 Oct 2024 07:42:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f109c5asm58573725ad.305.2024.10.23.07.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:42:25 -0700 (PDT)
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
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
Date: Wed, 23 Oct 2024 11:42:06 -0300
Message-Id: <20241023144206.1099622-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023144206.1099622-1-festevam@gmail.com>
References: <20241023144206.1099622-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_074226_925179_5D7E45A0 
X-CRM114-Status: GOOD (  11.80  )
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

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
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


