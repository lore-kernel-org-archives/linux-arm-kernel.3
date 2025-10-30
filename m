Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4975BCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEy1pzlBxEDKuz9VSbjEr50+/lWvYrPAgZ9M9/u5gJc=; b=QlZA+fmcYi/XiyPiqJI581bbKt
	kswKY21SP8qpD/uyAV+y5OVQjbWWLDgoZHmmY8WIz0ozQ7G0snv5Q0l3EaQs4FhkPv/uk8PoFRA/2
	xW9ShlMq9DZiSxGp8EoT1DpUlqnn/6UeO4JxXYa+PdJfNawCEHP3XCfusNio0NXym6bFxT1yOh5X6
	uYdtA6EVxd29JZl7xNFhu6JURxpQS/9uRDIzkgkpDwYWraESFQJwY4vI+6yUO+3bYZ/mTSZNlr8v7
	pn9yC66fJjexWmnZDcxDKCS0/PC0FGCffjDY5c+mUgxd2DrctFXqN+zHbo6s9NDnIKPh/0SOukY/W
	4XmoBziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ2s-000000040OE-19sF;
	Thu, 30 Oct 2025 10:38:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ2q-000000040Nl-0iu5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lEy1pzlBxEDKuz9VSbjEr50+/lWvYrPAgZ9M9/u5gJc=; b=K2ocgODhGfZUa+rFjoxN6HdHrC
	fIemRICg6B7cQX4qQQJxPD++XA+tm3szSlSA1QAolcn2cIG9onf3/Tpx7Zce/5ugAQcw19A7InhpZ
	0DWCbe2BuiIjfF04Z1ptn3vATb5T1mOU/Mt0nBMkDhFFhIs94Nobiu0ct+OojsRS8N3R2zWe1OgUb
	GMkowlp7mIDcN64hWfKrXWdEDA8c9M02A/Ag8rUHt2N2BM54zIm8EtpjmFhkzzYjy3HrHbgP6S/Bk
	vVdXzIyXZczWSiletA1uhr0yuo+XXlJSWzKTvrc5PIP2tB6GbIXe2lGhVeRh2TBajV7ZDNo8t0hSy
	r5Ms6uXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48466)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vEQ2m-000000005Yv-0in2;
	Thu, 30 Oct 2025 10:38:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vEQ2k-000000008Nf-33Er;
	Thu, 30 Oct 2025 10:38:10 +0000
Date: Thu, 30 Oct 2025 10:38:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, tglx@linutronix.de
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <aQNAEtIoU9sEx3LF@shell.armlinux.org.uk>
References: <20251030072339.63vdFNo3@linutronix.de>
 <20251030074507.33863-1-xieyuanbin1@huawei.com>
 <20251030075558.sUBj8_6U@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030075558.sUBj8_6U@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_033816_207103_7ACBE972 
X-CRM114-Status: GOOD (  10.45  )
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

On Thu, Oct 30, 2025 at 08:55:58AM +0100, Sebastian Andrzej Siewior wrote:
> Arm64 and X86 replaced the stop_machine() logic with something else that
> does not affect latency in that magnitude. If Arm could something
> similar then fine but until then I don't see a way around it.

"If Arm could". For 32-bit, Arm Ltd isn't going to do anything, it's
old as far as they're concerned. It's up to those participating in the
kernel community to maintain and look after the code.

Thus, if there is a desire for something other than stop_machine() then
it is up to those who care about the issue to do something about it,
rather than expecting someone else to do something for them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

