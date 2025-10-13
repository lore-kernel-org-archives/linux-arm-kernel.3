Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B462CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ndqybwsxO2QFLLjTy3qgkVgt9RREczDl4RIa/Rwx+w0=; b=rzrm/dHt6MPpGua3fsWvIa1Z4R
	sPs9paPiNPt2+BmtaOGtTLL8qxpMs+o13On9s5GKJTRnuvDjqu/WNwcJnwF/DEAYFQBgKWRcBRgSB
	7mD6fvDdJ80u6KhhwT0ExkBEVzmeIyQw9ypbd0reIUCF7tl8qKXmMG9xt67tU2V3gFcJLY/iRRWS9
	3yjFc97i+Ba2MK/htW8Mvv0ce1bDS/SeeRqZ+wVVdlj08TuMt6z5fQ1Z6YPxscFkgtoZ1l40qOa9R
	qXPmXhwBJQ6Xcm+15zYpgeVtjjI5NW5CppAY0CfcpvSWGyLXJ3ukcQxblzAp4+qKw5b/rJh7426z0
	kfYCK5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jua-0000000DVj6-2mWA;
	Mon, 13 Oct 2025 14:52:32 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JuY-0000000DVhZ-1JGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 14:52:31 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3737d0920e6so46310451fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760367148; x=1760971948; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndqybwsxO2QFLLjTy3qgkVgt9RREczDl4RIa/Rwx+w0=;
        b=dcfPd9ZgK22y6UM8YbtlBBVxFCdXljwECmtNSxbaptnQ8P2rR477LX6jSpj9AXHZyO
         1BthUk9oYylA5CQxu+84pCvzHP2E4Y68avoXumPvX8IhAEYbrlPAzRxv2Y4ataMnMGv9
         SpmGo1VjvmaaW1MsO4sddq/K/S3et5cOzRZjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367148; x=1760971948;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndqybwsxO2QFLLjTy3qgkVgt9RREczDl4RIa/Rwx+w0=;
        b=NBnj0c8cRcbL6qAi5T0N9q5/2gw/AW7/qc06vpZv2zOXNly6ZJNokZpdcvEnWVdKlu
         Tv+51wC9cA2u4TQ1tVMfKDGM/BxcbT20E5jhgcC13xyhHwQrRUcj0tBebpaImJB0yfDj
         L/fmid5XXrz8qwlOc2HyHVBibJro/pzH4IClVZpLcL02K64qUsItGTCaAh9wcvtX0OQm
         ym951Ha4Jtq1uPqodbQ3PZ7JPeUT00woCPuXbvLpmtCQMikZhJLoVGMyUSrJSxrQqn+K
         8qwGOKkeK/t/hNXXsigOl2O1/nx8cGg2zTwcD9iDM9ZCix12HBxBHHtbdA2EPyQTQRRk
         RQcA==
X-Forwarded-Encrypted: i=1; AJvYcCXbNquHiY/295p08M6p6lImIkiGISRNDxnQTT3oELS8Ndfzv/A1ySnuIkgl9OXKRy4o5q4QAig+dnm+mjuOh3Nq@lists.infradead.org
X-Gm-Message-State: AOJu0YwPtXiFVkjF/yTG4vZ6PM2KPjZyNMZSbAdvyyktSVHlN+PuX3Gv
	wmUwUdazh2RLdrIAUm3Oir6fhzRXXVOSnh2hDfQlAeFIcrk56MGT4kiOvvGHJMwWQg==
X-Gm-Gg: ASbGnctYiiXOzUefRDNiFjBxtTSiash7X8dwKak66PsGYk4usxHIReOwkb7IHaNxXfE
	rdypa+37hRmQXnDN5MhYFm+A38BLTxrJAyYEPqhSgtO+GiYc/fkVpc3UA8g+6m+GnCmbyWe6f0N
	UIIYxLSF2/u7k91VcqZae028owjwycPVRfJURC0HVoaEnsNgrc5XcUGdQ9rswH25YgzAZZkCwaJ
	jLAvOqE1RZ2L/28uyd0ubdLSADhpsXM6NOUq+tkv7fDO1baIFOA1vWz1C3gHzmtRAngH4lJFdiV
	zyWl/M4PAKDmzBRsMeB4y1vDSCuOiX1/m3vTE19AeS958cSubbOaiBCozA66B/EMqb7NFMa9poQ
	yp+PNfjcVEmARiRGm6U4pF/aMG+6GGdq4gg/my1WbYx/zRi94mZyBGs9DbrPJjeqHc6XF95bGUf
	3F1s3an+FD0e3hM5ZVKw==
X-Google-Smtp-Source: AGHT+IHv11J/UiQuXRPc53mXWiSRrpkDd1UzSDOJ4DL+ON/DEt7ZP7ZjRbXESDq57CD/XFRcpXXCtA==
X-Received: by 2002:a2e:a582:0:b0:372:9bf0:aed6 with SMTP id 38308e7fff4ca-37609e64b6bmr49929971fa.25.1760367147927;
        Mon, 13 Oct 2025 07:52:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77b8a6sm31980121fa.10.2025.10.13.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:52:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:52:20 +0000
Subject: [PATCH] dt-bindings: media: fsl,imx6q-vdoa: Remove redundant quote
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dts-v1-1-5731ed92684a@chromium.org>
X-B4-Tracking: v=1; b=H4sIACMS7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3ZSSYl0L4+RU8zTzJMtUUxMloMqCotS0zAqwKdGxtbUAwYGFfFU
 AAAA=
X-Change-ID: 20251013-dts-83ce7f7b9e54
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_075230_389385_77063A5B 
X-CRM114-Status: GOOD (  11.27  )
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

Latest dts-ci complains about this:
./Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)

Fix it to make our CI happy.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
index 511ac0d67a7f2360afe22b81d76644575081089b..988a5b3a62bdebeda6b922a986b9ac93d0933e51 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
@@ -16,7 +16,7 @@ maintainers:
 
 properties:
   compatible:
-    const: "fsl,imx6q-vdoa"
+    const: fsl,imx6q-vdoa
 
   reg:
     maxItems: 1

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-dts-83ce7f7b9e54

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


