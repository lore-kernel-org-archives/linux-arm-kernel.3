Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873CDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wciJYnr73z5wvVJef6M1YVVBFJceLq6/8hy8xOSw9Uw=; b=DCRzJsWLcwmKXFlx1qFaTsISNI
	hzw7niDi9R47S4UY/w5Uc62tkmzUhC35YOZN0cGjoCJQFnCdqDrr9Li2P555MFo5r5Rbvbv0rka4X
	m71b/fr63JrAAJTNQFA7jzNDSi46lLW8Ekn9w2Pr/UgJ9+oMhTa29fDSQU/gg91Wqs9IAGTu0EEsM
	F9s2DdrXizm8bw84geGM6eiQCVADFu9O4JI+EUfeXVb2YaxiLAHyg/qeAbgdMGvVIoZXqsba2lPpb
	mh1kZJE/+eL6Tf8zrBv7pFx0vYgQRPrarsTIeAW9DjWAjiYqkS2Zm/pSHBE9Gawi8X9jBAs01FUu/
	2LqTL8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMOQ-00000009CZr-2ils;
	Wed, 12 Feb 2025 23:43:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMLe-00000009Bzb-1fDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:40:55 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f78b1fb7dso3385185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 15:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739403653; x=1740008453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wciJYnr73z5wvVJef6M1YVVBFJceLq6/8hy8xOSw9Uw=;
        b=BDYai6C6dQ630k14ql9LdEMn2sF5C/Ce69H9ERnDk87hbvVEGI/VtKTusTZPasVXoM
         Nc0ap98jhD/qfMN64tssKEPJu72y9zxv5CV0R4slW9siwMbUJ/3/C2g7ZNyB42xh33qO
         MhIzD0CjOoVnxS5BRV6mZLf7P5NU8JfdNA/Ea1e6N9hRmGfyh/FtmrDGEOfo3pU9WZpx
         pQ9SP9vffQNbjvywPHzCODckBod7Cpu+bbcSGLlyNQHoWTXy+1O8gz0VSC9Xwsq7tcjY
         iPyDY5/jSnT8QSLroAmTUubE11bScxhZaT0lxS64i54qHlfx//uB2mUNkdk0xT+hYEQO
         QNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739403653; x=1740008453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wciJYnr73z5wvVJef6M1YVVBFJceLq6/8hy8xOSw9Uw=;
        b=mIB24znnUQhLFZh3SoZP/QTbgExn37Q0OJfYp9JhLsIAgVO1Nk/aG/WS/seY9Sm4Vp
         XtFdlqKzoxZMonZwdV3qMl0S3kPODWG3h7krlK26P6s3JcG1dRIxhHtqDIlA4ogE1Kxq
         bDMzxs0mlQ94JYTEJ3YosCEih4vqGlU1hIN7V2+WxtUcKeZsjX9QhJrfpKNRuMR8MTY/
         Ra2JgLPauJ7iyUvgqnL5Je9BPp3Nx8GI0NylN/vEoLqgAIvwTulcnOajCABvrAgEoslN
         /JpqNQumWrmb5h3lyqiZs3fDhsFPedy63TU+QzI52kqoQM2Ny9J55Sp0Zs9+EUGbRvB7
         ffHg==
X-Forwarded-Encrypted: i=1; AJvYcCUcbZcbsqlcdLph8uO/jHGJBsAF019FiZMPcPjLcFYQcK96QsOpgMDycCIsdjxjVZjn7Wlxe5KfgwZ+AdtT0F9l@lists.infradead.org
X-Gm-Message-State: AOJu0YzaXlnKK74sXb6aB2BdeWuDPwlQQTj2ZeozzB6zGVAlgZPNvkDS
	zvewJ1+AVgRAeP6FhH42rh+wupiDib0DxNB0Ny+9RpJBR6HyxKuh
X-Gm-Gg: ASbGncv/TKHEO9LSi/fU03KIV5i6qfQ1PPEM0uxnqCaEC0wE6OLaLnKZzDQyyKKfpAZ
	ffT3dLrqAv8A0v0/XFB3XvGMj4bcL70hYAJreJ+Ng77pbJqT8JP5WccXpv+aCCaDpxoVUueMcm2
	Ovn6bbr1QIIMkaq0y0K1xigkeQQn7Hpb/AJqXxBVV8/vvyEca+ffgRYeyMOd8MjVvKjJQ5U2N8o
	YK1D2H0e29RSZp5Qixa4jAZeys12OH4f3bx1ZA27oXzimwqLt4S8UqmhOTkpxfkg9K5DPLU0sMj
	O+zBl07YAiXcXyJADu5h7eEpuyMLwHQsJKxes55urU9RpoYxk8TClAcuakXt5KBdYsN+0qGhjHU
	3bw==
X-Google-Smtp-Source: AGHT+IEBbMGuIkaDTqoOxBGRTGuBbS9VbBd2kajgnwpjR9QNqDwY2rDkejN/mIMWNeUS+8/hnW4ytg==
X-Received: by 2002:a17:902:e850:b0:220:c2a8:6fbc with SMTP id d9443c01a7336-220c2a87656mr60192165ad.34.1739403653473;
        Wed, 12 Feb 2025 15:40:53 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d021sm964155ad.157.2025.02.12.15.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:40:53 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: samsung: usi: add exynos990-usi compatible
Date: Wed, 12 Feb 2025 23:40:32 +0000
Message-Id: <20250212234034.284-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212234034.284-1-wachiturroxd150@gmail.com>
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_154054_435396_FE97CF6A 
X-CRM114-Status: UNSURE (   9.11  )
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

Add samsung,exynos990-usi dedicated compatible for
representing USI of Exynos990.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index f711e23c0..29786b780 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - google,gs101-usi
+              - samsung,exynos990-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.48.1


