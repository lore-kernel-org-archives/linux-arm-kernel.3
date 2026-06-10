Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC490CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmpW0QtKL7WDZjfsG4xvFm11JV+f+bzZkKOrbkR0yY0=; b=OVx4An+fuajkfQmpw0uXJa/6FH
	Bppcst11aVd99tYc7juT1sDVSczjqn8GQZgvKclqhF56ptgHbnC9zp86w+VAS5iNXHjnMKFnjA9SR
	qu2TjkMjK7IfdwixRkIFM+2E3AYChZ/oHfQOpF69TkR8Ca/IC5td5oOBuPWmCAVE4NPWB4L4ZUvex
	PpM6Kg8URZcJIVEiX6aDdjqRo50IYCxl30k8RTQ/tEGgV5m8pO2VLxG0b8tYBU15coYD2cGfbymg3
	QbLTL/4e8N+7+2q+j8MFflToT+FjFS5zUoHKoxtahiK2tnGInWv+tpimZUslLzUBUvpV6w1x7Z2dC
	i0O2DDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB9T-00000006nyE-1SF6;
	Wed, 10 Jun 2026 05:06:55 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB9R-00000006nxo-2FmO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:06:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0aa420401so48950015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781068012; x=1781672812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmpW0QtKL7WDZjfsG4xvFm11JV+f+bzZkKOrbkR0yY0=;
        b=Fbq7Plbaz7ySz341LH2ZY0X3hM8FeaANFGV/FAqy4WxwvwfYd9TTgbB0bwinX94+wV
         KXqu3wifJxfC1JTDaDO8mZopgWIETzxve28ZqTUBWs03yQAH0vMh24LGXs95j3lVRCKJ
         OPneLv1fC//YOzeDo2JD5sAp+IxAJjWBaRvRk7Rgxpi0kYq8Ge3Dq/mf7UWIVdiBKVOG
         QF6CvQmOezYS156vQ3BYG0yFkMM7QxY9uh23DYaQeOVqLNziEqN7VD4dXzs4+KzlyT4j
         gyp0BV+8ruKhPSRcdI8FWReeT6hle47Jja6q0mKGrrhrVdQhJDtLIzW17w4O3Dger8+M
         vBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781068012; x=1781672812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmpW0QtKL7WDZjfsG4xvFm11JV+f+bzZkKOrbkR0yY0=;
        b=VLZ42A3T0mBGUWyumIivYVuFVLK1viWGy23r9GkkqhAI7+XXVzlQzbgALOy8W50f2j
         Q5GBb8K3vYt7X+c4B5LPgglTfXJswuNMooeeIG1qIUH1rN6dGnX/hS8nJa9l/rtLhYbm
         +YrZH8Nga0Qf1ex0GBuCXiqi/wNOFRtjPGjfIzBGquuF4B+/pE5QAtHJ8E8CMccbUGDA
         XMLYs1iGs60VyUUojVZA/LPCnVPISwTaSF6mOsTqRe/00NTkism3d8kB9y+3eClGzoHJ
         OnAdpp03SYupmiCehK2Kw2nmGZZsZjsscY1zwYNjywH+IO3c1myb395jLg240tsWnvm8
         Davw==
X-Forwarded-Encrypted: i=1; AFNElJ8pSQE/4TknwMG+XRtfIPrBjA4htjg2ijsS39jGeDt9oa9LwJfCAyIo+Q8whHfl9ks3qx0HBFBNi4dZpT4/McfA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8MKNWz6pMVpIu0Ci6bc0ZorVDzM2alNQnr7kRUSGt2FW382M9
	6P6dF/m29xwqRa1ld7vIUt1+cBpcuBsDRPG+czNosBCFPr2MMtZlDsMr
X-Gm-Gg: Acq92OGrKsuXpYPxYo9A70SILi+ZkdnpKI139MxWvN/BorneYBIALN1pe7p/ImGF+Mj
	vmaXWC+kyB7MBrPjq5wFSBL6pPOl4IzY4p4F8mrfRHMk1iwByf/M7Uz91PI1+Kx9i7pAFX0+6b2
	2xqNCsnzqC6jnFN1sOO+iX7utVkUdxJ5z48/I/VULLP/MjKQnEZ+nrsjqBdf6AXqyVQUDDAsLMP
	6BWaskDaVnI+5r/XQkqHe9x+qHE/C1Hddb11Pa9jKy4fBu2e4l5iHt7ueZ5Kw/+70MWf6uJIYgH
	G440MvtgFguiGJcpDWsk0t1uvaaz5mOci9JPCAotM5BY1Z64kvg55mBVCZtIqPEMSS55yqg2f47
	n4n/AQJ9N9Sxuy4su0pnEq0uzXc/OwBd1/okLkgUcwu0p/MAIRT6xdP7QGaQUgPXnVdFwxmaxwV
	2vz0e6CwGbeTeCAmDaV3MrIZ09zok7kv/odfyKVicvJpqc2CjP09kkUfkgoZNyfgXyeonpoCGZr
	BlruUc8RHPStjs+hB4uLkoRFxH4pCvaqHTCFpRVULngKAVMfjeqcA==
X-Received: by 2002:a17:903:90b:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c1e8350affmr283521355ad.36.1781068012570;
        Tue, 09 Jun 2026 22:06:52 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm245342055ad.5.2026.06.09.22.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:06:52 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 2/2] ARM: imx: fix device_node refcount leaks in imx7_src_init()
Date: Wed, 10 Jun 2026 15:06:25 +1000
Message-ID: <20260610050625.2229221-3-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
References: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_220653_586665_C648F7D9 
X-CRM114-Status: GOOD (  14.86  )
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

imx7_src_init() obtains two device_node references via
of_find_compatible_node() - one for "fsl,imx7d-src" and one for
"fsl,imx7d-gpc" - reusing the same np variable, but never calls
of_node_put() on either. On every i.MX7D boot up to two device_node
refcounts are leaked:

  - The "fsl,imx7d-src" node is leaked both when of_iomap() fails (the
    early return after the mapping) and when it succeeds, because np is
    then overwritten by the second of_find_compatible_node() call
    without releasing the prior reference.
  - The "fsl,imx7d-gpc" node is leaked on every path leaving the
    function after it is acquired.

Release each reference immediately after of_iomap() consumes the node.
of_iomap() maps the node's registers but does not retain a reference to
the device_node, so it is safe to put the node once mapped; this also
drops the first reference before np is reused for the second lookup.

Found by static analysis tool CodeQL.

Fixes: e34645f45805 ("ARM: imx: add smp support for imx7d")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-imx/src.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/src.c b/arch/arm/mach-imx/src.c
index f28bfb653a88f..c3c80b4c3d53b 100644
--- a/arch/arm/mach-imx/src.c
+++ b/arch/arm/mach-imx/src.c
@@ -196,6 +196,7 @@ void __init imx7_src_init(void)
 		return;
 
 	src_base = of_iomap(np, 0);
+	of_node_put(np);
 	if (!src_base)
 		return;
 
@@ -204,6 +205,7 @@ void __init imx7_src_init(void)
 		return;
 
 	gpc_base = of_iomap(np, 0);
+	of_node_put(np);
 	if (!gpc_base)
 		return;
 }
-- 
2.43.0


