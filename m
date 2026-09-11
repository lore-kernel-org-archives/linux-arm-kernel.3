Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F243EC88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUt8078LI6wD6+nVcD9TLG86kUVkI5Y3pqRlvqsMaBg=; b=34QJxz0yznOU5g4XNQfwMHxhW+
	d2MfwhqPKNMzP8WyckDGZ8UlKRiCO2G1K5VXuZ4NxS6PpmyQ62HNXNINEesCpth/+24BrD54vg52u
	akKrufbkj9CkHmNQvmwm3B/+1cDFtY0xSasAs0SCUHfIqqug5sISFVsz01M6/s5f73pUA260rLK26
	2Yizv636+u/QPSNc1jL+WBhEG+K4sUVyDxir0n7WaHp9+nZRzQAfvvCOsdWco2JoqiOd8gJBM/AbB
	SWmJuBcqG7fPaNL+VC5mpVyEbniOziPTcawVHqhXv/DZs3c+SqF/NwbcgXAHvLGbeVXPvSuaoPqPD
	tI+O82Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YI-0000000GmJZ-2LTp;
	Fri, 11 Sep 2026 13:44:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YE-0000000GmHz-0Qxp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:44:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F1A960A57;
	Fri, 11 Sep 2026 13:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B906C1F00893;
	Fri, 11 Sep 2026 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134261;
	bh=DUt8078LI6wD6+nVcD9TLG86kUVkI5Y3pqRlvqsMaBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y/mld16cYoo+0J6NDNRTftpl6Gk8wsiMTHZCq9sX/Wro8BTbtvwnpyoAqImOym339
	 XZ2EZyXUe8hsvRo9/KslBSt4/HzE7m1msSVyzqTQbsy6AZqmZvAi24DLwL07/0cxFF
	 ysETPu3eVIiUu1ewQfHs8Cpr0SBdB1P214gM0mB4eCnIKpT2bGUxxwHX8gofmkLWZ7
	 nR7trRpe9ky+o4C6iL7XMorvgryGT8du3pc/a/1ZLFZJdyMqeCFfCezFA41DSy+LkW
	 g/6P07x2PhOWY7PsVdeZLYNT9KEFCqLylh8KQB48mrZceJAu5FoRQSFk4hqLyvAkuI
	 wQ9PRwAaWdzew==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: Re: [PATCH] arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation
Date: Fri, 11 Sep 2026 14:44:08 +0100
Message-ID: <178913101591.2459695.4180294828056716193.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907113151.363924-1-catalin.marinas@arm.com>
References: <20260907113151.363924-1-catalin.marinas@arm.com>
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

On Mon, 07 Sep 2026 12:30:25 +0100, Catalin Marinas wrote:
> PTRACE_{PEEK,POKE}MTETAGS return -EIO rather than -EOPNOTSUPP (as
> documented) when no tags are copied from/to a mapping without PROT_MTE.
> This has been the behaviour since the interface was introduced, though
> the original intent was to distinguish between address not being
> accessible and mapped as untagged.
> 
> Update the documentation to match the implementation (de-facto ABI).
> Since -EOPNOTSUPP was never returned, change the error assignment to
> -EIO as well to avoid confusion.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation
      https://git.kernel.org/arm64/c/fdb9ebc7fb77

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

