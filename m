Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C500C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1zRcLGnzAM5PJkPOXA2qyaRpTz+/CGqMusyJdx/8qg=; b=vQN5nhzcohMFAq1+bLDmyp+E7p
	O+oes14jGDmHYUVcuyuIFzyzxiHD/PH6YMhypt36WtnDj0Jayf3QSwy04REO3x82yJ5rpiW1bUNLg
	LWigYX1fJzg9F3wcG4LWQ2n6oLF+TPnZUb88x78pnLqPrtUmeAM9cUDfV8QljIB00Ar3xDaNl6qd0
	KkSobJ84+Dk/FuFNKIDgO7KQ/hKlGteqa6624BNFhMRUtCRVFnp1f+A3XbYAle6w615AbDEhb7W8z
	L2ZCm8i8xRcH0W/z7YqZonTUNP/Obh/XH7aad7WvJd24U20S53SzTSv+QcmCdRUNV+3SA2iGRV3ld
	wbMhVDag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwMn-00000000DLI-0AlU;
	Mon, 03 Aug 2026 17:22:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwMl-00000000DK8-0hab
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:22:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31B51143D;
	Mon,  3 Aug 2026 10:22:13 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54AE93F632;
	Mon,  3 Aug 2026 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785777737; bh=270DIz9UlFUEplKjpbOfvTNB6/KH66EKTiY4acDrCsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dvt90swTb12jtxgZqJdx5XZK5shxx6M56TklQ7OaF+gMSpmJR7tgPHL0JxY6YOtcs
	 woilsiKJ2qDY/A6hznqV0hRnmitcznw1J0y40+5xptuvd5ALOgadE6AnbyvMKhCtky
	 M002Of/uy/BHNeM7YKo28K8va0ff9Ppg/zL4p/z4=
Message-ID: <9176e56f-5f08-47c8-93ee-e4e1aebda37d@arm.com>
Date: Mon, 3 Aug 2026 18:22:12 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v7 07/11] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
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
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-8-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260731170324.2927758-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_102219_496495_58ACB1CA 
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

On 7/31/26 18:03, Andre Przywara wrote:
> Allow the mpam_reprogram_ris_partid() function check for and return
> errors, and propagate MSC read and write errors from the lower level up.
> This also covers the callers of this function: mpam_reset_ris() and
> apply_config().
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Review-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

