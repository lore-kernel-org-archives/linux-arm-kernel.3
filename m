Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F518CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 03:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JLd3+7eItXpa6oD4S9fDPBUWfNqHNd7yVeROhoYzhk=; b=WtMEScrsqXlx9gO5USW1eMlnPi
	NXD2OdJzHuAzyELYUZ/APQzvoaDFi/ytrEpPtwO6DSrKsnWkO7tCoF60nlBvuNNjefdm+UnRnv+/t
	lG1XXikAW8vAqi0E85EQuJg/wlMZGJvgs98JP0ChLz1gg1dBEAwFGcr5F129qbCCNc1kHa6UzlUKK
	59tKg4jLvxz+HY47insKDXgdNCpyCvOlZ2PNwm4g1UEdjULK5d/42NbTl6EZVPl5nwURVF2zlDvb+
	MZmSlkRQrXO3JA2Ek8d+gzVavvp7r5qkFQ3KW040WNWzSKaXfxGqDO8jpRpwPsldai6lik/yt0LtK
	z/AZ1Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9xNP-00000009R1V-3wPo;
	Sat, 18 Oct 2025 03:13:04 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9xNN-00000009Qzs-3ReE;
	Sat, 18 Oct 2025 03:13:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6JLd3+7eItXpa6oD4S9fDPBUWfNqHNd7yVeROhoYzhk=;
	b=khUUExDvT3R13J+zlBDtTRqcrQXBaFr90ZDcRlnEcMH/93u0p26NoIbqZWt53NL4czY+SQBdo
	/OxEI0osb2yjgBCfCnle2Lszklq7b1TG2qRs3Ddkv2OFUvMv1V1DKYJFPSvhpEzZnt+OXMf3+KZ
	xaS7JvFzR4Tfv6rrLRXuY2U=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4cpRZM2kr5zmV6y;
	Sat, 18 Oct 2025 11:12:27 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C2671A016C;
	Sat, 18 Oct 2025 11:12:49 +0800 (CST)
Received: from [10.174.179.35] (10.174.179.35) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 18 Oct 2025 11:12:47 +0800
Message-ID: <c91878d6-f645-4fc0-abd3-f1ba4aef47cd@huawei.com>
Date: Sat, 18 Oct 2025 11:12:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] pgtable: add pte_clrhuge() implementation for
 arm64 and riscv
To: Matthew Wilcox <willy@infradead.org>
CC: <akpm@linux-foundation.org>, <david@redhat.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <anshuman.khandual@arm.com>,
	<yangyicong@hisilicon.com>, <ardb@kernel.org>, <apopple@nvidia.com>,
	<samuel.holland@sifive.com>, <luxu.kernel@bytedance.com>,
	<abrestic@rivosinc.com>, <yongxuan.wang@sifive.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<chenjun102@huawei.com>
References: <20251016112704.179280-1-yintirui@huawei.com>
 <20251016112704.179280-2-yintirui@huawei.com>
 <aPE36PlriswJWSKD@casper.infradead.org>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <aPE36PlriswJWSKD@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.35]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_201302_043851_4EF42FEB 
X-CRM114-Status: UNSURE (   6.98  )
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



On 10/17/2025 2:22 AM, Matthew Wilcox wrote:
> On Thu, Oct 16, 2025 at 07:27:03PM +0800, Yin Tirui wrote:
>> Add pte_clrhuge() helper function for architectures that enable
>> ARCH_SUPPORTS_HUGE_PFNMAP to clear huge page attributes from PTE
>> entries.
> 
> I really would prefer to see pte_clrhuge() removed first.  Otherwise
> this just goes onto the long list of "somebody should clean this up some
> day" and nobody ever will.
> 

Understood. I'm working on it.
-- 
Best regards,
Yin Tirui


