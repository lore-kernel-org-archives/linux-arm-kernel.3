Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA22CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2fsmjCyj5PlsmRzsHsyA47rqLxKpcCRyXd+Ba8Kin4=; b=4QUoiLYVfQBo+mOqYs/7fK7cgj
	ArQh/XIEpklAGVWbdHWMiQFl6AUwXCA5G2UltsnFK7iEMZjhJCh0NVMaSNwjxjRBNC3Ih7Q+PBrYL
	DgpHQ9vQB2MrMmbChsTSLVCmM1+Ol7PTEcC2bsJiikjr7BstyUYU/EXFaklV5c9hBGoyPcGBGacWM
	Qw4TyinU0dz4DRQuA/GmiBh74y7ZPDAqXTG1EKenhLDAL9+KfYbrYErdrY8gaqfFIsukfqMoImS+B
	Jd5CAQ2cGVOnwSeaO7diWzhXPPCXwX5R2razmvHgjhusf26JibBmu8AfRtKcSWvETOOoeWOFWWp3C
	XKqjuOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGPq-0000000HazW-07Gu;
	Tue, 18 Nov 2025 07:46:18 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGPn-0000000Haz5-0NMo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:46:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=N2fsmjCyj5PlsmRzsHsyA47rqLxKpcCRyXd+Ba8Kin4=;
	b=0UlmbrwfWMXWMvaFTkci861M3lDtpKiJH0DpEM/3cfC9dQmyppm8t+Gy6VCWODuUMaJiZb1N1
	j6JLkgf0oiE97iQEWYQSGtT7obMuPNISKgYw/MrTQc8FmCjxQ/MnzSh+DTLGV1UqdkbKMbR07fk
	ID/A+iFBCntRUDxy9F3wR24=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4d9c7l13dhzRhTc;
	Tue, 18 Nov 2025 15:44:19 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id D7629140142;
	Tue, 18 Nov 2025 15:46:01 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Nov 2025 15:45:59 +0800
Subject: Re: [PATCH v5 00/34] arm_mpam: Add basic mpam driver
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <bobo.shaobowang@huawei.com>,
	<carl@os.amperecomputing.com>, <catalin.marinas@arm.com>, <dakr@kernel.org>,
	<dave.martin@arm.com>, <david@redhat.com>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gregkh@linuxfoundation.org>, <gshan@redhat.com>,
	<jeremy.linton@arm.com>, <jonathan.cameron@huawei.com>, <kobak@nvidia.com>,
	<lcherian@marvell.com>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <4b4cdb73-21f5-0e21-0f31-520caaaff715@huawei.com>
Date: Tue, 18 Nov 2025 15:45:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20251117170014.4113754-1-ben.horgan@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_234615_562915_A11C44D6 
X-CRM114-Status: GOOD (  11.54  )
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

On 2025/11/18 0:59, Ben Horgan wrote:
> Hi all,
> 
> Not much substantial changed in this iteration. Some rework relating to
> acpi_pptt_cache and a related proposed fix in acpica. Lots of little tidy ups
> here and there.
> 
> Thanks for all the reviews and testing so far. As I mentioned before, it would be
> great to get this taken up quickly. There are lots more patches to come before
> we have a working MPAM story and this driver is hidden behind the expert
> config. See patches for changelogs and below for branches.

Tested on ARM64 Kunpeng server with MPAM devices test suite, works
as expected.

Tested-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

