Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB30C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8MiJZaTLkXXn5poCl8egUQZo+oj0wsGgvhPlEKD64U=; b=gZMcMcK3PxPh0P8PpYYDVBL9b9
	n2pWvbczLGg1sgMS4dS6b4uI13JqlkV9Qj0a5r/RUilkBewQBfMr5rUpWEaTUPHz+rnuGA5KfujZA
	UH8TVwwdZ+xN7otYLQLnFEPZjwWWR7emYRuADrfe50WQ817+510gvjP8fymGUNCoNMxMY/uVeSJ2y
	qN2vsU6LJwEm9jcioi4sgXf4FAKYLd4oQ6sCe65F89DeXAEXmXCy72CoGAKSK5VNxJWAalmwBwikw
	qKUudYTyqj61233RR+2YfLYtpT15KaJkAEGeug5GOF52EUByQVZMskX6myROkF1i1+Wh0uPRLG71B
	QTduHWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMET-00000003TwR-0FSa;
	Fri, 09 May 2025 11:49:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLX0-00000003NEX-3S4k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:04:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso13151995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788681; x=1747393481; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8MiJZaTLkXXn5poCl8egUQZo+oj0wsGgvhPlEKD64U=;
        b=At4363az0or15gEU2qTAzBUCeJTPdFKazHMoSixOcGIH9f+8OQ3ey6hWXHvtMXhGFe
         yaDdL65AyuNZmXVcXJsOGQO5FTKFzYa1955qohig/WxtG1RhO/ju0+PSLxyz3c7onXoo
         mAICErPIBbVzgU9oLzi/Mx1u6TMCs37/HzI9sVc0o73JwWB8W2FdrOk5IWfhvIrULZ5w
         b1L7FTXAFZOFGwJB3R7kivNl7cczFOcNKlpTfYAAcfpOOVQldc3zumnlQzwlFHjtQqHk
         3LHrcmGQB736UbkkOXgI28400gdnvyUIkVyOOnUzglIsfa5zt3SrzP5d0PqXqkyvS5Aa
         DVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788681; x=1747393481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8MiJZaTLkXXn5poCl8egUQZo+oj0wsGgvhPlEKD64U=;
        b=SvdVL//p8h2ETTipcqPAeUB8g088Xa4djRbEbasYBWAEgc4Dg8IrpzFXbBDxzZne0G
         myN0VMCAnOhg6T4X67wnUccK9wbhAJzEovKgoyBLuEx0kAXHQ/xk+rYrCxxaWfeSZxjN
         T89nBQ+NljSHwWvt/NFO2VOhpV/QVfhRj0HOAM4um5wCzbhteEjsErgNwerR4uF/K352
         XtQoxmr5OzwRZh/rtLXEplh9E3JEc8ekndV2EZ9Xb4/dBDihcVHTAF2WfDvk7Nh9QFbe
         Cej2zzSRlfG/HE3Z+6ykbN1Jvu5wgXmV95fyeN/87kydIFY1GD3HpvOtwcpqYrTiZFNE
         28sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZoD/7LITPwUJHpuD5BM77up3P8ucGbx0H/EdhOKy4GxSHVbiRfsIi1hvkG87t0OCWrezJ0sUXjSU3Lq36fdjy@lists.infradead.org
X-Gm-Message-State: AOJu0YxmmgfiO2eMC/I4EfagYXL9B9mspucy322I5NDpOqd9wp8y09mW
	+B4FsEb8zLgwQGGda0q6Wq7uv/J4ma4HG8sdM34X04v/KfF9JV0DzEu9gNgWvUg=
X-Gm-Gg: ASbGnctHWaLRyR7o7gVefvsnxtyeX/kwPiao17YRB1aSylfbKeNm1IWdFdZEyglsyjB
	ine7Y/O4pZGLt/ckbp8lrkpK/RKWyBNVldqVoae871Y6ZnLbP61I7rgIqROLQ5p3m+c3uO+96ke
	sjgpnz2IN0jRE5/KOAuze6A10TPm3WrL1x0VQUOX1wQjj9GUaP3I5WuZy/VR1puNVQG13cOjcsH
	kK3sosVlOCbdO1wJNMWBAbcbUpdR7Y6ByxDxLvy9xp1Bn6hhElnrvJOkPyYVUBWYIK+KM4EscVb
	6Rt1r50HgqeW4JzMzCNbd8npEmAmeHgCvRWE4aMbKbC1kQ==
X-Google-Smtp-Source: AGHT+IH8/NzuhQIHAiiCvtk5klNpsdsTuvJWt/oDUURnYu6Ufz/YNp+rlGVB1mscySmEvgSO0iuJ/Q==
X-Received: by 2002:a05:600c:3ac9:b0:441:bf4e:89c8 with SMTP id 5b1f17b1804b1-442d6d18cc5mr21966385e9.3.1746788681116;
        Fri, 09 May 2025 04:04:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d687bdcbsm26022585e9.40.2025.05.09.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:04:40 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
Message-ID: <a1645f1eedaa9b2ae62ac07feed0552eea75bc46.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040442_857755_0E00AB37 
X-CRM114-Status: GOOD (  14.44  )
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

The platform_get_resource_byname() function returns NULL on error.  It
doesn't return error pointers.  Update the check to match.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/stm32_omm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index fa0f75e4a6e8..c8de785401f2 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -320,8 +320,8 @@ static int stm32_omm_probe(struct platform_device *pdev)
 		return PTR_ERR(omm->io_base);
 
 	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
-	if (IS_ERR(omm->mm_res))
-		return PTR_ERR(omm->mm_res);
+	if (!omm->mm_res)
+		return -ENODEV;
 
 	/* check child's access */
 	for_each_child_of_node_scoped(dev->of_node, child) {
-- 
2.47.2


