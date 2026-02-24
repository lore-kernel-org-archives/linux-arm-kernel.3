Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05D8F3C9AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcCab+Oc090dbZQOacet5ipuIYY0TItZpINJDVPLWus=; b=SfTfZZYCfoymXcmovOyemXMlBF
	XT2ktLsVtWPrWTxXtJY2gEcQl4uQrXuOerqdu3GlQB+pKnm+YuyP74yP64YGoXCvJDZAvkydBWfcW
	/or5u2Hom2YsjmeH+7t6lzLweuKkwEZJQ+6mkwPqHmJIMfzBl6c0Bo/TTu3YR7OBztizDSs80yZcJ
	tkJO4vV9yDbxb0w9FYVWr0B3GXxccLNdpun94Cf38kPI2QkIExCAol1Xo6dZ3ouP5bRdHv07RlyMf
	8MLwfFJH0NwBtZ37/8V/bXtV0avlkhRsQOj4Ed4TFOeJaL3o1mU3tcd9zspWZoueYPQXpVY8M+N0C
	rnD+q63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuv4B-00000002Nm3-26OZ;
	Tue, 24 Feb 2026 16:15:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuv49-00000002Nlg-08eg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 16:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA20143E94;
	Tue, 24 Feb 2026 16:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491CAC2BC87;
	Tue, 24 Feb 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771949715;
	bh=M70nIzVXO7Ck6scYDO0aC8TqvdXXZp+11UABd836Tm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QybVP9Fr9wGUOohN9vTBDwIk2Klj4+KVM95gSiWFFs3cFGQc1hbhjJ9MlNM9prWEt
	 T9bND1DMWFcAERhEN/v6hMzvE+bHM+3UZ712hgccGLupO7jVQZlkiXM7wg77BahXHJ
	 0uFdJVZe0B0zOkFAzP+38/o1UjQFCyQrYBTw3G56qqE7RS9018HQC1KZhAW4aUXN8O
	 1wZqEbWdfwOLyxYg+8eS7EexOpj6WLOu9cq38cZqbkLDjhBc4iS1x0fw9ntLARQJsr
	 IKthMAsbsqYJdsNpdOg06XvaVfbGwPZHs9lR6WH1RUYGIecJ3u3ng4dwFFf0Ip5ZGa
	 T7bxBhqBmAPaw==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
Date: Tue, 24 Feb 2026 17:15:12 +0100
Message-ID: <87wm02t8xb.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_081517_122953_97BB0A99 
X-CRM114-Status: GOOD (  10.99  )
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

On Tue, Feb 24 2026 at 10:09, Marc Zyngier wrote:

> This is the second drop of this cleanup series for the fsl-mc MSI
> infrastructure, initially posted at [1].
>
> * From v1 [1]:
>
>   - Drop the now unused DOMAIN_BUS_FSL_MC_MSI bus token
>
>   - Tidy-up fsl_mc_write_msi_msg() while removing the legacy helper
>
>   - Fix include ordering in irq-gic-its-msi-parent.c
>
>   - Various commit message cleanups
>
>   - Collected tags from Ioana and Sascha, with thanks
>
>   - Rebased on top of v7.0.rc1
>
> [1] https://lore.kernel.org/r/20260218135203.2267907-1-maz@kernel.org

Acked-by: Thomas Gleixner <tglx@kernel.org>

in case this goes through the FSL SoC tree. If not, please let me know
and I pick it up.

Thanks,

        tglx

