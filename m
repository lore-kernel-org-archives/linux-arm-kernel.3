Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE626CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhNtez1M0D2dfrvsmkMDG0M1PyQEFcrdMwBQmW+4zyw=; b=SwYAR15G1ncsuG1sa2fIoEWJQB
	+8NYERg1X/twvZyh6Sg//xYu9wyhsgT442YbB3e2wV3V2HRv0VoX1txIddxd3Oo01TuDDEyRLdXxc
	0ThW9LLvyjbSWyLKLxZQUipblrNW3vZrNzSpJ6qGnlyLGtaqXEQLE5stcHfgCLG732XyOcHCSdtXE
	lpNh2HUmy2QTKMYVfuKrA1n5+A++WTpBMd4TZg4WI2Ul3k5w91lP3syfGvqjnimTm7SINEEe1GVDM
	Fb+K6EnzVUiaVngJ21UQUjArL/R0HOx7lTJKV++H0SR3gUSlTztEqNyjc3LQpebpQEaSiX68X44Wz
	lSFwZSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhQp-00000001r0J-2U6A;
	Mon, 08 Sep 2025 19:21:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveDl-00000000asi-05Nt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 724EB601D4;
	Mon,  8 Sep 2025 15:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0420AC4CEF7;
	Mon,  8 Sep 2025 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346956;
	bh=NZDJnhY8lU/HjSsPA1w4OkvvxgfbZxmjWKy8iU7vN7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbCh87f7vZk9K2GzwhXiVS7enXUJ0h9BzgE324mzIUxBmMaeuAJj8ITrdBVjX9C22
	 YrQ59pIc5R+OIpU9/I+G2HM7PvBK2Pe7T+u3ljZ6m8lB3r3reG+4vAuh/cBwjXe35R
	 5K+vLMZWeCaklHR59LtDwS9qd/CXLK5LvIhv5zziT7yS4HuJVpI8+osxZWo+j5kNSc
	 HkIOjfglBmUNxiTvg7OrAAVaNoTHN+n5X2Xjc8sQQtyUHNpc5OBrYZbnQsxgYIHGRq
	 rspukF8hzq4CY4pbbGUMIykMK4oHLNbrnQ11XEFPKkX6DiVJZ6YvUlfg8pxleNr7bY
	 FNbI3UZhVKK4Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	corbet@lwn.net,
	vivekyadav1207731111@gmail.com
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] kselftest/arm64: Cleanups and readability fixes
Date: Mon,  8 Sep 2025 16:55:33 +0100
Message-Id: <175734370604.150805.8413945497648461480.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
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

On Sat, 23 Aug 2025 23:13:59 -0700, vivekyadav1207731111@gmail.com wrote:
> This small series makes cosmetic style cleanups in the arm64 kselftests
> to improve readability and suppress checkpatch warnings. These changes
> are purely cosmetic and do not affect functionality.
> 
> Changes in this series:
>   * Suppress unnecessary checkpatch warning in a comment
>   * Add parentheses around sizeof for clarity
>   * Remove redundant blank line
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/3] kselftest/arm64: Remove extra blank line
      https://git.kernel.org/arm64/c/3198780eaf37
[2/3] kselftest/arm64: Supress warning and improve readability
      https://git.kernel.org/arm64/c/a940568ccde4
[3/3] kselftest/arm64: Add parentheses around sizeof for clarity
      https://git.kernel.org/arm64/c/62e8a9fbaad1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

