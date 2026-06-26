Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AABCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAYBBi0QEhk5OpIMBq4Dd5BhpTCI5r4B2fec2bzU9qM=; b=Ojcyl/m2lZ+PzxAjPGMoGNKYKd
	mr/npStlbtKsD6vx7VruA3Ix6TZtQZQA5XffwkERriNwZme/GfX1C3wBMdnE6kAbDJlVTME3bdstX
	QOvpaHzJyEkB+zaMnX/ews1WqL3gzbCS3ex88sIyCKT51mVyO1qZWOF3LmQciXE6FwFOwc0cXknFT
	fotq+zU48sNiws78Fk53jR0ARPYKtiumZEwOL1ENY6XyE+qffo0S5ebcSM8irVpNjrPM/AZ+ql/C6
	oHNCUmnM07Gajm7y2/jJ910nTaiQkpdhm/88jJcpUqpNhvHag7oo03bf7NNFLwGYIMEVLaDvC+7Up
	kN6GfBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd37l-0000000B1CQ-0wlr;
	Fri, 26 Jun 2026 09:45:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd37i-0000000B1BP-0HWf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sAYBBi0QEhk5OpIMBq4Dd5BhpTCI5r4B2fec2bzU9qM=; b=oQ2aIW1yH1MJkA7rRBoT3Ow+Vd
	jd0G5na/NK4V/OY44T7Vu/+I9JNCLpDcmJal+RA14opnUIgM5Oi3xSMEvR2WFDZ8r9+uz3MVE2qsV
	hBb25FPb3FOA2CkcmrQG68bqxY+vDDof/+GIpbKgRAP3H3fVusgftQ9F9FND9vIRmcppwKV2kOygM
	N9vY1YjZ2Qrq0RojKk443gjL1PYUsjg9Up+tXx0qc5Ee6cw4Y965Vm44gKrZ3T7RHmlnE39d1iHkw
	bpf2D1LIUSBohpYRNZEoDOetTYfebY3CyHlasg0hIGy12ClFymu36rN3vxWu4S0ke+KcP5xWSVo/n
	Jc0zIhQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47770)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wd37f-0000000024l-3xqp;
	Fri, 26 Jun 2026 10:45:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wd37e-000000002wX-3Qyh;
	Fri, 26 Jun 2026 10:45:18 +0100
Date: Fri, 26 Jun 2026 10:45:18 +0100
From: Russell King <linux@armlinux.org.uk>
To: Qi Xi <xiqi2@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yuanbin Xie <xieyuanbin1@huawei.com>,
	Nanyong Sun <sunnanyong@huawei.com>
Subject: Re: [PATCH v3 2/2] ARM: mm: protect show_pte() in do_DataAbort()
 fallback path
Message-ID: <aj5KLv_eMRUYNhck@shell.armlinux.org.uk>
References: <20260626073048.3595106-1-xiqi2@huawei.com>
 <20260626073048.3595106-3-xiqi2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626073048.3595106-3-xiqi2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_024522_137240_02E5C18C 
X-CRM114-Status: GOOD (  10.97  )
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

On Fri, Jun 26, 2026 at 03:30:48PM +0800, Qi Xi wrote:
> The do_DataAbort() fallback path handles FSR types not serviced by
> do_page_fault() (fsr_info entries with fn=do_bad). This path also
> calls show_pte() without holding mmap_read_lock, exposing it to
> the same use-after-free issue.
> 
> Since do_DataAbort() is an exception entry point that can be reached
> from contexts where sleeping is not allowed, use mmap_read_trylock().
> If the lock cannot be acquired, the page table dump is skipped.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Suggested-by: Yuanbin Xie <xieyuanbin1@huawei.com>
> Signed-off-by: Qi Xi <xiqi2@huawei.com>

Same reason as patch 1. We can't take locks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

