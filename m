Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4D3CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8I8FDQ3AAKgDRdCnVtdodqX3Hu1DpXHDVZdy8LmKcE=; b=HDjj/4+coHwTKjAARg91DtS5wp
	4GPHB8RilwKlCqH90RiYurIPwGF1ExjM5mq6Fy4YthDU0GWluzRtStS8FaZsVZnfl8ryyTtaNwpIC
	8anPJcdrnnOALaQF0qf656OhyzRCXa5rOmEvhkJQwWiyMJ1Ozi6fiTN/99+QYRG78JQP0Fz3NTs51
	Z/9unsTEy+q5fgtLDGopK8sdEI9yXAztoNdf/qxLfNNELlRs0cFe04LVwaQt6jN5qzRfsVr1zmQ2S
	HzA+1MKJ66qACXzozrmqsRiRLGO9qP7GSGMY+6NaNrE17hcqcIn874xjGzJ/GQWgHMwDrgHsAUb8w
	96Iht84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgp-000000083EX-1zfD;
	Sat, 10 Oct 2026 13:00:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgi-000000083Bp-2fCR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso6256665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637231; x=1792242031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8I8FDQ3AAKgDRdCnVtdodqX3Hu1DpXHDVZdy8LmKcE=;
        b=ASuzVRRN3+MDb7zZBhGbdeHMiS3cDhWTPTHbU2jvLLzunf2lmOOWtGgmzO9e3k5T+b
         IAxBrB0+8pMZz5tEBJtdQG63lZaSxk4EoggpXM1As12QGwwpfn5UfC1hnmkKeJzIhbVW
         e0q9ywgAUQ+0QtO+33MB/TMPApXfizDwVQbogaEZXElbhcHucApPci8EGV1In5CjUWZu
         bQ7cnZG9zR+JLiZSBarx8XBpwTcW/oBfU/Vkj47MB0OBWMYhxswt8IQJ/mzWI5x4tIAi
         eFe+Wb/t+txZb3/R0PoIHzDL6jwwmxApYgZNq7YXPgU3AytI68PkTWSW1YejTG3RVTRX
         2hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637231; x=1792242031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8I8FDQ3AAKgDRdCnVtdodqX3Hu1DpXHDVZdy8LmKcE=;
        b=aw7ejjFVQlNQrRSdm99hx03Ert0iLtm8c5jbtM3pL6aWUBZVtnGFLnte13mGaSUgy+
         UjcWjfN1pkdckA9Y/YYloYI1fO+2c7osei5EtRCgCBii1hnAchb9ipWrxUrwKaoaqzib
         Ue7+saQsL8qqVMFr/KeODFo0J8W7FUTl9zrF1iImoGeQnQPpiOyOocYeUF1aWBIjeh1d
         SYWyL2k1Fky8n6PrEL7Ga94+sP6NwI7EbN2Ewby/j14cZaI7K+Orocwgt3dt16rbaaNv
         CyyGsKVo+aN50j+Fqf+Bj9fAxPywJstXWwM1YvsGrouQID3p6eEwXasMPIo2pDgwMb/D
         3EfQ==
X-Gm-Message-State: AFq9FYLlQgf0agjTYU3ppiO6P9MzdcQ7jkMMx5MekwO93CFwffJ7jMlT
	ITfYKDzMGRswaFAppF7pnXOLsSH85wV5prDpEtI++DreHvX7W5+FPASR/DM8D7bor4iyVA==
X-Gm-Gg: AYBFou2+RTo7DRL/mV2K+ANhfMLknpjqoR3NR2zsiFVOqFgk5Y5eJ+5DrZWl7TGCW8e
	B6RTIYhqTcLyalDBBc8/bV+FdQLkGupLj6Fes5Xq58thGZyduYBuW4URJnSYeB6qE82P0LgOAtd
	fDEadaxIOE8g/1rrBRXJe52Kn9dT6R6FojLcj7WTDqJ5WDL1QyuDuUDPZYGS/32w8howe4y4gt5
	rRGgCxOoB88Wq5YPemIWbTOZcR8oK8Ftm1XmafIPhKFztYv2iHwWyXAv1+cH74t9d2qDk0ionsA
	xzCratj1wRwqNOFXSTDt2mUg4dcBI0cI/yIDAummE6mpZ2IOk1CPvf61xkPearVKOlmeA+bEz65
	cs+FO4TV7G4HO0NxHfeVZU5+Uav3YL7mZugyiT3yW6OGxdAiL8Ya2DWgsmMbXS3/IzkFsMrRug9
	95Zj0hDTWWrl35z2uJau3fviIH3cbIeVHTP0R5GN16/Ue1O+uxJfD+/VDNBgzPQxz0T7s+I9sRR
	DVH+3gLEtBOmtUQKPE7d6gp2m5capIC9E5Y944OUM3nl8lYhaD/C2bFwemE6kqbvlca4fN1e9x3
	QQ8y1+41JBa5UYDSGdz1d9yV+U9mFb7vNcijE6HlqXzSi6M0XViz7c4eXRhy7Q==
X-Received: by 2002:a05:600c:19c8:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a18e4adcdbmr86641875e9.14.1791637230750;
        Sat, 10 Oct 2026 06:00:30 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:30 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 01/24] dt-bindings: cache: l2c2x0: Describe ZTE device-read serialization
Date: Sat, 10 Oct 2026 13:59:39 +0100
Message-ID: <20261010130024.177503-2-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060032_693913_D4BF76ED 
X-CRM114-Status: GOOD (  11.29  )
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

Describe the observed interconnect deadlock workaround separately from
the ARM implementation. This property and API remain an RFC requiring
ARM and DT review.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index ee604117ff..0295846cde 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -176,6 +176,15 @@ properties:
     description: enable ECC protection on the L2 cache
     type: boolean
 
+  zte,l2c-io-read-lock:
+    description: On the ZTE zx279128s, a CPU read from a PCIe device that is
+      still outstanding when an L2C-310 range or sync operation starts hangs
+      the interconnect. This property makes the L2C-310 maintenance operations
+      take a lock that the drivers of such devices also take around their
+      register reads. Valid only when the arm,pl310-cache compatible string
+      is used.
+    type: boolean
+
   arm,outer-sync-disable:
     description: disable the outer sync operation on the L2 cache.
       Some core tiles, especially ARM PB11MPCore have a faulty L220 cache that
-- 
2.55.0


