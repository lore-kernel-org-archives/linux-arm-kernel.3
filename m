Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF1ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=; b=1CNETdkhnpZNsU29GbKIRXJ962
	Bv3r8RZ6/w0SvmL4PMmbVfPxhrFL47K1GSL+FVXHYF0rREoRqGq+V+HW70Aewfd97khLjLdRpqWil
	N1tujiGVQNz28R89xaM2qquIMHc0WiJliPVxNc0nCGrD5r6IbDhBzZDF3Oaz//aI4s/xCIh5gtBvb
	72iYb4Nlf+JrUrU6fc5SpBzeo24fgGa01jHI9VWycldTggM1oksuKJ8R2G2d/mPtGMQQl3O4X3r22
	HzjKF4zDINqfd5QOGODVWh5jnWWTIZLn842d257w5dUAo/0OkabOqdXHt8UuwXrbSbZjrkFnH/Nr4
	4mjGPhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZEpX-0000000Erbf-06id;
	Mon, 15 Jun 2026 21:26:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZEpU-0000000Erar-1nsc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 21:26:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-68bd7ec2371so1600a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 14:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781558804; cv=none;
        d=google.com; s=arc-20240605;
        b=W0uV756Bvv4DUge2AR5cKdyzgiKOEYIOoURhfk4xlC4TGnifIsICtOyD/TqyihpMsO
         C+DuQu4S1VtSJ60FAXh6NTqx55D1BD1LC4PVGO3N2shGXomO7ipARVu7FFUQX9yoUk/+
         wCoDv533CdNpEvw+G1jODanAMs1JvknGHvzpempaZDGdstf5d2uyRfdCBG1AECHOaUtS
         RYV+k3t36H9pnP1GtQoFMpwx9GpSbkTPGjmwkQ/dYMUIKZZsOKMFGeJiCCt1t/FyI8qy
         XgHC4YUN2Do2+XJad/rbDU969jMC7PWZipw2K4KT7mplWwu6Oks47hkS8H3kaZM4KJ9P
         d7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=;
        fh=3M078XqLOTWbezLkrntMJqBl5n4DldRQ/vfkjyim/aA=;
        b=N44nBD9JOnV7505iexAZSgB5reccOCT07pvwOO3qFlQLQ2zM6Dn72wHck2S1/Z/RPJ
         JzajA62E3S7/lsiv2gx870tZAGRWTMlnqxIIDr8ET6nHZlX9UT/oXhcJzwHJpPMRlvB4
         Ud9H+slRA7VtI4MmCryqCD6lWn+7QU0E6dQ6iV4inUBqvmHfBy56Cce8CBRHhBtt4NZU
         qLpg/GnxS8sditqjzMfY2az1tM3fOhhxB/AavjSUk/HO9UIAjSVbIomn1FqfcrbgplCd
         AkHv7JnmJ4K3Lk+65zwBwBb2jYlpB3gf1AjDX4T6egRObwcaAYAeykOFFBPfz6PlofR3
         qsxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781558804; x=1782163604; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=;
        b=KUaYIZQLPSlx+GHkc7pRA3EieccQEFq2d8o09VH8yiQHsuKWrbcJrRUbDH3BOwHIzI
         WXgIp8O0yWGNyVBQEZwYfGbKAPCbHoSJtikK5XxnYarH93jFkm7hMotibvI0MEwYF+Ds
         hSB1ZVE6/jPCOE/gzAuYFFACrqYGhDJgdD0oBbTqPcPDnTUrMZYRisoDCH3JbqFPrPdO
         dX8dqefzGhVgMQDtjUUEp7D/6H0paaQsRn5LQjQgafM1aLBtql1uOyCyKedBi1einEYw
         FqzRfDckwpBqW6Kxyz1+Q5Pz+GZj31RpWXh1ynnwRjglRCZAHdFaFunlgiZCdHRhkl/a
         nmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781558804; x=1782163604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=;
        b=QZlYHGLA2GVgorHQqEWecUUeu1mNAZ+gBsVXmlORluzC9METc6dkKoAk1pNw7ftlAr
         m0qL9XaaGhdGHrkZTwOC+2Vpq7w1ab5EW50CkL5MD0otinX75cUQA9Z2cpKwKcEEzvPp
         MPzyRCDEM06xzyybVQZ8KqtoHrnQr5DahsZFVFEPhV3qZ0X2OQKottH+CZ9kP1ETHq5d
         JEwI7sW7k4vDV66oY6v3aRq8XntEUiQSHs3J6IVb7NzBaR0dNNe7/J/dahwjlzeon0wS
         IqBSbffAjSrLThGdbAnvtahEERuy73LTd+2Xdo/sEFfZSrJfw9CGIfV4hsi0UQTbqgje
         rBVg==
X-Forwarded-Encrypted: i=1; AFNElJ82HDp4klVMc/uFptE2fQAOMWEDuO/s22Cr0QFeUw0+O6YPlcyehD8sdt1akerQtj38LW75Am+AWNaw82/E32ke@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa9tiyqU3/7YWqCtWORzCa+jBKB+bssUmplXdzSt9hl06jDmjY
	cM8tRV0YmZDWi7e3dq+43AxMa1dc+qU4XNuEfEXWR9gWzWB4Jz7JeAijaC8xaG3M46XMmDYjUFL
	xWDdCUr+S4Qzzae1aSCwrWnDIAf5p1QDiW7Wl4Kn7
X-Gm-Gg: Acq92OFyxkyfG+yeyUnVHL5MIvLVP6oO4SLXu61IGIcrMcmc/QJ9Cgir+CiXf1dF05b
	oOkC+DNSDfIDyMANxzyE7wUemn2xWcwz9ZICMKFlUwCGGbd6I9wYQu5Z4CHJ7QLRX9d38kQTyl8
	SARexkeH1wTXi+kE2RGgEdTy1FE5zPARxvIz6XNvtoI30XXvMkqPUVgluI5dInYKFGdUmYUfG5I
	wrtaK8MK3o3gKkjGWIFyz6iMbXcaq5Xu1/w0bk5bwj4zAexEBp1z6obVPnHlpEMDzLXg84JoS7E
	98ns3e/eQe1mFt44C6SedNJYiXX6peawcBEEKx3Dx7FdgKMO
X-Received: by 2002:a05:6402:684:b0:683:33ae:8689 with SMTP id
 4fb4d7f45d1cf-695085d13b5mr21597a12.4.1781558803963; Mon, 15 Jun 2026
 14:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260612162257.896792-1-xur@google.com> <20260613170143.GB3152432@ax162>
In-Reply-To: <20260613170143.GB3152432@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 15 Jun 2026 14:26:31 -0700
X-Gm-Features: AVVi8CfiVeC4233aezHEUet34ga7TDorkoyE27yShVwTmSOfx7cYTcOkCfEkcXc
Message-ID: <CAF1bQ=S6OMwWuA=xaKy4CNvCmsAaJ2DQPi5LnfLyu6x4RnF61w@mail.gmail.com>
Subject: Re: [PATCH] net: correcting section tags for .init and .exit data/functions
To: Nathan Chancellor <nathan@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	=?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Yue Haibing <yuehaibing@huawei.com>, Jeff Layton <jlayton@kernel.org>, Kees Cook <kees@kernel.org>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sabrina Dubroca <sd@queasysnail.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_142648_475491_7295CAF0 
X-CRM114-Status: UNSURE (   7.20  )
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

After studying the warnings further, I believe this is an incorrect fix.

Normally, *_net_ops structures are intended to live in .data (permanent memory),
even though they point to .init.text. Modpost is handling this by using
hardcoded whitelists to allow these specific exceptions. However, this
whitelist is
failing in ThinLTO because ThinLTO renames *_net_ops to *_net_ops.llvm.*.

I am withdrawing this patch and will send a fix to modpost instead.

Thanks,

-Rong

