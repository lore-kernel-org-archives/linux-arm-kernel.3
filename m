Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B1FD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL6aFzxtHJJD4l9olu6D9vQpPHR6wEhfz/ueL4TuW0o=; b=3xYpGsEI58hsqGBO9uBgI2iV8h
	e23JGA/rjcNk7AgWdsuk2SdiP8/C/7C/wytOwL+lXxXY0ozMA2ZxN0YMQ2P+7HqlKcSUDyce2RRKE
	zXh+Tp8UZt5KAAfqJRPKzJbkC/vArsn6onExB/T/wOhXKskGG3dtNP8MQc5/140YhqG95Jiy4Cipo
	oTCy0EyYjTQ35M7RmIKmfkIoC4jiZVHEbla323SmoO2zAcZzPZsihwpVxpVcUA4Jtz/kGXgMcKL9P
	DjIzhy+zkjcgAfGz1dVwJCkF61m9Ae7KLo1uoKKEVcU5BUFEM6A3+XHROm5DUMAEeEfBFSlCBw9HL
	X4/Cx7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStZD-0000000E1NV-24kc;
	Tue, 09 Dec 2025 08:59:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStZB-0000000E1N9-1xbQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 08:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xL6aFzxtHJJD4l9olu6D9vQpPHR6wEhfz/ueL4TuW0o=; b=d2V5ijyvHTEXh9iy7IDX/IhsKf
	sHJ/TQ2d5DD4a6sClE+POKOCVK0KaaywKvDmVRGwkSZC7+Hap2nl5U0T8nwH+sllgGhflpKkZ2IAk
	v0wOaBHeRMvz24/ApJwLB6h46C6xG8HDAy8sj0VGhL/2alF/prIwatGelIdZ+ZzG1OfNVQr5qUQzK
	KazaqvqGiiPfkzZsMdr5gvorpS9vUx8+oQ6Awg/tO5j0foLtF76tmLM1P0gI/K/0oyBm0q2uaLkxY
	TnxxHqX+zzYY9UpVgP3vO/Dp5kWAtOK9md57FPnEPDtQ+6JxWIM/aFLgXzH+TjVUjBlG+eNT4xMMg
	xVtbRDHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46220)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vStZ8-000000000DD-0zWW;
	Tue, 09 Dec 2025 08:59:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vStZ6-000000005sb-30JY;
	Tue, 09 Dec 2025 08:59:24 +0000
Date: Tue, 9 Dec 2025 08:59:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk, will@kernel.org
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Message-ID: <aTfk7Am4pg1tTeYZ@shell.armlinux.org.uk>
References: <aTcBHKFDBkSEp5mi@shell.armlinux.org.uk>
 <20251209085627.64057-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209085627.64057-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_005929_502448_865AFDFB 
X-CRM114-Status: GOOD (  10.65  )
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

On Tue, Dec 09, 2025 at 04:56:27PM +0800, Xie Yuanbin wrote:
> Hi, Russell!
> 
> TL; DR:
> patch1 and patch2 with compilation error fixed:
> 
> Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> 
> patch3:
> The simple test case passed, but the syzkaller test (the original
> scenario that triggered the branch predictor issue) is still running.
> The syzkaller test is better to run for a day.
> 
> All patches with compilation error fixed:
> 
> Reviewed-by: Xie Yuanbin <xieyuanbin1@huawei.com>

To avoid any confusion, does this include my preferred fix that I sent
or your change?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

