Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B6FCCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eahf1US0Vntav9eB/jJjGf+ncS6bWMSnIpiA6yHnIVE=; b=hTesd8G3NW5RVlPKBvTboUIY3z
	uD2dqFibD3nJT/Ba5+MsMap6WopQcZOjEZdqpY9Wygc8DC5RA+kaNNslYPrAHajatkwk5m1M5sCCl
	UAVitG6AVAjDgratDtM74gBCfj2j72jzIv+wDgdikMQRAWsLMj3p7rM2vyXMgbsD300JWNkGJ4z0T
	4b+Y5Uv/s266h2PNlSPKSBWZfXwUMcraDuJzNnc4IfaNGbCmALSO3EUHsW+JU1Bbc6i+4xZbBAX+9
	yXnZV0fCf1v4BUaBvSJBYVDqGW9lD0Mn+iJ0qcecX3bEPnb4ewrzHMdtdaeRfSJm5WSeM+OBYrG5r
	5wkW6rFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENVr-00000003erN-3TaR;
	Thu, 30 Oct 2025 07:56:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENVq-00000003er0-14Qf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 07:56:03 +0000
Date: Thu, 30 Oct 2025 08:55:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761810960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eahf1US0Vntav9eB/jJjGf+ncS6bWMSnIpiA6yHnIVE=;
	b=iHxDhWwr8tfyEM3ulmakmguUXZBwIg/kemtFHgwoFBLGpMLI/7Z6ED7qKaF7UqqZH0ZkoD
	oWPCOStkvVjB6dvt22nKbab7NX3D96DHVYHBb6Hn6u8J4idaK5je4v4IYX5rKDEQgcqIIA
	r8+Jnwnfc+s4zlETRehtmFq9VdS59XtWTsdYZSjk3XXl0O13t3EzZLq8XioNkO4bKf9/Ii
	R+ir8X/mgyOCXTkNcNb3aHuFx84RpzCz3jzouUm6FwMAQWh2HBIhovgcY8lMBlPGQLivAU
	QIKdkcT3znvFJ5WEZCWykKW37a8NkIDe9x4+NNIpkrHKghI+bnu4iGn4P1FYvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761810960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eahf1US0Vntav9eB/jJjGf+ncS6bWMSnIpiA6yHnIVE=;
	b=1nhxrKtBG0GhyZ4c447tMnpRUoOiHappmF3/WgKwVSj3lH+f0rAU6zZ4BtmyxXWbp/vEdW
	U8BqudBHO8w6IqDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, linux@armlinux.org.uk,
	tglx@linutronix.de
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <20251030075558.sUBj8_6U@linutronix.de>
References: <20251030072339.63vdFNo3@linutronix.de>
 <20251030074507.33863-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030074507.33863-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_005602_432604_9E900C8B 
X-CRM114-Status: GOOD (  12.97  )
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

On 2025-10-30 15:45:07 [+0800], Xie Yuanbin wrote:
> On Thu, 30 Oct 2025 08:23:39 +0100, Sebastian Andrzej Siewior wrote:
> > It is not a performance issue, it is a latency issue. If the scheduling
> > latency increases by 300us because of this then the PREEMPT_RT system
> > becomes worthless.
> 
> I understand what you mean. But this delay only occurs when the static
> key is enabled/disabled, right? For users, we can control when to
> enable/disable the static key, but it's a real shame if jump labels
> aren't available.
> Therefore, my personal opinion is that informing users that JUMP_LABEL
> might cause unexpected delays, rather than disabling it, would be more
> appropriate. ;)

You can't really control when jump labels are enabled/ disabled. For
instance this happens if you enable/ disable trace points.
Arm64 and X86 replaced the stop_machine() logic with something else that
does not affect latency in that magnitude. If Arm could something
similar then fine but until then I don't see a way around it.
There are other things that are disabled on PREEMPT_RT due to latency
reasons such as transparent huge pages or expedited RCU.

> Xie Yuanbin

Sebastian

