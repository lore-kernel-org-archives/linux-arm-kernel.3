Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDE9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSlNtFCEnirtv+C3yQQNe5++1QvQ4uNDEpVQcIjAKhs=; b=DNs83l2/4nov6hH30jc6PU1HBB
	cMYh2Mokg2LFp/LW/EyyGxynD5GhQnQ+86dn3IPcAbhdbuFvyk4u8VHDjhps0yUOqMz1/+v9/Ly2z
	HxYe2ylk0PDX7Mwoty/r9+/yCrUU4IxwSyxpR1++U+6qIl1WIBEDVGCz+zzb7uKbuPEoErAaXphxK
	2TORQj4uCZ3u9t5RM3WaQWPpH0sC041GMQkgKZ9MuT4o9qW/xvKYzh7ZOVSPxFsKhDt2zrmBKQwZ0
	bA31OOLko6n8MjDKctOVJVnNmzQKaQJZRztYPNiGBVI5lBU8EmdpCx9Grvveryt/kP089wY6Yf/ge
	oR6qh8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU73u-0000000FH6v-3RYT;
	Sat, 04 Jan 2025 16:31:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU71d-0000000FGq4-3jSS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:29:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso89674605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008160; x=1736612960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSlNtFCEnirtv+C3yQQNe5++1QvQ4uNDEpVQcIjAKhs=;
        b=dTHaOFCxrNjWEzjgv4A4HY0FcYEDyFKz8K0OjOApMbnMPDoZJXdWpMMLp84vVjJLfA
         6PVyJuDpd8hCsUQXHV+dK/HkTOOamlz/rqaoJcFfehzruuQTaGe3WmAWDxz2NmoYRZwV
         EvPJ3u7Q9wUCBPmAkGw20f2tNAJc9AUyG+q8euMPfi1J34RBpIiVWu4r0JrCsB+14ZEO
         G9ElSCQnBTH/idKrFCIHbWPMo5yvFiIs4FwfeFUPSl1SQrXw/6OYiTXPwfCIRlS3AwMc
         IZ3GD0jh32hwsBDRFYwg4oZ75fCknpoXNKWZyUwrP1QzVoFLm05v7VA7xYuv+8/btvF0
         3n4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008160; x=1736612960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSlNtFCEnirtv+C3yQQNe5++1QvQ4uNDEpVQcIjAKhs=;
        b=Vee9eo/QYQuXqER6piMH9+kKQFN7wQMKBWnPH3ADIn5WKXzgK9K0JPoojc1gEdBLWT
         n9WPLrfgnY0F7yw+sVv+qtQzpEAzMn69TUTgP+w0x6BD3ixY4vHg1eu9GlmSDayx95bT
         Xa4VpnGxbs5eomMUOPnI3hZmQUT9wqt02m79xIb0k6I0mxKUTBBAQQFcbwUd9CD4312Z
         kNJjQlqLw8k6aQMPTtk7fhlmLH2IRgvCsgKD7O69WIZyGZNNSor2zd59pOljjqPUkfIM
         DNNvke0zWWDNRG9fIzZ3234CI/bGxAustnBeZtBgteeiN5hFh64UTqluJctZaLv4aE6b
         S+2g==
X-Forwarded-Encrypted: i=1; AJvYcCVBRgRjFy1IgAkV/1DhGolUT9T8rZ42ec3kX7sqIWbMgd1eD3Q9IwrxIzG4brZ9zbG2IfFXUAbgVLecYQiz8kKW@lists.infradead.org
X-Gm-Message-State: AOJu0YzsOXLVRtUHrQNLowV/KgDapgOAv4fRgL8X8Ktb8qFqGWKqTOo4
	+UCcbDjPx23jAU4iDij1opoTViO3NtxFkn3YpgUyPH15UcGhKN+/
X-Gm-Gg: ASbGncsf6l+NRbVDhKgjhGi25lINrWuVD2PG7vm+AKzkl1wu8ZfaJ0HGbZ0+duN8F87
	Cjx2sLg2rWpp1j+D2EznFrICBbDEa6g+rWdCjLoTULhxCOEyTesPnZvfiVQ8j4HFWA8r9oxP3O0
	Kwvcaqhr+RXBcoVZEwGqKxtqcxWDzD+M+dteMxQSVMgLQvJp4osjzjvS7Pjhf8AaELhdLG2tdID
	eplX3VZmu8ctY8EcZyjofqdbGAGr2kOaIUViXryj7InwEsQ4Ni82Zv0aSxS5j26S9hOD8U=
X-Google-Smtp-Source: AGHT+IH9lA4rF0WDY1qh8cdz6wgrOJ5I2spF26AUuuTbh/HX9dlF9UotV63FVNTpwKfmfiezduNw5g==
X-Received: by 2002:a7b:cb93:0:b0:434:f270:a4f0 with SMTP id 5b1f17b1804b1-43668b49981mr400164535e9.21.1736008159960;
        Sat, 04 Jan 2025 08:29:19 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:18 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895
Date: Sat,  4 Jan 2025 18:29:13 +0200
Message-ID: <20250104162915.332005-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_082921_924186_C8DCF38F 
X-CRM114-Status: UNSURE (   9.58  )
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

Exynos8895 has four different SYSREG controllers, add dedicated
compatibles for them to the documentation. They also require clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 3ca220582..a75aef240 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -21,6 +21,10 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
@@ -79,6 +83,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
     then:
       required:
         - clocks
-- 
2.43.0


