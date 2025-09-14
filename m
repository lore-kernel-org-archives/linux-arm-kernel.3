Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5090CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpcddqPrYhRHRnLKWFJl0UXLOkAIbo7ClNO40SWmR1I=; b=fN0z0wi/sSaRyD8MF0Ju0YuH9f
	PUsnx6Fiw3RG9c5COKwzBWiIb4qnsgKI5wHsm4T2wigHDJIrP0MbNVxGM+X/+oU3YE6XTbCV4dbjY
	VxtFnbk2ZvH9mQ9S4oanUIjEhOH/6WbWr37MAh+SPbjGgOkggvM3wpQUEsc/s4MemZEbmDULCylf8
	bhXX9AUwNpvVK3aBoeXByvuhALTefyHo6w+KddFFn1Qcjm3fTIaHQarayblhkaNVkH45LsDXzDvkV
	n2k5nIMpktQtAxcwUDuJi0hiI2lD1Y5G+Qdhlbvh7pU4yObthmdVOTiQ8J1UsHXiESTFGZKF9kXgR
	Yf3YCqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmd8-00000001JMf-1GWR;
	Sun, 14 Sep 2025 13:18:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmd5-00000001JKv-3J0l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:18:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45dde353b47so20251775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757855934; x=1758460734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpcddqPrYhRHRnLKWFJl0UXLOkAIbo7ClNO40SWmR1I=;
        b=Nh9ig0Fs5sh0auBv63usnxzoaFXSvHbmRiNisAo95Uz0CvoaqCF+7qwSw//elid3rG
         W7WrXhUcFQvckZvvcO78QKupPyUem/iWCHLVs42/XQFjWygncM643ZNN0xtzll+0LDtZ
         1NLcnY6ln1NSM9JDtOmDQZ1XyWXGn0HM3bE6VhnDHUho0XqTVYEQuoKaZ7CKZDQvuuRl
         9mcot/KFK/QD5PMCzyCkQt3gXFLScDJAEuWJ0j6yS2cGr7AuY0FjgaUpVvDKYzA+eftI
         t8b0Flgcouj+4w/3xCQmDkXWQzDOK/Mj/FNHvJ/OguQ5IhVZLx9+u3eTAWyvCkHJsFh5
         7gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757855934; x=1758460734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpcddqPrYhRHRnLKWFJl0UXLOkAIbo7ClNO40SWmR1I=;
        b=RoITtQrlksLTVr9WNKBz3tBWoOqwz0XBcYzeppS71rMltH80g7NIJajRFbDdVZeMlr
         uOeUD3y//T+cYcVPEROCZuvGCyeM6cdhkTTEdjNrQQyKHMM8IvwJdPapni6k3y4hGt+P
         1TTWJEUKPnMpAqHn0glHomUYZofSzM6XMYNl9NaVMN3Mm3urwZtVSaFQ/PIXvCFgbamV
         Gbx3AbHRpTvkQFpcsNio9apjcBfJ1apEAjtXul/UAuQVcmQNGJx748fPD5WoByYP32xl
         cRAAcxfZD8ptlbMT67I0xdkyzEeOYhU3MUwDPTTuEaO6THo4KMGrwbnPh41TzUpzcD+E
         PGMA==
X-Forwarded-Encrypted: i=1; AJvYcCVR9RCTJmSysUcpeGHzg2xIu7Kk+RxtkcQ7u0TbRZdbvGbwGFH3Urla9sVjbRWECsnjukAf4S+3e7r55QYAW3lH@lists.infradead.org
X-Gm-Message-State: AOJu0YxMba2D2CQuKu6M4uYAyEVjVbnK1XGuyS3qf35sWsoIYDhAn5GO
	3JXpVMsVdc+gHqiajfa75t23QJO+e+qX06pIYXBbjU9UphziuJaqghzT
X-Gm-Gg: ASbGncszOHNHk7lI59pLU3C7xuFWS/6jbpzkHGwmtyFfgNOb/vc/YthctWybGNTYeCk
	CH9ZoQ+Nkq/XlyvRzVeR6iCQG9JFA8T+ovzvhmw6Otg7P0NHR/ZlLdLJD0Pw7HWx+lXVk4ZRPDF
	66bGLXetvpfnYAJsj1U3Au3NXj/hcq6w5nbQfreRlVpltOSXgf3yJtxCe/56mvYj/PTJG/H9In7
	LcX3+X6Vwxl8uTtSfS9HWs+KjqiN7OAFCZIVhVpTpU1QzARDABiDAnR11daP/wek+7SbJO7wGt9
	pYyBzR+T6wk6usPKDhE6eEsb5E4T91quSKEt6du2FpOhNQmgUms3U2apAeN7LdYMnc9hH4QWHo7
	x5HpNjJGmoHfhupYUNI94y3aEA2bBV7x9v0GfoNcs+vp7u+sz8RBYoQhmUFu3TEejfjHAgL+C1g
	==
X-Google-Smtp-Source: AGHT+IGAQ9494spxVybXeZcysph17sK0XNJ3EcpSw8C5tvKdn4tAgtOfyRpsT2ldfbY8hA09fnwBpg==
X-Received: by 2002:a05:600c:1c0b:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-45f212f9888mr83535235e9.18.1757855933631;
        Sun, 14 Sep 2025 06:18:53 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm133359875e9.21.2025.09.14.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:18:53 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for exynos8890
Date: Sun, 14 Sep 2025 16:18:48 +0300
Message-ID: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_061855_843827_71B91026 
X-CRM114-Status: GOOD (  10.37  )
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

Add samsung,exynos8890-dw-mshc-smu specific compatible to the bindings
documentation. Since Samsung, as usual, likes reusing devices from older
designs, use the samsung,exynos7-dw-mshc-smu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index e8bd49d46..27c4060f2 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -31,6 +31,7 @@ properties:
               - samsung,exynos5433-dw-mshc-smu
               - samsung,exynos7885-dw-mshc-smu
               - samsung,exynos850-dw-mshc-smu
+              - samsung,exynos8890-dw-mshc-smu
               - samsung,exynos8895-dw-mshc-smu
           - const: samsung,exynos7-dw-mshc-smu
 
-- 
2.43.0


