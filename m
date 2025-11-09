Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E8FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dubJJZUeDuyLgjxuOinZfNrgxD8y2GPrhW+uof5Koyw=; b=m62ghnPSJJV5fW8+v/cWfo5Ibp
	TX30lpBCr/kb14dc4qGQM1DAH4oD6YcYyfdOgMFBZmh/sTnuf2SffadDJUtSjaZ5M2twiBNw4OnNq
	4+Xc8RJlugUHeq6C1ggDX5Bn0szcLV94LWywuID4BpfvlvW3Z5wYK5o5OPg2ytQbF7RgZOgRbyyD5
	Ng/hFse9QXd0Bmtbj4SVwD8ryaQzc2uG5tpXg7e60ZPB96e0Vkuej7ueQH4FjI+pxlO5X6WEqQVRK
	FVfwF02JFj2LkNKIXp/whKx9NpPmHSv8AV+C61Ux7NOZrikH+6FqDu0mYhktq9eLsxX+VLPuBVBar
	cl1CrW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEhP-00000004UPC-3Eec;
	Sun, 09 Nov 2025 23:19:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEhM-00000004UOn-2JeJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dubJJZUeDuyLgjxuOinZfNrgxD8y2GPrhW+uof5Koyw=;
	b=FErSx9sPGypUaeuMI0f/VUg4KFa2c+yfU+UrWGcvfu+VWRKRMjLdCDshJmUe6M4q1PXk53
	Mbh/CvJR1i3zUSULyn0lG3vhyjYKwpvKCpO52baPiwy8YBME4lWqhleYGOPM9tkRT9QwR9
	wH7wIFBdolReZHgFAKn7d6rIudG8+Rg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-LpGResD-MhSv9yC8fC_VKA-1; Sun, 09 Nov 2025 18:19:47 -0500
X-MC-Unique: LpGResD-MhSv9yC8fC_VKA-1
X-Mimecast-MFC-AGG-ID: LpGResD-MhSv9yC8fC_VKA_1762730387
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso640706a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730387; x=1763335187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dubJJZUeDuyLgjxuOinZfNrgxD8y2GPrhW+uof5Koyw=;
        b=av+gn9K4qTItuWI3eDwm7kDrCyEsty35ctt2KoLbfTq/3gYYjjhNlzy/7Wy61//GSJ
         eObbDxSvd+mTe9h33v1AwftXMyTSoOpgmHHhm/i69RZbReT9x8bRrtCr8O+/h8BsoP+9
         9TOnLldHVEfiyu4VaGHKGqxzr/bwnuCedQGFIFnJkMrVuc5Osn/H9HY+s+JF5y5xtVo7
         H8Km9KTDQQhZUIcOPteLks/EBcWguVHcljIAPucQNBxAZsGzcVUr3uiUcWp+WKx21Tou
         C6qenCiMSB1vVYe+p0vOvdC2c9ap5tChsvhdu+sDlo/gUNhX3LRb/2Udje4Kx4Yz7K23
         Unlg==
X-Forwarded-Encrypted: i=1; AJvYcCXh2NXWJaM953rhgA5oxAaT0yfzmHUWppHZF6fBjKDuZ0vbiTgmIwTGlchitmWDX0wk/zhau7wpijozBhENSnq0@lists.infradead.org
X-Gm-Message-State: AOJu0YxAF0r7rY2eDob3r0I+lmzWySVAfZtw8yHayr0zDPJhEHNLUg9/
	+SE2f+ceylDRF44wU9Apu4vDhym3psJ8b2rjBOKA2+j9wvfJZbRGhhzI4QWhdD/BRmXA7fSp3bt
	CGugYrZ4aC8X0Rl7gMliXVa112xfikq6Yn89gddb6UcUgO0zXhYDn6GtirFfg4fQh1K7U43OH5F
	K1
X-Gm-Gg: ASbGncsfmo1cSAHv87CnB2Fr7ZKb5v8m/+IIfXYrAmux66HaJrdSmBEWwy9FdTnJYZF
	D+VjU1dYzSn0GXKSmRP20koPZ01CJjSo+VIuP9Iowb0i3znc1mF0j4RZDrXApYjoy9GWf1qER/K
	NAMnWAcJ9yEdfGIDX+fRBHJ0Ypb4yL/SLMg1004GDNySk+JG7XSw8YfE3yC6LiPssJTzOqtMLEm
	th9V/pvouKV4OUl1Bq0LB1pKkulg53FmEF714OkBql3RXEl1yrnWrMGU6VU9h+lvM6+PXmJI28E
	LMfdHrzDASmcN7ZzZ5VlVFZxIZf570W7siHeKF1Aivr+crS5j6YnpN3gBr7mErSP/sht7LpR2Q+
	wzUMYgsNggml8EO3krcA610Mc6LvEKksm/2K4vKU=
X-Received: by 2002:a17:90a:e18b:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-3436cb73cc8mr6923428a91.5.1762730386885;
        Sun, 09 Nov 2025 15:19:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLmBsEtvmrbu2EisKkS/8V7PL4jymEDPy9iS1fiQDMzqvfm6s80YMHDPtL+IUqN7rphhGZ3A==
X-Received: by 2002:a17:90a:e18b:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-3436cb73cc8mr6923390a91.5.1762730386503;
        Sun, 09 Nov 2025 15:19:46 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68ce9e9sm15157570a91.9.2025.11.09.15.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:19:45 -0800 (PST)
Message-ID: <f7947bab-46de-41e8-8e4e-f18f163b9e5f@redhat.com>
Date: Mon, 10 Nov 2025 09:19:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/33] arm_mpam: Add kunit test for bitmap reset
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
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-33-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-33-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W70G2MpQoFfuw-M-JqGA3kaEFJVG57I8PBdsEhUDMag_1762730387
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151952_708477_B5D9EFBA 
X-CRM114-Status: GOOD (  11.80  )
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
> The bitmap reset code has been a source of bugs. Add a unit test.
> 
> This currently has to be built in, as the rest of the driver is
> builtin.
> 
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/Kconfig             |  9 ++++
>   drivers/resctrl/mpam_devices.c      |  4 ++
>   drivers/resctrl/test_mpam_devices.c | 69 +++++++++++++++++++++++++++++
>   3 files changed, 82 insertions(+)
>   create mode 100644 drivers/resctrl/test_mpam_devices.c
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


