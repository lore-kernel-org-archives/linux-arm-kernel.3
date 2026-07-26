Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F0BC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=; b=Xq49xJeI4/K8+eJG5EJuHGCenT
	tDwG3SUH40VypngUlnPH7acKzZx46KpFVTdKcnHOw47QWL4hhz90EBuHlHjDA9LhMsY/PFXcyW7kE
	0qa/OXD4y3pSpqmwrRMHfUMs2okwpcTqp15G8rGQPhk/CTH/Lxct2j+pM+4NsLalbcmtT7CCw8TfA
	IPKGt8wWkqyEYDDQhtK+N3aIuIWMgRBYJxOfmn8l01RvfG458LZtT99yjnKX5Cjwz9dgtGQ51uTNh
	JjF+FzM7AvTHBtP96GZVJMG1MiEPXZIy6/0gMM3yUtTCZdzGKzb67K0e7Be8kBnHs5tkhJp7PE0+p
	EuZba+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HU-00000001Zz9-3ChR;
	Sun, 26 Jul 2026 20:17:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HM-00000001ZvF-10Oj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:16:57 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-472326ca506so1324456f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097014; x=1785701814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=WW2B9GpT9mwzhWSLLmmnRdlISkdxB0l/IKCjHNUtenkkE49afgHI4MxI+SR2qSdnKO
         tjZcQOBz/1VAl4Y0q67bxvvYmdksqzeeK6SbIKuXrOwOjFqd4foR9Zl9rikSIvHrid3j
         MptD9djZ7en3lZG/+GW+arcMcvctfMQCPcrvtpxIFZ4YeqdLn+9wpsGRbBzxLB1e/Q02
         mgagg2hKckXLxRLqdMrPPs+PxRTl5IilbwAk0dQLjMH1MhI82CmezEhJYO5XFZIGmbLe
         PaFb46or2vYQjtO2UFR1MrsXCfX9LYEvwTKNTv/vqAsVIIedQ/7JBobo/ajx8+jNpFsk
         f5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097014; x=1785701814;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=sFpYcHlNjFOnMKZY5sdRjhD6fhfqySk4OeTwiSemKoDpgixQCvUk3LE5h631bxK2uc
         f+NGme/bHDRXD+Eyp/msO1awbwOEBVofAtVS8lors6cDMhX6w1foO/plrFoNg8SaWVXe
         1TqCXobm3TTfrCy1wUdnwD/K0Q/3U0230m4eOC6RQ/gaj9YnDfnfGHQSY1d+TOa9yFzn
         gG8K1/nLo8zMxPP+BJalT5DxclgJA6tValvjO+pRCnwk/ZsAB7GT8Nr2ynorhRT1Sgpx
         iJFsyQBO2R39LoBPUilc3s/CuA//MoyxRoZ9L4DEUeRqfGYe5foKxncu9a+fOg4gWJLk
         lKOw==
X-Forwarded-Encrypted: i=1; AHgh+RrSzsSDDe1sv/aNaJ3+VQrDlFbunmlAnDL7camqQxhgtECWPZM6IouiD9ENwDOWnIbVecvWunvGDVx/5lChavmN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9cZUSaPT62TEbnjn0TvtXphEuWrzq2MUgPpSOxxoXvyyxeesr
	811lTOi3JS3JWuJx3EZJQXhQi+Jb5m9y1aCHnnw1mms4BKW1f2Czsg8p
X-Gm-Gg: AR+sD11CdICHLJ/XfB7nAJAjrTPmUJ+jR4+fkeJuZmSaNuFQpGsjw6Tx0IHijxVSY7F
	t4bPgx9l6d8/R8bheKTFHc4JKPqPcuuRPLHqqOrr2I7Pz1jxH97RcxBBUtjYWdeWHoVEg1BeZG1
	QwCVtEKFlAjJcUuCfdRqhWw5YQ0AS7re9kJEQaBuFTvn/y+eVBTrqTSLHZXyOONCWkIt33H1MH0
	tu+YwFW/9ab451GOjtbDwiquKckoGV7opRkiDtOSVQ+MQc8UYrrF82lDwi1jiHM57nKScytO2tF
	w3at5UGqJO1LI27N4MWTW9t2iMYGAQisluNFvYIatZ9TQ7Xf+O85w8fdKfLG46fC8EV4h4nPeAB
	XKiG5UqCvGdyZ52RgbbQQXgverneGsTWMwuKhEyLYWjaQ+/XKz53e8NicUzqEVbJcgy0igJX26W
	ndcSdMUVwYcpSq5ZsoxbgoZuJ5HwHg1rgJssaYCg==
X-Received: by 2002:a05:6000:22c7:b0:47f:9022:8531 with SMTP id ffacd0b85a97d-47f9fc942afmr7506796f8f.22.1785097014274;
        Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:53 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Sun, 26 Jul 2026 22:16:45 +0200
Message-ID: <20260726201647.264108-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_131656_285544_A63DC388 
X-CRM114-Status: UNSURE (   8.96  )
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
Reply-To: robazza.alberto@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


