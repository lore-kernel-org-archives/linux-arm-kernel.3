Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE398C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVCvfQ5DtQYHcmAr0D2aMfpBZawKOMRMx48ObQpx+8o=; b=JWu77ainbxOMFjfg6CglefYbaS
	YxMTBOr+t7twXFyngpOnCiu4n0vo+lCI0+tWvDJbF26XRi9zcYQf9gbdJ5ncPEcec2aWEgZOqT2Qy
	RgT3Y//XVTUNSwohilhmIMxeBfxy8uraM282liSi0JkOcT85kbWZCKAJnyO056y55kNJw9o5IzNUh
	+JLa2bWqCCYzgEzi+MX7B1QlCMzEdxEuEJcWBwAkWJJS1Ry8t+0Ha9WkLXSnvX9dNgJlWlcJRoHcy
	PTSyxsUiLmzY9tYewWL7vgAYwTtHIe4Jnr3yrpc9ByEMqDygTPzsGdeLAurqMFHHwdVGD3s1FQ9k/
	hDJtjMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twykj-000000055iT-19b4;
	Tue, 25 Mar 2025 07:31:13 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twya3-000000053wu-1r4y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 07:20:13 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZMLYK5Gt4z9sSh;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJ4bAikuKLHX; Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZMLYK4VFHz9sSg;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 851568B765;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1R3S4luMUOar; Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 565FA8B763;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 52P75npS009415
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:05:49 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 52P75mFm009410;
	Tue, 25 Mar 2025 08:05:48 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: ioana.ciornei@nxp.com, stuyoder@gmail.com, linux@treblig.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Date: Tue, 25 Mar 2025 08:03:29 +0100
Message-ID: <174288553818.2234438.11007216946587143383.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115152055.279732-1-linux@treblig.org>
References: <20241115152055.279732-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742886214; l=584; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VhmgXn8UTNWepu/WKdG9W0WStpBu+2fR6BBNfwNb5Vo=; b=OOvXAJey8QbW05uaPC1iND6tTU4jLioJLk4ni3WxNp8YZL9IeOycvAmyn8xVebICfDxO/xZ2T ZW88LyzkL67DtjvUgJNVQ4IKPHgyaY28eIKUhtLCD0xCKdaYppLQQbT
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_002011_669321_ADD7BAEB 
X-CRM114-Status: UNSURE (   6.49  )
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


On Fri, 15 Nov 2024 15:20:55 +0000, linux@treblig.org wrote:
> fsl_mc_allocator_driver_exit() was added explicitly by
> commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was added in 2015 by
> commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> but was never used.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: Remove deadcode
      commit: c25951eb7518844fcb7fc9ec58e888731e8c46d0

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

