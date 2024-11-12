Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD9D42BA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQAbzH54BWAqJJAArrud6TvjivyAwBzaPju5GrT9L4M=; b=yBjwLlLJZYRRdpvtqCyuSWAKZk
	ns6bNX9JFFJYxxAupKtBB1g9yvSCtT2mZ4CmuqvVzvDU74vlnONDtwiviUgkv+aiHBsTfhHVNmDpg
	9qDIJyzpjgE1gCfiJ4LaRuobH7/NxZaz2hoDDFtulxzDH2u4h9im/TtNlrot5AKcvzgf/nMhMZgvb
	7ucrxhdN+RR7WOIl+j3dIajtb5EnU/UyX1eCKtsE8j0hlXJR3L4+omJLCEJngNAUDHi61E/8UV3Qw
	yRM8eLNni2o8AZBzYKIkC+iYgegSJrkgzO8zj++sALVmmKfjGX4ascYzR2pNc9aIquil7WkveXIQv
	DtDksGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtYy-000000046kv-1s14;
	Tue, 12 Nov 2024 16:16:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQn-000000044yB-20IB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84E7FA41E41;
	Tue, 12 Nov 2024 16:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D419C4CECD;
	Tue, 12 Nov 2024 16:07:50 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix build with stricter assemblers
Date: Tue, 12 Nov 2024 16:07:33 +0000
Message-Id: <173142698241.893467.6217445754530780538.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108-arm64-selftest-asm-error-v1-1-7ce27b42a677@kernel.org>
References: <20241108-arm64-selftest-asm-error-v1-1-7ce27b42a677@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080753_601375_12A75805 
X-CRM114-Status: UNSURE (   8.50  )
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

On Fri, 08 Nov 2024 15:20:46 +0000, Mark Brown wrote:
> While some assemblers (including the LLVM assembler I mostly use) will
> happily accept SMSTART as an instruction by default others, specifically
> gas, require that any architecture extensions be explicitly enabled.
> The assembler SME test programs use manually encoded helpers for the new
> instructions but no SMSTART helper is defined, only SM and ZA specific
> variants.  Unfortunately the irritators that were just added use plain
> SMSTART so on stricter assemblers these fail to build:
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Fix build with stricter assemblers
      https://git.kernel.org/arm64/c/ae465d9ca192

-- 
Catalin


