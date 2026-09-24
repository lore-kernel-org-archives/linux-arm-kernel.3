Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474C1C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=; b=eGA1SQhzeFm/HJKiRMAnOcJW7h
	KSU1lFgahqpx3VCaUf4fNCCGN5L4jPPyZy2E6Wg6unUCf3R4S96Vj0St1A41PULVqPD/W/QS2FdcQ
	JnUpATjr0LVknp6xsiaWS8mxjk3bDqcBNq3v1pjewFf2JVfR8dui2C12awORKvY41l1uvrIgq5B4j
	8tU2wYShVP1kIp9E6UwP3DXl/NlU2qaE4/0+mrALBOdKKyZye0x3Q/T6C1d8I7t9wB9KAO9Gr3J7b
	d3xNV1ZNyqrUhGICLGWUIbrqw0CAJOovWhXwnTf91aLVYcYTXzgPfE0CcR1sqtK9BLXF6DBfbWHmV
	J5yaj3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNr-0000000BPOD-3hJo;
	Thu, 24 Sep 2026 15:29:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNm-0000000BPId-1UG4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-488615e6cfcso442605f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263748; x=1790868548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=QPnGJRgJzb5NmurY53YZMC2KYKbnrebpaCsnpgjzhzZcOnEFJX7+mskJLPnWQhSP1U
         YNBVuX/NIRFfqaf/k3v7JKSiLPLSZHtslmFtV81heYgwwBCfRjaP5hI7gocyUb5QVZ/x
         zGSGtOGEcxCPg5n0mINpFeP8qAnH8LJ8OfzrFFFNaADGzfT6JmzjuPTbFaJA6OkEGNdg
         ui/T7bysxtCpABIORZeViNzuaMp+TVdsHEn9AEbNCLDThiGurvTu49tsY/iRiWQajpHy
         MGjqREkRXcm2n6zC66CpmJw3bpOdib+ZZ7uug9O/TjBQ0KZfguZcRr/c/K/9WE+R5d/8
         PeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263748; x=1790868548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=ghzRTvlbgfgXrV4zTBS63+ZxIDY3Y/bE0n/pVnhVgcSjiHrVq/yidlVD0N/dsTFq/t
         wd1cm5rHtLJ1SnevMATmVyVxd6Xk6iUnEPUuXUhFouAaYMKg22kx5p5rkdp6b/Ae5PlH
         Q3JGvr9i+Riva73RhbuSW4GteV1yT61C/peIeXrmFWFtys9NvbPPNBT20yib7T/AzOas
         TFys0qItBdMQjMxV9yGqsQmtwGYEUWx4gdmi7EQ4Du0cmu/gLbWWNb5FdoI4M78hsmxx
         qQeISgLy4WgGZ+Vhr9xHdE5R+Hi9mQboxjx7gVY8RnqKKl9Fn4IrCS33l/LPPK1JCwVw
         jEXg==
X-Gm-Message-State: AFuF++k9v6YQqxmVkEkA6ATqRjGrkIetN26G9n+rCw6uhCwyEKw0VRsS
	bPQtLUxAK7LJv2vuCFb2A+NAhsnnWJEqFMpWg56a6iPoVs3h/hb/8x7ktUyJjV/2ifxKL5aVtW3
	x5BK0lfw=
X-Gm-Gg: AYBFou1tcUPyNtXCmRQ6mD/LN/b5FhTmgkSZcwxfpexegW6S8m6QntJXSedOBYxNNjc
	yNUG2xkWxW6Uen//o1QR0hAQmPzDDqAYDky6lRUkMP5w7vv4g5sZ0rnHukP1Mz1m6uqMkYOCIcU
	lQ0bCreoL4BijuZ6UfxNEeaX8SsYaql4M5E8DsvqmgbDj+Ns5c/Q6Us37Wz0x+mOHCY2iSM8euS
	4kxc2PPHwcQtR4FEFlFDhoIyazxMAjbJVew1hohyXUnID9sKZPt0y9nuiTzhoIjLLCTbIzQGqPi
	ii9YEeelOHT/dXjJO3Rs/Wf33Yr/OqYsHQDRg+iYasXZSxbEvj7Z9en1Hm6k2c/U20JbbL8tCg+
	sOoqaq4V+oplQ5kbAhmE2oVJquJ0BRkJaLky8m6dC67YWOfEwagPISmg71SHdOX6HSIxV5K18go
	RzfJ2H3oyOJvcEmlvvYng23fugqTf5QBvhzkz4BfREI6GA5Vl2nr4CcOO6sW+7add1z+r89GHxL
	LR7Sfgn8PdSyNwBlkpGyQTkR0ZOTYM1W4MM
X-Received: by 2002:a05:6000:650:b0:487:152:e57c with SMTP id ffacd0b85a97d-488716a4f90mr5500385f8f.1.1790263748191;
        Thu, 24 Sep 2026 08:29:08 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:07 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Date: Thu, 24 Sep 2026 17:28:39 +0200
Message-ID: <20260924152844.81705-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082910_409305_F454F20F 
X-CRM114-Status: UNSURE (   9.00  )
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

Add the vendor prefix for Tibbo Technology, the LTPP3G2 board manufacturer.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..8a984fea11c3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1728,6 +1728,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tibbo,.*":
+    description: Tibbo Technology Inc.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.53.0


