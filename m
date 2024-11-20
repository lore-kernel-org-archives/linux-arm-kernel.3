Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274E6D44171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIPpHPyISSClh/FBZwmso93xc+iFIzjr1637smd/Ql4=; b=i9dsWB0eghDjVRoXTtd6o62coD
	fvO7A97lEerBFJ07s2AHw4TX0ZgYtNuEYc7TfTsWS8IOdacRJ+FDN4OC5kYr6uus/wtlRH5HniD4V
	9Pvgv/39hzx/6LHDOtWzGtWp/KI3pLcorPS3PLOFjnYN8/kwahACl21Sfh786EgzNYOrqemdwWRLR
	OX2NHueNaRP138B6V8E0h0Yeqcqkqs9HTZe2tzT6zXKxzwOxTAA2+iLMG0qsvbpO+EIHrwghCF2Me
	JRPaopWthiWUbLabCAd9+iaLv8JuVDSh43mtJFfGwLeJbjz+e4Ax2EQb4h7m3EG7UURUtdfNXH08+
	l9RlwV0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgqN-0000000EthE-2vxP;
	Wed, 20 Nov 2024 09:17:51 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgpP-0000000EtRB-3iMW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:16:54 +0000
Date: Wed, 20 Nov 2024 09:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732094207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tIPpHPyISSClh/FBZwmso93xc+iFIzjr1637smd/Ql4=;
	b=NdSDYVLo6jjFxxrU7eb0XWXnCtK1025ElAvHSIpqwMkW71rEgmMBcZQILLQbrZArKj8jWD
	Ma93bd5EkBt7gr8nidj01Fxi3y5FuF0YfUwpl1wDGlZuBQgyBbo/bXUzSMEm56m55bf4b6
	lsDi8Wuao9RAS6KSmCz/Wo3gC/ICw3M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Clark <james.clark@linaro.org>
Cc: suzuki.poulose@arm.com, coresight@lists.linaro.org,
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Fuad Tabba <tabba@google.com>, James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/12] KVM: arm64: arm_spe: Give SPE enabled state to
 KVM
Message-ID: <Zz2o9XryCezwAf61@linux.dev>
References: <20241112103717.589952-1-james.clark@linaro.org>
 <20241112103717.589952-8-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112103717.589952-8-james.clark@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_011652_690725_101B8D0C 
X-CRM114-Status: GOOD (  12.38  )
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

Hi James,

On Tue, Nov 12, 2024 at 10:37:06AM +0000, James Clark wrote:
> Currently in nVHE, KVM has to check if SPE is enabled on every guest
> switch even if it was never used. Because it's a debug feature and is
> more likely to not be used than used, give KVM the SPE buffer status to
> allow a much simpler and faster do-nothing path in the hyp.
> 
> This is always called with preemption disabled except for probe/hotplug
> which gets wrapped with preempt_disable().

Unless the performance penalty of checking if SPE is measurably bad, I'd
rather we keep things as-is.

Folks that want to go fast are probably using VHE to begin with. As you
note below, we need the hypervisor to decide if SPE is enabled based on
hardware in protected mode anyway. Using a common flow for protected and
non-protected configs keeps complexity down and increases the likelihood
SPE save/restore code actually gets tested.

-- 
Thanks,
Oliver

