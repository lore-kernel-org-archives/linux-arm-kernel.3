Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E40FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKlCwnC1o/EsQJXgTVKErzcwCWplYEn9J1JE2wClLKo=; b=O6ebV0RjzgOvYS8kRoMeXQX83b
	yO60IahhxkelDBXmfuIKqurcfpIEeTtn9pn7qfCn2DbL3sZ9c51cEY4fFK9qOtIndctjFdbTS2VGq
	hrhnAFX1UbfocFyHMzAko7en+3mtkTMCltvelsoIrV8UOrcRXeZTGzQm9B3cuuQH2H3T22AE7W+xv
	BXm9Y8SVZALYK2YSxFx8tuL6pIrRlC1sMcXNSKivgg8fOznufsxKzG2p1yTjlWXyQ+T6QRKeaZrsl
	V/A32Mbu49BjWnq9H18n9HvExsr7sw58b8doTbqY5zQqtL04DWyd+ugH9CFXyY9lZ9nRqwTX+jrRP
	JoCZQT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lmJ-00000005TlE-1DC9;
	Thu, 09 Oct 2025 08:13:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lmG-00000005Tk0-0ysI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 282BA176A;
	Thu,  9 Oct 2025 01:13:23 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3F8D3F738;
	Thu,  9 Oct 2025 01:13:28 -0700 (PDT)
Date: Thu, 9 Oct 2025 09:13:25 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <lpieralisi@kernel.org>, <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 2/3] firmware: smccc: LFA: refactor, add device node
 support
Message-ID: <20251009-calculating-glorious-oriole-ceccf6@sudeepholla>
References: <20251008190907.181412-1-vvidwans@nvidia.com>
 <20251008190907.181412-3-vvidwans@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008190907.181412-3-vvidwans@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_011332_313591_CF736909 
X-CRM114-Status: GOOD (  11.06  )
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

On Wed, Oct 08, 2025 at 07:09:06PM +0000, Vedashree Vidwans wrote:
> - Add support for LFA device node in the kernel driver. Implement
> probe() to register LFA interrupt and threaded interrupt service
> function.
> - CPUs will be rendezvoused during activation.
> - On IRQ, driver will query FW components then triggers activation of
> capable and pending components.
> - Mutex synchronization is implemented to avoid concurrent LFA updates
> through interrupt and sysfs interfaces.
> - Refactor LFA CANCEL logic into independent lfa_cancel() function.
> - Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeouts.
> 
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 299 ++++++++++++++++++++++++++++----

I was expecting to the devicetree binding based on $subject but no.
So this patch can't be reviewed without one.

-- 
Regards,
Sudeep

