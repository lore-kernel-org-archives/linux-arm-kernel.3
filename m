Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9876BCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8kepTpznDWflU7mN4h6NwXrcDQmY4fhJ/6Rl906kmI=; b=4y9MJXUMUuWu1g2jky20A3gpKA
	sa4p6+4nZ2hjsXCdniyyyI+VAzzdEESKc0wMRhTF1kmU0UJ8a+oMJ5DtV+/DPIoxcmecbcY0uX++j
	TfKx0Xn6Mv64DXY4n53Smn2UxDy0u5Nm8AAwkTqaUbJFw3/smn8GHOF1DoYIqp27lSWgcNFzQau9n
	wIoxHynZIdA2C6jMQ84xXLqMOcK0LkOwImDSDyrIyiqEfmAyh9FVPe11iSLs/WsR2+ZSFTSZMVzWc
	mwKSzQsrC4kpU50RON/Khda1kcmajny2zuP4a4SIAtGV29sQMCX48P82KOAxunxgUckA9bnM/4CHZ
	jiaz2pIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb5S-0000000BR2g-2uQ7;
	Fri, 02 Oct 2026 11:05:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb5Q-0000000BR21-0sR9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:05:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C33882F;
	Fri,  2 Oct 2026 04:05:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDD4B3F85F;
	Fri,  2 Oct 2026 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790939154; bh=mGxeAZM+Ponxf7bCZvYiqPovJdLJZY0Gu2OJSveg5yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjtm30iC6/CPpL985bC1ofmm5brYJLUn0kVQO18G8RhH2Yh5XOrHs3SsdZSxVnIBr
	 Z/ZDfixwIcvnwqCiOApssi0HAtdlApZuOjb8i+fYedE9DrYrKTnkCguT5SitK9lTqa
	 twTPa+U5uMzBfeke9T34bxpoggTWrkDluMgnbhWw=
Date: Fri, 2 Oct 2026 12:05:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v22 09/10] firmware: arm_rmm: Add wrappers for Realm
 related RMI commands
Message-ID: <ar-QC4vtcULyJ5dW@arm.com>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-10-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002061507.1600269-10-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_040556_291972_9E51A0B7 
X-CRM114-Status: GOOD (  10.93  )
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

On Fri, Oct 02, 2026 at 07:15:05AM +0100, Suzuki K Poulose wrote:
> +/*
> + * rmi_smccc_invoke_once: Invoke the RMI call and return the results. Do not
> + * retry the command. Let the caller deal with RMI_BUSY or RMI_BLOCKED.
> + *
> + * @regs: Input parameters filled in. Updated with the ouptput results
> + * after the call.
> + */
> +static __always_inline void rmi_smccc_invoke_once(struct arm_smccc_1_2_regs *regs)
> +{
> +	struct arm_smccc_1_2_regs args = *regs;
> +
> +	arm_smccc_1_2_smc(&args, regs);
> +}

Nit: I mentioned on v21 - is the copy to args still needed? Can we not
do just:

	arm_smccc_1_2_smc(regs, regs);

(no need to respin, I can fix it locally)

-- 
Catalin

