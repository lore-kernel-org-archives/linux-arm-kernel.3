Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18DAC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IUeP4XGR/AnWtvYJ5LR2LbppBE7iYiM8O9aVQ135Xg=; b=QY1SkCRf0DFOt/i3Xe2/ZLo86+
	plD3W6hLfcP4DljJvLjxeoHR4ixj31NNxDrUEvinC7DJ+W01XXHHKotcMgLdDhs02v4Ak17rDDcEn
	Gp+PdoZWpdi7fWrnAZmNIiA4zTL/NLmRa3COS/UH7ftgc0XHxhp9UGR93yuwY4T/siNRfSA++SlaI
	Fo4xF1ClMaKbO5JY7dnsz8WzYfTAzsnSds92EWcE+egFjQcSTXk4UUVu01rnWKoJeDwBQXOB1Vio6
	gkQHXKiluy4yUiysYFJZMzwWfERu9HGDn81RmJVFN9wX/gUf5NA9sfaBBpu+k4b8WupovgtxYS6qZ
	jq7LRjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJV1f-00000008c4F-3qpc;
	Mon, 26 May 2025 10:25:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUzX-00000008btr-09qb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 10:23:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32BE72F;
	Mon, 26 May 2025 03:23:16 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378BE3F5A1;
	Mon, 26 May 2025 03:23:30 -0700 (PDT)
Date: Mon, 26 May 2025 11:23:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] kselftest/arm64: Update sve-ptrace for ABI changes
Message-ID: <aDRBHDJZyXnic6i7@J2N7QTR9R3>
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_032335_115556_BF92ED48 
X-CRM114-Status: GOOD (  14.17  )
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

On Fri, May 23, 2025 at 04:27:11PM +0100, Mark Brown wrote:
> Mark Rutland's recent SME fixes updated the SME ABI to reject any
> attempt to write FPSIMD register data via the streaming mode SVE
> register set but did not update the sve-ptrace test to take account of
> this, resulting in spurious failures.  Update the test for this, and
> also fix another preexisting issue I noticed while looking at this.

For the sake of the mail archive, that series of fixes was:

  https://lore.kernel.org/linux-arm-kernel/20250508132644.1395904-1-mark.rutland@arm.com/

Evidently I only fixed up the fpsimd-ptrace tests, and missed the
sve-ptrace tests. My bad; sorry about that.

Mark.

> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Mark Brown (3):
>       kselftest/arm64: Fix check for setting new VLs in sve-ptrace
>       kselftest/arm64: Fix test for streaming FPSIMD write in sve-ptrace
>       kselftest/arm64: Specify SVE data when testing VL set in sve-ptrace
> 
>  tools/testing/selftests/arm64/fp/sve-ptrace.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> ---
> base-commit: 1c1abfd151c824698830ee900cc8d9f62e9a5fbb
> change-id: 20250523-kselftest-arm64-ssve-fixups-b68ae61c1ebf
> 
> Best regards,
> -- 
> Mark Brown <broonie@kernel.org>
> 

