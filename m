Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58281CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=; b=okUlal+5n5+qLxDtkOOTV1Sz9s
	T6FKQImNYNW0Mqplha2aE8P1n+f2vjy3AMnNlZ4DTB891C+eQIdzrh8s+XGP+TCahTsrIRtAQN6Pl
	qrcnzfVzaTI944aSwAwTQZi14W+LGn7WPkc070Vsvb1bnCsRL2Gd9bQGGmB6QpU1wLEOWNAq1s/pM
	q/52okXhr/VLeVYryJrFGR6ouhTF3D/XfQiB5MZRsODzVJ1+oZTJCe7RsDb8hwXvy6g72c2DgQpBm
	f3isONQB/gFN0SrbTYrFPdVR+75fd3Sx2z/0JRrM+sI9eupn6GIuYIPx0/emAt0uD2THbZXptBRct
	merJ3TEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnDx-00000001Q4O-1MQ5;
	Sun, 14 Sep 2025 13:57:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnDu-00000001Q3Q-3acB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:57:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45f29e5e89bso8565215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757858217; x=1758463017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=WD0HcThKLmTLmNfSfZn6Mp+Sw0aWyx5ebQ8OBGVMtgYOQTkBvXNHRAz8VbbdD0QiLc
         2u43k4C/LwXyMHNv6UarUayb4H5Wr0wEJ/wEsp566KoK8Epe4Y3LTdq7XSJBdi7T/zO2
         D9Rd5fbFbZbZjNGFJeRez7e3QxiUxpWQIfTAH+OerDOi6hXKTm3moAPPJh/XdRXO80cu
         25d3SmmWL44W7I0gZCsdG5ZOvZspPvpG0U2e22BA5Z1nq0o0lq1mEN1yYM7m5a1t53hn
         GFAcNY7H+OCIw7tSiqmjbxN5GEmmdrgC7Hw6lStb1MGC4dtUFt4LQdCkwwXrIsYk3QOQ
         mGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757858217; x=1758463017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=BiZYUOLm8O9zu3g4L69sjmcz8Un3JsPqnKPqWLfCxu1WXHHToYwi0/0CQKoEB4NXdv
         jb9TtwgfBi2uyJnR+vVucJsCm0sE11N5Y7ziyVwvOY1hL8BEHsyM31x93iI6vun3IhzF
         Qo4mhAfr8r1GIIE5KAOyd1Is2XoApmTYglpHtHnWzgtcGExEqGdMou2ctH8fqnucF2RK
         oTf4aR+t5XlcWVJyMDWmjQE3GHpS252r5fAvB1bBh9wf0yfaWgKJQAz0kt72hS1Geh3T
         zR/XahKDqSil2hqliGp9xAJzlOXnUABMxweQ6I3q/FHzphw2To6RkkbyyCflZhxvWMkB
         Nk6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYr9AowGTMEG+2et6QdzorHJdYjsPpcSQwtum9r3qCbMhePfOGpWMivuKJLKy5C21qWSVuMxAqzChXimQ/npGD@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQ/f8Xu4Iwz1qRipcx9Q2Di6uYT0pSQUckgjffZrYqZb7yrfe
	Ilop30dnJX9SY3N4dCzvqu07mFrtZt1XvNNe7XoALV9Rl04Jbjt8vwSv
X-Gm-Gg: ASbGncuoH8p36F6MPiAdmVKE6JmgWzxHSGaspTTElP3ZUNXUt21RY2pRv28Ssgw3R9B
	KQB/Tcs9AnzdpPXOn7+G26LeUvw3u6OBXUZcZuYMZ0x/vzR6/JnLGERlI29GQDIKkjUvgYVCCMB
	bw4Oxj0OOxK02+0P7zg/ThV2CLHZD+2JnZ2BCnf5tzhgCuFBRh3K6+4ojh02jAlcgmDDb1VQLFr
	A5J+T0r96foLCYyDryC3fthzH0TXPybv70NQEgNhAjOEYy6FwOyYBZGPOpdXddTDbz2BP9h4bE6
	NgxLHZghmll12NZt/JtmyIjI3qjn+/e0UT/Lk4ZEOALePM/+0sjxwB3AbFLWBLGL+wdy07ZV6IO
	DA9HntAQlm0ySEmUmwfv/TgtEOCaXQQAZZLoWkpMLUdl5W6kMa+3PJCG0lmsJ2GD88+p7KQzvRw
	==
X-Google-Smtp-Source: AGHT+IHB+VULFKNGf84XS/gc0CK50EFtBdez3HC/85lxGgum+zb542w5P3i1LGfQ0Av13zEl30jWvw==
X-Received: by 2002:a05:600c:1387:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45f211fc2dbmr82961965e9.37.1757858216790;
        Sun, 14 Sep 2025 06:56:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e84de17f9bsm6740887f8f.49.2025.09.14.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:56:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: usb: samsung,exynos-dwc3 add exynos8890 compatible
Date: Sun, 14 Sep 2025 16:56:52 +0300
Message-ID: <20250914135652.2626066-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_065658_907197_EFEB22FE 
X-CRM114-Status: GOOD (  10.54  )
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

Add a compatible for the exynos8890-dwusb3 node. It features the same
clocks and regulators as exynos7, so reuse its compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e5066..6ecbf53d8 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -21,6 +21,9 @@ properties:
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
           - samsung,exynosautov920-dwusb3
+      - items:
+          - const: samsung,exynos8890-dwusb3
+          - const: samsung,exynos7-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.43.0


