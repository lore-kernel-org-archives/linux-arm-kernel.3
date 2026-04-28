Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96640FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXiRyzOamvgGeyWyItpFXFVgM4fM4U44s5MVCU3gFN0=; b=3T1Vjr4TLEeVgAfqmnYRewcxCO
	WTcYXqytXdvzAAekRAVPQu35Sn0yyQZNASwaCcWz1sUYgc3Z01zvbvA9bqCX5/ZWYmAoZ2P9dBwU+
	m9MY20UixPea6tk5xn5VEIEblG2ZsB9RmzAipCYOZBRer4G+O+cKPJ1/V6KnvHcy5VSJHO6g1X6eT
	OzTVZmL9iJB2bpXx5htAvGHNUcn4fx0zDWtgDdlQsRLoBFVefl6FY0H4HmwAMWBV0o1TauyraTRzV
	tD7mPt4j71jdjB2vFw1L+Kw23xbrtV/ayvvhYOw7pKksmBNgG7BiWyLBtmXb8s8ggS7zEG7jqeOOE
	vSwQATBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjpO-00000001gw5-1ag6;
	Tue, 28 Apr 2026 14:54:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjpL-00000001gvi-3y57
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 14:54:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4C871C0A;
	Tue, 28 Apr 2026 07:54:11 -0700 (PDT)
Received: from [10.1.29.174] (e121487-lin.cambridge.arm.com [10.1.29.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 912963F763;
	Tue, 28 Apr 2026 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777388057; bh=5730Ij/YR5Jarz1eBbQXRVC50ATSOObe10t8tR4kZNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UkEAh8YTGV8jNR++BZu5acdMKaPvOa2JtNsHYgQKXU71VEFRH72DB4IT6zv487lTA
	 ZIwDldf22BXP80+6fADk3OoSZrRz4jRmjJ1ybBqC2ALP/zL/uYi/odZqtSr9imPe8U
	 xqt8Vibq1qyQgiXw4owXvEMZR941s0wZeU8Ql8Fw=
Message-ID: <9de41a97-0701-447e-bb28-63796eaa8f60@arm.com>
Date: Tue, 28 Apr 2026 15:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/43] KVM: arm64: gic-v5: Create & manage VM and VPE
 tables
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Timothy Hayes <Timothy.Hayes@arm.com>
References: <20260427160547.3129448-1-sascha.bischoff@arm.com>
 <20260427160547.3129448-8-sascha.bischoff@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260427160547.3129448-8-sascha.bischoff@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_075420_139895_EAB92E2F 
X-CRM114-Status: UNSURE (   7.45  )
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

Hi Sascha,

On 4/27/26 17:08, Sascha Bischoff wrote:
> +
> +	if (virt_to_phys(l2_table) & ~GICV5_VMTEL1E_L2_ADDR) {
> +		kfree(l2_table);
> +		return -EINVAL;
> +	}
> +
> +	vmt_info->l2.l2ptrs[l1_index] = l2_table;
> +
> +	/* Alignment issue! */
> +	if (virt_to_phys(l2_table) & ~GICV5_VMTEL1E_L2_ADDR) {
> +		kfree(l2_table);
> +		return -EFAULT;
> +	}
> +
> +	tmp = virt_to_phys(l2_table) & GICV5_VMTEL1E_L2_ADDR;
> +	WRITE_ONCE(vmt_info->l2.vmt_base[l1_index], cpu_to_le64(tmp));

It seems the same l2_table alignment calculated (and checked) multiple times...

Cheers
Vladimir

