Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177B110854B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 01:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHWtqktMIOo37em4YwD/PDiKJfQIMjgsRq+RsF1wqo0=; b=tGgi4HFROA8jjfLVGkbv2PudPW
	9xr70efJiH4MaSAvC3pZ9x/zjNINM9pCKN61ijlUGPuSoCJcSZkQTV7iqf9WMlNWL5qKma7Dd0yvN
	BGjG2MB3W91MJ2kqVYk6nGlBkdCnKCIFp6iLnnzJxgQr4RyVNOlwEvqGpFdMelS4vGO6PA4bUtzHe
	J7pvZmz4N21cD8zBO//9ABN+6+7k0za1D3Cfy534GdhZ9+X+3auiF3skaM4DLQnk7DqcEqxs0aH0W
	GWxZIQW84KXwvZ8MwvoIROVJA/CvXsWKFEGKU2hlhj8yuTJdJam5+rNPhXtka5tvKWCr019ehGpeL
	ZHFZ3iWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1a20-00000002HwU-46lV;
	Sun, 15 Mar 2026 01:12:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1a1x-00000002Hw8-3dZR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 01:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NHWtqktMIOo37em4YwD/PDiKJfQIMjgsRq+RsF1wqo0=; b=pjpnLmDaHgJQs+YRKwonoExL6j
	sVcUb7sEYxqnRh08TRhYvmzIaUCQMKmdkgkDGizDEnt+kultOucqwELPOR/Jl1j3RVYBCN+pJdu5M
	eNwfNp/GaBzchZI0OGZXtayHwmWUMtq+kTtfT/5chHWmYYqcCkYpTylSTm2rYB+SZZYB2GN/Ffn92
	TbiGfLo+wzno5FT3bzD2BegeHyAVDTx8vveT9SI40cKUxYQKs6lvOC17pkJZuaD9ZGikhxxttc1WI
	PNkElmsGyVvJlHlsuWFpCKF0aaxN5C5dNR8UBkdP7ZgOe6aBjmks9s5HVCilYDpYgzeEcmk/SH0dt
	+kzkpu9g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41320)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w1a1u-000000002YB-1xTA;
	Sun, 15 Mar 2026 01:12:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w1a1s-000000001Ic-3W1n;
	Sun, 15 Mar 2026 01:12:28 +0000
Date: Sun, 15 Mar 2026 01:12:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Wang YanQing <udknight@gmail.com>
Cc: akpm@linux-foundation.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: lpae: fix non-atomic page table entry update
 issue
Message-ID: <abYHfGjqTRAB_oyR@shell.armlinux.org.uk>
References: <20260315004746.GA32062@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315004746.GA32062@udknight>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_181233_904333_46F7D4C5 
X-CRM114-Status: UNSURE (   9.55  )
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

On Sun, Mar 15, 2026 at 08:47:46AM +0800, Wang YanQing wrote:
> The ARM Architecture Reference Manual explicitly dictates that writes of 64-bit
> translation table descriptors must be single-copy atomic:
> ARM Architecture Reference Manual ARMv7-A and ARMv7-R edition (https://developer.arm.com/documentation/ddi0406/latest)
> "
> ...
> A3.5.3 Atomicity in the ARM architecture
> ...
> In an implementation that includes the Large Physical Address Extension, LDRD, and STRD accesses to 64-bit aligned
> locations are 64-bit single-copy atomic as seen by translation table walks and accesses to translation tables.
> Note
> The Large Physical Address Extension adds this requirement to avoid the need for complex measures to avoid
> atomicity issues when changing translation table entries, without creating a requirement that all locations in the
> memory system are 64-bit single-copy atomic.

Thanks. Now, please locate where the need for the updates to the page
tables needs to be done atomically, bearing in mind that we program
SCTLR.AFE=1 and SCTLR.HA=0, meaning the hardware won't write-back to
the page tables to e.g. update the access flag.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

