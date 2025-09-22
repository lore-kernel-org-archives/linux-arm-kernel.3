Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E26CCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=; b=3+NlmocHnG/d3Y3XwA+xkWNwCa
	vd1efceUJH80Q0BEC6wz+nC87rqY1tn3OTKuXcAhdMFbkjPtAm76osmep553f2T8Ljw3gUWE/FPgs
	0wyHSwnIpD8wwHt9FMXSDJ0ZBHhaUBa7GGhst1UCgb0wQKOknDRAiScC4fk0QNs4AD25xqGGaQED4
	Gd5j2ZB0bT6lWSOoSX8lOySx1rw9TQ8V7ZnoQfCA3QnYPT4suNbAGHaS/evzUg1LqyZzU2jPVQJGH
	Z1S6pzbccOcd//qeibKUxswXBqPRMZGjj2AuGg9s8WjRdUBoX582WFdXfTcySRKeBIf6FZeIHOdWA
	3IynNy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRF-00000009ysI-2JRo;
	Mon, 22 Sep 2025 10:06:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRB-00000009ypa-3l7S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46cb53c5900so11955395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535584; x=1759140384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=G/9ZV9RgzLIaY9ArhGCOiXX9ei5TPgO6C35Umstx3NEg3AklQRlotfmDVjA7eXdjFw
         mB/zI7sLt/Tn8eQsPxiqvms07vlp/5rJCfvbWpqrCMCbOT/xsKk+yJ/CBq8+2Pw/7GgQ
         aVDFTpxqyjoKI6GDwP7cqQMz3Dc39Z2jB9eeW6ZDkmkkUVGZf/vpxDySBDt7Ac+H2eOQ
         UV78lrkInEJEQLuj9EAjiywgKiiiQjROhlncD1ncPDwbI6q37dCDxTh1t9VmkTaf0rHp
         K2ddfhNdlhVshq0eBKI48jA4RzNcZOTeQEGX77wSIOa0qRBWhO3cn6uRlyQ/P/Oh9RXS
         FhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535584; x=1759140384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=ftjJ44Y/BnYtqQq05zayS4KAPxGT+YRtSrrLttcjOwA+w9yP6sM2ESVYOsRt3Uv8DP
         pj3mEwvhJbEtDbKzOSvepTzrsua9bkGS4vYQmPr2oeS13B+AfMYMBm3TuGQbk8yfNjhZ
         mPOqclBJt99871HvVSGYYoYk4r0Ncimb2DiiC3Er4siXgyo5Ql9DpqCn0K17F2DPm9Zw
         VMGcns921Wi7ckEOj4WCXVyC+w4amreiaPxXAp7DrlzFp83OHoTIoVjfNclcd1XhyKhV
         brp1BWgz5+1K4NVsXykWr9jvB92uy8sCKEuxu+cE5u09yd8CQpmC66Sfqi16b09RhOX/
         FuRg==
X-Forwarded-Encrypted: i=1; AJvYcCVv3B61yfuFYZoK+iy5s5dIOEuVOFYIKg8tIcHipzzvyaEUG1GW2D1cNqACdYjPwzQOZbZuaXf04hON59sALe2C@lists.infradead.org
X-Gm-Message-State: AOJu0YyUZ3m3MmkZIF/YZfAwfdAH8wmhwLCUkeuBsLy8ggy/7W7umXcK
	x4m6b/eA8AD0UoIL8rebSr6FEn98eItEkrm9KLUr75XC2ytdYZYYGsQt73R4oA==
X-Gm-Gg: ASbGncuLK/hSFa/K+Sj9nm/P7VDth6VQKN+vHdaO5+qBgXLpPHdmuuRAAcc6cK8ptlx
	LRSSQvTz1LPqZo61mmgoH5cXbc230oLMhn19R73zOyhSyqqPM/iEolhkKBSxhO3b+Pcefx/UKb7
	3VuzcDuc98HojxKIbpwY/ag3EQCDuU2tuR6goS82oQGA45490us8a/g4yQ0xBJuJxPrAAA4OR1r
	GsoOB7rm0JWOyE2mTbBKUf3rBASzGfvxjAIFEJ6XeGvE5LrDnO7VPomPlRjbCt7VPksMXnglII+
	ciMsEMPtbycCz0LJs2wiWKbXwFAg8roYiqZVdNiX6cBeQAQEgQ+7VJU8AwKy04jk6YurE/rvEqf
	UuAHJqld/DIJlreuc70rqgtmcxNyyrjpt0uK3tuEmQUZTZP290RoyW+hm6K4NvYiAUwJZEHmVKy
	iXqR6wIk32HcUpuHDF
X-Google-Smtp-Source: AGHT+IEFVop5uEIutiUZvrQjHA2X2brCgz/PV5Qh38EHo3qZHsNUBeotqexzMz7/cMiX8mPo7ObqSg==
X-Received: by 2002:a05:600c:4686:b0:45b:73be:c707 with SMTP id 5b1f17b1804b1-467ea00475amr104406865e9.22.1758535583703;
        Mon, 22 Sep 2025 03:06:23 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3f3c118cd47sm10016624f8f.29.2025.09.22.03.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:06:23 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:16 +0200
Subject: [PATCH v7 3/7] dt-bindings: memory: factorise LPDDR channel
 binding into SDRAM channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-ddr-bindings-v7-3-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030625_963495_44AB3627 
X-CRM114-Status: GOOD (  14.46  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

LPDDR, DDR and so SDRAM channels exist and share the same properties, they
have a compatible, ranks, and an io-width.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 34b5bd153f63..9892da520fe4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -1,16 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-channel.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,sdram-channel.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LPDDR channel with chip/rank topology description
+title: SDRAM channel with chip/rank topology description
 
 description:
-  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA, CS,
-  CK, etc.) that connect one or more LPDDR chips to a host system. The main
-  purpose of this node is to overall LPDDR topology of the system, including the
-  amount of individual LPDDR chips and the ranks per chip.
+  A memory channel of SDRAM memory like DDR SDRAM or LPDDR SDRAM is a completely
+  independent set of pins (DQ, CA, CS, CK, etc.) that connect one or more memory
+  chips to a host system. The main purpose of this node is to overall memory
+  topology of the system, including the amount of individual memory chips and
+  the ranks per chip.
 
 maintainers:
   - Julius Werner <jwerner@chromium.org>
@@ -26,14 +27,14 @@ properties:
   io-width:
     description:
       The number of DQ pins in the channel. If this number is different
-      from (a multiple of) the io-width of the LPDDR chip, that means that
+      from (a multiple of) the io-width of the SDRAM chip, that means that
       multiple instances of that type of chip are wired in parallel on this
       channel (with the channel's DQ pins split up between the different
       chips, and the CA, CS, etc. pins of the different chips all shorted
       together).  This means that the total physical memory controlled by a
       channel is equal to the sum of the densities of each rank on the
-      connected LPDDR chip, times the io-width of the channel divided by
-      the io-width of the LPDDR chip.
+      connected SDRAM chip, times the io-width of the channel divided by
+      the io-width of the SDRAM chip.
     enum:
       - 8
       - 16
@@ -51,8 +52,8 @@ patternProperties:
   "^rank@[0-9]+$":
     type: object
     description:
-      Each physical LPDDR chip may have one or more ranks. Ranks are
-      internal but fully independent sub-units of the chip. Each LPDDR bus
+      Each physical SDRAM chip may have one or more ranks. Ranks are
+      internal but fully independent sub-units of the chip. Each SDRAM bus
       transaction on the channel targets exactly one rank, based on the
       state of the CS pins. Different ranks may have different densities and
       timing requirements.

-- 
2.43.0


