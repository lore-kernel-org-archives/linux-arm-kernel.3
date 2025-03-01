Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636ACC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlNCMbxju9ERGc1saYnrmp9b4TJYMl4Shd7rAYKspGE=; b=lTs79h2MV3nStYbAcacGUDDbUt
	4jPHVuSp7FgT/vb6imoai41UAH9d8dIvAjHiU7eRpAL9NFtG6dRrA1RVXb2/Wh2JQP1kNRqUJVhIW
	pGPe4nFxSkcIb0tf3rF60f1Grt2UEDL7aFx9gDvxL5l9naZlBs5YUulUhktmarXVYaGAQmoHGmWq4
	ikHAdgUGT5mSqJfQRv1CYJ58n6BYPGgUSqqEncdiWcPKo34vzcMzpp3I4VVflAWflCbLZSEBJ6eYo
	gN52SNu/PEml5IWwS6Pg894hfUEh7YqXWgf41EqWkxPQNi1gDsgZUzrJSCzZs773If0WyC6NfawnK
	jRsVDxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toGwU-0000000DXwE-2feH;
	Sat, 01 Mar 2025 07:07:22 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toGuv-0000000DXQD-4AR5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 07:05:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B65C661160;
	Sat,  1 Mar 2025 07:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0BFC4CEE2;
	Sat,  1 Mar 2025 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740812742;
	bh=yVJt2XxPJkXDsYR5/hz24cQxvPQ9Z4yO07rKfmUMNJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VH3rpTBIKkP/R2U1T2qD724MwzEMKlQXOAG/Gtp+JSs65wiHzAxMvPEe9H8h11/L3
	 tjbZVBTmBXRjkeuBISMbtIQ+FQRQqR64zOxHzVceyn9Nz1aleiLJerMqdz2MCYztK4
	 IGNJijQ0azb4dpAfCznqtYtO96BV3smbxw4dmWgV9Alf0JVnjwSKqwz8Mrp3A3Gdcq
	 N5IKv0Lf1e5FP9pOiyg8kERVuEx3ancrM1PUHbuBsX3yiljSXLy+1YTV4t7ksmKYPd
	 DN4/ZVa6jX7vlENmu9oQWC2M/9isuaLx4kaz92TITLQZ4tdH90L71R8J25qn/9mkJw
	 iwNUNXK+Xmnug==
From: Will Deacon <will@kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 00/10] arm64: dts: Add Arm Morello support
Date: Sat,  1 Mar 2025 07:05:26 +0000
Message-Id: <174070628228.2931531.10306009057184657839.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
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

On Fri, 21 Feb 2025 18:03:39 +0000, Vincenzo Frascino wrote:
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA [1].
> 
> This series adds dts support for the Arm Morello System Development
> Platform.
> 
> [...]

Applied PMU driver change to will (for-next/perf), thanks!

[06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
        https://git.kernel.org/will/c/0424b1a81a42

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

