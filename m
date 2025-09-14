Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A47CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0gwU2jvcuEz7Zmi2rF3iYuLef34+LUaEBtsQc2TxOPc=; b=38ZWLhymKMUQUQwCsMykIo8AsQ
	EwLoTnfrOwZRl/GRcyaZltB1SS41rzX5rm+EiQ5EHT5jPZ6LF0ZGYvNWOKT2Qwc5SQilZ1Ysn3WZc
	2aULax05XZUPmcR9zwAhpjzpIi4w0bekaSCp0VzBLzZj07rSIPr66Xm9kAqnYa4fhASjscGLyTQ2N
	xkrV27oqab84hjVPujLy4sPf7EfHMfk5JlUG0KsDz8vyxLiCmIhiat3HkKTyLDJKiNbWDFGxqE2yp
	xu0fvB67HkJxsafB41/PwiPy6dcf0SMQrQ71/s5l/cZEML9F0Dut/0ouS/Xaws2uK1ep9ka42mm/R
	+LADkZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmgF-00000001K0T-0prT;
	Sun, 14 Sep 2025 13:22:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmgC-00000001JzR-1UfB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:22:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3df3be0e098so2001592f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856126; x=1758460926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gwU2jvcuEz7Zmi2rF3iYuLef34+LUaEBtsQc2TxOPc=;
        b=F0DVHe958OVm4CiCKWJNYPeNFPT33aCfsyh/aZkNxyZdLSc1KoyBpCI1gbfghD+ebH
         7FXMmQF3i/Sn6Zsnf6YrMder92efDtcjp+M4XoT1cfYkB3iPhE2gFcUcC+Urzx39dQHn
         c7jz6BlSNvrOFttbP6yQfWnG9VHIAVfeyVPZ0snQeTHuJpC1RCev7XNg5Ob6KrOwdQ2P
         cpkVPr+EgG6PGj5V/B3d0PaoDebGxFxiiWCon8t5493gtl0MurKMp22hCdpuulT+1sml
         4EkSOnTjsDnhscc3l9QQw+j0WAWGLa3CxJ1UZXSbVoTVXsFf/w5jaxkScUNx1ftNDdtR
         BynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856126; x=1758460926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gwU2jvcuEz7Zmi2rF3iYuLef34+LUaEBtsQc2TxOPc=;
        b=nUZj43IzF0T83mv7Eko/mi+UGc9qcZcIFcYDb7Bue7Gu6OtZCGsYsBMXlp5fRrAq4f
         YE6tXZPXMjGgd3a/njgNaQYXtNs1EveRGaMfel+/E5S/Z8hvSYOm2T5upKA96Y+a4eqG
         Yq2xRpMtZVLkT+UZw5YFf6MBk/SAQoakOSrQ7uF90XsFgYfb+gMh2Z26DdCSMTYvKOB0
         MT2qBdvOFiJDFoi0TjP0qgIUgweEg4RtaqdP1EI9Uv1Xqylk/FdGq4SO1YdH3r6SBmea
         +0OwAPSwURZ1jppUoWCLdAsa8Iyp0BSQ3n2uNVaki+Cy1NeT42bxQAA2mJDDqaUEyzKU
         C1RA==
X-Forwarded-Encrypted: i=1; AJvYcCW6dNFmdTBxCeL9fLPge/SbClQjMSnZbjJdQcseKp/2j5ihsSZ+n0Ce02cGxAfUTRIFXCnLuLJ/jv2C3JqGeL9U@lists.infradead.org
X-Gm-Message-State: AOJu0YwxCPb8l8xoufPJrtu1M184WpFVTIzMvY6TIH8qO2s6qKrOi9Ef
	2n9xMzZmZ9KO03t4YsYUeLdd/Amh6TYqR+zG0yZXw/sJofVvKYEtRcPCLaSJTw==
X-Gm-Gg: ASbGncvi1/YUvlRpVff4ClHSoo+6efmOrzkq3vpA1y8JUoJpWqjDXTxxmIjmlrKMIdL
	Zxnff8y7DK3uXl2UQW7u9J/xU3eXOhaM/rhIVULvmupQZgdwRaaq/Rxjg8zRgptvA9pCSYKTeY5
	nb/5pi4MigMbGXeWoTbAMoYoeVjq4GYfHgle/WWgYAOdAsUV+AuhPUfD1IBAY0i9A+m2/VRPV7G
	3P8kLukv7GRxyy7LtQw2fNmHJn64dml+SZVVlXJ32ABEH4SUs6HYFMzZuytMcKLsouw9yG40RvK
	lNBCLtzhNeaPuHU8BtpYiuriHj62JXOqdSoDmL7bAy+u4+WYLx05jtkQpbDlBQNNNbY8tIJ50Gb
	08PXJU33azxoaScFWfaTBn2TpCYbYr5tCSKb1XzObMdG7iv3GGhiGyuN1/2D3gYMcreZ3EydFjy
	6MRgHdWEkx
X-Google-Smtp-Source: AGHT+IE7WXHLfVH2u4+DSdlsFQ3ngfdBOj6lQTdYHkhX00KlElTNErFlDHZmemjLFy+aNAvICL1RWA==
X-Received: by 2002:a5d:5f42:0:b0:3e8:68:3a91 with SMTP id ffacd0b85a97d-3e800683aeemr6491401f8f.60.1757856126372;
        Sun, 14 Sep 2025 06:22:06 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e80da7f335sm7274707f8f.8.2025.09.14.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:22:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: serial: samsung: add samsung,exynos8890-uart compatible
Date: Sun, 14 Sep 2025 16:22:01 +0300
Message-ID: <20250914132201.2622955-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_062208_404067_4F78D879 
X-CRM114-Status: GOOD (  10.01  )
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

Add dedicated samsung,exynos8890-uart compatible to the dt-schema for
representing uart of the exynos8890.

Like exynos8895, it has a required DT property samsung,uart-fifosize,
so reuse support for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 1a1f991d5..6ebe8a869 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7870-uart
+              - samsung,exynos8890-uart
           - const: samsung,exynos8895-uart
 
   reg:
-- 
2.43.0


