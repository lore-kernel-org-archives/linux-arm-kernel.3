Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB55D74964
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJjgxmXldWO+gLQl+eiXN07E8mK6jMZGSsZ/vefjBYg=; b=N2uflTV97lj2TIrJGG0g8PF49Z
	W0LbMA3auuLoESAaENBRYy62GjiaetTcSKk0mClcYYb1wM9216skONkFYo/KL/c6s8tM+dXa8PuDV
	wqwYgVWFHIcrRCrRc9TaaJLdHK37TRg8pLGNnUIo4XC82/VzOJ8e9AyXQClG9YNlScwRc6JklT5lO
	iTYHsffUmfUrULPSFUpad94yZJkg/PodWlRXWQLj5S+Mokz0qlRj8Bi2r6TcvNW3kqGxuCkEyi7/V
	oKFl7KqzHmAzkY9PQrn1s1wjeidNaxNJYMmw/5bv7e9fESXrMzCVOmaJcyIfbfwfIGfsgXy852xHv
	VuIFooqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcM-00000009pQD-2luZ;
	Fri, 19 Dec 2025 08:13:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc6-00000009p1Z-3eFR;
	Fri, 19 Dec 2025 08:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 690324445B;
	Fri, 19 Dec 2025 08:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483C9C116D0;
	Fri, 19 Dec 2025 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132006;
	bh=VFiTUqFKrbPqxZ9+NNyag6Ajy0uzkayrmpB0IcPZ4PU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VFqc9JjXV4mr5LizAyAg0tm5CJ5+ZKRz2e441pHxsOiibmeY59xqgqo0crFansJqy
	 P4iE+LwFzjEO14DLRaSWWuqKz/n7erWqILtXs9Lv/MNRN1owKC0LAzXRhNgKAx58lp
	 tCR21R2Dw0bWznLJdN91LGXcdkvn7rx4jeDVemHE8IzxC1Y4JBCay11De2Xm5vEcbu
	 /4J0e8p+7t4L6eUrHmM/cZpJ3p6Ww14fgV6pv5nQ+0hOx32UTmjPSSI9YD07/Dl1O5
	 ++5+k0gllM3NNDpP4jmGzEK4n89hxvNhgOvvTI0omoe5NZ2P4gzH53HInU9C88e17j
	 c8ndEnoCuJn4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79F14380AA50;
	Fri, 19 Dec 2025 08:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [patch V6 02/12] uaccess: Provide ASM GOTO safe wrappers for
 unsafe_*_user()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613181528.3684357.16950067300895090684.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:15 +0000
References: <877bweujtn.ffs@tglx>
In-Reply-To: <877bweujtn.ffs@tglx>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, ylavic.dev@gmail.com,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, lkp@intel.com,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, pjw@kernel.org,
 palmer@dabbelt.com, hca@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, linux-s390@vger.kernel.org,
 mathieu.desnoyers@efficios.com, andrew.cooper3@citrix.com,
 david.laight.linux@gmail.com, Julia.Lawall@inria.fr, nicolas.palix@imag.fr,
 peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
 andrealmeid@igalia.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001327_050168_1702E7CB 
X-CRM114-Status: UNSURE (   7.75  )
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

This patch was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Wed, 29 Oct 2025 10:40:52 +0100 you wrote:
> ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:
> 
> bool foo(u32 __user *p, u32 val)
> {
> 	scoped_guard(pagefault)
> 		unsafe_put_user(val, p, efault);
> 	return true;
> efault:
> 	return false;
> }
> 
> [...]

Here is the summary with links:
  - [V6,02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
    https://git.kernel.org/riscv/c/3eb6660f26d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



