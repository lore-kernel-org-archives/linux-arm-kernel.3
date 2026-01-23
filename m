Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295A8D7789D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QH/3uiH0aIpJY4532Ml09fjG26pabwSXLGiZCp4Vxbw=; b=4p6r7pfTkhZHzM2J5F6wJ6sgP9
	bCKutwxKT0ZkGRZcbnOmtCSM4l97Wovi0Fdj+bmGvwp+DhFd1UXCTheyaGC6WpIQoPVXuCCdxoGQJ
	eQ2SfVgGKwyK52k/ZVN/XaBMFxiDArYQqNq69SIW31rOU6WZVWqHSA7zAyzfCVwkXFNU+lmHryZWg
	RVV88ALxBWiECLN/ituUacJ2PoYJc8WeU5xwR85V2mJ58raUQYRremomsAyauUzDWsP9OXVq2Xmst
	nygpuNKlsxAu1FhExWlIw8E3Kl8lisbXnK+1II9NF0S3brEBVUpPqbaoqorbfROWV4m0OZ/R0SsIa
	raAAK7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIY-00000009JSC-21ag;
	Fri, 23 Jan 2026 17:50:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIO-00000009JPU-0r0u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7167C4459A;
	Fri, 23 Jan 2026 17:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40610C19424;
	Fri, 23 Jan 2026 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190607;
	bh=pNDw2hoRSoUTdVAMzmKFR2iLJdLsJKYyv1Q6f1ot0x4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KSkobJ1PuDzl3BZW/6RSLzYhStZSQ2v5BISMF3Dz08or/CD1gwUKeWQGFmIYzWCr5
	 Faqs+7shujGbSQbvR0V2ly0H5qUprgjZ4Doi5O2+dM9Ir8aM5dJzRMDtANzg+HF+O6
	 VqMFaxuOvdBPTHckF5me8lSkWHZpu9ReDkrKz3iZy0cdBoxw8CxoZ2LhaOmREtJt7w
	 LJRaOdqdda/ipGe1fOATg0t/GGPgn+pC0OtyEOQ279BS+HZaWvYcS8PTjD2Com46we
	 P2T8N0ak/SPu0vKV2nD90rxyxIdhGEQerzri00u02HaqhPD6U922FJZSVJuiprYCEB
	 H8EpDzztgVSmw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Lucas Wei <lucaswei@google.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	sjadavani@google.com,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: errata: Workaround for SI L1 downstream coherency issue
Date: Fri, 23 Jan 2026 17:49:49 +0000
Message-ID: <176917501918.797415.179034767474498162.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114145243.3458315-1-lucaswei@google.com>
References: <20260114145243.3458315-1-lucaswei@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_095008_263674_00CB3A7C 
X-CRM114-Status: GOOD (  11.25  )
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

On Wed, 14 Jan 2026 14:52:41 +0000, Lucas Wei wrote:
> When software issues a Cache Maintenance Operation (CMO) targeting a
> dirty cache line, the CPU and DSU cluster may optimize the operation by
> combining the CopyBack Write and CMO into a single combined CopyBack
> Write plus CMO transaction presented to the interconnect (MCN).
> For these combined transactions, the MCN splits the operation into two
> separate transactions, one Write and one CMO, and then propagates the
> write and optionally the CMO to the downstream memory system or external
> Point of Serialization (PoS).
> However, the MCN may return an early CompCMO response to the DSU cluster
> before the corresponding Write and CMO transactions have completed at
> the external PoS or downstream memory. As a result, stale data may be
> observed by external observers that are directly connected to the
> external PoS or downstream memory.
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: Workaround for SI L1 downstream coherency issue
      https://git.kernel.org/arm64/c/3fed7e0059f0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

