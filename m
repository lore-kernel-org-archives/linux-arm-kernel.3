Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04346C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 02:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8YOthW7BGFXuhtArbXyc3e6ajPVd/gxBZQNXQ1v+/4=; b=VoNTITXNIpm9wIyyuhXCbUI+Li
	wxNv/36BRjuqmON4uwgGzPhJsk8zjNgmAOI4tE1LgpAgPPtzYmDcsDiLNI0jgaOc0lYLnOdALsKPe
	EoIIaQb1NObSzK4vncZPl5TtPCVEwt6fDoWKKXfzqx5yX7+q72YxQ0ev+OgIq7/GbR0i8rAqz3xu7
	kfRDmuJA48JquTgkYrU42ZDFQLfpKSc8hySBeXbh5p9FESQIijQSKpKT2TlIUgkRS2COvX5KJkNJp
	wtfhg4HOx4TxRXGT9j/mK2/v8nVV+ojlcMhEgjG81TsXcK2kU6NKeUGQC55vAfAe8Yum+tB+q+hEj
	V2lpdRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ypo-00000002XIH-0fgW;
	Tue, 08 Apr 2025 02:37:08 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ynR-00000002WxY-3GHL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 02:34:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZWqr46dS8ztRtx;
	Tue,  8 Apr 2025 10:33:08 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id EDC361401E9;
	Tue,  8 Apr 2025 10:34:32 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 8 Apr 2025 10:34:31 +0800
Subject: Re: [RESEND PATCH v18 0/2] ACPI: APEI: handle synchronous errors in
 task work
To: Shuai Xue <xueshuai@linux.alibaba.com>, <catalin.marinas@arm.com>,
	<sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<linux-acpi@vger.kernel.org>, <yazen.ghannam@amd.com>,
	<mark.rutland@arm.com>, <mingo@redhat.com>, <robin.murphy@arm.com>,
	<Jonathan.Cameron@Huawei.com>, <bp@alien8.de>, <rafael@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<tanxiaofei@huawei.com>, <mawupeng1@huawei.com>, <tony.luck@intel.com>,
	<linmiaohe@huawei.com>, <naoya.horiguchi@nec.com>, <james.morse@arm.com>,
	<tongtiangen@huawei.com>, <gregkh@linuxfoundation.org>, <will@kernel.org>,
	<jarkko@kernel.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<akpm@linux-foundation.org>, <linux-edac@vger.kernel.org>, <x86@kernel.org>,
	<justin.he@arm.com>, <ardb@kernel.org>, <ying.huang@linux.alibaba.com>,
	<ashish.kalra@amd.com>, <baolin.wang@linux.alibaba.com>,
	<tglx@linutronix.de>, <dave.hansen@linux.intel.com>, <lenb@kernel.org>,
	<hpa@zytor.com>, <robert.moore@intel.com>, <lvying6@huawei.com>,
	<xiexiuqi@huawei.com>, <zhuo.song@linux.alibaba.com>
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <38b80839-cd47-cbf6-cd79-44e967ad8cb3@huawei.com>
Date: Tue, 8 Apr 2025 10:34:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_193441_962867_47224F68 
X-CRM114-Status: UNSURE (   7.79  )
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

Hi Shuai Xue,

On 2025/4/4 19:20, Shuai Xue wrote:
>>From Catalin:
> 
>> James Morse is listed as reviewer of the ACPI APEI code but he's busy
>> with resctrl/MPAM.
> 
> These two patches have undergone 18 iterations of review and have received
> 11 'Reviewed-by' tags in total, but they have not yet been merged into the
> mainline. I am requesting further review and ack from the arm64
> ACPI maintainers: Lorenzo, Sudeep, and Hanjun. Thank you for your attention
> and assistance.

I will take a detail review this week.

Thanks
Hanjun

