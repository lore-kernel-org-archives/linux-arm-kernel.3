Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD9D743C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlfK6fVkxSaaorM3DUmPJkAs0WHL/MQZMzNEpDjn1Qs=; b=AOMT+drLBJ+D+/O4c0FI0UXVye
	yxnQBsI1L4z2OFg1v8NVxbJaPSauJ172eHInMKD9tJg1DVBXQbY2Bphl3nkc5R63yx33XmrIrkccK
	0hBp3p4oxi5f+r//pCOgXwqO+Bo2T6EC3oJ5PeumbNcpc7OBAsj6O5y88+y4UkhXF4iyrLXsymmUS
	uljmX+npjL3wO2eZxZYaF9G9NvsnEGed9TjfdcxmhNlmUyi3WnorsuBTuzSIO47gx2ovKHEsl9mEK
	4RZW3NcsA5yAjwN5WxLAJ7hPxxYlMwL2Vrc/srE8H25f0wtksIC/T9uvZ/RUlCz4mAjmqzvv6EU6x
	2WPdnzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqGR-0000000G76a-1gx2;
	Wed, 20 Nov 2024 19:21:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqCk-0000000G61l-1Zio
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 19:17:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso7524225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 11:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130252; x=1732735052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlfK6fVkxSaaorM3DUmPJkAs0WHL/MQZMzNEpDjn1Qs=;
        b=M7N3v7vfEcJGuzWi4LbPTJHzqQKw53h2drn5KCOMtUwyoAVASEunemBasPIk9oOd2Q
         0F+SYPzyFi8iQXp2yNb/uTW3v0Y//lQGLdUC0fAzjjqQ6CxJjg1XhHG+fh9v7UvLiG6G
         P+oYHCzXrHG2wLy7LAQV7EHziBCNpW+TbZx03aBOs6Gb6mN/4vGyCIr9k54mDTfV4Wk/
         YkIjtuIdoPMIyBWhS9Kbwyv9qPIsGJFXkZKWhXEr4lGyWlSnDEjE2AJIHoa/cnw30cDC
         quQpObTYN58RzBdn5SmyvdZZ4AlG28m7/0AsiBvNIouer2tsGpvafbIsv/ckUg6ajUh6
         hYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130252; x=1732735052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlfK6fVkxSaaorM3DUmPJkAs0WHL/MQZMzNEpDjn1Qs=;
        b=XAzrUJR2VvWjm77nv7zDl/O12tPqI0yXW7hXi4XHPZiF2SM0aDK2Nj90XvuPw0/fIA
         kY9tZM4+Mxc3fZDIej/q3tsPQcLCtyRpYb21WUiJclWatvYTOOkVr+AobikRHPXkfVlO
         OekOCcmdboWPAlwtSfBolB2KmMMqN40zHdzVMZ+IRcdiHhTyyulj4fwlGwc3ss9d83wA
         +QwBTaP8FE3MLs4L3DArRnSVsg8V/EcN582znNrCSPAFbCQcpCx4jXc7aJ3JkRNXikXQ
         BRypfKsHGjMmpYyfzbKK93I7udKWY9nsrV9603+Ywrzi7vz/PrkAbtYpyuGMb1hJq84j
         tpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCULx2Mc2IjFGBxYaw9TY6AlGZVIKSR9KFFNTNOlJWTzPK2y0fGEjVNrcA/eYW3oQ2znXI3nn0viqH/+8G9SCAJN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5zxz1MoXfu6KXvKXlK4CwvgCuud0fP4Ed9tjcHLsiCXt2cRH0
	JIL8e23jnjoL4S4rrqBVsCE3pJeTwkG/IiKlMvYQ3uSufbcytSlAkOeNH0pgvJw=
X-Google-Smtp-Source: AGHT+IFsPHCFTeyLurJH5qyVLl3pNocdRdlqiQRb210XXiKhMPrIT/IgqWReShN+rBrzroBvgkskDg==
X-Received: by 2002:a05:6000:401f:b0:382:2386:ceaf with SMTP id ffacd0b85a97d-38259d26078mr527503f8f.27.1732130252463;
        Wed, 20 Nov 2024 11:17:32 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:31 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 19:17:05 +0000
Subject: [PATCH v2 3/4] media: dt-bindings: sony,imx290: Add IMX462 to the
 IMX290 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-media-imx290-imx462-v2-3-7e562cf191d8@raspberrypi.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
In-Reply-To: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_111734_415085_0FEF8A86 
X-CRM114-Status: GOOD (  10.23  )
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

IMX462 is the successor to IMX290, which is supportable by
the existing IMX290 driver via a new compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index bf05ca48601a..fa69bd21c8da 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -33,6 +33,8 @@ properties:
           - sony,imx290lqr # Colour
           - sony,imx290llr # Monochrome
           - sony,imx327lqr # Colour
+          - sony,imx462lqr # Colour
+          - sony,imx462llr # Monochrome
       - const: sony,imx290
         deprecated: true
 

-- 
2.34.1


