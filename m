Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BDCD58B0F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 04:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sV9v+jPbtmnRcN75rXeHCeWgYNiYpovxidx9kjy7dAQ=; b=v7kP9D9nJhporBM1R9LbHf2ymI
	sJaoB/7utLOClw/SAWKaJNQddWKUGhxJ2SI5lX3YFZmYToQedLv/5YaMMbRTzNQlZaM3mfWX7EOxn
	0c3KJ1DQ/lA8FZdQyGLUdDbbZQsTmLyT0n3S1xy57CaQjRX0ucETuKQvonZjwRVlv8MdiMc6RfHqB
	rFpkiVuIaSZ7oy2qTjtVceFbDXkrjCMDYiELsjDYC4Rcz335DN6oE8jjqEaMbdVeuxmqEm7wrKB5U
	y8Q/VxvFx9UfnvaPZ5wv7AEP0CWL13y4ik/iNXoWZC6x0o2+yxJMBDWxD+jYDOr8x5n3y4wrX+wuF
	znPAbArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1dPo-00000002Nx8-1HMz;
	Sun, 15 Mar 2026 04:49:24 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1dPl-00000002Nwm-2wXH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 04:49:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c7381c4345cso1426057a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 21:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773550161; x=1774154961; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sV9v+jPbtmnRcN75rXeHCeWgYNiYpovxidx9kjy7dAQ=;
        b=cDUV/cIPCQeKO0LS0Eiy0eXwViarVrLuc6wIQSmyzm72QDa8SYv2nw9gsv9Rak7ldR
         tNaBJxMzhTC3S9rtFVmFxg6bI9bVIjnHxBJc0no+oUjftRRLwH7MRl6oV2QZQmWb3vmX
         32Kd4lIu1tZLsmyPR64GBrXMlVea9xS6qW+mprBKhPlQxsoXeXU54zqx8fGfh5vB7ADm
         Jh044P5EPTTLGP7ui3R0sJJDIw6VwTkTSGrufm7Xl2cRsw2S/JBoRh5nmOIIxXODZex3
         WFnBO6HH4iGEK/Nzjh2fXQW5RVTLdUXl8jr5cJdG+2hJHQ4GOxpRqaUUYrGYn8T6/eLO
         XW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773550161; x=1774154961;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sV9v+jPbtmnRcN75rXeHCeWgYNiYpovxidx9kjy7dAQ=;
        b=d8N6mTiTYk8WXM4Gk8SraQu8XfRah9tXPvtNNJ8uRpVVYZZtqZvVhaXK2BLR4BQr4+
         f3hKzBDsWkM0NV+L7R2NwAY5y62bO5K6LKkfHOoTi7rBu9iOqZKPxM0gS2V69lyevJl0
         oGUYovWqBPFSsCmfj80NUV9Q9cKtygKLioQWAmkeOKJnH1Rg2g+5j0d+Avk49Hg3uMkT
         ozr1O5PLnB4NBtGZTaQPbs70dxKija0OiCh9E3Gx0adYamCL+EiKWI8NCdzq+BdJH90y
         t3Jvn2q4HvV4cS0BxCug6tZ/+iTXbgiExf7BGKRninQWluxT53DBHDQGFsRxBJNd6kIT
         GPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpVCc+yvRfcN5xHKEJQTww8FkABF0gEpKk1dqeBIWys/6YcCorq0uCHuM6uu/aHReMnitLND319RyQNEPMebGM@lists.infradead.org
X-Gm-Message-State: AOJu0YxfB5QBGMP3XqBL6U8TWe5I8b4thfQ3R3L29tnrR4xJt5oOx7TH
	xxu3X7ZRZ+ec1qYbrdsA2G2KYkK/rXAqC6Z/e2qY6H3sS3k4CVswBO6b
X-Gm-Gg: ATEYQzzYy+iSa7tYAM0xX8h9jxol+IaaTZOAoeMXKI+ntVWX1pLWZu1bL8cokZVEgZz
	UtZ0A2MtCJdDjygFw3VT3mekNbBF1Kc2vx/eVBFEpfuY0Z78TmPq/O9DyPt00ANLeJb2BVnLYOr
	PxCxtVTWMaDQJjTyPORf1SDGp20sOiKJph4QpsCAzkqozBlMeaz9EVSlZe/eY0syI7a4hsQcEGH
	+wW9483ei1aUsSDBqsy0r8w0Q3EN1qjXsBImAOstjqSY/5DTCIpJVEmuh13AWHieWvh6IjzDy1Z
	hnZwtvXIWgE2LwGNmzjGoSip4BbEviCAnX/r0V9DksqGKUnXlDP10aYTPiac2B8mCOIdTotOYlT
	asgZCkELiLoHFJWH2oACXPS8bQ0AjUa6TS1lnucDooHUpmo5mV6S43g2sReV/t+WPPGg4Jl5+vc
	+9aB0HxOGOdFMUm0kU8xJzRYuT4LvY/3YqSFiXZ7VW
X-Received: by 2002:a05:6a20:3d86:b0:394:4d99:ff56 with SMTP id adf61e73a8af0-398eb0195a1mr8085594637.11.1773550160737;
        Sat, 14 Mar 2026 21:49:20 -0700 (PDT)
Received: from udknight.localhost ([120.36.202.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97b41dsm5538237a12.5.2026.03.14.21.49.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Mar 2026 21:49:20 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 62F3Tuap007594;
	Sun, 15 Mar 2026 11:29:56 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 62F3Tos6007591;
	Sun, 15 Mar 2026 11:29:50 +0800
Date: Sun, 15 Mar 2026 11:29:50 +0800
From: Wang YanQing <udknight@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: akpm@linux-foundation.org, willy@infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: lpae: fix non-atomic page table entry update
 issue
Message-ID: <20260315032950.GA5618@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	akpm@linux-foundation.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260315004746.GA32062@udknight>
 <abYHfGjqTRAB_oyR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abYHfGjqTRAB_oyR@shell.armlinux.org.uk>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_214921_798105_9EAC4DD5 
X-CRM114-Status: GOOD (  17.98  )
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

Hi! Russell

On Sun, Mar 15, 2026 at 01:12:28AM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 15, 2026 at 08:47:46AM +0800, Wang YanQing wrote: 
> Thanks. Now, please locate where the need for the updates to the page
> tables needs to be done atomically, bearing in mind that we program
> SCTLR.AFE=1 and SCTLR.HA=0, meaning the hardware won't write-back to
> the page tables to e.g. update the access flag.

When LPAE is enabled and in the 3G/1G userspace & kernel space config, we
use ttbr0 for address space 0-3G, and use ttbr1 for top 1G kernel space,
but wait a moment, the module space is in ttbr0 instead of ttbr1, because
module space is belong to 0-3G.

Then we don't switch ttbr0 to the same value as ttbr1 in task switch, so
when we switch from normal userspace thread to kernel thread, we use the
do_translation_fault() to fault in the module space for the kernel thread
when it accesses the module space. Now please think a situation that
userspace repeats create new short-lived processes (run shell cmds, etc),
we will use do_translation_fault() to fault in the PMD entries repeatly
when switch from new created process to running kernel thread, we need
to update pmd entry automatically here, hw is allowed to do data/instruction
preload and trigger page table walker to see the partial update pmd entry,
page table walker will cache it, and it will cause translation fault,
because it doesn't see the upper 32-bit.

When the userspace process is a multi-threads process, in smp environment,
other cpus could use the same pgd for their according kernel thread, all
the page table walker of the smp cpus have the chance to cache the partial
update entry.

Thanks
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

