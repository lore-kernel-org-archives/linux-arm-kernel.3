Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8700C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np3uJpSPh3jVjXFrxqf37uxel0KpTGeFEubgeIDCp/s=; b=okplQoPMCu6uYlpBTOp6r9PkFw
	tYZshgd5nfWSrfmjMRPU9cwojBEEUy66SN+LqliU3pnKOW7Btjvc5PlKnrZv7iM2F47DX94BWPUb9
	idjPnfTpMTAWGqufOG4+yHPdSLQzvDC9D6VlDc7iVF7QbCOyfOLcYi5GiHKFpsdfTZXiZ3jxGtvlI
	xVheh085Fs0Vd8cLQOg+OxurDLgKMqoSRtPsWVEs5qg+f50IkDplQa67bhlScRUFdv0RIb7dJzNBM
	KSpwkR6Gfn4j7lYy0rxjsGiXTKzDIXJnGwX4pjmGJc4rtEIM2COiobUBDykIyCffGEvP8OI/FSAar
	uyofN5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfrZ-0000000FneK-30Sw;
	Wed, 07 May 2025 14:35:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfFi-0000000Ff19-1qat
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:56:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6BAE339;
	Wed,  7 May 2025 06:55:51 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 934713F5A1;
	Wed,  7 May 2025 06:56:00 -0700 (PDT)
Date: Wed, 7 May 2025 14:55:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] cpuidle: psci: Avoid initializing faux device if no DT
 idle states are present
Message-ID: <20250507-crouching-lovely-wrasse-f85e90@sudeepholla>
References: <20250502140119.2578909-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502140119.2578909-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_065602_532588_60B91715 
X-CRM114-Status: GOOD (  16.82  )
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

Hi Rafael,

On Fri, May 02, 2025 at 03:01:19PM +0100, Sudeep Holla wrote:
> Commit af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
> transitioned the PSCI cpuidle driver from using a platform device to the
> faux device framework. However, unlike platform devices, the faux device
> infrastructure logs an error when the probe function fails, even if the
> failure is intentional or expected.
> 
> To prevent unnecessary error logs, we can skip creating the faux device
> entirely if there are no PSCI idle states defined in the device tree.
> Introduce a check for DT idle states during initialization and avoid
> setting up the device if none are found.
> 
> This ensures cleaner logs and avoids misleading probe failure messages
> when PSCI idle support is intentionally not described in DT.
>

As you pointed out in another similar fix that exist only in the linux-next,
I have also missed to point out that fact here. This is only present in
the next. Let me know if you want me to drop the commit hash reference
and repost it with -next prefix which I generally do and somehow clearly
missed here. Sorry for that.

-- 
Regards,
Sudeep

