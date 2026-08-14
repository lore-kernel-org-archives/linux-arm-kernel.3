Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D72C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5336+SrGN5lpWmSppcc7MRbo0dB/S5DAQkLdylUDNM=; b=uFmhYORtCuiCwdYnClB64rLLkC
	uLTK2pmZIC3D5R13fvllj9Otp+xABB00bGSTXqLMlyRRfBHauZZiN+4YS8GpElyT2yxoBiVe3mTK4
	hYpjAFNX28LZNCwLR2haXtU5pMXEtUxgkjzladqyRG6RoeZgYcqCxe9iRZKtqrQdaQHX8D2ZpNMlH
	G34ToBvhMdkAuVQPEPFb9HNI1X5LmM8WCq7AZ1XVQwQ+3omC4tfkLrlLi2yWFfjjSRNaM2mmhS3/v
	5D9+Wz9yCw5jE5Zp36//4RLDPpulDXILlSAMKOqKhgjdhVXx8BQ9TiF0clL49skJ5yJgg9b+udkS2
	1X9mlP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumdD-00000002CmB-0L7n;
	Fri, 14 Aug 2026 07:47:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumdA-00000002Ck9-0yxu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:47:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49557167508so6461615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693626; x=1787298426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5336+SrGN5lpWmSppcc7MRbo0dB/S5DAQkLdylUDNM=;
        b=jRIIWP2sDYdJY19zVtj7bMnze1ApGz06heo48gcF6p7vrZzFY3DJZkzHvF7yq/HhMU
         3dtZHzcdvjpjUrOw0hTLHO/zJcNkyssv8wjGkLgW14BbxvZ9/lEquIDDn35O65TsnECQ
         QonZUVMpMUDA+yaE+x+y3lU8vL3sCNnTvMjfEpxeQDpM38jMNBNPqrIoDIUBIcJp2AtO
         nWo0Pu/eyNiR6NvqSL/TNymds5M/VA71exOEU4+7Aw9lwB9+TLI2DkncO06orhSCLK3Q
         qRu4Vacpz6r7SY6fPskxqJKD87M1ikYlkvp9YX/rZx7FrWgQlRGbTRu0H9nW+us1J1ZY
         BtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693626; x=1787298426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W5336+SrGN5lpWmSppcc7MRbo0dB/S5DAQkLdylUDNM=;
        b=Hmvt+NqZcsf84aX2ZI7fJpJ9g47ODMFuLT4w8BB9io+7VKnSJFs/eJdYwiX8JZbWPI
         X4TB3Zby79bk618Q4KSQ1rjA+rds+TP79Ywe3jGjcUM9Aoks5/FUN9q/6saZfc+fbwil
         XI9wCyjEqKxn3Z769PszHEh0+J8sNjqnEZ/PV+7haeXUc2R9XmXbso/+DArW72ppEltr
         Bw5H270nraXiXHNbMU1bK7c7LZv0e4EjEqc99TttLwh2V1OIrfJw2sAcNRKNDAsUQykh
         yBRRJ1HqwQr24cqcDLiliOzoSQ4lRGghHy+6x3WC2piR9tpBQWfAN6LSDkHYbVBqswbo
         CTYw==
X-Forwarded-Encrypted: i=1; AHgh+RoKTXQSHc2Q92Dee/0Q1JIjHpk85T5lk9qIvS4BGfMTr7OkMG614L5mS8BpVXU4HNRGLUt1li+Vgv70zeg3Rpgh@lists.infradead.org
X-Gm-Message-State: AOJu0YwQPT6Nlrw6LpPRQOfQBKaXROlWC/sygIrl7q6IpP61Pi78QSfH
	30WALChpB7BcesbV7RrEcUNME3OCDmB8Et0B54cvnCjkPUJ7oLvk80Lk
X-Gm-Gg: AR+sD113vhCi3G0Hbzjk3D2KoR0grMT5JZIJbV7kSNfBDSka1g8hohT0yd0TekaM9oR
	PbfWxwQPluz6xfj/o657tEs72fVAj5Qy5ek20cKmznLSL6Prkqrq7qVM2wWyQm5EfVFZIa4a08t
	ygBJa38fv5/FXpEsckInauYsk9bZUT4FjI9UuDdiHizOpWtblkfimIukDtBnSl9x2eOIr9d5aXS
	M23k452rpiRHYJPjeatfPCD+7btrY2F7rgvLgC4uvUUJcHsQlQN4apZ3VXDlQzwDFixDVQCgcJp
	RidCuC3HWX3GCNUc7HR7VGHO3gvgoaElOV0bKPwCgCLIhoKwOwFoEFMaY9kUPqJIrWiCj6H6Pwj
	6H9GquK1OlUSHvuO+uDmAJaOyi4ccNOZpIiD1bx3C2SY7miTp3iQusdXQVhV+PLX5Q3uGjU0FE9
	RIdW4x1UkAkKUahLxiro1c6kvTKRsgPoFrbrnGUuL8DmK8ifAbo8/ahfWcnqCqVThmmO6kSqlRX
	rdY
X-Received: by 2002:a05:600c:1385:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-499879a50afmr38622825e9.16.1786693626273;
        Fri, 14 Aug 2026 00:47:06 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Fri, 14 Aug 2026 09:46:59 +0200
Message-ID: <20260814074700.2491256-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_004708_730982_ED1BB74D 
X-CRM114-Status: GOOD (  11.24  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0


