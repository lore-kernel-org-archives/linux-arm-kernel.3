Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FAACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 01:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LVu1ftHSweMGGMS0wtdGEkaqFzhCbvStNQPyLLvshM=; b=35QWOY6GHPShczuJkHBClJjoBr
	xzObb4YQbyBY/CIcLXsg9awM9fMF651SIjNuof8DwbpTwQbdlWGr/zHmpT8cXTczxuRkibgKRzhFa
	r9w+WwjCyglnYt6UDnOJ7kMhMdEbRgIXJoijLW3s0CcGREGUNDwJAmrODopUsigs0pUTVoK2lbzvB
	I4IpmqSHOcooOzyLgQ9iyZee/8o551J8pdnaHfflWJkIHm/Mp3545Xw7JWyIPJZEjBZHb2naZKpHD
	vPO1uD5ubqY4+35Z8T41mnjzY5lgvO9Z/R0LcZAbAKJoiWE01It8B1IzKiSNyrTkN0r46JNL+W9Pl
	a2hbA1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAnB-0000000HAdL-1PI1;
	Tue, 18 Nov 2025 01:46:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAn8-0000000HAcp-3396
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 01:45:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so4484796b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 17:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763430357; x=1764035157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9LVu1ftHSweMGGMS0wtdGEkaqFzhCbvStNQPyLLvshM=;
        b=boXyv1weqFj6OmObCqLwFQNUpK5JRFMP7HAgRmkPjGgmd86aMVHMswYTcDWwoJwvnM
         ShSZCUBJKZ0P5aG1PoFPundQPP6cv+tllpWFSwJLTYiM1QxgU6uM/4YH47Rekj4J8dca
         VC46AboUKAZff4qek7W4Bwg1zA/IJqQnAhCZHYacM/mi3EQ1IwgLWfgos3kg0Jsc6vR2
         WfPyOqy+qjLg4SI4o4p2MNYRzr0lQsd+zZM3mXk0GcULBbjzaonXguX2uyzzFPBJIdKb
         akSWehXuW4xN0gp04sz8w6kMEWAXw/TtK0qzR8zstIZ1r+vLUsBpRLAjWlNX7jI+kC2z
         K+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763430357; x=1764035157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LVu1ftHSweMGGMS0wtdGEkaqFzhCbvStNQPyLLvshM=;
        b=Fdpy0X0RJQgObb0StRbkodhIwmv1/kciBw6IHRZoh4XrQsrlNa5QYuvjHB2ZHW1LgH
         NqfXYBqCuIXL9YoAsLxMLN6e1BSyL0ZVv4QY47osrGM3pt5iNm0EeC0hpDAkYZezUslV
         wvio3aWOaRAoNTKKFCLYL5kVZkE1cQfjqb+FNwzg0w1yK8diHxB5kgY1ZlpyoxUVz0cz
         EbVMnVFpw20llUsmj+ot4ZSHoAv4D0FvjPYL3FpDs3jbY9Xd7e3K+kIRjs741QremYKP
         RU2acg4FErvi5ie/T6pKw1Kz5B5Z3e187xmzeDTtGYZiEdX6ICxCOdsf0dgMUrDgUNoR
         y5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUywp76dxd8jLjDvEcR9F2dhuQWRGAhBvvGoVrfJ2B009vxYxSGsMRbwt78KY9bb0oZtNsyW2L/55LlyM/5upwY@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJa6bb9/iZYZgcdF+3iGhRd+iXAV0l0LV2nfnqDTCYWrPmqVT
	zG9GabrIHCDIYtH9wv85RkY0i8Y3VqU2+0O2wrXKJfhxf3sPvi091oPy
X-Gm-Gg: ASbGncsODeBQwjGJ5G62CtToqrjkbO5xz12GlG/kT6Ss4I4HBVs75LDG5cU3hiC5k2t
	XK2U8wtuloJjPfIFJ+Z5ALHEcFTifZDOcEOmbhvDKiKdU9lvg/TrLALV5+3TIafwyFh96t2JLN2
	uxJr3J2MC56EkOwWHVrU9eT6bCilcdxiDTM+OIqIijNHV3ZjfoPqATvU9a8wBwdxb8uD5LaSzMs
	+n7JUSgq7BIMzTfTy5y8f11QWXGtiT3ZIbUPix0eSq3CoMDVjOdWVy64y3bFvuWBo+h3qP9V24O
	hYKxTKg3bLphkeoO+YjRlJv0RbRsah69CFTjKyH/NFQ6jMX2KOecewE2ycPUOXHhWHQ4t+c4/z1
	kQSg14HFR+C7GG/QUM00dBEwrerThMHPx+VD4z4rgFWp03bn8tsErrZlcKpgSTF3Oa9RjcR+JXX
	GBdaIur6OQ+hYBIDx1Ov8C
X-Google-Smtp-Source: AGHT+IG/PNQV7yS4/dOlu2YCel/annKvAJBo90V1Nz+6LPzZU6gOPlYVZPEcln+UbOpMuRAShHAXFA==
X-Received: by 2002:a05:6a21:3397:b0:35d:cc9a:8bbb with SMTP id adf61e73a8af0-35dcc9a8d3emr9776085637.47.1763430357500;
        Mon, 17 Nov 2025 17:45:57 -0800 (PST)
Received: from [192.168.1.2] ([122.177.125.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc3761d0109sm13385461a12.27.2025.11.17.17.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 17:45:57 -0800 (PST)
Message-ID: <0f6fe0c6-7c11-4f16-bed4-db4de675b002@gmail.com>
Date: Tue, 18 Nov 2025 07:15:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
To: D Scott Phillips <scott@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 James Clark <james.clark@linaro.org>, James Morse <james.morse@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250513184514.2678288-1-scott@os.amperecomputing.com>
 <456bba04-07b7-4c27-96fc-9bf226b12fd9@gmail.com>
 <86bjl0o9yd.fsf@scott-ph-mail.amperecomputing.com>
Content-Language: en-US
From: Jaikiran Pai <jai.forums2013@gmail.com>
In-Reply-To: <86bjl0o9yd.fsf@scott-ph-mail.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_174558_773822_6DAF5FA6 
X-CRM114-Status: GOOD (  18.94  )
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


On 17/11/25 10:47 pm, D Scott Phillips wrote:
> Jaikiran Pai <jai.forums2013@gmail.com> writes:
>
>> Hello Scott,
>>
>> On 14/05/25 12:15 am, D Scott Phillips wrote:
>>> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
>>> translations for data addresses initiated by load/store instructions.
>>> Only instruction initiated translations are vulnerable, not translations
>>> from prefetches for example. A DSB before the store to HCR_EL2 is
>>> sufficient to prevent older instructions from hitting the window for
>>> corruption, and an ISB after is sufficient to prevent younger
>>> instructions from hitting the window for corruption.
>> I see that this patch enables the workaround only for AmpereOne AC04
>> systems. Do you happen to know if the underlying issue for which this
>> patch was introduced, impacts (or can impact) AmpereOne AC03 systems too:
> Hi Jaikiran, this issue impacts ac04 only, it is not present on ac03.


Thank you Scott for the quick confirmation.

We have been investigating an issue on AC03 (running Oracle Linux as a 
VM) where some memory writes (stores) are lost especially when the OS 
appears to have accumulated high buf/cache usage (monitored through free 
-h). That investigation, backed by a trivial C reproducer, is still 
ongoing and we are trying to understand what could be causing it. The 
issue description here made us curious whether it's the same issue we 
are running into and since this patch wasn't applied on AC03, we decided 
to check once.

While at it, if you have any inputs (tools/commands) that you typically 
use to narrow down such issues, I would be happy to experiment with if 
feasible. Right now we are focusing on the kernel itself and checking 
which specific kernel versions can reproduce it. We have been able to 
reproduce it consistently on 5.15.x and 5.16.x and we plan to try it 
with other kernel versions all the way upto 6.12. That should tell us if 
the issue we are encountering has already been addressed in any specific 
kernel version.

Given that you noted this patch isn't relevant for AC03, I don't plan to 
further reply-all to this PATCH discussion, but if you would like me to 
keep you updated with this investigation (I would love to get some 
inputs and provide updates as we go along) then please let me know and I 
will communicate with you over your email (or any other relevant forum 
you suggest).

Thank you again for the quick response.

-Jaikiran


