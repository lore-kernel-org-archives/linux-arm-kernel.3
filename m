Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC54CFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl8CWSZtc4993hC+Ck+g/a6K51sb0ebnEWK6CUOQ/yo=; b=00OgDYCrHyvJyDue0OLL645RB7
	wa6M7YuTfqeZbofPdrDnxIWSwPnUrd8JYM6zYZon3H6bzXkoNgPD/6/EwC6Q7/42q1sVG0uWesrOZ
	XXMFt5MunzuUrlUTWYfutV5JsATUH1+/F227UeYEO5c+k5GAbHe9Ztxa/R4Mw1mgCAG9Y21LUoyNK
	5xHMVM0yo66fmCbAd2QfswJ4gJsnOU1nxmLh91mOoaNLLwdoYFp6r//LUeEtVUyASBQ2wMjNthMsX
	9zzJvqlwnP55Z6Etm/XZ9z0EM17Lam3IiziI0t9I9xuz/y33Cv9kcEYee2buUQWEXrIeYV6HnBYOS
	D+4E4ZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMBY-0000000H0w9-2172;
	Mon, 27 Apr 2026 13:39:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMBV-0000000H0vA-1KxT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:39:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1F721684;
	Mon, 27 Apr 2026 06:39:30 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11E743F763;
	Mon, 27 Apr 2026 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777297176; bh=wz27i3RkwVGEreCzlGSpiJM5Dz1PolVb65Lo1LtP4Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOmFzwd5VNajCkXQTmVoQ4sTG+JfJQbPLhj/XjjD43KWWdRwnymfae55BHzFS7WlG
	 9NYtaww3AFU77fQlNhWnEL7thqB80xuc7Zh2wWvw6WXvBPKDn/h/q3hihRz5HKJM/B
	 +8F+JfYFiXITHOkaYkfhxcQXbx1WpkJlPwyuA9t8=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Wentao Guan <guanwentao@uniontech.com>
Cc: Will Deacon <will@kernel.org>,
	hello@peppergray.xyz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] arm64/scs: Fix potential sign extension issue of advance_loc4
Date: Mon, 27 Apr 2026 14:39:25 +0100
Message-ID: <177729716540.3579760.12948731325019533950.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413095459.2470584-1-guanwentao@uniontech.com>
References: <20260413095459.2470584-1-guanwentao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_063937_400227_1D189564 
X-CRM114-Status: UNSURE (   7.96  )
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

On Mon, 13 Apr 2026 17:54:59 +0800, Wentao Guan wrote:
> The expression (*opcode++ << 24) and exp * code_alignment_factor
> may overflow signed int and becomes negative.
> 
> Fix this by casting each byte to u64 before shifting. Also fix
> the misaligned break statement while we are here.
> 
> Example of the result can be seen here:
> Link: https://godbolt.org/z/zhY8d3595
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/scs: Fix potential sign extension issue of advance_loc4
      https://git.kernel.org/arm64/c/4023b7424ecd

