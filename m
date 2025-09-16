Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C12BCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqnD61khl9JRDJtjgzdH3fut0T63WduvpR4NsqB116A=; b=LmLxbm1M9UQkk6UtqQ4SO0uDLm
	D3eF9k0WCv3D+8ChrBvkPInt4HceyGqteCer5Rwsy1ohxaxTEaYRboSA5WuI8zm4mXl1flWmvatj5
	wpnnxQwn1XCn4wkgTlKjxTp+EvH97+VI22pS22iSHNPxx0h5Aeew65HhZVPMchWd3gvm15irqxYpB
	P0hRJrxyAUc+NgdwX/yog2LaC7RZjn4NRqEo2YAl1OP6HlXy7MtEvq4pLqmZiP4npIJmEFhpAjkQR
	2x5U7LLo17sAo/8PpmBjQ9QUroLIMsURMAjUGYXquk23syFk7dCbHP8xOf7Xdf+7WGyqLgUlO0jmD
	BnpdHLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd02-0000000991T-3L9g;
	Tue, 16 Sep 2025 21:14:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd00-0000000990m-0vrq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A39B4601DD;
	Tue, 16 Sep 2025 21:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896B2C4CEF0;
	Tue, 16 Sep 2025 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057243;
	bh=K6QIVOKKiauyeGJ2OmH64VPm/LdUrqJZS2Q1LLOKYHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YKIC000t9zgbfhZj7Haafps3nC5ZbOvaN3gQFKr5R6Lqd4RbzZdb0HrvCHDmNoLyw
	 o+G7sO56655SUxyyNL2VSezKtC7ciWy4oRTH7dBx5h4RDKdAME76WmsuKmapPMMeZd
	 wjdCff6DPZm+d2CqZ6jzF0Vib3No5DcS7YmxijnzkmTXWAI+HWlpEAvSY3/j3XGU0r
	 x9uFoJ7I5zsPSz+dCEjHU5bqKBl8YJsIiErG8VLnbXeF6f5wuToFav2iTlnxsO1C+Z
	 WlRfTaDd1gM7/h/2KbW+g3rt7b1XK17FhckOIw5GfaGMTehrRtpyXjMnYAMRY+OuvV
	 qpZaxU8I97xpg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Sam Edwards <cfsworks@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: Re: [PATCH v2 0/3] Type correctness cleanup for ARM64 MMU initialization
Date: Tue, 16 Sep 2025 22:13:48 +0100
Message-Id: <175805162005.266431.9349963404486851031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904005209.1494370-1-CFSworks@gmail.com>
References: <20250904005209.1494370-1-CFSworks@gmail.com>
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

On Wed, 03 Sep 2025 17:52:06 -0700, Sam Edwards wrote:
> This is a small series of type correctness and readability improvements for
> ARM64's MMU initialization code. When I first encountered this code, the heavy
> use of u64 to represent both virtual and physical addresses made it difficult
> to understand where the demarcations were. I made most of the changes in this
> series while troubleshooting a different problem (fixed in a separate patch) to
> make that boundary a little clearer. I am submitting it now in the hopes that
> this will improve maintainability and readability for others.
> 
> [...]

I must confess, I don't personally see a huge amount of value from these
changes. However, I've probably just got used to things and so if this
would've helped you understand the code when you first came across it
recently then I think it's worth having.

Applied to arm64 (for-next/mm), thanks!

[1/3] arm64: mm: Cast start/end markers to char *, not u64
      https://git.kernel.org/arm64/c/030b3ffbdac7
[2/3] arm64: mm: Make map_fdt() return mapped pointer
      https://git.kernel.org/arm64/c/c56aa9a67a08
[3/3] arm64: mm: Represent physical memory with phys_addr_t and resource_size_t
      https://git.kernel.org/arm64/c/b868fff5b10b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

