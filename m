Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C4ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFQPyVx57V+cC0odMgHnvw08yyUXyUvwWkuH0CTJPgs=; b=c53Hy0VlaeGMUn8kuQlbykZGuW
	PLoqdcRkYXzEbCZQGhwI1+0z0PcPxJbnhLnPz//oIsGN1BkgLTlF/sEjeLSAJuXSAJCztq1En+nGK
	tWafUSP2TTsCcI7lnq8ogI3nXqAqxR61v7RvCA1eVkaT6If9+dwm9ZEfXpv/flksO/q/zu2vavs9o
	d/IvFK1mroF/gVkn7X4Kur02HXHi0OcPwZ5pgFsKAsGewUjT5NEMl+pe2vWnApSH4HEJCWiEMgi/R
	F3DQELL0AvzbJou1g0YUGTWu8CZKGu7p45fLs0QXBoLqWUobYTspMrFVGDLhB66OxD7d3lkxQVOe2
	khwQ7TFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg06-00000003mul-1Erh;
	Fri, 19 Sep 2025 18:38:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg04-00000003mu6-2PHD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34F6341AB8;
	Fri, 19 Sep 2025 18:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50919C4CEF0;
	Fri, 19 Sep 2025 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758307108;
	bh=EeZzWFrfZxrU8fh2GXxBtvaOZgVq6ueEnBhBSJauFWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1aIsfRYpwgGG1ulRgCexm9tZ8cz18SxSmW+AJ/e1l9FzTrztVNzTIa5Y4SAAxR0W
	 oipQkNRT+vAf9yvlaQ6ds6/i9hJOH70tMF9tvymO1jje7ABHNywjN41zug7yYaEY2+
	 wgN+TEhvZpe6htN23Fb+fdqpftk20KG985QTMQeZp+fYbMcm8BQn+JuLwUnfDTT7aP
	 Ok01ljK2KHuj+tPXU7VVbRZ38bjhTepyoU1NlNyUfC5/4KMNXoyCzXmOzUlvtYcp/a
	 sNHOglQ0n1CFJrEUf+lUxTwmRovEDIaSwrk7JuQFw5+0OzLM9TurShOAINtombvFWy
	 DYgp0Wy26aCsQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/2] arm64: Support FEAT_LSFE (Large System Float Extension)
Date: Fri, 19 Sep 2025 19:38:17 +0100
Message-Id: <175828261879.3019927.22813258731218689.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
References: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_113828_631834_C2882C2C 
X-CRM114-Status: UNSURE (   9.90  )
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

On Thu, 18 Sep 2025 20:42:05 +0100, Mark Brown wrote:
> FEAT_LSFE is optional from v9.5, it adds new instructions for atomic
> memory operations with floating point values.  We have no immediate use
> for it in kernel, provide a hwcap so userspace can discover it and allow
> the ID register field to be exposed to KVM guests.
> 
> 

Applied selftest update to arm64 (for-next/selftests), thanks!

[2/2] kselftest/arm64: Add lsfe to the hwcaps test
      https://git.kernel.org/arm64/c/777fb19ed8d6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

