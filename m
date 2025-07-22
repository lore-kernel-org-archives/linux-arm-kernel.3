Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B518C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv+tZhrl+Wcn6uFNNvEUj2UjskoQOzByDgdbubBH+Cc=; b=MZ8RAviRiMbyBmwuaw81V4Uy0C
	W86mqB8AEcjnByrwktsHjJ+5AAVb+v12NbzkJO6EnFypxAWWZ1h7Mn8DV2E/VFkthoKJnX0vbf4Bw
	Pvzy033UXYytetbaPFUWrEUE5PejmgRXgy9RdkTPl2v9refeCNfEwl5/iyMKs0kxrxJXjbQ0aG4xV
	RdLTXzI9xsRtpzoYtfMKOj4ofzeE51dsLocEyyx3ty079hzwbqjElWvUpvyWKO9ig+IPLdbOSew1s
	ZGHLVp5PRRcqs2xTZSGEvTrSJhZEZa+K2uxNMIlOH9xOwqgbNpse7UQazCPCmNSpP8FReh9EVpo9y
	CWEvFtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBwE-00000002P1g-1Mnt;
	Tue, 22 Jul 2025 12:17:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBq0-00000002O5M-2mIs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:11:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so8442413a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186275; x=1753791075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv+tZhrl+Wcn6uFNNvEUj2UjskoQOzByDgdbubBH+Cc=;
        b=ayJY9DPCboyY3Jf8F3wMLOBiBJdU7zwmgK5/v60p09snOHyhfg6mhr2NUxximhy/Qt
         ohdzbRU/um/W/RgbZWG1e6J14M5y/1+67wV3xEPXGgGN5Q6GTb1rlf69nSkTb9/cZGpm
         JmrL+yODzRv9SutsGZGX5XY+hewfE1dRnttnsrUxFrSZdMxOb9/ZNKbr3cdxz0QGGQp0
         G9axCr1doIHEyBKcdCXUCO+SniITcAfMSVqNri7CXurGPT/4UZ+MLoi1hRyi+oTJ37kI
         pPsoevHcw16INjvClPoDLNzJfdTKNkK2Ki3IkTTE3rmr0pdsTCyE0pM/RPLlDhN5TGjs
         Lq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186275; x=1753791075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zv+tZhrl+Wcn6uFNNvEUj2UjskoQOzByDgdbubBH+Cc=;
        b=V6GJX301l5Wt/nNuI851WgYzcU6wvGBGJLd0eJKgGCFCfTHXCl1sLc0BA62NcEj25s
         sUPDtCAKpyYusJsm+4CL3P6S9fL/lTPEQsbQa3+ae0kY4CMJkwsMf0hee2LBmelhQUOs
         eR31/so1+nq17Q6g+uSyWt/RKv39HMoRod61Cg6TXdTR8hQLZgpMoxiE3F4CVkMwv0yC
         +K0zZNXxTm9adFJxZF4bCSI1qX61cvmkdSasq8Wz6GlJy0XkzvuuwU1VgDOqwXWGwZ6f
         60PHVZEJJBV6ztmHIT9rhGIBpZikHcxxIiYmDOFyZJEjpHSx5VwPr/UZXMQIWD3iO+we
         7QXg==
X-Forwarded-Encrypted: i=1; AJvYcCXHpRaF0iL9C4vmLSAFzulFhuO+Tk/5ChozP3jcXflkWVnM3eN+Xo98V3ps+YPjACqFcQIefD6yjxETlySM3FjK@lists.infradead.org
X-Gm-Message-State: AOJu0YxhE6t6oJDxnwV+Sekb188eS8cAPii9/CENuF2wSjYkZM4ge8ib
	m9kbwPTbQjKwO2km5/fVEzljtoB4S9fB5SjmGqqCCN1xWuFpJ9u75AeM
X-Gm-Gg: ASbGnctsxz+SPxALvuswaFmyS1yEkP2Ke4QdjEFdrzQBPKc/8Oezazp93QYTmEncwAi
	ynwl5e7A53ZSKMDPQDZ/VlmV33WdPa+y3d8IiMuYvBWryXGDwy++IRe0AmIOWM+Jcmgglv1YOxU
	4WZT8MR05l9evLjRYqWJk3hsO+dwtLB6tX0p3TROMo5XX+UHUhkH+qV98i+NohZSG4iVeQbk4WY
	nawd5Eqm5wN1zenTt0GwFn8lHUBMhdVxNfDZBlEdfTogGLTg4fp6ia1EIDCp1fSvxMoSyljAALN
	0nrWsi3KnD5IwWtP2p1S5XOKriru4BTFPO3asAEG6BPJPqZuk9fpa7TVOnDlqJ1En+oqyhi6bL7
	/1+D1SVCxcAeMSapKW5pi2s4vCLjypIa+9u//84nf9O0ihmjdaPyBUQ2D/HQ+jatcYngNK2Y8Tg
	==
X-Google-Smtp-Source: AGHT+IEDGi9GxqWf228UYf4p1deeBYNNfVBgTG+JsaC5v6+BQixV/bogyGY53axRn5ejj5ISEIoQyA==
X-Received: by 2002:a50:954b:0:b0:60c:52aa:d685 with SMTP id 4fb4d7f45d1cf-612824ee8c4mr17190623a12.28.1753186275119;
        Tue, 22 Jul 2025 05:11:15 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm5090257a12.51.2025.07.22.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:11:14 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible
Date: Tue, 22 Jul 2025 15:10:37 +0300
Message-ID: <20250722121037.443385-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_051116_701104_ECCB1699 
X-CRM114-Status: UNSURE (   9.24  )
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

Add samsung,exynos2200-usi dedicated compatible for representing the USI
of Samsung Exynos 2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 4ce871676..bbf6d3b2f 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - google,gs101-usi
+              - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.43.0


