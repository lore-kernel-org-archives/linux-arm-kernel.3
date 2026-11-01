Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A70606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P0uYcU/9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B37CRQpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cjatygCmxk8XIyEbtr4pyzKJ6E60G4Tfi3euF78nVXA=; b=P0uYcU/93aHAzN
	Frk6Lo6rwN90qVubi9MNIXA1wSiy1UFTgBQKWLbGjXy2LtRlt5EdT9p5ZLUgJmDM+o7pBw+q24lI7
	c3Xubt0oMNEtE/36P92ir+nr5LbqHVXFOvp/0NQiLbx/Ossw/FCKINbromsjuXHHv+c13nlDGX+CR
	7YZot+z2jKblzrU7JoPAZ933R4yUa0qUL6TqZO+rau4QyIH40EGrBcx2lV/PttS8G6sGMYOlx71Wv
	OAYn7uiM/9x+DUQt4L/zhBGNBe1bsaBz9DgwkYv1Qe40DtwQZwQbHNxM1+5RQQOtTeux4Gs8//Wcc
	4y7zNMv7x18IUw4GHHOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrz-0000000F4N8-1uQU;
	Sun, 01 Nov 2026 22:17:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrX-0000000F2l9-1sCN;
	Sun, 01 Nov 2026 22:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C97643EC5;
	Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF4C1F0093A;
	Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571434;
	bh=cjatygCmxk8XIyEbtr4pyzKJ6E60G4Tfi3euF78nVXA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B37CRQpcdmmwCy32vZHgPCWMyUptn49raCX3hJZVcxsEUYOsqHqKCUFeSZMmdrHar
	 P973m1II/ofRE5pnWqeiZvqWMGVRqsLIUP1n1XIX0nFBkKS0IRka2D7KopquB77g6O
	 Mp/unwfBnH0l1eqg07ua7p0Vs/LC2MTS3vGGD6h6owSUEaRNT6q1AXW/x5xBnzEQnc
	 EmKj7qUuyXmc8mBTkvUCHpgFrpk8n5Uq59fpbStEBh5xRF1iBXEyBMchINku/sQN+X
	 GTmMdu6UOejRm4ya75HKvjJSDVBqFLUssCE8lSC7D/wzZYaWR0EmUh/OpuxZjzWe5k
	 ui1FC15h7AaNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 403AC38003B8;
	Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] sched: Convert paravirt_steal to new static key
 APIs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357143279.2624073.7781801497885838332.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:12 +0000
References: <20260819081207.12150-1-hongyan.xia@transsion.com>
In-Reply-To: <20260819081207.12150-1-hongyan.xia@transsion.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: linux-riscv@lists.infradead.org, jgross@suse.com, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 pbonzini@redhat.com, vkuznets@redhat.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, jiazi.li@transsion.com,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Wed, 19 Aug 2026 08:12:09 +0000 you wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> paravirt_steal_rq_enabled and paravirt_steal_enabled use raw static_key
> APIs which are now deprecated. Use the new API instead.
> 
> No functional change.
> 
> [...]

Here is the summary with links:
  - [RESEND] sched: Convert paravirt_steal to new static key APIs
    https://git.kernel.org/riscv/c/a5576ebce920

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



