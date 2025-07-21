Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EA4C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqHekjFWRFaLGNBuVHNHkCNjUzegh0tFAMIuDDjHA1I=; b=fOxJc11Yx4KPzg3gwReUxDUMNP
	JH7mEc1kuLr+jI2GTdutWknSn4aC44CC5ffLi4iQLFqaPymzXenPGkm6CVO+qr0m5QLDkSfOUYg91
	WQC6qdtg0TuK3HcuAiBw7qcuajm0FhBHOo02eCUB6zADQlSemblM6Z+SixdKg1BlpnVxbdq9Uo2x7
	8IfnNga9fq5J1jfBBYDKv6RJ9pEDz/EUwFKcgd2yKxrtZvPmU54bpb59vj+uukPKt85a7GPfklcip
	m5nFPmH1tBKEIez0FMqrrtP1KlKsopFC7rMBHl8D8pSM1mTI17O5JhT6DnAjkKvbcqYH9AUOnd+q3
	jO3377yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmVF-0000000Gkhz-3xqG;
	Mon, 21 Jul 2025 09:08:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlzW-0000000Gfu8-1bjm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 08:35:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62427153B;
	Mon, 21 Jul 2025 01:35:13 -0700 (PDT)
Received: from [10.57.30.25] (unknown [10.57.30.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AA0A3F66E;
	Mon, 21 Jul 2025 01:35:18 -0700 (PDT)
Message-ID: <371beefd-2f6f-491b-8fdc-5fed44c9327c@arm.com>
Date: Mon, 21 Jul 2025 09:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] coresight: Replace scnprintf() with sysfs_emit() in
 sysfs show functions
Content-Language: en-GB
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org
Cc: mcoquelin.stm32@gmail.com, james.clark@linaro.org,
 alexandre.torgue@foss.st.com, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250719224547.2389642-1-chelsyratnawat2001@gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250719224547.2389642-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_013522_461268_781D65C8 
X-CRM114-Status: UNSURE (   8.54  )
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

On 19/07/2025 23:45, Chelsy Ratnawat wrote:
> Documentation/filesystems/sysfs.rst mentions that show() should only
> use sysfs_emit() or sysfs_emit_at() when formating the value to be
> returned to user space. So replace scnprintf() with sysfs_emit().
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
> Changes in v4:
> - Applied changes to 5  more files to replace sprintf/scnprintf with
>    sysfs_emit() and sysfs_emit_at()


Please could you rebase this on coresight tree "next" branch ? There
are conflicts.


https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git/log/?h=next

Suzuki


