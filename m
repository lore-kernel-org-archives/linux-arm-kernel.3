Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC24C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ufxb8A/ncI6T7rz6wfAMdcxPy8aEvFCNQzFIwevczM=; b=qQmQDXP39lDKu2mSFBxhlGqxti
	T1lOJfc9E/9nNTpRwOg0QBMv0ExNbeUv0qmF3gxkCuqE8bOMBztUq7BLQdmZvYde2K/qlPTP3+vb5
	avUsh/9+4yZQGIW7Ny6LdAAy7woPbTq8a/Hm/fzosZManecKKQkt34EVHqFk1A4tddUmMRxJttQET
	xzty29xQynfJDE1e1JLxZpfPHDVJFA9N3E42cch5FVzNQHi1ZF1Nf2wykGDAjVu5dmk7oOMXXvqOL
	gS7SGSQognZnv+DDtXN1SIzP1mBQI+LkiQAQFoa/msv4YMlacybIrKN5p7ZwtbsF3ETLD7xI9OmvQ
	khL22flA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOpn-0000000AKim-3OEy;
	Thu, 30 Jul 2026 11:21:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOpl-0000000AKiL-04ED
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:21:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 334231684;
	Thu, 30 Jul 2026 04:21:47 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 012433F763;
	Thu, 30 Jul 2026 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785410511; bh=YKpCvtPF4KfO8eYyhMxD+9bZaFC6vrQrsW+ruC7lWjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+H0KikVMWyxHksz59sjNwhJ9Q6+8d3ILARtjn6qiNODWJ1G9TYrrXMaUeq4ypXmN
	 4FQWhc9bIY69uVVsbK+Upes42jfLWFU8AFr99h3q6bBXerJPYWnfdc7qlaIuMSs418
	 qBGhAp7zsJ3s/m5d3n9hTQDychOFS6O3w408/ofI=
Message-ID: <5e5e9855-1e36-4c73-ab36-98c0bafa3225@arm.com>
Date: Thu, 30 Jul 2026 12:21:47 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 02/10] arm_mpam: propagate MSC access errors for
 hw_probe functions
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
 <20260729134124.2506269-3-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260729134124.2506269-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_042153_118685_A2DD8759 
X-CRM114-Status: UNSURE (   8.43  )
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
> Allow the functions probing for MSC hardware and features to return an
> error, and propagate read and write errors from the lower level up.
> This uses some "scoped cleanup" functions like scoped_guard() and
> ACQUIRE() to avoid the complexity of error handling when a lock has been
> taken. Since the mon_sel_lock is a bit special (even more so in an
> upcoming patch), we define a new GUARD type for it.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

