Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44A8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNXq3wDHifJe4Q3Rx2GNFT4RtaD6McNY3lm8qZQBNJU=; b=OJo7C9NrotiZMECbKRAdGw5D2z
	7LO/o5gG0u3NkXIf2e2fhPwuzogLT+dZoQf8WD5vbL8+b1u8Q33tZmf0XSTx5N3yMuzD38WT3S3Iw
	MXVpzUd2f9MJBxRSkgAHlv+Um0b/VHPjBEOWhPNGQxb7gy8/SWXff+8oEUUbPo50tyEHwBLguO/2W
	ard4f0D+WEXJ1m8mfG+Fo77k7CV3vqhVei1NqNGr4TFZedKMXugHs4mBBFMo1xfTFnIjEQ0S2/lQ8
	tgkPPsGfFCD9NbGYavKhDde+QJwzSTY/OjqnSmndVwhg2hSOV5Q3vNcIUVGHUEmrSAXbWhg3bMWf2
	ox+z4cmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEPf-00000004T3C-0wDA;
	Sun, 09 Nov 2025 23:01:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEPc-00000004T2l-2fXi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762729291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNXq3wDHifJe4Q3Rx2GNFT4RtaD6McNY3lm8qZQBNJU=;
	b=H+e2b9U0GfxbHjYERTXUqyQc/UQJcw1FkG99H2ZW0+NLQ6X7Na2aChT1eOXQzEStSVh2Cy
	urdvqmdk+hiRrLl7ZAPTmmOhivgRxQnF8OlfVXug9nkCYr4GYGH2qPW5Kr4XpECZDM6OsY
	2obFdFltVspGY/NUCjgK1YSDM7jFiEg=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-JaFTfZehOnaVLEfPi1RmWg-1; Sun, 09 Nov 2025 18:01:27 -0500
X-MC-Unique: JaFTfZehOnaVLEfPi1RmWg-1
X-Mimecast-MFC-AGG-ID: JaFTfZehOnaVLEfPi1RmWg_1762729287
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dabf9fd0so17758715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762729286; x=1763334086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNXq3wDHifJe4Q3Rx2GNFT4RtaD6McNY3lm8qZQBNJU=;
        b=T/4klLZKmMC2od55K49rPq1q79xVnIXRcXXB4Rtkz+nDkJ/lF2RcTuLG51NMAjZNGb
         Nj2l2GmEnbaci/WTNj43wg8M3MTu2Mnxd0r8PP/31u6l8GsVBLLIwCr0xfxnkVY0gv3T
         2/j7WoWcy6x0FvvAkI/WYwCI7vcj/Z5IzA8vjbL4Bv6LcusKdYcpyFFFHyR7XMn+I+3L
         hepQGRXNKvrjbusL5PgnHAB22BZIhhdvNj+o5DDgNdgwmgd80szpJt1iBA69uGvJeI0O
         1NpUFjr9/RexWf3DOVs4jm0kc8JKrmDcUKh5VWmU8TrXRcUrEMK75BZzn7pcZUe6B53W
         AzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk+yryI4Du/k6xDuchcfnlCm4HdXJ5V2hk5mSPs0hIatJ3AcyP5fyRTn24vrQq3DVmX46qXKZALpvDFYpQPht7@lists.infradead.org
X-Gm-Message-State: AOJu0YxVWV1UeVfxj0sViPtV+fShFzM+tdzHNdKAXf6UjFVKLpz7ML5k
	LVGedvx+nVR5XkEFXif/1YlUsyE0XddtOSdGWD9JtYeNCNYUL2fsZIiv0cfPylLSaRoQS4iX3RV
	bj67hxv8OQOaPFLyryWuIubO2b5Pt62CXzv9R7jFFK+3UKd2qqU10w9/DwZuhleStkXTGKzKi0g
	y1
X-Gm-Gg: ASbGnctR2Joa+p8GPZI3W0fIOukg1my5Mm9IwHnoDsfxqJzrBzLuf121OScte6LFWwj
	86hz6BzYfH2H6kuTTavzDcXVWa0DWojdoqHpOrrO5HPB9mQNqLewBSeRtmQO6YY75gP4OzlgxgE
	dY75U0n6sBk7vYaX+zcJ/FIzed9T4T1XTMkF6p+yZ9oQvyc7D3LTqXSCysjrDVsbFfPxyNc0tU7
	1p0zN7CVPc8zlcmZf5v+RbRWW4P0DGjtKhDtni0MXIk0alvrMRD4Z8hCtlAeXNJlKnluEq0xqcb
	8LicujmYAueD1VuNq23L/N/rkvoSp8fA1aR2Dr0yNp+UaBkwNJF6zeq9CP4cUKRAj5a9R5uWdtK
	j9WyX7Vnq5DNVBvg7T74ETNHPfIXJfOoMpLa8DEQ=
X-Received: by 2002:a17:902:d485:b0:295:28a4:f0b7 with SMTP id d9443c01a7336-297e571abdcmr84706385ad.60.1762729286669;
        Sun, 09 Nov 2025 15:01:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH20FeHF0gFMlacoNiycg6+34EAdYTYpIb2C+WuBML627rkfNSdBeqyaZRt/itc5uhGL0htSQ==
X-Received: by 2002:a17:902:d485:b0:295:28a4:f0b7 with SMTP id d9443c01a7336-297e571abdcmr84706025ad.60.1762729286232;
        Sun, 09 Nov 2025 15:01:26 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c740b5sm125699615ad.70.2025.11.09.15.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:01:25 -0800 (PST)
Message-ID: <9c744ab8-d555-4202-905f-015a13c377da@redhat.com>
Date: Mon, 10 Nov 2025 09:01:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/33] arm_mpam: Probe and reset the rest of the features
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
 Zeng Heng <zengheng4@huawei.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-25-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-25-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 85WjMPYXAFyEKU6W0g4IFwo1dAE2iAw9usnPoaDomvk_1762729287
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_150132_773943_777B27FD 
X-CRM114-Status: GOOD (  14.68  )
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
> MPAM supports more features than are going to be exposed to resctrl.
> For partid other than 0, the reset values of these controls isn't
> known.
> 
> Discover the rest of the features so they can be reset to avoid any
> side effects when resctrl is in use.
> 
> PARTID narrowing allows MSC/RIS to support less configuration space than
> is usable. If this feature is found on a class of device we are likely
> to use, then reduce the partid_max to make it usable. This allows us
> to map a PARTID to itself.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> CC: Zeng Heng <zengheng4@huawei.com>
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> enum order and commas
> ---
>   drivers/resctrl/mpam_devices.c  | 188 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  18 +++
>   2 files changed, 206 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


