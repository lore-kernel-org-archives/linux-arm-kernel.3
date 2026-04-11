Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B8EF3ED4B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbqt5Qpb1Da8WzrSORfQC8GDoEFqa1MXloGMeTyaA0w=; b=uIMMAUX5WtjnSj28YEzlcScvzO
	+BkAGD8X2Cep2fiOYJRFXEY7QXM/P9LN9SlTULHAm8F8NIpa4bTwquFOcrEUo7d/3ftgzmuzNNSRy
	jZaUK7X3htHMkk5T0f/8hsWJuuvLw9WX8gRi5i5nclGm5lR0fuCFRTkRM/UGrUahGadK994Gb7ZjA
	teQqfwmmPh51nUf/3cfj5kohszddLtkaxWRG85jpRlMxLbQJ62xoo42LvLeYf2MIUJWk/apSdeDP6
	TEeuS9NUYd1FEsO0AVK8ycWJPLlEuMHgN3Obq70hVSrCKCWX4UU5IOCX+c9ocVQbT4ApdYJGocv9I
	0p2dVuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXRq-0000000DQS9-1gta;
	Sat, 11 Apr 2026 12:28:26 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXRn-0000000DQRl-2Lga
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 12:28:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b299b3c739so13022655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775910502; x=1776515302; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mbqt5Qpb1Da8WzrSORfQC8GDoEFqa1MXloGMeTyaA0w=;
        b=swdQNIggtUSGlmn82t+yEA3f3Z5BmNOC3yrYvkzSNVI2dnL6bOeIg4j1EREiV2rqF+
         yctTnl/fr89MCrljgQgrBa34sZLzhmIzFpTCHXGnEmndfrI4oqbvnimeV1tRhQSKt18x
         aIFRYUfSWtrDEX6CBfJLA4HJE6V8YYVIZ6M8fIkpwbBpHvHebFuktEGbu/imoci5zic9
         AabfunLRZQ3RhAmSpyX53JloG9Q6HQRGAMG8QOuJNkRGzpt/SpnyDjTp5ztiDwO/P6Mn
         fBJvmId4ILRaCcZ2hAiz70zdaWPIPoHDMJO5X0upcT5vwGjsdIrUEr3IEPOaucOx1nUn
         ro7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775910502; x=1776515302;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbqt5Qpb1Da8WzrSORfQC8GDoEFqa1MXloGMeTyaA0w=;
        b=LIyK2LIpEqvF4oLFvu+omnaHMz1kT53ZKzORCvHDS1c6le1VXFR3epMIGUADWvWkEN
         rUm2P7bN4tzanh2kGXrnzo3vvaP8ixewTI2BRj3dTUFOgwaVeU+pW31/1tqoQuy2cZB7
         WqoNsvZkVPrVL1OObqW6Kz200/wwr9CjUVXvFSwe6i+3bLUu7VfAt42z/Sae0z1yME0D
         JQzKFBLlJpGNz1rCmQV3nYPqZiv73by6nq6g6DcSq7PwnOmoMAIps9s7kStuXj6w1nXN
         Sx4P04iag0GwNQaX14e9zKbg3WLs7BDoQ2xQjmWYqec5AD/qLGg25N0PHjHtUNN0VIU1
         fsTg==
X-Forwarded-Encrypted: i=1; AJvYcCXddhv+EqXVl7CIGcVr8KlF6zMMYbqRJQUyMXpSxd0ERczS8fODxJMTnJhTli2tL8a5/1AIEDrFuuHOiIBFA8nr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj/0grNFiPSbZ+K0V9BEjUIpKTDIbu15TaGkXEX7VHUfZbpWsn
	KHuSQMfmECKbqIyZCxYoL4VKpjQrr7b5hnm/vjJyBiICPeEdCWIsJjfp
X-Gm-Gg: AeBDietbT+B5eI7fCxkSndgg6p8suwENr9b+0nWOagN23ri2z4FRpGc5dc1u4GABIMM
	Cj+iUFuIxAa9UIzUSLZwa6mhrqF6TD0UVFrh3je0QH1nCBVPku+fm5I+TunnoQyRW4J99kYe4WJ
	tsSUaJBUIrOBLMAdAavrbXNdwOhEoVDVa9sqUumM4sNVgAb9LMHkC/hzYIRoDbLfmILwPXlPfVN
	OhfTab3MZpFWNXxeVm1nTIAbu6uvCREvLSAcqzKX+zyHYr7D+yTL4Vw4r5+9UPdyHiI5gEuSIFE
	xDdTxUBq0v8LOMqfjOnG6IG1hu2vS0t9wK1dPrVwZdA2fg/5jtZg1KCpcL4I206yt//PJxIAzVD
	0Hox3H7P6xQGbTuiVAPsX2G2ulBnIyhYVTQnnXB0tCUzl/TKpQmcXrmSiTr+e4CzEVmsjXYzn2I
	/18QGIBKyt2c0eqx4gg6SN99D/uR8dEvkbXndlXNFU3GqOVsTzh1ED
X-Received: by 2002:a17:902:d2c7:b0:2b0:5770:d484 with SMTP id d9443c01a7336-2b2d5a67389mr70973825ad.41.1775910502214;
        Sat, 11 Apr 2026 05:28:22 -0700 (PDT)
Received: from udknight.localhost ([240e:379:1ea4:201:1d74:bf36:51db:2590])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0ada5sm62470315ad.42.2026.04.11.05.28.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Apr 2026 05:28:21 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 63BCS4Va011166;
	Sat, 11 Apr 2026 20:28:05 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 63BCRtY1011157;
	Sat, 11 Apr 2026 20:27:55 +0800
Date: Sat, 11 Apr 2026 20:27:55 +0800
From: Wang YanQing <udknight@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, akpm@linux-foundation.org,
        willy@infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: lpae: fix non-atomic page table entry update
 issue
Message-ID: <20260411122755.GA3274@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	akpm@linux-foundation.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260315004746.GA32062@udknight>
 <abYHfGjqTRAB_oyR@shell.armlinux.org.uk>
 <20260315032950.GA5618@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315032950.GA5618@udknight>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_052823_619081_6ECDB57F 
X-CRM114-Status: GOOD (  24.72  )
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

On Sun, Mar 15, 2026 at 11:29:50AM +0800, Wang YanQing wrote:
> On Sun, Mar 15, 2026 at 01:12:28AM +0000, Russell King (Oracle) wrote:
> > On Sun, Mar 15, 2026 at 08:47:46AM +0800, Wang YanQing wrote: 
> > Thanks. Now, please locate where the need for the updates to the page
> > tables needs to be done atomically, bearing in mind that we program
> > SCTLR.AFE=1 and SCTLR.HA=0, meaning the hardware won't write-back to
> > the page tables to e.g. update the access flag.
> 
> When LPAE is enabled and in the 3G/1G userspace & kernel space config, we
> use ttbr0 for address space 0-3G, and use ttbr1 for top 1G kernel space,
> but wait a moment, the module space is in ttbr0 instead of ttbr1, because
> module space is belong to 0-3G.
> 
> Then we don't switch ttbr0 to the same value as ttbr1 in task switch, so
> when we switch from normal userspace thread to kernel thread, we use the
> do_translation_fault() to fault in the module space for the kernel thread
> when it accesses the module space. Now please think a situation that
> userspace repeats create new short-lived processes (run shell cmds, etc),
> we will use do_translation_fault() to fault in the PMD entries repeatly
> when switch from new created process to running kernel thread, we need
> to update pmd entry automatically here, hw is allowed to do data/instruction
> preload and trigger page table walker to see the partial update pmd entry,
> page table walker will cache it, and it will cause translation fault,
> because it doesn't see the upper 32-bit.
> 
> When the userspace process is a multi-threads process, in smp environment,
> other cpus could use the same pgd for their according kernel thread, all
> the page table walker of the smp cpus have the chance to cache the partial
> update entry.
> 

Hi Russell King, what is the status about this patch?

On some SoC, Texas Instruments Keystone etc, it will run arm32 linux kernel on
high address (KEYSTONE_HIGH_PHYS_START = 0x800000000ULL), then all the physical
address of page table will be 64-bit and will meet the issue described in the
patch

Thanks

