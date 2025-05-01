Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0639C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=; b=c5yuwC8WbOuZd0dvIm2Ph6rYR/
	BwAQOw53GP4Xhwop19zUFcU5ri+awnhpcBefMXJubfKTlSstQgNZ8G9TdK3qx7Lx3EBUW0Xo9jfDK
	fYUBhAvjdon+sJ7PbdpR/eTps73ckD8ax/4hBNl1wuzgGN/KUZj2qTvTwf3viSXXYs8k2hcffdOc0
	V+/YexTsrDCAGznNCCUM0p7eN40oaO+6KlgZFYjaouLHi37CE0L2VzZUK2fLCa4DswsdPF3q8Y/2p
	wfqI2xRMzCepJ7mRlGe9gqn9Vn/M92Dd1RDpVBLuATi/yyWyaBQG17wPjo6C/XWGfflkRE2znTRxz
	wCVy5fog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAX20-0000000GD6A-154t;
	Thu, 01 May 2025 16:45:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWuY-0000000GBxI-340c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:37:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so1546825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117441; x=1746722241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=;
        b=VUPt7GWVZQnpLigTK59TDhxzh6pnvxh9hGxVuNFkKoEW3nXWdUkoz1P76eq7B54Vyx
         itC61uJydcEmnyXqoWkBS9P8rsKpy/lClKzhPuJfjBueZGgZwYZv+x9nj2X1esBVi0da
         dDNL6H2dGveYtKYP1pfAgaZRtfoX68S6N94Ppzgtet1ie9N6ewU+pZnXCtY16k4EKsTy
         /IAz0GwUL2zUHgGydb/qXeQ0GAnp3jkulv+fv/WFf/3HSer61dd1C6OqwKpfkqrnMXOs
         aMAgLI4Lk16aEfujAsoQhvYqhOKsmo1v+nGwJKsNf7RA4ZKRA8FB4wUTIEjQ+WVyf7yu
         F64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117441; x=1746722241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=;
        b=xCMez1qxX0VGRWxXWmDGixZFekntPygYf+FWaF/+E9a19U+sbg9TR/hh6wLl7e3jAT
         oY84PdbT9aluRgGwZKi4IcDG04lR3rv3xsGdQWi5ctCqn+MY1Fz2IcNTGGWLqJ23lRqt
         0bAzST4sDX37o2+mdbuykQ174dReeDDOtb4bjm4BLYBN5pxMKfwpJOvodLrDv44cZAcJ
         BG6RcfiRVAtS6seig5YjpqyrSmHL/Ne2jXIlY5MFfvjacscpLt6kEM43FKm69a7gmeTc
         EghdaVfbAt3Aq835oUPvKpZnSa4JC75fQgW1CggUpW2FAkLVBGbmB7EyhQWqQ0gulT/Z
         hHPw==
X-Forwarded-Encrypted: i=1; AJvYcCWLuYl3FEuL504F77+VxtEOKbjy5g3Vsi4mbSjKso4YjTNhDosyRYhM28DT0CrsUq/dC8DZDLuRplBC3BOvQZjf@lists.infradead.org
X-Gm-Message-State: AOJu0YwOAVdk/hQ+fXk+NS5+QvUy6Jkq5CX6mofTqb249EcETZsT6OjG
	UCmZZ/1SR8NYrgcaIMfdZXKGQtZzqR+o033lvTJZAURyQ5jkbCXPYT0Wv4UXPYY=
X-Gm-Gg: ASbGnctSICamL62XsHhpUKBiacm606wYFxx03go0QTcwGO4TSUd874V2X33OR6IjrM9
	LgqcvddIUWCTQ99PmBIRMufgKZGVWuiPbBUMVdR783aYH8gSeSPi7nOlLDeZNjwmaVwRRTXO1ml
	qnW4Uxf0E6SKh58Cybi89svqXrslLwKvBTrOOptmM5JanWD1ZhueSWlZTZqC00eRljLIeq5JDzo
	RSdaQ5bDrEOiJo6Gvea8WsHKbSUVdfIRZ/IRAdzGphTbg6mF6KAcLnE1GtJnhOtTvK5PwjsB4+/
	exKTt9bLFL0c+DtlZrMplNDMaJXQ0EkeV/Wp7U5A6BFF4FLLqUL4GdPEbALqy4cnRlvANg==
X-Google-Smtp-Source: AGHT+IFZ4wq/YC5Z8Q1DORspcfBal0TXZZSb4qQ5i2LX5qoWo7ODXYSBY0H6naDeevzu7XX1zCwGJA==
X-Received: by 2002:a05:600c:8712:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-441b2c6fe2cmr22011025e9.1.1746117441032;
        Thu, 01 May 2025 09:37:21 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 18:36:57 +0200
Subject: [PATCH RESEND v2 3/3] iommu: mtk_iommu_v1: Simplify by dropping
 local 'mtk_mapping' variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-syscon-phandle-args-iommu-v2-3-5a3cab296972@linaro.org>
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=br7GZJo/Y+jEEdWoRzjynfLSYE2qWMF71yGrpCFWlfM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M4CJameWdIEbaKrhQD0ut81+1BXWRWUnwFO
 97Wgb7lxumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjOAAKCRDBN2bmhouD
 14SOD/45uy0MY8VGk4ZvKE/H0R7CNE2ft3oLP9XOQRzm6XJHx2Z9QXmTT/RSuKn7rZ+bMTOw+Ir
 GPQ0iGcxYbbvzawOd5YGQVIPk0Zb1+shoVoyBFJqmuoRll36W3jRmfIN3GL0YaUjZhpnA1jcZAy
 TTuqnfYHXInALgDOecbSNWc79Uy8+ClQ3E4L+KOy4pdGjft7nSX7JXTtTXy37QxGkhpekH0JM5e
 Ny0iwkeJTtgXi7Exa1K2spOHRlROyoBC4SbhIwSnR1ht7QkzuV/dDELMLU+rjhbANXDRvhLD3Vu
 jzqfOzDuiChfqmVO8WAS80b7a7MORPmXVhl/foe3JeyXchF2/AdA0IG31LiCwkryPkD2k75l3rn
 CEazjbiTy4jsN8ZLcGWs8/1s6FpePznAdTmg4Xwg85K+Un2AibmOI8+XJXVQYQflmXwe2cvAcxq
 dYBhTZwXoJ+HdUEjmJpq+DC1veARGn0blUPddRTXMqveUNQP6ieZY53tCYDKJH3dsXH3cU+rmSn
 2touTUB0YumibIzZdFmfF4BKTwSMHWDE0A4ZrLuaeQ2PdEdjI39x0BCE2NLbYI+Ra1JtWEZ7mgq
 vVTfWQER71C4Hc8d4JZLENH1I4xL8uQFlnxuZ0maHo0+4z4H03ObcnJNhOE7y1NWCKkOEVpBT7F
 DmneETwpwZMjFiw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_093722_765348_6083CF18 
X-CRM114-Status: GOOD (  13.23  )
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

Storing 'data->mapping' in local variable in
mtk_iommu_v1_probe_finalize() does not make the code easier to read.
Use the 'data->mapping' directly.

ARM64 W=1 builds also complain with:

  mtk_iommu_v1.c:512:28: error: variable 'mtk_mapping' set but not used [-Werror,-Wunused-but-set-variable]

but this is not being fixed here and 'data' still won't be used in such
compile test.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Old warning is change now to:

  error: variable 'data' set but not used [-Werror,-Wunused-but-set-variable]
---
 drivers/iommu/mtk_iommu_v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 66824982e05fbfdda224276ad41b90f9d5f9ca4e..bbe3e9d901c69ac6405d9549a4481fc80f1adb80 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -509,14 +509,12 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 
 static void mtk_iommu_v1_probe_finalize(struct device *dev)
 {
-	struct dma_iommu_mapping *mtk_mapping;
 	struct mtk_iommu_v1_data *data;
 	int err;
 
 	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
 
-	err = arm_iommu_attach_device(dev, mtk_mapping);
+	err = arm_iommu_attach_device(dev, data->mapping);
 	if (err)
 		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }

-- 
2.45.2


