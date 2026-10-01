Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A09CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMYtf80P5oX4IkVB/3A4AGGwzt6DCWZzJjMZ+oV75Lw=; b=0GVDO/eehGiaFC9iyAcZhpAEgJ
	NSQYfu5yFFdPvrxXitqfVmA13G3ZtOYORU3PBmEJjhuUZrfGOHvHbaebFf0tRC9dfQZa1++C1btjS
	uaaUDa0WQYUNSgsfHdj4NC6hIocu+yJjgsnMeZ8w/Kn9zZMLnByU69UsuQb3q4xaPF3Xhbp0V5b7G
	ezqOPkMeQsk0W9ZYpgmp02DDDzZmSrgTXkprgJQDK7Kx0of8YXSQF0QVD1xbmPmnurVWj1oKRbSc9
	PD6f86s4pqxMSlsT5BFbGbYdVlkucQSyYJUu0RErFVlmT22aIcA/sP03n25Gh+bNXkwc4nFPN+Eml
	tz/+ho3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFzU-0000000949I-1fYk;
	Thu, 01 Oct 2026 12:34:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFzR-0000000948D-3Zqk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790858059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMYtf80P5oX4IkVB/3A4AGGwzt6DCWZzJjMZ+oV75Lw=;
	b=R7n+h50jX04mI4k4OlpFiJCdbQPkj9PRBz0hvCx/+GwPO6AHj3PzsvIfn7MeL5cLgaUk++
	UXQNsciGQnVVmxFoFRLk1WD1QUAb03fVTMBQFTAVR3bN+XSWzJ32FtmX/0NZ7vG1i7X9ek
	HheuS5r7nmVGNCGvmE1qzp4Dk5IcUQ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-oJ90GtWnNyiDc3FGl0SQmA-1; Thu, 01 Oct 2026 08:32:52 -0400
X-MC-Unique: oJ90GtWnNyiDc3FGl0SQmA-1
X-Mimecast-MFC-AGG-ID: oJ90GtWnNyiDc3FGl0SQmA_1790857971
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so5894071f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 05:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857971; x=1791462771;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMYtf80P5oX4IkVB/3A4AGGwzt6DCWZzJjMZ+oV75Lw=;
        b=HWtW5FE0k1nl0ECVb5bqNXjEKabOSRt440/eMMYAlE72S8cdIJPOG+iBgHOvF8bNFP
         gxUdGSM+/2RjFzMB8GMs7s+RZkVSsUWOUfbHG2rlGCDxfP5ZKLfpm8VYXar6LlerYBpb
         SGBZXUJiSeOj24E3GxOvy9IF6hf3STi2FBOZdo7YaLXhbZDpL1oSpeS6ePyBdO2Ygjt2
         IiwZ7DWrBqAXY/SF4+hqHcxlykKNkulRN8D8/3iD5f/t7SX7N9i1b44ye/g8xYZeBR6t
         eQ8xAKXHtZhOBzJz7JsAGuKS4BpIrCGztkxAGPZzSLuKdfORp5Mq5+C5XDdwdrjdQWiN
         J/Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxKKCTIAfyf2vn+MjY0ae1U6U0qrXx2apX1BcuxUxVJp/iDgVUOV7AKxqYKLSljwAPzf9he/4+EyQC4FlFGT+fG@lists.infradead.org
X-Gm-Message-State: AFq9FYKKPPwhDyD9R//kR4w/ntjoN1sR9Kn37PgjdGb3YLNdbJfLZAl7
	xZlb6fjjAEWM97qdfnr4ALPfE1L0xOx5eoGdrFRIYTPvOerrPx87nGLQDgg3ENmsAC0qdq3dMJR
	Of5nOczGZhGV9mxAX+vzaiiMG6dxSpkMVYRmS2wsFmvPS8mbkwAGmCQb3IS4spoINXG/1SAe75M
	A=
X-Gm-Gg: AYBFou2q8NeKd9HN7OyFh0XnMz2xVB4mNy5ubyMvGyg8oOLUwFtj/ava383THRneshB
	FmXXFs6RNRc21VPR8joXYcJTgR4IqqY3dFkf2fv//j2S6Rj/8cCk7Jix5NW0UlHAO0sPx9KLJPo
	7Fe6Fr/+fI2Yl0sYF6WDsxWPHehHw9j2QbkKuQkTxH/KRn8diTAiEqKITXXvR/E6hyhXtpb8F0D
	gVD/X3zD6yhKwYW6TgaYbPAIomMMPsRiqOV3t/2Xw7pC84joiXXGwTUF17cFdmtAM/M7sJXvaP+
	arLlfYy6ZDCAbxuCBuk27FBOucsSjyJ3qJJJdIppp5Wcm+K9J5SGLB5HlTvVbYWHFTkTFQ6MIMR
	JTzAe+RINHqp2aMl/L5cpzssSrmGwi7MVzA==
X-Received: by 2002:a05:6000:4107:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48b05870bd4mr4665287f8f.15.1790857970886;
        Thu, 01 Oct 2026 05:32:50 -0700 (PDT)
X-Received: by 2002:a05:6000:4107:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48b05870bd4mr4665181f8f.15.1790857969830;
        Thu, 01 Oct 2026 05:32:49 -0700 (PDT)
Received: from [192.168.0.101] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691d681sm5371173f8f.23.2026.10.01.05.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:32:49 -0700 (PDT)
Message-ID: <5e183c24-4acd-4b79-b601-bd1aa2f53dce@redhat.com>
Date: Thu, 1 Oct 2026 14:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] maccess: Use a scoped guard for page faults
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)"
 <bpf@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT - CORE" <linux-mm@kvack.org>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
 <20260824160523.3907021-5-usama.anjum@arm.com>
 <79daa73b-0d34-4e84-8450-56f90bc700d4@kernel.org>
 <98e9ac67-7df3-4c0a-8814-37e196d94020@arm.com>
 <7454d7a3-57c6-4883-a66b-26129e633c6e@kernel.org>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <7454d7a3-57c6-4883-a66b-26129e633c6e@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RW5lGjFOFHqQoGlxREubxZ03zBnb8yv4N-9d-30GmQw_1790857971
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_053421_974804_1773C107 
X-CRM114-Status: GOOD (  20.75  )
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

On 10/1/26 13:33, David Hildenbrand (Arm) wrote:
> On 8/25/26 14:07, Muhammad Usama Anjum wrote:
>> On 25/08/2026 11:36 am, David Hildenbrand (Arm) wrote:
>>> On 8/24/26 18:04, Muhammad Usama Anjum wrote:
>>>> Kernel nofault copy and string paths open-code page-fault disable and
>>>> enable around label-based loops, duplicating cleanup on success and
>>>> failure.
>>>>
>>>> Use a page-fault scope guard instead. Leaving the scope now re-enables
>>>> page faults on both paths without separate cleanup at the fault label.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>>> ---
>>>>  mm/maccess.c | 53 +++++++++++++++++++++++++---------------------------
>>>>  1 file changed, 25 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/mm/maccess.c b/mm/maccess.c
>>>> index c59a0e092d24a..f695ceefe6fcc 100644
>>>> --- a/mm/maccess.c
>>>> +++ b/mm/maccess.c
>>>> @@ -38,18 +38,17 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
>>>>  	if (!size)
>>>>  		return 0;
>>>>  
>>>> -	pagefault_disable();
>>>> -	if (!(align & 7))
>>>> -		copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
>>>> -	if (!(align & 3))
>>>> -		copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
>>>> -	if (!(align & 1))
>>>> -		copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
>>>> -	copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
>>>> -	pagefault_enable();
>>>> +	scoped_guard(pagefault) {
>>>> +		if (!(align & 7))
>>>> +			copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
>>>> +		if (!(align & 3))
>>>> +			copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
>>>> +		if (!(align & 1))
>>>> +			copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
>>>> +		copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
>>>> +	}
>>>
>>> While I understand what pagefault_disable+pagefault_enable does, it is
>>> completely unclear what scoped_guard(pagefault) does.
>>>
>>> Should this be scoped_guard(disabled_pagefaults) or sth like that?
>>>
>>
>> The `pagefault` guard is already defined in `include/linux/uaccess.h`:
> 
> Ah, sorry, I thought this was added in this series.
> 
> It's completely confusing.
> 
> 	guard(pagefault)();
> 
> meaning "disable pagefault", what?! :)
> 
> CCin Viktor: I see that the patch that introduced that has no acks from MM. I
> don't blame you, because the file is not actually listed under the MM section.

You're right, looking at it back, it's a really unfortunate name.
Renaming to nofault or disable_pagefault is certainly better.

Thanks for pointing this out.

Viktor

> 
> I think this really needs to be cleaned up to clarify that we *disable* pagefaults.
> 
> Usama, can you throw in a patch to clean that up? (calling it nofault,
> disable_pagefaults or whatever)
> 


