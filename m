Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80888CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cCpO3mm93VdvLC92oeje7VMfvdRi9PpFQzlDPGKJXc=; b=Y7BaSFFpgWJjX/7phHG8jssBxi
	nN9Mp2RPr264y5N9sWuGRXRlyJqRpj5U+/vD3dj+AHxeLt/vX3kYYIkhyy6D+W5s/21itqcFuFV+C
	TE+a6xikGeAepmAo2UR/ru0YnSHNtfMg3qT3uZ43xoxOrutfaDFLSp4/6FZoKNONAR5Gdhp/SpZ2E
	DLFxqyyZfvVc7v+Y2tUXMgJlxE0cnVJa/S5nhXHoXHBZ9+EeMHE3cyGOky6Rv+IVehZ7j16qiZJhv
	/R95fvnK+iXB8w2a12Vj/6neLSWiCb38mdYrdK49mj91Yp0rNTmyrMZ7+yn/8WyiQ9huASmh1AYyh
	h93rtrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKE-0000000EjC1-0qlG;
	Wed, 14 Oct 2026 07:22:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtK9-0000000Ej97-1gzg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:22:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso34869105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962571; x=1792567371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cCpO3mm93VdvLC92oeje7VMfvdRi9PpFQzlDPGKJXc=;
        b=A3uA57V9fPZlFMHEAzouo2FCJB+EeT+EArlMQiqVuYqu7cvtnoCAR0FvallTdkgwvb
         f4VeYI1SR9k88F9mQx3niH5IS8/Yak7PrjA1cyq9k8Gjz+SKQzyzYbnty/e4cgtQsqKi
         CZSq4KUdjVKqLBrmOe79E3OfMAH+JY0jSR5Cm2luiSfqQTv13QsyuHwM+XXo/CyPDIGS
         iSZYqIWYssJ9BjrM+cDYXNXZU7+cxE1Fi0J/ULcfsFh2DhW23HrRjnL/XDxgCnk83T2W
         Xib9rF6c02DQbBTxc519cgrM8wYg81wINV6bY6NbEf+9RYgOinZwMMREJx5gGQYw7ofK
         I0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962571; x=1792567371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cCpO3mm93VdvLC92oeje7VMfvdRi9PpFQzlDPGKJXc=;
        b=yZg57GsBCtQ55/QkMslqJHSvTcGU6i/en6c0I8zQWqmtrZVsjv/aCzMmIQPttFAaSB
         rKp9pNPyd8l7lgnLSb9WpwZzpsMiQiTV1jE9C8ydD//Hij0auXGgzjfjHajJqvNAjFcZ
         SiQy6jKoROH6ICu39XdxfEb8ve6wGJyrR3TPQvphW8Uvp7PIgkpqswzZJi8kZ75GV3jd
         FznsFxUv4L2NeEGPLQcv+CSz55jLiSJT0Wgdbs0/nVbCUBiCr4EtrAQUxwcpMeeifhYo
         gX+YtSOdsiadrdreE8jGodgl2aZJddYKVdmi5uIjDL9mcXOmu5OeEidch13t7NzxQ+wn
         V7Bg==
X-Gm-Message-State: AFq9FYKS9rPkA2td6/sYueUlfgl3m85MYKvZYxY78DjYdfVX47PZ4ODT
	9VHBeXBEpojGL5BHeeGGt/LqBS5fySiZAcdMvK6NR8SBYg+d/5OO0YvLrgik64SxWOJFlw==
X-Gm-Gg: AYBFou2yEwEoWjUwVnOxTHCA+7LgPLEpqiSJVte/20XZKHPrZL+WMQyjX1QyIDl8YZL
	8ZqdoJN0hs/6G9U83IoA65Nx+34ic540CJxldtC3fsL+cRogdiodY+bgZ6ecOWAJoclOeGkWQdT
	ekSRA7EECyAR3yTrx+gcDXTllXzIo0U/KxVrGuhsuwvA+stNkXu2fGDYRH3ssTYpPWauspExH5L
	1/JydSz51KEqyVqae2+RbrCN9wexoOoNqES678pRSvxR+pj2wH3yIlKGNF4TWX1xUHxkuwWqZXV
	brrBiUxu6GJ2CHmO6/k0rxf9d84+iJzZJqvToHmScdSQaXsDwrL8uXsn/W4v9hqIP11IJq8ZlDm
	WirqUtgEALsDkqzTS4vlls3vQ78rBzjSZxIjrwmZCt2Dw8wkWRLnGj9/fRT30qvRNvleKghoX5u
	aj76yRogkcmQQ2k9r3guRUbqxZqLhtW+mpoKSr8W2/cm+smeKXiiP/pALHGdNLqaUicmXKaQyhn
	7HPfuiIi3njCk/6EfJ/aVncW0h8K3z1dAoszcZQ2qJRB75CAjw0+yAWJ3pdqqPq+ZjggrxOvvx6
	wce+9NSgsao/Wa164Ju9kzkBG++jX3WZcs8kpO/9LxLo5vmNgP3pLz8xk8iZnA==
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id 5b1f17b1804b1-4a1ad01f924mr86376325e9.21.1791962571262;
        Wed, 14 Oct 2026 00:22:51 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:50 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/24] dt-bindings: arm: Add ZTE ZX279128S platform descriptions
Date: Wed, 14 Oct 2026 08:20:42 +0100
Message-ID: <20261014072109.1759502-3-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002253_481102_D17C3220 
X-CRM114-Status: GOOD (  12.53  )
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


