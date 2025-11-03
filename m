Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3174ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrB/gSLdf3VA/om+dC5j8qNs8f2OaoR8P08bJ5Kp73k=; b=fPdmDlkZzxJ0bUbkZZWGyM1eJB
	imb8Clat2Xxyq4cyCL1RYuVZKl4FKCON5uQbFCVpcAb4pzEf7szSP74u70+VUEc/PKb6G9CkRz0mW
	Zcwf4hcbWZs63x/tTVr50K7G6HIGb8B6K9zHP5IsBEgvu3+fadxWvRFC+bck7cPUW0Lzr8+ODDK2a
	tUQ3fqlwIr27vGVGNH0OQhXFNgAUpyCZc4SgtBDwXgobbcXkACagelVv/46x1yj/LUgLJofmpG6zx
	QfTKtzqH+aceUcwRGUokStTl+bdFQqXi3xpiiN4oRrOCFfiNssjFg/CWCMTbBwD2R2QNRZa1sNgpU
	jJHNq68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbX-00000009b1t-1zwt;
	Mon, 03 Nov 2025 10:16:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbP-00000009ar6-3LQR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:16:02 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762164949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WrB/gSLdf3VA/om+dC5j8qNs8f2OaoR8P08bJ5Kp73k=;
	b=FoxNWJmo+ld5qzhUCv+HCRcQ0KtxHasJ/ErVn16eXHBfM/Pg/5eXNZvngUqXytkeOG75FB
	wwA6ikGs+SvND5a5kFbx9I0b9mG4/70iqJAOgg96hxZQUJgnpSP8kI9/roq5a3cuGa3/LG
	zyjbJLpZzjYPjs9Em0fgCbd7YOvSru/7mjQMV7ILcOYsBa9RsQEPRJyfaA3NuFUUMtBV2b
	qoC6EbVO0VKg023+sAaonXWHgME+RKw+OZsfdUKpfHaqS13o81HGKT5yirZ11fh/RRpF/o
	5iTQdsoMNjTWBqiw6NWhytPN6ugL0zLBzuIUyIkBgCN0ewC2FaTh7lhhzGsU8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762164949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WrB/gSLdf3VA/om+dC5j8qNs8f2OaoR8P08bJ5Kp73k=;
	b=iFUp/uacy9LksbAsmAR66Id6bgYBzoc5hAYuGQmWXBakwocOjATfMXGekVe9Eiuo07ER0z
	tiQ0JpvpQwtuP6CA==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 5/5] ARM: Allow to enable RT
Date: Mon,  3 Nov 2025 11:15:45 +0100
Message-ID: <20251103101545.760243-6-bigeasy@linutronix.de>
In-Reply-To: <20251103101545.760243-1-bigeasy@linutronix.de>
References: <20251103101545.760243-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021556_025327_81780C91 
X-CRM114-Status: UNSURE (   6.99  )
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

All known issues have been adressed.
Allow to select RT.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 45d29320196f0..84ad4fe11589b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -41,6 +41,7 @@ config ARM
 	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
+	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
--=20
2.51.0


