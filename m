Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD488C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u/CUMEHJE1r7darJazQnppDclpbOonsLgGsBUo8D1o=; b=CgX2I6rRdMmp0z+pN1K1jzXUrg
	rwbC7nyoDb/n5GToel3Fdl3qezbOwxcKBk8f5xB3/GZ4p2DuMpYMncFaxr5zxWUNB8i71uKpGxLVa
	EZICTV530l/Uf/+2hvM+qXWZA6U+p4iP5eLRq2ubef7qjbfYFyVUzvRIGtbyTzN2bMUKalyllcLoj
	DL4fiuzx5bnoU6udpw3B3sw+OjCelmrmHw6Ghx1FVWYg8ogdBSr1B5y8i9oF04TVDwTftzYWQUR/L
	n0jhIjdygYe8OD7YtFokQ2nIQH2169GpiadMbQuEBKMGO5DA/RfRYp8Fl0Xda4T0jMhiQ7Oj9fKV4
	AJwZ4mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3t-0000000Fbfh-0YFn;
	Sun, 02 Aug 2026 12:13:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3r-0000000FbeX-3zzB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6794860A87;
	Sun,  2 Aug 2026 12:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BF51F00A3A;
	Sun,  2 Aug 2026 12:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672779;
	bh=9u/CUMEHJE1r7darJazQnppDclpbOonsLgGsBUo8D1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Non4kLQtHLY3DHA/i/RsQgWW28Fvwj1qRLo5X338tdcIaExJaTuVrxMedRmhsUPMv
	 yEI5GWxaMh8GVqYpdZa2yZTwLYqvovfnT5W7fi1np7okD/FvWBH+BnAlRF95B5c5gg
	 vjpKi0UR4mwSnbNGD6NiKiPXjO10YK7wEeAY1oqZcvV1bZAMdZmRMqv3YOBSM5wYJj
	 oliO09H5zlj2FGt2KHYU6HxYvynwgKzK3MjhKiGOwnpLJBWoBzM2biuO2yZT84raeT
	 kM2pkV1cm7TlILLJqLVfDI6ONsp+eN8nRo+AonHnz4GzEzu7SRMLCdGWhHQJaBzKek
	 oM/SzhgJl1riw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
Date: Sun,  2 Aug 2026 13:12:25 +0100
Message-ID: <178566399651.4140416.18012923201896956345.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729004255.15630-1-kmehltretter@gmail.com>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
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

On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> sve_init_header_from_task() takes header as a pointer, so for the
> inactive mode
> 
> 	header->size = sizeof(header);
> 
> stores 8 rather than sizeof(struct user_sve_header), which is 16.
> Userspace sees an impossible size smaller than the header it
> describes.
> 
> [...]

Applied fix to arm64 (for-next/ptrace), thanks!

[1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
      https://git.kernel.org/arm64/c/c3f83d021162

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

