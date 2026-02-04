Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B478E95396
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSDNEyCwakS1Ym6Pza3YQfvhZWkeeNtC0qOGvxZYQyQ=; b=xECgbZZh9ninS5Cxf/+PjvxZMv
	zq3cM/JC8VRaqTh1WXtJzhFHNot6rAcPegLKLeuhlng1G8hD+kuESpJ3ZqGVf1/w80Q5B3790DE0q
	7vxw4He2iJDaj2jXNsNMkiumqfQKJpi2TFVnCISSC3BXbes4nLGyFDl94St32Pnomnn9hG8HgA1wP
	0I9UKPHBMntQFJuBUYOxFqrtKXFFFuyRoJ0aBm4Vt61ecqQ4mPDHw/7XhwXCknhn2GrcgffCrdC8/
	I4yQ2zgO2mSA3n3+/lCBwOSTihEBki6TOR9X4yhKfPAfKze2ehfyOFmfEeBWTgXiXJ+w47YK/UskG
	B2V6SmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncuY-00000008VWe-0THI;
	Wed, 04 Feb 2026 13:27:14 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncuV-00000008VUf-4AcL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:27:13 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so2793329a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770211631; x=1770816431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSDNEyCwakS1Ym6Pza3YQfvhZWkeeNtC0qOGvxZYQyQ=;
        b=d8sm7HCb4lNsvLi+tJqnr3D9XMEW9bsPxSvVSly5RlSs9xnIus9MJRLqqRg13yloBv
         1gBtKpeUbbkmL4t02DS0iy1sRGbgWFSHgTlAIPk2cBR+JZyvKjjCTXTvN3YYZ4wFKJ9q
         NP9/m9Yynlm9grxaUATxnMbnJ4octRtGD4fsjDdIrI1pltjxmJmibukEtUMkM52uelzg
         uBYsgYXiWTwU3ebT+8YSMneDYRjcw6h7bpcBixMscHLRIU15rCNgKpuIIrJ+Pitq3g0v
         SPMo2bI1fL7f/ZSiHI0QFE1RMM+vkcw/nr801WEhgmZPvxKaH842f0ZFAlYKtfPgNZrS
         tXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211631; x=1770816431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSDNEyCwakS1Ym6Pza3YQfvhZWkeeNtC0qOGvxZYQyQ=;
        b=PXYG7L+fnhaxm5yviv9PvXr1auMmEo6wAP6ewljI/Mv0w+l7E3WykGeL00mE5Gf/mG
         kkvbROJTtREI+f5ZU312CtEv75+9EYlhDRYSXXR81h0/LJHcXIUG43e6Z0T9F700oKaE
         OS686KD8Wej8wGmGtWGIVYPHUZvMsUMEBvxclbaIjsnBG4Q91H1N3APyNoRXwZjMiehg
         fth2PAo8m5DNPuxcx2Tv3ptHxhA0k4ln0qs/Hj20yBA5l+1yZdlVjzSDv32cq4BAheHp
         UZKWJClj92ufhFPI5/HmU2v7vSk0hfCbSd9gEOSr8X+bSTd3g1Xhemxq1lYBA0qT41dq
         BCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD3tgBT/9QBL/Ip54PNircpOBjF4lcpWxq2rkGqneP+8Ddh/dPcfT7PyrhWkVOJTQ8uMN8/x2828v6Eqh45Lk5@lists.infradead.org
X-Gm-Message-State: AOJu0YwJlRe5EI4HFLm4ZEFRAUGLtXrZL9pVwRANkkmiwZQUqADHDnbK
	WpAM8hoYTdHQ3t312CyW+257ZvIFWXDY79DJWU38oYCf+f3VuACovwJg
X-Gm-Gg: AZuq6aIuo8RtrmkKc5TYv5Ko7CM8TqB7sXwtbg+QABqeUtm0nKrRy97TBZe7jDlgLfZ
	ACSo1IQffYiFjVN8HB5LQbtJeXSss0y2PX+DjhuUUENNJ2ycx5x/Rx5obEDGQpIbPLM1Nz177ho
	CG7qOM1//nJMJYw6IRmVUU01L/jYHjRsKUG5PeJqmBIK3Y+5rIROjRrDjZhaEKjX3YBp8j63H7m
	hpxNKWU1zKmxl5bEqjxSrfRM14wWfNdQ5G8cphu8X3BsaqvoMJgpp+IXB2zv439fkjNqKzOs0pJ
	iI4v0QskA/qzZQDkkWu/IlSBOLmsMgKyNbo6PcEbSFrbfgS30IzkL3wLN572YOcZWq3jzx0h9y5
	D1+nJ6o5VwB1SpXfODYrjFiEy4TiRFtglcsyUaFc2N6KLBcsVMfik9Tcn/Dr5XbJE/p+ibFBXT2
	/QYgBhIAEJ
X-Received: by 2002:a17:90b:554f:b0:353:2e1:95f6 with SMTP id 98e67ed59e1d1-354871bd5cfmr2596812a91.32.1770211630997;
        Wed, 04 Feb 2026 05:27:10 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487726e6bsm875763a91.6.2026.02.04.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:27:10 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	andyshrk@163.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co., Ltd.
Date: Wed,  4 Feb 2026 21:26:54 +0800
Message-ID: <20260204132700.329894-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204132700.329894-1-jerrysteve1101@gmail.com>
References: <20260204132700.329894-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_052712_028447_D1F90A12 
X-CRM114-Status: UNSURE (   9.27  )
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

OneThing is a company engaged in edge computing.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..49607cf2941e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1199,6 +1199,8 @@ patternProperties:
     description: One Laptop Per Child
   "^oneplus,.*":
     description: OnePlus Technology (Shenzhen) Co., Ltd.
+  "^onething,.*":
+    description: Shenzhen OneThing Technologies Co., Ltd.
   "^onie,.*":
     description: Open Network Install Environment group
   "^onion,.*":
-- 
2.52.0


