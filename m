Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426F9C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=; b=e1ogjUmB9A5g74LFwhX7lwAcFZ
	92MbsJl2sRwQ+BXVz9uost5fEYabXRNUBxMku/FiUykbTaCrxOsr7bJPhc7IksAeVANUC7Bjw+cPj
	Y2EjNeEVdGPqFSCBXbmczLlHqPuNz9H2s3H0K2libYKOHZRiZCyCBabBoP45V3EnADqHYSmUf94dm
	3tJB2RSEMd7RPaAXX4HxEtOhj5S3rVAJIh3+YwHQfsCIozJlKCQkHAV6J2sF/iOzP/470N4mSHB/G
	OBLDNTs1pLfy+8ffOC6UJn6YCGr2NYp3P5saCFUMvellftbED9hgAwFvjwW9yAWfDdXP2We5w584i
	0uPtoAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9meC-0000000Be8P-21DX;
	Thu, 24 Sep 2026 16:50:12 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9me5-0000000Be4c-1SPx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:50:06 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874fso10667f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268603; x=1790873403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=McqtX92JQBtUFbBWS+aO8gpIWwZVzV4UBO26i6zgtT9L1r9JVPiYdtmyosW+nFoLNk
         dbREeCDYRI0BHq2+5jhsfIP4F8bjt/GysYzFSVRcRmAA3r8rX7whlAaBM2D21P6A46+o
         TK/xIrNxgvJ1w3TecOB4Sb5iteHkNvUiooyVMgQSEm7kornYXhmHeUiUmAjBwS1l0Z5r
         f8aQBpy21CHMrxLcBhffdHKfnv0RkEXZAHBjA3Fp0bkqBzC6KFEx7GZZwVTpnizNMvlM
         F0tAoauMYV/4CbFEqE8tlRGawLxAGu6KQqZ0DRrLv6mJq885BZxKM1muQi8Src37sXMs
         H9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268603; x=1790873403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=xsJCWJLj50FKUjqI/BephuT+3vPsolX46G4S8Wnp38GSXBmvU7Xi1mLILQ0TeV12iI
         mqgCKWdOgS/ZSm7qM/ZN6iQ2W8nojjHq2RUROIi91L03Zs5GvLMKTYdcgDwSae8DL1B0
         Uo6XLdI39AUwEJC2r4zZ4ZOtbLEOHxDGKQhKOs/dRwGC12yvTA+olFsnAW9HRRGzVffI
         DswGyndkigb/Owx+XPdB7vTQjYz7MJHfjBHdMmYeLChSxWwa1lrAk1WbQjEfAy/qsFip
         IyhvuMI6meIrpKiKI/NIOufGErD40B4ZoXjTc9tdCoIhzcv1mkWctQC7hmaKDQrWtdOM
         IzvA==
X-Gm-Message-State: AFuF++lUPlkRBHDn8NDPVPncNu9INZ3CyRw7o8FtuEKRAt6VsaJtUoK8
	5KlxbmB8j+TtJyf5I9O/gaZAcIqCSGGNSBDxyG/0l878c1uvRW6RcSld1E3/6cH7BxyRi9LkGxS
	2VY3reA4=
X-Gm-Gg: AYBFou3xZRO6cDCsntNMjgjAmnnleXefEmPUd+wMXg3y/IqsrB9h310cKbI7uGh7Gvx
	H1lN7fXm7qN6E5rtHFICj8quxlaZzLbpp+/CcthxzyH9mIwd5++GvYy6ftK1koX6I4LgYiHCZYM
	paaIZlu8rQeTCJBtDoSLubIZkJpSGVuXsSyMiDNCQywROgXmhUHEvCvCJO7FpRprGuGyKNv9V5X
	WddgIi+WV5kcjj5lKM6EeEdGPBmibZze5PF/tUqETeH9sZizPaSKQ4P7p2/3CFQOsQr/jI5yT5b
	3G0ZM8oy2l4h3EApM2OvQVOtd7Kqe76dsS89yyV3pGIlmytvrfGM7pz56qb7+kRN/qdv6TI7ee7
	qbh1QaFpE588xyjBzeqGe4Bcazd/Opu9FFVGAk/QUQc6v8ILvAJk/NLC2P6aooVVpedJVpyU9Qb
	J/hmTKMfrMhx406jso0T7LHm/0/eROYe94L/Zhk4N3RJktl7yvOeDKSBl/kl+qElOpCGSgNDrH2
	zggvhFU9aGGjpDWyBUARL0xOnHYrM6iCbID
X-Received: by 2002:a05:600c:8b22:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fe66f1534mr57247685e9.9.1790268603421;
        Thu, 24 Sep 2026 09:50:03 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:02 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
Date: Thu, 24 Sep 2026 18:49:18 +0200
Message-ID: <20260924164922.117236-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095005_391530_EDEBE730 
X-CRM114-Status: UNSURE (   9.13  )
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

Add tibbo,ltpp3g2 to the list of compatible boards for the Sunplus
SP7021 SoC binding.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
index def7d0cfeb31..8ec006576f74 100644
--- a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
+++ b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
@@ -9,6 +9,7 @@ title: Sunplus SP7021 Boards
 
 maintainers:
   - qinjian <qinjian@cqplus1.com>
+  - Andrew Gaylard <ag@ffroot.co.za>
 
 description: |
   ARM platforms using Sunplus SP7021, an ARM Cortex A7 (4-cores) based SoC.
@@ -22,6 +23,7 @@ properties:
       - enum:
           - sunplus,sp7021-achip
           - sunplus,sp7021-demo-v3
+          - tibbo,ltpp3g2
       - const: sunplus,sp7021
 
 additionalProperties: true
-- 
2.53.0


