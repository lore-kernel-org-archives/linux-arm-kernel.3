Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77CBC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4vGOKIiNJI2tJXCMd0e5H54wpKvUXMqTF3rDPaUqc4=; b=2qu2rasb6mycryK0spF9YtLBR0
	XJoL26kHQRJttQRIfgOj60Nq/ku5h5uNevfIyCow4sSXGujDagCyBqaLJRfZECarlKGmJT3Vs4aJ5
	c46rEkgdmgwiglVbwPr105qIT5RQt5N6gsM9UGfjUgkiAz2YzycNL6p7c8FEMLjX2wpB0bODhmaGA
	LauenZREEdtEmpKD+sBFK4oQygwW8oAKxj21IGDQGnbYeG0noTY1qYEfW11MZFqWudU5c2h9+8Eyg
	XlMIA1pfuKjLFyiXq9CMA6vKi6UUsl4i1g5JbiIbj3EclT5ZKSvPzkRhjB0kyXelgkGTiuvXoVwct
	TbFuzjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjk-0000000ABEp-1rrR;
	Wed, 09 Jul 2025 22:58:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcxN-0000000A1f5-3YZd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:08:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso50189366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752098880; x=1752703680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4vGOKIiNJI2tJXCMd0e5H54wpKvUXMqTF3rDPaUqc4=;
        b=GEqUXV1mZxzw+18/G76yZNWqqZavTtEncaCgThP78t2MC5jA9G1c8RNq2R/1O0VyeS
         tFVU/WBuiNTfRiSSniQNK+A6ZRDFNhah5maCN9hekki0jPGo5QgUzq0Flgdb0kaff/lq
         SfBwbRqW2ZKsWFSJD+8feQQvu8EJ6JkRA2ARVtRyiG+tDq2fcXfv9W3z3JenOMnDFfEw
         +kycm8XZwUz4EFmBK/cURyeRhIb/3HiAvLFkruHOrQ7qiBdByUYBApzy0sG1tZNroIC+
         zxHO2u74uPBMBQ6BxLlhmTV1fgg1DFZg4y2jNctPHsLDQRReFY/BJuvjSRZdtDkb6Ft8
         L3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752098880; x=1752703680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4vGOKIiNJI2tJXCMd0e5H54wpKvUXMqTF3rDPaUqc4=;
        b=Dg0duOJR0RiHURdWe0EOb5J/CzPw1TBq0X0P0RrQ/ic3JOYXWBOfmlurz8prnHMRbP
         5N57kRGgAWk7oFCYaKVX53m+S69HeV7f3U9K1lS0qvEkmCS87ogCcutRmgZWmjYP3Lte
         gi6xKfm5UHLnqgiGTyZ2RCkGtlsRyrqzbhY0XzvlYxOSQjjbGuALkf4IQIkZBn7nhpC0
         J+HuAhUTHoe0PLV3yzQIg0N2jNK5gQC51rsTjZOL78PJtAH0u4tVNy1vad224wvd8yIE
         uLzTG1vhj4cTVdizkwqY/s+aVFRdHZi+Vj3ssPxF0YDSfJQX0bPHla/agzw2plapsp8M
         PQDg==
X-Forwarded-Encrypted: i=1; AJvYcCVjQlWfMeMxUC3+oB8BFVFhGLfDz570wBP09daWPZjHTIOz36UXNyr+z+mzvSEV93iOYKrK79c8CcE9M+OPX1uq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0mBXKUIzM/MKpDUkoUCF0JFq2yg6NRVM7Z+fzsNV5h9wFUAzT
	txAaVgI7kSbfKd1BEHsV6JX9vo3hjzbICYyru7JlmvIOvfChtumBscVI
X-Gm-Gg: ASbGncuJNGLLaRA6EmSsMiB6V6hmtieQLT3Y/tqM8KTfJWUahO89wmnA5Jk9a8Ajr99
	tCDoI7dUpVJHB4M6EyR60WS8UuPuCwlb3uixNjMA0A/4ky+rqn8k3fWifrZ4S18kAkY84HQ4wH9
	cIg1lpmpL7weeQHcZUQ03B5R1Rh/f4+qCnsbtfd7pPZlQAA3hObg9k0oQq9f9vgDwNNcDpArN3W
	C/UK6M7lmIRx5j50MSWWboW0YL/BI4h2qcY3BzzixAlH8lyJf97NC5Crh0U3HrHp5Xk3pp3wKbJ
	3de3zwYf1Vce2m4rCg5rjbnNxqWRkaG1105fkMNyf5DsOg1wpTynMfVES3AuOSyNNGtmB+MXTLs
	sJnzT28hlQ3C3NOM4VDrVZlDN+rm42T+2k1KCtKXB9OVy/Q==
X-Google-Smtp-Source: AGHT+IFL+9YADh5yPMNkcoRGEhTWR60Z92TfBO9E0RsbRdcIJ90t6RAh9BWmJiSAtRtxnaUfQ26NHw==
X-Received: by 2002:a17:907:e8c:b0:ae0:1883:78ce with SMTP id a640c23a62f3a-ae6e709ec9dmr38876866b.47.1752098879866;
        Wed, 09 Jul 2025 15:07:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264fbcsm10520666b.75.2025.07.09.15.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 15:07:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
Date: Thu, 10 Jul 2025 00:07:04 +0200
Message-ID: <20250709220714.85697-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709220714.85697-1-stefano.radaelli21@gmail.com>
References: <20250709220714.85697-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_150801_882991_458E734C 
X-CRM114-Status: UNSURE (   8.66  )
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

Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
 - Add symphony carrier board compatible

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb76..780fbb5970a5 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -100,6 +100,12 @@ properties:
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,am62p-var-som-symphony
+          - const: variscite,am62p-var-som
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.43.0


