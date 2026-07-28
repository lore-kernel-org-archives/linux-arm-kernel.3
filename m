Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC61C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXym1yE0FtnVm0MfjQ4EMxQp7ufSR6NlktoTBBMfJVE=; b=ZXUZE9ZlepJpkW/nKOneSS7+W8
	cLeFbrimYoWb6mu0Z2rNzZ7Q6v0Y2/D10ElyWBywyHtKSOTnnGvupctaCoCl/PuCiDqjQUPJPClR5
	6TE8mrUMsHic290h21nelY0+6iWaPzP3qrtac4mnFnkwvTTyg7XCv1l7jdHDg6Nd1fRwhPHGthSQL
	P2SryvrYNepFspkIKGJm09Vm9Fecsa1BLHhT485tHD4PHxcOJFauUHjdmyBqNXWhHl1NaFNgS66aD
	beObiPBo+sJKYOFl/BsPAwlhoHAE8GYsssKpqFrN/NdeveIi6mYr6e7WhAzEtTQ+M2Hr7LOlgvW9E
	SF7uh78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofxF-000000054ZU-3h5H;
	Tue, 28 Jul 2026 11:26:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofxE-000000054Yu-2msk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:26:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1316D43306;
	Tue, 28 Jul 2026 11:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022A51F000E9;
	Tue, 28 Jul 2026 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237996;
	bh=GXym1yE0FtnVm0MfjQ4EMxQp7ufSR6NlktoTBBMfJVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l22hXoF26M/jWcfPnIwgj7VBA3BLMtQrlvG0GBAg5H0nRff85QkXpEmATvo3Scq6t
	 +GViblSyAdwPHfhXJpfWzXZDyP3RO7RktbuJCEOBqDJ0VJmk/X5ySz7P/PQQN/4X/r
	 JLgw4W2bMbdpf92m/o1s/Qvgf1SxUxF7D82VViXcERyYmi/8d+j7+ROHQMDCDr42lx
	 4a1ZkZFuT2zAFlMOFWIzQr065ZmMO8izDU608sEKEcw8f8Pa3NL0f18i2//xWLxynC
	 VepLZNpyTXNy13WH/3AQB7PLioBZ6X+x2AUkT/KK8qAGP36JnH4tM4sCFkwBuvUW8l
	 tR8UedhvbG6Tg==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] arm64: fix cpu-feature-registers Malformed table
Date: Tue, 28 Jul 2026 12:26:28 +0100
Message-ID: <178523451439.2406080.13981549647507165259.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727001002.3016279-1-rdunlap@infradead.org>
References: <20260727001002.3016279-1-rdunlap@infradead.org>
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

On Sun, 26 Jul 2026 17:10:02 -0700, Randy Dunlap wrote:
> The "visible" column was dropped so that last line's extra pieces
> should also be dropped to prevent a docs build error:
> 
> Documentation/arch/arm64/cpu-feature-registers.rst:170: ERROR: Malformed table.
> Right border not aligned or missing.
> 
> +------------------------------+---------+
> | Name                         |  bits   |
> +------------------------------+---------+
> | RNDR                         | [63-60] |
> +------------------------------+---------+
> | TS                           | [55-52] |
> +------------------------------+---------+
> ...
> +------------------------------+---------+
> | AES                          | [7-4]   |
> +------------------------------+---------+---------+ [docutils]
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: fix cpu-feature-registers Malformed table
      https://git.kernel.org/arm64/c/d50a908ffde5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

