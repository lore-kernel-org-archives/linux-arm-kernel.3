Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58415CFC283
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILc8yh6YOOoFIzJ+tZjqghixKaKMpYM5qDbQunnGNNk=; b=yienyhfzfvEwDtpo+Mw6V7Lz0A
	VP2n9FKcc+MGkz7u5VDgGwCgD+GUb05wgbgAK4/YHVNcKpAnoB8lgdElY3ekTd4KV8SUi6u9liKep
	tq3tKPh1oA9CDiXak9l3DPOrhCOaa/vcisUKU1s4ng6xH77DNf+LnEj1llVL5EMddS+IPgimzlv4j
	x0UpLwzdlbrwDanIHoF5yh99wy3bNHwj2kSVIqKCathGhEIVZZvqbg3+eYUascdzbefugmePnw0+M
	Qe3B/1tYKgmpMBZNTY7e/9GYisID6FNJoMU5pbOtWsT0BL/NufB8PUT7dUBlvcAy9AOgrIWFLeNJc
	w3cVDkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSgg-00000008ZCP-25M7;
	Fri, 21 Nov 2025 15:04:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSge-00000008ZBv-0aGI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ILc8yh6YOOoFIzJ+tZjqghixKaKMpYM5qDbQunnGNNk=; b=obfBwo5jzkTt9G6By8vNaSFZFt
	P1PSmSQ8oCgFqETqveCGTfTauQH5saDlc4OQ7uVnNzt37lIcoeEmtdt2ugTpxmyEeeuDpxB2kXrlu
	fu04ZLnQDLjI6G7YaxRalG3ki8i4Lwa3PkmuTPDKXBsiplhizK9AfznXhD6yWPAkKx9boNjPtA316
	G078MyRz+NyuifMwChhHGqSXwLpJsgRS/wD9In3uXrFVAQMQYHFAxYakdD45wSMxQLokGcLmBhbCw
	DJMdwelE+5ikf9Niru6qA5oHtzWX55y/YXb3tkPJyNa+lTb1X0jxfNQxH+zns36FziZJZrr5LJpMp
	iIgnqCmQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35276)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vMSgL-000000007hO-1G93;
	Fri, 21 Nov 2025 15:04:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vMSgI-000000005Qn-0VDD;
	Fri, 21 Nov 2025 15:04:14 +0000
Date: Fri, 21 Nov 2025 15:04:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] ARM: make register_current_timer_delay()
 accessible after init
Message-ID: <aSB_bUbfjenD1fjZ@shell.armlinux.org.uk>
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <20251120184242.1625820-2-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120184242.1625820-2-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_070436_210417_38D8B424 
X-CRM114-Status: GOOD (  12.95  )
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

On Thu, Nov 20, 2025 at 06:42:29PM +0000, Will McVicker wrote:
> The function register_current_timer_delay() is called from the
> exynos_mct clocksource driver at probe time. In the event that the
> exynos_mct driver is probed deferred or the platform manually unbinds
> and rebinds the driver we need this function available. So drop the
> __init tag.

First question. Why.

Second, have you analysed the code to check that you _can_ call this
after init time?

Let's look at the code:

        if (!delay_calibrated && (!delay_res || (res < delay_res))) {
        } else {
                pr_info("Ignoring duplicate/late registration of read_current_ti
mer delay\n");
        }

So, if delay_calibrated is set, then this will fail. When is that set?
It's set by calibrate_delay_is_known() and calibration_delay_done().
When are these called? Basically after calibrate_delay() has finished.
When is calibrate_delay() called? It's called by start_kernel(), while
the init sections are still present.

So, calling this _after_ the init sections has been freed will result
in the above pr_info() printed and this function doing *nothing*.
So it's utterly pointless to call if the init sections have been freed.

Please find a different solution.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

