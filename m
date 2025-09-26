Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6545CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFy5Kagavb7weVQ8JkDJqX8Ea2jchIkzHw+JAA52LGw=; b=R1r6ZNjF1al8LlLD1RgK3Zl2Zm
	x3pPr4QFFCWMQMhWTPpac+Hp58rU+fDCpEEZKuIEVrbDexs945ElgYRljBhZ2dKVdraVJyH+DRr2Y
	1FQmV3Z/YR54mI0FjUuR0Gj2QcH4fnmKUq/74Pu3umyeAmtd0VdYFbVDcI3Gh3WsYiFzPAjwkF20j
	H14hY0iSwH3aBgF1+fAvPwQMYGKY6zPkAYAVYvP4XqspkXGw+evbJ5KP4N+ejLsgGaiI9gjKA6SLt
	4ynuCEDji2CVR2abBKFBM25OmNC3XTZiORw17NCU+IlayOHO4qSTsQn+0/qfD55+F94dZlt/6xT7z
	L5hMrZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Ccv-00000003Mmy-41xz;
	Fri, 26 Sep 2025 17:53:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Cct-00000003Mm8-2Xvw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 17:53:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63E891691;
	Fri, 26 Sep 2025 10:52:50 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 998DF3F5A1;
	Fri, 26 Sep 2025 10:52:51 -0700 (PDT)
Message-ID: <88f45c7f-9769-478b-9abd-749ec8f8d43b@arm.com>
Date: Fri, 26 Sep 2025 18:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/29] arm_mpam: Add the class and component structures
 for firmware described ris
To: Markus Elfring <Markus.Elfring@web.de>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Amit Singh Tomar <amitsinght@marvell.com>,
 Baisheng Gao <baisheng.gao@unisoc.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Ben Horgan
 <ben.horgan@arm.com>, Carl Worth <carl@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
 David Hildenbrand <david@redhat.com>, Drew Fustini <dfustini@baylibre.com>,
 Fenghua Yu <fenghuay@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hanjun Guo <guohanjun@huawei.com>, Jamie Iles <quic_jiles@quicinc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Koba Ko <kobak@nvidia.com>,
 Len Brown <lenb@kernel.org>, Linu Cherian <lcherian@marvell.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Peter Newman <peternewman@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Shaopeng Tan
 <tan.shaopeng@fujitsu.com>, Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Will Deacon <will@kernel.org>, Xin Hao <xhao@linux.alibaba.com>
References: <20250910204309.20751-9-james.morse@arm.com>
 <5a80cb91-6095-4f44-b576-53badc4575f5@web.de>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <5a80cb91-6095-4f44-b576-53badc4575f5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_105259_690074_24D605F8 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi Markus,

On 11/09/2025 17:30, Markus Elfring wrote:
> …
>> +++ b/drivers/resctrl/mpam_devices.c
> …
>>> +int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +		    enum mpam_class_types type, u8 class_id, int component_id)
>> +{
>> +	int err;
>> +
>> +	mutex_lock(&mpam_list_lock);
>> +	err = mpam_ris_create_locked(msc, ris_idx, type, class_id,
>> +				     component_id);
>> +	mutex_unlock(&mpam_list_lock);
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&mpam_list_lock);”?
> https://elixir.bootlin.com/linux/v6.17-rc5/source/include/linux/mutex.h#L228

None! The bit of this you cut out is a call to mpam_free_garbage() which calls
synchronize_srcu(). That may sleep for a while. The whole point of the deferred free-ing
is it does not happen under the lock. The 'guard' magic means the compiler gets to choose
when to call unlock.



Thanks,

James

