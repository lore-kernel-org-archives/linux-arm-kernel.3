Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85246C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25QWhl1E8uliKpR0GPRkTCt9g9fuMI58Jg8sGQVKemM=; b=Fi7rj5vqAPVlqV
	0Xq2dVV+W30P5Iz4/IZzW4acw+GqpTb9SPJhz/I3wMDjvLU6Lssr3510/OXbM+cniHBbbrY/AD33F
	CTrdr37zYpa84jSCWF8JRZMwCqQdpO9XlGstnZueL/qrlNigrESQARvURLXZ6dsiTheOiG0HtNGnf
	qqiC0u6b3XyZDwG+MJctTroEy4tJ4DtHSA7yvIdk9MdBKeAzvf1mH1gqwhp0ozfWLDyFANfsnvOfk
	pFSHjTwrBaleurFtNDPIbhJiL5fXwUclOROt+mq7ob1SacIe1cnVo9HyuRR9g6unCKquB5SzsGNGF
	hgNHmqK+DB6vyvhAmUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZW4-0000000BSpq-1aPg;
	Tue, 14 Jul 2026 09:33:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZW2-0000000BSpS-1Cgc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:33:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A63B2B;
	Tue, 14 Jul 2026 02:33:21 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 834C03F93E;
	Tue, 14 Jul 2026 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784021605; bh=Aoy99cPtC4GP1ypAL3VOlYo80ybRbk324aCCfol/4A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RifKNz3Au/ahnnZ3pnnQQ/POoYX7XKmh0vDrUTQ54dbCGPYDJRYNuxLIQPU/Dy2Wp
	 aOk6VxeVKM+i8T96iBF2EUfSayi4cSSKPeVk6Mg18O+Uhsg1oyQ9NqHuCI2/uXqpqU
	 4G0gmTvUbB+dDS61hVqxporSuPWs8qUWfCM98gUs=
Message-ID: <3d74d0d8-89ca-4f5a-841b-e8dee3b0f037@arm.com>
Date: Tue, 14 Jul 2026 10:33:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 28/36] arm64: cpufeature: Detect PE support for
 FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-29-vladimir.murzin@arm.com>
 <77cd779b-9091-49f2-9a20-c0805c03e50e@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <77cd779b-9091-49f2-9a20-c0805c03e50e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_023326_370700_EDE5D3D9 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 03:25, Jinjie Ruan wrote:
>> +	BUILD_BUG_ON(IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
>> +			(ARM64_NMI <= ARM64_HAS_GIC_PRIO_MASKING));
>> +	if (cpus_have_cap(ARM64_HAS_GIC_PRIO_MASKING)) {
>> +		pr_info("Pseudo NMI enabled, not using architected NMI\n");
>> +		return false;
> A small suggestion is to change it to pr_info_once. Otherwise, a large
> number of print information will be displayed.
> 

Good catch! I'll fix that in next iteration.

> Otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks!

Vladimir


