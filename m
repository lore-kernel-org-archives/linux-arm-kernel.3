Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34044C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NU3Qy6+p2XwSww4AMBEQzj50cNrsTlHhbl2ITppcJdg=; b=N/Fjx+kYMwHFMrSs2AqAKG4lRA
	kmDJlDt7vdZPp1NjsChHboQvPOBGNtEksd2lXGv8yNksYB2QMHChWJmYtErswcfJ1eJQmaeI6cO/e
	8b8bJNrUUBJg+PxMI3XO4KkGrcK3JJml9rA5mFqN6zERsqc6m4IDuKZXWZ59BTu9xWP2OVXkz1pjA
	ozotz7YzhyQo3rokawZ08DDv0dFJVUsvx25Hc/ZhLCe4MGkIkhEH+RchEsesgMCp2ERm7bNOgV505
	mcxwPnhHW4oHOGLsh7ho5kIWPVTVKn1NZLQHIR5Jdn1dVyUBUnxz2M76SluPJUmIeGd6VA1Ecckgt
	9i3JSjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1e9-00000006L7z-0OoT;
	Thu, 06 Aug 2026 17:12:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1e7-00000006L68-3kHG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E8FF42E99;
	Thu,  6 Aug 2026 17:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8331C1F00A3D;
	Thu,  6 Aug 2026 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036363;
	bh=NU3Qy6+p2XwSww4AMBEQzj50cNrsTlHhbl2ITppcJdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LWXSBVoSo6E3S3ESjNiXWKg/SrLjnps/ec4aqlh/WjBbxvC4DOhbVyLWaIaJk6AmM
	 gk0yon14O94m7ZGP9qPbt4jcYt1TRUYdM1QUtMOifLXbU0ITQVLszHrTKGVje2Zcfj
	 4QKa8G/Obm2a5jKaoM4Z/a1OVqB+1+PlJ9WMfDrZhxGe4kf4DQuKN9ud4CYJqjs5EK
	 xLGtlfRW+GeJUKeu/BbZwJRqdLROdLSkQ+SZQ2UXfjvodIeeRVJ3kuxWTPfTkuBOT7
	 e7lvjlUZfMa8VlghtX8KIbhp7Rdt+Zw1KXJlv7oS/2HSPUPmTf4b5a1Y82/vsp6Ut9
	 O5DRurJP/gDTQ==
From: Will Deacon <will@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arch: arm64: add early_param idle=<wfi|yield|nop>
Date: Thu,  6 Aug 2026 18:11:51 +0100
Message-ID: <178602185639.422567.12281019594187208555.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev>
References: <20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 04 Aug 2026 19:23:15 +0200, Yureka Lilian wrote:
> Overriding the idle mechanism might be useful for debugging and performance
> testing. Add a cmdline parameter for it, similar to the existing idle=
> parameter already present for the x86 and ppc architectures.
> 
> It is also useful on platforms where the WFI instruction misbehaves,
> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> be treated as an erratum and patched using the alternatives framework.
> However, in the Apple Silicon case we need more flexibility because it is
> difficult to detect whether the erratum applies. For example, Linux VMs
> inside macOS have the same MIDR and may even seem like they're running
> in EL2 in the case of NV, but should continue using WFI (it's trapped and
> handled correctly by the hypervisor there). Thus, we prefer to
> let the m1n1 bootloader add the idle=nop parameter[1].
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arch: arm64: add early_param idle=<wfi|yield|nop>
      https://git.kernel.org/arm64/c/d97afae6f16a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

