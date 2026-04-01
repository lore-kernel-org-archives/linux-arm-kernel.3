Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67A910F9313
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1AoRf9YGyRQiBnvI/wVmLr8lMEHsVttW5yfw98kgu4=; b=JbQTJnjRnUFT9qiQUUO7BBlMMc
	zg/DD7RP8f6+pH7NdgkXeKKf8OKANBiqzDQRcgKqUo3OviwEZb5qcMxpKrJBCypQi36/d0+iDkyh0
	eOU8dZV8VrFaXKBRYNcjuFduv6THMst3YDLyLRfvnT/vdAXkKtnJTCcaOXhwQGc1L2X8VBNueCdqn
	PKz4uA8ONBLQrW35Sg7gk5Ei9BYOjUAkeQ8uJALhQ6aah7m26Z4vYjfVRPRQdAE46mlo89w72MkGA
	vXpmHg9NO4HgzFqe64IF8jnutp4jp64hR8kLTo3MSckDok0bVpp1tuCZ9SPQE/9DxSZxDODWxR74j
	y0n0FXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w804L-0000000FwXW-1IGi;
	Wed, 01 Apr 2026 18:13:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w804E-0000000FwVd-43au
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6355C16F2;
	Wed,  1 Apr 2026 11:13:18 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378963F7D8;
	Wed,  1 Apr 2026 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775067204; bh=HCk6QnqGWq/tjI6gryKqQx9wBLjxKwloB0kknnpGj2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kQqXxlYEXJiHynomqH66L6Dhq85FyzDJThtM69+GdEXCIr13dzT7IqWO82fmo4Ndi
	 99MPogBcwyURp9iAwW2TSs3W2GSRd3LDD1TcuwkilXV2tLvs0DCu6SB9LqCySB2oPq
	 KLO2zx/RdBMtzLdD9uCguQ2xyHC5UwKRDNuHNxAQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2] arm64: mm: Use generic enum pgtable_level
Date: Wed,  1 Apr 2026 19:13:15 +0100
Message-ID: <177506719514.2866065.11621334581206746232.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318092543.73331-1-kevin.brodsky@arm.com>
References: <20260318092543.73331-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_111329_223418_7B91C73D 
X-CRM114-Status: UNSURE (   9.22  )
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

On Wed, 18 Mar 2026 09:25:43 +0000, Kevin Brodsky wrote:
> enum pgtable_type was introduced for arm64 by commit c64f46ee1377
> ("arm64: mm: use enum to identify pgtable level instead of
> *_SHIFT"). In the meantime, the generic enum pgtable_level got
> introduced by commit b22cc9a9c7ff ("mm/rmap: convert "enum
> rmap_level" to "enum pgtable_level"").
> 
> Let's switch to the generic enum pgtable_level. The only difference
> is that it also includes PGD level; __pgd_pgtable_alloc() isn't
> expected to create PGD tables so we add a VM_WARN_ON() for that
> case.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: mm: Use generic enum pgtable_level
      https://git.kernel.org/arm64/c/5e0deb0a6b4e

