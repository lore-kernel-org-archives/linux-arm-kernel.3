Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD28D7831A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sv0//fy9Y6u/oppBNlbQtYr2WKWUynWe9KC5I1xpzZU=; b=HsUQFuMFNvI1vZpt0VPm5iyWCf
	i4ZmkDy3pSO2ENr4cP/qhTE4q7axUP1ybgjHt8QGseMy6kj2BgFA1jbdDDBOaUxmHnm6WZiN3Kzxs
	sX+yzb1ieHvZa/D0ar6jIiCXyM6Y10RWg4zLfSqjMONsunmH7K8hkzRzb8Q+2cm1k+LumXI7uQFsI
	KM010cmUFn9tG/tmj8HMFWV0j3l4reLZ/YftxGwrhoYhvjx72i0esWpqr3FFk1O22fyd2Q02lNDiK
	y4U7nhYiZ83SVkdcMqVCvKjWB5Eh6ed+egwqUJTS/KOePuTny4SXONqqZKnppCUgt7fKmggANDGCc
	7nPaJ4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6OJ-00000006EDS-4BpE;
	Mon, 02 Dec 2024 13:23:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6NJ-00000006DyU-2hEl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:22:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-215348d1977so31364455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733145725; x=1733750525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sv0//fy9Y6u/oppBNlbQtYr2WKWUynWe9KC5I1xpzZU=;
        b=mRMtqVIyaoxgbYmzLB9BmMsP5YgEvHXQWIaFtFqm02UrQ6p01UoAQ+U3SCgZ0meqYQ
         SRBgj28UUPYhAU4WEFsnpijrdlqEnI8sRZQ1g9g1lRpiXsX+atfDOfeawz5vBdWHAZE8
         xZSF74jZnMReKMVp0oNRqcjDwQYBOch8AtzA54ml4KAk7zv9+EFt1LPOdbcy0omCKN/u
         WwaGSLLJAJ/VtX05l/XJnh7lETFZKQ1xXRKolF1hW903ZzqnYFFRwoCAvV0jot4InJ1X
         SnDYMUIvInsIXVJKNyPldAhwwoJxRCQOnfBkZ5B1XTB1wPIAQI0aaOz5FdPYY4DNtnUQ
         dVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145725; x=1733750525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sv0//fy9Y6u/oppBNlbQtYr2WKWUynWe9KC5I1xpzZU=;
        b=aCKYfOM9jzcPRc8hV8kkw+W2Jq/KxsEGo8Th7NuUvVjo5r9ueKRRwq+TSikCEfyuN3
         jzCRD7ivE/uGbQ541FZyDtaJ8wWIcTLxmTzdeMg2qbJqtTy+k4nei9o5+RAcJwj/fZTH
         mSeESMxUYJjw9KJ6tUnST4y+OWNfewjJLgeqQqALOc56ow0lKtPnFIV7QV/9JFCD3SSe
         B2Iy0vA62wFv2l4c60ZIRjfuff2lg9970NIaWM7tThho8lRD5eUM5pBvkf8pz/jim9J1
         REgR94Gn7kKyYivPYU/CwQLaR61r5ewdcoCuwdOfcd3826Pz/NLqS0+FvdN14uRfDhfM
         sfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpshJ0yVkykCeAFRrAyePuFUB6YDcebbLL+5iSCG5iistHGB1M+SuPpFDnK0u5YHkLuql5F7KncrgJQO3NtxjA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ZCT+RDYDokziy9t7+9oza19nLeCiq0fBP/KxCOzk9XMUsAYo
	82TaPuP8qsjmhSTrUazwITVczexKxtLwU4zUs2JEmNnqQfKEP2nb/OIOSQ==
X-Gm-Gg: ASbGncsEI+OP+pMHgQ5PxOKBZ8/qNLOA7TXPqs1a5DhZ6Njj+TbN6y+q6AvaeJ2spE1
	L5L8JvW9nqusbZxd+lpTFcLZ3qLghL83rOo2g3OW5M5q3JUJ+mVkxcIyLgTp9sKBUcJOzsY9mbc
	tqEwA/tFqaPBpJbcIimNHzLZmrLvQKnoXUKIt/o3NZDjC7U4TJROuK04h70eZog6DFLz4Vh4NDH
	EtBxmABy5/0ronzVATsl5T5zZjPElXc9GAhqFLkoG+lwMZqd4y+YcybPXVdDw==
X-Google-Smtp-Source: AGHT+IGsdegJ1akRjnaYj76rP0o2QuAbiXTdSzIRk1IHeRT4Dt5LR1a5f8LbW6gNsw+JFjA0TQAakQ==
X-Received: by 2002:a17:903:230e:b0:212:5786:7bbe with SMTP id d9443c01a7336-215018570fcmr366988885ad.24.1733145724679;
        Mon, 02 Dec 2024 05:22:04 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9b87:b3a5:736:1fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521967290sm76476535ad.142.2024.12.02.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:22:04 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tglx@linutronix.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
Date: Mon,  2 Dec 2024 10:21:46 -0300
Message-Id: <20241202132147.587799-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_052205_678573_878A2452 
X-CRM114-Status: GOOD (  10.75  )
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
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


