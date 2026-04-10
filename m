Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43D3F45A08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdSkSQdUtAdFvbrEZAB3y+WFJox1e0Or2WgOPpg2+rY=; b=I4Pokt5UJbq2GIkQVfz1fiQKs0
	8fTcrfxNg/lD2Y5Kp6Y3sGXPsAUqOYhIjra9obUvwn/KuTfBUGcEj6+HyUhT/hQ/rDgBR27uyzcVn
	rXlyA1OtaEjXoHptNdh3JPO8rGUW+b1C4A49X+BwIVzhrqo4SMvQzZ79hNSTk4coUlakHLShTrYCf
	PbsJwrYyQ/E2QR8kZ6SSAvbZTDhDokEa1uvyNEUSNSqeUUfS7xhlzrEGCbTad4gCdqLZXrYLvl/4j
	r4XUBP2OlWwCOPEArbOG5nOl/A4Bp1yjNjRvqfSMIaDMpEoeZdNJxWAp9DngxZIuB8nqRSmdAdnsC
	3J/8c+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBGu5-0000000Cgqd-2FhJ;
	Fri, 10 Apr 2026 18:48:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBGu2-0000000Cgq9-0ddC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 18:48:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5857F47E0;
	Fri, 10 Apr 2026 11:48:17 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 022E03F641;
	Fri, 10 Apr 2026 11:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775846903; bh=9J7DVS0oXNqjSXZCOW4yJHjGaEddrMxWW3Sl/Kv/gjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bS9KFT/RWOR7uhG+Frz9bODouWBk+9fldkzsseZm6/sTcT7eTxaMpQhqfbt7WApEW
	 L4Zn7F/APF1Wkf7hgPrWV4EhovS2fzR5QRbKUHpMOfbZlocrMLpA9eEYwwSWN4uR5W
	 l5pvKpaKVdo6J367hFS+iATAr6Lgl1DGfPijBxV8=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 0/4] arm64: Work around C1-Pro erratum 4193714 (CVE-2026-0995)
Date: Fri, 10 Apr 2026 19:47:21 +0100
Message-ID: <177584684178.284859.9787043758799996499.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407102848.2266988-1-catalin.marinas@arm.com>
References: <20260407102848.2266988-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_114826_256129_98AA0567 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, 07 Apr 2026 11:28:40 +0100, Catalin Marinas wrote:
> That's version 5 of the C1-Pro workaround. Version 3 here:
> 
> https://lore.kernel.org/r/20260402101246.3870036-1-catalin.marinas@arm.com
> 
> Changes since v4:
> 
> - Static sme_dvmsync_cpus mask to avoid allocating under stop_machine().
>   Sashiko was right, even GFP_ATOMIC won't work under a raw_spin_lock()
> 
> [...]

Applied to arm64 (for-next/c1-pro-erratum-4193714). I won't push it to
Linus in the first round, waiting for a bit more testing from Will. If
all goes well, I'll send it in the second part of the merging window.

[1/4] arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance
      https://git.kernel.org/arm64/c/6bfbf574a391
[2/4] arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
      https://git.kernel.org/arm64/c/d9fb08ba946a
[3/4] arm64: cputype: Add C1-Pro definitions
      https://git.kernel.org/arm64/c/2c99561016c5
[4/4] arm64: errata: Work around early CME DVMSync acknowledgement
      https://git.kernel.org/arm64/c/0baba94a9779

