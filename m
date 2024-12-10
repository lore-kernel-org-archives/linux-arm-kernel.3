Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F837E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lCxHXRPw+uas6hTPKOniJ1wOd7+YLr7KZwvXvajpbo=; b=QWIIopcPUZxFauQHV1EdMElHgt
	XUDxeSGaMjt/QhCJHEVCtw5/tu9EMl22B7nDcuj5VvJv6TbXa90Ud5chE62dfdmK5mkyp7o8b1BYD
	PsDG4bMHX43JIqi3/rUICCCc2wE3f99ugE+aSSECoI4sQKerugLBak6AVzfh525AjkBKlV056MjY4
	B9PT5ZpUo6MGeSomdqb70f/9AYtNMM4deN5qVBgRtsDuWESPdHvsz/89GZW5G0WdQR0vl4PTtZN1H
	LnWpItsBNmqSNNFJ/ivC7qOYHqlDLDjEj6E//0iJluBJdZLn5qhUkXx1sKIDWA/PEdbhPvlnfOMHE
	dELpgY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwYg-0000000At2x-2ejK;
	Tue, 10 Dec 2024 09:29:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwWu-0000000As9Y-2ZfC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:27:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091D1113E;
	Tue, 10 Dec 2024 01:28:12 -0800 (PST)
Received: from [10.57.69.139] (unknown [10.57.69.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB86D3F58B;
	Tue, 10 Dec 2024 01:27:38 -0800 (PST)
Message-ID: <accd59bd-27ff-4a22-b3a5-c2705a0db075@arm.com>
Date: Tue, 10 Dec 2024 10:27:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/16] mm: Introduce kernel_pgtables_set_pkey()
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 aruna.ramakrishna@oracle.com, broonie@kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, jannh@google.com, jeffxu@chromium.org,
 joey.gouly@arm.com, kees@kernel.org, maz@kernel.org,
 pierre.langlois@arm.com, qperret@google.com, ryan.roberts@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-9-kevin.brodsky@arm.com>
 <20241209100335.GH21636@noisy.programming.kicks-ass.net>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241209100335.GH21636@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_012744_701566_E4837E86 
X-CRM114-Status: GOOD (  12.40  )
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

On 09/12/2024 11:03, Peter Zijlstra wrote:
> On Fri, Dec 06, 2024 at 10:11:02AM +0000, Kevin Brodsky wrote:
>> kernel_pgtables_set_pkey() allows setting the pkey of all page table
>> pages in swapper_pg_dir, recursively. This will be needed by
>> kpkeys_hardened_pgtables, as it relies on all PTPs being mapped with
>> a non-default pkey. Those initial kernel page tables cannot
>> practically be assigned a non-default pkey right when they are
>> allocated, so mutating them during (early) boot is required.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>
>> It feels that some sort of locking is called for in
>> kernel_pgtables_set_pkey(), but I couldn't figure out what would be
>> appropriate.
> init_mm.page_table_lock is typically the one used to serialize kernel
> page tables IIRC.

That does seem to be the case, thanks! Hopefully holding that spinlock
for the entire duration of the loop in kernel_pgtables_set_pkey() won't
be an issue.

- Kevin

