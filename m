Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20EFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9R75c4B3rs0HbxR41cROos6qACJLvEn0XkD6Iroq3k=; b=U1NU1ZdMD9FPKZZpofGGffsLuI
	+uv0Bpprim0OxOHstU3ejUxnJ+wmIrs0P3O257aAJBnBJHEDibBiy3dVvins+QvSPuOfbpkO3RO7D
	INjKXem7gpQiHvOfkr2cZqIQFV3ajm5nHNSE7vTWJREkIbdKQfbkD0VdUs4G5Jf7UHplVhyQLmTNp
	AMW6BqlT3o5mJm67jK1qaaIG/ArHmWh9E4qsszfUE3DlYS3PtPrHSxQKx+gOV2DwN2wWLLMY43Qua
	qAB1jZLQYe09VqC+5iOqQLvAwEyGwARWXohwp2hQ2ZuPT0u+70gxSaoTy33ddvdcFof3S/SBDLG8v
	5XDoT/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yS-0000000HSCF-2I3m;
	Thu, 03 Sep 2026 13:59:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yR-0000000HSC7-1H9m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:59:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6ACFF60546;
	Thu,  3 Sep 2026 13:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE5F1F00A3E;
	Thu,  3 Sep 2026 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443966;
	bh=Z9R75c4B3rs0HbxR41cROos6qACJLvEn0XkD6Iroq3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CzrLb7FOXo7LE9TEMuSOSpVB1Bk0Syd308DdfBN+D+WxXqIBZmlJZA+P+JT97RuGk
	 NGli60ocgfW0acoqKWsxvuZf6MaWVynSQS8Xqf69N29HQPF7yOhC2+XBkBTstMZucL
	 htMuf7dTWabNK+9vb9Bz6ZebYnWRBIqESwPYy1wcYQnhnGSHpCzEg+rsBHHHEZTf0G
	 tWNZdvZ+tldcU5SnCCjxWE8gdt/Jw9Xk5sdzDBtsoooyZd00tnotF3CyhJWHtbTDD/
	 UNprbj82ekQUWATlwBIDphH+jcANINIDP+a7v17tsziAPh1BRp1PmAAp+vB8Ty99E1
	 lr7TobbkZhifA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] arm64: Don't read GMID_EL1 when MTE is disabled
Date: Thu,  3 Sep 2026 14:59:15 +0100
Message-ID: <178844061613.4163758.10275612375567336111.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827185937.1369099-1-fuad.tabba@linux.dev>
References: <20260827185937.1369099-1-fuad.tabba@linux.dev>
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

On Thu, 27 Aug 2026 19:59:37 +0100, Fuad Tabba wrote:
> __cpuinfo_store_cpu() gates the GMID_EL1 read on the raw
> ID_AA64PFR1_EL1, so it reads the register even when the kernel has
> disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets HCR_EL2.TID5
> in that case, and pKVM injects an UNDEF the host cannot handle:
> 
>   Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
>   pc : __cpuinfo_store_cpu+0xf4/0x264
>   Kernel panic - not syncing: Attempted to kill the idle task!
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Don't read GMID_EL1 when MTE is disabled
      https://git.kernel.org/arm64/c/5445d6419962

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

