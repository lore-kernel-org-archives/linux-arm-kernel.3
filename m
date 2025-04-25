Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B90C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=; b=3OOaVng1g7p1IOsdpWKSWOUxdS
	7rNfq0kGH3B3OR/kIMQsNfMt3+Ne+wN8loOlgvJ2AK3wI9YrlJlzzDPkJSRvwFMhJNUE8y7Huq5w5
	8rlwU/3VJnQwtVxSjPHg1ipnx38lkXXSSRk9PpCAfQI54NFX7BWan5Waao6CVDt3NCup+ijTWSX95
	zB+ZqYD5b/2CgKb/nL1M2omcNbY6dnWO9syp5RJhVH4pWJxBnod4oyjaxLoR8m0Ov26D13sHkm54Y
	dwukX8ce4NrGWZlBg+1uQVc5vSLHutBcCntZcYPQxJhf1cIq1HkTeM/S+5679brPp9C82404RJacN
	PAvl9zLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ljh-00000000B1c-0MVf;
	Fri, 25 Apr 2025 16:17:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8K87-0000000HS6F-1nhO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:34:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2295d78b433so26719165ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 07:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591654; x=1746196454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=UqTKb0yN9ZeQCB9SjyqQH7Kzg0Y6ZcKxIogpUgQPRuZt4RvpOpqE+1JftjoPpAPq8x
         trS+7H2Cq/JOKj6w/ocYv53hcwnr/jrN6prqWFyeFfsSjtHWGGrLe7xuZV+lsXekgZnO
         b9+fw2/STcNP3BNiof4IqA7HXvdSBRcRRxIzyd9jXhC6bqt53QOpIq+vTGiTvgmva6Ds
         Y8fb54jX8GlZR/dEKOUG6vbVeWO17tED9aVRLuXjwv4gz1uueg8swLEYjrsCq/0Cft0M
         fh9QpJcf2i1EUpTB4owYAeedgifEbiTnAJBMQXF0Q7uM7kwfoiSW1DC63JOTCb7gmRaK
         Od/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591654; x=1746196454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=bXVpGoxT40mnhXfhZhFujFQoGkiDWuA9BRX6icILo4KIbA8rzwr4ZYIpylpfJn4uYf
         s+H7u49HTIF9aXayjpZ9fnpD/S47FLKU0KY5O3Lc+PN74wfxIYPyJqIioVCjzDKfz9BO
         lYJgzWJPyInL2vHhHyVgNBUD4ub5LZGHIp0ta6A9/IswykMtUWNoXNhTH+K0lmjvT79q
         6T0HXmA/vsDjV5t0B38VQIyl0nFV3PtIcCpYaS02meWsS+YD1zeNAWFAFJv+XnAi+unG
         CVMYIVdQD85Fb7Enklt0tLggNJoZ2z36vS0O78wpCgnnOi4OvAZAHbdEU4G3xT3y7glG
         Xwiw==
X-Forwarded-Encrypted: i=1; AJvYcCVN9+u7+rTnnJStKF/eJRT4+CeA3H11JeblsuZdaLD3i1+wqhxLCOwsfE1J3s2UxrJnXoSmhNlpmiVocaWR+Zls@lists.infradead.org
X-Gm-Message-State: AOJu0YxeBx92VDfb1+PXsKPANUImNEy8RijISXgd1MvcCYLWfSXV+Ayj
	AXX1eofMkOv7e59nAnfp/A9k8Npiw21IlTfCvsJDfzJuTvBRLsw8
X-Gm-Gg: ASbGncvdAk5DgoiN8XNR+e/E1GN5VNvvzJGx35v7qjkpl02pcQhMFL2Uvvm+CA255jH
	bBfjDFvykHsxsPoVHG6c7QgWEc30aUJuQ5J5GDrmYGKY4njlW+cEimx++sb8fuWP4e8DUf8nANt
	zc2ESStH+b7M0brvRQEhydSLt9XlMBH2rOhmxBmEnBiQ/LmtfWYG3TtiGRzy0Hn+AYo0yXvZ1SU
	LG94qt70cqnbzCzfUmyGTQwrmJ48hp3hKsAuC8TIbAE48MIlDbi54Sy8Mg4lZ4HhqACgWhq6dKa
	6dxmfdGwEgQmBLCPApRVYau68Ded+IsONSp3Q8GPIkzfRFTHBym9
X-Google-Smtp-Source: AGHT+IEcth0n/p22LWn2V8E8hbKZoQEDrKaCxIGxb667TJCFfUnCcjwg4Wa+wnAp2NhbEJka85wSJQ==
X-Received: by 2002:a17:903:3c47:b0:21f:4c8b:c514 with SMTP id d9443c01a7336-22dbf635456mr41642505ad.45.1745591654499;
        Fri, 25 Apr 2025 07:34:14 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216c35sm32860695ad.233.2025.04.25.07.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:34:14 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 18:34:13 +0400
Subject: [PATCH v4 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v4-1-0ec2d0febe21@gmail.com>
References: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745591663; l=1622;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=7MoBmJQeZLl1d5tdgIVwQgJNL7HZP8gebnQnY4ucRwo=;
 b=ZogAjhlcaxC3gJmCAVTDtMtupBzVVHeqIG6M/2afBJrBzqAKQZ4y+P+6tHwEWWNynupPAtqt4
 bZIhzoL+75OCFB8MKwO8MbxZ40WC8ZjxH+yyJ52r5DjB94IbdFh9SFQ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_073415_461089_BB147D0A 
X-CRM114-Status: GOOD (  10.45  )
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

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..f2164144a7af29ca77761bc58fe7f4558e7d101c 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,19 +7,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: VIA/Wondermedia VT8500 Platforms
 
 maintainers:
-  - Tony Prisk <linux@prisktech.co.nz>
-description: test
+  - Alexey Charkov <alchark@gmail.com>
 
 properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - via,vt8500
-          - wm,wm8505
-          - wm,wm8650
-          - wm,wm8750
-          - wm,wm8850
+    oneOf:
+      - items:
+          - enum:
+              - via,vt8500
+              - wm,wm8505
+              - wm,wm8650
+              - wm,wm8750
+              - wm,wm8850
+
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
 
 additionalProperties: true

-- 
2.49.0


