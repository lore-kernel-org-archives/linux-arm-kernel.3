Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E04FC3ABDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkuPJ0Hv6+4JTlfXbRq/8OKOzoi0b3AbO4Vms2fKsE0=; b=CA2ozV3PbEY+NuoLiQDvppGIeN
	ROD0/IDcagARClO7AmnvlxjJA+Y/0RxcjrG40w92x4plvFzukol5UL1nS62fN9mCDXVklx56ZGFX2
	5DUX8aV/m/p8yqbkUImKk9V1EIl4PglMFrB04T4P1tpqwJCgGXBjRhpbsR3BDeokk+5cQxKL33peh
	CLKgjO9z60yKO3RhCkuMwViBYgoKa1hIRzUAo5GsjMFGtF1y6lmiyS6ilj0h9PspRaGsmXdPTNyrs
	iIOvsQizLA+YJeD7clFPYayJB7GqxupuJc06Rjx+w/CMoh4y1EYtaDAB3tzlGnpnOW9//cUI5sQW5
	AfbUgyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCZ2-0000000FJEP-18PM;
	Wed, 14 May 2025 13:54:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBW1-0000000F7pH-28l3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 12:47:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B800A150C;
	Wed, 14 May 2025 05:47:04 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C9653F673;
	Wed, 14 May 2025 05:47:15 -0700 (PDT)
Date: Wed, 14 May 2025 13:47:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250514124710.GA389636@e132581.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
 <20250513170622.3071637-4-yeoreum.yun@arm.com>
 <20250514093019.GE26114@e132581.arm.com>
 <aCR4x/+Wp8JoqG9P@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCR4x/+Wp8JoqG9P@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_054717_589906_5823F426 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Levi,

On Wed, May 14, 2025 at 12:04:39PM +0100, Yeoreum Yun wrote:

[...]


> > > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc)
> >
> > I would like to change the return type to int, so the error is handled
> > within the function.  As a result, the caller _cscfg_activate_config()
> > does not need to explicitly return an error value.
> 
> I think it's not good since cscfg_config_desc_get() failed only when
> try_module_get() failed and its return type is "bool".

Understood.  I thought it would be easier for later maintenance if we
encapsulate error handling in the function, but I don't have strong
opinion.  It is fine for me to return bool type.

Thanks,
Leo

