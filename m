Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610EAC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWfZgdsvHKEEM66vteqiVMN/kHVjVgzQe3JHcmrpCug=; b=TDLjhjtzk0YUpBErRZ1Vzx7Ovd
	AEJ+IQ16EJSqaSbEFMQ8y5Dewo3sVXC5ScmD6hFOOhwXYvuOVLUSLwOkMyxCHrb7A5J4XEuBBi6DJ
	5k2OWv9VgmkpGxxwLJiQY/b1/emJ2fKb/tOBY3N/082ExjYcgw+pnDhqW+AotkcBtEpGzpsGL4X4G
	tTbH+GEjRW+pS/N361CmNV03RB2znLvQLlHqxzeYa3ORZWxESRAzKfYHEpJamjNWPNHwkZP1fN+gY
	M0bLB734LxwTcb3tQWFVN4li4cD6iQMnzAlaBSrrwtpOwsKiFuPYpBLIpwE07UEzt5Aabg4htXGTB
	ZISjqdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATGX-0000000FimB-3pYV;
	Thu, 01 May 2025 12:43:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASvf-0000000FZaq-3fBU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:22:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C169F1D14;
	Thu,  1 May 2025 05:22:07 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12B663F673;
	Thu,  1 May 2025 05:22:13 -0700 (PDT)
Date: Thu, 1 May 2025 13:22:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Message-ID: <20250501132211.0310ae49@donnerap.manchester.arm.com>
In-Reply-To: <174610166405.2974716.1586244113913047340.b4-ty@csie.org>
References: <20250430095325.477311-1-andre.przywara@arm.com>
	<174610166405.2974716.1586244113913047340.b4-ty@csie.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_052215_962788_6C361052 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, 1 May 2025 20:14:24 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> On Wed, 30 Apr 2025 10:53:25 +0100, Andre Przywara wrote:
> > When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
> > of the last two arguments was different between the users and the
> > definition: features became flags and flags became features.
> > 
> > This just didn't end up in a desaster yet because most users ended up
> > passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> > not yet used.
> > 
> > [...]  
> 
> Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

thanks for that, but the URL here is not correct, is it? Should be the
kernel.org repo instead? Saw this already in other "applied" emails.

Cheers,
Andre


> 
> [1/1] clk: sunxi-ng: fix order of arguments in clock macro
>       commit: 4a9c3c3215491f25bc66d615faa921c814b1a479
> 
> Best regards,


