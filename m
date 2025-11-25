Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A68D0EE3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwy8lEzu0DXK5GvcEEbZtQoKcEvxsPJIvPgI9uQM5Z4=; b=hLEEry9eF0E0/yhxL+SF5jAHa0
	9QkuPrll/Da2LVfwvy6HyUG43D1CN5UabNEEYCfdqlsq+iZzpHG+2LZoqsPFcnf1qacuUOsvz4P2E
	fu7CVsjSr/1uSa/QXIp3vwn/TDvbwXdor5Oy+i7Okrg7wiFDiXsQSUBOscseYXeJ+C1mo2itIl9N2
	wD16bRRF0zAIkNiW6wHlJ6V6LI2DkWMwP+kVauS3gbcO8e142SHj/uvVDwmy3olSidTxaPEOReCZb
	tXNJK0+nGXtkFpM25JESVsv7Qb0sTvJpBzkgsaXFvrXeiZQBzYuJmz1WA+kaBe/ZYoCLFZL8yJYTe
	oV88SoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Zx-0000000DxzV-0CKl;
	Tue, 25 Nov 2025 21:28:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Zu-0000000Dxz9-3YBW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 21:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2181F43EFD;
	Tue, 25 Nov 2025 21:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7399C4CEF1;
	Tue, 25 Nov 2025 21:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764106082;
	bh=Lthp2oIt0CjSTyCBl6DdHeK3C8f8yjc6ypdos1FTR5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgIVQwWURIbdEZ3ocsensRhZKL7wV1xvWkKKDVbNit1OCAkrfIeYyvEjdmnrc/WnJ
	 0ZQtSoKlCgewMZ4UKWi61o3MsHQ+eY96LzKigyGHVcQSj9BDvAhwMgJqJuZfYDPkMx
	 fhK0jT5wwgXCvV+tYevIKTXpj0YudgyN21qUXMtAbPlNDE+jdNt2CHLfbaC+8OBotj
	 Q9l0MqTSDTXyg9bMiJP9qmT6BTqs2wKAz03bgDfb2PPIr+JBauloeEB36jvAG1Wqhh
	 TVzKkVFvkKsK0taA215mB//BuTcCRSzNP0I7Li/RBDqMJXsWLFU92GMvMt0FJ4febN
	 LaBG86xAkv65g==
Date: Tue, 25 Nov 2025 13:28:00 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	shuah@kernel.org
Subject: Re: [PATCH v2 0/2] set_id_regs cleanup
Message-ID: <aSYfYC4UE3H9SDs7@kernel.org>
References: <20251125101207.1492580-1-ben.horgan@arm.com>
 <86cy56qgi3.wl-maz@kernel.org>
 <aSX2CSJEwUYkn5GQ@arm.com>
 <87cy55galp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy55galp.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_132802_925777_F5027DD5 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, Nov 25, 2025 at 07:45:22PM +0000, Marc Zyngier wrote:
> On Tue, 25 Nov 2025 18:31:37 +0000,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > 
> > On Tue, Nov 25, 2025 at 03:27:48PM +0000, Marc Zyngier wrote:
> > > On Tue, 25 Nov 2025 10:12:05 +0000,
> > > Ben Horgan <ben.horgan@arm.com> wrote:
> > > > 
> > > > For this v2 I've dropped the ksft_test accounting fix. Mark Brown has
> > > > more extensive changes [1] and looks to be a user of the set_id_regs
> > > > test rather than someone just doing some cleanup. The other change in
> > > > this series is to remove ARM64_FEATURE_FIELD_BITS from the tools
> > > > sysreg.h header rather than the kernel version. I'll send a separate
> > > > patch to remove the kernel version.
> > > > 
> > > > Tidies up a few small things in set_id_regs. The removal of
> > > > ARM64_FEATURE_FIELD_BITS touches other code only so much as it removes
> > > > the define but set_id_regs.c is the only place its used.
> > > 
> > > Acked-by: Marc Zyngier <maz@kernel.org>
> > 
> > Thanks Marc. Shall I take these through the arm64 tree, together with
> > the removal of the macro? They should have probably been a single
> > series.
> 
> Oliver is in charge of the merge window this time around, so I'll
> defer to him, but that's absolutely fine from my PoV.

Catalin, please go ahead and apply. I don't believe I have anything that
will conflict.

Acked-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

