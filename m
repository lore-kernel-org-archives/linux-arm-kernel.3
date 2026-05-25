Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC34CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlAGElbDSwYe7W4fp2ll8Crxv83yKatGQRMqBajZFqM=; b=QTfBTwF57yBrH/kPh84zYNcwBd
	Sb3Ge+N5wtCYXgzEb1okYRg1PYNIGfDuCI2wQx5aTRFrDp97R6dOQ4pMfYZSbCrt/VQ36bwpD1QnF
	qIAcELFPcl7KTHPd1yrf2rJuS0s/EPUBHObCf+Yn1lhcrtmTzGeVqyyKZHPYjdS9PYLcfevG5YUuh
	AOP/WqcOIl/51nKkYB/yiOgvJVXucAFykLex/UaDeXWWW1qHS2Msr4+ua5G99B4vlPAb/gc9Vcjdx
	S4gbxC5YIGEfiI+0slOWRJpE2SIRergwbwdaelPtykAMsDN4h0ZdEEjKmxIleFqHo3UnE9wLSs+Y+
	6ZUdWIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQWc-0000000GcRA-2f3m;
	Mon, 25 May 2026 08:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQWZ-0000000GcQe-3rXE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B05E4443A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BA81F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779697139;
	bh=jlAGElbDSwYe7W4fp2ll8Crxv83yKatGQRMqBajZFqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hwlIToctPXfIR8I3xZlJ13Dv4JVXLxahZ1KqVhToxy7LlLg/ZxSDracBNqedJpogD
	 CZrr2XBw/H9RQK79gntcxg5ju3k/468DHEhk8jA8eE26pWbIpGtwVKXHZsBYLRpeRm
	 /t6xx0PsnVd76G5RqOax3sDUFqGlmG/vGBbcP/oozPwbV8RTF5v9eg6o9PiR1MjIrO
	 EF47kpoL4Uvpc6YvqlYH/k9S6PGVFNi+AAAQ3p/m0oJb5sEYabOTC/p+QTSzAPUP9/
	 p+oS8HLUdVtXaXHCl8UQMAF+nKVMCfpqDsdOpT8eTFUprFrt1KmqD8S3EADqBZZbQG
	 u4slrJU2/WAyg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39378db197aso96285301fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:18:58 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz7aaTBtVngckI1tv1fYV29Z/JDHSv1dc9gLqSrFYvI0rhXuLII
	B43G65RkNTrHPwGvJiSvAoDoYOguonplWFzdy/NV+aFjeavfvZFwE65x11HRlq6cdHx32XKJ9oh
	ZagK1HvnGXjeZyUHo2Mvnkdzhk8HK+ts=
X-Received: by 2002:a05:6512:1243:b0:5aa:116c:4127 with SMTP id
 2adb3069b0e04-5aa323a9065mr4487621e87.41.1779697137800; Mon, 25 May 2026
 01:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260518014920.135011-1-enelsonmoore@gmail.com>
In-Reply-To: <20260518014920.135011-1-enelsonmoore@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:18:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0qYGoygUwGEXQL7C_ROnC7kfpRv8RA+H5tNWwYu+pQA@mail.gmail.com>
X-Gm-Features: AVHnY4L3wfMFUnjNE8lm9cvN091uSgyxKr6Hy7t4eK0YNSLwuts2rYxfVsneK30
Message-ID: <CAD++jL=0qYGoygUwGEXQL7C_ROnC7kfpRv8RA+H5tNWwYu+pQA@mail.gmail.com>
Subject: Re: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Thomas Weissschuh <thomas.weissschuh@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Shubham Bansal <illusionist.neo@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_011859_985816_45D02A4C 
X-CRM114-Status: GOOD (  13.12  )
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

On Mon, May 18, 2026 at 3:49=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:

> The eBPF JIT unconditionally generates ldrh/strh instructions, which do
> not function correctly on the Risc PC because its bus is unable to
> signal half-word accesses. Work around this issue by disabling the eBPF
> JIT when building for ARMv3 (the Risc PC is the only currently
> supported ARMv3 machine).
>
> Fixes: 39c13c204bb1 ("arm: eBPF JIT compiler")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Looks correct to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this into Russell's patch tracker!

Yours,
Linus Walleij

