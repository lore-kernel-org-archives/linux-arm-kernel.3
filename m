Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB3FC55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gNsJ/Pwgz+co6YvHtsUIL0nYmGfCdnKlrHydmems0k=; b=lLXhWYdhUPpfR8MmCH5/jDcclH
	of/iEl7RK5s8HsFPvScSb79OlJN79E01h4yEC+tLXMTCbgCW6c0sz9DVhp2MYYoRUxPmpM2QgN38l
	gVEsCDPMY9iMgdiHw39bBq8ws5rO+MrlA+C3roJzuI8i7Lovuw67J6/kWCQ4udeJ8nGsswCd0jZdl
	hNmGmEATuyFqn8ebS0GrGSbPXxcFFT1vbF2lsywld0j8pvYxGCA6iOwozWesrDowOET8KNVLwB4oa
	FV5mfX4RUa+9+dQ4QmnlszqGlOLK1jBOh/ai4XqQIFFDeJWeZPBQ3LU/KM23a0tbryXNtFoLx08Lb
	CgSdQE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr61d-00000000wK2-0jRL;
	Tue, 04 Aug 2026 03:41:09 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr61Y-00000000wIs-47CX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:41:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0gNsJ/Pwgz+co6YvHtsUIL0nYmGfCdnKlrHydmems0k=;
	b=5AFyl/oARe5n9mThMmRQ0qS66Gx3BTYeRvTaj/ql4ppuYW4fYTf/xa+H4y2/Du+kXCfkaCkG9
	WCmROvBwp1QVGAQJwzMCzxLuF/gHKdA6i801W7ncGzr4Gf44huAOtSdJM8o5oQGVpGqyxxRLTAc
	RJPSNjAtLY4oiS87Nc6hDZw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hDfGP1bjczpSvB;
	Tue,  4 Aug 2026 11:31:25 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id B61A34057D;
	Tue,  4 Aug 2026 11:40:52 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Aug 2026 11:40:51 +0800
Subject: Re: [PATCH] ACPI: IORT: validate RMR node array bounds
To: Will Deacon <will@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
 <amzCci9-3kMZbSI4@google.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <65d0a7d6-c71b-d779-4b95-85fcd3495195@huawei.com>
Date: Tue, 4 Aug 2026 11:40:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <amzCci9-3kMZbSI4@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_204105_474189_03B48D90 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Will,

On 2026/7/31 23:42, Will Deacon wrote:
> On Mon, Jul 06, 2026 at 05:43:00PM +0800, Pengpeng Hou wrote:
>> IORT RMR nodes describe reserved-memory ranges through firmware
>> offset and count fields inside the current IORT node.
>>
>> Validate the generic IORT node length before dispatching it, and
>> check both the RMR descriptor array and the ID mapping array before
>> walking them.  This binds each array walk to the current node length
>> instead of only trusting the firmware-provided count.
>>
>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>> ---
>>   drivers/acpi/arm64/iort.c | 83 +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 79 insertions(+), 4 deletions(-)
> 
> Hanjun, Lorenzo, any thoughts on this one?

Thanks for reminding.

In my personal opinion, this is not a real issue because if something
wrong with the IORT, the IORT will not work at booting, for example
the device will map to a wrong ITS or SMMU, the device will not work
at all, so those issues will be fixed at the pre-production stage,
correct me if I'm wrong.

But to the patch itself, it's no harm, I will comment on this patch.

Thanks
Hanjun





