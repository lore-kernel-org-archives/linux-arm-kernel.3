Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB392CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo4VEbVAw3LffR1rR6U74a6Y8xtKLk5HFuoBic2yQiI=; b=tXyRuvhUPh/AEbD7/NTuat42gm
	TSl/fEazK7193HaK3mbVkDCpLT0Bn96MUMh+8nk/0Nbbg0zD7YMya39Bu6pEFpwBfbbA1ROceoRQp
	+kcb8bQLRTu11wVqEUfgiBuNMhshjVTFOvFhi+dozeqOuoC15q9ebn+l+JZRG8cpNqIK4qGfy2zn4
	q8fLswwESfJIrLvQVH29dfkkfKQnjvd/cQBnKoDBfcL/UoTZ7QGk0d2F/zGBzuXUb2gpuu7e5uXtZ
	UcrkNIDrET4h9xPBQe5dECE9OaiKXGdpGDwLOacDvNz+Ll/xJj4MtlbmDXYY1d1nnwskEQESmdIvN
	pJ7z3vwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwADV-0000000BaHt-1EKg;
	Wed, 10 Sep 2025 02:05:49 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwADT-0000000BaGD-18vQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:05:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-24458272c00so71792885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 19:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757469946; x=1758074746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo4VEbVAw3LffR1rR6U74a6Y8xtKLk5HFuoBic2yQiI=;
        b=N9iqbz/WnL91Qu7zu4torcY5vfGIZ5dyFv29ZIPLbN/l6jOirwr6cv1w5K3wrHWqeF
         7M4zpwP/VWxoQBX+PeQtCm/V7QP7wFhV21hkDV+IT1lV3yoI63vKrJjUs3+g/NuDTQ4V
         QFP+P9qyji6yynh143BnXphmQc+JPTdbwAhgbJ/wFOvw9zIWruWpSs3nqvOs12+Xw2X7
         HKIZUYt8vGg6BBl7KlfV6wGRx8zae2VF0rhPvQ6Ha2Ld1OWvj9S3ZjKNidtJ3hi4vuqj
         g5PW7wHqQZi1F1afDc9GS22sBqwFIKlxPu647uq7qTUd9s3xua0zCajGE3RY7CJy1/pH
         rDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757469946; x=1758074746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo4VEbVAw3LffR1rR6U74a6Y8xtKLk5HFuoBic2yQiI=;
        b=etGudG4ZNaUXHp/9k3sAPV+eqkGOYfsH1YIJ7o160kJDDUfBIMkrezbna8AHzYGuhN
         EePhnmDGsOGtBawptFwCY+W39NE6ApoXZAmA7uuxK3st94J7igiw3vmnGJn/+VzPQCq7
         5UOLYPfeonWvTMg8TNVi5GBDywDdsCnaN/ExWK11vP9h/So4LJ5RKWL3NVx8QurgZlsr
         OfMWs7wIFMpaU/0Xg2AvyUr/cv0LKrlcKV1VEfEyjJXtUbCMwA6vMOBFHP7Xnq/zXgzb
         D3F3VoudSypqvRpqCNGkQvEehiMczNy7nAc0rCj6sxbkMW8AeOmX8fFFSvn1zOiEq4z5
         e3bA==
X-Forwarded-Encrypted: i=1; AJvYcCULAvP39WeeXnC1cCDPKczPq6nNHTmJX5fCb971x+noWyNwOAntG1PQt52TTuKoli17Fcr9mLbNo9ykFBkxZTIn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqw9cM/WzB0LsfJM/xZayV0M+7pQh/9C+Zqd2JSWzJ9xasT+Y2
	ZHC84eAMIlN0CS2VK1iW22/ltDwhi4Cfc5FwJusE6Ef9fjc1dLcfvl51
X-Gm-Gg: ASbGncsdOlsvhXRG1n6QPGP37uJUqTFfSw1TGdavVj0r/PO6GenWUqwLfbKAU4rKQIq
	ziJpy4TDXOJWcAnMhBGHERujb4OX70aZzpowaszCQiM/N9jhGpyJmv+qtL2akHlfks/1/rK126N
	bZNKFnRzY80hxxhIr4BIVo/hUnbz+C6tveC8wfHw9H3C48fHNyAKdI+ejxF+JsfEX0ABPhz8gWB
	9Gm8lXLGbB5Ohl3ThY/G2PaGlYA9Kw3SBc/O/QezIOeLP+HJrjg66/pcQB7yVrDZJzDuYCZHpe5
	APJ61IQbLuFACbJQY+fnaqoTm74pPt4/acTfsk5W/uL5z0uuYAgCKA4ZwC1XOpE0v96sT2ejX2j
	vNZicBQVBcU7n2GRWnyH6EwE2rDTHNtoPJc82gNS26YBudjJORjqUFUgOSQ==
X-Google-Smtp-Source: AGHT+IHwgIhELapLj8nq9Y1ltim4kH1wGUB2p36Co7UlpgEMhsiFminC6HNAiT+4BLErxh/4zd/+aw==
X-Received: by 2002:a17:902:d4d2:b0:24b:1f34:a64c with SMTP id d9443c01a7336-2516d52d12bmr169999525ad.10.1757469946427;
        Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue,  9 Sep 2025 23:05:24 -0300
Message-Id: <20250910020525.342590-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910020525.342590-1-festevam@gmail.com>
References: <20250910020525.342590-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190547_325236_4DD00701 
X-CRM114-Status: GOOD (  10.60  )
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

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ce31b873fb95..d665f3241e97 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1


