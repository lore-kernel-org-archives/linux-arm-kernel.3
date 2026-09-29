Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9469FC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooj5vDCj/9j1cOXLvEpUybIXmBjqfcRLm8MF0pLisQw=; b=zcUE+m7ueIa+voadbjYS7n2fc1
	5peh9yGxXCghdAUWq++uUkk1Ekm7CHRd+K3qoywENd2xEEeWTTKR62Sf3rrzjX9Q3iluoNbCzgtB5
	aZgnmDTsVztoPhfvMMRGrtk0JoUsPyNzL0IJ17y8JWMM96I8WvqnAJWBxzcUG/n+N5bdCFb1rI2nP
	LVhlH8DGmlwk+/e6JFakQowBAjWBGnLONqaaZfij/jNeCo7zebIROYck93lsiyPoaxkP0+0Sh+tUf
	m1VFo+cEsf7JacBMbo2V4YUdiPcyeWSeeb2+e5/qV/SE8bE4/1GM91vyl2Dlf89x9ezlsi15UZ+lk
	GWngUpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaGx-000000040GW-0RS5;
	Tue, 29 Sep 2026 16:01:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaGw-000000040Fw-0b6r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:01:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 376E060136;
	Tue, 29 Sep 2026 16:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC311F000FF;
	Tue, 29 Sep 2026 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697696;
	bh=ooj5vDCj/9j1cOXLvEpUybIXmBjqfcRLm8MF0pLisQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QMV7Y8wmfmNMjcku6Oye42M0dSXEEggL7XKiPy024xhrGuWRbs3GKIi1GgeHBBE14
	 nxbSPHLg0AT4MVTh7v5j21EeAnrIIPpgEausZV81AisGFPwFIWs+H6kGJce+hRXxuX
	 F7pHNZMuC/c1elz5o2x9wkZeNv7CQjC5Q1baW8WZJrIbVAAuGYW8lrqiu8x6a4koaD
	 WG1nDpIpvkETM9UHZtLQlj2z7aouwVlMU7skDTTWtzHphJ4Lbaq3wSglfpXn8YxkRn
	 JxKE0wvyUCpFbdgphqxXU6o2tsH7mtBTRgP9YCpcn1wVWXspDDBfBBGoz2+51cuPDg
	 +JEbVWZSC4D3A==
Date: Tue, 29 Sep 2026 17:01:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 01/11] kselftest/arm64: Factor Linux syscalls out of
 asm-utils.S
Message-ID: <arvfukSGSxJ6Th7Z@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-1-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-1-31bce995b49b@kernel.org>
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

On Tue, Sep 01, 2026 at 06:06:41PM +0100, Mark Brown wrote:
> In preparation for building versions of the load programs for fp-stress
> that run as KVM guests move the functions that perform syscalls out of

Maybe worth saying that the not-linux bit is bare metal here?

> Signed-off-by: Mark Brown <broonie@kernel.org>

All seems reasonable, the move is clean and self-contained so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo

