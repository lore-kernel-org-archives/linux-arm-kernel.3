Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB46EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvLYzgf0pTuOcyou9vYjqExC5QJxwloVljjSc64vKaI=; b=4Tgxxw0NvXiKa2mQkMuZQSG7FW
	SvU+T+Tasx4gCwLQj3j9a5wSKfWluEa/9Vwh+2lN/zVhct/H4yPWE7ui+CoJszxHOLraJoOYzQ1Mq
	Q+eIAl6B5AmbgfbsSX/hbYPMGp0R97iYtn6qPw/zQ2febqVvQmNBO6zjJxNVeiqHptF+3+6TtG54N
	Ws5ZUjhIysxuz5oeQ+3lZ2PjgshZ3BrAy5oJ3f5zBFCtukPmwGunbrAbnsI3XiVdERS6gMDbHa9jc
	9he2nhJJyfYpJWjaJomBxmMn/JVLOM9qJqdna4tAFgLj+o4v78Xn+1Dn5Ixea62dJllqzDCm2WmQ4
	YhdGJuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhfP-00000008kJP-3jB9;
	Mon, 09 Dec 2024 17:35:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKheN-00000008kAX-1rj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733765665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvLYzgf0pTuOcyou9vYjqExC5QJxwloVljjSc64vKaI=;
	b=HEad8kKhP45GQoMjYC8N12CZayqeJ44wyUBx+mi8ML5T1FhAUUiCQIsf+KNG5AxtluMxTx
	49Nqnya4IP/0uNfDKjxA0J//4UybkRugQLrKvVHGcrkcFu6Dq2ud3pVTtZ07h9sH+sSCzj
	PX+boTrsxKSQNhBApZaH2QrCkfc3F50=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-4HkRV4dpMOKHASlL8Pk8jQ-1; Mon, 09 Dec 2024 12:34:24 -0500
X-MC-Unique: 4HkRV4dpMOKHASlL8Pk8jQ-1
X-Mimecast-MFC-AGG-ID: 4HkRV4dpMOKHASlL8Pk8jQ
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d88ccf14aeso73833946d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733765664; x=1734370464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvLYzgf0pTuOcyou9vYjqExC5QJxwloVljjSc64vKaI=;
        b=iuQ+SGJG5kW8zZpYOA4N/ULIadfa9Sxl6anP62/oRQR/O+IFua1+wcF24FYraSjCYt
         WcLVMYgHowBRN1sQLX3mJWCmYP6sQlt4va/ws88oCTBx9YPIksW3y5/fvFgxNQB9sK0L
         f39GHPiGbjZ7A/6hmIEPI6wCdmT51ZDGnt3o5hnHY1vVs3AaNSSENP5n8RSY1XJqbULe
         tIPzWbzI8yoS1+e75elaMROfT9WGIrDawfjB4HxivdS8QYhhFHuNQd56qM4LeKWFzkny
         h0AW2QH+ueNtSM/CAFaUlg1oPXjy9kYKhMazDfgI9EytZeqgh927FpI78fgA+FtejbX/
         SBUA==
X-Forwarded-Encrypted: i=1; AJvYcCUk9iE19vSffkwpK3BnzZYOrrwn/NU28XBaPzZdgkkZg34L18vGMAyvKe96Xp9SXsel+Xp7AaCH/qoGo0NQVzS5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1RDhGRsbiBEk8qJZoDu8WGlH8Uompi/rITzhFTEaEoY2ynOra
	ttXqolVgGrInJQlbQHIjw0B4dkKmbQTAZ4yPeC1O/c99x2Ox8Byp1c9F9PkoV31JQul83adazC8
	OE4aTkWyBZHslew0Bw2CWD/2qGG6H3vhB4Kwaz9VGcZEpGsqCSWOAWwCTQ2b3V3PuR+X9nwFp
X-Gm-Gg: ASbGnct/NqPPlXHyznIOh21m1Hvj61pm+DolOSrDY2/PtEkAvRkPHvGxk1ikeB1MN2p
	1xDU9cicYYGRpGDLy8KswEv00tb+hVRg3xCTa5NwyXoAkJ0+10zuI47U9JPufm7uiFaj5TOlw8R
	3uLqVemtKUd+Je16t9dOvPa+VnVxJ8hCH+s7EwCiqNBmqQk6vUHDoKaRhFMmlgze+gX5FIy9BN6
	LK+MW1/O/APW8E4DVLWbnZMXTF7vm72ZOtOZcs5ECxzlPHezCYm8ksdB/Lh/cn22gAz7K2dUWms
	6CvbDXAucAhAzgKP
X-Received: by 2002:a05:6214:ac2:b0:6d8:8416:9c54 with SMTP id 6a1803df08f44-6d8e713a182mr276969536d6.16.1733765664129;
        Mon, 09 Dec 2024 09:34:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd0kpLM7VmFD3YLvHdqJXtgD3B//SGNjV7e+l6mN4D7B+QpL0ybvqRUy8gR/dnnBJyTZwPLg==
X-Received: by 2002:a05:6214:ac2:b0:6d8:8416:9c54 with SMTP id 6a1803df08f44-6d8e713a182mr276969056d6.16.1733765663835;
        Mon, 09 Dec 2024 09:34:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d9063fc63bsm20690816d6.103.2024.12.09.09.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 09:34:23 -0800 (PST)
Message-ID: <4d443db1-85b1-4071-acd5-3187deb9cb17@redhat.com>
Date: Mon, 9 Dec 2024 18:34:18 +0100
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
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <86y10osr19.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5_PBVxqsDRBAoaJo7y323IIwBKOi3AQWjpnCWqD9ids_1733765664
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_093427_561261_AD840EEC 
X-CRM114-Status: GOOD (  18.40  )
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

On 12/9/24 18:30, Marc Zyngier wrote:
> On Mon, 09 Dec 2024 16:46:30 +0000,
> Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi,
>>
>> On 12/9/24 16:39, Ganapatrao Kulkarni wrote:
>>>
>>>
>>> On 09-12-2024 06:50 pm, Marc Zyngier wrote:
>>>> On Mon, 09 Dec 2024 12:25:34 +0000,
>>>> Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
>>>>>>>
>>>>>>> During automated testing of Nested Virtualization using avocado-vt,
>>>>>>
>>>>>> Which is not merged upstream. So what branch are you using? Based on
>>>>>> what kernel version? On what HW? With which virtualisation features?
>>>>>>
>>>>>
>>>>> Testing is done on Ampere's AmpereOne platform using 6.10 based kernel
>>>>> with NV patches from your repo.
>>>>
>>>> Grmbl... *Which* patches? At least give me the SHA1 of the branch,
>>>> because I have no idea what you are running. And 6.10 is definitely
>>>> not something I care about. If you're using the NV patches, the
>>>> *minimum* you should run is 6.13-rc1, because that's what the current
>>>> code is based on.
>>>>
>>>
>>> I tried 6.13-rc1 based nv-next branch today, which failed to boot
>>> UEFI as L1. Yet to debug this.
>>
>> I confirm am stuck with the same issue with nv-next on AmpereOne.
> 
> All I can say is that it Works For Me (TM) on M2 and Snapdragon, using
> kvmtool, a fresh EDK2 built by Ard, and with the guest running purely
> VHE (FEAT_E2H0 not implemented).
> 
> I haven't tried QEMU, I don't have an AmpereOne. I have also spent way
> too much time on this recently. So I'm afraid people interested in
> making this particular combination work will have to debug it.

yes I do agree. I am currently setting up kvmtool to double check and I
will debug the qemu issue.

Thanks

Eric
> 
> 	M.
> 


