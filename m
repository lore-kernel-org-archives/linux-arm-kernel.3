Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D12FC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4g0ClcGYGehbDjnnBfwOtaEybi5RmldRzHIBnnmK+A=; b=C2aCAInw/meoVnu697WVm/4JKl
	yd+FwZzRJf2KdX/jvpUrYeNiNXsf6eVKBtY5axQTO10+d0EqPDzeiC2RXIwl74AuZjzDa5G9/9otH
	bEZMlaybb2AsXA2uBjjokz/h5aBqE2sMaCqKHpadIjYdloZpQXtLrpOgWxqNJX287yujtumsBAIY6
	okuwlBDod54H8oAT0x6lJSWF6qlYFUIfd95eQskB+8s80yH+rH6mZnCJzFojUwNWeqfs9GQm3dZZO
	Qg9+/trC2KDhE+zdcJMY5AYCOpp3YhIDbQOlNKRztmXwqIr9D1y3Ai+5he9NUgrebQC4KUhJ6Xa2O
	skFaAyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGFDw-00000005aL0-1qjh;
	Sat, 17 May 2025 10:57:00 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGF7u-00000005Zf1-1r8p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 10:50:48 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00M63T1Xz9sWb;
	Sat, 17 May 2025 12:20:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5WR6SaDXKDR; Sat, 17 May 2025 12:20:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00M54MKVz9sYQ;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 916848B767;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5a4ytmCj7k7m; Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 57FEF8B763;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKChm013324
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:12 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKAOe013321;
	Sat, 17 May 2025 12:20:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: qiang.zhao@nxp.com, Chen Ni <nichen@iscas.ac.cn>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: Consolidate chained IRQ handler install/remove
Date: Sat, 17 May 2025 12:19:37 +0200
Message-ID: <174747706462.12970.7308015211348240691.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250515083919.3811473-1-nichen@iscas.ac.cn>
References: <20250515083919.3811473-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=445; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QUgzluer8yWbklILpqvTZIvYWxJlUPH1isJ6Z8FhIEk=; b=pQs8UzFywkxRkHAAXzbabVgBKt/zw2mtRTUaXgdw12fvhe2X4vMySzp+cMmb138Tt1mFER2xv olckTPdFsd7AAjDltcPnWmf4f1zbly0PskqxLmQR0TaVjig+zSlZPAu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_035046_638887_002124D2 
X-CRM114-Status: UNSURE (   4.80  )
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


On Thu, 15 May 2025 16:39:19 +0800, Chen Ni wrote:
> Chained irq handlers usually set up handler data as well.
> irq_set_chained_handler_and_data() can set both under irq_desc->lock.
> Replace the two calls with one.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: Consolidate chained IRQ handler install/remove
      commit: 695d702f42bf4bd335e30f542ca710af081ee2a3

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

