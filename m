Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F0FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SmzP/tN6OjoTvpKUmzAp05cCCcydG3yT7FnpCUoYlk=; b=Y1xN3n5Th2gPbOHA+rIvs/q5Bj
	A1HcUHxnpHnboxx5IR3zu4/2pyV/4sbCh+bCEk9U689KFWcKY0XKw6F5cdVeodYeDTFxR0hU0lKtV
	f9l18bF/eIWWJIEEvaPogdnjuJbSF2Cl5UyDCATFSjmuVD0U5Aemgnx62ve4asbz4JZtA+TTHWIiN
	vHC+E27O71Jt733qPcACXxXyckg+XbHVRtX4KRMkTR1NfCc2yKjnp4i4BSzz+mmlK+7p5ZUjxBd2U
	ZrQCDbBH1AV+tki9Azb9qdcP3SkHV9Mmy26HUn/k4u3guZUhLXIx/0jtOidMMG+IGk0sEYmBnS+3Y
	Mf8t0x1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiNn-00000008lef-34I2;
	Tue, 14 Jan 2025 14:59:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiMY-00000008lTR-1yle
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736866669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4SmzP/tN6OjoTvpKUmzAp05cCCcydG3yT7FnpCUoYlk=;
	b=elBpfutkFQ5H3dr2lRyWIaVwxHkMNcjN2SbRhcSaC6/xFgoHZqpNbWeFDLD4HwCmjrB3RW
	DCpNkbn+NdKZyWxYbNPQwxirKRpBMdmbL0HofQItNQ5lHnbQdAgpkRErtuHrLaATaFBFcl
	+ovcCS31wkMOzXS2cOK2AMN6eY7L138=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-nL7sndyQNrCzHceiJG7Dgw-1; Tue, 14 Jan 2025 09:57:47 -0500
X-MC-Unique: nL7sndyQNrCzHceiJG7Dgw-1
X-Mimecast-MFC-AGG-ID: nL7sndyQNrCzHceiJG7Dgw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361b090d23so29737675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 06:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736866666; x=1737471466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SmzP/tN6OjoTvpKUmzAp05cCCcydG3yT7FnpCUoYlk=;
        b=bHu7ROc3nK9Bvc8pmIn9v+kn+xZO8yA+4rFvfr0JUtRqCbvH5nUjxv+bDpI8521LhN
         0pAuvg+yNOEFLVe1yyhu7om7tXiphSS6ek8k92pV6wDM3nezUotXMamUbGFkbruNDwRz
         aFf28vv9bQNEpDIdmGalaKgoBOu6LqqlwnyEJ4R4ZSWpYa14m0uyyvG63R5hgKWM8pMk
         6ULSk1WYOd7tXoWd5OOaI4Twz3y17neLcJ/e7TLMu/h+BcloCQHv6yydq6tagZ1k/Xto
         1tXR1LUlHgbpQZctkLVKcQSmKyTbR+/RB5SXRST372men6lL8XH0KrQPgCqTdj3i4hys
         /qwg==
X-Forwarded-Encrypted: i=1; AJvYcCWPpeHdinhWohvVYLkRpCW1Rem41WNusZ5W5Db6OvJk1PfnNi0iEIUJfhBX65m+LKWv9+wkd8xe6ZbulDT7KmpC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5iHhgIPStRCUQ4MeyjuMG7cnllCwrwGlxI7zc3j1c8/G/9iO7
	u0JmvMzrUu8xdEW9pOCVsxhv5Mxr4QOXt/kBn85K4ZYGQF82aznfMrFfPxdndd7+Ss90T+YWnQZ
	3/Y/0NeUODTy+LJhgTUe5S2ahWD2eveQkod1xqTSkMsLLMm0/AvXUjATm6P0N8Yn3MQ4Ych92
X-Gm-Gg: ASbGncuef958fuuG0F8zkyvB0seai/4VAcorqOoUYWmyPWqN/vB024b9hiq42SXTGdQ
	aoSd7w283RUFR9b7R4sBhRRCQ68r1hWiq320BzxCZSPqDaZBnna7b6au3isE2EKom/YX2SjGNpb
	j8Qvk8B+/KrepzNepMUqlbCWpVC90Kq3EvWBM1iCbuli4EDUpQkYIXab9kEm0imYg31f8QquKN4
	I9/Untw2ZZikO7Lgfomptfvn7DxnYBl/S8MOY95has/B5BVOGvBB3cT/odB6k8skBk+IiyNLyJj
	4/y5jua+rOXAZKtW30ZyL98=
X-Received: by 2002:a05:600c:468a:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436e26a78a5mr189805505e9.9.1736866666660;
        Tue, 14 Jan 2025 06:57:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExk0wU6asFYaR4DpbkMbnI7udaC/CcYasNtWPbYNjEYNALHWG8jGD2PzfrC1f6nYMjRGJSZA==
X-Received: by 2002:a05:600c:468a:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436e26a78a5mr189805235e9.9.1736866666247;
        Tue, 14 Jan 2025 06:57:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm211355245e9.20.2025.01.14.06.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 06:57:45 -0800 (PST)
Message-ID: <4a9fbdd9-ad23-44bc-8ba5-399f08068db4@redhat.com>
Date: Tue, 14 Jan 2025 15:57:43 +0100
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
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <86h661wje4.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LOwhqVtsttfG3eQr2_UoB2HyG20m51i-uV2Rr0HdjjE_1736866667
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_065750_583013_DE7C23FC 
X-CRM114-Status: GOOD (  15.53  )
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

On 1/14/25 3:38 PM, Marc Zyngier wrote:
> Hi Eric,
> 
> On Tue, 14 Jan 2025 13:12:21 +0000,
> Eric Auger <eauger@redhat.com> wrote:
>>
>> I also confirm that using a mailine edk2 fixed the issues I faced
>> previously (fed/rhel L1 guest not booting).
>>
>> I used Marc's nv-next branch and qemu rebase.
> 
> When did you sample this branch? It is almost daily rebased at the
> moment, given that we keep piling up things in kvmarm/next.
5 days ago.

If you want me to test a specific branch, please let me know, esp. in
the context of latest series including

[PATCH v2 00/17] KVM: arm64: Add NV GICv3 support
> 
>> With a rhel L1 guest I can now boot buildroot, debian and rhel guest as
>> L2 (feat mainline edk2). For rhel, I tested different kinds of page size
>> combinations for L1/L2 (4k and 64kB) and it worked.
>>
>> I tested on AmpereOne and Grace-Hopper systems
> 
> Thanks for the confirmation. I haven't had a chance to try QEMU yet,
> but I expect that save/restore will not work. Something to look into,
I have not tested this yet.I will give it a try.

Eric
> I guess.
> 
> 	M.
> 


