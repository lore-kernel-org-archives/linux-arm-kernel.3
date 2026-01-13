Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4581D29DF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=; b=lzkBs9MSYMRIvKHGVXpBnXdKAj
	RKMJM7OYGao3IOXgQiWbaG//lb1NCgQjdBYgIcFq4uYlIHkCF+rOTDzjnytkqvIKPZRQX7C45ze00
	9QTbCdxlmtoOEOSju6C9zkDGspbijlOuNTWR+H30bIgSrk80SlaPZiXGwoBejveLbWnkl8Mx00GUA
	P8iNuNus/tRMoObIKPat5cvXOOvsoTvtvZgUwnGxHZUkHmpiXDTpuoikWZp62Y7AE05Rub9aY4qgq
	Kj6kE4nTaZEura0swoc55uhMRqwPdYD5U+K4DmM9myeA2k+YQ/+sSmXyQlQBuwox8VDyZnEHx2RjC
	9q6sQmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaU9-00000006p2M-0zec;
	Tue, 13 Jan 2026 09:14:45 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaU4-00000006p0y-05BY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:14:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81f47610542so1103544b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295679; x=1768900479; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=hnEf8ot+lGqWBntdLq8V3taVs7sOJ7tnaso/9s2NkQnmcNoPcu1ka4uPzjKNSS/OQg
         76P/bD6lze4kuyKhkRDgBFStpZtI1pPqmqXN2EBSe2vcAImzZsth2t7xpiDlfA47/c+G
         iKdNQBIxG58qTmVXGMBoMeMauEpWSuutv02/sxl67jRip5tle/v4Gs8twBVEljmbO4OJ
         TMgnxIByfWQs3SfX596rSwjaSN9nxnTAArv7xfIkIiGGcDhBMGRcKJbmeyksOEZf/SkH
         K8z9AqoFF2NW4OfkOgKlyAaUSnFTBkRwoaQCxBvbjEnhTDNZvMvSKA48CYPxwgLfR4AC
         sROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295679; x=1768900479;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=mvjUBOOb1aGCJJ0TCPH2N6kqbfzu91kTdgXHw8kDB0nMOfRHCM+xVi/uE16wxXrmC+
         lwtS6ReGY4/WujcG4cPYp3G+BjZEWBKTnAu7kPBDCaoDT3Qb3Kmx5qIG/j7gWfBD9q59
         dNVtVpGDml8Nt8AjfvwpuE+JfINu0oZ7xyYyYSdrnH7nYs38ND59EcMg/SVdsZFPAzxh
         Hq/YSL1g1O2aV5i29mhdEL/wntxa5gFRMAKc68p6gaSm+UFeWvxRSw+R2TiKZUU/bBFT
         KtqEr9HKHyDn8qMw0NRKwx8cEhnM1/4LPRPrL0BkYb9G2R/MheRUNXAFLE0DMD/P7ayX
         Mg5w==
X-Forwarded-Encrypted: i=1; AJvYcCVAycns359ZMnNe7qj27g3Pu8KqvCGXB/MwLSYJq/g2FmfAlGkaskarzqS+DRgb6Y8XAci/Zq/z1yBUSOZ4OkRA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy3hJzdQbpSkWtps2dTe7p8YH92IdLUacPEhb5hH3FF7i31zt9
	87wbjocn7Fyt7SJRKQArDrkr7Zp24ya8qlv8jz8py1Lo+brhVC+IrzFa
X-Gm-Gg: AY/fxX5Fq4kepgB5V1Gr02WuzLPcjNUvIrKJh14j2taGzaaptdcMOBtyQE81WzHv0VV
	8AcWJSDH+j/yfLPEMHjqM72hmFUMEHFf2B1NGPHsekTe5Y/fHY+RbGVob8iNN/n5of4SFZF7frs
	y5rz8pl7dIbZf2Bebtplc6LLIEDkEZjE1bVlzh931b6vrdJWmOpXZbIXsNqlQMIrsRbWAS0XZDq
	5agPi0iaAClSzGe/8zLgRso7DOzTP3Y88IgwG3ZSJClxIhv2dCZYMtW2I/Q9hm/qXpa8PsDJ5Wu
	6+iGN3Vfo6n3LpnNmyief2l9SnytVi0eJGTv7B7cDwHPEwmA4E0opFE9BQmNFO4EvNPnYyz3Ni0
	JgyVBIAZroiNvjZ6wevP2jzDyylHTWUs5szku3gomPZ5c/sw1EYZBJrw73lYo9oPNT74SY53jFs
	Qi0+J+75c=
X-Google-Smtp-Source: AGHT+IGsHeyylseX5uTR0Zuev3x2aRQU9RlBAKG0seW0iIbuL5lWyCYCsms8xRBNCrhbFAf8lGITDA==
X-Received: by 2002:a05:6a20:2583:b0:366:14ac:e204 with SMTP id adf61e73a8af0-3898fa57649mr15886967637.66.1768295678911;
        Tue, 13 Jan 2026 01:14:38 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c0bsm15293915ad.31.2026.01.13.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:14:38 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@khadas.com
Subject: [PATCH v1 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
Date: Tue, 13 Jan 2026 17:09:50 +0800
Message-Id: <20260113090951.35928-2-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260113090951.35928-1-nick@khadas.com>
References: <20260113090951.35928-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_011440_061536_432D4A00 
X-CRM114-Status: UNSURE (   9.39  )
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

Add devicetree binding for Khadas VIM1S board based on
Amlogic S4 S905Y4 SoC.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d9963fe9259..55663e0f7f915 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -247,6 +247,12 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
+        items:
+          - enum:
+              - khadas,vim1s
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic S6 S905X5 SoC
         items:
           - enum:
-- 
2.34.1


