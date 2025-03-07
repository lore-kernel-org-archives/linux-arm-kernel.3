Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07313C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BIA1QiXjX3xGnUJhOflBomUkSp1vIiiPqAgth7sGo8=; b=XCebNtopkvpjq5XAbqtzVJSJqQ
	4II2iAQ+/lk/F9WDw/+Z6oJyDlWVy5WlUrSwQZZoUlOq/mwG75XJcPebILhsIiw0zZyCXYBO53cFK
	DAzDpeGw/bI1ZygulKXmQQOX3DPnouqmLK8H8gla26Iy9RKdEcPxnMdoUsL0twvgWhd5Mua94n6pv
	TWNNmriSnfFyk2mOweCJ866uh8KhI2/yFSpTvsP5UvgsrDa1p+hgQTvWxU/KcgIRIV7hYvOu4WfRN
	XBewFCmAfdJwe5zgM4DDPeAQTARc6CrFH5brPKR87TYZMVWkFJdIJvnW+Ir3AroDrAm8jzRokta41
	WW1ss3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdJv-0000000FL0o-3fr0;
	Fri, 07 Mar 2025 19:25:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdIH-0000000FKoW-3f0q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 19:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A11D5C5F0A;
	Fri,  7 Mar 2025 19:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75683C4CED1;
	Fri,  7 Mar 2025 19:23:35 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH v2 0/3] arm64: Use memory copy instructions in usercopy routines
Date: Fri,  7 Mar 2025 19:23:33 +0000
Message-Id: <174137535825.2374539.7217911399539478873.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250228170006.390100-1-kristina.martsenko@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_112337_949821_B873F7E5 
X-CRM114-Status: UNSURE (   9.99  )
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

On Fri, 28 Feb 2025 17:00:03 +0000, Kristina Martšenko wrote:
> This is a follow-up to the series using CPY/SET instructions in the kernel's
> memory copy routines [1]. This series extends that to the usercopy routines.
> This required some additions to exception fixups since a CPY instruction
> accesses both user and kernel memory.
> 
> Changes in v2:
>  - Improved readability of cpy_faulted_on_uaccess()
>  - v1: https://lore.kernel.org/all/20250218171430.28227-1-kristina.martsenko@arm.com/
> 
> [...]

Applied to arm64 (for-next/uaccess-mops), thanks!

I made some modifications to patch 2 as per Robin's suggestion.

[1/3] arm64: extable: Add fixup handling for uaccess CPY* instructions
      https://git.kernel.org/arm64/c/653884f88777
[2/3] arm64: mm: Handle PAN faults on uaccess CPY* instructions
      https://git.kernel.org/arm64/c/04a9f771d81c
[3/3] arm64: lib: Use MOPS for usercopy routines
      https://git.kernel.org/arm64/c/fe59e0358d9b

-- 
Catalin


