Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D481C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amGf2Z1GlQqMwS13yoleAlaWUexdFZt9JM605VX2E30=; b=guNEof/HiArFeqQohCWvPIzD72
	GC0BTd0wULIKtBKVBQk0hmpObt5aznhQeK/exxkKa+swCCXbvLcsWt5ldxlV/N9B4mx5QsL4HkGs0
	QEFWCm+URrs8T7Vey4j+br9LKAmziiDeZ9mmIc2y0l66Ihrzww5hMFl93iGIY9vRe7BenVSIIytTf
	8zZ9q2m3V5ffBcNDR5pkJ+HO2duvIePb3ZE3OG5zIDkomuETdv0chhrflXox+bJNClz8OmMwMWDo4
	IL/pYwbk7MuDB13v11msDFUXGkZMW+u2s5JXwkCp1F6I/zAsMb26zzekSsTFb20vdnzehLWwTz4b8
	RDzlTB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGiBB-00000007N4a-06mg;
	Sun, 18 May 2025 17:52:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGi9A-00000007Men-3BR9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 17:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=amGf2Z1GlQqMwS13yoleAlaWUexdFZt9JM605VX2E30=; b=hPsmIGSP9Ijv9K/UHy6TN+brXM
	Uuu4tGn1M9UtUlg+j/J/oRRJtoqKXZPyBqSvlWKDm3UO3q1w7ZQ9gllhpGp9urEr6MK+k3WkZTDdu
	4LlnRDzEumH60GgQa3ROgM/8LAQl/0UeNUSq0M+5FGCq74IQGuEhcPHZUXxJXCA3ZSLTuubMpV07W
	tpiYWiuL0dvxkVSh7LUpmLW3BimwVSkMt4NpoWvT1Aeonzq2GQXRNnXskt87WJ34S7ikP9PoDFEGC
	ZrdMJdLKVZHyLaPQsZpfZ5p0OAvQOsRIWHRCZ/5MPtF6IXXEusjruj5ZeExjGeVZV3q7qRGpzaJLP
	St5AjwUQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52004)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uGi73-0004aD-20;
	Sun, 18 May 2025 18:47:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uGi6z-00013l-1v;
	Sun, 18 May 2025 18:47:45 +0100
Date: Sun, 18 May 2025 18:47:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
Message-ID: <aCodQZoA5KI9WyLB@shell.armlinux.org.uk>
References: <20250518164118.3859567-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518164118.3859567-1-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_105000_799256_7720C5F1 
X-CRM114-Status: GOOD (  11.78  )
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

On Sun, May 18, 2025 at 09:41:18AM -0700, Guenter Roeck wrote:
> Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
> syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
> which in turn calls of_syscon_register. This function allocates memory.
> Since the memory management code has not been initialized at that time,
> the call always fails. It either returns -ENOMEM or crashes as follows.

Yet I see no thought whether having the scheduler see sched_clock()
suddenly change is a good idea or not. The point of the initialisation
being early is to avoid a jump in the scheduler clock.

So, was the commit you're trying to fix a good idea after all?

That question at least needs to be considered, rather than just moving
stuff like this later.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

