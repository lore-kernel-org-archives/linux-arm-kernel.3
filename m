Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E416C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 02:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=; b=ezVAM/55IB+K1icdSq4rfXtMbh
	hOhnCRiOq/4rBZyN7e6XFqefjR0NKnHu52YyxxsjkyJgEn/gEDMRAl4t2Zi8kA9q8deJnt/uTfYVI
	YyXeermZ3WRiwqOTJvkXFULrRzvVhietiThOCs00uxufyvd82jX1b+6LpEeQ3rNsmNJAv1NWZY6uI
	sIolsIO4fbQyZDBU3CQwKROF62nvWLmNyx+a7Mk3OKRVjlc8cqQfrtYWM8sPLhUq1YDtHy34cYTJb
	2qe29FjN+qH6rOto7/W1eu91nY18OyVDwS47yNM03JSJvTsG5InyfN7o3HbAdaEcdaD6cpgOTpL3r
	+FqnjM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4U-0000000Fxb5-1gEx;
	Sun, 27 Sep 2026 02:56:58 +0000
Received: from mail-pj2-x26.google.com ([2607:f8b0:4864:39::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4K-0000000FxVx-0u5N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:49 +0000
Received: by mail-pj2-x26.google.com with SMTP id d9443c01a7336-2d747eb79f7so8716525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477807; x=1791082607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=odWue2yHt99HR3pvG2aKLP98lwM+LnRQXQEpVj7myQE8FWN5ZRuhGLkowP+gHa8H/X
         +UvUQ00hkJi7GmodKAs03TUYg2lqaFzCk+Z+uK024StOCJGlxcz7QyTNoMS5+EbD2Ual
         8OkUauehk8camq7SHNTOdc+s++h1pptIJ5o0H1kHdqeNl3JZbzM+9yGGe+fk/TMohAnb
         3oFMSXPuD7Qv1wvY6PAyl0miBjKSDdla75IF8z+HB1+M/pl9hSo9GQSrlqo8pfP9C23J
         D3lDT7zwlevs5dIbptsi0fE+Tc2tbYgzN4CxRfpNomRETv4Hwxd1CGNZQc4ImFYH/Cy9
         3Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477807; x=1791082607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=ICrv6nqQsW937lTzQsSLmX1gS7fmSkeUrl7jbsXy0swxylc0FKVWC8KQwM6mFMIkTx
         059NfzUZYvmwaMraH1WOShrzgkW+lC3mkRWzyn1pXXybLgxiy/UWw2t67qWR8FWbUsMN
         AfX4K0IJTQlAs11/Mwo0r16akdfj7d8cHqAQnzh3BUQUVO4fJOUyp8WVlG7cz6mmnW6e
         etNpt6klrDIjc9vB4lvVt0AqA29PTDGnb6jZOKYg5bcI9AiX/UJ+B0vun1QBu0BTKWZh
         EfSCrgU/dNsnykGeS8ch74jqE8jPeXQS+n7ttV3CVns0xy177WBGgdrdRVO9wl6+S0Vc
         cVaw==
X-Forwarded-Encrypted: i=1; AKwUvBw9xt2KsEiugj04Cld9mp6a9GQkdLVps2nNpPSe5J5QQ3/4w4JLaaAD+QkkgyU8aO579Qm+/5R9MHJKeiW2XuDo@lists.infradead.org
X-Gm-Message-State: AFq9FYLHQgNglUwTDpnnrid6QuyTBdr3V8Bbt1F3bGCPXGkh1IeO51fq
	TGb7LKT4lukEfY0C9GoepDfwMD/q6gI9roFRYKfPmxRv8Pmfn7UZCQdZw0W0AIpw+Q7Y
X-Gm-Gg: AYBFou10ajt9MrzxQAbLa7uJc0QnYuJJlGSarI1yEdybtgiBlNvclwiSxyE0CV9l4kD
	ZJsW2Qwu9hDZv5cV3AGeDTC30lQs37DT3pT59I/cInxhyZVrKFrsUmvlyfMOIf6qYSZcRENFpC6
	hU14cnmhPX6Nf0Fq2MImCPE4SuFiaZdVIK9dQu7lBMjhQPgPWWFaTuTbSyz91r1V3nzfwtdCFdE
	cdjcQGaEAiuidVnrfV0tLy8hbLiFUC2gg03B0WAYtUkuALdEN0U9MOgoC8oVDr3EVXdHym7SAuN
	nmN75fU6BgEgUYuSYAROGXR71Z70Cn14VqNZkpA8hj3t325O8d3uusNPGupffjnOMH56YF39Vbe
	jZm56GlggmOvzQaaVKQPZXUqg8IP4obpObfFDjGLq9BwCLNNgr6rH7ypHJpTr2DC8+oAfwFKu9E
	KStkoc/IPM2KLZlJ3hixb6Uyx9qubMmkRWpZAWnysA0i5eKWPHFgnIIJGziYUsh2hFjQ==
X-Received: by 2002:a17:903:228c:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df7dc41d3cmr92788095ad.26.1790477807346;
        Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
Date: Sun, 27 Sep 2026 09:56:25 +0700
Message-Id: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195648_325748_7B2185F4 
X-CRM114-Status: GOOD (  10.66  )
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

The D1 and T113 have a hardware spinlock with the register layout the
sun6i driver handles. Add a compatible for it, with the A31 one as
fallback.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 584cce3211..13f9a20ae1 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: allwinner,sun6i-a31-hwspinlock
+    oneOf:
+      - const: allwinner,sun6i-a31-hwspinlock
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-hwspinlock
+          - const: allwinner,sun6i-a31-hwspinlock
 
   reg:
     maxItems: 1
-- 
2.34.1


