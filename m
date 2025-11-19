Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866FACF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXp2uUfyAn7qQSV84bcf4nMWFAwyWFqJON+TttJbAcU=; b=Xra/qBaSUCw/URBGfPiLYo1Mmp
	KOGmHTVBMnAY6GUG5Ml44WKI3Lft1lGendcfkLeSJ3+PA+NFeqnJkSPyDUy1FRFsKKPfUOTtB6xBW
	ydEKxuYyLTDyvujRAwrKiaFY/VM//CdW1mr8oUE8O61eJWuuXLJx2lWVNNk0Q5wxRIsOTkncbpHzL
	jWs+WuZkR31w34udgWaL8rW9OqUgcWP93gGWNivkPjgsz1JuM5UosV29tKyFF8dK93DgnmUDS5+ql
	nxNZe9bBUpEgZG2oajpaYC07RH6AHdT6ApyP8l91iTh8mlsEzGF1ARm+tVPlouLemmD5b2PjuZor1
	hzpzx+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmr1-00000004YrV-0Bx9;
	Wed, 19 Nov 2025 18:24:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmqx-00000004Yp9-44oP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:24:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so2414385a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763576666; x=1764181466; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXp2uUfyAn7qQSV84bcf4nMWFAwyWFqJON+TttJbAcU=;
        b=lIrv0qJKMGFMJ5/lPiwxItupTd2SREj27gyaQYUaOIZbYiiT+bOKl+dUd9EBBDuTuC
         1mYZqqzdDvRFwVhAR2vQvLJ6r8y/lyG1vOA6X4zDJY1nO8GacdvJ512o9n4QcKb9u9yU
         o0DFftk3Dr35NYdu6BsTl5ZwoQXD1sL5QcPDu+Wq41WCZfPlrXDQ9ke/IVx0+Ow7J5PH
         lp0elPj42XUXZaaLRPgrCuBXYNuZbZkdfWXCq8ear42ZgvfRT84Pt71hdZl4S9OEHHFC
         d8zTU0ttNkFji/JWDKGHGNjcpOzju5NPNr1EM3JNLRZiidVWDHNBxVqEieo4SWiR0Biy
         OluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576666; x=1764181466;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXp2uUfyAn7qQSV84bcf4nMWFAwyWFqJON+TttJbAcU=;
        b=kYdBG5RrAGP3QUNT3RC7bnrazdTb1VYRDz0m2aK5khfQ9qklzeUpkc8QwptQH4UeGY
         LuysswrabjQQQ1u8LQ8uUAUQTutLMdbe6s0QVg9jI+fGQyD0qIryhZj4GYe4pPAdkyTk
         JbIGjoUDjaQkRJMEV5dQtaoN8jgIm3KTkgBkGeO4kthbLad/iQ+b8v48sbhxf8JZsVzE
         ZBVCAuOeUEDaMQhKHMbBBlJJP1MKzoVX+0gr5Ke27i943ftYRhcTkLsvFS1BcwLSSh1J
         nhGSq5yyVWljRShofyDeJx9sceGuNdioX1/Xd3nuXtdBnQyiVJv+ls2qLNuc2Ja5dDW6
         A1mg==
X-Forwarded-Encrypted: i=1; AJvYcCWcTTmQ5+mwvD9kRFO3OsyCxgru5cmFV7ujf4wA4ESyAoPrpmRn1QpyxTi6o7tP6OY/YCY37qC5qx88A8bMD+Gh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt0qDO8YOyl+DYPGTCzYCMXKKUgorrLojhYOJBCZQJRJbjfwng
	HMh3V9vhtozDFMXBTTY1RdJ5Y/ZyFFGrmw6/Auk6owzs7mpVe9JO0V4OepcfOQ7yRhM=
X-Gm-Gg: ASbGnct9H5RTi7+IzQqZ/TdIBPvpPuLKPi4NWvFxlpnTO8/2IS7Dr7AmlnCT6VRc0or
	vFBYFhjOT7Gb7JokEWPmlCl9q6oXYBA4hOs30reWmE8HQZOM5D/tz5uj0UK/3aPTe0icjFe3qKa
	g9ivRhQwx1nHSsX0tNEC+QlKTdxJgNswC4BHspN3gInPgro6aG8ILeSNm3WIqJP0sjFekdDDPP2
	3YhWOjMt1cpXDvDGUkZu6oH/57TsDXjZPKtEWlzyyR7H/g8kPJofw0pdSSgO4OavlDeF6Lv0ab4
	H2sbgkY/MPhYrbiVFDiFwVbUpceSInEG0kYSO2Q9M4H2TzRQ3rKEMMZ0QQ/mMMvpEOV9Z6xQjBz
	xLTNjlCvAmC5+TGiCu0/ARzrGfQmZwywFLUFDBc4g/nGxyToCdkv7OcYJKuc9Gtx9qXM7SP6BtW
	/quW6oD1NUdjNquTuxx9BJ3SBdScDmE3o=
X-Google-Smtp-Source: AGHT+IHFWcpqhe+aEp30Ksls0LghzQFo1sGYaD1WHh6eJAE08Lx/+/aqM6jp4/gMRRi4U1LtQQLFuQ==
X-Received: by 2002:a05:6402:5247:b0:643:129f:9d8e with SMTP id 4fb4d7f45d1cf-645363e41d7mr312140a12.8.1763576665944;
        Wed, 19 Nov 2025 10:24:25 -0800 (PST)
Received: from [10.101.2.140] ([93.122.165.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b66e5sm169342a12.14.2025.11.19.10.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 10:24:25 -0800 (PST)
Message-ID: <b0102b82-9ae8-4e01-ba27-44b78b710fca@linaro.org>
Date: Wed, 19 Nov 2025 20:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arch@vger.kernel.org,
 tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119131534.392277e3@gandalf.local.home>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251119131534.392277e3@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_102428_070329_C8E563F5 
X-CRM114-Status: GOOD (  38.07  )
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

Hello Steven,

On 11/19/25 20:15, Steven Rostedt wrote:
> On Wed, 19 Nov 2025 17:44:01 +0200
> Eugen Hristev <eugen.hristev@linaro.org> wrote:
> 
>> Once you have all the files simply use `cat` to put them all together,
>> in the order of the indexes.
>> For my kernel config and setup, here is my cat command : (you can use a script
>> or something, I haven't done that so far):
> 
> Interesting.  Hmm, it seems this could be used with the persistent ring
> buffer code as well. But if the firmware does not keep the memory around on
> reboot (where the buffer would be reloaded), you could mark the persistent
> ring buffer's memory to be inspected.

I was kinda hoping I could get a chance to talk to you about this.

I managed to mark the trace buffer for inspection. By using the cmd line
argument to have it preallocated, it was very easy to just mark it for
inspection and dump it on a crash, as a dedicated meminspect region.

> 
> The persistent ring buffer creates a single allocation to hold all per-cpu
> memory in a single region. That is, because on a crash and reboot, it
> expects that memory to be at the same location and does a verification
> check to see if it contains a valid buffer. If it does, it will recreate it
> for view in the instance directory of choice.
> 
> Now if this same range is marked for inspection, you could then download
> the entire contents of the persistent ring buffer after a crash. It would
> be trivial to update trace-cmd's restore functionality to rebuild a
> trace.dat file from it. It would require saving the event formats of the
> running kernel before the crash, but that's not hard to do.

The problem is that all the meta-data is not allocated inside the
preallocated buffer. The meta-data is kmalloced all around the code. I
mean the structs that hold the information on what's in the buffer. You
know what I mean.
And all these kmalloced things, turn out to be in order of hundreds just
on a kernel boot, which I tested. This is not feasible for the
meminspect table, as it would get overcrowded very easily.
I thought of perhaps trying to kmalloc all of them in a dedicated cache,
but I haven't progressed on that. Another idea would be to try to
recreate the meta, but I have not found a way to do it yet.>
> That is, by using the persistent ring buffer code with the meminspect, if
> the firmware doesn't save the memory across reboots but allows you to dump
> it to disk, you can enable tracing within the persistent ring buffer, on
> crash, extract the buffer, and then use trace-cmd to rebuild a trace.dat
> file that you can now inspect, and see the trace that lead up to the crash.
I used 'crash' tool with trace plugin and I am able to see all the trace
contents, but, with the limitation above. (To achieve this, I dumped a
huge area to include it, so , not feasible for my goal )

> 
> Now I don't have any hardware that uses this feature (not that I know of),
> but if others find this useful, I would most definitely help them implement
> it.

We could have some drivers pass the inspection table and then store it
in ramoops e.g., tapping into pstore. This idea has been going around,
but I have not had the chance to write a pstore thing yet.

So , I was stuck, and I was hoping to talk to you, either by email or
maybe at Plumbers in Tokyo where I have a talk about meminspect.

Thanks for looking into it,
Eugen

> 
> -- Steve


