Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47367C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOHk0EcvHS1m6pI1CWGPH0pDdJT4Hc9pp689arLCCW0=; b=HRBYPOx7djmD5bY1QIlFWf21V6
	aW20de+c+UtHdrfxIYqGNz6Xe+ycXBTq/yS/HewPy0TI14aqRXNmL5SVv7I6xq3q1SQaskkm57LHL
	FYBb5m1x/lky4E8YslsjZbuMGF59x/PEHByhEj2cJjbPZvZpLxDFNYDjpSEw99C32LRehuxDUsc8F
	Tfw2hIZefS5z41Con5GzrhyGlVVpNdvTIsl2w/QNWBdj2dMbzwk4tRsEHGVxTJdzfBTSC6Sv73vhx
	+4PT7RJ6+podAFo3ErO2OyVUHNPrhXkKc3mxuxiHT2Ap5t06tlSt8ifqCUHuhVyTFWqasWC3vEyiV
	QCqyZuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9giW-000000090s7-15zE;
	Tue, 29 Apr 2025 08:53:28 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gef-00000008zsr-2Yrq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:49:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso7040688a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916568; x=1746521368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOHk0EcvHS1m6pI1CWGPH0pDdJT4Hc9pp689arLCCW0=;
        b=bwQRGSRdcJ7IzLi9KDzbvFL9Bh96w7tg6GabEoHW+D740Y8Imckg/X8KVYRDRGaq4l
         fljmZHgL+Gj2Pjpu/trZTlu1+HWVd1FJALKo1CNamgl7ePy0dLprN24mP3ueUwd2tIjh
         Wwg8oy9VIZlgxG4yiR+VWdwpQvfZTWOCTLAaDpi0gS2dduUZMnBH1ZH+AyY77F2i15/3
         fueBvfKNVhvBaai5eJWI2ynDitUORT2o4ZP43d+yjl2U9g9aUMO0PEtFf4sw2boRyyvo
         5lw9Gr8xjJb4lrodN4Be9Qr722sRvB9OvePwtqpI3ox3r33fOQCdjYollM/1q7zK37W3
         wRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916568; x=1746521368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOHk0EcvHS1m6pI1CWGPH0pDdJT4Hc9pp689arLCCW0=;
        b=TrmARVyJus2+eEFPt1dkH6ieb3a4JmQlqhhuh29mlmB4xpgEwnWAe4KVM76nnbPImf
         aBfsnlF8uQeSvJH3o/M+CJ2Nje4SM0/oglfbx01YtD5jsnEzEw/YZpH8ld2RxXYFycVk
         g28KRr6Gg6CYQLmWuFLzAGhZ29VjlpdzcwsZqk+mG6Vw+gn0cHeJKzzrquVVt7HF9/Rg
         0UVFJU9KpCAQx+7mSnlFVwQXHLGx3gy1q93vgw8PIVkWbOLjWL6Yq4I66hi+9QYYa6YB
         BLsDkCrxgbaFb6NH6kM11Cp549LKJu+p3ZYkeh3BamiCbZ9JMRtwXCpIuLc50MN1axb7
         cfMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH5SL04dXN3LhH1BwjfArCXiF+fgIPxLukO/vjqCM/ouSdYYI+5YU0T2sPrLpi0Ofd/Wy4XMq/6Nmn7RNbGDI0@lists.infradead.org
X-Gm-Message-State: AOJu0YwHTuM/E59YhDoqQKQBng7iJlyD4YXOoNOhjAq+FLeajBTn8wfs
	9pSR0gLMsTWg9nHQ6iqr+mjwhNgA9juCcKyzfS7zyQ91ffRHHwA4SsOxhzLP8c4=
X-Gm-Gg: ASbGnctZEe9VwcAEllNsDmGNgaC2DC3x4/XDoEykaTUXTqW4pqV8Pz2BRlqCEAH/TR9
	xoPAvluUOpJwWdfe6DzUu6YZJcBMmwSLhoJt/qHGrkJG4r3CX2iH9eqBqIniGm2RuB3fhNlg01v
	A9LzE5HgsShKWlZdlz2b7kkjNVQ/cBGCsvIW1k4LJ6C2v4XmsjgYqLMakpfaSyKLNNYJPzOsMU6
	KOmDwDhtL4uBySJASz/9MPBp/KIeSWagbz6RwmaSbPlQeCtD2Z4Fpur/17prsvzqEjZ9bZ0xEho
	GTUluX8QsozJ/sxkLJGf/MzK5discJA/DZXtC+SnOqWv192Vqi+C/FZEGFhCXKBqtpLzHM7mDbK
	hSq2v/5qX4RAeOLtEG8dXALYa/RnH36i8m70=
X-Google-Smtp-Source: AGHT+IHXapYhYNQRO/RaBffrKQEMjGSVNPTmRkoaa654MIwJC23akNlWVNoXM5sb6eltRo6RavJmhA==
X-Received: by 2002:a05:6402:51ca:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5f839b22e1cmr1914271a12.15.1745916567896;
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:49:24 +0100
Subject: [PATCH 1/2] phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on
 exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-exynos5-phy-field-prep-v1-1-39eb279a3e0e@linaro.org>
References: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
In-Reply-To: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_014929_641991_B922A104 
X-CRM114-Status: UNSURE (   9.67  )
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

The code here is trying to set the FLADJ field to 0x20, so it should
clear any previous value in that field before or'ing-in the new value.

Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 634c4310c660a50e5d0869645506ab1b64fffd4b..4ea1fabd4d6f9c9fe412f17d4d26be07724b6361 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1186,6 +1186,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	 * See xHCI 1.0 spec, 5.2.4
 	 */
 	reg |= LINKSYSTEM_XHCI_VERSION_CONTROL;
+	reg &= ~LINKSYSTEM_FLADJ;
 	reg |= FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
 	/* Set VBUSVALID signal as the VBUS pad is not used */
 	reg |= LINKSYSTEM_FORCE_BVALID;

-- 
2.49.0.901.g37484f566f-goog


