Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B8C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F4VxCaKq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J6Y05fdc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LvA7KEH6yP+f436RwxVH7W63a6lypb6pYWkMfhLxpI0=; b=F4VxCaKqRh5k6naFj2NozZJX3h
	g2NaaZjc5kZSCOmovH1nRbzo7D418nqoCW5M87Bml2M2D191uECUMZ7a+wxaL5KYPsK7VpTn//c2j
	PRt8mSrIzDnLYQnV5N9BRYHPT9m4HhUtmms4WiEGa7THqGjxgA3Ihq9rEdDePCt3SPfzjQr8+x1Vj
	Pg+3wmVyAMm1Fxe3RtV47fJJWkZX0aiEi/BszoMhZGxd6/KWFfGnpb33GOV9RvtYfCuKyqJ4wo15E
	1af9KSIJILNhX+3Ti28UKhKnNaP4h3kZW41vmXU5khN0ya2WaLV97WpIv8zemv72i97jqWb0xmy0A
	J3xR+F6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvFz-00000008Ygm-2IxB;
	Thu, 05 Nov 2026 11:03:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvFx-00000008Ygd-41Zc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:03:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58C4D41216;
	Thu,  5 Nov 2026 11:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAB31F0093A;
	Thu,  5 Nov 2026 11:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876625;
	bh=LvA7KEH6yP+f436RwxVH7W63a6lypb6pYWkMfhLxpI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J6Y05fdcHjlvz9xbOvt9aO2hDEJypsE+JMGEgDQflQxInnU6ttxEEo2YIsuDhCwAo
	 phYH6Ub8+S/Wr5NbUOCDr7XV9+LAVxdv2C0iG7i7AJWPNkClSjMFy2+Pe0clgH0oGw
	 dXMiD8bAGPG9TBSCbmCPTwy0bP5ZjsK3Vv/jEXfT2KvU+a1cE0UQ+EGxFnwga+mQaO
	 pUUMSSCh4ohXnxlWB35a6gtTke6IbKsyjCIKD/9huKH/mcpSPkxiJdX2kTuMuz/44i
	 FYEibOT29v+b6hiROp4++oqn2xNaKPOHKuWA4W1kQRegR47f0KUQP8TN9K5MwBYhv6
	 QuOmOwgwRut1Q==
Date: Thu, 5 Nov 2026 11:03:40 +0000
From: Lee Jones <lee@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 01/10] pinctrl: sunxi: Fix out-of-bounds irq_bank index
 when first bank has no IRQs
Message-ID: <20261105110340.GH1650678@google.com>
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-2-lee@kernel.org>
 <e7cd2bf6-f9db-4a90-b11a-665f8219f7ce@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7cd2bf6-f9db-4a90-b11a-665f8219f7ce@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Andre Przywara wrote:

> Hi Lee,
> 
> On 11/3/26 22:29, Lee Jones wrote:
> > In prepare_function_table(), irq_bank and last_bank are initialised to 0
> > and last_bank is updated on every bank regardless of whether it supports
> > interrupts.  On SoCs where bank 0 (PA) has no pins or does not support
> > interrupts (such as Allwinner A523 and A733), the first IRQ-capable bank
> > has bank > 0, which causes irq_bank to be incremented to 1 instead of
> > starting at 0.  As a result, the final IRQ bank receives irq_bank equal
> > to desc->irq_banks and writes out-of-bounds past pctl->irq_array during
> > sunxi_pinctrl_build_state().
> > 
> > Initialise irq_bank and last_bank to -1 and only update last_bank when
> > processing an IRQ-capable bank so that irq_bank always starts at 0 and
> > increments sequentially across IRQ-capable banks.
> 
> Can we please hold back this patch for now? There are more issues around the
> IRQ bank usage on recent Allwinner SoCs, patches for which [1] are on the
> list. They should solve the out-of-bounds access, I think, though we might
> want to add explicit checks, maybe.
> 
> But taking just this patch here would torpedo the efforts in fixing the
> correctness issues that we see.

Sure, no problem.

-- 
Lee Jones

