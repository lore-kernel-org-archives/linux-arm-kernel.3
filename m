Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C98010ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rihcjvs9G5sMfbgYhmWaCJkhbTJSUpHM/UROraOAfMU=; b=gxM0d1N9eal/Fxmjk9AjwSbDMo
	AwFDRkKrMFtyAsTZaLCgZy/OKAClnmuZvlLl+sALJahpXUtu/VQ2lh3i0+/v6RFpKKNw/OnpSWapb
	k6aMU9nT6ufdk0bAcqbZ36BS4yu/mvc9VjGj/6Rbpu8bsXLTFXOec/pYsWzlcJ4SkH+CguiC8R+Vn
	LZT8DA1nidZg2SJed2oYFOxpOgbmKHmwCb4v2jE2FiPeu64jLVzDMyLOrdp1ly6dD7j34uZBqfbjK
	qBBA4Y4zHwPmZJFupa8pO1F9u2if/gAhemDp3SJWgl3qkQUHkiPOt+dvHqd0u0zJqqJH4OtXebIUK
	FGx8U8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64ja-00000007B4y-0UFY;
	Fri, 27 Mar 2026 10:48:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64jX-00000007B4Z-1FV4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:48:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F59A3563;
	Fri, 27 Mar 2026 03:47:59 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCD733F641;
	Fri, 27 Mar 2026 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774608485; bh=xv48BM89gW5CLuuO2iR6Rs0YtVuxzCCHplP9kIIFF5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gM0HNMxnnhGz/MtPcwcH2C9ejAEzQFxA+wI+ZD9azZfcaUXmo1y0omwQv7VZAJbnf
	 bpg9MvCKFjuPyhs4xTgYFvmRJi/aAKDBsj1h3BNeF9rrdrNBtEdT+sK/V2J5VziSRC
	 CApbWMc+EQOO8E0r7cfdpjhHPEkDX0dSqoHblYEI=
Message-ID: <08aacacc-e3e5-4e97-858b-cbcbdb9a1fcf@arm.com>
Date: Fri, 27 Mar 2026 10:47:49 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [Question mpam mpam/snapshot+extras/v6.18-rc1] Question with
 Configuring iommu_group in 'task'
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 xhao@linux.alibaba.com, zengheng4@huawei.com, Linuxarm <linuxarm@huawei.com>
References: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_034807_477736_31BC3EB9 
X-CRM114-Status: GOOD (  12.44  )
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

Hi Qinxin,

On 3/27/26 10:21, Qinxin Xia wrote:
> 
> Hello everyone!
> 
> In earlier versions, mpam supports the configuration of iommu_groups.
> 
>  823 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
>  824                                     char *buf, size_t nbytes,
> loff_t off)
>  825 {
>  826         struct rdtgroup *rdtgrp;
>  827         int iommu_group_id;
>  828         bool is_iommu;
>  829         char *pid_str;
>  830         int ret = 0;
>  831         pid_t pid;
>  832
>  833         rdtgrp = rdtgroup_kn_lock_live(of->kn);
>  834         if (!rdtgrp) {
>  835                 rdtgroup_kn_unlock(of->kn);
>  836                 return -ENOENT;
>  837         }
>  838         rdt_last_cmd_clear();
>  839
>  840         if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>  841             rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>  842                 ret = -EINVAL;
>  843                 rdt_last_cmd_puts("Pseudo-locking in progress\n");
>  844                 goto unlock;
>  845         }
>  846
>  847         while (buf && buf[0] != '\0' && buf[0] != '\n') {
>  848                 pid_str = strim(strsep(&buf, ","));
>  849
>  850                 is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
> 
> What puzzles me is why we would put it under 'task'—this seems a little
>  strange to users.It seems they are not related.Why don't we add a new
> interface like 'iommu'?

I think it is likely that this interface would change if upstream support is added.

> 
>  851                 if (is_iommu)
>  852                         ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp, of);
>  853                 else if (kstrtoint(pid_str, 0, &pid)) {
>  854                         rdt_last_cmd_printf("Task list parsing error pid %s\n", pid_str);
>  855                         ret = -EINVAL;
>  856                         break;
>  857                 }
>  858
>  859                 if (pid < 0) {
>  860                         rdt_last_cmd_printf("Invalid pid %d\n", pid);
>  861                         ret = -EINVAL;
>  862                         break;
>  863                 }
>  864
> 
> In future glue versions, will you re-enable support for iommu_group, and
> if so, will the configuration scheme be changed?

Please can you let us know about your usecase so that we can get more information to decide
what the best interface would be?

Thanks,

Ben



