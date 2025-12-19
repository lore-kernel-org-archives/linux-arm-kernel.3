Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3F9D74965
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNgLZRN3p12XEm1zXEDJmEBXEOAtqg4c0hsEDM4bDDo=; b=LMtTK02xIGEUaEdZmKQ4q/Q+4a
	rieqNY5IKvrXBDqOc2lxaeeS315KpOpX5N4xN9y3iZdXUvkuVTpg6sfvP8iZTkxgNcBUJmc4xFQZ1
	s5nSMIeJMt6erJqIpKXfDHE1cbR427Qq2dqKpvxsqE1lp0eX6jXcIknJZwbRLpm4Y0jSFIL10VEif
	Kv5OxBR1CvBH1NPZjvONiYo0cDrPFPwypPX/hLNY1kzc73rXCn5yhU7Aq/Y8lpnBekvRxe4FGMqO+
	VkuGxhtSelBzemsJe+cCSQFF19gMnAsQutMe35ynJdVFugBpX/VPinP7/X0CuR1mLRafQ2tcitTtQ
	nj6I3lAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcB-00000009pA9-30gY;
	Fri, 19 Dec 2025 08:13:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc3-00000009oyh-48TL;
	Fri, 19 Dec 2025 08:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C95044067;
	Fri, 19 Dec 2025 08:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B07DC116D0;
	Fri, 19 Dec 2025 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132003;
	bh=Nh4bNCxQArVNKStHwunAd0nAadgCxl/5Y0MhYvrhhA4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KrQ01xcrbwQWKQ0F78yn78ahzA97qwvNR9Pw+Q526pBm5+X6gDYIO9CNYymLeRk0E
	 ZeoqNVNLts2A+jqw1Ovp2vk6AC67N40g4CisyTOpmgLZDRQvLQIQ2pVjoUpj09ivIa
	 ZcimKcA+6epLIHHxV3HeX1HwAtuKRCpw0OvtH/glgC0VDYtkFi4iWqIV4yBFZ218s9
	 mL4+6Zqvfgf0isksNC3MpFvm5K/GsLNwiogk1x5iopcqLeLmW5vG9EJo7nunl8dFd3
	 zerwTiyf2THJDZXOCHtaB1n9UonvrcWmWLjKN7yFolOruk8m3r1hGw9jual2pfz+eG
	 kw8fQM72Fuiuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5B12380AA50;
	Fri, 19 Dec 2025 08:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [patch V3 00/12] uaccess: Provide and use scopes for user masked
 access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613181252.3684357.901874888075051255.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:12 +0000
References: <20251017085938.150569636@linutronix.de>
In-Reply-To: <20251017085938.150569636@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 torvalds@linux-foundation.org, x86@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, palmer@dabbelt.com,
 hca@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-s390@vger.kernel.org, mathieu.desnoyers@efficios.com,
 andrew.cooper3@citrix.com, Julia.Lawall@inria.fr, nicolas.palix@imag.fr,
 peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
 andrealmeid@igalia.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001324_844019_3D8CC475 
X-CRM114-Status: UNSURE (   9.37  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Fri, 17 Oct 2025 12:08:54 +0200 (CEST) you wrote:
> This is a follow up on the V2 feedback:
> 
>    https://lore.kernel.org/20250916163004.674341701@linutronix.de
> 
> The main concern over the V2 implementation was the requirement to have
> the code within the macro itself.
> 
> [...]

Here is the summary with links:
  - [V3,01/12] ARM: uaccess: Implement missing __get_user_asm_dword()
    (no matching commit)
  - [V3,02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
    (no matching commit)
  - [V3,03/12] x86/uaccess: Use unsafe wrappers for ASM GOTO
    (no matching commit)
  - [V3,04/12] powerpc/uaccess: Use unsafe wrappers for ASM GOTO
    (no matching commit)
  - [V3,05/12] riscv/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/0988ea18c624
  - [V3,06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
    (no matching commit)
  - [V3,07/12] uaccess: Provide scoped masked user access regions
    (no matching commit)
  - [V3,08/12] uaccess: Provide put/get_user_masked()
    (no matching commit)
  - [V3,09/12,RFC] coccinelle: misc: Add scoped_masked_$MODE_access() checker script
    (no matching commit)
  - [V3,10/12] futex: Convert to scoped masked user access
    (no matching commit)
  - [V3,11/12] x86/futex: Convert to scoped masked user access
    (no matching commit)
  - [V3,12/12] select: Convert to scoped masked user access
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



