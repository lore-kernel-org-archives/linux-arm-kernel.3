Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28D5D116F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9Kxz2boStuvWtrnpIwzNC+tX+6IpQ3zEJOWuPBhZo8=; b=RvvE1hzozBkLcGpWfsNTuUwsFJ
	2H4BZO9DumVDb1ip9qGW7j83b+PWJ5OCnBj1K5jArsuj55MwB50EfBrLsJwPCrc2In20ucztJvm1u
	7M6nEoYFkBo1OVwDJJ31ZtyZgWACzyTkB2h9XmLNbTU9SBP8pVFEHXbr8xjcGLYTBXhPGmJxAy2Ml
	TKhxulfb5PiCbCXT7h3D4dXYqVXegdLFKjptp6+o2xBeVSSuTGHUff+POHliSs8AbhNnkUpTSoqGl
	2FtyouRKSDrDPfVHRvnRLNkKgN2EZgHWzTn2RMnNx1m+1MQZM70svkh7TEA1+gq0DmktAa/jNFWvd
	toN7Hsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzU1-000000038HJ-3pmU;
	Mon, 01 Dec 2025 08:42:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTm-0000000384h-4261
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1615063f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578505; x=1765183305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9Kxz2boStuvWtrnpIwzNC+tX+6IpQ3zEJOWuPBhZo8=;
        b=PSUb0Uo5j867bvla69GuQR/rLjfC+YhUSVMibWTAVyJWCGPPI3Ov/uHV+PXxiHW82H
         7XCQt0z5zlyGMY2jFxAAqFN71CWoEcFbfrGjGdmxZbnnxgOyDXNlnAfnVe3kLOX5LFlL
         NfzVXKSQMKQ0rdhIxQ8H70p8M5ynQZ3JH6oXsGpLeL3E4AJ63BXBTcf/xQYrT0+xvufA
         Tc0QS4qvnwFCGsS3CpnVAPFAAAnk6QDiOU+9+x1jrmwk9kmnimUEK0cNTTiD7v8HpbRM
         acI7xPAUQ/h4Nl6jyPmoTUBB82HpVkaL0aznLBTn93yuPDxtZ2cX/hyMI4KDczkVXR47
         Fm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578505; x=1765183305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9Kxz2boStuvWtrnpIwzNC+tX+6IpQ3zEJOWuPBhZo8=;
        b=Py6FXN+niIX5TkR8RVe07wuX1FhdWnTA2nObITb6YMZOu3bxj1lBcz1bYXtBLbhUyz
         Y3c7ozkEUJMsXFx8rvMUdgjOwSLtx1SeGun+akUro153mJSm/o3Kuo1yz11ueyvWpB6C
         WjsvJfqUUIU3PbN6iqwRL388JUCN9pLyK69NshTmMBu6td9S215B1etxj5OK02irpwPt
         jtp9xeg7AP8dfeVX7vJ4+yg7ZsJ3G3FGYLssttNIf2WaOU5YJQCl/EUX//oLmzVkisH5
         3lSy1QojidjXKehEqdkw0axMYecj75kwVo7O4MTCcTe17jSqcavCdY+iSG0rVuGoOMMh
         aupA==
X-Forwarded-Encrypted: i=1; AJvYcCVoROpWCJ5am4pRny5HHQ3dO+W02tJMZJ07eRkH1Mo9QqM+2PZm5U5ugpMpMGMHDA8Ui5sksVFRRyqbuZVqWYvR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq2mj5AEguP1QoH3hy2ydu/1V/gTWDniEcAEYIo3kRgYIha/p3
	5MCuWURti+k9JIojJdTI8xySZJ+pbXXOgK47tCUxgoenZUv7uzjeQ8fp
X-Gm-Gg: ASbGncuIgh0702CBoLj+nMCjyXXMbL3Tlq27Mjn1z6K0tOZvOJ8yIYyO1j+vUPD0DEk
	xFKX1UapW/nheosdqUths+17SvFXuRtjZW3QF7qe+HSkEDP4JBE8AZYs92MTHvReEJdk14FF5FP
	Iy21Hoau/PrNR3wDqJg+6ggrUKIXwhSzoud6M6e4hgKDoGH2Sz8K05kEtyNvu9C4HuQ1V89ONh8
	5SRSfQBhkKEsfGUevFwJq/uVIUpWozKYFQgSM5e4tFaxM88EuIfRlA9rQrIGhmfRO3tODwm/W+J
	VfZuCqfxFFSgioU/ozNZezC4gSUl8tRRI6v2vbmUqLYsUdu0GPu+1vfGRQ2XjiWKwmmNa9QE7sD
	QIFHb5H9v5Biaikmn2h1u67tjrp5I81W6uLoLYT3UwcGrBs80W0Awn4FCUxL5Q/hax+A5Szbjva
	C6EmQ3liBt+oMksd+MF3c=
X-Google-Smtp-Source: AGHT+IEnTnqv/BVPJGKstQYgwzeSPIi3tETUHoDIIqI5/ruaMqH+Im+W1UD6HeMiZEeYg0CJUfiIJA==
X-Received: by 2002:a5d:5f83:0:b0:42b:411b:e476 with SMTP id ffacd0b85a97d-42cc1ac9c8cmr40375471f8f.9.1764578505080;
        Mon, 01 Dec 2025 00:41:45 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:44 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Ezurio LLC
Date: Mon,  1 Dec 2025 09:41:36 +0100
Message-ID: <20251201084140.376058-2-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004201_819781_445305A2 
X-CRM114-Status: UNSURE (   9.91  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Cc: robh@kernel.org
Cc: krzk+dt@kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":
-- 
2.43.0


