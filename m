Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7052FD004A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oodNt4bgrCfYwZH+9SQGVgA9ysM9wAmRvH33or2azLc=; b=E3B2cSSUXVQ6QDLtSsDnGT43ka
	pvWIlbV8xCOk1b4hKL2mgEB0fA9HsSUY9CBWY841vneS4qOpNImccm/R1B40xvRVUjp7PVUGDNuLJ
	W+4jhCg4YtANmq9KZ8rODjaOorVIMQn4Ff2p5/Dymi7fjfk9XK0I73VAYH6vbDOIpI8NFVYwVE2F0
	t+cl4h/f3ms6SN6ImTsXdoKsPbcoYmLjMkH8CqQWIBIOivAFpt3azrDcfn18+e5nF5kgXhDA3A3yK
	nIQRaA6OaNkZXcOJ2XwObJ1QYK817ZvPiZCwv+TpmkqTt+lpnJYXbiZiHPORRB/GjHU8cio4LEe3U
	QowYzuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpq-0000000AQCS-0flK;
	Sun, 01 Mar 2026 00:39:02 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpk-0000000AQAL-3M8Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:38:57 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-896f5af3d8aso50869546d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325535; x=1772930335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oodNt4bgrCfYwZH+9SQGVgA9ysM9wAmRvH33or2azLc=;
        b=j3K554EAezvKpVJiZ0Gp2dB6+/oFQ3Z0qXz2wqTLXiNruRkBuKF7pdKY4NeGLr2X8g
         aqYwb+6X+YYZXA7iB5cNlkWwOFJwG6bYdke+9HauWFKten1vF3NxVJGb5P2ubs4m0CAB
         mEwG1Ntp/tEMDp3dn5JnZU6PxYl0V+OxYceuq2X1J2k2TWw143JEhoLw+JATrR0/Rtpz
         dRJQ0hObVpRnjtM9RAlfyoYFfQyM2/+PgpzSm48bjsRTdyXvC2xk2OIeAeWhEW0+yTyc
         lGgzBPp+PvGkc3SHnFoLJ+jNOWLyn+RZAjCFZBmPi/4WCKlwpmw2ZsZd+JTC5nNE1SP2
         KBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325535; x=1772930335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oodNt4bgrCfYwZH+9SQGVgA9ysM9wAmRvH33or2azLc=;
        b=EQTsOBDQJq46mQ+KOs1LQnRgiKAIgsCdof+WdoLbFAy82HHvCqH7uRL9zIoSRGiE4K
         zpp3kFkm/INhckNeQj2fLUO4Y5IkfzhEsDY2OfcUdQe7hVY/lYkGCK7h8kDTpypSLh5f
         HAKQtV4GaDzdAxEJ5AQxQkEMmaldFA46vpAFi/aGEQPnSRBkki0m+uYitNPbD2Otbeja
         qi6O5k8rxV5/RjyMoDy5Czde9RA3CzESwaueAo8rfieseGLy9uyWUfRmKJpE7aouiZiE
         aloOuix16mVMuEvn49kZ3Q9Qi88Pu2JvjbMCTLC8x2vclsIZoinIgKjirK1dzqPXe1ju
         AYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD9UbsCfLK1sD5rfPZHLW4pOXNcOs08THAAhnD/iaX0P7OoDICM2Xd/ch/CHwLr2N21R47AhpDt840QA6iDmy7@lists.infradead.org
X-Gm-Message-State: AOJu0YwM6hNegk4AswOJ7wsBxTNIOoToUCo0hoZIrca8oc9DMYzFWrJa
	XT28Bv6XQMN2+PIFaKK2UbFqYHBuo39gU8kasXbh9AzTtiDZ7YOLpT8b
X-Gm-Gg: ATEYQzzeMUy2ub0XLOQwQMCk0oBfVSKLs9XeCboQ5PKOgmAfC4gUZtnKQWowWG4Q3Cm
	lB2Er9a53z3LP0FB7hKyVLjk/Qts8hbvXXng9wKNr8DfZd+YQZe/PMaGpuYCX9JY0VgsXxlb8iE
	hl4HfLSy7ERGnixNRnfkjyZ8aee+LuwOworY5upF0CAIfJQtPiScRzGf8n+rudj540cQGjDuQhs
	IVRE/4uRuN8b0plhwqwCELCv1fKuT6NSdksWjZGKwXk1y8HVPHriXnx31ZbRdmKRD3MWaeVnrM2
	VTmNncSXsE5m3TqRRqfLz5qpqMqEk5Agjd7yzG/VEv+sUffpRmCerKNDso3l9p9YjEPjES62cDF
	s5Jt07X+trP35hpbmH+P/0SJUG0m8CxfjsbMjZKG5UjIPupMFAHthhRjOp+bF0XtYnpG9yfgu3M
	6waN4pJcLDKysfWe5LDJ84a4L6OWXtG3hL0ajMc8q0cagVSyOCNlK7gD7Pu/FIGLnFeUXyxphnK
	Y3Z
X-Received: by 2002:ad4:4c0b:0:b0:899:e9bf:3744 with SMTP id 6a1803df08f44-899e9bf3929mr23294736d6.63.1772325535538;
        Sat, 28 Feb 2026 16:38:55 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7159b72sm76227096d6.7.2026.02.28.16.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:38:55 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 2/4] arm64: crypto: fix SPDX comment style in sm4-ce-cipher-core.S
Date: Sun,  1 Mar 2026 00:38:54 +0000
Message-ID: <20260301003854.2504462-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163856_838283_AAECBC46 
X-CRM114-Status: GOOD (  11.16  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/crypto/sm4-ce-cipher-core.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/sm4-ce-cipher-core.S b/arch/arm64/crypto/sm4-ce-cipher-core.S
index 4ac6cfbc5797..32b93d542471 100644
--- a/arch/arm64/crypto/sm4-ce-cipher-core.S
+++ b/arch/arm64/crypto/sm4-ce-cipher-core.S
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #include <linux/linkage.h>
 #include <asm/assembler.h>
-- 
2.43.0


