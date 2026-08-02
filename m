Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF019C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sr4eyIZPLWanwYAJIo3G9W6r+iGCRZrMeJZoQ8okwIQ=; b=bsFBR4ZUD5neZmt8LKJYNoIPnX
	j1exQkTmkAXqYsyPiObbj5MjtR7y6PVduh6FnKOEPgNB+IpzH6azKgNSWoaPTGt0KxUnFBkhjFqre
	2IT4ohEp0ZEr1YGag8BwjWlkclzySreCIfggSDYEu4HXqPbueZkIey8l10Wp/GQSD81HUJAYsB8pn
	3VyG9VkzH2iPaVtdXmT5P1ar2mQ6PLvkJXgti+4sYpXcWlfCpDK20Ari1yQiw3b0zJV530fn9LO/3
	tKhqXe9C06k55ZLeR1yck/T0HSPo0vEEOZKbedz1LVmSSVw88s7eWqepKNvs566AYSRcx8XS+t25u
	qSOewWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3f-0000000FbZ1-3Aru;
	Sun, 02 Aug 2026 12:12:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3e-0000000FbYW-3UF2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:12:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41A4743D58;
	Sun,  2 Aug 2026 12:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF3F1F000E9;
	Sun,  2 Aug 2026 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672766;
	bh=sr4eyIZPLWanwYAJIo3G9W6r+iGCRZrMeJZoQ8okwIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CvjWMwJTCWWtrNiZeqtDB6hyap94T6/+ReUgqnvvgwJtIuXGlQ5jpzMp8q0HnxeFm
	 Pq42CofwQNBGidGQqvsoHRkAC8IMertIRsIJq3xBjbjaJxOMEN3Oz+OhFcQr1X1Y20
	 ug1vUoji6tYjKAUhUcvbYZyAeY6mLaNRNYsePBJopCnCxbRwGku65Lzj/yy1PhrLJF
	 rF1ugRPv8s9BiQcCCK5RlkLw0kfffWo/SexA6PSW7z11I5sVbr/ilo0ESHyQ7OTcM5
	 mRCVlwVwzwHAXhZ/2csyFi04GVnlYhTZJTvs/jzjzxTIQ/ICuTJQPgtE9VHPy7RqAx
	 11QyvDKp2GB8A==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] kselftest/arm64: Don't write to P0 in irritator on SME only systems
Date: Sun,  2 Aug 2026 13:12:21 +0100
Message-ID: <178566447595.4144986.14825319968746082587.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-arm64-sve-test-sme-only-v1-1-eb559009dce8@kernel.org>
References: <20260731-arm64-sve-test-sme-only-v1-1-eb559009dce8@kernel.org>
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

On Fri, 31 Jul 2026 21:50:52 +0100, Mark Brown wrote:
> Commit 3e360ef0c0a1f ("kselftest/arm64: Corrupt P0 in the irritator when
> testing SSVE") added corruption of P0 to the sve-test case in order to
> ensure that the predicate registers were covered as part of the
> corruption.  On SME only systems this results in an illegal instruction
> since signal handlers are run out of streaming mode and the predicate
> registers do not exist out of streaming mode without SVE.  Switch to
> entering and exiting streaming mode in the irritator, this will reset
> all relevant registers to 0 if they somehow weren't already by the
> signal entry.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Don't write to P0 in irritator on SME only systems
      https://git.kernel.org/arm64/c/2b989c411ab9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

