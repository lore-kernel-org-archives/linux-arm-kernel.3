Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52131CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtEDtvTY+cIWIGM0pelvhRwZ4E8HNdVkiBIKwKLkzCw=; b=hS6CTZtrkXmMgVYh0jIBnhmAie
	R5XCORORV0CDpGVcqyfaHDPokHpcPpz+VEtfKh3Z1Ldjd8pvifA6kuFSW5NDzlCFAmAvZLt5hVEWo
	TEinZd9QQVllaSslp1PHp4yEB6txolUFjVFHXgRe7Sg6Jxa2yZr0EuCqvWR2Z8GvYjU5++WVgqmVw
	4rCkSPM4JatmlOM7mlqq4c3Eo/4loFaektEDuruZw3M9co/IGKm4R4DTfjamanNVnpLJmP40kLkGh
	9rq8DagZtJGoAVPYyB7HPvp24OnnYLrj76JuW6Z9/f3u48eAJ0EHSMHFzseu/aW+PPklBNOLBQ6sZ
	MPz8ULKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFOz-0000000BjIs-2p2a;
	Tue, 04 Nov 2025 11:40:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFOx-0000000BjIU-1ntb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 11:40:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so43938505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 03:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762256437; x=1762861237; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtEDtvTY+cIWIGM0pelvhRwZ4E8HNdVkiBIKwKLkzCw=;
        b=JKzlh77YKe8GaHnS8DzPqR1B3ZyKIyOkdIWrhR3dpFMMHU8ZJo+D88O8z3xqrQaOFv
         Ds0PGaJ5x8v9JfLfjejDRlKZGhuHxCZWCN48kXkG2PXGJ7vwANmRmABjH+r0bM1WdBQf
         KckMZJ/mYU1ib8Ud7qvWlFpiEh74fMY+zhEIq5i1WdtJwKxpLXY8U9ssYZfy4tkeF6Oa
         dxQQZyeH1PaXauKvFUTvY4QBI4DDZf1qH0a7s6SFFLjG6FAGtDg+avEcMnpmwtdlNLwr
         L7VlfK+Da3/tC26iJIcqw2XxWJgMwRCjUorQKkQTEOBTvLOYsYY5mVmlI7BOlgQGGLr7
         NYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762256437; x=1762861237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtEDtvTY+cIWIGM0pelvhRwZ4E8HNdVkiBIKwKLkzCw=;
        b=lFv7tt16pszSu90DUSVeKC5dBTq906aPR+yGuuPHOTd0Zcqmo466dbg93do8/xWkIJ
         W/5LEs43yPmaOHZUyhjE4zgF2Vwia4kLhHpPbBtw4cijDvecJOoKONS6ARvv95D4AFP4
         2hPBTWmtKmuEbKD2uXkYtBi7U6mLSy83MK3IB0UXkXC5W5tdUvG59PM8T9AebQMYm/gY
         AXMfqQCMIR/AXI7FQBR7rjZKsAOfaRS2fRLcJZrfkbsKnwQviX+SIhZmf29u95ZF00g5
         s8SMDELBplkFJB8avwwEkEL50q/cS2vvThHqIsDVen850kLEFp/kcL3xG4cmsuFlvAkZ
         8jQw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Js1kc0qY9+UI5lSzF218mt5xJFWjblzrYH0a5eMmHO5RknD+tb+NJcLyK8/HrOUZhWjoB8YMdISa/TZbIDUS@lists.infradead.org
X-Gm-Message-State: AOJu0YxG8o2k4G6wNxNwTxMleKQsmgy4AQHGdjn+lCCnsj0k3vBL3ZyW
	truU00Gs0yhJoI+Fjfs5tzzf2V7Z6sF/Vg/4zqD9hWXNxtB9J7vgJP6r
X-Gm-Gg: ASbGncsOZRtJdiWA9Is2gdRe59eilfTvqmdFTd9b0EEUCcMzPy+4HLPcLq5yo64w9ai
	+YwS5627CAhefR/JifoDZ4agI8TiDhZHWy3gtzDB8ywRVwYXGqQGnaDOHODCpTJignC8Ht/kOV7
	WZwfbjrvyBKZquX1FnI8qZ0LTK8mECh2IQHiV9+6XMP8ZDSDbGgJOmqO56e4279W9Eptah+VVDq
	CgSWCQ5IOsr+Q0y9WV477MWfvL78k2q0RMWNUjkzOaGlLBypR+e2ukSYwGqOV8nYsJbHj+0vgbo
	m8jpp8aNEP6ScfzxcZa4txZjiqDSBix5w3M8UGPXVrWe3I4mGZPyy4IIoHM847BYZqPDyG3y3Xk
	KX0v12yqF0RTGkqc4WjN/AIjkINeA7TobmJoNNFmpcRIvjKvIZc2xyj7P6igx4rR1lMxnLlnJar
	L1Z/a6fwSNKattohTIXmDIbEACNQ==
X-Google-Smtp-Source: AGHT+IHLUzkgy93j93/Y457i3JDPVA/x2jz7pwHQeQNMkgQOo5iNeUyTYKEKqioqrc6ql8RXud3YDA==
X-Received: by 2002:a05:600c:3146:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47730802c68mr141327745e9.13.1762256436466;
        Tue, 04 Nov 2025 03:40:36 -0800 (PST)
Received: from [10.24.66.43] ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755a550dfsm33200985e9.17.2025.11.04.03.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:40:36 -0800 (PST)
Message-ID: <0c3db907-7012-43c3-b7fc-36848789da52@gmail.com>
Date: Tue, 4 Nov 2025 11:40:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] KVM: selftests: Fix unaligned mmap allocations
To: Sean Christopherson <seanjc@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 isaku.yamahata@intel.com, roypat@amazon.co.uk, kalyazin@amazon.co.uk,
 jackabt@amazon.com
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
 <20251013151502.6679-3-jackabt.amazon@gmail.com>
 <aPpi1c-8EpWuo87B@google.com>
 <c52db7bf-494f-49a8-9829-3805db6dda7c@gmail.com>
 <aQkZtjLt6lIULffA@google.com>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <aQkZtjLt6lIULffA@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_034039_526364_AF12F965 
X-CRM114-Status: GOOD (  15.01  )
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

On 03/11/2025 9:08 pm, Sean Christopherson wrote:
> On Tue, Oct 28, 2025, Jack Thomson wrote:
>>
>>
>> On 23/10/2025 6:16 pm, Sean Christopherson wrote:
>>> On Mon, Oct 13, 2025, Jack Thomson wrote:
>>>> From: Jack Thomson <jackabt@amazon.com>
>>>>
>>>> When creating a VM using mmap with huge pages, and the memory amount does
>>>> not align with the underlying page size. The stored mmap_size value does
>>>> not account for the fact that mmap will automatically align the length
>>>> to a multiple of the underlying page size. During the teardown of the
>>>> test, munmap is used. However, munmap requires the length to be a
>>>> multiple of the underlying page size.
>>>
>>> What happens when selftests use the wrong map_size?  E.g. is munmap() silently
>>> failing?  If so, then I should probably take this particular patch through
>>> kvm-x86/gmem, otherwise it means we'll start getting asserts due to:
>>>
>>>     3223560c93eb ("KVM: selftests: Define wrappers for common syscalls to assert success")
>>>
>>> If munmap() isn't failing, then that begs the question of what this patch is
>>> actually doing :-)
>>>
>>
>> Hi Sean, sorry I completely missed your reply.
>>
>> Yeah currently with a misaligned map_size it causes munmap() to fail, I
>> noticed when tested with different backings.
> 
> Exactly which tests fail?  I ask because I'm not sure we want to fix this by
> having vm_mem_add() paper over test issues (I vaguely recall looking at this in
> the past, but I can't find or recall the details).

The test failures happened with pre_faulting tests after adding the
option to change the backing page size [1]. If you'd prefer to
have the test handle with this I'll update there instead.

[1]
https://lore.kernel.org/all/20251013151502.6679-5-jackabt.amazon@gmail.com

-- 
Thanks,
Jack

