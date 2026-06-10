Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA062CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56ae2tTSjcXJ88ykVgJzz9Ikff/rhabGqb3ncTUgDnQ=; b=X+0J6ZggjmJygBP7ENFQRghLXU
	muBQyuWGFanQvIVI9Sj9n/B698ClgwUo2kloAfEy+qsvzUgLjFx9lLHptUYkyZsS9Z8QNHtwGHiOD
	heXyTuRFpO9u6eUtJilDemiHap3GQjSRpMlCqRnbEILiGPNEuqtKU/lm0ZYT1Gnc+VGlKqr+l/H78
	rpMTe5C5zcNVowMX9nhCpJFUyeCXFAugqVaxEWZaP7yh5UdqaavYkuKrgtJIyBUCdCAPb+n0uM0VG
	YZpgclco7lmAZfL6L3jvHix28qmnx5AiEQd5aPskz/TQOl1fJ5edxDJJpaJjWNo5jjCPq8R6bFssi
	AHeFWDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGOU-00000007RNG-3O8L;
	Wed, 10 Jun 2026 10:42:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGOU-00000007RMo-0iIU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:42:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8A0142B38;
	Wed, 10 Jun 2026 10:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F4B1F00893;
	Wed, 10 Jun 2026 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781088165;
	bh=56ae2tTSjcXJ88ykVgJzz9Ikff/rhabGqb3ncTUgDnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZGUZzfff4t1uUNU2Q/KzIC+GEB5ysKi955LwdWPG78FYZb8nT3zwXeUuozw+8cHfZ
	 2apA1PfqH83tA30sgwwSmPaSBjhK0CSZ3ySoby3SPklvKoPr7Qdt7vidbbqumxbhkG
	 R4Anyal9FCHFYW13UGvU6YpsjYSMicMc3Ye2ycguhDc9hZoCIrVjybgnzJFc6BYyCK
	 jNOihbDH75SO7LSe377LAx4Q4lsxkZzUu9OgBPK6t3i6qz6c2/8PVS9Xss3cX+DHHn
	 Rf+sTb77oB1UH7lNaZcc4+bikE/RNY5h8qc8qJRq3hG2qVpKGlK5PHLe0IrQM4PLZ7
	 f1WBbD81Ektew==
Date: Wed, 10 Jun 2026 11:42:41 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oupton@kernel.org>, Aishwarya.TCV@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: -next boot failures during KVM setup
Message-ID: <aik_oVrNHUrh21MB@willie-the-truck>
References: <aicVyebkEMs6w6UV@sirena.co.uk>
 <87tsrc946i.wl-maz@kernel.org>
 <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com>
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

On Mon, Jun 08, 2026 at 10:56:12PM +0200, Ard Biesheuvel wrote:
> Given we're at -rc7, I'd lean towards dropping the whole branch for now, or
> alternatively, only drop/revert "arm64: mm: Unmap kernel data/bss entirely from the 
> linear map" (and its followup fix "arm64: mm: Defer remap of linear alias of
> data/bss") so that the region always remains readable via the linear map.

I've reverted those two locally, thanks! I'll push some new branches
shortly.

Will


