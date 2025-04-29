Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C8DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7DvvHDmqPqwrrMY4UGmXOu26u03fkDRTQ2vcvry1zw=; b=QknibwnLf8WNitldn5hHKDQRbw
	WJ9oPcBK90LXP3XDOajHELxS/T7wIccF7Gz2lyrxSh2WGoMG3lTRPPZRW5mSGnwQ9dP0QT4G/A0d8
	ZEX70FxJLdKzHckVzCsWu1XsrL/tGPLLHbtQXlNwYeSX0KH9E4T+jB6Vpa4NK7V+bn4n/C3J5xsW1
	OFPD3WwgTMr/J+BRR8wcczJ1msWuW1dkwxTRfoaP2dIzrMEpF36V7AdMLgkLg3DQvwL8eva+ptMds
	/Arv/cpHkDaKDw1ddjcATzIDXpn23eXn4mYUKRe6uhWyvsoL25gEO9to9Dzqm94yzaY70Ai2egHh4
	nwflRisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rcU-0000000Al4G-2wp4;
	Tue, 29 Apr 2025 20:31:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYg-0000000AkRt-2FjB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E669D40C18;
	Tue, 29 Apr 2025 20:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0101C4CEEA;
	Tue, 29 Apr 2025 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958482;
	bh=dI1r86szgOjKXwo06yk3dskSx4rV+sH+15VgZF38a0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wf/AdoGH+b7dmWqL2F/X/HjuFuYhBqt+m9CNS4v3PYBnRjQIo+7zahANFopjdhYcB
	 V00XyG43u7fhQ4/9mjXPKIK1o4M92JvliZdV/pvIND1RYUw+DV8Pv4NEwPAJXaz751
	 /lWRbYx7TULMDS5lmH1bDyqT0jwDRjFwx/EUZJGgh/tUZSfNa6Fp8j7AJtV+uiQIYi
	 ZWPZrqul7E5ml7L8lLokfCVDMPOGItgL3wagPOVzdEsaWrNJg6yjJY12DwTH+UbMry
	 B9w4Butp30eq+rJLshf8zd9jNVD5Z4wm5VYrr8zALMqbPjY5dK1qcYkKM2pLhi+NB1
	 6ACsHak1QgtQw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: Re: [RFC PATCH] arm64/mm: Remove randomization of the linear map
Date: Tue, 29 Apr 2025 21:27:43 +0100
Message-Id: <174592931036.425225.4448190520420242534.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250318134949.3194334-2-ardb+git@google.com>
References: <20250318134949.3194334-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132802_593861_8E5D7BAB 
X-CRM114-Status: GOOD (  10.46  )
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

On Tue, 18 Mar 2025 14:49:50 +0100, Ard Biesheuvel wrote:
> Since commit
> 
>   97d6786e0669 ("arm64: mm: account for hotplug memory when randomizing the linear region")
> 
> the decision whether or not to randomize the placement of the system's
> DRAM inside the linear map is based on the capabilities of the CPU
> rather than how much memory is present at boot time. This change was
> necessary because memory hotplug may result in DRAM appearing in places
> that are not covered by the linear region at all (and therefore
> unusable) if the decision is solely based on the memory map at boot.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Remove randomization of the linear map
      https://git.kernel.org/arm64/c/1db780bafa4c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

