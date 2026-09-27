Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1943CCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=; b=VmAFoipYLBOTBp4IG+A05wnq9W
	DcH9+g6A19oOq5u/QrvKuF7JwiJi9kzaOknxvbX3jAzlgzeMwd5u36ORusnfuQyMSVtSIPyJ3APwZ
	93jUTBTNW7t7QdATnLoUKoIK6b6UykmIEHLrC0DiLp0GY9eKNeAFC6h3HWlKeVwrlgIYlaajky8Ua
	1KVY5f9Pk1MVRCWPEckA1yVEZUIXmiMSoo31P0Ja17FNOK/jtUSam4ebBusW8vlas2BvWY7RGkzJJ
	79FIviRALs3EIow4ijZ0FP2Qpdz+VjOV8jRC4DFyma5MCut8bGFtgqgZFmHOt6jzrUJhBNzvVEK+B
	+i+AWrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYV-0000000GV1b-1PyQ;
	Sun, 27 Sep 2026 15:12:43 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYM-0000000GUue-1PPa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:12:39 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f89so1404373f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521953; x=1791126753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=VWQ47tYi+gwqrewb4Hcks5wC0nTA7jvRI5o9pdXMdgy4HxvaQQACxzIqZkYJ/aWX2E
         xC9Y+/P6/rJkKuQa6VGnmqvi764cFOpqqqbalTZ2yJjl1qZz1GVXzh0HJB0oRvI8M+Kr
         n5gPpE3nYTjkuM7cTGrWFCOKhpj3EyIhxEwTxAqSs9hVVhFr3Tr+yB4sRSHK40eMwgcc
         VWaOo5oJtcn/vjOdyhzdrtDKzMINhDPUkF17mN5aFauBd6PU5p+LGWoLbo1MReWmUXUA
         AbSi2Xj99c45ZLM6NchI5dUNk3xck456vxqC78qUk4+oSAE29b8iRAMXeu3rH8gh8Iyd
         RlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521953; x=1791126753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=eTaKFp9nOBxJhrmR4P+6uBUi1JgzkXSo+J45Gb322jxGpO79Y/vaR4lL5gsOwCIjtS
         JCIJU8Ro/dWdw8VoqEKMIOxv3oiWjri9OgT2VlAfTVtDejNb0UdR50t7NZHqvagA5HRd
         Q9pOivB9ZZLzfqRDUp47zBrWIfURcqxwJfKO3DI0GJmNM8jVALPxr1NQiO7dXpoSTQuW
         Jf4aLoH6JsYb9lBRg2oyFGbLdHeNIom4MhnuxrznlcDTZEtWkEU7mahM6TEVMZtsuU9U
         lFxKQ6S13Q7Hp96XuiyycZtZHjgYHRB6ZAPSLTjwQn3Lhe0LbvwecNkGWlT10V8Psbh7
         uukA==
X-Forwarded-Encrypted: i=1; AKwUvBxNZi7As1XtOyzEOSOo5GUklTi0vXRicipqv5QQJKa/0n2K3TfuYWP+VtGzCYyfZxpzjYc1RRvO5JnOzfB1exFQ@lists.infradead.org
X-Gm-Message-State: AFuF++kwisDbakNuu6AUuFid47w//w+qmo2OoPOCgCqi5rRQs5hyszIS
	waKtK1LqcpYyWXr7YEYSN407IotWKerDzY/DcdaxRS/sv4S5n3R1XEwrK3wBJwTtj8Y=
X-Gm-Gg: AYBFou2ZHaxOtzrMcVRivecOO/mGdm2cLdIhdsAEJ8HVeSFZceiTP1wN+bRONyiFSTI
	J4kky6TVaw8S3rTRrliZ6rI2hZ3xrE3jmcUSR6ARsQUzJKod4TWLKHIFc+lDkzQvD9C1DCTozDA
	3RSymX/jdLRSHUGcXvaHjj80s86JFwKIkvuDZzcC4+06e7SUUS+9eWytLwpwqHSt622gHubbt8Z
	4qlRY+aHaZ+LJuqMp/ik6Q8bLzEjQUkf+2kbF3m3+9rZ5RztnoNzHbSJ962O2ITWk9HeNwnRi0+
	O6JZEI3PbqaOnd1dppNbK44wUemNOJRRi6L+C5uMSl3Ai45jS6RZk4bWr2lFaMa5Ol5fDSKWOWk
	nQzkubAzUG6RmBA+Kkl1GRiLQY8EDCV3xyWlrRic5GDQMhirSHmo9J6YE2r39zXzLdNtKFLrJjA
	JvDNNN3WZANgek3G31ujq/axPT7vVqhDbNMSxYQPuT4/jFTHO/ayuxWd0XGR1ac0rAYpzXb1UMN
	ItnLpBoBXzbeodocmVR+SbJnqDUmqgn
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr139499825e9.2.1790521952673;
        Sun, 27 Sep 2026 08:12:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:31 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:13 +0100
Message-ID: <20260927151016.186493-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081234_382769_D7EF9063 
X-CRM114-Status: GOOD (  10.16  )
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

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0


