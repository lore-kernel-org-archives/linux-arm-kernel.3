Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C95C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWu/s8lMLLfBf4lkT9Bk6wYVwZ1FTPhp/al1n5d+IRk=; b=YNEse13d2hk4xoRl+jcu3I7Tfo
	hlyU8ad9R1Sp7IqeUZS8VtZHmq3qtFBGaAqMYe7lWai5ZbBiPWBsgVzOY8/igcF1d8KfY1wzRavJr
	9nSZz2Ahy2ObdzN9rocQwdAJIdwUuAPjOPWfLpghUBdlmIRkqAKW/s2cSGtP4LUgtdfnuSHxzJwKh
	1wtNJ5Sp7nHubrq6PSidyUb4/iqy4cwyPDs2qJQdYnbhv4kw72PcPzV+7OBU40x4UNDs8LtP8q2Da
	+PWHALJO8G3WslBuVkufjLYCd/9P7VIn6NzEL8xw8P6I9SNlG3BwFbsyt6vMzoI6y8sZJu0WEFLFc
	WE4B2D2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KxR-0000000CHR7-0Rt0;
	Wed, 09 Sep 2026 16:15:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KxP-0000000CHQZ-0S64
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:15:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB5F600CB;
	Wed,  9 Sep 2026 16:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2541F000FF;
	Wed,  9 Sep 2026 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970530;
	bh=IWu/s8lMLLfBf4lkT9Bk6wYVwZ1FTPhp/al1n5d+IRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hl7Jn3Ls1CaoYaltrfRyS4f/DNThrjpB+irbvZ6TWX8l95qV5vld65L/nej1RIScw
	 3z3sY6A02ciq3e0pkB2dgDVFQmfZaGwKSIoDz1Fee773GXiegGOcWgh3u0K9VAKjxW
	 GgDtujnfJFpp7+f43TFYsBepMto57gBRqVZH+AWEv8On/gqD9LJon5iIKJGPwrSsCR
	 QYC72+qRLaW4a78Qam53WZN/Rug1xhuDh4nHdu8XjXykpjvI4bsT2d3cbvW6I8H3Na
	 8PCafY0tGvjWn6hkIMu4Oxu/LBHsdgBHhcyy4qzEuF3+8rzFj4/95+JZTfS65JSWZ1
	 uFn6rWTgf240w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Bradley Morgan <include@grrlz.net>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
Date: Wed,  9 Sep 2026 17:15:20 +0100
Message-ID: <178895828160.667293.6440468899339525914.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809213615.11646-1-include@grrlz.net>
References: <20260809213615.11646-1-include@grrlz.net>
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

On Sun, 09 Aug 2026 21:36:15 +0000, Bradley Morgan wrote:
> swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
> vectors with an hvc, but never passes the arguments. x0 is not set to
> HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
> dispatch falls through and returns without writing vbar_el2. EL2 is
> left pointing at the trans_pgd copy of the vectors, a page that
> swsusp_free() releases right after resume.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
      https://git.kernel.org/arm64/c/955d86e5f3b9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

