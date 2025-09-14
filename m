Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDF0CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kaljxPkcfQHPyVYy5h8ZrWxk1AbMPnNmiDPm6nh1Er8=; b=Y2jiPi07JeMr3HhmefbQIBVwV+
	Dsn6Tguk+6mzjGBiESdup7+xp8HkZ7VUYB0tAchbtYB9P9B8ke1G6z8O9J+wcmh2MwT4yzU/fCONL
	7o70YbKmXqoY56jcKvrhRv2PUyvdMuwTVrlrR/NCWxjVk4ZBhXKpSpppnbmd+WnbA4V5kk7SZzpq+
	oHQJGSIvcIFw28CFIVzoBXjKOiVqZRdStAbx51IpwJFQIKi2vKPIu5hHQcp0Vw5+Mowvjb9ZX8SDI
	1Ijthv79kJuWpXE13Ej5WR/OJTI9066X4WM7I++vbZKija9eKj7VmgUFAiNlzU1U9ISQBjZxXdSYx
	WxsLz20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmhm-00000001KP3-0TOH;
	Sun, 14 Sep 2025 13:23:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmhj-00000001KO4-3PC8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:23:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso27359085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856222; x=1758461022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaljxPkcfQHPyVYy5h8ZrWxk1AbMPnNmiDPm6nh1Er8=;
        b=Z9WhixNEwozdzMjaaMgKbLloST1RrP+9zSZKjnTDwOE4whksqbtTQu7GBMpmrtQ+cd
         aP26HnruraqVzZuWXgncYdvJn0fjymG901Q+93b+vmxeb8RaeIu6NwXuLJl8eC/+hSVR
         oiu4xxVZQsAWz3NtIHBTSpVaQdtt+BtGAADq3gcLDJv//dqubcgXaES2Vz770sNM4GhW
         mHcOQk+H0TKh16Xu5jWPLEoBTKr4uNXIKgrkya2XNDojUHaqXdjOQOnbMTTNIX7uNZpF
         50uCNP13uLw2UqpuRkycmREV8YSV1IMlJrAtBdrYY6aUsjw1RObZClvOnbLGiBX0nk0z
         tZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856222; x=1758461022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaljxPkcfQHPyVYy5h8ZrWxk1AbMPnNmiDPm6nh1Er8=;
        b=xKdnUDljIq2mpxM+oSQde+dveG1alh8PZPhF6wY5+vIrxCpv+nySpIEmEHbrsFZL3W
         +958zvjku3Xr6mQVrYQQ9NvWmvE0wVy5vM7kWYj4oPIDPcYoqQPPxxyJwBQhHUkpo419
         Ive8wfvy5jCa8R/nDCIOIkMgPDWwYr1HhespgA3kXmwv59F50claLGVLCvvzkAHuG6aY
         76B8uYZ91U06vz9KeVg7YMtGu0wjhIxz0bJ9ruJ4C9XWDWbO7QAWoBHTXdjqYaVdhzln
         P891bu1tmvXPzJSaGEwWss1x4VFQRyrfS4uUbjdvHbQIKYFoB5qUxwj4T2Ij9pmmH3Wk
         RS6g==
X-Forwarded-Encrypted: i=1; AJvYcCXXWvyyyXIQqjouXPqEtTG8O6W3FPK7r8sOFY9iHsmpi9v2fOfaAKByQJuqMhDvMM0kMcU3+c8F+fkgaTvLZXtC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg4mOfGwyPUoLxX+q93X0+Wkua899VFzDQhJIfSz9JbZ7TrMBh
	giQELyrilSy4BzZk5vAhFs1liqG+IRoBz9HKDQKEtaj/vmz20eNMZi7g
X-Gm-Gg: ASbGncvs/N/E2rUXPw5XtTmv1WjRK2HFwWC7ERIhCesl6EaWPoTxlGfjmSkuuJ/jCyy
	/i7yjfTp1Z7Lp1H/QWlmghxIV09k4cdchZGajBS7k4zRLsgFU/b0mn6vDwUQ/ZLKxM5O11F58Fo
	/HLoF7uTkgrRDX9fA5i4ZOr/ZAU3oWkheUpHbIC8g/InWvkE/UF84Oc/B/UTs4KaD6KVni3aS/B
	W5uvyPbmfVXMsAKveZB38gJm2j6oDFJdFOcZO8tyf6MH+RgrwuOhnxCN9qltoEhqfMSPSIw4kOu
	Bns/lJ1bihSo+/9MhTCLl5HA6cZn8SYN4anwTe+RYlhl19yx0nMHLE1EyCTu7hCiiISzvoUbgRa
	Gp0Uuve/gii1dpTkw4EEP6C2m+MIijhoJfFdRDdoUcxA+KLiaIBz1IvSPcZRCi4OSBVfNsYd0cQ
	RhAPJeAJ3b
X-Google-Smtp-Source: AGHT+IEDzY27XIjmb+pnfP0KAuMr1rdHFrYSHqkjaYiv+DONBXw4koHR1jE3FQkMkK1VOsljfrgsZA==
X-Received: by 2002:a05:600c:1c0b:b0:45d:2ac9:4240 with SMTP id 5b1f17b1804b1-45f211f7099mr102931935e9.17.1757856221985;
        Sun, 14 Sep 2025 06:23:41 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f27f44093sm61736025e9.24.2025.09.14.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:23:41 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8890-mct compatible
Date: Sun, 14 Sep 2025 16:23:39 +0300
Message-ID: <20250914132339.2623006-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_062343_868287_3CE2BCE8 
X-CRM114-Status: GOOD (  10.60  )
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

Just like most Samsung Exynos SoCs, exynos8890 has functionally the same
multicore timer.

Add a dedicated samsung,exynos8890-mct compatible to the dt-schema for
representing the MCT timer of exynos8890.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 10578f544..2c01e8bdb 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -34,6 +34,7 @@ properties:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8890-mct
               - samsung,exynos8895-mct
               - samsung,exynos990-mct
               - tesla,fsd-mct
@@ -137,6 +138,7 @@ allOf:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8890-mct
               - samsung,exynos8895-mct
               - samsung,exynos990-mct
     then:
-- 
2.43.0


