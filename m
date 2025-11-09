Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFCECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKM7r/eHjTb0/Gou42j2GR7IW3Ghd2XntavEBYW+1Ys=; b=hAqR4y7nMHJRZjsqK2XQd4nZDK
	wZrtBmSNH5gCPCq26TeFR6e6CIiOMOFdBRP5Rhhy8HiJYICw3LRQ9OrElq3vto3jfzMK7glmdJbWM
	sXbf4HI7oA5ZoJsoS6VA3wO9cOb1SP2m9I2CQkYEyYK9nRLcGLZFl7o6omuLq0XBv8HzXcEtoTuYi
	mn+2Nen5kcvI/0J4+wATzrEveUWFLE/oHBlw5soA/nwKgBN2stj6uHni9VVmyY2V1SjzGxt60sUfZ
	i3AqsgXclushfsSJ+WhPzFeAq3x65GtM+OaGGxzxrv1Aj9Y3+F+yFN01Mo6q1AM8AUnRatQn1fMT+
	drN0tkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDkg-00000004QzS-16Rp;
	Sun, 09 Nov 2025 22:19:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDkd-00000004Qz3-2UC8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 22:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762726750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oKM7r/eHjTb0/Gou42j2GR7IW3Ghd2XntavEBYW+1Ys=;
	b=OvFz2vBNQSBAiS6u3tdJiFcbI9Zt4Y1FlZPFJZz9sx5TIkQ7GgFAt8smzjn5NE7bcN82z4
	ey9QtcNpJk1bT6Whx47GBhS15O5gxADZ6+EQoBj9d7dKIVW5sy1lWZuOuGuAzdJ6ranuVW
	V36sLMa6zDvI/zyMRHIlyY770AuvAdA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-Cl82XZiANuCr07c2iLBe4w-1; Sun, 09 Nov 2025 17:19:09 -0500
X-MC-Unique: Cl82XZiANuCr07c2iLBe4w-1
X-Mimecast-MFC-AGG-ID: Cl82XZiANuCr07c2iLBe4w_1762726748
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aeb762bc40so1901186b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762726748; x=1763331548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKM7r/eHjTb0/Gou42j2GR7IW3Ghd2XntavEBYW+1Ys=;
        b=luQL/b1mgeMCicHlcudQrlD0oxDA3+eeN3L+LUR+b7wb9Q9S+vhmSZBU4cFFj5mJFP
         8XfxuXxC0Ehc+WbxzERKwShP0DMYjdZwef8FLAzl6MxrXkcHW8H+xsnnPPPi23TfOUOA
         JdxXW1DxvL4B8XIB47N6BDNFtf8TpHdrpiuNR/u00YTJUDn2vzE9vbOUP+fSWHo7aXJg
         jofHY442iLhl01Oa9byIBqmUes6kSRW9YgdqJci8n7rXe5IMgQsupbsbXmGZ5iEdOhCv
         9QfQgf5SlSvcggzNQGmA0dfLiC3Vs9MZWEZw+ivOOyidFvmk3TuNyvUmG1DkhsjezgLg
         ofeA==
X-Forwarded-Encrypted: i=1; AJvYcCVjt8/txTIdjHXHMJq+/RD9UHt+MksPA4PFIVmqQli5v8wbVFj5nqoldXuZMG2GD2Mwt3qBuKs6FgPmBcf1+2d0@lists.infradead.org
X-Gm-Message-State: AOJu0YxswWUlHoZNogwNOlZxLqF8EWhJavSoSZ12gvo3sW8OyvVaCNSp
	AZvQWEASZacphwye/WjNhO7GukiPAhWoVfn24tkumVf8w5QInbSpj+0EGd1ECh9ChcMa8DQo/bd
	70gGEJWbHPmLMlDIPOK91iHpC3EcpGAT9d8e28rSeZvTyKGVfV4nv2QZUrivlBj5lOCU7ZErw7d
	4z
X-Gm-Gg: ASbGnctjBMX8wlAIQ+HyW3F2bPKK+0MYYeerUqOkwso6kUpkLNE36v0Ozr8BwvsB5cb
	XY6bRBGChyn1wIf+Dxplov2YT6TUSBsWNIKRgSGUhK99anyeQE++ksHl/limtVaPvf6Z4HJzphD
	o2w06bX81UB9lkvawPqIlFdIoJlv9dBNa+QNVhV1s0cPB5r8EoRq29quyetRw/UvB9C5PqFrBvo
	VNMwLHSF6PSbSZZHioD8AM3T7d4NA3Jfn6vpYDVkT30t4276KkK2c9KXr+DjpXXPZNKCnDp3nqs
	njoppe7ezkXltMK7qTqA+R9qAm82SGu1TOQTzJ7Hd8zlaKvLkfshmK6ewO92j0YQ3OV4LQRavGF
	Ft7w51WeOT0xRi7fc86rh0XCuegOUl+tbJ7SVqY8=
X-Received: by 2002:a05:6a00:1745:b0:7a2:882b:61b7 with SMTP id d2e1a72fcca58-7b2271831efmr8565489b3a.32.1762726748080;
        Sun, 09 Nov 2025 14:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3MMgt07dX68/canq5/Ysh2apHwPj31+tbrluUxA4S3hEDS8XL1dRUO8GV8pg/gcyqccPa0w==
X-Received: by 2002:a05:6a00:1745:b0:7a2:882b:61b7 with SMTP id d2e1a72fcca58-7b2271831efmr8565468b3a.32.1762726747711;
        Sun, 09 Nov 2025 14:19:07 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9632e15sm9508628b3a.14.2025.11.09.14.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 14:19:06 -0800 (PST)
Message-ID: <9ae6ab72-e714-44d5-847f-f2b1253ce4fe@redhat.com>
Date: Mon, 10 Nov 2025 08:18:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/33] arm_mpam: Register and enable IRQs
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-22-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-22-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UdrJ35UnUQcWdsGb5LLf2cdvQdr_HuW3YBwgshJtsXw_1762726748
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_141911_722505_3B9174CF 
X-CRM114-Status: GOOD (  16.24  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Register and enable error IRQs. All the MPAM error interrupts indicate a
> software bug, e.g. out of range partid. If the error interrupt is ever
> signalled, attempt to disable MPAM.
> 
> Only the irq handler accesses the MPAMF_ESR register, so no locking is
> needed. The work to disable MPAM after an error needs to happen at process
> context as it takes mutex. It also unregisters the interrupts, meaning
> it can't be done from the threaded part of a threaded interrupt.
> Instead, mpam_disable() gets scheduled.
> 
> Enabling the IRQs in the MSC may involve cross calling to a CPU that
> can access the MSC.
> 
> Once the IRQ is requested, the mpam_disable() path can be called
> asynchronously, which will walk structures sized by max_partid. Ensure
> this size is fixed before the interrupt is requested.
> 
> CC: Rohit Mathew <rohit.mathew@arm.com>
> Tested-by: Rohit Mathew <rohit.mathew@arm.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Add tag, thanks!
> Whitespace changes
> Use devm_mutex_init()
> ---
>   drivers/resctrl/mpam_devices.c  | 280 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  13 ++
>   2 files changed, 293 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


