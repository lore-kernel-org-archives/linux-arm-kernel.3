Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C04CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQdOheEUqRpM4ZgP7ld+n/Ny0a30r9dAAihdKcjT1Qk=; b=vlLDF/6qOsvVn1jRiAOojBL/zt
	kXKdU/o8+b2vWDhDxy8sooKPwY9NLXFCU7b7+kIUsKFt/explPJVhJ76hTwm+wqtY9gQigLhouRzO
	WYbHKMQxlwiQaofc/41YbcufYv4U3RuOdAqJBVUVcfYV5DrotBmzVE/j9oUGm3hlcqAXtq5VS8Jsa
	ZboZFjhLGurtN4OII/iUAwjbJzVerH44TBykp8XoCbZ3qfOS48WhOkVNOtIWuckqSLkhgDCDzXRie
	SqQbzCFiEA58lLQkf0BTTFUouBK7rCuJMjbzgaLi3RYGWPmNF6vIw/ciSg1L7TIRTlCn8mYPBR6l+
	dh8wf9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBXE-00000006pIe-1flq;
	Wed, 10 Jun 2026 05:31:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBXC-00000006pIC-0LpA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:31:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c0c3543590so42668515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069485; x=1781674285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQdOheEUqRpM4ZgP7ld+n/Ny0a30r9dAAihdKcjT1Qk=;
        b=mYKuJX/esGxq5/J2xJAaiEo0EP3Skkrxx5Ry6pIIJIvOT/otmGu+K5QQuG2vZ33oEs
         38TqEcg1YIqmpNAmfJXDqjusPfCzV7bRxOHmfJBczTCzgjaDRSqq1ZSfBIP3Y9WnovWL
         9oRsGH3q8BV2Aqh+R2LPvaW0TkqRpap/xyflAXAkHcsNxeqafFMJxLkggcbNBZOCCBrP
         icDcMwyXx1GJBPmm2asPR2i7VreB6xf7zFV5tRjTaar2NVHKBbHGAcbOMeEVXq+wCH4O
         mbLnSuRb+RzokF5ca1EjXct2l6wDfG2Yw843dWOFCmqgWaslgWH/pUgD5MmsLBSLODN2
         QXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069485; x=1781674285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQdOheEUqRpM4ZgP7ld+n/Ny0a30r9dAAihdKcjT1Qk=;
        b=KhK5R2p/pgNexkF7aI2Y5cX6n91BzHxrOKP3esHr9aIhEh76VaWONEBbDizxYd+A87
         R4DN1Du+RP97Vd8jIXfYtTjaOdX5oEvttRGolsyVtrG7VHi5sbhJ1D9lmum0x07gaD8C
         SibepB22IyVPJX53pVd3l57sYqOaXwYnhKCKeabHS5CM5g+O02Bko0dIwVFn3cUlGrT9
         9+bhhF77fHsBl+16kMsVYabwg7r3yQiuUv6Kicodkf3xMrGxRPAi/SsMg3OfcHD9Ytqw
         dBZDNhxjsoWLJgtNkwMmBXGq94yv+wKb92f2O3CbMmi6Z5hSrFss1M+utHFbrgDtQVz9
         B4hw==
X-Forwarded-Encrypted: i=1; AFNElJ8fwj62lmObKonpYS0+CCYBpONCXIKB95spLcgPkDKt8tyYV6WAFV35mbaQ9y5meVGjjiJHkBIRORJXOMLLmcw0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrf0Y0ruh7eaQmIVFApHEaLfE2pRiX7seEZYlbOdYa1x/4uSAk
	xgTDcHAhYKORbOuy81to6XG8VeYLChoiWp1iBDCuRCBGyc2aQsvmog0G
X-Gm-Gg: Acq92OFGwto47BOYHAuFYOpCcAUZ9Vj58gekZ+j4peuyVaCJb2ZWgcDiMY74sXmQ2lm
	fQOLODOjBAqJFxDQmmcMu/QNMng68azlelfTmJjcFOwTrmqPScGPAaiKCszI/dtGhBffqX2N2HH
	Z0iXeLn186yfn2JAIAZtLcZk1s9yWA2kq8VcL+1Pg6ZmCeft5PZSVspCS48Yf4PBt6i72T1aetY
	Y3ul9RZ6P+A1sEj4L5To53+NUIfwplV5CkGXRfcp8IU/j5ZLdZyHSkgnz6HaQjRSDLZrFlAJMpY
	Qw5Em7pFNtwMgaDkRRDFLLsHxWyoLxeR0JJqzgP+9HvyTS0bmTrl9GDhICvJR6adVSMT0ZNjIOe
	dHEsnj/1vAFN9+OQQsDpoE17G2G5GoAWvaZwAZK0GgdF89aHVLHNobcG7egELoPYF68gKos5CBy
	BYc7gIYbph06f3YlHqeS9Iu8c+1cBICIYNm4aMbp9TDYyfH0NKGiKqN8lunipyd8ffKiTEDMKqv
	nz639KPRMSitFLIZC12y2BhjIgWRYgUyKrZsUHsH/DikcOw7mWsDQ==
X-Received: by 2002:a17:903:13ce:b0:2c0:c0fa:1659 with SMTP id d9443c01a7336-2c1e8207360mr303183845ad.33.1781069484906;
        Tue, 09 Jun 2026 22:31:24 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm107916975ad.45.2026.06.09.22.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:31:24 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] ARM: imx: avic: fix device_node refcount leaks in mxc_init_irq()
Date: Wed, 10 Jun 2026 15:31:15 +1000
Message-ID: <20260610053115.2263570-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_223126_127500_87FF2651 
X-CRM114-Status: GOOD (  14.46  )
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

mxc_init_irq() obtains two device_node references via
of_find_compatible_node() and never releases either one:

  - The "fsl,imx25-ccm" node (looked up to map the CCM low-power
    interrupt mask registers on i.MX25) is stored in np, used by
    of_iomap(), and then the same np variable is overwritten by the
    second of_find_compatible_node() call without an of_node_put().
    On i.MX25 this leaks the node reference on every boot.

  - The "fsl,avic" node is passed via of_fwnode_handle(np) to
    irq_domain_create_legacy(), which takes its own reference on the
    fwnode through fwnode_handle_get(), so the caller's reference is
    not transferred. np is then leaked at function return.

Both lookups predate the switch to irq_domain_create_*(); the missing
puts have been there since the code was introduced.

Drop each reference once the value derived from it is no longer needed:
after of_iomap() has mapped the CCM registers, and after
irq_domain_create_legacy() has taken its own fwnode reference.
of_node_put() is NULL-safe, so platforms without these nodes are
unaffected.

Found by static analysis tool CodeQL.

Fixes: 544496ab5cbd ("ARM: imx: move irq_domain_add_legacy call into avic driver")
Fixes: 9b454d16e57d ("ARM: imx: avic: set low-power interrupt mask for imx25")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-imx/avic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/avic.c b/arch/arm/mach-imx/avic.c
index 3067c06b4b8eb..6873a50bbe2c0 100644
--- a/arch/arm/mach-imx/avic.c
+++ b/arch/arm/mach-imx/avic.c
@@ -173,6 +173,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx25-ccm");
 	mx25_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 
 	if (mx25_ccm_base) {
 		/*
@@ -203,6 +204,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 	np = of_find_compatible_node(NULL, NULL, "fsl,avic");
 	domain = irq_domain_create_legacy(of_fwnode_handle(np), AVIC_NUM_IRQS, irq_base, 0,
 					  &irq_domain_simple_ops, NULL);
+	of_node_put(np);
 	WARN_ON(!domain);
 
 	for (i = 0; i < AVIC_NUM_IRQS / 32; i++, irq_base += 32)

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


