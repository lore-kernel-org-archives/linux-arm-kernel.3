Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B680CC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKJH0nVeblYkF7+RgB0PIn4VIvdM8misS6kvk/ukMnk=; b=xEtnJpdeEYF/kzaQJZ5ywVX/TN
	I+T1D70WXkdSiasu8M2hgmlaTdkpeOpzDMi03LHlXYhbU6AAuTV8yf6FU/M+kJ75Xhq3B26Jqoy/Q
	R1t42WQsBD7jkPFmvoItEACRSti7OQDN/mcJPYaU/q5DiBM1C/rElvh2NU97SOL86Cj4cseQaIyO5
	OlfLuPwYJypjJEDcy6BrJET2UG4ZDnbzOa7tAWF/F8q5vD2i7/AVLsKtPkkiYCxDotQnOcMItIXLV
	gcii9Y90CoBJ8AEyNxSWbzRVlSjisEel6I4bLnWokHBI6vQT64GzDcNZ/vBcJ4qAYbcXpInz6Cxu+
	P9Twj4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOoJ-0000000AKZ1-2QJI;
	Thu, 30 Jul 2026 11:20:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOoG-0000000AKYQ-1IhW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:20:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1F511684;
	Thu, 30 Jul 2026 04:20:14 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE7403F763;
	Thu, 30 Jul 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785410418; bh=C4AQJN9tMTKQF7Tu1mssGfWe2EOvFVRNJhCVHDLw5yc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=br6pLnnsQ4i4OH1unxzDM7UwyVts057gYJiSoDX1AinSCol54eG0xAuH/lqKhliwo
	 xZ6MAE9ztSrn2T7EA/9Wt67o2bAsqHgHEXd0XXBKr/GYgnVAK4q+utWBnt3m5ga5vo
	 7vUKCq2iQlRiXkbamShDTNxxztQwE7zHVD8q6Alk=
Message-ID: <2821782c-67af-432d-8569-4328e6354147@arm.com>
Date: Thu, 30 Jul 2026 12:20:14 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 01/10] arm_mpam: let low level MSC accessors return an
 error
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-2-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260729134124.2506269-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_042020_394353_F5572852 
X-CRM114-Status: GOOD (  11.52  )
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

Hi Andre,

On 7/29/26 14:41, Andre Przywara wrote:
> The upcoming MPAM-Fb support does not use MMIO primitives to access an
> MSC, but employs a shared-memory/doorbell based firmware protocol.
> Its complexity means that it must be able to handle errors, whereas we
> always assume an MMIO based MSC access succeeds today.
> 
> Change the __mpam_read_reg() low level accessor function to return the
> requested data through a pointer, and return an error code instead.
> Also change the __mpam_write_reg() accessor function to return an error
> code. At the moment this is always 0, so all error handling paths are
> not exercised at the moment. This will change later when alternative
> MSC access methods like MPAM-Fb are activated.
> 
> Change all direct users of those MSC wrappers to comply with the new
> prototypes, though the errors are not propagated all the way up yet.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

