Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084A9C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spmz0a8B9oV1Adt6KvKiqlrCskX3CSLHf/anY8Ol2wo=; b=n1sHQJbo6WJBFA2zykZVKf93+3
	a7nGiobRyy732fhTGMqFgChNN79ipX0wFsBSsXjFzaAtzn9iisEZtdyIf1LsOVULPB3k14lKUsoZ2
	MfBQyfJ1i0hZueWOxhDMc6MpGImpIugIeENrRcLyS7O1FZ47A2VyeUU8DUUhWI/ZhjmWAbvxS0LRZ
	wIN/AyjiaMvJUupDYrTcV7DJJRiOtReNYz+64jCrZEzNtgCmOdAXooX294sYmV7LH4M1bis8pP6hg
	eP5B1pEBXBuYwibvH3JLuyecat6CpREhSf1hpSWlSpc8p89uws93DtLQYStDamjAL52G6Lk8vFUO+
	wrodOGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFnE-0000000GYZC-1y8Y;
	Thu, 16 Jul 2026 06:42:00 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFnA-0000000GYV2-3I01
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:41:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=spmz0a8B9oV1Adt6KvKiqlrCskX3CSLHf/anY8Ol2wo=;
	b=nu7kelF5cHuF/KccNYwIo4/a2j3GYLBCWEdvpZ+UTLM2JNWSTZFm3zvOK8q7EXf9GyK0kq6r5
	bb/bw6yJSr1KJ7TAETJ6BxnmB6cUfi3Hm2Vege5TwQzd0kwICFts9Vz+Kbpe9uUtFkRy05CKIPp
	ZjypAYIT/UVVkVO4NZrkZ7g=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h139k11DwzmVX8;
	Thu, 16 Jul 2026 14:32:10 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 38DFB40565;
	Thu, 16 Jul 2026 14:41:29 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 16 Jul 2026 14:41:28 +0800
Message-ID: <1fef5984-1f07-6a20-c6a8-20b285a82327@huawei.com>
Date: Thu, 16 Jul 2026 14:41:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH mpam mpam/snapshot+extras/v6.18-rc1 v2 3/3] fs/resctrl:
 Migrate IOMMU groups when removing resource groups
To: Lee Trager <lee@trager.us>, <ben.horgan@arm.com>, <james.morse@arm.com>,
	<Dave.Martin@arm.com>, <fenghuay@nvidia.com>, <reinette.chatre@intel.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<sunnanyong@huawei.com>, <xiaqinxin@huawei.com>, <wuyifan50@huawei.com>
References: <20260414032610.1523958-1-zengheng4@huawei.com>
 <20260414032610.1523958-4-zengheng4@huawei.com>
 <c53d8057-d3c3-4000-8ce2-876385ca3f25@trager.us>
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <c53d8057-d3c3-4000-8ce2-876385ca3f25@trager.us>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_234157_280095_09C62214 
X-CRM114-Status: GOOD (  13.40  )
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

Hi Lee,

On 2026/7/16 5:35, Lee Trager wrote:
> Hi Zeng,
> 
> Thanks for the series, I found it while backporting MPAM support to 6.18.
> 

You are welcome. Glad it could help you fix the issues you encountered.


> iommu_group_get_from_kobj() returns holding a reference on 
> group->devices_kobj, the one iommu_group_put() releases. The 
> kobject_get() above only compensates for the kobject_put(&group->kobj) 
> done internally by iommu_group_get_from_kobj(). Nothing in this loop 
> ever calls iommu_group_put(), so this leaks one iommu_group reference 
> per group in the kset on every call, e.g on rmdir and every unmount. 
> Since device_kobj pins the group's koject, the leaked groups can never 
> be freed.
> 
> The same pattern exists in show_rdt_iommu() from "fs/resctrl: Add 
> support for assigning iommu_groups to resctrl groups", where it leaks 
> one reference per group on every read of a tasks file.
> 
> There is a second, smaller leak on these break paths: 
> kset_get_next_obj() only drops its reference on the current kobject when 
> it is passed back as @prev on the next iteration, so breaking out of the 
> loop also leaks the group_kobj reference taken by the iterator. I am 
> carrying the fix below:
> 
> if (!from || iommu_matches_rdtgroup(group, from)) {
>      err = kstrtoint(group_kobj->name, 0, &iommu_group_id);
>      if (!err)
>          err = rdtgroup_move_iommu(iommu_group_id, to);
> }
> 
> iommu_group_put(group);
> if (err) {
>      kobject_put(group_kobj);
>      break;
> }
> 
> Thanks,
> 

Thank you for the review. The changes look reasonable to me, and I'll
carry these memory leak fixes into v3.


Best regards,
Zeng Heng

