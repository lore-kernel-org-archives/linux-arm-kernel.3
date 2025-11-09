Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34063CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIWvhRHintsgUxq7/kw7iMAKxqqXku8h0+Og23yX6Gc=; b=ZhmzHHYncAgRUbXTQzm4IwIZmw
	0JpcqeLtuZ2Opfj3YRXztJag+hDgLsWjHGEJtrNpjpWeWakNN34R0b+4W/sgsdkN+cEf5+NOtGwTj
	LhBKDFIs64u8UIF9+0KCdUZ8UeQjL4eFSJQ5BomfdKAnEXGkpXUq7WlHJD6cAdehNwWI6uGi4eJaB
	PAMXQmL4GFGpyIJdSv5Cv/pTEODo8MsOqxXwlF0u87K8a7SHsakfiMvgElr5jNuZ/XO7NdZA4uyLC
	9uEoPuOCl7nMScBOwzdXzO0tb8ZjdER7zEkCzncJr4sDkSID71AYcK7jmGIV7of3+X3rDnu6YxCxZ
	tet5KeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEe7-00000004TmN-07WG;
	Sun, 09 Nov 2025 23:16:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEe4-00000004Tli-3CVA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIWvhRHintsgUxq7/kw7iMAKxqqXku8h0+Og23yX6Gc=;
	b=E12mA6h+H0ovXOgBf/9JR/X/0tt/rCUWeufxydgbt4eCl7oEnZlIalH4e6svIUkGg1gA/B
	CfJ/OnGiH0bPzfFv6Y1b4daXlW7Rn0TEz9jiGlNqWy4004lJDFDeWCt8ATJT1ioVccmU7C
	Y6eYxuTr0ed/cuVM4eseLcWTnkUVe74=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-yjq3Zj06MyqadlZM4G-8ew-1; Sun, 09 Nov 2025 18:16:26 -0500
X-MC-Unique: yjq3Zj06MyqadlZM4G-8ew-1
X-Mimecast-MFC-AGG-ID: yjq3Zj06MyqadlZM4G-8ew_1762730185
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297fbfb4e53so14047855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730185; x=1763334985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIWvhRHintsgUxq7/kw7iMAKxqqXku8h0+Og23yX6Gc=;
        b=nvPrZUEpFxa21Kqiyp49p3jpjk0r+zteqsCDBh4ErbuDYDtwQMfBqeY1KTDfV2TwHZ
         eWcv/+9g51PdDhp+fNO1FHdWUyTrz0ip/9UHWeaD4ETZatv9eigYEXc5amLJA3sHgppO
         VVVdt0tC5qvUr4pkZ22L+dprwBRdRM87DJMFEzX/a/ioGnWMnNaV1bq+eyfj+elGK4z7
         e+EuW89bdL9akdCzIgjG38opdjQTuzTuYx9kw0ejUpGK3FE2ldwX99weRc1kMQDaUfPB
         6W9SvvAN0h7rZKANPh6z+rqdWO9HGUCoDlFtS2OH80xJCDiI7x6IASFD2OEs9MPFSlvn
         Ma1w==
X-Forwarded-Encrypted: i=1; AJvYcCVEBKqreRWv3ana//jYicJNQwx5+dORJXCUi0Hoc+zoJnDzZvb14it2atVbIpNYcHanIdJAHBOm2nvel0yvWOOc@lists.infradead.org
X-Gm-Message-State: AOJu0YyEbchoLvzKiQYWnR0UFHrv8dPt7BOKKE2b7l4EAvZ1cDTX4rAJ
	h4arWyfmDrxnzteZwoVxix7W4x5gJa18djEh3FoFgMBgmnqSIu0NLn0gSvNjHSzKjstLfE0aFzk
	lc9Cw87cI49nW8dJkUUzcKMh9zh9cG/Vyry4llais81a/Za6vhM41I/yJMAfVQfGLdntVQiGQNs
	J7
X-Gm-Gg: ASbGncvu7sx/xuExofZ20aGoH8PrQe79vt70eFfE+QW97biQu2uzMl3Q3rIQoCsinbx
	7hEiOn4CNhc/FdTPs7ICtwwatFvT4NArpaNv51IVzY6Wh7GewniKideqPseqOD5Q/tJZOmW37lZ
	96SEHOkfHARM3d3b4r5RauBjfXwa4B3VRsCnH4N0/9a7uWl7e1SGbN5iXVYluP3BISyvwfJixlK
	GMobM2dcnLlTpv6OaUV8tARUGt4/nuFOgtAXo7WHs6Fr4kLcDdEmJWHx2/FK7S04cEwpvqbD9xH
	GlvrzB107s/p98KapzKx39kBT1ChOEsUG1cwcstcnNuiuCmIHueEx5uNtdwzE/+MkW1Jws3SrzX
	QuatLdiZY77864utnIDgifcJCM4SWV0n0fhKGgww=
X-Received: by 2002:a17:903:3ba4:b0:294:fb47:b623 with SMTP id d9443c01a7336-297e5619e35mr66189605ad.11.1762730185131;
        Sun, 09 Nov 2025 15:16:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW0fX3tz982fZEVFcVhHyjU6z81+PepIDK0pHZvIUFcQbTO7ihNToj0nHl6Ty3e3/m1+e+yQ==
X-Received: by 2002:a17:903:3ba4:b0:294:fb47:b623 with SMTP id d9443c01a7336-297e5619e35mr66189235ad.11.1762730184748;
        Sun, 09 Nov 2025 15:16:24 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ccec04sm123053925ad.102.2025.11.09.15.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:16:24 -0800 (PST)
Message-ID: <58d05fba-d678-4564-beba-45f667f9e975@redhat.com>
Date: Mon, 10 Nov 2025 09:16:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/33] arm_mpam: Consider overflow in bandwidth counter
 state
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
 Zeng Heng <zengheng4@huawei.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-29-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-29-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _UROJZBWxA2wo6TIajvfbQvfIc26odESLJU9qXlAc8k_1762730185
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151628_880900_9588ADCC 
X-CRM114-Status: GOOD (  13.10  )
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
> Use the overflow status bit to track overflow on each bandwidth counter
> read and add the counter size to the correction when overflow is detected.
> 
> This assumes that only a single overflow has occurred since the last read
> of the counter. Overflow interrupts, on hardware that supports them could
> be used to remove this limitation.
> 
> Cc: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h |  3 ++-
>   2 files changed, 24 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


