Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F3EC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU4Pbk6yEdmwVsePqB7iY1Qnsa2ijgxKYqdvE/nBhpo=; b=wVlIYrQPTc8ydQ/qQxFp9AkaVb
	+NZq9U0NzQ+6owqideYuV0Z1SWmI/bmeC85x9/xMje+mxohBB1sIbfqP/AHuV/XR/PYEVwhxSUQKj
	WkT/2pXrv4qKkEahA8PJZ8N159fBht8weoFL8M+dpDUNd66+znO0pb5OzbWI9jXzVxqxQWqrCQWkE
	IjEPfCbKBK/Fno1H9VS8dM6L8OLD1eq+NvPKv1EN6VE/XEDRe0mPNNxwFDN5NDBHQMGsbfrwDmBoc
	6W7bvC/MeTA4iVBME7pR64RQ8LKIetVxlI44P6KcJ5p0lRa09P7kANUJTk2O422oFU9zZUm/v2d3s
	eb2XtaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9oC-0000000E4o2-1BbQ;
	Fri, 25 Sep 2026 17:34:04 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9o5-0000000E4lu-2Z0t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:33:58 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f01363so7302135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357637; x=1790962437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CU4Pbk6yEdmwVsePqB7iY1Qnsa2ijgxKYqdvE/nBhpo=;
        b=hJ4LWFnvYim0idOgsBtTeo4UoMAVx6rX19dO4Si1wNpBEwucz8/mKqwtGHRTbQ0HXs
         yo3ZVJuRAUvMxDQvGjHhtumCz7r72prubya6nKXaMgKxdtSzu/lwuOGfqgtI5PyIO+iV
         S5dL+NLux6cw7uoe8FRva/R1XD1fao7r0eeRh6EfbbJs5aN4u07+gSN1whNR5tOTvIZ4
         JWzdHNw22hWK7SM98Sytj2UAt74sjyzU+WY+Llu8BDFXLllMlv6YNlCpyonYe2DcJwpP
         qP2Wu31gM89jj97BW9Gz+WrISt4HvbNkHpevhzdOEc+6d4HhT/vLwaBexy6TbHAI+nc/
         VDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357637; x=1790962437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CU4Pbk6yEdmwVsePqB7iY1Qnsa2ijgxKYqdvE/nBhpo=;
        b=OpvqfCB3/z/Bw01RluNAw+pDHTXs0VtaRAboVBLUeWPiU41cSJ8O8im5RqI6t1e0RT
         VgM6C4mAj0KsMqINg/0KgNxeYcYYd31MA9Lwz5ZX9HzBAIXg3bLzjIhDJYIc1reEpsjJ
         8hl5sZkzjdPfnFniLJ+Sk2Z42bkyo+Z8IS8KjKwKVfQXU63qWqVW2SxWde+/F+3JBzDC
         6OX+sDcT8wQGwILtY/yZmr5ry78GW1i2xfUofR+S4JBAiW9bKsqfIJQutEQ+zR+7y9wu
         YoPrp5ByFG3lm7AyUfaRY3RvHSWluhC/rLeaW5qiOfViCi20R/V0yYd9dNthusaybr0O
         npJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFv1EXC76QYWbuOsmoXUdBE4UHoA7wZTs4OuZQ8jRzc1VIFBR9x8T+5nI8pnekRQycvTCmebApE6MWhLgFX3MS@lists.infradead.org
X-Gm-Message-State: AFuF++lVhUQRvkKL1IWDrto1LRdToP41CUGnHBbdeYaAdVCJlNPiEjeG
	I5eahbD6AUZlyIIw7KyNJSv2c6TaG7X42XAM2E87f0NUCmb5isbm6agO
X-Gm-Gg: AYBFou1Jjn5mDPi4uewzm4ylhxZzg9qbebgCaPZ0ikx9Y9QUMG1L98YQJNUwLLx49un
	rULdQZDOIjDcr68MtLLWCxp/PUokrjeWahf/c1W1VQOENPDdrA27M4cS76hz4fXMxgLqg56SiYo
	B/PB7Dgu/wUrE5XeW8DpPAldn9iGIUFxIuq1KLAM4kUxQojR3ukW1tMEmrUT33R8Wx16QTVvjaw
	dB3P1+eveGyy5AYUSOmUkCQnG7V7ViARVRiFXjHm3OMoynl2hK2pLeC7CAjJAweMLE6mEqrYZAR
	OaFl5V+pmOC0YM1Hp3pQGDX9VfDo2B+JVW8Cn8W/KQb233uYr5ALCtKzjbXDd1c9LgfzxL1si5c
	H61TasJn3CaD3HJVALAfRsURWCzNnBDf00P4OMBxr0QZroH0+KxRyxtEEDZtbFuJ7rNFB+yFDxq
	45j40MiX5ZZrtik3Kprt6CE2gpDOOj3CqAhYkKn82ujISa5cHoEoRjWEDUeKNve3ZNKF53iCh+A
	tq7AnD6lVgTQ9OOoIUujhTcgAAwTCG2fJbBr57RJSmZwKc1R0pm6QbR3ImkkU+4wRn+jxoqK/oy
	kR9qARyGYjIACq34OBTFCWSPEHflUH6fqlnnwg==
X-Received: by 2002:a17:90b:17c7:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a0bb653979mr2238198a91.58.1790357636683;
        Fri, 25 Sep 2026 10:33:56 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm651224a91.1.2026.09.25.10.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:33:56 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 1/2] ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
Date: Sat, 26 Sep 2026 03:32:51 +1000
Message-ID: <20260925173252.933705-2-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925173252.933705-1-geoffreyhe2@gmail.com>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_103357_672979_3A1BFC76 
X-CRM114-Status: GOOD (  15.75  )
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

vexpress_flags_set() obtains a reference to the "arm,vexpress-sysreg"
device node via of_find_compatible_node() and passes it to of_iomap(),
but never calls of_node_put() on it. of_iomap() only reads the node's
reg property to create the mapping and does not take ownership, so the
node reference is leaked. The function runs from the __init SMP prepare
path and caches the mapping in a static, so this is a one-shot leak of a
single refcount during boot, with no functional impact.

The lookup was added to drivers/mfd/vexpress-sysreg.c by the commit
below and later moved here by commit 9b06fc39084e ("ARM: vexpress: Move
vexpress_flags_set() into arch code").

Annotate node with the __free(device_node) cleanup attribute so the
reference is released when it goes out of scope.

Found by static analysis tool CodeQL.

Fixes: 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
    hardware; I have no Versatile Express board.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 arch/arm/mach-versatile/v2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/v2m.c b/arch/arm/mach-versatile/v2m.c
index 79afdf2a90b6f..c86b38386cf7c 100644
--- a/arch/arm/mach-versatile/v2m.c
+++ b/arch/arm/mach-versatile/v2m.c
@@ -13,8 +13,8 @@ void vexpress_flags_set(u32 data)
 	static void __iomem *base;
 
 	if (!base) {
-		struct device_node *node = of_find_compatible_node(NULL, NULL,
-				"arm,vexpress-sysreg");
+		struct device_node *node __free(device_node) =
+			of_find_compatible_node(NULL, NULL, "arm,vexpress-sysreg");
 
 		base = of_iomap(node, 0);
 	}
-- 
2.43.0


