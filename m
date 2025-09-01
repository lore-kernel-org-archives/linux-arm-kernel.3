Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3C1CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiX2k989cQjsVrzFTK6c2wE7V0dx2J3WDdk+6I7U+ao=; b=NIxmSuapPfuIBp+lXjenmtACez
	409uiiBOWfJtorBB1X2u0C7GlxoYCjJJ24CeNcXlEfKDDbyGYtLFFMqACiuc+rd/2cRwQRyDil6H/
	x7dcQUSDiTXIJOO26BAHu9FK+FR1NfSxRofLzZWhOw9oulGBh6uBWNLJQ4Z8a1DzimGqCdsc+ISZg
	rp4qjMgMnGQl3H58wrnxJ5dTrniTHqQD3YeJsUn64AbH4Sdq3r5D39bWyxMvKpxfCFwQF7POLod1J
	roKManOZAF/HFfvSDglXX6SaEZrfVw8N2tk9zdd+z2wFaiMjRzAgNQIOPO+8gH+Nrq2lgtMnQ5Ixi
	o9FWzXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFG7-0000000EYEw-1VXV;
	Tue, 02 Sep 2025 00:52:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAlG-0000000Dk65-3MNq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:04:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1E16600AC;
	Mon,  1 Sep 2025 20:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CD8C4CEF0;
	Mon,  1 Sep 2025 20:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756757057;
	bh=JjMEb+rcANH9IoHEvd4So3cfv4dWZoqGvcHUiSWe6I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syStq+NA4tCIhKOKN571VBlVzKRxvHgdQBE+1pOx0lmdTsOUKrAWuwywf1USnJc39
	 9QJn68tkB1yKiTYF4Py2dCAl910835pbge0/6i4xvRGyw9iJPCpLdWzRzqMxgDe4wA
	 zmRsDbEXUN0ppWiNoBgzecrmeY9sCODevGXmxruw=
Date: Mon, 1 Sep 2025 22:04:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gyujeong Jin <wlsrbwjd7232@gmail.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, gyutrange <wlsrbwjd643@naver.com>,
	stable@vger.kernel.org, DongHa Lee <gap-dev@example.com>,
	Daehyeon Ko <4ncient@example.com>, Geonha Lee <leegn4a@example.com>,
	Hyungyu Oh <dqpc_lover@example.com>,
	Jaewon Yang <r4mbb1@example.com>
Subject: Re: [PATCH] KVM: arm64: nested: Fix VA sign extension in VNCR/TLBI
 paths
Message-ID: <2025090158-kilt-fabulous-3e76@gregkh>
References: <20250901141551.57981-1-wlsrbwjd7232@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901141551.57981-1-wlsrbwjd7232@gmail.com>
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

On Mon, Sep 01, 2025 at 11:15:51PM +0900, Gyujeong Jin wrote:
> From: gyutrange <wlsrbwjd643@naver.com>
> 
> VNCR/TLBI VA reconstruction currently uses bit 48 as the sign bit,
> but for 48-bit virtual addresses the correct sign bit is bit 47.
> Using 48 can mis-canonicalize addresses in the negative half and may
> cause missed invalidations.
> 
> Although VNCR_EL2 encodes other architectural fields (RESS, BADDR;
> see Arm ARM D24.2.206), sign_extend64() interprets its second argument
> as the index of the sign bit. Passing 48 prevents propagation of the
> canonical sign bit for 48-bit VAs.
> 
> Impact:
> - Incorrect canonicalization of VAs with bit47=1
> - Potential stale VNCR pseudo-TLB entries after TLBI or MMU notifier
> - Possible incorrect translation/permissions or DoS when combined
>   with other issues
> 
> Fixes: 667304740537 ("KVM: arm64: Mask out non-VA bits from TLBI VA* on VNCR invalidation")
> Cc: stable@vger.kernel.org
> Reported-by: DongHa Lee <gap-dev@example.com>
> Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
> Reported-by: Daehyeon Ko <4ncient@example.com>
> Reported-by: Geonha Lee <leegn4a@example.com>
> Reported-by: Hyungyu Oh <dqpc_lover@example.com>
> Reported-by: Jaewon Yang <r4mbb1@example.com>

Please do not use fake email addresses.


