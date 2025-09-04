Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7925CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1TbylZkgz8Mkd/dwqE0/Jwk1LwcVvsjwyovQ8CGLbA=; b=XVWcutjG2lTbReZmJmm+d3lB9f
	4UWya1sctMimB8IYlSOgC8YenfGeQqtjfGlo3y+l6SO0Nqrxtsl8r7uZDwb7SNZ/mrXIJoMDh5Li+
	XE4+1QVeiPgbH4SXLtchzrDK4yObKInhl3q2hC17h+6xbgzASg8L1nq3LWc2GJIA5fHRsvLG6Z2eg
	JrOSdc5zcu+l0VXWgshePSVIpECcy/E3vVYAhuscNDJudrx1XTnk2AxUURICaJ7VDpfYj7xAqwZCC
	76m78Bd7eYwGZe2+f2lvN85sRiyqQybjxVA0PviYiISISySrPFXrYpChJUvBFfO0zlMKaa6nRWXDu
	1ffRI99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnq-0000000CuTN-2beI;
	Thu, 04 Sep 2025 16:27:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9vb-0000000BrCs-01zw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:23:04 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b0411b83aafso160205266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756992181; x=1757596981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1TbylZkgz8Mkd/dwqE0/Jwk1LwcVvsjwyovQ8CGLbA=;
        b=SZKz4brc49/YJHex+8uer7fwhgv9tR4bE9iJD8znCkpVyOCEADYILPw8g5eGWupw2C
         5ICQ4J0jV53jVhPN1MXfnYbaQznadF1OyMYNWuPqg0BhCyedw+oIhiqHOmpR7md8OdXW
         TyjoYbd/MMJGPLXXt2aVM17dLfJN7AVm/y27PhXQv9xTzWBKIxFflyT3L4gZ5eEUr/Eu
         sIqhTSJD/GX5eGdzG5O75fmpwgedTcCoJd3gC4ukcNnstlJu3aBfXWoxD2n47f1Tr5zI
         ZN0NVklNXzTi785MTFx/s47dqSvBcdy7dVfnu4AQGh1MeKKjM3trZnJGMy2dgbKjvRa/
         90gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992181; x=1757596981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1TbylZkgz8Mkd/dwqE0/Jwk1LwcVvsjwyovQ8CGLbA=;
        b=CHVLcYcx+i8Z4e8ymOL0IMFhWVgAdiFWT0M7KMVRmskca0t59lQYYdqAWZplcmoIKO
         YUag/2QOKlrdqKsbBGRT5T5FK/b+VJ2MGxSj1p6lfrviFlpxATivbYtMBOHkLmbwveSP
         KrFCJEY/2wEwA8FTMggQOl7E4ZaShwjxetxEJHysE6+mCkTMEjsWqsCfMjq5qf0pDR+x
         XNsM4PLwBlY7Ann+UcufIVCyKmk9/ARWftyJt3Xcf0Id5CKTjsU0UGgEdNp94IIIgbJZ
         3V0pZ+VJhyAk8qMsOgDT1FuiL187XyakyhNlD7JeSBOQ9lKT/PDZacxsADs+PN2hCBZy
         uh+g==
X-Forwarded-Encrypted: i=1; AJvYcCWB6hKKju0reRMVX8IsMy7qX/TdWJkUyA8+QtEpot5dX1dbYxDTcS3E9ThsIiG1+O26cuyefHYa2wKynza/M0h9@lists.infradead.org
X-Gm-Message-State: AOJu0YwSypOz8xPchzbSjX5cP3GUmq4O+EbRt7ZTt/GgFYfab+SPhYw5
	LurXgaFnmUyKWEgvhcZ+YtVqMOKP85L4p8VHunhe1RY9Re9tHZK7rGsT
X-Gm-Gg: ASbGncvYcHBbiFOCzK8z2paDB74Xh7gRnBOzooZKIPdHYvicfjHPmvhu4hKYu+yiooq
	Nu8D/m83nUfw7MMlDyDgPDhfFrNvJMJev3pEGB9fi9nVT7Ix9n9mknWCHdBnLTaDnMA3Q9M6kk/
	ssYnvZtcJ/ReMJDl1XmkSzRiU85EgfnLfGqiKF/2tnymqFXQsqnPFuPJwCAHT+gKycTOihWDU7S
	q8LxgFdnSXR+kcAFg99vcoju/+VzzQyaJv/iGbTysOKnqHy4rXD0Fd+DE7K36Sr4HtymOw7JXuh
	DcN4s1spGkOuEl6F/G4XtLaXIoaeqqQIrRYA7Y0gMO9G65j/DyuWj7OfXP4xrr65Q1rHC/C58FD
	t1os+oqLBbIgmwvvWQ719W46Skfmx+cvedwDrqHM3PnLpiHtSxNe/GJGo0yv2EOjEeJlQyQpyYP
	XCOf/fGQ==
X-Google-Smtp-Source: AGHT+IFsHDPw3fDw7XllG3WW2ZlGn/8p4gGWD+NcAtVtnkOeIC8iERIkVgfcdB5iX6oKNeHXenMzdQ==
X-Received: by 2002:a17:907:7245:b0:b04:76ed:3ff5 with SMTP id a640c23a62f3a-b0476ed442bmr448933966b.40.1756992181086;
        Thu, 04 Sep 2025 06:23:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046d0b0135sm372121966b.73.2025.09.04.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:23:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
Date: Thu,  4 Sep 2025 15:22:28 +0200
Message-ID: <20250904132240.36819-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904132240.36819-1-stefano.radaelli21@gmail.com>
References: <20250904132240.36819-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062303_048692_0AE78132 
X-CRM114-Status: UNSURE (   8.95  )
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

Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - Added Acked-by
v3:
 - Change compatible string to match existing mainline format
v2:
 - Add symphony carrier board compatible

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa438..1cdb6464e920 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -106,6 +106,12 @@ properties:
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62p-symphony
+          - const: variscite,var-som-am62p
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.43.0


