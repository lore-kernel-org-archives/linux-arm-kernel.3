Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E167DC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky8EGhAbwDxSiGd+vPASPYnyZb+Sx+A2spx1YzJQeR4=; b=dN3olNwno56W2gjkxZyWxYAE6G
	rFBFxxknMliSuZb6gO8fhtneb+FxCYoByEV5US4tViT/fR/t78wwpdfU60del2AtdrDvnNVKDmxnc
	v4jPkRRZYBG9+eDF063+4mWvEZmgGStTU1KW5JtPtZvMgmFFHgfai+4j4gZrkysMz3zH2yXrrb2BY
	2JqbPtD25BNkwaO4nrvt4Np/qqs3QAsda/I5uf331KXq7pWUeFnk5ppB/krApdTwoW0PeVU+WQYK/
	4b3vxp596Nbwlbv28SUk8bFGcvUe7O4rWjx5HtvoIOlxBJdfACa34QSsuMxQmX+pA9d6XlWmdbmRQ
	9J18cg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnBx-0000000EVRX-1e40;
	Fri, 16 Jan 2026 17:00:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnBu-0000000EVQJ-2SJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:00:55 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768582851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ky8EGhAbwDxSiGd+vPASPYnyZb+Sx+A2spx1YzJQeR4=;
	b=hRxuxlBeyiIv+XUncVep0DQoBQgJcoCYAUaECGBxUcUKtBlCi42ej+Z9Heu9HtF7AzZxDc
	2eJ3YGyZjvpnGYITLt2FXvvP1DPVTrNQqbrPFrQrfIVq9vWp88/14KWhi+njibykQMa85Q
	8vuHq2TtoMWIzzF1R2UpRjkdedxEUVhvzOZL8cm9Wh2Fu7XjwkdHk7qo6MHBqwTUIQY2Oj
	g2lX0SrgJ0eIcrt4GK0Ktro2zs+k1TqZyj2U4IZjIy5uebZ9ZkMESiipNWFz1N7qlpJtwa
	JwOzkA8ZyWCxFG7mPEkGh6ZtCSDjo5aJIeshci0AUY1DZVaSD5BFXe3eip/n4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768582851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ky8EGhAbwDxSiGd+vPASPYnyZb+Sx+A2spx1YzJQeR4=;
	b=CdjdnzXV3vWcZr5Jif5md1pvNn7rA9CQEnxPsdXygk2X3PeRj/aI3CdMqs0QETl1Lb0iEe
	LGSgaZAxKaNcPyCA==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bryan Brattlof <bb@ti.com>
Subject: [PATCH v4 2/2] ARM: Allow to enable RT
Date: Fri, 16 Jan 2026 18:00:41 +0100
Message-ID: <20260116170041.1059997-3-bigeasy@linutronix.de>
In-Reply-To: <20260116170041.1059997-1-bigeasy@linutronix.de>
References: <20260116170041.1059997-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_090054_773129_F2B4E572 
X-CRM114-Status: UNSURE (   8.09  )
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fa83c040ee2d4..547df4161e0dd 100644
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


