Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA87C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aKITQuC7lDOYRYhuqIpftiQh1+f9VhmR+AXFY6JfPU=; b=hVhhRxGKrsJfu2oZXmlI70OLgl
	7eZt1ozP6AyG1q9J4lj9M/XsN48uIpSzUm1tk3AMKRKs4yLtU3sS3/uSzwRNYAUwS3i4WgPKmKmLT
	MEQjiq9qkTyaANG62eMzGJyUrSoHt7P1ghfecaC+2b2HnEz7ITjZJjbP83u3rnVd2O3xAUOFfko+/
	KefDg4kNUlADDWrvAq2egYlPjK/De5OInM6SssnwT0m+ufEPmYWYLJ4WidjTvziRBsId2Mk/aMn3R
	K20OQxhHbPK8UWFWhiBmt4lEF/LTELNp6H0Kcr+PnqxwktwaszZRq8sRMWvjIrgNZmLkt4p7xcrgb
	ue+PEhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmZq-0000000BemE-3ziz;
	Thu, 26 Jun 2025 13:23:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmXZ-0000000BeRi-1BuG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 13:21:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E54CA517FA;
	Thu, 26 Jun 2025 13:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B00C4CEEB;
	Thu, 26 Jun 2025 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750944080;
	bh=+aKITQuC7lDOYRYhuqIpftiQh1+f9VhmR+AXFY6JfPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwUoYXnTKIotVgQ9fi56SWN7rtlgfAiLS+mqGLJZiRRDNaCzdWZo6mgsRauPOfLbY
	 tQhFBp/UMolBQ0KbK7SCibwEZSN8tJa5UKER60o5H6CJyQS6iR31HSYuS8r/LvJfMx
	 zjH6mIzsT4dk8Z1kk2Zah1d/wf0DRshW7HgYoumycor8dRYL3gVzNxeRysHL22UFQx
	 LDr4kl+QvLGWsA0+UKFK4hI3y8H6+A7r3rYWCyh4pps3r/4bTMGCPs6OWKakL5T1Xf
	 6NHEjA3ooA+9cO2ogatALlrLyCUA7b0QU/6q/5govnrM+oGD5bffdWKdQfVouc5ZXL
	 1ykMS2iVyV7RQ==
Date: Thu, 26 Jun 2025 14:21:14 +0100
From: Will Deacon <will@kernel.org>
To: Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jpoimboe@kernel.org,
	jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
	joe.lawrence@redhat.com, catalin.marinas@arm.com,
	dylanbhatch@google.com, fj6611ie@aa.jp.fujitsu.com,
	mark.rutland@arm.com, kernel-team@meta.com,
	Suraj Jitindar Singh <surajjs@amazon.com>,
	Torsten Duwe <duwe@suse.de>, Breno Leitao <leitao@debian.org>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH v4] arm64: Implement HAVE_LIVEPATCH
Message-ID: <aF1JShCkslGkch26@willie-the-truck>
References: <20250617173734.651611-1-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617173734.651611-1-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_062121_388069_1B0D3361 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 17, 2025 at 10:37:34AM -0700, Song Liu wrote:
> This is largely based on [1] by Suraj Jitindar Singh.

I think it would be useful to preserve at least some parts of the
original commit message here so that folks don't have to pull it out
of the list archives if they want to see more about the rationale.

That aside, the code looks good to me. The sooner we can move over to
the generic entry code, the better.

Acked-by: Will Deacon <will@kernel.org>

Will

