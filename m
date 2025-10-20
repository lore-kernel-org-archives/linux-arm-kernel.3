Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78CDCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWcuoCKPdDJm2TuKaUOD3wYJ8UpWoogH56aNLChKmO0=; b=0pn2/IchZtxduun9M/geoEZhp0
	fe0J3m5cwJKQoIJbL5DOpXu5QwVAzCY94ztIZR1vfiEkNKOV/9vyphdyEOhp/XBHSuH4FmQ1O71a7
	aVU7WEnQ9qVPqOBKGGINyDCJ1UDeTuqgDPCCntFJleRKSPFu/dalOAKuL7Yo5p+qyg9cMqrD5JP+s
	srAyhjqs+nkOvKyqUqLUxtZ+gOYD+hGXjNlkOBwzKcfMlu8F2WENvVyTSRa82eXDMHltjCufrd+JP
	u81/1g9q5JrB8aF3C4go5govzfx4bZz3SfDpy1t3zR4i5chBG4ANTs9GWrJHfml8QMI93GnH7uZ0W
	npz86e6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmce-0000000Cfxs-24R4;
	Mon, 20 Oct 2025 09:56:12 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmcc-0000000Cfw8-0o3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:56:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-781206cce18so4198158b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954169; x=1761558969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWcuoCKPdDJm2TuKaUOD3wYJ8UpWoogH56aNLChKmO0=;
        b=Zcp2ZESY8hjKdJJ3RZe28vum9cWCtxa6QPyfOjCwe3gZUxftjKHzy7mveEEs0W5TRD
         h47wpKSpdfqQ+8LZ0svDgYXlI8U/CB0zpfldJhN2JLAwNd+kEj/3mMFaHblDStdv545w
         2zKymgSybkBah6lrgnYYhzjbKSpMKdaO8lDFQM7Cge3tZtXo+fBaAWoemVbU4jXru4dZ
         lWzdEJ9TTBmnT+luKdCzUl1Jhu96INvSPsEKOuGSxIVWoWluITAFShYqHIOEmUafaYN6
         5z/KZZ/ivnk2/tPtmljY95eUW4FPUahMXqi7Sd+HubFNG2/sEI0e//f+/ZemgcFWeDlH
         pBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954169; x=1761558969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWcuoCKPdDJm2TuKaUOD3wYJ8UpWoogH56aNLChKmO0=;
        b=YOtm2RcIUbAnaPsY4kJckYf34fjQzjSl+3ldmhkB6kIhSjlcSKUMbyZN8ja0kzJR2U
         noX3KIplV9smpZ1gQ/nT8OMd6ZISkR1OwIdvibc/gGFSPQ2AAOfGtauBFXK7xQQLQdmS
         fw0k7aL7VK6BaoU6ZV1duiwfaE/G1h2v+J8SBJlDuRIXBGae6Ah2L37x8xuM8bXyKA1v
         Zny0SdX5pgiRfquoDhock93Bh643AjlNtKpbFIFezdAyxXi/Qq00M8fYbq6z8QVuDYjs
         YiWy6iuLjwLyJ+tJ+p24QkR7VMKbSIv+17el/Nz8iG/ekeFufLJc7phIrvP7aWN/tuko
         lSaw==
X-Forwarded-Encrypted: i=1; AJvYcCX0gNze5mQgBbZshb15FyU/2AobB/hXtlRJP+Rw/8Pvl3/+rkQKsA5VMwvU2ggquj1kkM+MHVrGgAL3hGUkJsRu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3WZ3K8lB4lThSVdj9Z6hCuUSuayeTPm1NlaurCbWyfYJG1gjn
	wgNuaeO7JQGzs0X86x1CdQm9RVmp6uhlhRlLmHp18M4YMyt11wDVJO2S
X-Gm-Gg: ASbGncvXJAQE0N/Okl9K5b8Ktu9ZLvDPFELwIjlkeKzWOV2jjj21v58MMcEvVRh+a2V
	sVXtZcEQ+X9HEIq2nV/jHVpJMBYDdKS2CPJYdBmXlesqxvc7sFl0jxoXS9gyiZRzoe7rPCFRSPy
	tkl+oKm6hY5g/kPXJfTOn281tCGFDLho/yx/fSyK8H+Ch8Z/XzUl367A29aJCeD8HnYljpnRkZD
	5C6OCBx0rUudzg8nZnPPCV2Hy2C6Br6qmL/Qa+oMu5Pc45LPyA/ZLNwiUYQH82bLYpzwpX6GC16
	AGHRIbj7P1/9qQGwuzVUrfFMPn6wj1DLil3D7on2FXoBPe96rlrRAoi7NkYF4cYXXZg6wb8etdA
	ptviOsmbTzUYVOdYyS4BY4e3P/YgX9bvghBpfn+YpftsbGKELAj0LzG6PHVTmXUkMg+fEoXqDqR
	Y=
X-Google-Smtp-Source: AGHT+IGIQ+fpkFQuGh96PYvhkgcTsp4EgXDaVgp46X6ZalhlUpsQFY6hZLjZrBA81Ys4H3/NGCVNzA==
X-Received: by 2002:a05:6a21:3382:b0:2ca:f345:5673 with SMTP id adf61e73a8af0-334a7a4b585mr15454180637.27.1760954169223;
        Mon, 20 Oct 2025 02:56:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm7819782b3a.45.2025.10.20.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:56:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Mon, 20 Oct 2025 17:54:57 +0800
Message-ID: <20251020095500.1330057-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020095500.1330057-1-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_025610_230443_C2900D62 
X-CRM114-Status: GOOD (  10.76  )
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..0f1523dc0e36 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,13 @@ properties:
   interrupt-names:
     maxItems: 1

+  phy-mode:
+    enum:
+      - rgmii
+      - rgmii-rxid
+      - rgmii-txid
+      - rgmii-id
+
   resets:
     maxItems: 1

@@ -70,6 +77,16 @@ required:

 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      phy-mode:
+        enum:
+          - rgmii-txid
+          - rgmii-id

 unevaluatedProperties: false

--
2.51.1.dirty


