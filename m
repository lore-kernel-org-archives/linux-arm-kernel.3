Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F89CC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdoFeUu5GvTX8rBFW3cJrIUVf+aY84rF9rqx5dNRKh8=; b=tj/jKfNv32xw6Y+nD0j2uDGex8
	kGEBZ/je7K6gOS7RdRWIRv+fq+rwVbK5JyJZjGdvHsAB+6E0RWEB1YKct0dvxPWZIy5j9DgLT00Co
	zZj64ue1BPU82BYRJd+/czO5fRXPfWVBEAq502bhN7mooGuvAM48w5U41Pp++Iba9XuJ6kx6K50cX
	YjXx6RaBL8OZzPsY2v/alYAyR7SQH8sIWYfFQOXuYA7l/ei5mKLuSeceL9zKW6JqHUttbmp0mEzbz
	DnhdqF3C5WVrjID65Uoazk9BuVO4OX2oWJyuefCtmu+pwBVKLsL237Pxpr9cChQR20a9ioefjM8X+
	HLk//JrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX7t-0000000Gzaq-3hRb;
	Mon, 24 Aug 2026 16:02:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX7q-0000000GzZs-3mpm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:02:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DEB766011F;
	Mon, 24 Aug 2026 16:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366391F000E9;
	Mon, 24 Aug 2026 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787587337;
	bh=wdoFeUu5GvTX8rBFW3cJrIUVf+aY84rF9rqx5dNRKh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oL3MYuOo1TlVQzpRjyI9MYDJjupL+OGdle/lbGRs24gLXCWfSvbXMzpZ26w8j6Wt7
	 so4DQmY9Vpwe5btinEUOafrffDEs+bX1qvdcgXuVjFDABJU3UhlplZsMEs+pn+KLiU
	 eFyQwioGfNqyHYn+4Avwf6lR2nSSxOb32VpzxcvmIvaNy+y+bO6LkEWd446Fpl+roM
	 Swjz3YGlKxnwymVXA2OcfSWQ8u85pPZTA2QoD/ROGDcL+TCmcJQBGO7dFuHpccgLTp
	 J6zuh+EMKWPnBtNg+0EbP2D+W0psfn8WYrDOzG2HVgF0TrteSW9/i3/AM7gtb09M/Z
	 a/cZ5XJ2MGr/g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matt Fleming <matt@codeblueprint.co.uk>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v3 0/2] arm64: ptdump flush fixes
Date: Mon, 24 Aug 2026 17:01:55 +0100
Message-ID: <178757828014.164243.15117526586847861889.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260814222458.584906-1-weilin.chang@arm.com>
References: <20260814222458.584906-1-weilin.chang@arm.com>
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

On Fri, 14 Aug 2026 23:24:56 +0100, Wei-Lin Chang wrote:
> This series fixes two problems around ptdumps:
> 
> 1. note_page_flush(), which flushes out the last row of ptdumps, does
>    not account for address spaces that have IA < 64. Other than making
>    the last region extremely huge, the attributes of the last region
>    within the address spaces appear to extend all the way to 1 << 64.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/2] arm64: ptdump: Make note_page_flush() range aware
      https://git.kernel.org/arm64/c/902caade3cfd
[2/2] KVM: arm64: ptdump: Flush the last region
      https://git.kernel.org/arm64/c/beca1b97a21d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

