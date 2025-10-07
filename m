Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FC0CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 19:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGuyQHKKKk5kaFnYuhxhE4b42paZhXgBeZT5hWvt874=; b=O4wuMPbgNlAAVM/spjac0sYvO+
	iEuXYsxGbXIPOyKZxoyTT0bRJY0YxWrMaRedqs+TAkc6uuk48CCdxc6x2UbacN7rokCStg6oFxVCc
	SYH2qasNqy0Vmwr4pbkD6niWwiL3MG7WymWNHgXpUvK7pkR6Yzg2OgVRAlc3ydKjiEvtwfNy13dBh
	9tDqQGgIMcyK09eBkLecsnKlCFyl9CaVk9hkTXrGv7Xx2778QMmZI8jesBD0zC3Icy03WijxmMzwi
	b740Be9/RIKHsMWIIGq4HIqie3AI/ze1g/X+YW1ou37SjGeDbj3fICyYjkUdHW2rp7d7HGqSy/nZj
	/OEtQyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DJS-00000002fva-0mho;
	Tue, 07 Oct 2025 19:25:30 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DJP-00000002fuM-37Yo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 19:25:29 +0000
Date: Tue, 7 Oct 2025 11:31:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759865122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MGuyQHKKKk5kaFnYuhxhE4b42paZhXgBeZT5hWvt874=;
	b=aB2uGtQixcZ8bSr2I9L34mScrQ9EMhFP/TKRKR2UDidJ2WNbGf16h1lI1ROwOwjItLfQyF
	A+3iMUiL6K6ryXgFbkzh7Akpe1haY8MYhH3afkhXVf9KxXv0rw1jqPFcKtAIEev+/X02z5
	STF0zp5wF586aMzKids38/SPamJVS4Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing
 PMSCR_EL1 in VHE
Message-ID: <aOVckTSJET5ORY1n@linux.dev>
References: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_122528_411258_54710CBE 
X-CRM114-Status: GOOD (  12.75  )
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

Hi Mukesh,

I find it a bit odd to refer to cpu_has_spe() in the shortlog, which
doesn't exist prior to this patch.

On Tue, Oct 07, 2025 at 11:53:56PM +0530, Mukesh Ojha wrote:
> commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
> initializes PMSCR_EL1 to 0 which is making the boot up stuck when KVM
> runs in VHE mode and reverting the change is fixing the issue.
> 
> [    2.967447] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    2.974061] PCI: CLS 0 bytes, default 64
> [    2.978171] Unpacking initramfs...
> [    2.982889] kvm [1]: nv: 568 coarse grained trap handlers
> [    2.988573] kvm [1]: IPA Size Limit: 40 bits
> 
> Lets guard the change with cpu_has_spe() check so that it only affects
> the cpu which has SPE feature supported.

This could benefit from being spelled out a bit more. In both cases we
check for the presence of FEAT_SPE, however I believe the issue you
observe is EL3 hasn't delegated ownership of the Profiling Buffer to
Non-secure nor does it reinject an UNDEF in response to the sysreg trap.

I agree that the change is correct but the rationale needs to be clear.

Thanks,
Oliver

