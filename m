Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55705C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vjquDoFxw8QXESgtnQ6Jsf5fdf872MsxxDRv+Zj3Uc=; b=Epp3ZkW+jLfb+cc+jIKqfEGvaj
	ShvNP19MeCxx3ZZ+OY7OhKOMK733ozWfksIDkEKzD65fPEypuA2KYvvHHZzS7ZERBTYhHykhBdYtQ
	4w1A+3Yrpai6NJMx/SSrSk3OCyy7yuFugYdj5fYNaWxavUSFy5FZXRrfkurETzJ1rZ728fdEsTB8y
	DsCN4CT9pjQZnVzvLmbv0x0rYbRBrDqhgLb5Z31PqjfdOHOHqPaO+PRYoBD8wjHXUtjR8AzOhnXU8
	tn/dRZSoQyOL4QYlEGOGa34Wy2SBOHS8YTI/j8gnwO+9O22qTrC8AgR0BIcHGn5INFrBLFTcyYfir
	0yNCVj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4yx-0000000Fl8N-1TVC;
	Wed, 15 Jul 2026 19:09:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4yq-0000000Fl5H-3y4s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:09:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493f45e206dso7282425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142555; x=1784747355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vjquDoFxw8QXESgtnQ6Jsf5fdf872MsxxDRv+Zj3Uc=;
        b=KJwvgXHUa1aQn171mYgI7HCsR0IdbDfAM5eSk0YL7RTHPWDltIpUkYK4T9KNUxaYy6
         YPUcIXcQIDsHdaUbKPR0cvuoGLX/QzvqGGCw5IgXIJhyIapAQRXA4uKFqAIgnrab4Pv7
         pcVpVPEUXi/lI/pgtxw/l/IiBy++kM/0TCcgfUIxh8Z/i3C+ri/iVKLX6lQOjG+GYmGl
         2oizjs6tVHCDc7TqJ0z7HdYFBxKnc4OlO9TYz9kn8FU9PGdRiKYLQFXFfNwwLL807iBm
         2WhdebR/+yTIDMJImogrXS9Og8bf72NmH596x6vgdd5YlAa0+e/Wf8gDEz76ApgqOOCF
         NywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142555; x=1784747355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vjquDoFxw8QXESgtnQ6Jsf5fdf872MsxxDRv+Zj3Uc=;
        b=GHZR+F0orrrEZcYnF9ajnWpTNZdb5orZQXhq3PY4bnQfmWdYA2eQ007a9TkkB0lV17
         ZD7C/tjn/ajmwc1Xhro6mcdBGDnKW/xhA5Uf34ZHGjDwAwca6rFYE6BZl0XloNRC68X5
         SO0R3AW3SbnyZU+bglnO4tL5DwI1xEFmjRyUZxPYU+HrXNlL4dFBKWSMta6Ou+Tk5/9M
         TUXxmLOsIcuiKMz206meMlMVtVAE7PFV1QrSdklZ8nIhBrAzgJOSr3GD7KPQsaYGw+3O
         pB+exjKk7dtwHf0pXqMlf88oHZIMJlQDNYlNndN79hDB4YnN3eqcxlcbbuc8NV1ki8aO
         lC7w==
X-Forwarded-Encrypted: i=1; AHgh+Rpgq81OEy5DFdaAZnvg9yeNp+e8trgYHUGUmcw6GKQWk0SdwZ6Rh1rB7oe+dKXyOwZ+xQ9qOMg2QDiWqpZ3FX3H@lists.infradead.org
X-Gm-Message-State: AOJu0YzAhgyg64rvwRnBjhBap4i5fNuTv0RA7b9/RoTJHpRuHrB3XAXJ
	bWVUJ+KrHhxm5DN98Vld7/dI4xsEMDjrPLOc7ov20kS0l2p4LHbQAXOf
X-Gm-Gg: AfdE7cldYT51N2hAvdyCrecG+c1ncOndC3LiDLi6aGh7mUEaiZjA9CuHDaQcVyilzzB
	7NffD50QLc9Ektd5uCqJTfwxY3E5A0myNie6X7mit/Qy9h9Pirxlh8o3zx8MldV624Pc8Zp26d6
	WjTX0eMVr/glwgLGC7yDXG+t1hwFJrNxdMxLiI907rhF7/bcnwQ+BBb8zZQWyPPfYa6KYhvcNm+
	2QZMa9M4s8XH5NEz6mVp63NxdZbvUIiV9I8pUep/Vc3qxb15CVgtkTktEGr8x/zlLUw9Fcxo+kg
	N5wbTUXQ5IXrGn81qxsxbQf8WykAtqOWOKnvUqYdY5MNbF6OQAPvzk11Kn1F7yHQ6cxObeELvQ8
	1/6MV5mtlaOSSRnBAfOr2mgZcDKEwWBQ4jts3t30vREoy/ClmH2HphmojN8lb87ozLlCVYrxn7K
	o7B9YwDhHaQBtSCVxfrkVd2eCegfBSNwKIVnvtz5CuToN04oPgGvvnmp4hiKgqYwqz2Cti5vyaV
	b/TR6sMYIh61roymsnq0mnoHA==
X-Received: by 2002:a05:600c:3222:b0:493:ecf5:89fd with SMTP id 5b1f17b1804b1-49540d026dfmr4161485e9.17.1784142554590;
        Wed, 15 Jul 2026 12:09:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:14 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 21:09:07 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784142385.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784142385.git.stefano.r@variscite.com>
References: <cover.1784142385.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_120917_017254_3C9FE165 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3


