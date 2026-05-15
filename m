Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7BACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qgjgFxUvKpGr/7MrBVaKHvp/HakTh8FDvf1KsdtDJg=; b=WgDoHtZgMsCV2KXfU/iTYQmPD4
	a2BMi3Wr6pPR9lodsAzh+DAVqqJI9XLBqDYWpYNNlX0RsiAqhG7/jKfvVJ/5FiOl4/iZc5TyJXSm2
	3AoeNM2Egvfl61zmpupxpjJc5d/a0W6tIYJ/M+9SX2NZLuGXZhLbX8r9TbVk3eJNcHRIGJUoScglI
	BSbv5iuzZMAfDal/TryBpEn+a/ju+hzNyipqJSzPTdS/Yi8P//1Lwv3rMDbzAVrOp452igjuFzsmo
	/KugF1HnaI/RnmlfeOZsbXxMJ3sunYYw5/vM+UF7mV0ImaIJptgyOnIahiLT1nE8eTL0wDOm25Hwi
	yxW1skww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzth-00000009Uje-3jYQ;
	Fri, 15 May 2026 21:16:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNztg-00000009Uio-0FBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D99544150
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 21:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CB9C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778879799;
	bh=7qgjgFxUvKpGr/7MrBVaKHvp/HakTh8FDvf1KsdtDJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxqPmvQ37XmgJv0g9FYqqAbFZ4wLw1KWv0esVfhgYnDPcDVFZlyWkNdgR8qw+ry4o
	 QdajIWCniDHrCXqSWmIJisX55Gqby0FdJVvlhWUEV9JuR4oYAEUzGUZQtPI1G3R4r2
	 tC+mymZulXwu7TlHutwXnWH9d6gFS2NSvatyMxjHcTPOh8Msktq3/20gLk5DVelMvi
	 keSWMHCYwuarN2Zpm+Mswl0DYiaiiFSgYZu+V2uZg6Inj1Fg7bm3EW9/1ZjtSKqrWn
	 5h6rmiJbnvOoplz4BmBaXXb7jnUs7kLXbYV6wJnOsuJ8WTEOH+KR9mN294vdaS98V0
	 V3zH4UvlLqYpA==
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8c921396e37so3405766d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 14:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Ldyers0BBhfOc06zYyUD+Opegd08Z+6pPSeHZauLj4W0eICWtaGzSicSAAUPlPo+G7Y0pVaDrVv7VFIUxR4Pq@lists.infradead.org
X-Gm-Message-State: AOJu0YwhoRW55BaEoG9Xy8zojApwATY2tl4OuLyQ4HKYVz4Y6eLFDD49
	j545c79RP6/9x20LnhNP+ghoA52kM5SkmQGRxv9GziXzHcbSWcZiASd0E4n5GWoOJnNvP+TT5pw
	y3x09zKmMstrgvv3mmAnNSfHR5N166A8=
X-Received: by 2002:a05:6214:501a:b0:8ca:190a:8cde with SMTP id
 6a1803df08f44-8ca190a8f16mr56910566d6.21.1778879798474; Fri, 15 May 2026
 14:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778642120.git.jpoimboe@kernel.org> <f32864b560d40894cdb70d613480d7c2ecdb55e0.1778642120.git.jpoimboe@kernel.org>
In-Reply-To: <f32864b560d40894cdb70d613480d7c2ecdb55e0.1778642120.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 15 May 2026 14:16:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7ZVeqDoZCDzdahEXSmboC+gA9T4pmUm4hxmutp12h1oA@mail.gmail.com>
X-Gm-Features: AVHnY4INuRGnhlm_RhZATCu11IG0BAUIhjY5JXNgPGnjB1-OrybrKm47hicJN7g
Message-ID: <CAPhsuW7ZVeqDoZCDzdahEXSmboC+gA9T4pmUm4hxmutp12h1oA@mail.gmail.com>
Subject: Re: [PATCH v3 01/21] klp-build: Reject patches to init/*.c
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_141640_118597_6FBF99C0 
X-CRM114-Status: UNSURE (   9.67  )
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

On Tue, May 12, 2026 at 8:35=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> init/Makefile hard-codes -fno-function-sections and -fno-data-sections,
> overriding the klp-build flags needed for patch generation.
>
> Don't allow any changes to those files; being init code they aren't
> really patchable anyway.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

