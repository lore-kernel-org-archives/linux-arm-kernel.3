Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD4DCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=; b=q12SAzyRGuJ/1sWAFD6KV3q4FW
	sCtw0yItu6TRhJOK6AUZCFbrMEkpm59up2YITgwlrybRgrR0iIL5UkmF3vw4uP8t4AzjHb8dkiCr1
	miQuL9UgOK5hYcOt/pUWvQqJLFmvIQpixnWHCh871ucdeA4uSi4biPklXuGi/3uKhHH38U92nLeeT
	OxbWppriCK0EFp16riXJaTaAH0sW5zKFgXOU73w5m2RNYUjIolUHo5hXfQcyD2tTh+JxQQ4AGXzD5
	Jz+vPV+ba5dnB55S4JWd0aX/O56XGxyy+V2FSGt2LgSz/OttogNS9qzYnBbnEtPan3kqNNkK87Wp6
	DxrBM1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyc-0000000AAe2-2ZLT;
	Mon, 12 Oct 2026 10:09:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyW-0000000AAZ6-0GFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:09:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so15521305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799782; x=1792404582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=NoKb7xqsnfu6lEXEKxiNznBzfVSc9dHOB5zT/6J1PVGFq4bwKfkpjjboKktkG13qUJ
         G6w1R61ryszYLsLmsS5qoXNUHg7Gb9OId+BSCgzhc7jQA6i8TlB/KrAm19gfPRnqgYxY
         t9f6Dlt95JIiy+enDuyblnSLReyPkhcsgY81Omkx8ZK8JTkwbELWaF34KrdGVJjrbTXI
         sWd0QY69656FYLqtF2m42M1jD2OlLmzFYVPSv7qfUHBQEMRxEs0fUQ4BqbPlf8CC0vp4
         Rza+DECKu5uD4jA+7fv1Lwp6d5WxHvgaug+jD6z71OtEK38CqnIOJjYWsInbRD+ALMNq
         SfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799782; x=1792404582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=URj9SVJy4749gmCaRVkDyzL78QsreD9ZA/YtZRENURfhELCpmeMQC8N/MPHDvfZx8n
         21r3eUfwx1N8hESQ6nPEhOsvfvjc0CLq6K1mInQetaUlhfR7oAHgQZ34AZ28B9zQbkHB
         miKsqcaAUXGbg2flShFPdHPLIcQRcnJV1iymJPz6lk/90V9m7tKLj2NqibItvwsv65W1
         m1DiBK1ubO0TFQFQXpcClGBoV5RBIuqBQVUdem8shqlI1Gg1xCFvqhWd4iHqmCKHh/8V
         f24gf6ibU+KrF3BaMdUF0CdnzQKgk2oHU0fZJOwA7X5TXJKylJyK6hZ+oJfB56cnLtnz
         k/CQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5YCfx2h5U4t0H9nsW1gNi9vpRsw5nxMdvxzQwuQIjhGWLSrfSR7GOZM248L+Jzq3Ad56Vmi2FBhaOOdoUaDKT@lists.infradead.org
X-Gm-Message-State: AFq9FYKbSdFjoPbsTmEACi1TKreKStjjiRwA0QrfWLnBuamBtbPSHzVQ
	Le1i7u83VBDlyP5Eao6u83IkGyarQYUePzWvVoc6C1Jj9DUIdFdIYoM0
X-Gm-Gg: AYBFou0oXXpo7PT8/oM7tnR5oZ4NAdfmZASD2czg0jKD3rTBVTTb9sxAvDduJzLItw3
	fppYGqLaa0WRp0tgEfTrm5XjoB90L094Vi29XFqA67T2wkMmei+askCZNwnUbHQ0UChzwGLiYEt
	6uzBMKaXZszcf6e9k0EzrzFy9By4xG0bKuz9SU/UmigHjO/EwDfmvWtKjxkUQYpKWl47YH7rVv/
	Fia+/2b8bRS2zS+D6z3bAUE+JUZR6UAmyd7xvcOQYOXFkxcB3TC2RY1uMyz35nwAAlREd8v6bWY
	akvoOOxokXuNFQWiPJ4d6W1UGLBwM0YeYCjtpoZDfGDYQ3q1Z/q7BOq82CFq0tNZ42VSOQzx7aT
	2iAAQMvKq7S8X0OLnKzo7Or+w9yEX6yuCXZgF4tDgB/TcUe8ouolC9apE8SyAdK6dzLJzLNpz2u
	f0AXsYnwZiHYjHPnLR4HSWYwuI6TaG4L9XWhXqRtovXhCao6JO7OiQCRHeokF0+T64nQ0g3NTEw
	8D2WeOAFYLHLnNGEIGtNT1J+v5SG+mVBPzNrwaidk4=
X-Received: by 2002:a05:600c:524a:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a18e4a54f2mr179156715e9.24.1791799782124;
        Mon, 12 Oct 2026 03:09:42 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:41 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon, 12 Oct 2026 11:08:13 +0100
Message-ID: <20261012100816.331033-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030944_178568_60B1254D 
X-CRM114-Status: UNSURE (   9.88  )
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

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.52.0


