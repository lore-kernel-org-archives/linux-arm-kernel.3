Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B1AC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnO79n/yAvE5EfQyNJ74YN4HFwQURsznW0Z0JEn8xXo=; b=H1PCn0m6q6aYCUuVRsxKsaVGSX
	QpojnVpTFZjp1YywTk65+V8x8LrryqIY1HbHLX8gXb9dIeMwtAaGIEmN2YAKFpURZtMBdSL5w4plA
	o+hJ5JKWbqAZDnH8GYeBifwZFxwTLrpcUFf1Ul4pxVK1cF/A0pOXJaWSjzA0LeoVK2YEKzS3DMbg3
	U2d0aIcmq0cfnq+/5LBuudrfTjLW5XYU0YAFoFOyI1wyk8AnRm0MrsFZdqwe5yGqJHAyRhFHfmX+0
	u5BC70QYLzKJFAGGt6SFn69Y0gItHcwJVen40itCXMywtFgpIyEwlGoy863Fg9mWgG9bZgBjJS3mI
	hb22EpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaN7-0000000BtPN-46eu;
	Sat, 08 Feb 2025 02:15:06 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaDj-0000000BsD4-2EM0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738980318; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=PnO79n/yAvE5EfQyNJ74YN4HFwQURsznW0Z0JEn8xXo=;
	b=oBVds19g68E7cEJ8FPxiAcHclWns8IcjT4f+uTe2kW3hYZMOj8F9Kan6ayMSKzzZT4ZLHbSRLY5YsZzcrZn8cdAZLiBXWWumjCShTT28wc+s8zQU1i2+dfermCWIYtGSAcQbPkFrie9YU9EHZGvHUbVbhEE2PDMVS2V/+TpZBb8=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WP-xQ4J_1738980312 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 08 Feb 2025 10:05:14 +0800
Message-ID: <63720413-be3d-4ae3-aec7-3c62662116a9@linux.alibaba.com>
Date: Sat, 8 Feb 2025 10:05:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/3] ACPI: APEI: handle synchronous errors in task
 work
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: yazen.ghannam@amd.com, mark.rutland@arm.com, catalin.marinas@arm.com,
 mingo@redhat.com, robin.murphy@arm.com, Jonathan.Cameron@Huawei.com,
 bp@alien8.de, rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com,
 tony.luck@intel.com, linmiaohe@huawei.com, naoya.horiguchi@nec.com,
 james.morse@arm.com, tongtiangen@huawei.com, gregkh@linuxfoundation.org,
 will@kernel.org, jarkko@kernel.org
Cc: linux-acpi@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
 ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com,
 baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com
References: <20250107081735.16159-1-xueshuai@linux.alibaba.com>
 <8775a7d1-b4c5-467b-942c-3041e2994735@linux.alibaba.com>
In-Reply-To: <8775a7d1-b4c5-467b-942c-3041e2994735@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_180524_335031_7D30038C 
X-CRM114-Status: UNSURE (   5.39  )
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



在 2025/1/22 13:36, Shuai Xue 写道:
> Hi, Rafael,
> 
> Gentle ping.
> 
> Thanks.
> 
> Best Regards,
> Shuai
> 
> 在 2025/1/7 16:17, Shuai Xue 写道:
>> changes singce v17:
>> - rebase to Linux 6.13-rc7 with no functional changes
>> - add reviewed-by tag for patch 1-3 from Jane Chu
>> - add reviewed-by tag for patch 3 from Yazen
>>
>> changes singce v16:
>> - add reviewed-by tag for patch 1 and patch 2 from Yazen
>> - rewrite warning message for force kill (per Yazen)
>> - warn with dev_err in ghes (per Jarkko)
>> - add return value -ENXIO in memory_failure comments  (per Yazen)
>> - Link: https://lore.kernel.org/lkml/20241104015430.98599-1-xueshuai@linux.alibaba.com/
>>
>> changes singce v15:
>> - add HW_ERR and GHES_PFX prefix per Yazen
>>
>> changes since v14:
>> - add reviewed-by tags from Jarkko and Jonathan
>> - remove local variable and use twcb->pfn
>>

Hi, all,

Gentle ping.

Thanks.
Shuai


