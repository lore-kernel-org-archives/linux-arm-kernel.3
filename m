Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014AD7831B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/S/18qSCPNYCBqytbcS+B8eVVggQ3UXdDJZibS2kYVI=; b=xiSinOIfOdByoCFYtRrOcc4yIe
	G4ujtwnAqUS2wtlhexxL3agfbQKIaYPCoOAmj3j/v3thDooSRDoGjq1BIs+Ar8HBiG+mRrb2uSu+U
	gWn8MFQ9FAZfRlVO5FV4E+KnSiaV1bhb8HAu0bIkAObr8ocJ95D6Tr1W9U7Krwo9i9jyhFnGuBXFz
	9WMWAWVExL4qDzjIDIpbGlNt+YMkaLgdDzcuUTw7HIExVHKXbVJHtBlfrH90ALqrR+Sl4WjXRwlID
	93srJKgdrM0KOGJuM0HnSzePZyNtZZVcjqKy0D2SbaUzKD1XM96DVOltieHq30qdcFkhtauPSumi0
	Mn3C3PVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6PH-00000006EKz-3ME2;
	Mon, 02 Dec 2024 13:24:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6NN-00000006E0T-2Yfc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:22:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21583cf5748so9765205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 05:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733145728; x=1733750528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/S/18qSCPNYCBqytbcS+B8eVVggQ3UXdDJZibS2kYVI=;
        b=GZnoI4NmLK1RGlsSXePJO8yvyTVAIcsgIHFdz/KC/maF75XKMv+7AgHymVOFLJoosW
         EqFTT4UwJdRULxJrBzGnybfudLhawXN2nozv38Ig1X/aLWp97qppd4HSh7qNoRF6g2YR
         mP0KN4N+066WJoEHTAGI3fxWhGIPRJYn+C0+qtNxoQSPnmmrQB6CE4h9NovNZsXuU6Zi
         qk5S/gKSex4eNZUs+eUdtoRjaCxyoc3pXfEDXvdyEzAxtcyU5PIiUk1jrMP8zJua3h1F
         G+2GAfwl14LS2COfnCoTegChAHSdGZjNGR3/8Hvciu0VdQ0gIXJGSq/pcC6UBnynDikM
         T73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145728; x=1733750528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/S/18qSCPNYCBqytbcS+B8eVVggQ3UXdDJZibS2kYVI=;
        b=kKwPEK1Z9E53SVNl3rPERHOQMcFKSLZs/NUxIKMzotInmWrdqNWiQdyCR80jgOIhRD
         Vy1OaXZeVqIBqXNm4GhodXZyIxA3P1/cJ1Xskx99Eb8rPQ6MUyZHpJbxi8nC6COMKBAA
         es/eGlx9oC9Q0hRvd3BwInCxWhBNBBbP/+M6usxcmpD3XHaH/pzuGEZ4m75npN7ShTdD
         1DUVidwY9l8r+Sf5aola65u6GXxSjOHzIa/hMbfj+/JDD5T9V4v5Tib+08GKlrR59iu9
         JMQ2djg0TC9pUCJ38bNuVbTozPuaFMxGS89FydwQIdvrg/ccJRP04yp5JmpH4aI65KZ3
         LBFg==
X-Forwarded-Encrypted: i=1; AJvYcCXvMY4EmUWQoYclfwSaihAm8tGQc5F1PdweZ9/jMwPtsn72G+oLKK5UCq/vjrYCDMRHjh8D6Twgs1FTQ/KEFi3H@lists.infradead.org
X-Gm-Message-State: AOJu0YyNXedCpq7gUVYVafVbB8nJM+aWvcRMylV1ig6bgehkAz5RsLKK
	alP/GeVPXeoMebCF4pYntGlD2ygBxFYKubSwPxo22N2bEv7/E5C1
X-Gm-Gg: ASbGncvuWSTOaWqjF+leEkVbVZ1dYhs1VKu4JPTxdk+dz/I51gMTI7Nz01Ia+jGWFWa
	LccsKkorgxln+Jy9S5VwGd86obU17lu2aDGIUdc7AKC463voE71JK0UD1B1Ad8qAy8JPHFIqP6Y
	rqB4vaSW5yMaZKaCl+RZx/sPJ6/FUhro9qducafvYdEnuopkzYBv2w1+DojcIPrCLbK8Qknf3xw
	7CwMMszsmtFDx7vj11oAWSpUn3dwz07NXaW8KV7tn56ZXv+0v58TkxIrPeyfQ==
X-Google-Smtp-Source: AGHT+IFVrLiQ0GbbGVPeRPip/3qkcT3X4QdrltTQzaVD3+6Zz3D+wWICEQ4CTjCk9X2VcX8s2YfS4w==
X-Received: by 2002:a17:902:f54a:b0:215:4362:bc76 with SMTP id d9443c01a7336-2154362bf24mr211766295ad.54.1733145728199;
        Mon, 02 Dec 2024 05:22:08 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9b87:b3a5:736:1fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521967290sm76476535ad.142.2024.12.02.05.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:22:07 -0800 (PST)
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
Subject: [PATCH RESEND 2/2] dt-bindings: timer: fsl,imxgpt: Document fsl,imx35-gpt
Date: Mon,  2 Dec 2024 10:21:47 -0300
Message-Id: <20241202132147.587799-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202132147.587799-1-festevam@gmail.com>
References: <20241202132147.587799-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_052209_686247_469D4AFF 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Fabio Estevam <festevam@denx.de>

The i.MX35 General Purpose Timer is compatible with i.MX31.

Document the fsl,imx35-gpt compatible.

This fixes the following dt-schema warning:

timer@53f90000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx35-gpt', 'fsl,imx31-gpt'] is too long
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx35-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx35-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
	'fsl,imx35-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
	'fsl,imx6sx-gpt' was expected

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index a2fcb1e8e74e..9898dc7ea97b 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - fsl,imx25-gpt
+              - fsl,imx35-gpt
               - fsl,imx50-gpt
               - fsl,imx51-gpt
               - fsl,imx53-gpt
-- 
2.34.1


