Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F3DCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kAG7m9JuJHlEHyVLrilF0p1L19ca1FzfGVRDxZu6tYk=; b=Yf6yLpB6DWiu5AGxM+vwYrSv11
	tUgYl/S1kA14Ocg/jy+xH3z68HwX8Kkj9Xr03AshR2quD77QAFpto0TLbsoN5L18AnOny7LIcAU5y
	naRGsMNt1QVkZWoFDbTjsC6EESQHQUgKpXTYiFjMnA/Hr1rVVE+88E0yBjtu+CqaTI4Q/Qw8ShhHR
	knpYV07mLFoszNEh6zjPj84YTsFu1gUBfsZd9jbtXZ2jZ6d2l+9aLQ48P7Kh8aosk9MP3hzVyo0uN
	4LBjrrmrEEPGKe1ikyy+bPPUN5pA01bfL+FoiCicdzLY7t5cBUNrcutGb5dF8+lDZsYx1cpGgsgsR
	Q9msHeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmeq-00000001JfC-2yPq;
	Sun, 14 Sep 2025 13:20:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmeo-00000001JeY-2rRH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:20:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45de56a042dso21172745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856041; x=1758460841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAG7m9JuJHlEHyVLrilF0p1L19ca1FzfGVRDxZu6tYk=;
        b=Rt9FTLrbTpNyjtryz/2yBdb91LKt+5OMZ+FbT740jipJpK7Y+NYUFgDhnAmYpxoNQl
         26xaobhsV6gj5r54ledj6ks1I8bewHcTpPOz+4ALArz2AJWze+/RhlS58krMwo7d/oCk
         XZUGOnbcm4wBqfvRGyKZdu5Z9v8yM3wzvUfXaT0t51BYjlxIW1iuviwu+j8H93EEBZ3/
         bkUkVc+zd4D3sXuw7Orst6xr/LmqtxQzIEmeIfgtE897uO9UBSXwj/Bu+PboEmWyTaBS
         UnYd/SAm0xTSLddPY0SQHSLl/JvJkvFZZGQXGyVk0q1LRMRwmQ7adcwZtst56aEtv8XI
         oZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856041; x=1758460841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAG7m9JuJHlEHyVLrilF0p1L19ca1FzfGVRDxZu6tYk=;
        b=Wbu9h1aD9KIWaupqGICXZpmFNNZukqXH8VP4U53iAsjOGfHmYzu/cNa6lONiIi6xRm
         l1w+iCC/t+B7Gr3MWMrJiHBMw5nfdU1+IvEjd6AzJATZPJ6dNhhYxIG+HFfATLXKC85p
         2N2KLi+mNaK3c6ClHVfzpDH+42kCoYquEwdlSrosN9L1jOKusv8/wcChkgYp745GpE64
         a9gsKZ+xON7KHw2HdQIOck0k4zsh6OkaKjvYcqpqqfEDVXaoYBUYUTusHw5krOIsUWir
         +dhP+rBCF0kNUZyt8K15Es9Qpf/dXFiNhAC84YIvlCZIZFR53gjZFzDW/sU02wjYWMG/
         xPyw==
X-Forwarded-Encrypted: i=1; AJvYcCUKB/7bPHUcfH3Fcw024UFfiJDiSlFYO/qj0MZ+R9echtT58F3O/eKwCcZG9m6N68H7Y7Esb5kYAUzQtvWlsjCn@lists.infradead.org
X-Gm-Message-State: AOJu0Yye+/Vxe8BARsdB/svfuodIdnN4pax+VIUzDOxLGYLDZCf+NIG3
	ZnJs2MbD23mScmsqATWoml8Igsg9OYB1RoxDlcGfzK8Tnn3wGQJ4UVTLR1SQog==
X-Gm-Gg: ASbGnctosIqF17x1+M03XsV9mbuIwarNeWb0pAqvE2XX7eizSa9xkYylzlyWN0vL4u5
	BKErknwuhrOdgj0j2wltVDR3t6r9DfyETpv8DaDr1HQd7y3yGN9KUV7rBLDF8UoJF7dCE2sz50G
	DbPMVptfCtGk9b24wixl0XGEsbUQx0HoVUz8SX/p3v+cxgPeuo2iZep8B3YQJkTI6sV3zy1Zgt2
	SedPMTKFHgSyjug0XYBdeYx3WrJX7yEvDA9DGwmIHrLES0liQArJiMw+HlL7vAPS8nItqyrLb/2
	xWHZe6nEClX1FOVeffAvlglqGiG43N1jI0xItdqjCFVfVWL/TUqBfHrhLo8UoETNav+q7r4hFsF
	BgiBg8/fko7G5pRymZ9ZTzvhw758Rf9wu0xYedeF8Ldzs54nQjUi+SF31EwnFgSOg6K0dXiiGCW
	mhyysSe6vn
X-Google-Smtp-Source: AGHT+IGXHijtzVt4eJs2ZV02TN6C9aMKH+pvbvhPrJQNoOx9E+tCmvs9kL5J7Zm+EWTDt2YmA/iNKA==
X-Received: by 2002:a7b:cb87:0:b0:45c:a955:4578 with SMTP id 5b1f17b1804b1-45f211f7f55mr62938465e9.21.1757856040463;
        Sun, 14 Sep 2025 06:20:40 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm29595095e9.0.2025.09.14.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:20:40 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: pwm: samsung: add exynos8890 compatible
Date: Sun, 14 Sep 2025 16:20:33 +0300
Message-ID: <20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_062042_730533_B356D595 
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

Add samsung,exynos8890-pwm compatible string to binding document.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 17a2b927a..97acbdec3 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - samsung,exynos5433-pwm
               - samsung,exynos7-pwm
+              - samsung,exynos8890-pwm
               - samsung,exynosautov9-pwm
               - samsung,exynosautov920-pwm
               - tesla,fsd-pwm
-- 
2.43.0


