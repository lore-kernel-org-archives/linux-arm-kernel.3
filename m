Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6895D44171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnMuJVLT9f8LFRD+CDKFKXxiScl2L/4chGY+NToAMxA=; b=ZNJ80qgZn5PyGDw9V140pN0FU8
	GsGKX/TUfYmHc68DIsGs52CNSHG/cqLLDENm2qXf7k0HOIvcSjgmSfbL+NrwMwfbdsh9u7q+rH6Sq
	69JNsdg5196B2clTVuTujsRq5BTOAGrJ+YQuabiNr/cWh8P9k3zYaqbp6uJhc7OudKrtUjvwTwQEd
	yq41c8FIMAMf2ObnI5CAOsAO/yOgj22VAHvVuRZvAKfD4+Vi2R9MWCNGQ/EBnA4u/6HAxOfft0vfV
	o21GdkF+8SKzngEK8KJzjYuu0tMlaf3SYWr4P4z7S8n0v5Ck59TlwRoh3NTz49jvCXv/EP5xVnZJd
	tYX40sVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhGu-0000000ExF1-1swL;
	Wed, 20 Nov 2024 09:45:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhFM-0000000Ex21-2gip
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:43:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so6327537a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 01:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732095818; x=1732700618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnMuJVLT9f8LFRD+CDKFKXxiScl2L/4chGY+NToAMxA=;
        b=q6Zt2scGOt0uYkohhB/XHcQeCjNt2Usb45e78Tpv7lTSo/rlbXU2NFfcKncy4dy9da
         YBs7OGRUtGW4o8HCPa/64ueI89NpdmmCZsUkgjjj4rVIxkA+iRoGKlSgtR9o/vqG9Sex
         sYLTTFV0JIwY/QvhqPq9WKhJH1E9pOIFSb6EKAp58TwIAN5YuqeiIHGXBy7jHuZkYBuk
         KaaZsUMnkWPMg55xJHZMel3w/JFyVKDNG4ntpI8as8MV5FbxfRbzFiCHgRvDjAosgrzy
         nmCwFS0ijAFqBwS+vdExgDMyhBpOqofnD+cQr47m2PSwrvA/3spNcUGlef/HyvufSfnw
         1/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732095818; x=1732700618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnMuJVLT9f8LFRD+CDKFKXxiScl2L/4chGY+NToAMxA=;
        b=Vukl55LO1LkDcCS+0pAFOdGUI17ogdnbdYsxykzzn2BrrEHC1aEiwozc1kxwMZ1qrW
         7/kK8b90dC/1takchpdBw+5g6N3u+n58Zk7SuQrj4Mfu27emcSXe47v3SoGqnlq39aYI
         8/uMBooNmZUe0rPMl/k+13BQJ83wwJWoKpcQWmV8cMWw4LOv2nX/Z22L1RgocWH1GRek
         ojClHYhVyQmAKWXt2lqXZ2N2ItZv3tDuTW2udgH9LltB3GUw70q04WtX624aFw1kr4WY
         spW5aJ/eKGy4jkZEyZfiCDwN3mYc/EptLyuW0jIZkePUKFvVuKaiKwtAPdaXMHph2xfy
         ge7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8saIMLVMddbmtYzD9PV7VwHsgMVQsFiMkETrO5yDG0EXJQywgpacyeXyOMaBljolK4EfV+fUONiKfnRig66CP@lists.infradead.org
X-Gm-Message-State: AOJu0YxaM1zYk3JuOotSPJgO0k1/rqyeaHj+v60t8FrZ03FYfkKGIZ13
	v5xil1RsjqO+hedyK8YyoQ5Jaj9E21Y9l+nF0drzNkgG+h1khqsHZr1HFlXJgXg=
X-Google-Smtp-Source: AGHT+IHPRVJgISuT50tHDUxOcColFsHDGhCQoGsxkLXqTG91NWmfuCwkbfL9wtykWsiswaDg+PK2jg==
X-Received: by 2002:a05:6402:2807:b0:5ce:fa47:18b6 with SMTP id 4fb4d7f45d1cf-5cff4c41f5fmr982907a12.12.1732095818491;
        Wed, 20 Nov 2024 01:43:38 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff44de59bsm615495a12.2.2024.11.20.01.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 01:43:38 -0800 (PST)
Message-ID: <0f6241cf-8938-4c3b-82ef-fbfd29676bd7@linaro.org>
Date: Wed, 20 Nov 2024 09:43:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/12] KVM: arm64: arm_spe: Give SPE enabled state to
 KVM
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: coresight@lists.linaro.org, kvmarm@lists.linux.dev,
 Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Fuad Tabba
 <tabba@google.com>, James Morse <james.morse@arm.com>,
 Shiqi Liu <shiqiliu@hust.edu.cn>, Mark Brown <broonie@kernel.org>,
 Raghavendra Rao Ananta <rananta@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241112103717.589952-1-james.clark@linaro.org>
 <20241112103717.589952-8-james.clark@linaro.org> <Zz2o9XryCezwAf61@linux.dev>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Zz2o9XryCezwAf61@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_014340_691799_DB3563A3 
X-CRM114-Status: GOOD (  26.24  )
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



On 20/11/2024 9:16 am, Oliver Upton wrote:
> Hi James,
> 
> On Tue, Nov 12, 2024 at 10:37:06AM +0000, James Clark wrote:
>> Currently in nVHE, KVM has to check if SPE is enabled on every guest
>> switch even if it was never used. Because it's a debug feature and is
>> more likely to not be used than used, give KVM the SPE buffer status to
>> allow a much simpler and faster do-nothing path in the hyp.
>>
>> This is always called with preemption disabled except for probe/hotplug
>> which gets wrapped with preempt_disable().
> 
> Unless the performance penalty of checking if SPE is measurably bad, I'd
> rather we keep things as-is.
> 
> Folks that want to go fast are probably using VHE to begin with. As you
> note below, we need the hypervisor to decide if SPE is enabled based on
> hardware in protected mode anyway. Using a common flow for protected and
> non-protected configs keeps complexity down and increases the likelihood
> SPE save/restore code actually gets tested.
> 

I'm not sure if there is any measurable difference. This change was 
actually in response to this review from Marc here [1]:

   > Why do we need to save anything if nothing was enabled, which is
   > *all the time*? I'm sorry to break it to you, but nobody uses these
   > features.  So I'd like them to have zero cost when not in use.

   > Surely there is something there that should say "yup, tracing" or
   > not (such as the enable bits), which would avoid hitting the sysreg
   > pointlessly?

I suppose I could have taken the "zero cost" bit a bit too literally and 
maybe there were some simpler optimizations that didn't involve strongly 
coupling the driver to KVM. At least for enable/disable, for filtering 
it would still be required.

I'm trying to think if there is some middle ground where there is a 
systemwide flag or static key that gets set on the very first SPE or 
trace session. In theory it could be simpler than this per-cpu enable 
disable stuff, but in the end it pretty much ends up needing the same 
info from the driver (and has the same protected mode issue). So you 
might as well do it as fine grained as this or not at all like you suggest.

[1]: https://lore.kernel.org/linux-arm-kernel/86bk832jza.wl-maz@kernel.org/


