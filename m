Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5B4D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlKK0mE0kByg4FpbHO0iG7V6Nu7sKdiTDFEF6LZav4E=; b=kPm4sGiYQzf/MsiZQAaymxP2uW
	GAG1aOeN7oCwMQyDzetxZptpCNE6ZJ8zQYxpGw3ZZGXsSRieVC8XlkX65srBJYADHdnSNKfQHkLZi
	pWcwKboK9++6MztdE2R7ntCgCBYQ7WkfT7C9tY7iZgw5QtHbQiQBeL5d5+U+SYoczJI0GUB0u61ME
	GijX8pad0Gl2daGYfPkLHdjkEWCVYz87JciALRjFX1YfacFbC7sOvcvRynFAJ+42K6co3sIB6N5rl
	5dInv8UeAYr7OSbEXTsAn1QLEzkPCl1A+XhQdvGa1Ox8hronBU2S5ZG8++BrJkKJC9v7V2ROsXfp1
	NDHbbQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q3B-0000000EECp-2fAr;
	Wed, 01 Apr 2026 07:31:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q38-0000000EEB1-0k3D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:31:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5128C40019
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Apr 2026 07:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18531C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Apr 2026 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775028697;
	bh=vZvf/vVpL0TiY5ZKgcWYM5rS1YoFp9IzxhJ2gXiagmE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SYWV9S9JOPdd0lRec0HSUQlsyrtHtgjk9ef7Y/ilneC6WVni+PhPr030HUFgwjBNh
	 rsfG1WtYG3ba6OmFqFTIo7ySCbJbH9sL6aCW8D4WK8VHAKv4XNN3ec/rmqoxqkmIUK
	 yYDPsnJy0RzlceOoZfRW45UQxpVxRRgf+aNyct5T3RoJxqqCJJED80/Ak7iqS1HsHd
	 YQ1qpyCj/+KUloYuxhfAW4UCxxNJiFDmO/pXFO2LsRU7+6KE8+riH5TxS4bAlE61OZ
	 0h7ZP3C1DYhokVHrtDzcxqmUPPUQ24wxi+2taXd0qQPsRLzjNBsKJJuUSyyuFvfE6h
	 HdkhncYE4RhaA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 259D1F40068;
	Wed,  1 Apr 2026 03:31:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 03:31:36 -0400
X-ME-Sender: <xms:2MnMaaHm4T4QYRopeb_k0u-IP72s0FjMw8re_yTLtXQq5vF4en4ubw>
    <xme:2MnMaWKsXtEwH49ab1VjovzsCSsh_fzhZ4_n1FvxJYmTWAbfaS3Y4zG5TyqmBcsgJ
    u3yZfxEs990g1tgOvV11lPOXo8jwjyU2_aDGo1DS9Ev6uoiXTl3a-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeeijeef
    udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugidqtghrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2MnMabzlLuIOMdDHdnsjklbTZHXD0_RQEbTiNq8Q267ZF-wY43t-Jg>
    <xmx:2MnMaaKf21xJI8X8a0i4PYRgx4ukZRjpUvVtpQLYv4ywyI9wyE1vVA>
    <xmx:2MnMadoWWSNl-3NhLzvw-Z_zO0m7WiH9AsaoqQkd9SQy6IgeMUKDqg>
    <xmx:2MnMaRLBD7oT2YPQoBFMhNFu0gnyT-E-ztvRpU-ZcCOYtqYNnQ0p2A>
    <xmx:2MnMaaQd2S26f81LOu27D9Oc3j_AM9QP7RDgoWPyVlNKcCbERNk-SNVk>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0A850700065; Wed,  1 Apr 2026 03:31:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYwEts-iKrmF
Date: Wed, 01 Apr 2026 09:31:15 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <d44355c5-51fe-4d69-a347-a97f6ccb7d14@app.fastmail.com>
In-Reply-To: <20260401004431.151432-1-ebiggers@kernel.org>
References: <20260401004431.151432-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crc: arm64: Assume a little-endian kernel
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_003138_270502_87FD16D4 
X-CRM114-Status: GOOD (  11.51  )
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



On Wed, 1 Apr 2026, at 02:44, Eric Biggers wrote:
> Since support for big-endian arm64 kernels was removed, the CPU_LE()
> macro now unconditionally emits the code it is passed, and the CPU_BE()
> macro now unconditionally discards the code it is passed.
>
> Simplify the assembly code in lib/crc/arm64/ accordingly.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is targeting crc-next
>
>  lib/crc/arm64/crc-t10dif-core.S | 56 ++++++++++++++++-----------------
>  lib/crc/arm64/crc32-core.S      |  9 ++----
>  2 files changed, 30 insertions(+), 35 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

