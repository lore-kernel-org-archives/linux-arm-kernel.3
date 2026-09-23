Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735C3C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=; b=LYw3hMRuKu6BD6YkNO6/Onry/D
	QzIiycApLD9GmnlwOjJBkzkZfGTzkX6m+g3ET0gQph8ybypKn7JBGNwIi2d+meVZWLM04I3ZWJ8wt
	e1H3XYx40UOZ4OXIQBZ8+6vxICO+fkKv+Jcqp6W63b5Ya2dk8C32t1MpdhFWHnhjRxXqJ1HKWx7zz
	xBdDnjE5YgR4agVT2PdN/FmHFhk4DztDkgNgFQ8uFAxXsEUY3WcitskBG8ApB26vaE9fthzji5Yea
	YG6BEIE5dCjHeYlyPvkB6W7Df+6k8yotq+wEYL6NL2tWzeP9SrVQdxyvIyo1VPDYBP/cxBN3vZwj4
	8VJfL0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TVI-00000009S5R-38Jd;
	Wed, 23 Sep 2026 20:23:44 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUp-00000009Rsp-0ztM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:23:16 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb470so205465766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194993; x=1790799793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=EYhULvEJtTncIXkCLq1C4VfgaCS3LjAdkszc20oVMlpBIwP237qYnF31Cqf01cHQm6
         CsHecDIUVfGl0b1vrnQs6eyleMq0eonJ+YJZN0pZAlfabePsOnaRw4YBOWSt0cgRF78c
         QzbfhxP2M6eFjUyTn9OeMnrMNX8z6zHIDVT2aYjQOCbJnc+fZHcgi+1nxANqQcvEjtZu
         HyZHoEjYSlUWd4jigNcFRKbbht4IrroeefWgxBonAo5OTHxr34rabWG2KzzYF2yHqHyV
         2pGGsrs0MsyIjdl8N+AAA9RpMJMSZgT7VRFxhgSYoT+D9OCVIQIpYWdIOwe51+czCsYy
         WZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194993; x=1790799793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=r6zMZ9E1yfwBbaxqBQeTsMiFGH4oI51uepED/5xqNyYwFy9W8rp57h5X1dQDfFcSN2
         urO2MJ4a0911dloO65kd7fUtfs//GPk0nFQYfcG8dCuAJ4kVgEePiqadEbHr8R8dvuio
         8Jtf7uloqQnUI6Aj3Ta32BQuWrwJq+3YESKC7tjLtCS03+UNIxUvib0RODHKQjN6RIuW
         m1iQ9YsEeCidbJCumWyhuhSJLdsD+bTbg5HGjUI42gruJmtqvDXwiFm0YqgCUw1eT7SV
         a7UDvyKfCaFNbNx7hf8EEEOsucEpGY610qcObSotVxUix8utLT3Y+2p/lMvsl0SE4flS
         8CBA==
X-Forwarded-Encrypted: i=1; AKwUvBwf62JJGGnh88/yExeloucMBQr3r0BiwC6L/ZkpTFc+MiAwM6RaO+hiPn7ZAF2H9xj0vxldrZ9DcL4RZbMDvWax@lists.infradead.org
X-Gm-Message-State: AFuF++l/GVt5qZF0VBxRR9PHNrWGDt+WXwSWpvcgh3IjBcR5BZhACij6
	LoDeo0NU/1iEVVmbfZV2KtCJ6Cr82cFkveX7bmHOvCPXAt+Ipva8Ezsj
X-Gm-Gg: AYBFou3bpRkwDo7aOWDCzPqKyrD3HvnfNyw+5hjoeU0Rk+N2egwwZ5B/AoiXWdAwysx
	j64HtPiV5Nju3PSWrLn22hlBydgW0J+H699WQaISTJ4X4caU3GDP8kyPvAaVjLaRqQiUfpIWBwO
	3z2Q7WmfpHvEJ/BqmuIHRdfZg+XreXa9V9ad7ABGY/h1ISa3saBcoa/OPqPdVYzwYFDwN6NOeQ6
	Yqsk9gHZ/zCIgIXVLq06Us5esLuhD10dzeS6KgjDLUfpZtcg9eEusfrBflD495IQoOQeB3L+s1v
	5auZIS9J6schb+N+gdCXQIcvJfAMsCR/8klJyi6qlttGL+dBrbQ89CWC5ZeAorVz9SEFH1MgIQN
	lnZh1nngEDA2KcV74bfGTItz1/jvoyFn8ndALhYZtAz5YOH1F6508AIS/RiRMmR5IRssC1YUk7U
	f0K5/1wOeeGwPWy6wKEYv0Nh5nU/hJZ52cbG3CuvVyJKKV3AxVXqB9PTSLLYNHdaShrT2BSP0Tp
	wlTqD9jUAHvySpZzD0A2RUmgx1pqVYSQBZ2EIsmD8M=
X-Received: by 2002:a17:907:7b89:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c2ac1f0c09cmr29718266b.0.1790194993528;
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Wed, 23 Sep 2026 21:17:00 +0100
Message-ID: <20260923201701.43391-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132315_290417_0205A156 
X-CRM114-Status: UNSURE (   9.97  )
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

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630a..f66c681d3788 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.53.0


