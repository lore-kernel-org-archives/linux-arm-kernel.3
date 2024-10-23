Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17914CFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bETUmi3XIXD8kJXknLOuOgQdcHp3kntpbqzcQWybJyo=; b=Xw/jvcMbwp2qdjastopOKiJvtL
	lc+K0oa85m4+1wzECFfRVKzzqL9ex99yuFBshNI3uvpSWnzt/wDF6aoDLIxa5oju+cj3gFDNtZqau
	TgvZM32XJ1GCtLDPqXOxEQfpKn8ucCScfKDSOHPnXfOBQvHNbkZHvTV03QREpva2VpkeDPbpF7EGr
	TxqjMKqPEP7Zqp5G4rwncYHzNVPf9g4yJqAh2//bITv2f090ZtxOj/g9RkhKnC2nIQWdwJbjIAfr6
	Jzfd7dpV7iDs7zXY14yqBwqfX+fLMqW2weF0kApqEVoazlY0ljqW0W9jMJnBQnBGh+oVeqNkKi2vN
	dOLQnsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h4A-0000000FhDJ-27CP;
	Wed, 23 Oct 2024 19:30:46 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gZJ-0000000Fbbt-3rFs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 18:58:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20cb7139d9dso592705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 11:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729709931; x=1730314731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bETUmi3XIXD8kJXknLOuOgQdcHp3kntpbqzcQWybJyo=;
        b=MRA/ThiKBVdyBNl2nyS7UWlO10l8AZ50MjFE2XOk3KqdM0yTusPLJOUpwVcKVggAP5
         qaz9JQa3vpQWqZ1PN49XxNhkv2BVEmXZP/foid66SUmeQbEhaoc/Hj6WaVzsGuE2HLbN
         9IfAS+wx3LlzXZl5qVaV0WsqmMi39iHFTs45CpdSFcbVem/xiobIAViIEhHzRbKirM5I
         8qO84QQ22nlPD7ZYNqzPeVMqTP6NZSusPefptLf6AvvVv4P5xAjynoT8wFMpForMrnem
         eWsu8Y0IpYB5vD6amPSZ3bzgfJiY4Ep/cYWfdQhVZMAQ5ISc3cVPwXCBcwgjs1Lcit9M
         86/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709931; x=1730314731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bETUmi3XIXD8kJXknLOuOgQdcHp3kntpbqzcQWybJyo=;
        b=uxRA0hlDiWgFYPM0LwUVE/GFGarGqRbCjPpWC7ms/ntjQ9myYEzDdCKqxCnzgxnf6p
         cPwsFvtrUbNsE+oErhe8cvOsFlX/9sDlC7l48NNCSS9G6ZfZZrrcRiw4e+lBjY2aV+5/
         Vnug7Jw7eN5dTyf16imjMNJi8flaCueGn2iAFmZPJc7cUappzdEis9q+RxgjOAt5Yg6r
         toUstlLZLzaFVpqPnyhy/ZXzR76EPEV6lqFMmdgJCHI/lgpdAR9thOC4WRu/okr+mW8l
         KCoi2gDZ35uqn7MkvwO5ZoQ9tQqWUFjo4TbJXt+1Fvk0G5LXOcEkvGyVWWFXyQJPg08K
         Pylg==
X-Forwarded-Encrypted: i=1; AJvYcCX4jmDhyo5tXyxSkrVEHEXFx6vroiB1iWCqAbdf4gDYnAZ9aR82ERR37NLLyedyyNKSxWgdBnKKxURlI7tgqKj9@lists.infradead.org
X-Gm-Message-State: AOJu0YwN6M6HBWu3MuJRXDyCgAMxe8EvDPdWg5LvSYrGx37IQ0nKwJej
	JcCPC/5qLi5kbMuPWWuN0+66gA+Bqp7arNsFBjNBkOB38phDt/5j
X-Google-Smtp-Source: AGHT+IEiMM+L5uFTC2VVfCZ7I44sSELbZMIx+Zoda6jHBhFMKFwgs8wwCZULrOSJN8mgnxIegVhiIQ==
X-Received: by 2002:a17:902:d482:b0:20c:8df8:5066 with SMTP id d9443c01a7336-20fa9ea096cmr44157185ad.45.1729709931402;
        Wed, 23 Oct 2024 11:58:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6ee4sm60619955ad.295.2024.10.23.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 11:58:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@linutronix.de
Cc: daniel.lezcano@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
Date: Wed, 23 Oct 2024 15:58:40 -0300
Message-Id: <20241023185841.1183706-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_115853_980054_FEBA894B 
X-CRM114-Status: GOOD (  11.52  )
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

From: Fabio Estevam <festevam@denx.de>

imx7s.dtsi correctly describes the GPT node as:

compatible = "fsl,imx7d-gpt", "fsl,imx6dl-gpt";

Document the fallback compatible to be "fsl,imx6dl-gpt" in the bindings.

This fixes the following dt-schema warnings:

timer@302f0000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx7d-gpt', 'fsl,imx6dl-gpt'] is too long
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx7d-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx7d-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
	'fsl,imx6sx-gpt' was expected

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index e2607377cbae..a2fcb1e8e74e 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - fsl,imx6sl-gpt
               - fsl,imx6sx-gpt
+              - fsl,imx7d-gpt
               - fsl,imx8mp-gpt
               - fsl,imxrt1050-gpt
               - fsl,imxrt1170-gpt
@@ -38,7 +39,6 @@ properties:
       - items:
           - enum:
               - fsl,imx6ul-gpt
-              - fsl,imx7d-gpt
           - const: fsl,imx6sx-gpt
 
   reg:
-- 
2.34.1


