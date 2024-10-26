Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CAED10C06
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=; b=zjs17KDJ2RilJTw1k/xXbuqO3T
	F18EMt2RV9ASm99UtivODhwoUvf2lsL9pznqMjVFWNTW78d5Rr4iGsdfrWp4QEZCoh3TuxkzV3UwB
	YAY9AmwYVFASKC/gXG4HykOJy07m1GN+8F/VpdrVwja+QU7iOQtHg2eJ5rAxqpRBDUZCzWfi8Okrn
	Au0uJuxfsJ9R08P2S4b7UExPF0GRulosHDMeE6S9E3PfD8anFMuuSvziSuKttPRjlsAQcvy97jwTM
	YYZx7fMVhyH8/mNKqzsWD1JY5Hc22NzO+vdPStXUb7qraeisyTKuajfQnyRAXfrLOlUF1I+1pcZdA
	YDxUyj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nkp-00000007EOP-099V;
	Sat, 26 Oct 2024 20:51:23 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nT0-00000007CAR-3krf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:33:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f58c68c5so5364922e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974777; x=1730579577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=CtWonxk0Ag8aQ+LTf89xM+z9ZKP2DB8UbsE1YQYpD9y/WEGKsUm/VxfgY2wtqIXCuB
         taL8bBTrxB5T85Fr6tcXRHz9kUcaIQY4gucxDpzjoEzIB2jEXDZMkfwaYO8fYHeNSVs/
         4mpNtNMfhtEE+kiF/a3NtsttxLUPRvWQOontxmNahtZ/EpY7elfmXJzsWEdSy9eKqQF3
         //boH8ECqJle0Wsi+VKBCdJMFXgk9mjeh9QfGm8dGjJHKpjJioWIYllMJOQ5vyw1NL/7
         iRkUfbJKI2FcHMs+vwtZDrA0IduPd8BXzYcYjVCf/MLVCogfdcFk2uZ4FQpFKT5kA5xq
         r3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974777; x=1730579577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=KOT68bOuyfjtV65wiezs0/+J/r4eXkpXpCCpmyuKlJf3GC4d4DtnEn6On0Ew9n/LX4
         yOlxltSMVxSwt9y46G8kzBThZcGqoMnDgKjinQvig6fzHRli2WEBvITgqsNUG1ddUidu
         PsxOksxdXlYJgiyfQlFiewrHdbLbDYsJCb2yFbEwuKrbZ5DZJU++QMao9PysjuLck1m+
         eibimEBJzhBD6x5TqoHiYHdZLc5YWusib/eN0w0XRns8qhKRB9nJPcOMzx7uaKjYKeCZ
         sGG5nG1Xr2WxMHgBb7Oy3FZqOocmbhBBXYrfimfPT76nWPlhfWF/yNzekLhgTpu5eYoo
         k5oA==
X-Forwarded-Encrypted: i=1; AJvYcCVsYggXFwYoPaVhKzKupXnguptzJlMj8JnMe/lgYRctGuNKSQbjGkFo9Udskm1HV/ezWXdMmuXvpzFcIfSlLSJt@lists.infradead.org
X-Gm-Message-State: AOJu0YyqrsEHUbtBbFIdp+Li/gRA/ELyE+pfmhK3oPlIBMQ9RjgAr1Xy
	/oDnBlYoJzWGXeLFREwIWHflZbr89MadQDpjNsuJdZDRZmwha7FE
X-Google-Smtp-Source: AGHT+IFa2cx+0Db9MPUpvPUybZJma51YVLqGjs037Ljgs+OOjPeRfsff6mJqSA/kPnjStiC9XI1WDA==
X-Received: by 2002:a05:6512:33cf:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-53b348ba0bemr2131592e87.4.1729974776404;
        Sat, 26 Oct 2024 13:32:56 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:56 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:35 +0300
Subject: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-4-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1230;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=nX/aujPmPzzwxGs4OFiOnvYO/MsiQA4p8l4iwrKD/GI=;
 b=ulm69Z4o3o1cahCfZW8YV+xutp/R9Nj7er2UZqMzbkJfaINK9TcPgF83sxdHRHBdWexXx7rHG
 5GF51DcJR18DQbQcLzdR7sea1bpqyFfBfZD8hlg2oWgkqzFZ2wbgH/a
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133258_969897_0B0D548E 
X-CRM114-Status: UNSURE (   9.93  )
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

Add the compatible for Samsung Exynos9810 pinctrl eint block
to the schema. It is compatible with Exynos850 EINT controller,
and doesn't have a dedicated IRQ line.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 565cacadb6be77b1be1a7423f88564dd950c44db..68ed714eb0a178c46228bac142d69bbd6baa6277 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint

-- 
2.46.2


