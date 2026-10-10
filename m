Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A97ACA9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHO7lW8dXTEw8No+XY9Ehk8i1Df2SHzGS4HhV6BQdcU=; b=JK+UobdOVzTIItEw5VJ5UQlTYO
	++S5aKgYnuxZCZWwFpBv1Bv6mxks2vkEoNMM9GwpZW9AUzg4Dvr5FiFK8JnccjiKB8Q+fAfU8YeOY
	o02xnILOS0BhzKagxGGHVZqA8rqW+h+/0txc+7ndzk1ztr2RjLoeRd3ZouqosFcqQjrxzzu3iUrG9
	p1grL8xTvgwRbijqcenTHKCXM65nBN3rXz/gNGD6YCYmqJfLz0a3pQ0aK+sOeUYFsix414f8HhFgo
	n5CeIJibuctVnXMQDApVevxp5ZjwWXeXoQQTVsRVmhtJqjHYtyr/Nu8tfEMm3v2cCF3+a96I/Zgbo
	vb0ZNOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgx-000000083Mb-1BBR;
	Sat, 10 Oct 2026 13:00:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgl-000000083Cu-1Qbi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a168355946so1949055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637234; x=1792242034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHO7lW8dXTEw8No+XY9Ehk8i1Df2SHzGS4HhV6BQdcU=;
        b=Haj9+0ASXZEgoBeeUOmBejnb1RipmQxi8/Pq/vym8aOa7hNYuSPcJloYDfrns1T67F
         pgBvsLDI8qUFxl/IgWR2NalAI/7t5P9YVLBtAtql+oPYbtKUEKA5ZIlWAQZhezoS3sYV
         dJRQJYonqM+M4lbCaskTbVfM7Sl1b2oXB+RwvrgGJrXqVEjTP2LMpOli2XaFUMTboyqT
         xRXgbO9A5P7IDBdwtkEwJ4LYc4sGQ+JKQV0+c7fGIxQvKqtUhEcHYpVOSCUNlNI6ZiNn
         JXg9TCk7kB4CXoEt+QaYUNujVvsqyTKqPVFtH4EaVy2duJvflVNb4vU7YKJNOZVK1YWR
         1n+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637234; x=1792242034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHO7lW8dXTEw8No+XY9Ehk8i1Df2SHzGS4HhV6BQdcU=;
        b=a8n1oUv8WiqHkpWD/Qf+nmkYxatyQwabgTvf9o+AH3KAIY/UVC10vhGLqOltayXb87
         O3TXUyEdFzLwXHzkehLm4sDUneQ64RBhu/eTZLvOTLBMoAOzJKVacG2+RbeSkq4EbKqm
         OiICGZkBc0N2v4i0R4zfSAWemTPwiJ9d4P78zrB7oJVlrw/LQrQRfGwYvjzqOiBWMUJ9
         sJvPnfCMy7UbzYWNQo/o3UxP3ITCLgUzkHPmQSIyiPZYyoyCG1H/RgBm1OcV38KO+xJq
         DqAJFLddmWWZrqw4mFaFIA5ie7SZg54r8evRd5eWbsAWwPPus92HjOFP/R/1uaKaV86Q
         gTmA==
X-Gm-Message-State: AFq9FYJS+ghZVBOOjtkwt6+w8SI5/4kdXbOS/1/cilFy44u4/HvOIzGD
	x1kJUxjw3RuzX1sMn9wlY8ZZ411W49zd6WBGwnO+2e5xYCTC5VUHij5xjf8LJztZvWAHRg==
X-Gm-Gg: AYBFou1eAHCjIHJ6LcCL1RvM/AT4XvBzEPzmoJQetjGO4Ojr0690f4LgiDR6U/ys0Zp
	0+qhiKsoxFdLNLnHyddwfLzDOdCPZ2LFHp4W8bofJrpKVfeQphTjF3uMZ1NR48F/qiSNmTLOvde
	SqpSe1/CzGoNHXIPwlEu6V1fDoWgdRmRbHSvJgaQMn50crazrtA/YtRSOgnzX4zEmZPcdbsY2dz
	wmBNOtIvHphLtpcv23yjy+Kn4LMrA4Y8jQGLBBEef9ZNNnEZ2RlLsX8bcrmgOCxFc7ol8DbnQSY
	+ZhgxzKc6ydIVdHA8Pwr8kn5Yy4VbMD4bOVs8lpfBB4H4A35XOyBDIcthzW+QBpALs7fQb6GuHQ
	PSgASDlAhzb3oehvs29Vg/C5dm+9SU/9o0Lw0hKbYM6/I2XL46BZva4KDTK9QpJNZC+5g2ZOahu
	Z/9KhBE7Wl0l2HgIr+jN91qIAe42urmHNZUuvHcgu8sMFe6WsKTzaB+a1kkR4v3Jbd5a4dbvMRi
	ORrFlGgIaIHkntYoMVOGPYtXToJhhjMBEf+lbe5ZMyIZZ/MFAfblhX06lcKUzEyclg7U5cCWFNa
	aFO/9TnF6NfoBZW1p7scjGREsaJMCFXcFhpgLJo/j3sMIDpc3wnnzWkvNc+xpEjdO+NSTeMn
X-Received: by 2002:a05:600c:4594:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a18e4d6ac3mr87355405e9.26.1791637233643;
        Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
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
Subject: [PATCH 04/24] dt-bindings: arm: Add ZTE ZX279128S platform descriptions
Date: Sat, 10 Oct 2026 13:59:42 +0100
Message-ID: <20261010130024.177503-5-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060036_465749_9F67AFBB 
X-CRM114-Status: GOOD (  12.72  )
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

Describe the SoC board compatibility, SRAM used by the parked second CPU
and the SMP enable method.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml  | 1 +
 Documentation/devicetree/bindings/arm/zte.yaml   | 8 +++++++-
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c5840..25a141f80b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -284,6 +284,7 @@ properties:
           - ste,dbx500-smp
           - ti,am3352
           - ti,am4372
+          - zte,zx279128s-smp
 
   cpu-release-addr:
     oneOf:
diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
index f028d2cec7..a1a3742219 100644
--- a/Documentation/devicetree/bindings/arm/zte.yaml
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -11,7 +11,8 @@ maintainers:
 
 description: |
   ARM platforms using SoCs designed by ZTE. Currently this supports devices
-  based on the zx297520v3 SoC which is found in LTE routers.
+  based on the zx297520v3 SoC which is found in LTE routers, and on the
+  zx279128s SoC which is found in home gateways.
 
 properties:
   $nodename:
@@ -23,4 +24,9 @@ properties:
               - dlink,dwr932m
           - const: zte,zx297520v3
 
+      - items:
+          - enum:
+              - zte,zxhn-h3600
+          - const: zte,zx279128s
+
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc68319..d1389156c1 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -104,6 +104,7 @@ patternProperties:
             - samsung,exynos4210-sysram-ns
             - socionext,milbeaut-smp-sram
             - stericsson,u8500-esram
+            - zte,zx279128s-smp-sram
 
       reg:
         description:
-- 
2.55.0


