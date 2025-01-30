Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553C9C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzIpYfPJ/7jjY8MUJnl7/c0IRpxedLFzmYOrf95yEwg=; b=IMDgINwaQQiKuFvDpnW3LmerKk
	O5x5G3nETmi5vM23HLMvH0dYOU424Z0Wzuwrv8ctFQOXXEEvp6HXCHNCCbSj2SNYiGcoQm4NLdrY1
	e2uixJ4e5/FIGWqXZGN1EEzrGXPPwJZJ8438tOrpeSELUuGCVByTbWlysdolFEi6EGvex5+ZEoTVg
	4oFpssLHN5iMgVPfkVQRrJt8w/eXmJed7tpHktbBiIzpnhMb6a2gEugJ2MaqXbN7lo/xSFSaydn+Q
	AiVSHnR+ju0QqvYUltA1rX3HnhFX+iAPDxEFcj6kyhyirku5LeJ6r8emBeQEbr7NDnOh5xHYyTfUV
	coIt2KfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcS0-00000009g66-49nU;
	Thu, 30 Jan 2025 21:51:53 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcPS-00000009fsO-43OV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 21:49:16 +0000
Date: Thu, 30 Jan 2025 13:48:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738273752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DzIpYfPJ/7jjY8MUJnl7/c0IRpxedLFzmYOrf95yEwg=;
	b=wyAaLoFxTNp7NtBA7ltJEMgmkgZO1t5kHhHTzCXxMrz5xWIfjVjv3QdkQ6cXfS5HPml0/8
	Z4+cXx4xfC+VGlDRB81J7NwSxF8Ewppka2gBvqBstQitdKe8hBYvIpKdK42lFeB3LfS/Ye
	wL/lwc0bKiNOv+qRXy1s98i7sfyPDio=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	joey.gouly@arm.com, kvmarm@lists.linux.dev, maz@kernel.org,
	suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of
 firmware mitigation
Message-ID: <Z5vzxWX4AY-JY4TV@linux.dev>
References: <20250128155428.210645-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128155428.210645-1-mark.rutland@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_134915_136778_880E152D 
X-CRM114-Status: GOOD (  18.58  )
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

Hi Mark,

On Tue, Jan 28, 2025 at 03:54:24PM +0000, Mark Rutland wrote:
> On some CPUs from Arm Ltd, it is possible for unprivileged code to cause
> a hardware prefetcher to form an address using the contents of a memory
> location which is accessible by privileged accesses in the active
> translation regime, potentially leaking the contents of this memory
> location via a side channel. This has been assigned CVE-2024-7881:
> 
>   https://developer.arm.com/Arm%20Security%20Center/Arm%20CPU%20Vulnerability%20CVE-2024-7881
> 
> Arm's recommended mitigation is that firmware configures an
> IMPLEMENTATION DEFINED control bit (CPUACTLR6_EL1[41]) to disable the
> affected prefetcher, and updates to Trusted Firmware-A are available to
> do this. For systems which have not yet recevied a firmware update, KPTI
> can help to mitigate the issue.
> 
> These patches enable KPTI for affected parts when the firmware
> mitigation is not present. The presence of the mitigation is identified
> by the presence of the SMCCC_ARCH_WORKAROUND_4 SMCCC call, which was
> deployed with the mitigation. This is documented in the SMCCC 1.6 G BET0
> specification:
> 
>   https://developer.arm.com/documentation/den0028/gbet0/?lang=en
> 
> I have tested this on a few configurations of virtual platforms. I'd
> appreciate any feedback, especially on the KVM changes.

The KVM changes look reasonable and follow the usual model for this
crud. It would be nice to report the mitigation state to userspace
somehow as I would like to have a KVM selftest for all of the hardware
vulnerabilities.

But anyway,

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

