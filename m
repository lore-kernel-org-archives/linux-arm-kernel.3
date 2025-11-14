Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44659CD98C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/tU3ToM4CkL60i1rTuRB0FRIV+HElBhBmwOezkh+nI=; b=5C6fX0zhFeWlKKeteUUx7SlyST
	8VRt0lBgvrRYcyQ1cbD/s1eK5y5LVKUKsvKx5EGNxyKpwBZW3eZr51KVVfeBjWrwbKVLuMGOM7rfZ
	PBcUBJ1401TeujsAdWbQjtUqF1M6vUOobRmCJY4M+ahdbPZA6KnxwjVo+TcBROpmVx360Tqa8m2QQ
	eA+n58aEIbiw2bv1uYqnRyr0DK9cp+MVFp20nZwhyBRXNNASeN7QDcJ+X6JaP8ZyHsY3zv6QaB5q8
	trzKM4yqleO61jfgKEMdT7xPVmTQjwgxAgcT4INkdymk4TsgG4YeRSBH0awTtJGFESQ7TjemXF7na
	Cwg6SRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpo-0000000BLDH-2Vqd;
	Fri, 14 Nov 2025 00:38:40 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpl-0000000BLBx-1Glc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:38:38 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bc7665af914so59947a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 16:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080716; x=1763685516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/tU3ToM4CkL60i1rTuRB0FRIV+HElBhBmwOezkh+nI=;
        b=EmyG/mr87dYvZRF9UguSbclgw9D9RWa8dSx/OKUhxrNATzFRjpdc7F+anAdJ0tSO4j
         QiT1VtKMBXJqk8re40fE7u0SHSJ1jmZdAJ7purnbSKDcM121B5wKtlkdljJb/lRlWigZ
         6XjtncQD8TcIHVqG/+Er30iklh4bwJcNaQSoxManc/NmzUq8qbWWWnfL7tfw+g6f7d9K
         G5PyyoiAadJ1UnGH+QU/LX1d0FwDhdxNJLzjzEOEvqGR8hPW7N0TzaqRhiNzL/ATxS00
         9dbkQ9MJN9YysBAscPnZNROCMvGUXCw6CORhPOwJSl2vfxndHvDpcaadAb4tbIQpo+g2
         bIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080716; x=1763685516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/tU3ToM4CkL60i1rTuRB0FRIV+HElBhBmwOezkh+nI=;
        b=YXzr1/eMyhyz3TpMKvL+tSPBTkR+ICUEw4HuVx6CacXQUozncW5V6v5ztvj3m5TvzV
         40j1YimCeVtLjXrkCzGUevO3A35YOwsUGx0AS9IoE+94C9iYs7NesCcB8ObJkL6fWVs/
         YA8UmIogIZ4GDJqOnD+v3nIdt/gOz8T78nYNFvoFm0c7TO7snaQa0COw3IZtTFiRbbGT
         t+3iWgXVME0zfImv3gG1AxNnzlXGdV4KaaDmx0saCL5lsZctWsD2F77f5RHNUXIk/E0r
         1IxTiJi+AxMDa1TTg6l3ESS+5OHTAejTJJaLSNwa6MPLH3fHYxUTROvpyNE7mkPE7B7K
         70eg==
X-Forwarded-Encrypted: i=1; AJvYcCXxKBAjoSYlr5oWEHcjCPYh+y0C+3bwv0fRQNnpmIZfwrF/eRXyVXozOsGCj6cvRrADGOZqbqjzV83jKWymBXVY@lists.infradead.org
X-Gm-Message-State: AOJu0YyhoUiOhG1WxNyXphowHjjA2831fRo3wjrgYhIJIAoOO65VmXBP
	CVlCZ7iAjXTgyzWv880MykElDSLJ3wwILxWVPLf8XdA2kAk7X+C7h/Nh
X-Gm-Gg: ASbGncshPOjkR4QC1GePyDKNTjs3uHw5Xq6oLc7JilqNZBquRdBhnu3AyYJvQzw86va
	+8dK3JQesJSGElRsvYMJecKpTIFrz/TKxQAFczjFdipWImV5rxMGPxW+GToVGRlV6LTZ/7ooutx
	9wibzqCjOBauZKP4IoOyXIwRJW3NGXAVtKQ4ocQfUpP/wFIyJDyfulNVXxWCxREKTgyoAZaNuFj
	aMUFwpvgIz2zkvGLYPzM2gsl4rkOQ8yUf2Wrc4EbL5atfOaOoxgngfV4lhNq/N0/k9WScgRM8rQ
	4hWSR/66qM27zLvXKyrti9I/P2TeDd3eISymKe8O/czxj83EGHEXT1Ljk+QNj1IwrSNhM8yNqTy
	r9L+Y01zpkZFolBtkkj+0ppvbZu+sTHnnpjcuQ8p2iD7USuAsPsSQgZ0uW3yIvZyv8MuhGiXz94
	E=
X-Google-Smtp-Source: AGHT+IHOi5i8OOkvh07viYVMPYkqSx80JGxGxStktEkqORfwNsnc52iYhiMNXrcmkKVdUboZXQ8H9w==
X-Received: by 2002:a05:7022:ea51:b0:119:e56c:18ab with SMTP id a92af1059eb24-11b41504d44mr212238c88.19.1763080716287;
        Thu, 13 Nov 2025 16:38:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088604sm3636365c88.7.2025.11.13.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:35 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri, 14 Nov 2025 08:38:03 +0800
Message-ID: <20251114003805.494387-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
References: <20251114003805.494387-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_163837_340683_316881B2 
X-CRM114-Status: GOOD (  10.05  )
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

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..e8d3814db0e9 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,25 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii-rxid
+            - rgmii-id
+    else:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii
+            - rgmii-rxid
+            - rgmii-txid
+            - rgmii-id
 
 unevaluatedProperties: false
 
-- 
2.51.2


