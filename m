Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A340CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/9kegtvGI85FbYytS8xZBaM4nlVB/SUwX8xXVlw7VA=; b=HKRBKZ7GYxEDuAy8/Dwam+LCK3
	wdKk1SSWOpQ2CDu9QZ3A1qjVuQvbayN/vFMAVdyetPK+82NixrPUsAyGpCNZWokNJmpo2em3Os+k+
	hTiHflVOeNVsZ/hiHidiBJUwUq64ZoMJf+tRmM7g92MxyeppFyd7w4GUOEqlzcPrVAfewXU4NzhZl
	Tso+MI1aVhY2ZFkF1WXdKYMFRp6JfUmBuFbwZFXXce6ulLwBO3/SKW60iVDBY+Z2COlvV4SM4Tj9g
	oJn92VYmjfPj1g+hM4xHzeqloXrcDSU+TFo15O6rVRm7mnqzP4W2nQYzmPUze4TReEf8nVPVtDIJZ
	kXiqoVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNe-000000090D4-0N3o;
	Fri, 10 Oct 2025 16:54:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNc-000000090Bo-2abB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k/9kegtvGI85FbYytS8xZBaM4nlVB/SUwX8xXVlw7VA=; b=m4owQZzPuW9+OilNokEg9HepMe
	pYhOF9bycDOezr/dweSHgFsqkJu8EDYiGnwqv8aGnyQ3xj3hm/B8ytocRJQgg+LPQR0yCrDlVj+SN
	C7MEN0LX8EPZmOFl0PKOjC22nXq/Rz+4/z2XUewEY7UGUdAhaI3UWoSH8O6yLShj2TIB4UOAFXiWV
	+m/l1YemNLnn993LsUUBeZv8BFK8Z3fIv4egXACPH/9YJzxpp2etlkEXGcN08lBVvRpjvfGlgsU2H
	8CUBg4q3CAlsONlrzxm+VSVa0N4PRFuqgGVhBwSdGp8TS1ASysmo3OnPqAPq3Y5mIa3eFe5P0726L
	QR0tjP5A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNZ-00000002J5H-1gQE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:54:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EA2D1596;
	Fri, 10 Oct 2025 09:53:56 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFA4E3F66E;
	Fri, 10 Oct 2025 09:53:58 -0700 (PDT)
Message-ID: <68e9365f-17d5-49fd-ad58-e09674b729b6@arm.com>
Date: Fri, 10 Oct 2025 17:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/29] arm_mpam: Add kunit test for bitmap reset
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-29-james.morse@arm.com>
 <848050b3-65d7-4caf-b093-7145eb782a7c@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <848050b3-65d7-4caf-b093-7145eb782a7c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175405_745831_9450BF77 
X-CRM114-Status: GOOD (  10.93  )
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

Hi Ben,

On 12/09/2025 17:06, Ben Horgan wrote:
> On 9/10/25 21:43, James Morse wrote:
>> The bitmap reset code has been a source of bugs. Add a unit test.
>>
>> This currently has to be built in, as the rest of the driver is
>> builtin.

>> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
>> index c30532a3a3a4..ef59b3057d5d 100644
>> --- a/drivers/resctrl/Kconfig
>> +++ b/drivers/resctrl/Kconfig
>> @@ -5,10 +5,20 @@ menuconfig ARM64_MPAM_DRIVER
>>  	  MPAM driver for System IP, e,g. caches and memory controllers.
>>  
>>  if ARM64_MPAM_DRIVER
>> +
> 
> Nit: add the empty line in an earlier patch

Fixed,

> Reviewed-by: Ben Horgan <ben.horgan@arm.com>


Thanks!

James

