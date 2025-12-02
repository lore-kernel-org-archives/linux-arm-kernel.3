Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84845CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8lVeEewvobMOpR8lC3k8lo2AR9tpKYDSUjo/3iThWc=; b=NBXU4Vn6bch610i8LVWn2zvKOJ
	0UdzEL06U1tynE81Jqq+Qqq58h1Ee+DIHotMYEVvJZKzfE2ou0y/ywcwU3D7RsBqEPyhHlwL+N7zT
	XwvgEGMXswJW+ZlX3Z2WoEtzzBcFh1hyq++7YzPbBGIUtnonE8+a9kxKFPZXQRVX2rZk2TKfzguZs
	Vs5YGPik90INCMc6qXqATyg2lDV3gWcyHcbUeMfqESaMbKWISU3RLvyFpr8QbE4fomvMzDscmpuWB
	50dgbkLWHUFkOmJfmvWIWQKISsFDFyvhE3MaYB8m86DtVxpToK5vBLCe1pnuTbs1hA2wmoN3jWM/O
	jTuBWc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSaO-00000005Zjf-1TAn;
	Tue, 02 Dec 2025 15:46:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSaL-00000005Zj9-2FSs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 15:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B8lVeEewvobMOpR8lC3k8lo2AR9tpKYDSUjo/3iThWc=; b=pGW1wQMDB4gpVcAKDhhrvOYIMF
	S+z2LpAbMdBAY5XqI1fKjg3P8u2iCOqMO4V4QEPppqxcuKT0/3m+J/t1w4LeF8OAbRzSZuemnp8BH
	lGdUigCNtpumHjdEYQZ9a2vtwZTMHMvBplbgfIGWsB3C9nGptZHiDxtwPuQZ4mEhiyzSbZfaaOYIc
	27qdV3AxAeC+BJeAFNdPbC2zJWBKK1hkxbaBkzlLJylXr4moCUnz8wJK3sag6v/qc9px+7BSKVNWi
	ZI8yjuBc78wbyBMg70rqFMSMGxuVzF/31CbQi2nbiOMgt4DqsWa+IaI3C7wofwyrU5mXMFpowX/JU
	jmWpMz2g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59058)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vQSaC-000000001pg-3HUd;
	Tue, 02 Dec 2025 15:46:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vQSa9-000000007Zj-1Cyb;
	Tue, 02 Dec 2025 15:46:25 +0000
Date: Tue, 2 Dec 2025 15:46:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Xie Yuanbin <xieyuanbin1@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>
Subject: Re: [PATCH v3 2/5] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <aS8J0WrmmH01L3K1@shell.armlinux.org.uk>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
 <20251110145555.2555055-3-bigeasy@linutronix.de>
 <20251202141816.wfHNUMFK@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202141816.wfHNUMFK@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_074637_850505_B56B5E39 
X-CRM114-Status: GOOD (  15.43  )
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

On Tue, Dec 02, 2025 at 03:18:16PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-10 15:55:52 [+0100], To linux-arm-kernel@lists.infradead.org wrote:
> |
> |   https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9460/1
> |
> | Moved to Discarded.
> |
> | This makes the issues with the branch predictor hardening worse if this
> | patch is merged on its own - since this adds another path where
> | interrupts are enabled before calling harden_branch_predictor() in
> | __do_user_fault(). It would be sensible to move the interrupt enable
> | into __do_user_fault().
> |
> |    *** PLEASE DO NOT REPLY TO THIS MESSAGE ***
> 
> I thought that we apply both.
> In 9462/1 I am moving harden_branch_predictor() out of __do_user_fault()
> because do_page_fault() needs the hardening before the interrupts are
> enabled. Do mean something like

If I apply 9460/1 without 9462/1 first, then it makes the problems
with the branch predictor hardening worse. I'm not prepared to do that.

However, 9462/1 is tied up in the discussions that are ongoing, and I'm
not going to short-circuit the still-ongoing discussions that touch
this area by applying this patch - which would screw up everyone's
proposals to fix the various many problems that are being discovered in
the 32-bit ARM fault handling.

This means I can't apply 9462/1 nor 9460/1.

Since 9463/1 likely requires these, I can't apply that one either.

Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

