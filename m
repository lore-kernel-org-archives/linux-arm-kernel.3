Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D9CFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8POc0ozVUT+47lXZs+WKX2u4H7qQ6BvNQLFo8yC2yY=; b=L4ylm0BNHEHT2mfZAVFSVw3Vqp
	1rBvVL+u7TB2iEQXfg1mM2ALcK7i8g/CWgNjt5q5LJePfqEI9fvIrkslXfWzWRf+Hx5BR6JE7EsSG
	D6vG8zcRd/kSZ/ptl6/NaOVQTxL+v2KtgW1D7QGP0CHcVXr2RElBYuX8krL9ngZZL2YAgOVgDo9He
	mo9LMIQJ3DJjQrZK5uMcGY5VBNwuPV5qmnpOs3GMy7e58o56g1pIOdet5kr3mPFNQ7aj3ri6Wdjbr
	mc2yD3NqODi55Qi0bTiz3ASW1U0xUM+EuUCPmlb8p79fIdfcDwn0/5MmsoE4qUzGYomeV4mgVcpv9
	baKFL6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h5g-0000000FhSn-01e6;
	Wed, 23 Oct 2024 19:32:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gZM-0000000FbcI-0MxG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 18:58:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20cd76c513cso535015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 11:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729709935; x=1730314735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8POc0ozVUT+47lXZs+WKX2u4H7qQ6BvNQLFo8yC2yY=;
        b=F9zde5xfIH92g2mfrMa5yXlusltiO6l+YiUmD2i3brm7WUQ3qVcyDw9UJKLTfOcD+j
         UmFZx96el6T7voOHAR93/4dPHhVrlANQkUatLKUHxnBVT37gcuk6S4hAnhk3b0lADOVL
         gHRypb9NZmYilBNaI2gz8hfZEme9hpS1FIPNobOFdac9FTrmPZ9pN2r0gocNGqEXH/bI
         lIgO7GbE+DhlfnHIzXYzR/4V963enhOUXH5DrMruTpwXimk+4NjiK3XzyRiL8Wz2xztj
         71OcvML62j1NwHQl/h7YR2ssEF7rpDx1/uCxaSwSrf2wNxNavpG8M20a+/nEg7bRGhks
         b7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709935; x=1730314735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8POc0ozVUT+47lXZs+WKX2u4H7qQ6BvNQLFo8yC2yY=;
        b=aGwOMUsyIXHWtpDYvcYfYQhOoOFjJ1ME9ZA9q4wnU0pqZAufjYJe9Vs9PDVhk24/WS
         9oqc7zrupxcP/H9S7143HwX1QleuFp+Fm/braXXuppvHSoLn28H0dQTi544Dt+KRJddv
         eATCZz8nGQr0tIgMlz62ig0dFH5ET72pmiw9sbRJQ/HfOVUZn+r2S1aoJCNgB9//5850
         pdAQrh1CiZUSiaoOba1Gr570PsH6qOEQQXLfZ4GMWi+uu3wlNsv/TgdOg/I6FKu3TBxk
         yW6R/1uItUSaoRjALQwdpIgptl7NHhxBhSRhTLc4Uc+5dtB6R8vB4OeVKiO94XTFChwO
         8yVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQihZ77lmrCerOEaDPG2jOloG95gYOpLNUd+tZKBPSpBYu8bUfR9alNHL5sOBEkjnlYbhzijg3y7Rp/izah14m@lists.infradead.org
X-Gm-Message-State: AOJu0YxAWC5f+Gm+Ykuk/9SIA6P7dxGlkxewH/17BTXNaz602tQqnX8t
	vTVu4KzUpM98jAt27h0iEnrO/xiPGfyAlVi1eRs9Lgb+j87iDXIb
X-Google-Smtp-Source: AGHT+IHH019wlye4OLyzFgAVfsYnBimRnqGGVnQAULUDSlRjJMvfsgn8n6SH4ioTZQtD+DntZKPrMA==
X-Received: by 2002:a17:902:e5ca:b0:20c:b876:5046 with SMTP id d9443c01a7336-20fa9ea37c0mr32248425ad.50.1729709934726;
        Wed, 23 Oct 2024 11:58:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6ee4sm60619955ad.295.2024.10.23.11.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 11:58:54 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] dt-bindings: timer: fsl,imxgpt: Document fsl,imx35-gpt
Date: Wed, 23 Oct 2024 15:58:41 -0300
Message-Id: <20241023185841.1183706-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023185841.1183706-1-festevam@gmail.com>
References: <20241023185841.1183706-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_115856_146319_2D8FC921 
X-CRM114-Status: UNSURE (   9.50  )
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

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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


