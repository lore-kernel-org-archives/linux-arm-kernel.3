Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ADE106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ctyjf5i618kL7c0QpNS7K5SknjGQOzgh86U2BmWa4rk=; b=DOj8JtMFIV3Su/RzReHfKl2e5T
	dIYpL4X03u4JSZ1Dq+1+rbFTJ8109N2tjZlrO41+ZNLdwaq+wjTUYAtyBLYAILCr98hKAu1BbYNN/
	Im4bSVIZNuFH5Yf0EYsF1MhN0Lw7IoSFW2s9UQSwPo4EqQeESK+OmdVD2tvuAnNwxPg3nuL3E4kYq
	Qn5ACGvpjkbI/FgZE91XqOKQmimgPHto+waiMOiYS05IKAno0z+eNWTFwC5WRCHEXkIuI4TXKY+TH
	SeN/AZ/5l55BET/lQ/6FeT1ag9/rcPFjHNvYycTr0rkn8U6DA50lzEOdogcqk9dKGeqT2zCt46TEZ
	DZ+PfmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0weh-0000000Gz2F-3GZw;
	Fri, 13 Mar 2026 07:09:55 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wee-0000000Gz0n-2vk1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:09:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fXFq3698Vz1K9C2;
	Fri, 13 Mar 2026 15:04:47 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F91740363;
	Fri, 13 Mar 2026 15:09:42 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 15:09:41 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 15:09:41 +0800
Message-ID: <704b6126-f1ad-4d8a-5709-a12e4c8c79ca@hisilicon.com>
Date: Fri, 13 Mar 2026 15:09:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Question about ARM KVM stage2 contiguous bit support for contiguous
 hugetlb
To: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>
CC: <tangnianyao@huawei.com>, jiangkunkun <jiangkunkun@huawei.com>, "xuwei
 (O)" <xuwei5@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_000952_903872_C59F6A0F 
X-CRM114-Status: UNSURE (   4.10  )
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

Hi,

Current KVM stage2 supports contiguous hugetlb, e.g.4KB basic page size, 64KB hugetlb.
However, contiguous bit is not set in PTE, so there is no hint for hardware to create one
TLB for a contiguous huge page.

Seems to support this feature. We should do:

1. In user_mem_abort, do not force to do PTE map for CONT_PMD_SHIFT/CONT_PTE_SHIFT,
   just map all contiguous pages at one time.

2. Add contiguous bit in above process.

3. Modify the permission fault related code. As in the first point, we change vma_pagesize
   actually, vma_pagesize will be not equal with fault_granule, we will fail to enter into
   kvm_pgtable_stage2_relax_perms.

4. The split of contiguous hugetlb should be considered. We need remove all related contiguous
   bits, once one PTE has been changed.

Note sure if I miss any point to implement this feature. And do we have any plan to support this?

Best,
Zhou

