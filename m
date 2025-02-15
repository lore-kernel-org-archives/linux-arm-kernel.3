Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57612C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DmAs2wGtl9vEWJRiZkcgsHExUr11UX/ugMzfbiEXmE=; b=BL8N9wDyCrWB1ugMT+x2Uj/tcF
	o66rrS5Q8jh4sxXNld+fbKz2XGoQv/oAjRVt7N97q7rLINLR3RR4rRvjAM9/xhQSQiAQ13GSwc7Tg
	hyW8Z45qErvaNqiCGrFUct2FgbBIZBsCJQyeprJg47a0gaI84VLbzDPZkAhM3CIXVqEDxzDesIXJX
	zEQr/PjF0+auo6egY7b5Fi/1ryAZ6dAQaZ3G2HP7A3brz8+CEA9WACiRnsaUcJJ3LyrqCWtHDOTM9
	z5F7knORO/Mz1QVLxR6RaV4yxSFQics6wY9lzIeBaM6C9zfy4j9y0ZhZVg+j9tpPI1BjoTQS7cPe6
	HByLzmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGNO-0000000HY5o-3w5N;
	Sat, 15 Feb 2025 11:30:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGKW-0000000HXGr-1Bx4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:27:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so1383581f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618846; x=1740223646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DmAs2wGtl9vEWJRiZkcgsHExUr11UX/ugMzfbiEXmE=;
        b=N54J+xdvwAzHcWqRvcA3BhzQMuu6wcoIZk4GzIFipm/FOuTTOzb18fdU6ZtU5MhPDa
         ce1qxU9bVn/hsdkcO+6l7djLzaE/Drt3veJ29o1nanA+FHjlkAWDfa86rOZojD2o+swD
         plyLRxRDvMAhGGh6+rhIiHzZDUrO8Nh21rEw0rUL+Tlkj6IN6LZUiJUH8J6FZE8bQIHE
         oTUUuwPkYe068eZSauaXSlv2yMwccEib+OuNnkL6b2ciQBcQfewo0fUe3EqSd5iZ9GzF
         bxxwa8O/PDDD/rUQRuv7QeqruJ5r5b/9WD9SWfZaCSCDsCby3tSPAoxCkRIUlwkPLp5U
         6oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618846; x=1740223646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DmAs2wGtl9vEWJRiZkcgsHExUr11UX/ugMzfbiEXmE=;
        b=MZsl5Q/V5e6JmnzPQiXTlT9DZfYauC5qbVZm27k2s9hFwtvj2Q3gPNsqTpwd9pMo3e
         hMOIKVnc5lEgXgKbx3x+XAuLORAmTeIQbpQChOzgrys6bPpHX9HmshDSsWfVcE4l7Wet
         pGNRbzDx+KnB5aQ3zut0wra/pbygX2Qud9YMFONwaNzLjNcdXQxn/Z93liUmZHDLdq5o
         fP+mUf6h2JoRkJObpWtqOAZ98rizuDiDuRnndSGBLr4X5splzHBZvIzaE5M9/mIMTKfI
         ck59Or0q2O63wYq7lJtJgW5IJHSmM4duE7QCPAY6boekLitoy8nFvAL/nUQZmOo2VAPh
         1gkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCDvThdIYkmZPbOqmDKMTCiortjCj43GvGDYZtSfd2uDhdZU/P2HZTd4vZfr6nY2NmAuQsqIdm+rMpY8pUVd4s@lists.infradead.org
X-Gm-Message-State: AOJu0YwaJGcbEKqE/vTia5ZBloextrSSLJ7lUC1kYgP0mHJXx++W+K2G
	tk6wWAIegZKTkScFmk6oz2irbiFlztGpugpK2hXSlYrEm4c+JQ6L
X-Gm-Gg: ASbGncsWHjLudzzL7MDHx5n3QhlUOvvnCtHjdKabnAlDaJI2IrsRQjqP3P/7DOninqJ
	0Pm1KJwfsMwsTbDNsyPqgcQ+2I/0HXV8rdH9ahAeVmu4PAo056xiVz2SJlS2NCg5gu7/x4ebBLb
	Hcwc6CdLm5TljFVmkJ9nh4UnZkx+8ShuJzEzLbO6unli8R3r+uhXkwKdapNIDudpOb9p6tkPdDN
	qyVLQwKcYNb2bdrMO3Vzs6dPONYfffSUZF/AJjc+tB2wQgP92G0JMS4i30iWprIXhqOLp1jmrlK
	ewTOQu9jB6VjAkriN5gEloPym75AezzDOn4zbWHravrzrUHtPy3CMTnhygRvH7k7E6k=
X-Google-Smtp-Source: AGHT+IE7a2sueUAqNgZAS1Q33k9cLqhxbcKEupKB0HO0iGFaWtbsbspOPksnP2rof9xnakewMUojLg==
X-Received: by 2002:adf:f4ca:0:b0:38f:2073:1493 with SMTP id ffacd0b85a97d-38f33f1c7d2mr2371971f8f.15.1739618846445;
        Sat, 15 Feb 2025 03:27:26 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:25 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos2200
Date: Sat, 15 Feb 2025 13:27:13 +0200
Message-ID: <20250215112716.159110-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_032728_320097_81FC5627 
X-CRM114-Status: UNSURE (   9.59  )
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

Add dedicated compatibles for 5 of Exynos2200's sysreg controllers to
the documentation.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index a75aef240..d27ed6c9d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -18,6 +18,11 @@ properties:
               - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
+              - samsung,exynos2200-cmgp-sysreg
+              - samsung,exynos2200-peric0-sysreg
+              - samsung,exynos2200-peric1-sysreg
+              - samsung,exynos2200-peric2-sysreg
+              - samsung,exynos2200-ufs-sysreg
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
-- 
2.43.0


