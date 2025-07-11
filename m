Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF881C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbZ9SvWH85rz7pzEHlCaiUlISqHPHEAa0deLhB06W88=; b=2jMJIdpiyGcyO6ibcr8sDiTrs/
	RMW/mWk6K61iYkCv9crpwhMu9EU1tHxXwYo4IadetPafCuzNGZ4h7DJrBriLJ2TvbzlQuIXUgcnoF
	SuXkTnh5+PpUjYVTVew8FRsN58m5Ff6XfhmX4l8kOt/9pk3NPqL8+tDxddPYY/0Prh1iJHByoXhXH
	sWT2Yic+UXQY0VXU1rrn8Xm465uhjDuSaukEqTRXWzy561m83aoLnhJ0IqYRey9wLZk+pwegsjct6
	Of1iAgGK25WM19QMcBoYNXR4Q3kVmbHJdEZI2ILdiqxMuT8pb8/0uwzRZHM0YZ1GtXFHvtWvHf3fB
	qJFILPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua69a-0000000Djpg-2Chf;
	Fri, 11 Jul 2025 05:18:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5bM-0000000Dgs4-0azm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbZ9SvWH85rz7pzEHlCaiUlISqHPHEAa0deLhB06W88=;
	b=K+Jcf3hgY/R7TcS9m1mZc5nK5c15IVYmCI+2olD7a1oaXnH0MHAFLCSOCx3rbk7eYYvQMi
	/DcDBECz29VTuzDxFLzyGni2b64rSI6Jnos6pKsbWuf6BMsxIb0ZGopjlypjvryRtHLfeZ
	gEJ6VX+04UwT0yiyUz7tDpYjvLXfXws=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-Rgyqu81hPpm-wERhqk8sDA-1; Fri, 11 Jul 2025 00:43:10 -0400
X-MC-Unique: Rgyqu81hPpm-wERhqk8sDA-1
X-Mimecast-MFC-AGG-ID: Rgyqu81hPpm-wERhqk8sDA_1752208989
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d66fa6so15900555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 21:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752208989; x=1752813789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbZ9SvWH85rz7pzEHlCaiUlISqHPHEAa0deLhB06W88=;
        b=gOo03hLEsWqmhcCblRKsthWdLVNfcJOQe9LNRMiKrtBj5P7j7/01KgP4xs5fRvJG3k
         btnrOQSlKqzk6BdJft7h75Ig4AlA89J1XBz8JxOfdqCmxQTMX4OProCHI5h1vH44G8pr
         UlCbbXCJdroIvmZIjnrTw75vg7C4Xlsd2xXTRMI5CgciTJW16/TVefS9mGQ7WJSBmCTY
         hJnk+0wz6gyTsa5EtfO4+gr73Bb20F1XDvE8R4dz7I5gslq9tfQtCj812hUHMuDJzTmR
         x8ThYDk3VlYGCxihqTry8NVtAzB+WKzZZCfS2cxGPVGyBIg6KJ9zo0CFVF3HTFin0mHp
         yXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUR2C4SYJMAdN8SQeETm+m4A/fxL4AlPvDfxGBrQ533XFc4oCdaeuG4dXLsSVLKMxQjAo81ofOfxtbMfUZd7ykk@lists.infradead.org
X-Gm-Message-State: AOJu0YznaoixOEUUv9PhoLmkW1Spa9MdxuFjLaguntz+wVt58NS3ies6
	q2Boiq6SJBYx96E3/EO8vX6Rk4iq8gzYyRQx/M23ony/g1mqDfm/pl8cCOuuMfxF7YWKke+TkbE
	qb2xVQ6j4z533sl7W8TyG+gHMZy/gAkw0iJZYNoDsLFZ0O9R4Pwq3PJh+f2RdzHJStxNpcMfwSn
	Sr
X-Gm-Gg: ASbGnctwBxfAKHjk3QG9aXUJrfsLNz0SGyPu95dZ/zie0UGxMV7WBObZr8O7qcuQm5E
	tme5347q6FXhiL6KMjP5ekFuEKu1M3TsZG5pkME7cRLH30cU8RJX5aVy84/pJjMx7/A/oDzEFbI
	kn2qf1dlKTZK4HoS62wQHaZ/NZFfeKnro2TLdIsEwsp6FTPMqhgzCsezB6FcnywBzZ18mr0MyPy
	TtCYJKsGFSkgqiFcuiHXFC7D6YmP8/H4vviBjww3Yy6CpYoj3W0oQ3fzkLjnJwhELoxZxC09ex+
	bGtjd8nC6h3oee6hXoANy6fnYLgxKOZcAAcJ4uxsNeaUX12ufCj4kVJ/WLsHneJ0c/ZjEFMcIpy
	7tsc=
X-Received: by 2002:a17:903:230c:b0:224:26fd:82e5 with SMTP id d9443c01a7336-23df0969b83mr12742495ad.48.1752208989074;
        Thu, 10 Jul 2025 21:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHizryBeLtJH7qq4pQR4W0x3Z2mnmKKxgw7ZpGypAdGcCGs32uL2u9Yrs/3xBqiO9BbA7w3gQ==
X-Received: by 2002:a17:903:230c:b0:224:26fd:82e5 with SMTP id d9443c01a7336-23df0969b83mr12742285ad.48.1752208988737;
        Thu, 10 Jul 2025 21:43:08 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4285d7asm36020595ad.29.2025.07.10.21.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 21:43:08 -0700 (PDT)
Message-ID: <c28a5c5c-19ea-47e1-8894-957169f9ca96@redhat.com>
Date: Fri, 11 Jul 2025 14:43:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: cacheinfo: Provide helper to compress MPIDR
 value into u32
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, WillDeaconwill@kernel.org
References: <20250704173826.13025-1-james.morse@arm.com>
 <20250704173826.13025-4-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250704173826.13025-4-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Egq4yx2WjNDMgzCUeRLOOwBMJhFa8OIrFVG5Mie7fbw_1752208989
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_214312_254245_8198C835 
X-CRM114-Status: GOOD (  18.13  )
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

On 7/5/25 3:38 AM, James Morse wrote:
> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest MPIDR of the CPUs
> associated with that cache. The cache-id exposed to user-space has
> historically been 32 bits.
> 
> MPIDR values may be larger than 32 bits.
> 
> MPIDR only has 32 bits worth of affinity data, but the aff3 field lives
> above 32bits. The corresponding lower bits are masked out by
> MPIDR_HWID_BITMASK and contain an SMT flag and Uni-Processor flag.
> 
> Swizzzle the aff3 field into the bottom 32 bits and using that.
> 
> In case more affinity fields are added in the future, the upper RES0
> area should be checked. Returning a value greater than 32 bits from
> this helper will cause the caller to give up on allocating cache-ids.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
> Changes since v1:
>   * Removal of unrelated changes.
>   * Added a comment about how the RES0 bit safety net works.
> ---
>   arch/arm64/include/asm/cache.h | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redha.com>


