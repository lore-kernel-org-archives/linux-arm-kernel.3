Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EE7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWr4LjVLl7XxCHlww7vF1nDasmLkMTAzRIZDCzcHGvE=; b=iYr+0pWlX1uDS2WGID1PnvGMi5
	UJRNggwQirff6uPqoGFdjgJwZLx4s7LQ2JE3qY5qDk7/gmyyhrRAHw9n07t8jhN7eIXsApsjfNSgG
	pIKSKbgoUdV1e+O28QX6pj38pkD18wjVn9Ih65ODxtx5HZD31RyyqQUmAdVQuUZD6Up2WMvOzkxFq
	JaK74Yo78ib7xJ9dnR/mjXmAdMA1ij0nd4aoP68aw43GQkzx411kL47611FK9YlggtEuU9EXU04SG
	DqXfwtBauLmoBgE6KNp5cdVPMvc3uxgEjeFpRR5Di4Gqi/OHYjGHmegCGghsmZQobB0dyk2E0sYEP
	S62Qg8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgjt-00000008UYn-2tpd;
	Tue, 14 Jan 2025 13:13:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgid-00000008UOG-2zCS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 13:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736860349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWr4LjVLl7XxCHlww7vF1nDasmLkMTAzRIZDCzcHGvE=;
	b=IzCB7IiIfxEmSghYY6wgPRjcitl3UeuTd6rpy+9DNERPtxZXzzlVaOchfu+LCxGGO79r8Z
	FtIpn+RgFo5tOMk4WbqeB5z1fgELEhbMDptTHf9B8yfwgdCSFj/0VWr84PaLAYDDCcvvej
	tOrg8ikNTyb+ErNnuKAn63wZx5KABxk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-kjdUzdF8MVOR552141wGzw-1; Tue, 14 Jan 2025 08:12:28 -0500
X-MC-Unique: kjdUzdF8MVOR552141wGzw-1
X-Mimecast-MFC-AGG-ID: kjdUzdF8MVOR552141wGzw
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4675c482d6cso89067151cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 05:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736860347; x=1737465147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWr4LjVLl7XxCHlww7vF1nDasmLkMTAzRIZDCzcHGvE=;
        b=EdZcO+pxNi1ojhWvO4vEtf3kzSOKX3SsxMI+g/dn+4/2Bt4zJYdXntJ4oHe9kNQrIB
         MqRb/UDsYZJt39jUdR3pds2rCiGhCPFfYksbPTnSWjFgp+gbvyvVPL2dVVgGe4FxNDLQ
         RJCa7l07jCbPEouX8x2VhLUPf3HRYll2Lh8gUbF2NDgAebEYZ6jtXY6LvzKxIhmZe6wu
         ZL0Ut1f/+o/xd/og8PkCI6TSvzZKIq3ICLkG+HAlga39yEsTxqHfEm4QOatINIpBdXM0
         O4zUC6IyoUAK1zF3/2OmqnUy7ZlGExmgeL3mvNRsi7YjEuOVPn5A3ZQ5J1Bpq0XUkC5e
         mY/w==
X-Forwarded-Encrypted: i=1; AJvYcCWPQPmoyzqRnQbgzTR8wWpLKVfqBo7wPQn4cru1CcywjAGVahiGv66ca+RYrE5sy5BEPerl7C+8ofxT3GcaEPsM@lists.infradead.org
X-Gm-Message-State: AOJu0YzhYdoYNDlp3NtpkU8/luZWAVBTr5gvDF348ucJcZG3DyPD4y9x
	3cjPyJJbxMCceIRkv9LZRxn29h4gG4n82pe/zWJzgmY452CBMo4PKySt0VHbEztCijUVBCrWGCK
	aK3mzUOSvBoEgAqeYoh3zTdfhc1pqzAmZCTawcd7QcunNViZ40kFnPl6cGvhue9C9uDmLXaYYYf
	A1HqxM
X-Gm-Gg: ASbGncvZeBaj4hbRgF3EEn9Dp6LDPuPbfmAlbkVszATXeekNjn39I2t3+s014qdpbtd
	hSpBWsrKSHjKeT+Yn3IgmVnKg3UF2xzRhKHpNonmBuHJVzzEvuPKsJ2zElfNFYB30q8HT1PNnij
	fDh78FuDRXP1T2BGk+AvU8S/2BzIvIyMhdoiywVb5QGpv4o1uaKpM/qrjFQgXjc4R2/J1LfTP78
	vpf8LOcLcF2HnZE6Md8izulTdOnIDjvAUvZo3vXaQfwLvJjS2Xy59F/OvPCjsfF7+wi00te9zK4
	RepSjX2Ns+BzpgaQh0JsZe0=
X-Received: by 2002:a05:622a:15c8:b0:467:67db:ef72 with SMTP id d75a77b69052e-46c71028f78mr431226271cf.27.1736860346696;
        Tue, 14 Jan 2025 05:12:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYTexeBR+Gkp5GlViA0tDCn+p6fh/jWMN/XEbbC5wdItpsz+fvQ7pn46wjd/urtfOvlcEkVQ==
X-Received: by 2002:a05:622a:15c8:b0:467:67db:ef72 with SMTP id d75a77b69052e-46c71028f78mr431225871cf.27.1736860346380;
        Tue, 14 Jan 2025 05:12:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8732f9bbsm53050701cf.28.2025.01.14.05.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 05:12:25 -0800 (PST)
Message-ID: <152d262e-641d-4bb1-9656-a13e049d62c4@redhat.com>
Date: Tue, 14 Jan 2025 14:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If timer
 expired
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Marc Zyngier <maz@kernel.org>
Cc: kvmarm <kvmarm@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
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
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <2f6b2cb1-3d32-480a-9801-9b993ae74e2d@os.amperecomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t6BmxjT2545B7iJQtnJGJWxYybQExTMWcqzX2ZRtUE0_1736860348
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_051231_827747_8E73A8A3 
X-CRM114-Status: GOOD (  20.91  )
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

Hi Ganapatrao, Marc,

On 12/19/24 10:30 AM, Ganapatrao Kulkarni wrote:
> 
> 
> On 09-12-2024 11:04 pm, Eric Auger wrote:
>> Hi Marc,
>>
>> On 12/9/24 18:30, Marc Zyngier wrote:
>>> On Mon, 09 Dec 2024 16:46:30 +0000,
>>> Eric Auger <eauger@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 12/9/24 16:39, Ganapatrao Kulkarni wrote:
>>>>>
>>>>>
>>>>> On 09-12-2024 06:50 pm, Marc Zyngier wrote:
>>>>>> On Mon, 09 Dec 2024 12:25:34 +0000,
>>>>>> Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
>>>>>>>>>
>>>>>>>>> During automated testing of Nested Virtualization using
>>>>>>>>> avocado-vt,
>>>>>>>>
>>>>>>>> Which is not merged upstream. So what branch are you using?
>>>>>>>> Based on
>>>>>>>> what kernel version? On what HW? With which virtualisation
>>>>>>>> features?
>>>>>>>>
>>>>>>>
>>>>>>> Testing is done on Ampere's AmpereOne platform using 6.10 based
>>>>>>> kernel
>>>>>>> with NV patches from your repo.
>>>>>>
>>>>>> Grmbl... *Which* patches? At least give me the SHA1 of the branch,
>>>>>> because I have no idea what you are running. And 6.10 is definitely
>>>>>> not something I care about. If you're using the NV patches, the
>>>>>> *minimum* you should run is 6.13-rc1, because that's what the current
>>>>>> code is based on.
>>>>>>
>>>>>
>>>>> I tried 6.13-rc1 based nv-next branch today, which failed to boot
>>>>> UEFI as L1. Yet to debug this.
>>>>
>>>> I confirm am stuck with the same issue with nv-next on AmpereOne.
>>>
>>> All I can say is that it Works For Me (TM) on M2 and Snapdragon, using
>>> kvmtool, a fresh EDK2 built by Ard, and with the guest running purely
>>> VHE (FEAT_E2H0 not implemented).
>>>
>>> I haven't tried QEMU, I don't have an AmpereOne. I have also spent way
>>> too much time on this recently. So I'm afraid people interested in
>>> making this particular combination work will have to debug it.
>>
>> yes I do agree. I am currently setting up kvmtool to double check and I
>> will debug the qemu issue.
> 
> I could boot Guest-hypervisor using QEMU with -bios and nv-next as L0
> with edk2 (QEMU_EFI.fd) built from upstream tree and fedora-41 as Guest-
> Hypervisor.
> 
> The issue was disappeared when upgraded from fc39 to fc41. Same was
> experienced with the kvmtool boot as well(KVMTOOL_EFI.fd).
I also confirm that using a mailine edk2 fixed the issues I faced
previously (fed/rhel L1 guest not booting).

I used Marc's nv-next branch and qemu rebase.

With a rhel L1 guest I can now boot buildroot, debian and rhel guest as
L2 (feat mainline edk2). For rhel, I tested different kinds of page size
combinations for L1/L2 (4k and 64kB) and it worked.

I tested on AmpereOne and Grace-Hopper systems

Eric
> 


