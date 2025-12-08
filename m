Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FE6D3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5uChk8UJmyeBSo7LNG4GONTAkozp4hObtHsSKt7m42s=; b=dOx7EsuRLgEBUAnTBSKvfcjMVK
	ewhBtFnAUpQ8Xy5byg/Q4O/xzAdM68ywJH6iohc/mL7ujd7ymmOFw4LBVEPOEG1WEnZrYEAVKVk+s
	FJUPqi/H9NjlDwqVo8AB9plQlK9NYdEn9so4LHYcJggccfzE+bS4LXT11v8B4+ErOJjmX2KL9MMcP
	P1fA+3xRA5qu4RPfDRF8/8y3+abp80+6zgcyxYVLYv91MFHu2AOn1cBy9RmqiHpR2+wwplaXhh+Vc
	g8zAMolaSP3tn3mWPgx7Vwt49EKyJrELs/THfB3amS05e/Az33JDDEl3sx7RJs8xTMqX7kFeNoEx7
	D5SVaDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSaRx-0000000D4nV-1Kpg;
	Mon, 08 Dec 2025 12:34:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSaRl-0000000D4mR-2Y5C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 12:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5uChk8UJmyeBSo7LNG4GONTAkozp4hObtHsSKt7m42s=; b=e4kWGIcJT1Sp1iYMw/S6IYVHy1
	BwvKtbH9ny8q6NFH9W5Axe7JpXEpJlw76f1OTAIReV6kUmAWVPvoUM8o8FrW42gMP+pEaGmY4+01P
	cPeNXM8qH/OKanqNiJbT5iGuxK5HFQ96nAVZkvgfcbgtmCKCeO+3J2lPGimiRNHh0NO1D1jfLPiqR
	kzUujTBOpqNAWtGFS6STsVxFDmmODNl2pbFqo8995RafT992OVD+rV3k2gHsXMIF9ztg8z2BIIaqT
	Bq+skhfu3m3LsYpCxRl/1/5Vj8NL2xzWdojYM+pIk2rhIdhjNv1StL+lEdcF0KEzdBQfLX03c6N65
	578uiEZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49262)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSaRh-000000007jP-227t;
	Mon, 08 Dec 2025 12:34:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSaRf-0000000051L-2uGb;
	Mon, 08 Dec 2025 12:34:27 +0000
Date: Mon, 8 Dec 2025 12:34:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk, will@kernel.org
Subject: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Message-ID: <aTbF009476Iufory@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_043440_024438_DD2BE31A 
X-CRM114-Status: GOOD (  14.21  )
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

This series, which I'm intending to be part of my upcoming pull request
for this merge window (note - will be sent before Thursday, otherwise
it won't be until maybe the middle of January) fixes the recently
reported hash_name() issue, and also the long standing branch predictor
hardening smp_processor_id() warning which occurs due to interrupts
being enabled.

Fixing this isn't trivial because there are many paths through
do_page_fault() which are non-obvious.

For example, we detect page faults by the kernel attempting to execute
memory that it shouldn't and print such a warning. If we introduce an
early address check, we avoid that detection, making it become a
plain kernel oops without the informative error message.

The first patch adds an additional check in __do_kernel_fault() to
detect this condition. This patch is a non-obvious dependency for the
next patch.

The second patch handles faults above the top of userspace entirely
separately, meaning we have a simpler and more obvious fault path,
which avoids any possibility of taking any MM mutexes, which is the
cause of the hash_name() problem.

The third patch moves harden_branch_predictor() out of
__do_user_fault() and to appropriate places in the parent functions.
The reason this has been avoided thus far is because do_page_fault()
can be a hot path (since it's used for page aging as well) but with
kernel address faults being handled by an entirely separate path,
this avoids adding to that overhead.

I would like to get some attributations for this - specifically
tested-by.

Thanks.

 arch/arm/mm/alignment.c |  6 +++-
 arch/arm/mm/fault.c     | 74 +++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 67 insertions(+), 13 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

