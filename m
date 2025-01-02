Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C4FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBnqxBdA04NC/VPNVOL2IprXPii/fgtDRyZ/Qqd6qg4=; b=c1c0bYV7Yg4evN7In6SjeI/baS
	4MFdq+1av/7KHwdoN29KhN5CfBcn4/vG2h6b8IVgtKB7wmrQ36S/b0zib2MM8wq6h0Hbz6sW41+5D
	6QqWP269pHbgRuGNF3PE66GW7vD5ugIVROHJ+3FaLopkfxsYoXpFjhahGRySBmResMKfL4a5izbsU
	AniKi1RpTg35wpq/ivEFnfrtdhJqERUYja9BJzN91isupx7HaEH66rpeavJuNKApK90VwR3q5Mp0H
	U8XE58eKH0KG9Lj0Y8BYsDysZcM7xImBPS8vldbMRtK43L73SM8pPBSUTmblrh8wFyOdIIm2/VQ6F
	mmUaQBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSJx-0000000BSQY-1juz;
	Thu, 02 Jan 2025 21:01:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSHW-0000000BRpF-30dU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:59:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so19754459a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735851541; x=1736456341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBnqxBdA04NC/VPNVOL2IprXPii/fgtDRyZ/Qqd6qg4=;
        b=EkTUVNC+LKyg+2aVR0cD4rPZ/RYwwpHUZLyktzmgnpgWUqMonXHnkGxdLXgWqSA8pt
         /IGs3GaPvG9TPuNm4uTxcfz/LYJ551rurAD1lFPad00MRh5udGxyn0Uv5nAQIipatRSQ
         Asl99lXpZz9Bm9HAgbH0rHHHY9eX4izrH7ToYmfO9pvY71SZN5SLAQ/t6gzyZsGbTw8l
         z3PyVwOzLvPZl3vm7oJTxDA+xZVVbosLMR74GshGWHWr9OSGUF4ZlNYLjpA6HoQBDbQX
         KhzXUi6jYPsV++cZgmYbG9WYp/pyAVrrtkb96oxGO+/9xdaKs8qBWn1fkm3h1iVJTSGI
         vCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735851541; x=1736456341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBnqxBdA04NC/VPNVOL2IprXPii/fgtDRyZ/Qqd6qg4=;
        b=NaheYq3BY+Na+7nW/IuL3EywDP5mGiYhIMbOIOa9XmYUXPjUCclLIhl16HalFufumS
         wGPyk6lSo2UeW6/4X9DNJf3SBCAOPuUI7ja8UsTHikVO94t3XiWJa60gXV9fkdTvnE7/
         pCh7X7ENEgHIKQw4jkUFs7gUkNd9R6fNVnDNNx1dCky8DkkHOULYLlsg+KCNjESsR6tw
         T8UxfUyysNYNisouapWVf46gWWnfoLRUOVQFJ/NFUtN8qEcYICt3lJd0xGVdjs15+ocG
         iai3OEcJ8TBggpSReDem26undEWTGyX9WKGDmoLR56ehwIEsriyGyYmRHlBjEgHGVmfo
         hlXA==
X-Forwarded-Encrypted: i=1; AJvYcCWU8mvbVSIbSwW9vc8xXSV0Kd53vYslpZbwLwG00nzhMlWLm8sqtgjzV4B2Avb1V+UOGx0AECupI9Ao7f9Vebq2@lists.infradead.org
X-Gm-Message-State: AOJu0YzsEy07E5VXBaZII+Nq2ZPoqSmL5FqOIFVDMRAI3Zk4qg9YsgwT
	PIK3kvfv6Pupsmr55+uLK/YyNQb24mprVkUvkDi1xfrK+tVP0TUj
X-Gm-Gg: ASbGnctZxlSpmHFKlhgaSfcKAqJI11AQpjlOuBiMqAUSYpFkRnq1h+Hr98SOX/46JlS
	+YelkikmgvLZjAxWm129gv3hE2KDDgQMtVQ3rYbExrf267FBCSCNgmFIrjDCeBkPCdTn8n9CO0d
	W2ZvBJq9d7oXw16ufXFVJzjPn9DTc7OvOYcWrfCo7DDdC4jhp9b95JKUcTMojmtMX9ecmAiO1CW
	yqZmDlkrbqNUqApAKqfRx1IYT+mIi5EgB2q3MiVErUn2T2DAozX5Uq3oKx7WEGl0kibYV3pYEvx
	wQBxToBuUM0=
X-Google-Smtp-Source: AGHT+IF3MmqnoF7IbEFavv53iFCaciUlpugsImCEl91cDLF+CSq63GBmgDJVIz4qbLmGReThikaRNw==
X-Received: by 2002:a05:6402:34ca:b0:5d2:d72a:77e4 with SMTP id 4fb4d7f45d1cf-5d81de38bd2mr49286444a12.28.1735851540889;
        Thu, 02 Jan 2025 12:59:00 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f397sm19231026a12.22.2025.01.02.12.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:59:00 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for exynos8895
Date: Thu,  2 Jan 2025 22:58:42 +0200
Message-ID: <20250102205846.223955-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_125902_755764_4D396C33 
X-CRM114-Status: GOOD (  11.21  )
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

Add samsung,exynos8895-dw-mshc-smu specific compatible to the bindings
documentation. Since Samsung, as usual, likes reusing devices from older
designs, use the samsung,exynos7-dw-mshc-smu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index 5fe65795f..ef2d1d7c9 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -29,6 +29,7 @@ properties:
               - samsung,exynos5433-dw-mshc-smu
               - samsung,exynos7885-dw-mshc-smu
               - samsung,exynos850-dw-mshc-smu
+              - samsung,exynos8895-dw-mshc-smu
           - const: samsung,exynos7-dw-mshc-smu
 
   reg:
-- 
2.43.0


