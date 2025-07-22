Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D14C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nqDzbvTFUCnNJAo/5cnzfm9fwZI1Vw0IZkVaSkNbQRY=; b=kmDQ6otr5BFIP2pRN2wPXkTWMB
	lki836fsJWyKDZFbr2kchSGYLOZUkbBxXg6PSG8noGiRmeMa3PAa+6ni6Y8QrV9WFR7JyruKTzz6G
	JzkG7buk835Ayk1QKlgwCw4Qe8ui79bpo2NxUfVBX6CR4BgHt8COIdcvhI+UtbF1tpgs2HsEs8Wk1
	WbWXyQ4wMR8ZM5U+uv2A+vGnS/yZ2cobS97QCCci2GvZdFvduuC758HPR965b0CvBkbWv8tiUa2Tv
	F5+bFG+mPs4ejszpUAmgoy+8k5fTs3OAfQRUk2/g7SL7cifruGjjneR+a1/08xEr1olJ2taGDl9oT
	mPWkgBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueByi-00000002PVs-0Spl;
	Tue, 22 Jul 2025 12:20:16 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBtL-00000002OaH-1eX5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:14:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so1022984066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186482; x=1753791282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqDzbvTFUCnNJAo/5cnzfm9fwZI1Vw0IZkVaSkNbQRY=;
        b=WmXF9f/3ah3T22ESu45Of5hQHK7VK+hZI5hCYJo8GS9F5kajZIuDvb0F1aNsO0Brld
         3B2PuXqT11RorUcCc/ERkKVke0TRSWunuIn1diZHCqiBJxkTBF5Ji77dmBTybejsGHm1
         bAOD4owweJFuVwYnfmHoz/hPkgXnOTBA+0KESRIxVaBoSTiWA65mbkNpjvpSQKfZ1Ald
         zQgD7YG+NHgPYHVkNyizYnXPU8jR1QZhVIJ85bZRiiHpjkrg/FFjJjU/irqHS3ozN5pf
         AIfaRqmlh448GDMCuoi3PImk4LrnQ50c/7qLTE2yEbUWD35r/mI/p+5Y+RSWUQXcFtXA
         /gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186482; x=1753791282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqDzbvTFUCnNJAo/5cnzfm9fwZI1Vw0IZkVaSkNbQRY=;
        b=E9L1uFLl9TXy1BrUrFDzgWCJRCtekjxIXUZDSEAB1YhbUXyKRMCd2a44Xh1KPsB+KS
         PbF4bXGOcA9nuhBu7gYeULL4+kOQPQlMXaoWW14vuSoUhwGllmiXlo4R3p7DWwvtDwqB
         cd9cFLx2ZLAdWbGwADb0EHGtZK8FltumTOpesuOqYdDHcmLPDM3k7kKo1m6YHCOdRDr6
         21l6Rs+Q3PJ7R2KjTdsMQ9X4mFrMER3oeY6brTQji1uUxTCjFgj7I79gduDJ77cSWhPE
         Vd8jaImuIDuEfy/5Lx42y00fdXwsakXQRZ3l/ShilwRL4f2U9o/khxlAyW/ZCZKDH214
         zWgw==
X-Forwarded-Encrypted: i=1; AJvYcCXqadMI/0Oc6t14gYiAH51iyKgBpny/4cB1tJCH5w4xIb21tZJyP5dqG0V98jIAZT4w5xIX5ZkHXp7HtBZjm7lH@lists.infradead.org
X-Gm-Message-State: AOJu0YwEeocCBLkvFzISjsJaP8FPV9NeEXxMncI5oGGen8sRXqSmWRaI
	URXYft67Q8WgghzdTvzjcCck682MKBq2YvKnzT/5wALIKZh6UkUwCPmj
X-Gm-Gg: ASbGnctN8B6B+ehCcTSFpyHk/2cz+jYswh4PgLZzCcNq2h0tq2uxyWI0knWmRzirEzZ
	X4IJEPNPU/C9u7zN4JPPsZfIjX6jcBAq4AvvPH1KTBqbxiQDi0xxh89arL7lgpsaVY10eW0LJV8
	LmlZ+5MZFPXxGfSXgZnOPm58//85s/0UrVtEV6Q5g4o74H+MbD6SrUmUXGJUqBO72hKo+trBCk1
	6jg/k0yY165/WmAp7hywDZh7oZRptZUm2A9+v6x6O5XSc6M4+d79r1L1+nLPGvOCMV+OURlWDao
	/hQjFxGg2wSqkzkr0Mx8Xti1jxwm+o1FO70XuerNh37I2m+X0XfRPAkiC/BftzhDuAd7YdcjMU8
	GFjVVsj/nRVi/VWr9E2HkT6DLgpsIl76u/99L4/Z0497Mxvcj2eoC0d5QzfVHsk/rxnQy94yB/Q
	==
X-Google-Smtp-Source: AGHT+IEJeLyW+u4ycTMqgYxs6NJLL3r5OO1XqbswJb79Eo8rI5BTivFIQk7F1kvNyi4zz8SC00zzcA==
X-Received: by 2002:a17:907:7f18:b0:ae9:cc51:40d6 with SMTP id a640c23a62f3a-af15433635amr357787766b.28.1753186481641;
        Tue, 22 Jul 2025 05:14:41 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2eb90sm858660266b.90.2025.07.22.05.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:14:41 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: i2c: exynos5: add samsung,exynos2200-hsi2c compatible
Date: Tue, 22 Jul 2025 15:14:34 +0300
Message-ID: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_051443_430220_D8D212DC 
X-CRM114-Status: UNSURE (   9.18  )
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

Add samsung,exynos2200-hsi2c compatible, reusing the autov9 support
since it's compatible with exynos2200's i2c controllers.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 8d47b290b..7ae8c7b1d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - google,gs101-hsi2c
+              - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
-- 
2.43.0


