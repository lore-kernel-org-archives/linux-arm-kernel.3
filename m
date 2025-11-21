Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787EECFC28A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrMI9qC7qe1gsOZZ1prerqDmHlWyocs6JVdfMEZHxfs=; b=qT+DpFm+Vo97bgJdc0DQqmGm8s
	tWUy/JhiIFsc8XduqHFR5sHtolJQHljmmlkRl2990HQbJJ76RYpOoLMoNpLbkA6Y8b19SYRPrDuWd
	kT0qAgiLSQZgGQ9zp49C3ek0v+Nw/zywnraQ83Dh+6L9Nec7O2RMBA/d0rNfvv23cK4NFrwH6ggOT
	/z7+fy8yiSAg8bKxwu8qy2GZ3tYlPqil+oV/bd2nqOdEEe6lCimUHvjNsm92LGx6y/EFbPqAANeQr
	qWoY1/zLardle/pBPUBZ8m1VUdM4ZdGj6EvxV38rNcL9y1DZkp4PONTpNhO2NcyBo/Xi65ysOnurm
	pLhpr9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSnh-00000008aY7-45Yq;
	Fri, 21 Nov 2025 15:11:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSnf-00000008aXQ-3Agq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yrMI9qC7qe1gsOZZ1prerqDmHlWyocs6JVdfMEZHxfs=; b=anCz6EmOITiC5aK/Ur+2Vw+zhF
	LX+NdXsoXLsUlIpWSvHwMP7/r4y73U7yRNih5FxnuuGGBTjYwKQnw3C+Yaqj3v9fDKCmZ9PH5OYpi
	9vmiyb1FnBCfJC5WsGW7En8OkKpAC+YSSx2mgvzd4bJYj7Z/LZdOuXHEAyCZaNYFu5gcV9+W/jL6i
	EoTU72b6dXJrmfWCJP8HAEdy6OItTBbzsg8S3ISm8ucT1oQi6o0YSxw+rX6ZlYS+6s/rAyBOC8e6x
	RnsvJxbTam0Efa9hNrnFxDmmyLMigpXkaHjtw9Ux3H4PKs60X7rTJ658HHuGhqjbVHS7+2mnC0jdN
	ID58x1hg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52644)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vMSnV-000000007ip-03gv;
	Fri, 21 Nov 2025 15:11:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vMSnS-000000005Rs-0dMy;
	Fri, 21 Nov 2025 15:11:38 +0000
Date: Fri, 21 Nov 2025 15:11:37 +0000
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
Subject: Re: [PATCH v6 0/6] Add module support for Arm64 Exynos MCT driver
Message-ID: <aSCBKRpA4jSw1iuF@shell.armlinux.org.uk>
References: <20251120184242.1625820-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_071151_798469_25F26EC5 
X-CRM114-Status: GOOD (  14.35  )
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

On Thu, Nov 20, 2025 at 06:42:28PM +0000, Will McVicker wrote:
> This series adds support to build the Arm64 Exynos MCT driver as a module.

There are parts of this that are just totally incompatible with it
being a module. For example, you can't register a replacement udelay
loop after the system has booted.

This is the second time I've faced a patch series wanting to remove
__init anntations to call it from a module, where the author has
clearly not analysed the code to see whether that is a valid thing
to do. This is unfair on reviewers - it is the submitters
responsibility to check that what they are doing is valid.

Moreover, in _this_ case, you will have received a kernel diagnostic
message stating that the call to register_current_timer_delay()
was ignored, so I also question whether you bothered to run-time
test this change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

