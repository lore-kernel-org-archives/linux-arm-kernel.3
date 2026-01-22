Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D1CD6CFAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kf/+wm9T8K+0mpA0ud88MFs+EQUKYAWohz0EXddAFIo=; b=UOTdRjAmOqDF0oj1U9UCg+m741
	d5rPhBMR/k3FS1xa/CCGPl2dYqY3Dtph1M7QGjQFEVZkhABWVFSh3FAKIOlZXKaAOexLPm6IY4zXo
	EoOMnasZuB71uL1N6AR3vVymK2QjD5Yaw09clnRv1sJPTpAke147N6tUPN5PkoZ46eUe4ksZrIoj4
	fyZ+vQILGM0guurd5SDZRCPdlmwt9KnPSRbxbYvpUYfPJHn9qwZAyGc5AF2r+QOyHYGarVf8okKeC
	EpIifNs25lyrQ8rpZ/v2QA3wNL0fu93QPE+23Xe80f5dyt20YGZE29/QUb1+DMsiCv0xV/9ibEBfX
	qLhEG+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj479-00000007syO-0DRy;
	Thu, 22 Jan 2026 23:29:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj477-00000007syE-1k9O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 23:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3B3760146;
	Thu, 22 Jan 2026 23:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B31C116C6;
	Thu, 22 Jan 2026 23:29:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AR0pJ+JM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1769124557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kf/+wm9T8K+0mpA0ud88MFs+EQUKYAWohz0EXddAFIo=;
	b=AR0pJ+JMGvnU92uFTU2T54v518VZAvj/JhSPeH2ruQ2iUnWODCMzwcyklRasNyjc5Nirfc
	hjplmDuzJ7dqi5gWcnTH9DnHPuorX8VguNrcy3/iL6SFHksUcHvzRrHBIlaMQhqWQWghLd
	CzN32ZUihqTaUd1w5/EzDixALWTTABY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3fea361c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 22 Jan 2026 23:29:17 +0000 (UTC)
Date: Fri, 23 Jan 2026 00:29:10 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH 15/15] random: vDSO: remove ifdeffery
Message-ID: <aXKyxviscQhQlGig@zx2c4.com>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
 <20260114-vdso-header-cleanups-v1-15-803b80ee97b4@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-vdso-header-cleanups-v1-15-803b80ee97b4@linutronix.de>
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

On Wed, Jan 14, 2026 at 09:01:47AM +0100, Thomas Weißschuh wrote:
> Recent cleanups of the vDSO headers allow the unconditional inclusion of
> vdso/datapage.h and the declarations it provides. This also means that
> the declaration of vdso_k_rng_data is always visible and its usage does
> not need to be guarded by ifdefs anymore. Instead use IS_ENABLED().
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

