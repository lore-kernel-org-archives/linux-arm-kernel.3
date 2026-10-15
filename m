Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51303CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xb0+A7ozwceFiGZap/TB5WKjAn8jKMnSOCqVk9xh6dA=; b=TYfJDGBi7AXU8ehbvqg6Y8JAqY
	e7bDCyxLZsIJJ7uS6THpyUSCWPxoK9kLRr0vqvM7Jm106sopkDxnY+iFBvlCiKSYjNVqAUSCSa1EP
	W0LMLqpBvDcO/+JtuyMDoCqA/p+mwgtkFZSRexpAA/hVqdgKJY8iVg88AiSry09hQZF0/9zFPy46S
	Mj+0N2klebVL2uFmzlhkButHbr7fOCWJJIoX73kOg3XE2n6LNefExFD+glAvMLqtTGxHahnCnDaBl
	ymoEzkT/3UmmrCt3FQ3A2sxKRqtmuYcmkIIlfQ+UMuWcb0LPHpYyBIw39vMvgal2EflEdxiLFFyUG
	CiMJWCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPX0-000000012VW-2LBQ;
	Thu, 15 Oct 2026 17:46:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPWz-000000012VI-1ySI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 17:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xb0+A7ozwceFiGZap/TB5WKjAn8jKMnSOCqVk9xh6dA=; b=TDJbRuZM5iGT8otxkrCYMf8lxY
	ubyRe6aJDt3177Qg2JCr77W/BAOGjnO90ZKNZbbobKkWxy2b+ZJjUoBwJihday/LGSdsKJsLy7tDk
	g8nOuMkD5xCNtbwA/WknnJxBJKs3Cm948GaCi+Yig72a9qZm7gpE8B1OuZ+P1kXN0WXvcEoEXs5fw
	XQVfRjaTxFOzXWirQ/xuwe0SINBH1e1BIAW1JBE+HnAywMLHM4TMb59PfT28BVnMYRvGUiXGY8tDU
	LX3FFXP43ncShZ+SSeIV3MMN7ycMZlY0zHRI3hzh4fz+GezDq/6hAxcpTD6dtqvtbFzUoQuiGOkvd
	A8errJNw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHPWw-00000000glK-1AIc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 17:46:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1D0614BF;
	Thu, 15 Oct 2026 10:46:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3BD03F7B4;
	Thu, 15 Oct 2026 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792086371; bh=ZcBJl+1YsL1i0rpJaSh3sSGUpQjDAqsQLBJYELIC3bY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmNb7l6/AnyI4r5dhqctAbBolDjTTifnOOP16R2tXBoFVoSYpXvm+bZDNbyY6G9xJ
	 BWkmbUCVIHtHnJotwWIv79b3yW13Ubw4scQJbLBQJLfYBhcZxwnwWZa+gTY6HRIKX+
	 0EC4GoHyUZWmeFf3Rh7NatqFRfvwvHn0VSbHP3gQ=
Date: Thu, 15 Oct 2026 18:46:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] kselftest/arm64: keep building and installing after
 a subdirectory fails
Message-ID: <atERXTfz9xsIuv-7@arm.com>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-5-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014200115.1363363-5-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_184614_559341_C9BA814B 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Oct 14, 2026 at 04:01:12PM -0400, Sasha Levin wrote:
> The arm64 suite builds and installs its subdirectories in shell loops
> whose status is that of the last subdirectory. A failure in an earlier
> subdirectory is therefore lost unless FORCE_TARGETS is set, while a
> failure in the last one fails "make all" and, through "install: all",
> drops the installation of every other arm64 test as well.
> 
> Make each loop fail only when no subdirectory succeeds, which matches
> how the top-level selftests Makefile treats its targets, and keep
> stopping at the first failure when FORCE_TARGETS is set. When a build
> report is requested, record each subdirectory as arm64/<subdir> so that
> a partially built suite is visible even though make succeeds.
> 
> Invoke the subdirectories with $(MAKE) rather than make. The command
> line variables already reach them through MAKEFLAGS either way, but
> $(MAKE) lets them use the parent's jobserver and makes -n, -t and -q
> apply to them.
> 
> Fixes: 313a4db7f338 ("kselftest: arm64: extend toplevel skeleton Makefile")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Sashiko had a comment about breakage ARM64_SUBTARGETS is empty. I think
it's a false positive but I didn't check.

