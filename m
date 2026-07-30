Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD6AC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPNAeEwtXWitShA3t8X7xmXk3DgjPzPmXQX2gZ9rQxs=; b=yiur0KqTHqpB5bfNtO8JlyT1li
	OFL+X4lD2nmqhXG0BL5RdKyqz0Bck/brmfhsxRsq2I+QiGkEFAU13B5lmevWWJVJCs0ZWIZu162x9
	nqfWzkmP1YjpkvWR/KYzfFlEq8r9gEIzRxNkY9ZQZTKyXmwRV8PNWvt7jSF8OrZWh0ZdTkgdy4MHJ
	hTibJec8MQ6Akhim/v/EGz8hlMO1+hpJ5hcejo+yQ7NffcbKxb+3nNEHmmflJuLvEZHLFTvKAuF5P
	/t1VzSEnChFkmL1YncLWgkmePeqvVgLMCqAT1m7/CTeMNJ6csZsEDbJ+y/w4rAuNYg9awTPBspH19
	IVu3+sCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOr9-0000000AKsv-0Jur;
	Thu, 30 Jul 2026 11:23:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOr5-0000000AKsR-3aTn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:23:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE4D71684;
	Thu, 30 Jul 2026 04:23:10 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A94593F763;
	Thu, 30 Jul 2026 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785410595; bh=qEZO7Sto53jxiuyE1DDibmDcCflAGGXQaiqSoDxmtHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hGCb5WfJkTuSa4fS7Dn+O3kmXfwD6SQV7NXtfNIZNWvGGVNPUjC95J4Jdz7CnqyvJ
	 KwIU/co/Vcu4eYL7TCzESng3OeVOzA0k3H4Blvq7gzy9+Zt4Co019QPjYhKJehbhjn
	 +r4rwIMUzNZic1V5LXVVBDUUN/ZHaPPK/SGnfhjY=
Message-ID: <c7c7e986-35a2-4605-b051-6931f1ac4833@arm.com>
Date: Thu, 30 Jul 2026 12:23:11 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 03/10] arm_mpam: propagate MSC access errors for MBWU
 counters
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
 <20260729134124.2506269-4-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260729134124.2506269-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_042315_935674_6E22F7F7 
X-CRM114-Status: UNSURE (   7.47  )
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

Hi Andre,

On 7/29/26 14:41, Andre Przywara wrote:
> Allow the mpam_msc_read_mbwu_l() function to return an error, and
> propagate errors from the lower level up. This also changes the users
> of this function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

