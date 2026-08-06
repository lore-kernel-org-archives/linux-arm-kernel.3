Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61117C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpYKqC5ieeH0CeVfPg5XXhrYkSlRUnEoujChOtFxVHE=; b=0zsszOMKQe96p/JuChXHnIoAkP
	pm2wa0UGTlSdTfQ6KH5Btfa+wF1+YvkVahFl/qSqZ7dpXzrlKXgjox4foqUWA6NpqoemI+kkW80BG
	szc9Iu4eV7SN0PlrxUjw1/0gfaLXacI4F/vQhANakD28fqVMxXQtnreoX9gfeGx4GTUn7ryLy9hNR
	pmnYw/XiwZ718pUqkOlucD52SbGDX7pfrU/0GplQWcJMGRTgsF3yrhnJpd3l5psHaKZBrdeqtVl37
	HM5oCkyMZXJWcwzqVn3k0KfBM027IMrWftTkLCd1MX7udkcDNLMPlDzNWYPLb4o4duLp2Cfrc9zfL
	yuSb1pSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dn-00000006Kjy-1Ffa;
	Thu, 06 Aug 2026 17:12:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dk-00000006Kht-3QTZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42ABC60AB0;
	Thu,  6 Aug 2026 17:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2308B1F00A3A;
	Thu,  6 Aug 2026 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036340;
	bh=XpYKqC5ieeH0CeVfPg5XXhrYkSlRUnEoujChOtFxVHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=itg203n/X9z7r8BvUTyqqg4HN+pgvQltq3OEpnuhRJovfdZYmyuY0JrdsB0FN6p0U
	 XNyYL6tOsuTAqZQRwS3gS44EKj/FNNigUhXwAQ60L8HanplHB+r+chLekmgRZ9NJBk
	 qKCdXFIQQO9v/N+AsUcSFl85AzdI5g5QxvJrSGsp62xybVceZonq0kpZugYNCmziij
	 nbI6CHv62c51LUaUjirub6Mbt3PJW7BP1rtXobzhT2xVFA6L4cwBKbdJFULZwOjlhU
	 E2TFv4804ozpS9B1hPx2EQ9fsv/9UP1HmjiGcR6XPMib6VAs4Ku1uLCr2ckTQ8jW8O
	 JxlWkC+TxIdxw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH RESEND] kselftest/arm64: Fix abi test compilation errors
Date: Thu,  6 Aug 2026 18:11:45 +0100
Message-ID: <178601918128.406021.15265264695708888556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806111546.42042-1-ruanjinjie@huawei.com>
References: <20260806111546.42042-1-ruanjinjie@huawei.com>
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

On Thu, 06 Aug 2026 19:15:46 +0800, Jinjie Ruan wrote:
> The arm64 ABI selftests fail to compile due to missing include paths
> for kernel headers, causing errors like incomplete type struct sock_filter
> and implicit BPF macro declarations.
> 
> Add $(KHDR_INCLUDES) and -I$(top_srcdir)/tools/include to CFLAGS
> to resolve the header search path. Also remove the hardcoded __NR_write
> macro and include <asm/unistd.h> to obtain the correct syscall number.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Fix abi test compilation errors
      https://git.kernel.org/arm64/c/eb78ef9cf77a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

