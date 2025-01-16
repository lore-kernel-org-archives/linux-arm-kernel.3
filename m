Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9592AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ktk2GUjb3uuEtg/gq7dyWK4NYCCF/Z75QRIh0J92azQ=; b=W/Pg0LHItpUnhzMXloNmEzg+zV
	CQ1ccxPjcp6fT5alPZZiqtZtTeZ8A9JKZnKZuAXuuSAwxiU8wjpvadFsNkYd2GC4PsC/q7WRpwA/1
	oMjnY5+CM99hyp+MphZFwecvfD8FjyhZ4dOJ23ioHIB1ZAlvPOdv3yDAX9jVDZFtLo3gyU7/r5kyd
	6rN6RniO7+EBqrTfnGb3/IVH/oMFSr34TQmaBUdv+l7IsmN0c603FLoftD4B8D26MwrdfS+bwZLbl
	508oyDuqWfMNeM2KQDgRP4m9/oKrDBG2+aAh/42XgQVL7KhfLw9ZqDo44n30aWVjBObklyi8UEIzR
	DSCAC/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYU42-0000000FkBI-16Rx;
	Thu, 16 Jan 2025 17:53:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYU2Z-0000000Fjyy-1snK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737049940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ktk2GUjb3uuEtg/gq7dyWK4NYCCF/Z75QRIh0J92azQ=;
	b=SmpxbsEzOU5qFoCkBIqyeGTlakXk4RO13pSiruwg9FSaPYRvHDmy2PC1Hm782CQZsRKLe8
	qMDLb/6uXqc4gliPJ0Uh8XdrW/a+pG5jTR3KUo/mPY/Bsu0WArbYXxZkF/L79DhIjB8cTQ
	mf+8aNtrxCDFuLidXPqsfPWlsvryIMk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-SQqfk-PrM3-aIL4CuXx_LQ-1; Thu, 16 Jan 2025 12:52:16 -0500
X-MC-Unique: SQqfk-PrM3-aIL4CuXx_LQ-1
X-Mimecast-MFC-AGG-ID: SQqfk-PrM3-aIL4CuXx_LQ
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d895f91a7dso21922286d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 09:52:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049936; x=1737654736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ktk2GUjb3uuEtg/gq7dyWK4NYCCF/Z75QRIh0J92azQ=;
        b=jKAaHyx8HwE9HDlEO+KS01qDmtYB66PfEbsn57n/mPfHQ3jtvrBu2bTcdaAU/GUv6o
         tf8XFoqXyDy2EoAhhqKHRfUEBWgpXSlbZLLfQ7KN8WprH8fgjvYAfcuxid2NaSym6kKV
         bDpg86ZDIDT3aCT5ghNbhG9Q3aglrKNsPoY4dcFzQPubxIwpoasVwKO/ZkkbDwXdvSIc
         73FQCkwNS8QLdZ1fisTWtYeMrF+LGiZ3XG3249joU7IVUUltdCka45ng9RVKtOLynloV
         q26s1iApCh6Al9qS5V9MSybfNbDq3ZUVuiWC5JxXuHRQF3tcHOD9CpFABw4S6eYWG/s8
         tUng==
X-Forwarded-Encrypted: i=1; AJvYcCXRwFsgBLCY9M5AMQMUPtHA7VjSnlPvIo6NVPLkf6++oh9YbuFdk3jmGPk2jYmnGz6QCUfTu733BZ3StjXUkTI4@lists.infradead.org
X-Gm-Message-State: AOJu0YwkLWO+Ubg5XLAbHxWWzuY4ix40eJLLE3rcdpZGuzzZ2lW/sO9t
	J+wi/209SYc0PSGnwc2ogIrmR0DfMDEIW0hRRFA7Nrl3L/HGcQLShvf6p5n3RLoYhUUTTAtvp4v
	VQgHcFU9ET/h5tEXc3FYt5CUwvZyQ3hG7FMAUPtFikLw8obPCXYLbka5PNgEGny+aID/PvH9a
X-Gm-Gg: ASbGncuoS4ZzDpCtqIhKtGlKv/QPXUBZzPC7RpCdUCftPzgJ9QjMwdef7uhjMZcBwhf
	vhiNLq2cqF1APehsmpFVaZKp2MO6R2G5zwixGTKcxBv31d2G977RS+Xb/0DY3SAtvlJOufKuhmD
	53qEhLT9Vq9Uzd0yfYmz5Q0uWNNBL1rwaO3+seD6+cLR7Op8tu7FRBHB2Zwqn7bFH1+t5zz34wb
	I1idL+xHqPm7xtEOFpIiU08HixkRvRGwe/3RMav8fMkav118er2+WwpnatVAi2VM/JpCh0I2dOd
	LkYv8VPdc0t7TR1Ek8NqVqE=
X-Received: by 2002:a05:6214:3b81:b0:6d8:a48e:a027 with SMTP id 6a1803df08f44-6df9b1bb67amr563036316d6.2.1737049935848;
        Thu, 16 Jan 2025 09:52:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0yNflOiDALshiw4SZfmGRBifWYCyvNAYdY9A1ERtGRbmOn0qfOk8jphR/ffWEJ6aRVBOPWw==
X-Received: by 2002:a05:6214:3b81:b0:6d8:a48e:a027 with SMTP id 6a1803df08f44-6df9b1bb67amr563036006d6.2.1737049935566;
        Thu, 16 Jan 2025 09:52:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afb1b293sm2333576d6.0.2025.01.16.09.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:52:14 -0800 (PST)
Message-ID: <b22d5916-8b55-43bc-a256-2136d66ad25f@redhat.com>
Date: Thu, 16 Jan 2025 18:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If timer
 expired
To: Marc Zyngier <maz@kernel.org>
Cc: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 kvmarm <kvmarm@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, oliver.upton@linux.dev,
 christoffer.dall@arm.com, suzuki.poulose@arm.com, will@kernel.org,
 catalin.marinas@arm.com, coltonlewis@google.com, joey.gouly@arm.com,
 yuzenghui@huawei.com, darren@os.amperecomputing.com,
 vishnu@os.amperecomputing.com
References: <20241209053201.339939-1-gankulkarni@os.amperecomputing.com>
 <867c89tc4q.wl-maz@kernel.org>
 <c5b1c3d7-56ca-4afc-a831-045dba4beffa@os.amperecomputing.com>
 <865xntt2kv.wl-maz@kernel.org>
 <8be59ff3-6a68-48e1-8181-0ce4b2e7180f@os.amperecomputing.com>
 <bcb4289b-507c-4ea1-afc7-6febd34d88db@redhat.com>
 <86y10osr19.wl-maz@kernel.org>
 <4d443db1-85b1-4071-acd5-3187deb9cb17@redhat.com>
 <2f6b2cb1-3d32-480a-9801-9b993ae74e2d@os.amperecomputing.com>
 <152d262e-641d-4bb1-9656-a13e049d62c4@redhat.com>
 <86h661wje4.wl-maz@kernel.org>
 <4a9fbdd9-ad23-44bc-8ba5-399f08068db4@redhat.com>
 <86cygpwfy0.wl-maz@kernel.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <86cygpwfy0.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UQhCTfl3EQ1xWb2wR1H69RRW_eUhXa0RPKK6Qrgigkk_1737049936
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_095223_561813_DAFF6557 
X-CRM114-Status: GOOD (  16.77  )
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

Hi Marc,

On 1/14/25 4:52 PM, Marc Zyngier wrote:
> On Tue, 14 Jan 2025 14:57:43 +0000,
> Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi Marc,
>>
>> On 1/14/25 3:38 PM, Marc Zyngier wrote:
>>> Hi Eric,
>>>
>>> On Tue, 14 Jan 2025 13:12:21 +0000,
>>> Eric Auger <eauger@redhat.com> wrote:
>>>>
>>>> I also confirm that using a mailine edk2 fixed the issues I faced
>>>> previously (fed/rhel L1 guest not booting).
>>>>
>>>> I used Marc's nv-next branch and qemu rebase.
>>>
>>> When did you sample this branch? It is almost daily rebased at the
>>> moment, given that we keep piling up things in kvmarm/next.
>> 5 days ago.
> 
> OK, so probably before I reapplied everything on top of kvmarm/next.
> Not necessarily a bad thing, just slightly older. The core NV code
> isn't rapidly changing anymore, with the exception of the recursive
> nesting stuff that I am currently rewriting.
> 
>>
>> If you want me to test a specific branch, please let me know, esp. in
>> the context of latest series including
>>
>> [PATCH v2 00/17] KVM: arm64: Add NV GICv3 support
> 
> That'd be the current nv-next then, which has all the series currently
> on the list, and a few more.
> 
>>>
>>>> With a rhel L1 guest I can now boot buildroot, debian and rhel guest as
>>>> L2 (feat mainline edk2). For rhel, I tested different kinds of page size
>>>> combinations for L1/L2 (4k and 64kB) and it worked.
>>>>
>>>> I tested on AmpereOne and Grace-Hopper systems
>>>
>>> Thanks for the confirmation. I haven't had a chance to try QEMU yet,
>>> but I expect that save/restore will not work. Something to look into,
>> I have not tested this yet.I will give it a try.
> 
> Thanks, that'd be super helpful.

I confirm the migration fails when putting some registers on the dest
side. I will further investigate.

Eric
> 
> 	M.
> 


