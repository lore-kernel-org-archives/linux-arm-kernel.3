Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EEC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96MBiLIAT11qw69jnWPcKdKmmqG3+//p54YrohdRwbU=; b=k8n8JZmlXDPoTcAsxXhZakEIbJ
	2JuDB7H3w4wGIXvyJhK4dtiaQXZ4cxBNUiuYBwpLscM8qz2mBhw4zP9K0dnqqeQSGU87XSCjRxLjC
	h1k2rF53wWMs2RjuNzHZ52aEaEKLJexqpW4BDriC94MX39NBkaalp1tTgN13Bd31oQ85uK/lMN/Ur
	+wMiWW40lsgx2Pgs9mSBQOn7orCYtlHPfEl6mCTV5g9YdNNPGNBEbUzaNAfxWLvDlU3qh982cONVB
	51+JqwC35b1vdXgdmiaxG6clvdVxuEKW7jR1idZurttksFvZw5/3dI1nTEVc2Nr7fXFMY3np4E5m3
	7MVFYGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYp0-00000004pp0-0KHx;
	Tue, 01 Jul 2025 11:06:42 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYjJ-00000004ooA-15iK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751367644; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=96MBiLIAT11qw69jnWPcKdKmmqG3+//p54YrohdRwbU=;
	b=UvKlypRVd1+C4kxW0PIadUbC2hFnQMSLZ4SJZkt4wXoSKMdTPTHA7lBv9+F1YJ0rsErX/kxm0GjqTmg/4FExm3LXDo8Zp5LmxwHFfAlyromPUSj2NZWNGG+vKmMqeIa4ydXIVa7kyP3nbhJYyxiw7F8p2QIHpUqoaTn+U07N25M=
Received: from 30.246.181.60(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WgO.Cpy_1751367636 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Jul 2025 19:00:38 +0800
Message-ID: <6671c3cc-5119-4544-bcb5-17e8cc2d7057@linux.alibaba.com>
Date: Tue, 1 Jul 2025 19:00:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v18 1/2] ACPI: APEI: send SIGBUS to current task if
 synchronous memory error not recovered
To: Will Deacon <will@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 rafael@kernel.org, Catalin Marinas <catalin.marinas@arm.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
 ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com,
 baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com, sudeep.holla@arm.com, lpieralisi@kernel.org,
 linux-acpi@vger.kernel.org, yazen.ghannam@amd.com, mark.rutland@arm.com,
 mingo@redhat.com, robin.murphy@arm.com, Jonathan.Cameron@Huawei.com,
 bp@alien8.de, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com,
 linmiaohe@huawei.com, naoya.horiguchi@nec.com, james.morse@arm.com,
 tongtiangen@huawei.com, gregkh@linuxfoundation.org, jarkko@kernel.org
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
 <20250404112050.42040-2-xueshuai@linux.alibaba.com>
 <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
 <709ee8d2-8969-424c-b32b-101c6a8220fb@linux.alibaba.com>
 <353809e7-5373-0d54-6ddb-767bc5af9e5f@huawei.com>
 <653abdd4-46d2-4956-b49c-8f9c309af34d@linux.alibaba.com>
 <de5d2417-dc92-b276-1125-4feb5151de7f@huawei.com>
 <f60f1128-0d42-48e5-9a06-6ed7ca10767f@linux.alibaba.com>
 <20250428152350.GA23615@willie-the-truck>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250428152350.GA23615@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_040049_459567_6E61E254 
X-CRM114-Status: UNSURE (   9.40  )
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

 >在 2025/4/28 23:23, Will Deacon 写道:
 >> On Fri, Apr 25, 2025 at 09:10:09AM +0800, Shuai Xue wrote:
 >>> 在 2025/4/25 09:00, Hanjun Guo 写道:
 >>>> Call force_sig(SIGBUS) directly in ghes_do_proc() is not my favourite,
 >>>> but I can bear that, please add
 >>>>
 >>>> Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
 >>>>
 >>>> Thanks
 >>>> Hanjun
 >>>
 >>> Thanks. Hanjun.
 >>>
 >>> @Rafael, @Catalin,
 >>>
 >>> Both patch 1 and 2 have reviewed-by tag from the arm64 ACPI 
maintainers, Hanjun,
 >>> now. Are you happpy to pick and queue this patch set to acpi tree 
or arm tree?
 >>
 >> Since this primarily touches drivers/acpi/apei/ghes.c, I think it should
 >> go via the ACPI tree and not the arm64 one.
 >>
 >> Will
 >
 >Hi, Will,
 >
 >Thank you for your confirmation :)
 >
 >@Rafael, do you have more comments on this patch set?
 >
 >Thanks you.
 >
 >Best Regards,
 >Shuai

Hi, all,

Gentle ping.

Does ACPI or APEI tree still active? Looking forward to any response.

Thanks.

Best Regards,
Shuai

