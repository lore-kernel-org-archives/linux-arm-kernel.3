Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4070ECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs5mDy7Zuv97v/UPl0EORzbWUngd5axp8ZvR7wrcouY=; b=wDXapGNQJEV4kpFGOtES9ZLS4l
	Ap/rQQFeW0kKq2VEColYd1Gdl4eIdeGjich4XXg0HbGZDVYrgbpAG0CQIL2kLP4FkueuFt5+qgSlh
	iB0XjNeUY3Txnba4SCHD46Pcy/LBUSH2Fc7oxExtZ97RmrJZx5s4cGqMedPEBoZGD5PVhVRsSjvVn
	sFNoq3FWNo6nkuFxWdBeRg8WRd6Yu7WtcCSYuXXtb9ayAWhYxKhLcdcvwzwx2LuKST7XrxVgQi7gG
	UsSCx6Zac91BqNe+GBEVp9XYYgsw2oohcHYxXAXW40Xsuj8YOx1nf3f71IdFUu3005YXYnDBAyN2y
	0499oEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd0D-00000009979-1XJA;
	Tue, 16 Sep 2025 21:14:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd09-0000000994J-2JTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:14:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D459F601D9;
	Tue, 16 Sep 2025 21:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BB2C4CEF7;
	Tue, 16 Sep 2025 21:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057252;
	bh=mdYINkvVyjXkwJO8jrP2q0vlKqEFRhWRoX7T6rQ9uck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yd8F8sR8UCELdsM0SIvQnVBVgVnJmAQWFEkv7W8vtwtK1ZfTV9360qia1e36CpT5+
	 7R7hngo7AkjVfwVM1u9i1MSosbelkeulla58aIjMtXcmVKalw7/TXHz3ZHBsHz4P4S
	 8U9/MGTrStqRV7IX8hdQBVVs1aBWbvylfz6K6VWnmzr3OcOZlbD7JJBOF5kUjJta1a
	 iZ55ucTcLk+bL5d/2fVkQ7ID3iRx5+9u9WQ47gn3vbACtTNQP+myoiXFV3OAXtxvnA
	 /DZ6rnB9hUOmAzRuh7qm2TZQwy6A7juO11MrHjIPuEW7ZhbkcfRA2M8LFRESF0c0K3
	 PTdUMZuBsPZVA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Huang Shijie <shijie@os.amperecomputing.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	patches@amperecomputing.com,
	cl@linux.com,
	Shubhang@os.amperecomputing.com,
	corbet@lwn.net,
	paulmck@kernel.org,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com,
	bp@alien8.de,
	ardb@kernel.org,
	anshuman.khandual@arm.com,
	suzuki.poulose@arm.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rdunlap@infradead.org
Subject: Re: [PATCH v7 0/2] arm64: refactor the rodata=xxx
Date: Tue, 16 Sep 2025 22:13:50 +0100
Message-Id: <175805239499.269424.4665701509938991056.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250909033236.4099-1-shijie@os.amperecomputing.com>
References: <20250909033236.4099-1-shijie@os.amperecomputing.com>
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

On Tue, 09 Sep 2025 11:32:34 +0800, Huang Shijie wrote:
> >From Documentation/admin-guide/kernel-parameters.txt, we know that:
>  rodata=	[KNL,EARLY]
> 	on	Mark read-only kernel memory as read-only (default).
> 	off	Leave read-only kernel memory writable for debugging.
> 	full	Mark read-only kernel memory and aliases as read-only
> 		[arm64]
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/2] arm64: refactor the rodata=xxx
      (no commit info)
[2/2] arm64/Kconfig: Remove CONFIG_RODATA_FULL_DEFAULT_ENABLED
      https://git.kernel.org/arm64/c/bfbbb0d3215f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

