Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8035C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLzVMGpQ3+64AmofLOM+OD8cJgxT73OQ3RwaxSr2hSY=; b=Fr9QCRsBCpHwgXbNNTZ9Et0CsW
	WSEp8dKwXgUblvu1hzJT632fNiyBx35AsZeGuAYLSx7HGQl9mWBhduyugNZsx8OcOHIWdK025z7m2
	vKih2NlIw+bH7DBb8OoJO7leWXLTzjz1YLsvHQtfsOMy9rVtL2Sq894T95+T4by6b7J9tFccml8do
	HO7nuV1tOaQ7lFpXOGi1o+hShhT3ESqeSDfj5kfAIsSNrLTZVoQ9rTQvspX9qHO1PSLdcsFccD1Wf
	51bC85AWNGcU3acvZBHH8O7VrGddvqUaPesvMq1Y0UiLj7GwIQfbbSCtQ7tB6lnNoFsv+fbx5Tcqi
	kMNdR6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnknr-00000008ozR-2rn4;
	Thu, 27 Feb 2025 20:48:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkj7-00000008oEp-2Wta
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740689002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLzVMGpQ3+64AmofLOM+OD8cJgxT73OQ3RwaxSr2hSY=;
	b=VcADpQHHFE4X0Fd6oTBo28t63RFLi0EfDvpBZWBZWpijlB/TwNhkNduAOJ9lcEgxRy5BgH
	Bc91th4kCRVRj41xYRGPaH5MTkMdF5NGm9M01nmTSy9XsQPD6991n07elP6NTpLtpc5RoD
	We1PmWicfoytVqWl6z3KJWJP9By5nmM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-NNRK84yNOSWZmB31Ww3mJA-1; Thu, 27 Feb 2025 15:43:21 -0500
X-MC-Unique: NNRK84yNOSWZmB31Ww3mJA-1
X-Mimecast-MFC-AGG-ID: NNRK84yNOSWZmB31Ww3mJA_1740689001
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-472180fec04so14974451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 12:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740689001; x=1741293801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLzVMGpQ3+64AmofLOM+OD8cJgxT73OQ3RwaxSr2hSY=;
        b=bYbHBUrLqzGVSdfINMWAOt2mX6v3dssRg4/Bfa9tHoILaU1LmgQ3PwK5SyGLLpEQyG
         AoUE+wE3JTbZvgZPoOqjQ4s9j4SDZeUgTluBXIc7fSO4SeRe/JQwIvrtuAXXVwrEYSm8
         U5OuUq1cXdRxqY1umj7DnD6/59fJ4JBfkbXhXHC2wRZRh0TdC3yixspu1wU/ejuW5JL3
         QRWvL7+QN8x7GLj5E2oG7d8o86DCv40zPdLweiZuHLKrULYk/jIHEhvk+EpNvJEvf79P
         iWpPHDAKDU9dCj7qEU0MXchDHvlWooLh7149G3EdlfBusemqpfg1JyEswlFiCUwnwBwl
         UHTg==
X-Forwarded-Encrypted: i=1; AJvYcCVXHpX0leXHzfc7E/49GYBRRY8ntCRJSyoPySIzio19tANWI51iJrjbSKabzpaOk22PBOQ67aFr2uO8aVSXt/b4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb48QGGp18rlLAZFwmVFY0NZAU86TXoEYD/besM4EoQyEMZh7o
	Oxy1xhP6FiksMjORapt3ropsjgFS6+d5r8FJmC9nWpM9zFIU8G/lpvethsLKOU0iyd3q7je8tUj
	LwEXjSfVe8ZtBVRO10QSg8yod+o7cyXgbcekI590fcBRU2UHSftl9Br5VfRu6johZJbfT9e82
X-Gm-Gg: ASbGncuiEX6bAb4Loe1/k1d4373sEdrlhmLOZMuDSA0PoOnu/Yo+Tl1SGKKsNb+I4pF
	Q1c28b54MvCIYMYTCgg6m4SLdTptQWGssZAU04h6X2r9pdReOERRpRNRIJO8gtnIOtlr/FCUStj
	31RKnohDoatIUD6SaFbsaPbm0+J9Y28TwhAqds6y86/M9WrQePBBUULIyF2TTi4Pvt7qwPiRIAB
	EUyVL70m+J3UlnpNZTtQ1foglDy2ijcDKDczrOTQ13ouGvwW5eR6+ww9GlJCtCdof8LaYhCZmG/
	YGaJqAi5Mwi9RYM=
X-Received: by 2002:a05:622a:1ba1:b0:471:bd5e:d5e3 with SMTP id d75a77b69052e-474bc0f42f6mr8394301cf.38.1740689000792;
        Thu, 27 Feb 2025 12:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE47+5mOAR+v6wUfVnqg2K6hIMrSfsz3wH5rCj9Z7Js/E9C5WjePcsXbpi83rsrpfI2eYeUrA==
X-Received: by 2002:a05:622a:1ba1:b0:471:bd5e:d5e3 with SMTP id d75a77b69052e-474bc0f42f6mr8393941cf.38.1740689000497;
        Thu, 27 Feb 2025 12:43:20 -0800 (PST)
Received: from [192.168.2.110] ([70.52.24.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474721bfc76sm15531991cf.46.2025.02.27.12.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 12:43:19 -0800 (PST)
Message-ID: <4196e42f-7b04-44a7-ac34-6ca2e9190c21@redhat.com>
Date: Thu, 27 Feb 2025 15:43:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <174052227763.2420464.2784848656225511807.b4-ty@kernel.org>
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <174052227763.2420464.2784848656225511807.b4-ty@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C-mJOGud_Pi5Hj99jtIGkXfwnww0Ng78zAzvGPTuGpI_1740689001
X-Mimecast-Originator: redhat.com
Content-Language: en-US, en-CA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_124325_718486_CE290923 
X-CRM114-Status: GOOD (  13.28  )
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

On 2025-02-27 13:50, Will Deacon wrote:
> On Tue, 25 Feb 2025 11:46:36 +0000, Ryan Roberts wrote:
>> When the range of present physical memory is sufficiently small enough
>> and the reserved address space for the linear map is sufficiently large
>> enough, The linear map base address is randomized in
>> arm64_memblock_init().
>>
>> Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
>> use it consistently"), we decided if the sizes were suitable with the
>> help of the raw mmfr0.parange. But the commit changed this to use the
>> sanitized version instead. But the function runs before the register has
>> been sanitized so this returns 0, interpreted as a parange of 32 bits.
>> Some fun wrapping occurs and the logic concludes that there is enough
>> room to randomize the linear map base address, when really there isn't.
>> So the top of the linear map ends up outside the reserved address space.
>>
>> [...]
> 
> Applied the reduced version to arm64 (for-next/fixes), thanks!
> 
> [1/1] arm64/mm: Fix Boot panic on Ampere Altra
>        https://git.kernel.org/arm64/c/2b1283e1ea9b

Just in case:

Tested-by: Luiz Capitulino <luizcap@redhat.com>


