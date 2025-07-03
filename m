Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F2AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1voOoyIA25yRNLI8J+XQFRGehykAjWFbluc01VHjGtM=; b=upu0usVi7aVc0a3crDaXN/yONS
	A6VnbkgJ7wusYDW0LbNAl7nLA3jsvYBW2eK3MUOxrqvYiBh61q8UJFh1SZ5F12Vqz/kQ0qQuP870g
	BAd6kVDCRZqzZesXp7eRwpTZ3FQIgk1Qv1o6PP7eoksbgirWS1zYSdywhNqH1LTUjZff4e93zpBxS
	Cr/KDKq2ETTwwjUGNLcRLAmUyxxuH25VRiBSDNYwFsHhqAAOxfpFKvVm2SnEw0GofATV+fwAgUDb3
	Bud37xIeg2HCVZ/B96fN0ugw9U2N4fvfgq8XC0cIQgrv5318YgWvjIDZmUqQngBxR+a95nWVpciHv
	SLahP06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR4Q-0000000CZgb-3EI9;
	Thu, 03 Jul 2025 21:02:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNlT-0000000C9D7-3vWg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A0285C54EB;
	Thu,  3 Jul 2025 17:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123DDC4CEE3;
	Thu,  3 Jul 2025 17:30:24 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH v2 0/3] kselftest/arm64: Update sve-ptrace for ABI changes
Date: Thu,  3 Jul 2025 18:30:23 +0100
Message-Id: <175156379920.3469134.14157042416856750044.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
References: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_103028_015468_CB2F0962 
X-CRM114-Status: UNSURE (   9.76  )
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

On Mon, 09 Jun 2025 16:25:30 +0100, Mark Brown wrote:
> Mark Rutland's recent SME fixes updated the SME ABI to reject any
> attempt to write FPSIMD register data via the streaming mode SVE
> register set but did not update the sve-ptrace test to take account of
> this, resulting in spurious failures.  Update the test for this, and
> also fix another preexisting issue I noticed while looking at this.
> 
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/3] kselftest/arm64: Fix check for setting new VLs in sve-ptrace
      https://git.kernel.org/arm64/c/867446f09058
[2/3] kselftest/arm64: Fix test for streaming FPSIMD write in sve-ptrace
      https://git.kernel.org/arm64/c/94ab150010f4
[3/3] kselftest/arm64: Specify SVE data when testing VL set in sve-ptrace
      https://git.kernel.org/arm64/c/9e8ebfe677f9

-- 
Catalin


