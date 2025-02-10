Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA39EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0MPt0ycdUSMONDSu9mYoplPstvbsn9ikTgZv5+baQE=; b=JP9hSbYQmP/9WozpmWeMJ4AIl2
	6MC+lXqRATK8pLOv0lTXdvCavgz7ijw4B6GBvAD7ZeL9wgFIK8fgOuIrW3jhTY4UJwPV6aq7aLhgF
	1GTqsNAKfP1FVFEC87Xnz+FGJuThhD+w04+IDQ/klcfYp0UKLQRabIApdtetqL6Fvfa7WfEki593b
	mXZk/EoDa56Vq5NfRNZWzDBr2BsXtnocZ6S6dj33Z7R89v8dQnSYAIwxoW3BOF51G6IcEOEh6NS3t
	Z447GkmiUeR7CY1Ijo4LKJgiEOce4TdfCFKjSa2ViT9bpIaOyiHhFysGSqgyurpNfQgT1+Z8xewxO
	whoUSKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thThY-0000000HW6P-1OC4;
	Mon, 10 Feb 2025 13:19:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTg9-0000000HVtX-0G3N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 13:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739193503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0MPt0ycdUSMONDSu9mYoplPstvbsn9ikTgZv5+baQE=;
	b=d36xJsQ0JUi/P0/a/SDU/rFcGPtLRODuhNR2yRT8vtx1/N9k475HT0eJfGBol1GCcnqhRs
	UsMPlOk1772pkrU7AIBjdwuMEtw2vHu4xYJTLYQMBEIurUepnK96/Zvdx2VA4jt6dzvYqB
	mRxcpemXjDSHwO5hFUmJpqVssv2FoP8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-CKVNFejKPa26eESVSGXlgg-1; Mon, 10 Feb 2025 08:18:21 -0500
X-MC-Unique: CKVNFejKPa26eESVSGXlgg-1
X-Mimecast-MFC-AGG-ID: CKVNFejKPa26eESVSGXlgg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43942e82719so7234635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 05:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739193500; x=1739798300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0MPt0ycdUSMONDSu9mYoplPstvbsn9ikTgZv5+baQE=;
        b=cwcOaBhi5/t2tMc7WNjOOg4d/V8pADgouX732brziuH3diOTTzOSSECf43gEoJuqcK
         atbHR7VsZlCiTWtxzS2vnyfdA0O3m+3wGrl2RMmfrNDpulin5qmbihvH5fXI08drJW7Q
         yBsp0brr4lbvVlKgpNwvZC/5zPAB+ZoYNZ0pDNzKbMqbRLv7zpsEU/DTlN9CLNEihrRU
         W4HmujWPE5a/dgJUMSDGv+uz9vOLTuKW1FHA/Spxppy08qVtNfnz1YTjoty0CDMGF/xP
         wXhlQ42lmuQmZiLipuEKRWzv6puANGJpik+sJfiCHx1WFvsBwzHLDoslbKBET85s8+fF
         ej+w==
X-Forwarded-Encrypted: i=1; AJvYcCVV4ufT2XIysWk/vx7Gv24pSPQ5GvATemSHsS0kWOFPjeafGo5Ixc6HHvZASpxMFL500255q9GA9wIW+bBjPzjy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvl8ODVlYiFY8ld88yJ3Ul8hBFWEkVFOTHG1h/W30tzjRYLVDb
	csn0WM3EZhfxoB39B7SPgLnYRJ+dCoQlg/2EygtxoPEK/6PENRLCrb+Tb7/Z9jvv4f6yJ/OvzBy
	JKHihZMsWOkSU0rupXFhS2JHgCmaQuHaKrnwnvAUX85FP6uCQgczeFC5KWPEJLo49DZNnWF/2
X-Gm-Gg: ASbGncuDrKmWz/C5J+OCY3lvfFy7yR9s7xj5h2u9QuG4FOUItWyi4OgXdbc/+jZb3s9
	1qfi+fOu2BzRSTxqCVmPkiaPiYxRl2Aiys0JCAOqOFTfbAq+V3igNYrKwhE2FMjYnvnrtU5OWCt
	I7e3Ef9vrKKwsxzAi3f1cyGAMOg9yllbBowVEEyFh/YgrEGKoVy5nD6adPAO+ESEEegpI6zbdax
	f3v2WAs8RK2SWiZg5QtmAPy5cYmKJanp/OvYtkAZ6Oo1lpgR1Mqk92Y837yGVaLI1/Etf+Now/I
	UuIcvMK0VsVXaSRKGh5QaDfKyMMX+Yx4vx4SDRzj/IJQmzI=
X-Received: by 2002:a05:600c:3c84:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43924991e0cmr110864715e9.14.1739193500532;
        Mon, 10 Feb 2025 05:18:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoG9yP3/H9MVEK+qppHO2dXkw+Mes+rTTzfBqf9J7j6+TGHkenAflO96Xy+SJtMO0c9pi0Dg==
X-Received: by 2002:a05:600c:3c84:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43924991e0cmr110864445e9.14.1739193500176;
        Mon, 10 Feb 2025 05:18:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439492affe2sm13118155e9.28.2025.02.10.05.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:18:19 -0800 (PST)
Message-ID: <16086d70-2371-47ab-8980-ffbf40971bcb@redhat.com>
Date: Mon, 10 Feb 2025 14:18:16 +0100
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
 <b22d5916-8b55-43bc-a256-2136d66ad25f@redhat.com>
 <86frkptzr6.wl-maz@kernel.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <86frkptzr6.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ul6JTuP3qKEgL0QpQC7CJtLqUqZta6GJ2p5fJTN72bc_1739193501
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_051825_178027_A037FFCB 
X-CRM114-Status: GOOD (  20.87  )
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

On 2/7/25 6:45 PM, Marc Zyngier wrote:
> On Thu, 16 Jan 2025 17:52:10 +0000,
> Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi Marc,
>>
>> On 1/14/25 4:52 PM, Marc Zyngier wrote:
>>> On Tue, 14 Jan 2025 14:57:43 +0000,
>>> Eric Auger <eauger@redhat.com> wrote:
>>>>
>>>> Hi Marc,
>>>>
>>>> On 1/14/25 3:38 PM, Marc Zyngier wrote:
>>>>> Hi Eric,
>>>>>
>>>>> On Tue, 14 Jan 2025 13:12:21 +0000,
>>>>> Eric Auger <eauger@redhat.com> wrote:
>>>>>>
>>>>>> I also confirm that using a mailine edk2 fixed the issues I faced
>>>>>> previously (fed/rhel L1 guest not booting).
>>>>>>
>>>>>> I used Marc's nv-next branch and qemu rebase.
>>>>>
>>>>> When did you sample this branch? It is almost daily rebased at the
>>>>> moment, given that we keep piling up things in kvmarm/next.
>>>> 5 days ago.
>>>
>>> OK, so probably before I reapplied everything on top of kvmarm/next.
>>> Not necessarily a bad thing, just slightly older. The core NV code
>>> isn't rapidly changing anymore, with the exception of the recursive
>>> nesting stuff that I am currently rewriting.
>>>
>>>>
>>>> If you want me to test a specific branch, please let me know, esp. in
>>>> the context of latest series including
>>>>
>>>> [PATCH v2 00/17] KVM: arm64: Add NV GICv3 support
>>>
>>> That'd be the current nv-next then, which has all the series currently
>>> on the list, and a few more.
>>>
>>>>>
>>>>>> With a rhel L1 guest I can now boot buildroot, debian and rhel guest as
>>>>>> L2 (feat mainline edk2). For rhel, I tested different kinds of page size
>>>>>> combinations for L1/L2 (4k and 64kB) and it worked.
>>>>>>
>>>>>> I tested on AmpereOne and Grace-Hopper systems
>>>>>
>>>>> Thanks for the confirmation. I haven't had a chance to try QEMU yet,
>>>>> but I expect that save/restore will not work. Something to look into,
>>>> I have not tested this yet.I will give it a try.
>>>
>>> Thanks, that'd be super helpful.
>>
>> I confirm the migration fails when putting some registers on the dest
>> side. I will further investigate.
> 
> I found at least one issue that could fail the migration. Before the
> VM starts running, we limit the feature set to the subset we actually
> support with NV.
> 
> By doing this, we also change the value of IDreg fields that are not
> writable, because they describe features that we don't support.
> Obviously, that fails on restore.
At first sight the registers we fail to put are
- ID_AA64PFR0_EL1
- ID_AA64DFR0_EL1
- ID_AA64MMFR1_EL1

I will add some traces in the kernel to figure out which fields cause issues

Eric

> 
> I need to have a think...
> 
> 	M.
> 


