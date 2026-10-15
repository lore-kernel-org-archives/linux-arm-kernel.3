Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A345CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCEsfOaskLm09h+crM61HD8iE+zY0qtj353GUmfqrds=; b=rnxrNMXb8Votgb4+phXRYbb5tR
	H3FUnu/QN//NDrtUbJYAPxDX3MD/73dmnua9i84XbY6EbWAG/lHsDY/qGuZVUyhjywnU83K6VV7Yq
	lgiT1k9s1zE8WDQtXJY3SV2Nmaca/M4yjKaj5JP00jyIC+SLSPQbx40K5egUKFOaBRDk9gcN/cfW+
	3oCkJpwSBMIy21PdYhQEtb/53EyQa7YbyNmsPMpo0dUn+yHxLNCcrqqkNB3M84mX7Eu8yfgROlleI
	rgrWMFRR/EOF5s6hFcfyRMe//xv2uACjq2F1C/izz3z7hNb9+ihrmoSgEEztMpxTbB4bIoAGRvVEK
	oNhQCJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSmc-00000001Q3v-3m8I;
	Thu, 15 Oct 2026 21:14:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSmb-00000001Q3k-21as
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 21:14:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D94160A57;
	Thu, 15 Oct 2026 21:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884721F000C4;
	Thu, 15 Oct 2026 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792098875;
	bh=rCEsfOaskLm09h+crM61HD8iE+zY0qtj353GUmfqrds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TBhg7Zn4LHu9G0JutQ6EATN+TgN27smASVTtMKii7DevH5jAL6aGEIlQj57y4Dgdt
	 wx32B4+OOmGEYLNJEeTxmxGpAv8Qgry8Ogucebd6PxOGsPP78DQMIjKdweVTKOcsXy
	 BoIvLNF8MoiG4R+zZMPIS8XEdS01/owe3hjRi1onDVlsa/meN4xXPpz0okayQp4LrC
	 buLiPNglLH6ivJO6EOCcn5Pahy0ljq5g3iPHwbHwc9GV0Tsgjjmy9qI/uGgyWc2NRj
	 t6PKUwsBwB9mPSevi6t8gPwX9yFCHfoaOaqdbiPwHKpq90zt+d51RReSIbZNBNwqVj
	 GseAZdmi233Pg==
From: Thomas Gleixner <tglx@kernel.org>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Ben Horgan
 <ben.horgan@arm.com>, =?utf-8?Q?=C8=98tefania?= Ion <stefion@google.com>,
 Catalin Marinas
 <catalin.marinas@arm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
 Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Tarun Sahu <tarunsahu@google.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra
 <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 02/23] cpu/hotplug: Avoid trying to bring up CPUs
 that are already online
In-Reply-To: <20261009100738.31288-3-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-3-will@kernel.org>
Date: Thu, 15 Oct 2026 23:14:31 +0200
Message-ID: <874iemekeg.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Oct 09 2026 at 11:07, Will Deacon wrote:
> There's little point trying to bring up a CPU that is already online.
> Although _cpu_up() handles this case by doing nothing (because the
> target state has already been reached), it's wasted effort when we can
> easily elide the call to cpu_up() in the first place.

s/we can ../the call can be .../

> Check that the target CPU isn't already online before invoking cpu_up()
> from cpuhp_bringup_mask().

Confused.

cpuhp_bringup_mask() is only invoked from bringup_nonboot_cpus() during
init. So there is only _ONE_ CPU which can be online and in the present
mask, i.e. the boot CPU, right? Any other CPU than that being online
would be a bug, no?

Can you spell that out please and add a comment to that effect?

I'm not opposed to the change per se, but I doubt that the "win" is
actually measurable as you trade that one pointless call against a
conditional which has to be executed NR_CPUS times, where NR_CPUS-1
times the conditinal is pointless. There is ZERO contention at that
point, so what's the actual benefit?

Thanks,

        tglx

