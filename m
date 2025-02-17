Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF6C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=id9LtZ/MnrzOfQ9ORPAl5IHzvJ8DzCDlRCApAuionLs=; b=Ci5J+YR+EEwUthe9H/2YtP1dzv
	MZD/7Q8b958Y2iZWlmWEO7rQlHFzkshIjl6dWgCQBI1cD55DgeoooG31unegReZHrr8av1iu79+DM
	a6x+FB6s8rIP/eP5kESYSyBljOiDCs4celcr3EiBBbBILhoO4NacMKiA/6Se6e7fEoSmCHlgKXV+q
	pTN1aNi7QY0T+ywS5/MxQbCwU1dqbWhlBRO8cenqdpyoM3nCVto0QIkrP97gmM3CDGngzE+0In5JN
	u2MK7OiwDmh5uafKEaCt2rz5NeYajvpOHFxI8iqa8Bm2vHCg1BMcV/VgLeNJsXjkZ/Dl9oAF2qQXW
	5uMFYIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8w2-000000063Yr-1TzD;
	Mon, 17 Feb 2025 21:45:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8js-000000061eS-1qAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 21:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA0CBA40790;
	Mon, 17 Feb 2025 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723ACC4CED1;
	Mon, 17 Feb 2025 21:33:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arch@vger.kernel.org,
	Yury Khrustalev <yury.khrustalev@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	nd@arm.com
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Mon, 17 Feb 2025 21:33:10 +0000
Message-Id: <173982794521.4020985.15838989967891150260.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_133316_538686_C4CEA56C 
X-CRM114-Status: UNSURE (   8.06  )
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

On Mon, 13 Jan 2025 17:06:16 +0000, Yury Khrustalev wrote:
> Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> 
> For context, this change will also allow for more consistent update of the
> Glibc manual which in turn will help with introducing memory protection
> keys on AArch64 targets.
> 
> Applies to 5bc55a333a2f (tag: v6.13-rc7).
> 
> [...]

Applied to arm64 (for-next/pkey_unrestricted), thanks!

[1/3] mm/pkey: Add PKEY_UNRESTRICTED macro
      https://git.kernel.org/arm64/c/6d61527d931b
[2/3] selftests/mm: Use PKEY_UNRESTRICTED macro
      https://git.kernel.org/arm64/c/3809cefe93f6
[3/3] selftests/powerpc: Use PKEY_UNRESTRICTED macro
      https://git.kernel.org/arm64/c/00894c3fc917

-- 
Catalin


