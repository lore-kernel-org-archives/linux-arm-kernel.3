Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2F7CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ca5lhGGqaBETqt40r7l81d+A9rLEDgpXwZzo2yCZ60=; b=epkKlUecSCJZEOlCKqflXj5Jgm
	r5b3Ekw1/U+PgaqRUt/bKBW9XEdKdBTY2vegKGXK7z/+ATwJ+Q7h4+Xx5FsxEDXTCM61HE8M9dlaQ
	hRH+PqmJd7CyWqH7TeG1mT2iuPfUeHRzBoDkJXd9H+CtaGlIkCGOKHxmM05RlIxRpoxUQg8cWizvi
	Fj2YCSGb3a6EYHkhXAVYeyfiOI5hg/B91vsoJQdP+WxgoLD5GrU6mWLTDjDZ8ChFMu012zln3nTbr
	HW188XOsbqXI3MQm1Rg3jMUBMk+PjbBz8RLo6fMUQEg4oBNZ3xFNKEpmEeHBSTblYjRUkLko4y1Ql
	5g7Q9CDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmz-0000000016g-0vmp;
	Fri, 07 Nov 2025 15:54:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmx-0000000015E-2dFO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:54:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CA406191E;
	Fri,  7 Nov 2025 15:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A98CC4CEF5;
	Fri,  7 Nov 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530850;
	bh=ThVCjD0ZazmJiDGZYe6R+cB02JSMq5aoBRsaUWqYnxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qFJld62mhwNq7PWePzTFsedd+c5UTwWQFiRGByxCkJ+IZNn5h8Zzdmv6CHk8oGaej
	 9FHkSAMcm4JwiRYufuuayNXyahhJ6tJfgypUYG3AsfZbNu37tZpHDEneln6BJWT0Fq
	 Ams9nwLCngn68BtzCQyF/wjA5MyERiFikX9gR9S41r37mrA9UsDHbURahPPrP8H4Qp
	 Ch+8f2pS91tXQXlMdlyVXLjtEaNcNgko2C8IJHBzzeC1jY2Kj66i8l+9+vnzcR6T5x
	 ZzICbfcZ5LSoQ9e9/c5mOftmom3lZ15ON8/6MemLmdz2yslh2Wf6zxnA84UwzjtSsD
	 IR4ZYZl4hIfqQ==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	catalin.marinas@arm.com,
	shechenglong <shechenglong@xfusion.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stone.xulei@xfusion.com,
	chenjialong@xfusion.com,
	yuxiating@xfusion.com
Subject: Re: [PATCH v3 0/2] arm64: spectre: Fix hard lockup and cleanup mitigation messages
Date: Fri,  7 Nov 2025 15:53:47 +0000
Message-Id: <176252676626.598584.6910045504284939214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251031091507.1896-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com> <20251031091507.1896-1-shechenglong@xfusion.com>
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

On Fri, 31 Oct 2025 17:15:04 +0800, shechenglong wrote:
> On Wed, Oct 29, 2025 at 11:45:54AM +0800, Will Deacon wrote:
> > Is the compiler smart enough to store a single string for the
> > "mitigation disabled by command-line option\n" part? If not,
> > you might want to use %s to avoid wasting memory. (I was going to
> > check with llvm but I'm unable to apply your changes due to whitespace
> > corruption).
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: proton-pack: Drop print when !CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY
      https://git.kernel.org/arm64/c/62e72463ca71
[2/2] arm64: proton-pack: Fix hard lockup due to print in scheduler context
      https://git.kernel.org/arm64/c/7f1635737823

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

