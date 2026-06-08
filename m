Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2776DCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZ6Mb0lsJ2uNzDbvXcL2ZZQ7WA/csZ4ji01JP6JY5G8=; b=fBPgTZ7SkhBljnIvJtKoTwLLSp
	ZKz0yYBugv0dOb8mdf5rnfa2sAI7KDu59IBCC22netfUy/Z52VqjSc/KjrVeNNTTzkBeq6xVxBtYG
	fdoYXoYqBckP4PRPsskKbMxpm7oiJq/AseVrX/L4hgmIfdORaq9Yq9pzibuXulPf4wSpxRtXGzPVE
	kV3vqAMjYyWPk+dyZufUM74nIU5ar76w+ZGfy8alj7583gmB/+7R1bGG007RKgS+l8Vl0xRI5tgYV
	DCLWsp92VUFUQFRlRzTwzgsk6RspAhvpp1iAHZP3sA5uPC7vQstIP/xh3qXS+VEqJqs66+/LJpadf
	guhlgL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSfB-00000002qcH-2hzg;
	Mon, 08 Jun 2026 05:36:41 +0000
Received: from hours.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSf8-00000002qbW-119W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:36:40 +0000
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id BD0C6440887;
	Mon,  8 Jun 2026 08:35:28 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1780896928;
	bh=AM1ed5M6OqCnBRwBSXfKQdAPtRlTw0sdW96OUh0Cns0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YN5j0RaXM+1MDQg3HAEPqb9uS1mUCiKLf2p9IQqi+4BvB4Hdt1TCBfYtvXfvtAxNn
	 3H9yTBRXnoyHSZJo2MN/+4bPIBHAYAogbrN7Tb105WmKepHL/iA1dH7W7i93pqVSGR
	 77PDjLyWMZxZM60nQn0tMtSbWWHjp7W62lVtMzVKkhc4iNyWa9fo9KXJlGkj8LN/+G
	 ct886T7kwSy7l1Tawyo7oLJmDvTSXtJE0OjiMCCY25KfhmHp0qMwarn0exg1HXr8NH
	 OVxaCBfv1L8zOcbSP56qrx/lLtQ3ZkqE0PT8pbd+2wyFIhGODmMRgeUg6p+U0ozXta
	 s9h8q5uXHwsPQ==
From: Baruch Siach <baruch@tkos.co.il>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  Russell King <linux@armlinux.org.uk>,  Arnd Bergmann <arnd@arndb.de>,
  Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH] ARM: arch/arm/kernel/signal.c: resolve set-but-not-used
 warning
In-Reply-To: <20260608050926.88446-1-enelsonmoore@gmail.com> (Ethan
	Nelson-Moore's message of "Sun, 7 Jun 2026 22:09:24 -0700")
References: <20260608050926.88446-1-enelsonmoore@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 08 Jun 2026 08:36:30 +0300
Message-ID: <87tsrd8ug1.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_223638_756632_1605D89F 
X-CRM114-Status: GOOD (  16.84  )
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

Hi Ethan,

On Sun, Jun 07 2026, Ethan Nelson-Moore wrote:

> If neither CONFIG_IWMMXT nor CONFIG_VFP are enabled (which is the case,
> for example, in rpc_defconfig), the variable "aux" is set but not used,
> which generates a warning during W=1 builds. Resolve this issue by only
> defining the variable if it will be used.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/arm/kernel/signal.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
> index 7be9188d83d9..1d015b696a76 100644
> --- a/arch/arm/kernel/signal.c
> +++ b/arch/arm/kernel/signal.c
> @@ -140,7 +140,9 @@ static int restore_vfp_context(char __user **auxp)
>  static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
>  {
>  	struct sigcontext context;
> +#if defined(CONFIG_IWMMXT) || defined(CONFIG_VFP)
>  	char __user *aux;

__maybe_unused is a common attribute marking local variables that are not
always used. I find it nicer than another layer of #ifdef.

baruch

> +#endif
>  	sigset_t set;
>  	int err;
>  
> @@ -171,6 +173,7 @@ static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
>  
>  	err |= !valid_user_regs(regs);
>  
> +#if defined(CONFIG_IWMMXT) || defined(CONFIG_VFP)
>  	aux = (char __user *) sf->uc.uc_regspace;
>  #ifdef CONFIG_IWMMXT
>  	if (err == 0)
> @@ -180,6 +183,7 @@ static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
>  	if (err == 0)
>  		err |= restore_vfp_context(&aux);
>  #endif
> +#endif /* defined(CONFIG_IWMMXT) || defined(CONFIG_VFP) */
>  
>  	return err;
>  }

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

