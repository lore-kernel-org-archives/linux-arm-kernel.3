Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFD0C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=; b=dCga/GRk+ra3tirHkWJ9eSysbB
	IH9wPu3I2b+pse2qOuqyQegPVR84SePWgfM3Wgp+E2wjEbmCulmU1hpxH1KxP9pT3HA+cAK0WiF/q
	JlELBtmhBo0X6owUwZi7T25GsDw9yYBTe/iXtdT6UmYH7PDhqnr+9CL0G7t0hcEodXHv/XzCq0SPC
	ivfIrcK0rnBGyF+1nCIm7yIISUUOpfb1VGsjm7XCjwI5qTKgdwpbG42hMLqxxnfLvAy7KHr6ZisSv
	ZI0vN6lcdQgxfOIHBfqnWRp6XxRlCj0IeGWWY4DoDh1y0F9V4e5crjcVhourRpZBwy+HJF7pvs1SD
	qNBF0Ksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TV-00000001l79-2GAN;
	Wed, 26 Aug 2026 01:30:45 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TF-00000001l14-3Xl9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 01:30:31 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e512a9a6bso18293485a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707829; x=1788312629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=He0SlymPlb20CpX1Ajondh/I2ZLwDo/z5wh8GMTQadpFLNiSsuoJiizXlzcPRfKLUP
         llEp9pECQyb+AUsPkjuZuehEuj9IVa1uMJFoXoXaMtjgwysR+h4+13EcUkNAC5M712UA
         yv2kGSKcdy4GTdxVxJPs1JCHXgPx0atwU2vFrhxnCP+s/f23ALTVraIqN2GvkacakmuF
         56OacOxVjDTIb0Z2k2e9Bfiky8ypKNMQso8xTS7oMv8juQM4UyjfUvtlU2cFDGm1bvoM
         yHkDLje3QgDc+5XX7wd5Zp6UqnPb9tX1Y+FsP/Zi+Da7JWcN+n00ELgX7yv0ULVyL/nN
         NRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707829; x=1788312629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=hNYlOI0+Ku8tJqqIr+eCTAPblLrALkEm5ZNkFs9/kZu1iIIG79P/eVA456dWlXGkVA
         Zg43vypcT72Gj3Z4/b6wQ/zuGdl5uhN7KsgjYLZRHSePBl7mHzrjWkm+uKjHsXhC73D6
         z00X1iOPNNMubdR4Pa4bpR1EmMCZgfjUrFEgm+FXx+7nbRghp65M4Pbrm2QCHz5QfL0Q
         Ok5OIr7y1x9Tw7+ZpmOEa8DXUoK4i9SDO6365G6VGAmxmN0ol18PmGzeYgMGBsZKv+UA
         I4AaZEsbAn2fRPOpy5MjVntGL26rX5WUxfLz4WBSEFgwovohnN2IOqdYhvvzaizTzAO8
         gERQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRsItOBscSkxo17J77bOM/3dVirK8HwD0qRssrigREUZo+6hSUA/QCm5h+D3SrHwrO1tFyDvfloeiT73FqOyZ0@lists.infradead.org
X-Gm-Message-State: AFuF++kRwaekr453aVIamcow8XwJAX2AhKMe5tPyDrvcUrmt97M02ryi
	NmBBezGCaGcj3/jiExk6peLisjgnahOxzUyMq6EsYMUwHPRl7P3kmhPK
X-Gm-Gg: AR+sD13ybEqbL9klH9EjfUEoj9g7hHvSYid+hOBa76Jdns9Eq7WzciK6iielm2Phm3B
	gAUOUepIySqOPc8bV5H/o0xkBD5ahH2CTZbTcSN4JFsG7k5lfQnECt9NWTVyssdIkhLWGi74JuX
	0HZj8WZUmbCpJ8O7PNY9Js3CUj+9PI2HeHbopNdAAKzIb9yhjg/KL45GVkxFilhRx3zoQto7W2N
	3hfwSWYgQ04vICGvhWxogv7fTCT8n2oCAPqkDv/lyVZOzNxPr6K5X+jiESxm63504Ucb+JmI1Sb
	lJJVCLYfbNOt2dGcqLW+3/UPgw7pHbI4oKKIYEE1JwIPuKau/mnHY+CO13HaJkKHZhdLb8hYdmr
	k3uODZuH7aNG0UQj3Km7S5O08jyi7ACpTBeP8R5g0gHo+naa16jSG/o0QDDx8cwnvIsz1ESKy8I
	yaUeGmKQEXoNToC0Y+M8a1kYM976g+OB5HIztS25AKqfEemab5owkY6iAInXSOKg==
X-Received: by 2002:a05:620a:29c2:b0:937:80ca:7c4a with SMTP id af79cd13be357-93780ca859amr248149485a.44.1787707828653;
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:06 +0000
Subject: [PATCH v4 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-4-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_183029_906740_630E6F9B 
X-CRM114-Status: GOOD (  11.17  )
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

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index c3e14eb6cfff..1cc3304b7414 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -25,6 +25,7 @@ properties:
           - allwinner,sun50i-a64-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -70,6 +71,7 @@ if:
           - allwinner,sun20i-d1-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
 
 then:
   properties:

-- 
2.55.0


