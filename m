Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F15CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3CyP6bumUd+D8iOczfm5+884GmGnnwhG0Qdoxeuly4=; b=otTMWtFA+R46Fu42+8uDByQ37O
	yX6Z7A6XFysOOEZv7u8bBUorjgX/ruYFtQf3mIqMnTiiEq1s1wQfFYu3UL2LTVdPk5pOjTvgYzNvi
	GToUYXDRZo57RI5BvJ1piysiHXEIfEzyhyQz10IM6ZDopiB0lwzOJqjKIQO2ymBNp6szANn/erC2B
	ndRcYvhKtART6iWZnN6KDxiL/Oh0RxDzxEu44W3nvLgf2vedqp7v03MBKO4yr3vQQ2L7Z5XZJ3ajF
	yqWT8rC+Pdlv8jwl9OrBHIa1hf9MSGWbKk/xoA1QYf4Z1/xY0xUXgMczLvCw3Ki7gG+ePe+BRzg/V
	sUe96WPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxjh-0000000FOjs-0WZJ;
	Wed, 14 Oct 2026 12:05:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxjg-0000000FOjP-1QYg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:05:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C1F05600DA;
	Wed, 14 Oct 2026 12:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42C91F000FF;
	Wed, 14 Oct 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791979531;
	bh=l3CyP6bumUd+D8iOczfm5+884GmGnnwhG0Qdoxeuly4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INvyDbEa9+m4JQN5I3onIIUR1JZdRzUwHnkegHqxYhI7XoO+yiOFOD63um0yVj00T
	 +nhEsQg4JWQ1Sb3NgMhBZRmRlBGILXERpnuj0WXPRgz+TRCSGiq4Zsig7iWxjNYgEZ
	 F/blt2tWfCQqhltr12FM4lq3VEe+1cTd4yD5cNhp3Irinkkf1ocY2uV7z/WnLFBNtZ
	 HQH7ZqekWIoMHsdTRETNLmJZNBzeIPhQNPWVujn3QN+f8jmRJTwBm8FgmXEU1DPVNm
	 FwA3m26nDE9MPQlwUBOknpv2XyzL4inWVuvtGevWs4riCXNcetjHbTsdVXVYTOAZVm
	 g3BJ3Y291x8pA==
Date: Wed, 14 Oct 2026 13:05:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, kvmarm@lists.linux.dev,
	maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
Message-ID: <20261014-victorious-prompt-kelpie-cf3a87@sudeepholla>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-3-suzuki.poulose@arm.com>
 <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
 <8be050e3-8af1-4f04-902f-9bc01b209dd0@arm.com>
 <3fbd4739-a4eb-4428-95ae-ead22e7cf9f2@redhat.com>
 <799fb810-c33e-4d0e-9a70-7092c0a681ff@arm.com>
 <0ceda99f-0352-474b-a30a-c5e79b817c2d@redhat.com>
 <ade8dd16-4f09-47d0-a821-636ca4c62565@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ade8dd16-4f09-47d0-a821-636ca4c62565@arm.com>
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

On Wed, Oct 14, 2026 at 12:06:54PM +0100, Suzuki K Poulose wrote:

[...]

> 
> Then it is RMM's problem if it doesn't check that the right level of
> SMCCC version is not implemented by the EL3. Also, where do we stop
> the checks ? e.g., We need SMCCC >= v1.3, when SVE is supported.
> And >= v1.4 if SME is supported. Shouldn't we leave this to the RMM
> to verify on init and fail the init ? I can raise this with the
> tf-RMM team.

Fair enough for v1.3+/SME/SVE checks, but RMI interface relying on more
that 8 input registers for one or more of it's interfaces (e.g.
RSI_ATTESTATION_TOKEN_INIT, RSI_MEASUREMENT_EXTEND, ...etc) indicate
it can't work with SMCCC v1.1 or below
.
So IMO check for v1.2+ is completely justified here.

-- 
Regards,
Sudeep

