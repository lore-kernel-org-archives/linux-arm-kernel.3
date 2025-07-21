Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2486AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juMHPylV/ft2onNGJovp+7ad+DtScgT74RaXXr6zUcA=; b=niD2xIQx4FFGKfuyv7bL6n7OWn
	hP7us+gjmQDK40t6u+IAbjlrPcz+poGuNjyZXJZpFg2bUZM6aPz1mxCCc06qrsP+YLcC77s4pzueD
	kAgKx9ifLayCDAhEJdfwIuAcIWt3CJ59Dq283xbNWQdXrGprrnpj8qQ3BZbMwmli5wff3BJ1meHZE
	b/tKHt/KSTzb1ibTUCR206H6lWBljiiH01H/Rzk9Ufz+C64vlxdDaXZBQ5A9bx7Xv7VAwmfWEHAhE
	+hpGPiqdBBGr6vQczEBCHVAvrfrPEXcwhKqHOA5gXcBLvg0GDqX85/gA0td14K7lMTLEEtY1CEFfZ
	SUngxrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsaz-0000000061v-1BWn;
	Mon, 21 Jul 2025 15:38:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqmw-0000000HPvH-0D4i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:42:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88F50153B;
	Mon, 21 Jul 2025 06:42:35 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F06D63F6A8;
	Mon, 21 Jul 2025 06:42:40 -0700 (PDT)
Date: Mon, 21 Jul 2025 14:42:38 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/10] coresight: Appropriately disable trace bus
 clocks
Message-ID: <20250721134238.GD3137075@e132581.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-5-0ce0009c38f8@arm.com>
 <807d7899-cab4-4449-aba4-645593b1db21@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807d7899-cab4-4449-aba4-645593b1db21@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_064242_125191_04E314B2 
X-CRM114-Status: GOOD (  20.96  )
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

On Mon, Jul 21, 2025 at 10:20:42AM +0100, Suzuki Kuruppassery Poulose wrote:
> On 27/06/2025 12:51, Leo Yan wrote:
> > Some CoreSight components have trace bus clocks 'atclk' and are enabled
> > using clk_prepare_enable().  These clocks are not disabled when modules
> > exit.
> > 
> > As atclk is optional, use devm_clk_get_optional_enabled() to manage it.
> > The benefit is the driver model layer can automatically disable and
> > release clocks.
> > 
> > Check the returned value with IS_ERR() to detect errors but leave the
> > NULL pointer case if the clock is not found.  And remove the error
> > handling codes which are no longer needed.
> > 
> > Fixes: d1839e687773 ("coresight: etm: retrieve and handle atclk")
> 
> I would drop this tag as I don't see what we are fixing ?

This patch changes the clock operations from:

    atclk = devm_clk_get(dev, "atclk");
    clk_prepare_enable(atclk);

to:

    atclk = devm_clk_get_optional_enabled(dev, "atclk");

The commit log mentions in the old approach, "clocks are not disabled
when modules exit." So the patch is not only a refactoring, it changes
to use devm_clk_get_optional_enabled() to register
clk_disable_unprepare() as a callback to disable clock when the device
is released.

BTW, I selected the commit "d1839e687773" as the Fixed tag as it is
the first commit that introduced the devm_clk_get() +
clk_prepare_enable().

> If there is indeed something, I would recommend:
>  - Call it out in the commit description.
>  - Move that as a separate patch, so that it can be
>    safely backported without touching all the other drivers.
> 
> If you agree with the above, I will drop the "Fixes" tag and
> can merge it.

Please let me know if anything I can follow up.

Thanks,
Leo

