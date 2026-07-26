Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FD2C53209
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhU5LhsQyPPZGLL4rtP6/8OqWdSe9f1g8Crcp+PS65g=; b=3IEUL1581PbKpUN5wm73LR/RFD
	mCjHJjMLMbzapic3JhS/xU7HbM7FoJwESLMlHQfrot6t3Dzo6wN1jV3VxsNSbXfPd9JEFBDcps5iW
	ZhGG7J2ddIqJDyd7NoHlRpGM3w1qqKmeuk51LgThcRYJTZw5VBq94M4VjbC5xZaTdDKqi4c7P3w0T
	w2N/5TcQvrUVrqQgPB06S9A3Ai53xMfTmM0EURYaPKCi3u0XEgL88ZyapUPSiKIpotntq3sO27h2c
	+4650qJAx6C56l3SAateNfyj38o2edLCUYWhe4SFhnBB8z3qwfAZan7YWoeldPu22s6d5w8BGDZ9U
	4glElEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo51v-00000001Yp6-2SfL;
	Sun, 26 Jul 2026 20:00:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo51u-00000001Yoq-2BC6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:00:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AA3460A59;
	Sun, 26 Jul 2026 20:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E0F1F000E9;
	Sun, 26 Jul 2026 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096057;
	bh=ZhU5LhsQyPPZGLL4rtP6/8OqWdSe9f1g8Crcp+PS65g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ZkWUvRGosUpD/IiRFm7qc0N+ifou+D7n628ywaY8n17rOZ/PQt9X7pTQQ0KIdLKkc
	 pEt2jUcyhbrvDQpzsrZ0Rx8RbysQ0+CdnUqxlMCHuNscWokeJ26T13BNcea6o83Yqb
	 S0wV/JY2rRZjWL/jpA1x2bHAtM9FYu7nkQtP1ZSuNVqI5+qLqPAnmLFn2alYhG+JHr
	 itsTh1sxdci+ZLDqGnxRvmal/xVkOV3lU7o/32SkRYRfh5LEH16eXV+3zMolubzvD0
	 rTcVxHL+CJZXSD2h4H+GwXrXb1DHdWFt1jjir08C6iZSsGd32cXWKqwG8XY1DKYEYy
	 CAflD8feFS3oQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D213DF40082;
	Sun, 26 Jul 2026 16:00:55 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sun, 26 Jul 2026 16:00:55 -0400
X-ME-Sender: <xms:d2dmanXPdI9zhY23afN9Rn4pnKlxQKa6UaolKPi64OkTq9LkZSccRg>
    <xme:d2dmaqZGiphn19mozko14PthN0MZ0H0BK0k_MQZWTQh6j5_HyGH4-RdJ_DrsmVe8V
    6oI_SocVdWOxpx0iFPXII7LicdSloEP69mW0MUaey9HqC5fg3en>
X-ME-Proxy-Cause: dmFkZTGmWM6ALLnlTX1Q1PGekbnoph5wMRNOmmGhRsFggSn5B+bf/oWRqAufJRRDqDmn6U
    Be/QhTIEV57ukRepm13foV0d6fVVzQobWovrd86DnO4tMvNwSLQYVGFLqALr57Rd2VUAGo
    RCjFa8MSyI1yBgofFdVVlYqoNx5ohdUr0zGDrm9Ge/knhvVav2z/UCoJPD02WAjgyBz54I
    subE6dumhvfh32uKxNPiElx6PhkKWyBShqAPhQLVFSzRG5yDpT91gY/bpV6P3CkJ42SBc9
    GbwhTD+i8LMQ+b/UU4Rc6u9vjWiZ18cqjgZwrlM4YZq35vYJxD6znncJ3HWA33wrzzyfVk
    ua+sLHlK7e9/YLET54H6MRxSNJSRTVldhBYyehBRJuH5ndqmxHgRSEUtn22V5r1Z35vuCl
    XG281KqljLSWANwKUB6oSJd8k/dm/7nMDKkDPRzTyeDkAM8uBqyyxLMouMX/j8qF4/Ddm9
    W70wfw1qT4fnp9uCV1eQd1S/ikFYmNBYNjZMIHEBruoXVGYPpt2643iupCackIqZEpOrxG
    mFH3NUpIz+vWXJwFWs6veawthXMj7d2Oh4bRDeICQ6yYabA/JGl8Zsz55eYXCj7KA4gaSO
    s8ebca9mlQqrEpZ2nltP7ZTXZRFsineAXFiG+/1EOmlLQigRJNgYWG2DWqmA
X-ME-Proxy: <xmx:d2dmasDppv7i_bnXzRWlKRmcjagYE9bjRgzFK6jc0467jGsA4-KVmQ>
    <xmx:d2dmapYiENZrvPaBQiQ0RhECeecdKZXsRtIc5VmqRZADYNZwnqqTJw>
    <xmx:d2dmapzJn2t9PCwybvY7MIWvJaedRxsBrzAcj1o6tNLO8OCMKmfeOQ>
    <xmx:d2dmakc9-lUgxSeRlHvfk9KPSE0xin9hb0g2WjwDtRVJnJnztdPw4A>
    <xmx:d2dmanJfRrrwEe0kzmbNv7g9539qKN6fbzffPDkfYCWp7YkTtoKUdyxd>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B22E1182007E; Sun, 26 Jul 2026 16:00:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ADJgN6ak6HcB
Date: Sun, 26 Jul 2026 22:00:35 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Nathan Chancellor" <nathan@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Yingjoe Chen" <yingjoe.chen@mediatek.com>,
 "moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
 stable@vger.kernel.org, "Ard Biesheuvel" <ardb@google.com>
Message-Id: <c4e9a566-baf7-4df6-b874-30c68a5c67f6@app.fastmail.com>
In-Reply-To: <amWfjDyn0jrnIf63@buffalo-ssd>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
 <amHYO1c-5vzqSekt@buffalo-ssd>
 <ef007a23-46bd-41d6-83ff-264831341093@app.fastmail.com>
 <amWfjDyn0jrnIf63@buffalo-ssd>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels with
 Clang
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Sun, Jul 26, 2026, at 08:08, Akari Tsuyukusa wrote:
> On Thu, Jul 23, 2026 at 11:53:14AM +0200, Arnd Bergmann wrote:
>> On Thu, Jul 23, 2026, at 11:15, Akari Tsuyukusa wrote:
>> > Can you send your fix as PATCH?
>> > I think your approach is better than mine.
>> 
>> I think we should wait for the llvm issue to be resolved first, to
>> document whether this is considered a bug in the kernel or the
>> assembler, and to see if any other kernel code may be affected
>> by the same thing.
>> 
>> Looking around other .S files, I see the same
>> pattern in stext(), cpu_resume_arm(), mcpm_entry_point(),
>> all of which start in arm mode but end in thumb.
>
> It's a LLVM bug.
> The LLVM assembler source code explicitly mentions this limitation:
>
>   ///
>   /// FIXME: there is a corner case where the state is changed in between the
>   /// label definition and the .type directive. This is not expected to occur
>   /// in practice, and handling it would require the backend to track IsThumb
>   /// for every label.
>   ///
>
> https://github.com/llvm/llvm-project/pull/211641/changes
>
> However, it will take some time for an LLVM release with this fix to
> become available. Since LLVM (>=15.0.0) is an officially supported
> toolchain, leaving the kernel with bug(s?) on supported LLVM versions
> isn't ideal.
> I think we should apply a workaround in the kernel for now.

Working around it in the kernel is fine, but I'd prefer to wait for
the fix to first get merged into llvm so we can reference the
bugfix in the kernel commit.

A trivial workaround would be to have a dependency in
CONFIG_THUMB2_KERNEL for !AS_IS_LLVM||CLANG_VERSION>=24
(or whatever version), though fixing the .S code in all known
instances is probably better if we want to ever have a chance
to require IAS on all architectures.

     Arnd

