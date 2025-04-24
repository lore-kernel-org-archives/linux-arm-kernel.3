Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488D9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYE59RG6h1dz+xHWzTPndkPIHqW40lrFFC645fhilsM=; b=uYppIbCInfFYQhVTSgXJizaIgt
	tZZ9PzZQdsHM4ucffYSktkKPch6tELHYvUuXAYethw5gAqPWE0st0u2WB3c5xd2GeBj58QyMmbZcI
	nPtYfbCmEO/8MkE7lU1TPkl0AFpJF7EHDtzecTiALuvckYXRXd7NNbCh7ZlxgGVWaWaE0SR/c2g+y
	bypbPVDI+cKIsG0XJ5pT+kAib0Gt8JrvBBiluIt6Kfse7QLIHNLn92JLPJcE74E/T6/h2Q32kh28C
	Y+7vfyNuAo5qTKVTFPmW/MObGH4JUbj6YUoNH7hhG6IjS8l3iPwQIWkgyjzZggb8T9xIvxtScIFXn
	oHZnZVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x6v-0000000EIko-1btc;
	Thu, 24 Apr 2025 13:59:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wyX-0000000EGKP-2sVM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 13:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yYE59RG6h1dz+xHWzTPndkPIHqW40lrFFC645fhilsM=; b=QttjivnLlZ8ryLKbSDJfVV00EE
	XrAHVD/03J7SFPymkMNN07SkzHFCLyczU2snv3AjxzJFcPk3Xdn7YIMew3blNgy2iWIZkMkjHIpMm
	LAYx1bjMyftAKL+hzz1RnsFdm+6JpIT/rTHahGFHUmVAiodVAnmzBinPGZGfm7kJ1pZDgOV/oO6+Z
	AghKm1zQ0SsbED5ps3xI9xhAzu0Wi2VksPTLX0KETVIvxv4jJ6OqxboJJ/fvHzEr4VF0ajgM4M04L
	8FxAGI6/xFpeFipy1z0Ep+/l+NSPaVbcKUg4nAp1hXvd4xYvOfQBNHV/2KNC0es7729/8crTBYil8
	DKi5OG4g==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7wyU-0000000BoJr-2n6j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 13:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yYE59RG6h1dz+xHWzTPndkPIHqW40lrFFC645fhilsM=; b=fdF5Wwc19OSz6aXfb2+T14UAta
	C4QJmYcmuk++XrD7rFghRjMniqwZPyktTiqcEdz3qQJIspqTm6txOFqO1X+DxcGqMPWBU9dVJkmkY
	S7EGwgKk49PxlgvBd0kbrSuMVGY4b0expvKT7m7RBOOc7tG4K7QTYSVGN6iuKHDt2c8W0pIzOc2J7
	DYBYqbTD3HkB7gnsEweCkntOaS2q0jzjj1dBs/VpXcFgKwU0jKp3FlDJfdn3lHmohWbLc9CZ03sSL
	OhwP1WJMnrSNp4O82vUeEJqYy+HsIA0NPlSz77V5sTtvv6nzqO1CxzX0NhDTBEQdCyUXlVqzPv+8I
	zlzD2hUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33758)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7wyH-0007SR-16;
	Thu, 24 Apr 2025 14:50:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7wyF-00019J-0R;
	Thu, 24 Apr 2025 14:50:31 +0100
Date: Thu, 24 Apr 2025 14:50:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: xieyuanbin1 <xieyuanbin1@huawei.com>
Cc: liaohua4@huawei.com, lincheng8@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nixiaoming@huawei.com, sfr@canb.auug.org.au, wangbing6@huawei.com,
	wangfangpeng1@huawei.com, will@kernel.org
Subject: Re: [PATCH] ARM: spectre-v2: fix unstable cpu get
Message-ID: <aApBpnDcq2KNkfAs@shell.armlinux.org.uk>
References: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
 <20250424133133.40122-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424133133.40122-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_145046_861894_F8976C73 
X-CRM114-Status: GOOD (  12.55  )
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

On Thu, Apr 24, 2025 at 09:31:33PM +0800, xieyuanbin1 wrote:
> I've actually thought about a similar problem. In areas other than put_cpu/get_cpu, tasks may be scheduled to other CPUs, this cpu actually does not execute the spectre code. 

My point is that if harden_branch_predictor() has been called from a
context where we are preemptible, then we _could_ end up running on a
different CPU to the one that we need to take action.

Consider your test program running on CPU 1 which requires fixup. It
takes a fault, and before we enter harden_branch_predictor(), we end
up being migrated to CPU 0, but doesn't require a switch of the MM.
Let's say we then disable preemption and then call
harden_branch_predictor(), and then restore the preemption state.
The thread then gets migrated back to CPU 1. Again, no switch of
the MM.

At this point, the mitigation has been completely bypassed.

IMHO, better to be noisy about this event (and it is only a kernel
warning) than to be silent about it and let userspace get away with
bypassing the mitigation.

I don't care if this disrupts test tooling. The trade off between
test tooling having a problem and a silent data leak through this
channel... the answer is pretty obvious that the test tooling
failing is less important than having a silent data leak.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

