Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2209ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhpPhNi4Zx3/6UZKrb/xpV5iwVuaKBA/NFjZxSosM94=; b=yPOgf9yrpKR5BdK4nv/oEcmDFC
	PgjpntaimoQwc7wFJZ4/7niG1z7jR50Q8f3tyaMpg9EooV6VvhJSbV5JX7/H+kX9kdug0RpYeRMng
	8AJ7scmbKAbHaq46F2zlcgMHriVUBgXwFNqyWjc/OydG0ABbRMAPX/moa6p7H1DwPn8+ij+Op0Hq0
	EUFta9Hicxv4q+CxlX1K4TTkpLDQ+zXnQ+p0eA8fnvBIVQ4gkTRv6/ZL6MBydT/T65NOA3eRET9Gl
	vtvYZhfdr1Kga9w1RlJIugcuhJ3hol0v3dH7B2xEv9vQC7khmp4PND8GOROzBqBj1lNopL4hfrUke
	Cr2NTtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDOX-00000004PZy-3owp;
	Sun, 09 Nov 2025 21:56:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDOV-00000004PZd-0phG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 21:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762725376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhpPhNi4Zx3/6UZKrb/xpV5iwVuaKBA/NFjZxSosM94=;
	b=B/goHjhJjVyCwcP9iFaF4CYkLjcDkdkI32jVbBOmShevlnD6XF43pUPQ5th8i9Sba8PbyH
	85lI4ApRa/McxVP4W6wzrN4MdOne2RdI/uIK+OmSCWPFH6RpliUQmEg2tHPXuUrtdLZAI5
	5fyF/xXpPhG0FoBXtzju7E9mQVJm0hk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-t0fLCKfhPqmAIqJ3VEanLg-1; Sun, 09 Nov 2025 16:56:14 -0500
X-MC-Unique: t0fLCKfhPqmAIqJ3VEanLg-1
X-Mimecast-MFC-AGG-ID: t0fLCKfhPqmAIqJ3VEanLg_1762725374
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f587dc2eso11698285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 13:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762725374; x=1763330174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhpPhNi4Zx3/6UZKrb/xpV5iwVuaKBA/NFjZxSosM94=;
        b=bKbcvIOijxVfsljcyGYarHlzrQjjkID1UwptItQC476js0TUk1Ur1LfQpVMCJaej7Q
         Pi38r19wiLk0rHuxYBibmdOW+riSTaSrRzSp2ZiBemo17MQQIbUHNjNTtirXWw9+bKwH
         ccCBl28dedMmktgOd4Y0LRUfVZO8ypASY4uASLq/MH0NvTehUU0q7zxOnwOsPgt9sPLc
         PljVGUawAjOd0jvbYlTyTU6yPBB5FaO8Rx+c2afks1fvBufOQgKit5ZH39KXM0YMSNrN
         z7/gc6GcDxgPwNvXxXtqnWgMX4YGW0Y3OI2ZrDSuG1v0DdsHE0d0E4xeU7NpCJBYaJxy
         VZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXy1rVaM+i+CrmgK6c4IRks59YA1dSe5xcGcy0HOGUh+E29gDUu7iRRtgKKub8OAu1kF1s98lJl1DI6Z+2dq0bz@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGj88JvHPRnE6On4inN7F4UFkiZcrdPvr3fa8ulM5kiAa9aXh
	mB5zcqVzaMiedb6ZvBpEb/LhYf2fZGkYPVBNEVV2ieaDCuEL/r552kTOYeMd3Ht8THMLup9jro6
	S4HCeG+Sf68yFL9VsGs91Z3Jn/I5qTHM7qSflisWfdn5zTCX3II5m8Rf+G0Drj1nN6sqdN6SaN7
	vN
X-Gm-Gg: ASbGncvL6pg52mZAT0FRZMmwFieRLZf8JgYf1A0KDrEESULtM5U1s4CjE1iCpBr7BRK
	Lc3bOi/fB3QKOS+gJ90SbM4Kntcbrq1pHBTEd9JOBBoE8nyvdh23rXGR02MZv2UJVb5DAUZm2Tk
	5U1/rXC6m2/PoIJNue/jrayvOYMiT0rehcXetsRm+zxmzy7fN1P+saRQbSy4KE5xXBCupvWYZIk
	8mAm2yTedk2RBUmoM8y3VwipFNQknfUv92IYjiHYKs4/dwwEO9eOd6Kvt3hsE0w7zljJ5NI653K
	zBP6oSLZQ/0Y7a7at+bc3etL8p+R/wtk7ztJb6zXL6ig0tZOi4N10UkhK4Gf57PvoZPre9pyfcG
	8XMZMh09/3a4V8lXyAGb12DLs3y8TYALg9QEK+As=
X-Received: by 2002:a17:902:da4b:b0:250:1c22:e78 with SMTP id d9443c01a7336-297e540b22amr85533455ad.1.1762725373691;
        Sun, 09 Nov 2025 13:56:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9zBiRG6e1hawt36vRNvVq/h+yltgd6w60xqY2Wc25Pn1yNF2w3fM8lwcZqfnQwOslEQEL4Q==
X-Received: by 2002:a17:902:da4b:b0:250:1c22:e78 with SMTP id d9443c01a7336-297e540b22amr85533115ad.1.1762725373347;
        Sun, 09 Nov 2025 13:56:13 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e3c5sm123508965ad.43.2025.11.09.13.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 13:56:12 -0800 (PST)
Message-ID: <c4abf4ca-9bcd-4edf-a291-4363f8643386@redhat.com>
Date: Mon, 10 Nov 2025 07:55:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/33] arm_mpam: Probe the hardware features resctrl
 supports
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
 <20251107123450.664001-17-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-17-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n3ruc9BiPPrNEbycKOIjrd41Iy8WDvWugdEiXtspg_k_1762725374
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_135619_343726_89B07719 
X-CRM114-Status: GOOD (  10.44  )
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
> Expand the probing support with the control and monitor types
> we can use with resctrl.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Drop the =0 in the enum (Jonathan)
> ---
>   drivers/resctrl/mpam_devices.c  | 149 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  33 +++++++
>   2 files changed, 182 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


