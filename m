Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8458E63F22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gcvwyl4RzaeXLrbPRMjONGomj+VO9fOavqp+iR5Rn04=; b=wkxvQOnYvHNfIAq2WfvDwUmUvZ
	O3F7FEt9cKU4MdmV2T1kNmCYgz3yXXVdzz7jNLFm+SjUw/jl2D34v/8HWGdnboktBBVdQJMqh0VZt
	JbhuqAvQ9ZeKUiSi/wI3zjyeTgiX2zBWaWqN7hx/HMBkDXjkQP6UDCxk2DKZKEtlyywcxOyKurVQH
	qbn4EqDrhI6fQ6exEVM2YiIz05QM0LL6Wx++SCnPG2nCw2GcI3yKsfqE0fNynHlRhi+Ri/jxzBxRw
	RaVSTnBJ5WeJljrW6hcXc6SRlRv8ogN383S3ElmcPNmCI44i6Q+UfwRO6eeGqZU/t9gGUnLF2YQcn
	fbLH0U5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0b-00000005pY3-3vGS;
	Mon, 16 Feb 2026 01:02:41 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0Y-00000005pVn-2vSb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 01:02:39 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1273349c56bso3316382c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 17:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771203758; x=1771808558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gcvwyl4RzaeXLrbPRMjONGomj+VO9fOavqp+iR5Rn04=;
        b=G3YAyOHWYnhHbWnaiqATAqyAUFIM+iYnpIV0OEvZZs8BYE2QstuAglLP5Qa4+i8RIu
         BBb/szRZrOQVXZf/AShv+BpOsKw6eGBc2mVIS2TEZXL+tfXdqCfbcEWh5JKuRo9EEQRK
         WBg1MNPa5mboWedQm57KF09XvSK8vLMVpZJFBS+j096quC0qsofAXViVBaKjF+atdabK
         18deBESQ0s+WD85HDba1O3Vjb7kGcHD2QcwbXY8Kc4tv3ddtzIz4/1BxAUWocNeKSVql
         ODNZHFrWtDo1afop8fS2+aetlS1sFbWEiEC3+L4AipfQzGzSGapooR0qtggQONx+5L+A
         KFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771203758; x=1771808558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gcvwyl4RzaeXLrbPRMjONGomj+VO9fOavqp+iR5Rn04=;
        b=EaU8GKp5tZfJyjjpDZXv4knnp238XVVHsy2CAygb3OfFn3HhKzmz39RVsMPn5jNyRw
         s4fmn1tWowQwQ6XpfZ5HJPwAbQNS3fQ8Jru7CPeacBbdoZIxPDUdbiVBBQVa1UcOgVqF
         YCs+zVZp0ytluyP9qGT+3IhduUuwUa7KufwtLzlJLnJUryiGex1z9BzYdcv4hzQwFx5P
         l30N9QZpXJQGqszXqDUrp4D3JEtUXzpcW6F0hYc6DVftBj2YeBj5BQvKTQvwNceREaqW
         fmrNCcDgchIPjzmnLzfJCHxH1At1323J7OM0SEcGu4PVyAyR930Pt9Msj41SOoqyBPyT
         7lUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvzX3SbnEm4R3Rp01gHdl7xzecZEnq1FO+TQulihDGheAMR18oLG8bLMAj4GFnHsbNW3UEZ8cV5hP7TkpEqwiU@lists.infradead.org
X-Gm-Message-State: AOJu0YwYc4CT7ggH1WcGG824NQ/kgz/XUwighdUsZMlHcCqu834odOSf
	GDcayaOMWb8t9bQs/n2JccxGJ1+n7wCRQ6rJWuhqKa1X2ytLrORDVRLa
X-Gm-Gg: AZuq6aJ2PmJvyo1DUSJL8f5HHzN7FYnNOlKvUBib7TyvlWXFxcOHu94YBhurWR3i7qu
	TNltHtN0tSBQpmr09MJ1F2PKjb9mCGR4CtoOTxkRPxjBMwJlWprDapNasUeZe5Re1S0igE6Ro9Y
	XcSGtQCnlEiwRhynLLdT99EvMsj+koTlCfBEF4M7IpdumXeC/Q0SlGzhwf4Es76ukHmbyGyduxZ
	FiJgA4DuRkJIIQO2N4ICwjgSVrG2Luy11GqRv/4uUlpjl5UAwag+Xc/sM8jyU7ZCzxGUJyyZoT4
	d9TYIrlS8tP2A+rERsKN8MPd8wgM+WpFMUgPBhmMojWFQcb2VFaWlmWcH8eGei4CFCnbbMxiMyA
	3vjAZLxP7Ld5K+JMq0zBz/rJwAXJS/IlWTCyqF+zg3wuWx1k57LYxwSX4pYFR//1ktBmc0xnYHe
	pNFJZ7YZbouqOsGOCsanW9dx6k7mA6ENLG6hwib16T8QUX5as1KVUtxsTwA2qGDfCB0hyqYVc0l
	Fcy
X-Received: by 2002:a05:7022:4a1:b0:11a:44d1:533a with SMTP id a92af1059eb24-12741b7095dmr2491280c88.12.1771203757592;
        Sun, 15 Feb 2026 17:02:37 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4ffb:cd7:e7e8:c526:2074])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cadb25sm9158160c88.10.2026.02.15.17.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 17:02:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v5 3/4] dt-bindings: arm: rockchip: Add Omega4 Evaluation board
Date: Sun, 15 Feb 2026 22:02:18 -0300
Message-Id: <20260216010219.2131484-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260216010219.2131484-1-festevam@gmail.com>
References: <20260216010219.2131484-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_170238_752387_2F643317 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Fabio Estevam <festevam@nabladev.com>

Onion Omega4 board is a board based on the RV1103B SoC.

Document its compatible.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v4:
- Use compatible = "onion,omega4-evb", "onion,omega4", "rockchip,rv1103b";

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d496421dbd87..1187d4743370 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -802,6 +802,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Onion Omega4 Evaluation board
+        items:
+          - const: onion,omega4-evb
+          - const: onion,omega4
+          - const: rockchip,rv1103b
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.34.1


