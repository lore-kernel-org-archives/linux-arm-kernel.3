Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20D3CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1jxxIyK9Ih5zhWAbEfQ/SUSMwO68aineNys1TdCPOI=; b=VBz0Edb/JwJ9XOOQQfSBmXJap5
	Azi/JJ8zYpWX/5pDeeBLb9dRKA/0J1StPysO7yuIGL2lOexh17rGohtx/YzFTgq7ETCUj2vmAGP9t
	YwrKRLxQBTmVsgOFZJ6nsrTY5E1XonpOE1fVaVdM3S46qioEqWruhCe36SsXpu2loZjmc7SmqhWlm
	jl15UlpfVW9qUy0K+wIFevM9CoFTIHfP/MlunmFrseJIzClzV6giVYRGGfvVOxWcOeDep21E8KiZm
	8/eWIlwLMQukWSmfhJSw75H67tE87TBjzWIRwDPPHogHRyr0MdfVA/+Jo6TY1y9fcG+YiU/A3H5d6
	nPGjpc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAK-00000000zot-2G3Q;
	Sun, 14 Sep 2025 11:45:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAG-00000000zme-3qHH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:45:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3dce6eed889so2946743f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850303; x=1758455103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1jxxIyK9Ih5zhWAbEfQ/SUSMwO68aineNys1TdCPOI=;
        b=SgKd1nHlct2VTQioXQprUGkAqH01E09UYqdjpWxNo1PXearcMiz1YBsmun4j3Cmf2N
         MPXisbovzy9laOnuqMGUSxNX39+WDFA1B32/uLkJL2bplBvP5YYJiH7udHDUfo6kFSRX
         BCUGid2jEY8Jt2xgSaoAVm2OVijxT6yMdu5/2RkEYGkFdHDgNjm0h6P3NLkhHLqr23Uh
         Uww5o/IIoLoSnLOAzMjYwoINJM4aOnzWPU9n0JJmr/mX5oiX49lOQM7OdemLFSHIfRnt
         xPYUetzCReRA6Yq5PAlFRrymjfqOs77Z9o9nR1lVf6gkl0oiD6ZlVj6ku0IH2vqYaLzv
         8jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850303; x=1758455103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1jxxIyK9Ih5zhWAbEfQ/SUSMwO68aineNys1TdCPOI=;
        b=BoxrmFWqkCpYEEaD5VacqzuBJR+AH/N9BQDmtXFQ6yMgr8PTHsiIUC7VG+S+VAHj/U
         aoANwE2RTV2nfljQCX/CrxRUbHUawJouoz+SMoHx6BvbQ9ViAxIgThYaZ96w8I52jdiJ
         VAcyd+/0peRh1Bx4ibB041mURIKr4wNoAiDBb7uxm4zbD5T7sM0ZohBaDkUMBvp362p5
         eWCGBKlYpdKZ+AFrCBF8PLjE0P7I8s7FBo7/k+7IWTMho+DPhkV9VNju9whmAvcltb85
         zIJFoXY0tOWKZJbUX5LhrcqwXTMoSd3CdO9U1mRG6gf620/4nLdK77UdQqbS1iO9cvUH
         vvTw==
X-Forwarded-Encrypted: i=1; AJvYcCVtRtzQgRWDTb13eAGMzt8LZL9ezRtn4r+IwS7gEbpxCuP+oTmtbuosYdjFS5QfaqAdpFXiOyC0ewae2YuVSHad@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+NR/YL+KaZGLO34FcZcdDsrTfuGpgUJKzDrhEHn6JeFbYomuz
	HRPKYslYjyU1maozQuFrNZrbO20nYBtDs4hhxKiTQTk3TW+ePyxc0SvX
X-Gm-Gg: ASbGncuQGfVdIMTzBSvb4vuueTdBuSaLtbpRjg54DnTdleqU7m9rxlbI1dWZFPO8DRX
	KOWKhe4m9rGYgwkW4n1fnEkqe6WotQr+TFbIbd4u9/c/sAE8wdA/n1zqY11Z6WSJu56ZfXiQ74Y
	184mlmJ8YKGWvBJoo0F+DqCdGEbb7UOkUPxD0l9zfQvCLh3dPmEDdgBj/ze6kJFPVNpO1luuQS4
	SowK18P1P80aTTMjGfwETFTU1vVeTzHfb4ZcKeuwpelrrZhuOHlOJl9xeErioXWuQczQA/U/9gn
	Kjp7X0CcX4ZJ4yTSVV+55HK+tAT3JogCiFfMdpc3iHKgZmjJnZdEi8GRUhyq3NaORyI6HQ2l8AT
	IgsRTferhJ8f+K6BFf+R7p5n6YM8aUP/Kt2hqeQgHQYieVmQ/wGhAcGFPBTY55T7yRFI4DhjCWf
	LC/e5HvSjQ
X-Google-Smtp-Source: AGHT+IE1BqJhX9iGCNG9Rwq5f7XlNdOwfaGHziUaIwwwVkNizVz8cQGq1fatGEsUFHWt7rHYFPM5cw==
X-Received: by 2002:a05:6000:2281:b0:3e7:1f63:6e7d with SMTP id ffacd0b85a97d-3e7659ee4e1mr10069982f8f.45.1757850302860;
        Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: pinctrl: samsung: add exynos8890 compatible
Date: Sun, 14 Sep 2025 14:44:55 +0300
Message-ID: <20250914114457.2610013-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_044504_972890_591E36C3 
X-CRM114-Status: GOOD (  12.02  )
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

Document the pinctrl compatible for the exynos8890 SoC. Let the
driver handle our clocks for pinctrl as well.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856..ffd3e2dd2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -55,6 +55,7 @@ properties:
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
@@ -136,7 +137,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: google,gs101-pinctrl
+            enum:
+              - google,gs101-pinctrl
+              - samsung,exynos8890-pinctrl
     then:
       required:
         - clocks
-- 
2.43.0


