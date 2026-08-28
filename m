Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4271FC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q59W0IMnGe6dIIXJ7uN8WhP/SPji5OZbpNsdNJVZnkU=; b=I6VJ7ikuPy5yt+Dtg2NhFXaVb7
	zJ23Kz8bb4/KqUsecdGkBZy8Fidx7KwxVs78wYXFhJ9kDG6XoWyEOQ5X1ieLm7lKVpbGfpkblHAuR
	Gszabvncd0mmFMN9hDgDaB7Xb6Lg45pdk3PUZb0jKjUIfyFQmXwAiMHILJwZRKYFhD8UKIwUpvpdr
	ELjlZMn7K57EgjjOSLigdyKuZIunwG+NO0qembkgp+ZTfqkkdIQO09fWFET0L9HVCdr6NVmu8xrx4
	yYim/WJBsyfzunKSCYu5cI/cjp96qIW+C5YRjtXMU9k7i4dbcgiLjD6IO0+f04DfMQirW4HLGbkus
	+/6rXUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuo7-00000005eHI-0xG5;
	Fri, 28 Aug 2026 11:31:39 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuo4-00000005eGe-17gI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787916685; bh=q59W0IMnGe6dIIXJ7uN8WhP
	/SPji5OZbpNsdNJVZnkU=; b=f0VFEEQ+HGqNnmleXvSdvGShcNmhZqTqHYU6Gzlkot7pZxLMF+
	UWJCrywICoyKInBIoGocz06gYdD/06EppW8BVhYb0MC4jFWvWjGzNqdjjC9ddQ0IX1+NB4+BW+g
	vGNdO4oUQoxZD5m/2jh48JjvLB4SuoRiPy1ISyvJ7VogkpRlUe/nbYCHs4/wZa4BPLEi7PVAjgo
	6vqquKLxa/MfmhyIRk09hhnOsWh2K13FZtRAw0s4fATYtq0/L0FCe4NqXqLy3VebbvNkv5cxjX8
	t8XyofqRbHc883e7ib+Lxg5PyV9JgbXnrb4Edi0iMA5eAyb4j2tvDbh9ljKHUT1/ftg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787916685; bh=q59W0IMnGe6dIIXJ7uN8WhP
	/SPji5OZbpNsdNJVZnkU=; b=ECZP0S2J9zOx+AoVEeUpPXgMDx1nXuUB+2YpYS2gzdDfTXsBVn
	EozhO4PUTKJCgScKf4wQDJRW4I1maaHDh0Bw==;
Date: Fri, 28 Aug 2026 12:31:26 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <4cc971de-2fc9-496a-a5f5-002bd6b6bd43@app.fastmail.com>
References: <20260825205839.14571-1-brads@mainlining.org> <4cc971de-2fc9-496a-a5f5-002bd6b6bd43@app.fastmail.com>
Message-ID: <42165318-B65A-4BD4-ADE0-1DBD7F82416B@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_043136_457817_3DB860EB 
X-CRM114-Status: GOOD (  10.63  )
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

On 28 August 2026 11:32:27 BST, Ard Biesheuvel <ardb@kernel.org> wrote:
>Hi Bradley,
>

Ard!

>On Tue, 25 Aug 2026, at 22:58, Bradley Morgan wrote:
>> Everything object compiles and passes checkpatch and sparse. I could not
>> boot or run a hibernate cycle on real hardware here, so that still wants
>> doing before anyone gets excited.
>>
>
>You can easily test hibernate under QEMU/mach-virt: just create a file on
>the host, mkswap it and pass it to the VM as a virtio drive (e.g.,
>/dev/vda)
>You can then swapon it in the VM and do 'echo disk >/sys/power/state',
>which
>will perform the hibernate and exit QEMU. If you then restart it with
>'resume=/dev/vda' on the command line, it will perform the resume from
>hibernate at boot.
>

Ack. Tried on PKVM last night.

>I've had a go with your series on a NV capable system (Mac Mini M2).
>Without
>the series applied, I can hibernate and resume 4 vCPUs without issue, so
>it
>is not entirely clear to me what your series intends to fix.
>
>With the series applied resume from hibernate still works - I did see one
>intermittent failure where the secondaries failed to come up, but I only
>saw it once and so I cannot say for certain whether your series triggered
>it or not.
>
>Tested-by: Ard Biesheuvel <ardb@kernel.org>
>

For the whole series?

>
>
>
>
>
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

