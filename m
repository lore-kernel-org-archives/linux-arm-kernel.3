Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6898BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 02:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=; b=ZQU5Oqn4ItohV6/zQEzRU6MVBf
	+xzSRQEZYvKzjOvyWj2p/vksWHfhOrQtLD7ZEZ0r6rDjs7kQRBPDmkic/4HFr2pAywDz9EK3eRGGr
	0tKqh/Cvl50CIvDWV8DqdOY8EGxolP0p2+x3c1eE42N2CgQ+S40ycjp4cFHp4zoJs+PNQuLXw1+Bt
	5Gm1QHBx+c+p5j7bksZhcDiXG3LscIlmlm48UYlzkCJrif4elqEiINmyHPhpSTAZWZ0wedQlctkac
	3P26Se7oPlqrPnbr8Hkscmfycf0EdRbsuaeRWW0hOh7WkYYlA9goruNJ8vLWcLB8VK81mJ7HaSAKk
	nLSckg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6Td-00000007bXS-0KBZ;
	Thu, 01 Oct 2026 02:24:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6TY-00000007bW8-0uX3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 02:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=; b=gitWaCFHznEPkNsdd2gh0CeF9K
	u6RbcJRn3/Bv6eFsoVnwHuQMJL7rX32EdOC8jmyzNIVSX8S4aC7wc44tdVW7nFQQf86PT1sTmJqd0
	x57ucoT5gzC0775k65hcWtyK+Wpd3qX6XIjpFJQGAwpnb80VgHci6cOHLeed+mZ8pHfrqGFH6F47Y
	gdckxuESQifbX2gJBLwXOpsVRr2nXR1QFybP11ALTS+m732CH2qa2MR6KrgVPunl6oo1zi12ohvHD
	t/xquaUOV/cdWj0C0S17jNqvWqmdUj+dtu/2qrXNm07iG27hj9QEVh+77fZydvlioE/oV0IJtsanh
	n69MACiA==;
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC6TV-00000004Vhm-0jUJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 02:24:47 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso1996554a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 19:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821482; x=1791426282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=eAc4u9ithXfZTI3ZK3PNYupuTLwH1SwL1x0kmsOyvytmB9JUg68W0fFc8ccEb3HNeb
         532KflIR40TYlhsq6kl4y7nXtYBRLzyNlaHnH/tF0UsuYZwUhgMaGR/HzvTkG5mbqEkM
         zRzoVk3FkIAMIWVsOPYoWD5kr82bHmTSrYx4L2CrrnQiR7zvxuTBPeBuVaxbITdWmHvf
         hXRYBk4E8a+9xmw/ntXgTcvQFrEZjoDuKj7/8ftgJBAG0MuM9tomgP1915PxOJBhYcZ9
         3rYkRaddAKKcgKLwE4hrkof3G4j9teOthn017t0b1XQvV4W+TmnAkzf6bggPZh7bFx3T
         FW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821482; x=1791426282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=wSYe00uU0OGTMVuxoT/JPkDqgtP1k+mGgbzJhUyhs6TdiQfeWZFIA035sFvfeK9oMA
         SRAuugqEMfiqpKJ66xEoPe0ouTYKVVdCgtctQBDYlVyu8FpMx5EXgln+RUmdhecn03qC
         ri4Xuw7MQ6TbAdmAS5t+0pYO0GBLQEOhgbkmcBvwt8Tc0bC9GTh/7/FY/sSsgjevpssE
         ng2/Ba7n3uyL4jOl2EEi5nkXEGLgrjXEvsHUOJfoaZr72IypkZkPJn3heiRmTaePd0TK
         /+GDMTMqfmZLHf7FX/BO1tTDTKxCHMTFDe7B+3h3YNV4MfV3qGE5/KMGpbLq1fQ3W2AT
         Rdbw==
X-Forwarded-Encrypted: i=1; AKwUvBxZkqkVN7O5r2LgWTxocdYIOusoPm22BaqJi8mTs6jfUtFpVzk4Ud2eEVhblzGWCiK7mcjqT9yEW1Zwcs+0bQdm@lists.infradead.org
X-Gm-Message-State: AFq9FYIZ+rkyA7LL1L6Hm9QByX/+EST0HzLQzEW+7D9qiaogGmsmWSBB
	j0nbESn+0uH8avpnHGT1q6y/EdiSd9JIMePQzClKOZwge+i1gnFuYdP3
X-Gm-Gg: AYBFou3SD19ma3Lz6nUTBM9H8Z+rR4xMI2Nswv/4IrS1rPgX1u3BTVivel4tVmKF3TX
	V4D93Kc/OmqrEJcA3ubv2Scw1qkI5xqfgpJKAmo7REZSu/4dn59hGHrHbjn9TH+1CBSOK3WrRK3
	2ulzeyPa/APYckaMOss+L1k52mIDfOxbl8MNN7ARcnm5BRU6YTV2m6jhOoANOIaW+dMUe5+SVsd
	bKTI4e7223oH5262NMsZncLPCYRvj4SF/+5BZ2+yhvBub4DveuwqC04AwV94eLZZE/0V8vQ6J+i
	XAFcEDIo1xu/yO85ib1xDFGo0CDDr5og9uUVJj/Xgkf/ur3Y3qD75rXuTBllvlALebqn+dQJmEM
	FjvxLPzbSfzrLcT3t9qVMDk49RFZReGKf09d/rtuECqBriH5TLZfXzvfuw7PuL2leyoGIEgnEx9
	j5NkPiO2fCMA8pWw7vkFGnePICdnerPEYaSzgcUf3KRem5iy4zH+bAhbkvz/G7gg==
X-Received: by 2002:a17:90a:ec8f:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a4d0f03a1amr1882204a91.2.1790821482200;
        Wed, 30 Sep 2026 19:24:42 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:41 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Thu,  1 Oct 2026 10:24:13 +0800
Message-ID: <20261001022415.913959-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_032445_436751_06074675 
X-CRM114-Status: GOOD (  11.58  )
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

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0


