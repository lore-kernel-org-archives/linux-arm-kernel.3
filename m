Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC2DD32D8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n5VLsmzOI24b1EomeQm8lyJvyRT1EcvMNhEebs92VU=; b=3zvRvXKi/QfBswmZf5HP5OYeHS
	LDsJa748mjmG7JrCiGKU+mid3swRLEQVDzuKeiSu5Jy06qOatWYRBV+F5D0HU2TJLJuZTj9dYj6sg
	AG0Rv3bORr04FVZXnTNqj4XwqDxTJl3UdujriqYT4xSfBpxdeR8Od9sKHTGFdzp311nVAMedUH1p2
	5FHHXYcMfyVctM8VaOlDIgVfRaV8oEV7fKXQEnXDNN70vRnI25jDmAfLoWkBrJIDoYoV9kqzuHttg
	M5JAIf8kJzZtBHAbgRHRtNxrlum5EmIzd156OqX/G3hPhkMWVsz+9Z1d5CWb4YNJZY1oBixzLOBW6
	2D1Im95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoD6-000000033eE-2eVT;
	Tue, 12 Nov 2024 10:33:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo1k-000000031ZR-3SNz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6n5VLsmzOI24b1EomeQm8lyJvyRT1EcvMNhEebs92VU=; b=ZAafexqzja2IjZ9GSPdA2i2FTf
	nUrDGLcJ9FV/kI2tGwi7thm1sLcwju0czMRW5DxxTPwhHnl8X3QrvaOvVk6bmVz7nBDzUBiMUVwjA
	8YF74hq0z+GSe1fylsQ8wo0wMCRDiAj+aipLXMcWBx1m3HhtSyp8CjXRitDLtGBg/laZOUuAtaCH4
	gR6nG/dvsHxqu7SIqMI8SSyaUDM6T9AIqkuzSmxEgq2k52eJVk6XBADXn0190wdIeER5yaNk3lxrf
	/Eyx66NhWNiLv6zDScfPSa44km6dMixVXA1iTdKUMDXvEW8ciYfsvTpCA2CbyswCEVdGCg9xpWFzF
	9uRnBV5A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47234)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tAo1h-0003vR-2X;
	Tue, 12 Nov 2024 10:21:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tAo1g-0007OW-2P;
	Tue, 12 Nov 2024 10:21:36 +0000
Date: Tue, 12 Nov 2024 10:21:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <ZzMsMFNSHLOKEeEW@shell.armlinux.org.uk>
References: <20241111233817.2f824c19@foxbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241111233817.2f824c19@foxbook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_022140_883513_E692FFAA 
X-CRM114-Status: GOOD (  17.06  )
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

On Mon, Nov 11, 2024 at 11:38:17PM +0100, Michał Pecio wrote:
> Hi,
> So I guess it looks like there is a problem with this feature, perhaps
> a missing "permit user accesss" somewhere?

That's exactly the reason - user access needs to be enabled before
calling flush_icache_user_range() so that the cache operation
instructions don't fault. The patch below should fix this.

Please ensure that you copy me with ARM related bugs in future.

Thanks for finding the issue.

8<===
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] ARM: fix cacheflush with PAN

It seems that the cacheflush syscall got broken when PAN was
implemented. User access was not enabled around the cache maintenance
instructions, causing them to fault.

Fixes: a5e090acbf54 ("ARM: software-based priviledged-no-access support")
Reported-by: From: Michał Pecio <michal.pecio@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 54dcdcde3f77..6518771c1496 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -574,6 +574,7 @@ static int bad_syscall(int n, struct pt_regs *regs)
 static inline int
 __do_cache_op(unsigned long start, unsigned long end)
 {
+	unsigned int ua_flags;
 	int ret;
 
 	do {
@@ -582,7 +583,9 @@ __do_cache_op(unsigned long start, unsigned long end)
 		if (fatal_signal_pending(current))
 			return 0;
 
+		ua_flags = uaccess_save_and_enable();
 		ret = flush_icache_user_range(start, start + chunk);
+		uaccess_restore(ua_flags);
 		if (ret)
 			return ret;
 
-- 
2.30.2

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

