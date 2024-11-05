Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B7D1CA15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 02:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01lhM/vlz+AbnV1jktW0QwJ5UbCCSnKIjy8Bbq1PH4c=; b=vltCeC0goB8hFX+OQOWlPNStjI
	HFfLxiUjE2EE3MC74smTN4j2PgP1tscvUSr4Pe3LgwtnZeUzx0TPkjvkUsp6tebNU4un8bCOq3cRU
	uBYL0nlr5zUoyHDLs7Ax3pkTPsbSvmqw/L0SlbKTEv1SaDyYY7BH21eAgYVF9RXldVKUJsynpR6yl
	UPSZMfm5Eqk4EwCuSNLrMUfsnvdEuAkJgofmhr2oux+vHunY9Qn3SNAYxndXVSMikPY5nhndZ6q7V
	CH5tGTPevcPu6N8ylAMp/qv6c0Df+cdI0CQW/l6agkv2rD5sU0II0sQ9/HwCZLVmAcxAW/Mc6JHpX
	YcIQ6rJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89C0-0000000FeHn-3TE0;
	Tue, 05 Nov 2024 02:21:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89AJ-0000000FdzV-0tgb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 02:19:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3518A41CC3;
	Tue,  5 Nov 2024 02:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEF3C4CECE;
	Tue,  5 Nov 2024 02:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730773169;
	bh=i6G8GnDsiZTal/kkKMwzZHQjeFYe+c86hf3Q7lJ2aY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FMRW/P58uN3mjJ8SrWdDP0mhFAfKK7zPrETFDHL/9n22NRSWbbkb54D9u7+HF4wk/
	 NnGBXCkXXHWsHcYTTnclYG3vSbzPZeck/T+vGPEyDKh48tE1Rtrrj+c1454rH6IVrc
	 esV5TZESlpDGbIZUf3ipGTbUjCD676m7dllKj20mPee64zmCQi5oUAPjQ1VXn/X47c
	 1Bm9TZcqR9Xii+7aZ97dLV18H/6CDvMC8YasuD9JVfUHVxTpUDPfxbpxr0EzihWMW8
	 hyZN2V6OMjt8fwZWs3kUFpSLIpIHvUwIdFtQoZy0UMYvDtr2hPu8mqyD+0A3dpzh/c
	 QYXLEeDMTTDSA==
Date: Mon, 4 Nov 2024 18:19:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>, Paolo Abeni <pabeni@redhat.com>, "Christopher S .
 Hall" <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>,
 John Stultz <jstultz@google.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier
 <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, qemu-devel
 <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next] ptp: Remove 'default y' for VMCLOCK PTP device
Message-ID: <20241104181927.05a9485a@kernel.org>
In-Reply-To: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
References: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_181931_352256_4B5ED4EC 
X-CRM114-Status: GOOD (  12.35  )
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

On Sat, 02 Nov 2024 16:52:17 -0500 David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The VMCLOCK device gives support for accurate timekeeping even across 
> live migration, unlike the KVM PTP clock. To help ensure that users can
> always use ptp_vmclock where it's available in preference to ptp_kvm,
> set it to 'default PTP_1588_CLOCK_VMCLOCK' instead of 'default y'.

Good enough for me, let's see if it's good enough for the main guy :)
Thanks!

