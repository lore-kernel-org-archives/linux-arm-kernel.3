Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=; b=paEbcLBSiP28CpYU4KlHWnk71k
	BRS6kvah/OzWvNPPlEl6DWTSWxQxGcsy2GUP4o4p6agen7P4Noysb6LgWBo9GgBy/KLuYVi8rQv2O
	h7lc5As4ReMUyUWbFgTiS4/ExMHdmkqd1BZvmfDOzE7fMaknkhrs+uA6s1EyZRDRfG/5fV4IwGBPp
	GXMtdJBTzyfh2y3sjR6rhxdBPmJbEitDuX5dYEaiDBlgbi66r9eeM1Q5mGlOyDOB9tR6+4LbG3Iy4
	x40hDcabeky8g7xa+8AOBwP241xpxqYMAM6npG3lcLoRavs+qQjLuKomLP3eBsg83KuAazJ+RDoxp
	lbmPdeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjo-00000007JMr-3wA4;
	Sun, 12 Jul 2026 09:44:40 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjl-00000007JKG-2mAz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1903119a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849477; x=1784454277; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=Wg4AbUV03nDTZnycnbiFuiNkHeNkncilL47DQ9uN7T/kVgoC5htCZfl5TSFTJrl+Mp
         tzpwrF7M0acZELJFFVHGI0qqNMaceVluydjynY0Anm9qR5uZ17zSpINtym1ecgXXjqzT
         iUe3nErd9a8RzpjSJsm6Lu3XSJNqQzRlG7v1QyOvkWkOG8p18tRAQXSMqdWrGBuCp4bh
         2K33IEPsy2BgxVsNeeNWwawkxAb3+q0O2uF95UcIPgePJxMPIElO5DjIjGvgTTPSo0m/
         4hcnAtDtxUIwRXhaPoOSVGs7dna/J+gYm908LDpPZ5ZiJ9neID5arqiy48De/Xap34bp
         klyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849477; x=1784454277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=YG4CN8xC+yMkZZSXGh+O8CjRM2hIB6AQTqOlYaKygETM/XKwp3ERasjbak/bg1C+JR
         S+Js+H9OY7HPjTaJhWcKBROo3JBhyE4b2n+LaMlJrC/oqlG6znwIvCJ9USztLbI3+zYW
         pzpXj2ohnqakm1PJX5FB4ZZywMpfcKBFJ/Ym2SvXH61nTov+n+yHgGkSImBlmGoN5hh5
         5fSFNlzWfQO71nIgaUB9JApP7nB9Ad0C76jhvcRKnN3s2xeW+WqEHUXOUXZU3IdAUNv5
         amMAtjHXEpWgmnFWqC7UlTmIKdIIK+ckjVyHYq2Gpw2Q5KCwmmziwldOvbITHaqCXlUa
         m79Q==
X-Forwarded-Encrypted: i=1; AHgh+RoIUsaNGxsqMs1pz3Soyy+S4XtLJjbWEN5FfPEsx26Jp47h/kT7jgKwgJjch/WA64p80Wx8GXwSGLqmkpN1a6n0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/DciaGOF4H5dktc58lV3EM49WvIAv+wdIrJrSyAgU+zNhVn5J
	1L+7TH2zcsJWWAUFaGDwuQzplI6PrnhXYE7OMC4pWrTRUy02MNUF63/B
X-Gm-Gg: AfdE7cnXMqTupjRWhg76eIBWfDBdIhfcOebBIrzyIozVhQMngl0eavXwodaUKNzdBZZ
	gWJJlcDK9LOTBGw56hYvLt0TMCzOwWqKrLyj4VTTCT8rQPSm/0Wx5leU1cu019pzyzvZVx4LSnP
	LkTAEXBCZfK+SCq9MV+skxVSter/Ngmc7jsBa6gvJMaUy+R6ql2+QtPrRkeYqwVth+nqxiKr9CO
	7YS9y6lni98GPBKSIkHpgpuTUgG90Ljwm9oIJg7F5GUtv1JQkGrf2suhcqiaV07GD+h71eIbX7Q
	I3mZrCbcJqTqKghPac0eIS9CTzNoq4g4RlSr2o6l7xQrBtOq2DDOgN3fvwGfOBMW4ngKKdujYrM
	YQLyrpEQ7bcT8GNfdUnk+zX3bs9LAKuYEDyXtcZHrwceIwzzPfgyVKjruMx0cSMSz08LZfL9SNy
	uf8OHHR+q1wuWC/nSA8TWkCOdkbSvQWNQCy4nId2fgg8IoilKjZH3aEFCLKBvLXl4oThJ1oPxeD
	h55iXYCSSKP8DCM20/K0wuj+lUTGSv/lsjlLgNz+fMyiWE0uoYjUb/5vWwJrMY6
X-Received: by 2002:a05:6a21:3991:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c1103cf75amr5286669637.34.1783849476910;
        Sun, 12 Jul 2026 02:44:36 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:25 +1000
Subject: [PATCH 06/12] arm64: dts: apple: t8103: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-6-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU9ucqn7PBXrmNx968SE4F87GWuiFKomiFjozJK/0
 nV/ZsPOjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRHHWb4Kzfrg2/M32lJtzr3Scty7dX5f63uzFltiROa8y5u2Z5zXY3hn5lN3Z6
 vaX2H1wvwJX7p2tvj++X7loumW6u3nNrzXn3qNG4A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024437_715171_BDB5A302 
X-CRM114-Status: UNSURE (   9.40  )
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

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 4d6a0411f086..5b68bf0df4e6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1250,3 +1250,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0


