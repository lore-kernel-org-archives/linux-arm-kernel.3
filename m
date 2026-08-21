Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF459C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGEJQB9358mwZctsDDONapSyTxRcKMMADgC4+MXroNA=; b=Dhy8I0F76+aGyn/FRsehvouhPh
	+/3DzHThd4a6aZbt7YJZUNXlu96tFW6n8cMPCO/wgBZwKOkZBhIGscB8WJpciiZ5F0qbY4zfEjVCX
	XUB8yNpWYH3PBw91jSRGo7D9bAiJUNMnlPrwjG64/3bc05gFRRrdS0BXfm9jTynC+yhhy0vDUA6M6
	GdRIay1sbftSPiGNyKYY0lDwmpr5l0Y5/Epba2uULc/rW5p9O4INStiweI+t9AlFOQmq0B6m7uHXM
	73n+rWsIGfQYw6On8b+UySdeeBiZgnFN1CifzEMSQ1cxdVaobmLc3OkQ3MpQsuO8wExg/PzNSPFLe
	8t9YTgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLEO-0000000CtQ5-2stP;
	Fri, 21 Aug 2026 09:08:08 +0000
Received: from submarine.notk.org ([62.210.214.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLEL-0000000CtP4-1PgA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:08:07 +0000
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 8F07A14C2D6;
	Fri, 21 Aug 2026 11:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1787303277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGEJQB9358mwZctsDDONapSyTxRcKMMADgC4+MXroNA=;
	b=M2jn6TbVDXHVkr/DG2auw74KFiKThPfC0XasZSWIF0/2H3vkffPYarZ0Z189yUSvAFBHf/
	QbLJi8iGq8/DbVwhhl3Z+c5DH2i0qrzOvtU7quhd+lgDZveIW05P/3uIoPAptls8dYDr5E
	oOqeQZU7+rq3031TM9LrHcMu2FRVn0CvkLU0PheUnT6lGAg/RscCEnLnNWAqzpZxFkv8i6
	5ZstEmf9todvM8Gtz1f3DPH91+qfKMcPuALJTE2R6K3FFDITuuY7Uc+ft9D1qhN2Dv4z9V
	u4S8i4qdypfe+OQdqztFxRKI9jUWypUnpz5o+4p92UwGFectm2NXZQS42rRXrw==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 622dfed3;
	Fri, 21 Aug 2026 09:07:50 +0000 (UTC)
Date: Fri, 21 Aug 2026 18:07:35 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Stefan Eichenberger <eichest@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: imx: fix SMBus block-read of 0 locking the
 bus [stable backport question/offer]
Message-ID: <aogVVwPlOmCqFsg_@codewreck.org>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_020805_788591_8EFB69E7 
X-CRM114-Status: GOOD (  15.06  )
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

Vincent Jardin wrote on Mon, Jul 13, 2026 at 08:11:58PM +0200:
> i2c-imx rejects an SMBus Block Read byte count of 0 (valid per SMBus 3.1
> 6.5.7) as -EPROTO and returns without emitting a NACK + STOP, leaving the
> target holding SDA so the bus stays stuck until a power cycle.
> 
> It was triggered by an MPQ8785 PMBus regulator on a LX2160A i2c
> bus: when the kernel binds it using the pmbus/hwmon framework, the bus
> locks up and it does never recovers. It was confirmed with a scope, with
> and without the fix.
> 
> The same bug is occuring with two independently introduced spots, so the
> fix is two patches with their respective Fixes: tags and backport ranges
> 
>   1/2  atomic/polling path       Fixes: 8e8782c71595   v3.16+
>   2/2  IRQ-driven state machine  Fixes: 5f5c2d4579ca   v6.13+

Silly question (half for stable people, half for i2c-imx maintainers),
but the backport for commit cb2fc3785769 ("i2c: imx: fix locked bus on
SMBus block-read of 0 (atomic)") to stable brought in b460b15b3cc2
("i2c: imx: separate atomic, dma and non-dma use case") (also 6.13+) as
a dep (all the way back to 5.10!);
with that commit in, 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non
dma mode") applies almost cleanly on 6.6/6.12[1]... So should we grab
more easy fixes?
In particular, I doubt I'll ever hit this SMBus 3.1 bug, but
5f5c2d4579ca also was a real fix[2], so would it make sense to jump in
and get both 5f5c2d4579ca and 07fd9385f0d8 ("i2c: imx: fix locked bus on
SMBus block-read of 0 (IRQ)") for 6.6/6.12?

[1] just a trivial context conflict in the struct there, but it starts
being more iffy on 6.1 and earlier kernels
[2] ... We actually ran into that bug on 5.10, our kludgy backport being
the reason I noticed during today's 5.10.266-rc1 testing...


Honestly, I wouldn't have considered backporting either as b460b15b3cc2
("i2c: imx: separate atomic, dma and non-dma use case") looks too big to
backport to me, so I definitely wouldn't have done it before, but that
ship has sailed (it's in the 5.10 -rc right now, but it's been merged a
couple of weeks ago in higher versions stables), so at this point I
don't think it's worth reverting either and we might as well keep
falling forward...



tl;dr: If maintainers agree, I can send these two for a future 6.6/6.12:
5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
07fd9385f0d8 ("i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)")


Thanks,
-- 
Dominique Martinet | Asmadeus

