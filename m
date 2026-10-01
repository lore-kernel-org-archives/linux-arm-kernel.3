Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B85CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnGg/uQCx3R/rKC13pNneXlRRpRtTi+4yYhPo9tV1GY=; b=SGZDkQCIAvclXXVfoMkCWvfV+1
	t/lF0nZouQWqAKqCm7wr7LiANyotpCcqNn0H71UohHggzorlbrn4AVGkhoJPZHySS+038/2DjbgPx
	I+RXsSuVu2pQRpAgUCNc+cnjbrj5VdAoqCBtW0Pc5PLpmhiX3/kHl8R1cgeOZE9/+pjjjXaH+AmWo
	AqW6Jj78JCFx7KiSLn2xpJ8oGil8LXacMoVDVPTnm+n/NMBE6sFSPZ4+RmWLzUiR1KBaUjM1CuNBd
	2A3D2sEDYYWrxtFHN5L9YY8jddbMkULK+nzEbRLemlPLT4+WoBjmcX9NSLqa3ro8mbrg5E5W5ncGa
	DR7teCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6i-00000009b6c-1OLg;
	Thu, 01 Oct 2026 15:54:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6f-00000009b5x-0HkV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B8D497;
	Thu,  1 Oct 2026 08:53:55 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D9613F86F;
	Thu,  1 Oct 2026 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790870038; bh=brRPLivSgp8jybcJZM5iSl0Fx44Zqh0P2ZiJmBX1NY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icz1EVIwOxQcL/dRlhcFbwaGgJVDPf80GpsgcCQIEVxmntd+cxXCmGFMpyhH6Dt7x
	 wJ4dmg1XSGLRP1OmqWrupvvlDQZque9l0VC0PMngzTd18jTryaimkSgOQCSlv5EJI/
	 1C9QbeeaLIaqeMZHTlRUAEfyPRQlLLAutMOOrYwU=
Date: Thu, 1 Oct 2026 16:53:53 +0100
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
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v20 22/22] KVM: arm64: CCA: Control user register access
 for Realms
Message-ID: <ar6CEXfo-AIYtq1J@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
 <20260924160504.853911-23-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924160504.853911-23-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085401_158486_0EBD29D3 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 24, 2026 at 05:05:04PM +0100, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM restricts the access to the register states that the host can
> read/modify for a given Realm.
> 
> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>       While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>       requests.
>       MMIO emulation in the unprotected space.
> 
> Additionally we use the sysreg configuration to advertise/configure the
> following Realm parameters, which are required before the Realm Descriptor
> :w

Should use Emacs ;)

-- 
Catalin

