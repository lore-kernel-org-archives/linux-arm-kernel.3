Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A5AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybEb7LoBEbAkKTzDnRy615rGgqf44SIjqzv0pe3EObI=; b=09cF8O+23NNtbyiLI+InCdGSCA
	QLibbt5/DWGAlianEMPYcdhRqXeJjVg2tSrJJ2VLxUU/MNklnPoeWwLBXo4TtJN0MRLaD+PLKxMTu
	4u72gpH/i0FdjR/E0psWf8oys7JI4cNvIkqfsjX13SF78NWrpAAinNz4BwiiveHA3k7V2jfEupFsg
	NFFGkuYKw3aZ/14YzOl7rEdaT4dpiVfoNi+dfCjDoaxXhu7372sCIW/RiMLxauC4gapMfnLF2ZpRH
	KWNjIFBAKbKhqI+p+GJDPr4p73NoDZhqVa2tNPcDLnPiXy9APi/RjoEywSDaYw9GCgwOinIhlAq86
	j9n7V7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaXz-0000000HO9u-3Y4Z;
	Tue, 30 Jun 2026 15:38:51 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaXv-0000000HO7h-31s3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:38:50 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-c9aea40d799so838298a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833927; x=1783438727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybEb7LoBEbAkKTzDnRy615rGgqf44SIjqzv0pe3EObI=;
        b=LXa2RfN8m0cJnTE+Ncol/j3hFDfpUdfWdd5hR27+cMmPwFkZT7k3vr9aeXMqC2Jr9m
         ZDdQRYrATbF+vtzeXb2gMtdGQF9LsjYSFHl0iWhAOhpVJ+WNVrTQNFsVvwWhrfVl7RZN
         SLjE0OHiGsfyt8wQhKjG8vUy5KYYfi6lXtN2RSwo9DXNLOBfHbbJ03ujSFeEX/6FTwmy
         PFQWzjcc6gutmu4oeU5r2UyzuYCZ0Jw/wueZSO4IpenL5oD9JUdVUIRgaogh6B+/ZGUQ
         LuWuHvpefXJ6SiskXkCKrKV9dWTDP5wa/T97WQBo0IPE4M/BmaB+WEMd+YUTh5ig4U0Z
         czjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833927; x=1783438727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybEb7LoBEbAkKTzDnRy615rGgqf44SIjqzv0pe3EObI=;
        b=HHPx4Gsvb5guUC28tH1CCyFHe2mZtlCDJRaXS2jwE9IJsh0QAVfkvQxRd8aONwK72w
         tVPmmEtdFWmWiIpe5ZQZnHPY3WyGarmp7PpJk6cpb35g8x6xnq2G+E9zrrFnC3Te2DPj
         KuzaEfzbX/7GEJVZG7geXjTn2Fpq/5+Fu+/B6c9CZxVycry7Jy/HSbGk3RYDsi12RWvg
         SUgM47iJfEig6mWkZqLJT5tEijkz3mEEHx2AyC7+ip04j2GFc2x1UFCiz/E1347dnqyg
         dnzi8hSiC5UlXk2GYhyoVAzzW3MkGixIlp1/mEEriXZqxvYtLjiFDSLPpgW6OvTWUBED
         BbyA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0D2JvotZHvOy5NIuqtE7u8rcsP84Vk1tYdEiskkQe38tpjU3c/SrDTtP1CacC7y4vST36LWc8+SDc0AimSsuJ@lists.infradead.org
X-Gm-Message-State: AOJu0YziSK6j0ots8SnSKIQSBs8ML4fSNp9bPZ4ZP5Uwe3C29jFrzvYQ
	C9ICQaMkinq+o1l03y+eYtu7We+KsgbMsJGyZkvPi5HNQVvAdK/CxVto
X-Gm-Gg: AfdE7clvlu9egCqHNk3Y6P1Rk1AgXrlog5JRUvafQR5gqAPzSV89SJCW7gZjOEerV2U
	fypj9BSlb+fph77Oq5LcOUmfNBfKcccGMLVS3YsTffCvh9WwgR5qvA7wWYFPxVP2QKSRrD0x8mq
	dV4S1KGyLIPDT/FX7sdHahx+Eovbn8OJvi0IK19YQLfNGmR++rVW4/2GtiALspaPOyqll3c4uxU
	sUE+YZyYLFPuR93LvR21v/uR6TGHTg8tE8Nzgwa0265xGTDAJMI9eZ4dHCJeGUjjU63s8Efmc7z
	Wo67nY98Hl3IUNap/zFUcRXaz7QB8vFZop2niFAGUVGM93JwRDn9uGC5bZduvnOi4PbrO/HUAU0
	bs0xvnI89yrsCgxCxBXnUXdWyRD2FSeQZwMWKulXQWo5gf6X3kMiB1EmaXK99G7l6hNcqRxdGwX
	INuqfnSkJY78A=
X-Received: by 2002:a05:6a00:6c84:b0:847:84a1:9782 with SMTP id d2e1a72fcca58-8479eed7996mr3558289b3a.26.1782833926590;
        Tue, 30 Jun 2026 08:38:46 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm2413695b3a.60.2026.06.30.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:38:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Tue, 30 Jun 2026 23:38:09 +0800
Message-ID: <20260630153810.3574714-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630153810.3574714-2-coiaprant@gmail.com>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_083848_568323_C8E87DEB 
X-CRM114-Status: UNSURE (   9.41  )
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

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3


