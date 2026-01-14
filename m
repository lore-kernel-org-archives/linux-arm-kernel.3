Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6702D31A10
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 06:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=; b=qVq/xoHkmGCIMd2ITe7hMPvaJE
	VVU1T5o+qvaIkENaOQQXq7PMi0ModLsMrmY17vQqEEGkA8WTyQIXUocl2IW89rO94TzJPb1TWGBSv
	6z8PRwPwKR3RggYYWApjRhXGT5GSuygLH2rHSHN6dk42J/KEFyjSt6x3fLY244v4jm6QMpOrwqr9+
	vqH8YkYHOlGKMuzPjHJH7Aqcbc+79zVr1IlGJCqCHEjbL2Chu4xeJm0FJvBDnl1TYRFanvU3LfYuw
	nhbkZsjG16u3KVs49gqC3s+dLOS6ivT5xqK4szIzcJC3m10mzZEcNKpmmdQC54JNYxYzTomYGu+fh
	4ktM139g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKe-000000087Ov-1evj;
	Wed, 14 Jan 2026 06:26:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKZ-000000087MZ-2GDt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 06:26:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-34ccb7ad166so4655674a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 22:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768371970; x=1768976770; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=XSS0q/GCFR53F5hLdXJg5hZ+G6/W9FYbH22BnbJjcuSQ+NggnrExaC71KieS7+PczA
         pMZ5+d9E5eV2gGjd2ZB0ul7euncOwaPvBBhRApchC/SD+YmMp813oo/x/8QxFa9Jl1fi
         mJGNmMrgKircBdc5lc8JuQlUBEV/6B/WdZOphIrRsOZg9VPUeQdmTtHQZnzvqdikHMTT
         rMpXO2PysBfGSCj1eBGWKUz6C1jeyCBAhgcDPlD8ftiZeDpWnZTfP7Eq/ialhrawSPXI
         fSGllEMzF1YxwiuKBi4rGah7Gr6trUwKiAkxPdk6SJnqFoiwYozPcCT3iCGYzwxq5xQ6
         l8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768371970; x=1768976770;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=ZRk7CxHB+i5VckeL8g6t0fbsTMTptjJ90orlfSCVmwfmbv5PZ4BcZq9jceAk6zfZdX
         hi1ei9NA63yjZZg9EI6Jqu462J8A12xdEG1qU8w3K+ddsOIxHP24l4n/7B8wMwKTZvyr
         o6QOv+kUF5cHMMcIyyxzbf3mzcWsa5f8kwzDraBGVmWMS+gJrxwUKygOG/1eej/JRZqT
         chwMLhnIJzinD21tuKwFiRbwNMDJo3OPGym3te33ElgHcC1dwJzLh5s0B+bTXRMgH1Vl
         i4d6fcWRQVCk7nn30StvYMzr4iXfz0XEF6WudjYYmxzJfDgmqJA5/AjHgI0+OYbCHGh0
         LROw==
X-Forwarded-Encrypted: i=1; AJvYcCVnaWlgMUgTIJ/uqp03gP9nu7N3luXnX8nz7GhMIoaZBIS6SsPM5qRvN2H1sA1llEuRWrc/1wlADWojRP4hGT2B@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5OhF7rdD2zuTHWCGAObvOcfcpTmAUiVt6bit6KJe/3zz8rccZ
	Kl8lDH3/n70Hx6AT5uERqLvzhew4XpApie110dpnwlVd8sKYlx9gGsia
X-Gm-Gg: AY/fxX4qhTzjHbhPIV+eY8TrIJN9z8EcIdO9fMrCY4XYfyQzzVc1xiB8S2GgcKaNa1s
	lD/clz8REsRhDA8wxR7ir9G3WWmj+Nn3UEKjlVIaaKFuFPPuWDYkDYRsj1Gg8d6Ddm23yAWQyvb
	DE0UM3jWMO5r4R+m+/4ecp8Sh7q8FBtC2Cb0I7uD1fDakyTl+bvWoyWPGgLcjgfdRagsJS9hlsJ
	teoi4jelO2xfGQf3NDVlB85o9dBHg642HjVdmz98r4zMOfruoQkQf9+7MbFdq99Ga8EJC5SABbS
	Vlmiu1KvlIiJRRR/FO/JdkRGd/NcOB53OQmV7P77cZENdu+7T4z+prfL63kjh6dOIex/CdG2hzP
	tgPsxq/4r5GS5fIe1C4jwOthXh8X2P5qHl7iG7p2Td56YdZHvITdgy2462RKaffrj0CfgJ6ET4t
	uooq+NY8I=
X-Received: by 2002:a17:90b:2782:b0:340:9d52:44c1 with SMTP id 98e67ed59e1d1-3510916b54fmr1625255a91.35.1768371970530;
        Tue, 13 Jan 2026 22:26:10 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109d88f0esm891791a91.5.2026.01.13.22.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:26:10 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@khadas.com
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
Date: Wed, 14 Jan 2026 14:25:48 +0800
Message-Id: <20260114062549.68954-2-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260114062549.68954-1-nick@khadas.com>
References: <20260114062549.68954-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_222611_605319_BDF9F8A6 
X-CRM114-Status: UNSURE (   9.21  )
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

Add devicetree binding for Khadas VIM1S board based on
Amlogic S4 S905Y4 SoC.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d9963fe9259..55663e0f7f915 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -247,6 +247,12 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
+        items:
+          - enum:
+              - khadas,vim1s
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic S6 S905X5 SoC
         items:
           - enum:
-- 
2.34.1


