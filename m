Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA02C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O1jKHay699JUnEHkc0no3U/AKDO84V4z8bvyUyT71Y=; b=olPsRSkVTx+Gzg0QE5U7dYu0za
	meKIR+VFfnlttmDA6amH4X00A+zMDX+g5zObC/WvzfSaaiyn3CJ5BQVI5XqM17hvqJ0z4p3Y+yMLE
	C/cJEoIcnLHddESMlx4Y1uxapdePTwiP/dzrWHJyx2ORzT7U069t4gmPtBCxBhIUxQKe49NbmZ9ws
	VDML1gYvQok7ywB9gkgWmLBKbXUCNKjIQCMsvZV8lM9aOh4Yn6ALbWOTaU3xrMFF7u1BEPAzA5u5+
	5Fpf86qc5jZ/JntBS0l49TDXhO8ASLAMwEYzfA2Q6Tf2NJ/aA0gF+LcgP0DtVcu6JF7IwRMPiFjmG
	ZCrMX57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBDc6-00000003wu2-0OYM;
	Sat, 03 May 2025 14:13:10 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBDa8-00000003wld-0mlo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 14:11:11 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 924A71380FB2;
	Sat,  3 May 2025 10:11:04 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Sat, 03 May 2025 10:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746281464;
	 x=1746367864; bh=1O1jKHay699JUnEHkc0no3U/AKDO84V4z8bvyUyT71Y=; b=
	1DERBO9Rq8+vC+kFNzRu5nP29yet6OjYyCazrOP9dlGWTdBdkaB+1Kgz+RPAQ7nd
	nG6aV053b1Te0zLFgTKa03cS2K/bXzopaYH9eKhNAU5futxr/zzUR73cVgPG159T
	z6Nwurw7kzMQd2ZChVElJXGmVFdO3DcdSgRjnqi861pDoUve7wSg/LzmzbJJZiAY
	r1denBKKoKyox8/jHRSa2+hns5jlWO8UVLG1KeWRsg11btXGABW5s/ewFplcRqgY
	/vwGcF2g7mwdXLFtj9CdvvmUGLGRSrVF2nreLrN81VDOy8nO5zUCuJkcsDvwkEhF
	Iy6/kmPcsQ9l/FaMo8hPMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746281464; x=
	1746367864; bh=1O1jKHay699JUnEHkc0no3U/AKDO84V4z8bvyUyT71Y=; b=r
	KRVYxFBjpkd+0xqIi8s9c4Gn2LZPayFkWEVJjqvWFNX+DxjcvMOuEbB/nDpfBCj+
	DTyvhqGmRrp2LMbJaGHDyv/WtS/wUORFx7K3UebmgIIV2sonxJNBD6ZzJmlO1ehF
	+Q7EQKzGuaF3dYqsQHEXsbXbzQTgItT78zdG5r0HjcIJZQC8voWlY7ax1ZTzKYbs
	yDIucrnuWgPRtyYXMKJuKu/pRWNy096oiWfZrsWpehRR5tJgWPi7No06YD1NR/ea
	NYNEpG4VFcYYTNX962S9QylfOdMdcU5YJSWFdHHrE6tCVO8k48myFq8mpb9uNz0j
	Uv/3EnK22EX2IYI15U1mg==
X-ME-Sender: <xms:-CMWaFzNDV1IVxGbvXbtuI07Lfi8JQxc1uG6bq9sP30C-65BIFIHfQ>
    <xme:-CMWaFQ0J2aJmLjenGLi-Y0vtqIc9SKj22rRZk-7dXR2HdnillsUsJFZa5aiDjCei
    2rIKxJh4TOvII8Ykzo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeehheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdr
    tghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:-CMWaPUXhcQI5mpMPRHs7KqKlQMkJXieDgNLs2r7wf6-7qBvpYoOvw>
    <xmx:-CMWaHi98BAvj-BJW_iKeo9gxH7sAEvCj0G0dnogGVrboyXgeijRLg>
    <xmx:-CMWaHBAnncmnh78ySJf7rwyHZxzrYtDWy9o4AOJl0b6pSrwvXNqOA>
    <xmx:-CMWaAKsbCQezjQ5WGFfogrmcB_nljN4ZnvJxDhkzgUsFmqjnGRFIQ>
    <xmx:-CMWaEPhrO7_Q-vYE-3yCHiWuImM3B6YqIqm3AaMaN242-Jk1lLrSKbf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2EA142220074; Sat,  3 May 2025 10:11:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Te0d92eb33a48e4f6
Date: Sat, 03 May 2025 16:10:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Rutland" <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Mark Brown" <broonie@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Will Deacon" <will@kernel.org>
Message-Id: <bb9783ec-126d-4938-a6f3-dd5930f1c3b6@app.fastmail.com>
In-Reply-To: <20250430173240.4023627-1-mark.rutland@arm.com>
References: <20250430173240.4023627-1-mark.rutland@arm.com>
Subject: Re: [PATCH] arm64/fpsimd: Avoid warning when sve_to_fpsimd() is unused
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_071109_118847_5154ECB3 
X-CRM114-Status: GOOD (  14.23  )
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

On Wed, Apr 30, 2025, at 19:32, Mark Rutland wrote:
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index b0874402f7ecc..422b9d43b1e64 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -649,7 +649,7 @@ static void __fpsimd_to_sve(void *sst, struct 
> user_fpsimd_state const *fst,
>   * task->thread.uw.fpsimd_state must be up to date before calling this
>   * function.
>   */
> -static void fpsimd_to_sve(struct task_struct *task)
> +static inline void fpsimd_to_sve(struct task_struct *task)
>  {
>  	unsigned int vq;
>  	void *sst = task->thread.sve_state;

I just sent a different patch (adding an #ifdef) before I
saw this one is already applied.

Avoiding the #ifdef does make your version nicer, though this
may come back later, since I think this would still be a warning
at W=1 level, see this bit in linux/compiler.h:

/*
 * GCC does not warn about unused static inline functions for -Wunused-function.
 * Suppress the warning in clang as well by using __maybe_unused, but enable it
 * for W=1 build. This will allow clang to find unused functions. Remove the
 * __inline_maybe_unused entirely after fixing most of -Wunused-function warnings.
 */
#ifdef KBUILD_EXTRA_WARN1
#define __inline_maybe_unused
#else
#define __inline_maybe_unused __maybe_unused
#endif
#define inline inline __gnu_inline __inline_maybe_unused notrace

IIRC, gcc never warns for unused inline functions, but clang warns
about them when they are defined in a .c file rather than a header.

    Arnd

