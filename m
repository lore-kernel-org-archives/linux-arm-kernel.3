Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE34C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 05:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wN405h1WvQQ42J9aP5itCeH3PDbeYvXDW/m8ee+hMM=; b=G22nxcuMK0jmW8NSU55+p9vYlc
	nbCrJubvdk5wkS5ziFGQz7FNosFGg2UDK+LLEm9H89jXjwQCJZZCft9jtomC9IIrzwzLJqUCaS0HZ
	iZvARv4z6IBhZSviQreFkfWZseRcX2FN+KgTUv2VxPbSVUThIaYv19OQRK0fWgEjJetLfrtS7gpV+
	vUK0oQQQjVicGuwhMPW0kvFGRlL3VmVQu5zEBjS9DIAjGnmvlIfl41ZNOCTkAU6/MWY7/4XJDORu/
	hm4biEvH7Bul33l30z1x2b6tizbzU/qH5WpJDWEp9AqtDnb2PpJMqFy9rZsWd+uldskhgZLGzRQ+A
	C7nvY4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZJo-000000093Pb-1zfu;
	Wed, 19 Aug 2026 05:58:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZJl-000000093ON-1IsR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 05:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787119108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wN405h1WvQQ42J9aP5itCeH3PDbeYvXDW/m8ee+hMM=;
	b=AV+A21Wzyh5khlos/gEf5j2x4C/baauy461tQ4foXjborAp5od63YGou6O7SOrMH5II7NH
	EUf0ViY5IKpm2X91P0/nMKZoj3pIkl3TxI0qSnAYLinXsc/P58qaKUCpdM6nyBaA7m9wPs
	G4GOxMsYnQMmyxIeNQPabwM49+3dXTw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642--m1GuGsEPFi7McoOsqLlJQ-1; Wed, 19 Aug 2026 01:58:23 -0400
X-MC-Unique: -m1GuGsEPFi7McoOsqLlJQ-1
X-Mimecast-MFC-AGG-ID: -m1GuGsEPFi7McoOsqLlJQ_1787119102
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so9460385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 22:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119102; x=1787723902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wN405h1WvQQ42J9aP5itCeH3PDbeYvXDW/m8ee+hMM=;
        b=Lnsb9/EOUpNHb2ga+GrgF4a9j6ahMQN2ucIuqVZsmr1IhM9LnrXm+H1veu/Cp0SObD
         Ct4X76WFJYY+Zl/XsS6f/sxClwJ8a5rW1s7AHe3QV8XAZp445tzn0SwVfnHNORaa3UNa
         GIUDoG4/3Vfb8Szzu9NEWDuQueJ4rtInO+IdKGlkRvFyQG6lzvIzXATgCXxn5WS6kocH
         Pv2jeYGCDH1H0v0T2yhXFYV+xox0C5QDPUfdre2giyI+aGWuOuuOjbPWgEJpF5+4n+b3
         xhpf/mqrSKRPrPVceUCYhdii+DgG+lU28S1laIkftz7q/1Cs9xHhvGzscj+0D5qwyxuY
         PQiw==
X-Forwarded-Encrypted: i=1; AHgh+Rol+JBGCFa2VJ9oW4bHWwFO8f6qHns2790QYeUHmS7WdS6/PopWzAZkE92ac9sYurHUJ0yTDkICB89deT+osCMU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwev23Z5i9N2cH8UyJO3f/USb8/bzQt6W2MNcRD0DSfZ/EkahT
	uDtBYzLHBNz/Lf8iBP1WtrkshGikLF3V85pNDrO929RmnhZ/8irPvpi8Ap/0teMGVFdGO8PaQWt
	6U0Hn01IwrP04RwrYNAXGnuNvDM+zuiuGiXmmwiF6xc7KllA49NtRnjKUGinTuZvdotasnZXe2v
	ln
X-Gm-Gg: AR+sD11NSrhfsyw+UZCxTrZ5BT51OSAXsd1AI5EE1r7P1Dxzhh6neREwJ7nQpcdMI1Z
	dbW5WPl6r08QMyVjEkzGFYcVp6NMt2ESnQcglmVvyTP6Lp54ak0tZ8XxKluCnpX+0bhP0vnexHj
	+Bb0ehevgWPLcVmFzsMJaMDIJo64SrPdt09IhSK2QnaVFFuSNBx0c+Gz9doarR/+wF0tExmGJOo
	pv6VnAADPcKElV4dvmZkzDz21Zb1QYaFNN8kDv7AYsit/gFJrovd8z2CgQM5nT/ueiFrBLvopA4
	G1uiYEtZH5eI/cOT1TYleHbfHAhO0lGqC5RAxcp5GsnYywIcbPk85EzN5lxZLzdJvnSbAy4rQPf
	Da4M5woX7Esky4b5Zknii
X-Received: by 2002:a17:902:fd87:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d5fd6b0aebmr41700085ad.6.1787119101993;
        Tue, 18 Aug 2026 22:58:21 -0700 (PDT)
X-Received: by 2002:a17:902:fd87:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d5fd6b0aebmr41699365ad.6.1787119101427;
        Tue, 18 Aug 2026 22:58:21 -0700 (PDT)
Received: from [10.76.99.122] ([115.110.236.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e5506asm20846515ad.43.2026.08.18.22.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:58:20 -0700 (PDT)
Message-ID: <0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com>
Date: Wed, 19 Aug 2026 11:28:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
 <2vxzv79c23j6.fsf@kernel.org>
 <9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
 <2vxzbjaz2269.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzbjaz2269.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lB5eyFUeiRS_Q5SIntiTkJYH9ONCuHGmp3vo4IiO_r4_1787119102
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_225829_672499_0D501EED 
X-CRM114-Status: GOOD (  46.77  )
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

Hi Pratyush,

On 18/08/26 3:14 pm, Pratyush Yadav wrote:
> On Fri, Aug 14 2026, Mukesh Pilaniya wrote:
> 
>> Hi Pratyush,
>> On 14/08/26 7:43 pm, Pratyush Yadav wrote:
>>> On Thu, Aug 13 2026, Mukesh Pilaniya wrote:
>>>
>>>> Several kexec_file_load() image probe functions return -EINVAL when
>>>> they do not recognize the image format.  A probe function that rejects
>>>> an image should return -ENOEXEC to indicate that the image is not a
>>>> recognized executable format.  -EINVAL implies a problem with the
>>>> syscall parameters, not with image recognition.
>>>>
>>>> kexec_image_probe_default() iterates through registered loaders and
>>>> returns the last probe's error code to the caller.  That error
>>>> propagates as the kexec_file_load() return value to userspace.
>>>> Returning -EINVAL from a probe when no loader matches is semantically
>>>> incorrect and misleads userspace about the nature of the failure.
>>>>
>>>> Return -ENOEXEC from all probe functions and their helpers when the
>>>> image format is not recognized.
>>>
>>> Sounds fine in principle but can you please also share what the real
>>> problem you face is and how changing these return codes helps? These
>>> error codes are uAPI and while we _can_ change them as long as we don't
>>> break something, there should be a clear motivation for doing so.
>>>
>>> [...]
>>>
>> While debugging a misleading error on s390x where kexec -s reported
>> "syscall kexec_file_load not available" instead of the actual EINVAL
>> from a kernel command line that exceeded the architecture limit, we
>> traced the problem to the kexec-tools userspace utility treating
>> EINVAL the same as ENOSYS and ENOEXEC -- as a signal to silently fall
>> back to kexec_load().
>>
>> kexec-tools supports two syscalls: kexec_file_load() and the older
>> kexec_load(). With -a (the default), it tries kexec_file_load()
>> first and falls back to kexec_load() when the syscall is not
>> implemented (ENOSYS) or the kernel does not have a loader for the
>> image format. With -s, it uses kexec_file_load() only with no
>> fallback.
>>
>> When the kernel returns -EINVAL it means something went wrong while
>> loading the image, not that the syscall is missing or the image
>> format is unrecognized. kexec-tools should not fall back to the
>> older syscall in that case. However, some kernel probe functions
>> currently return -EINVAL when the image header does not match,
>> instead of returning -ENOEXEC. Keeping EINVAL in the fallback set
>> to accommodate these probes has the side effect of also hiding
>> genuine loading errors like an oversized command line.
>>
>> kexec-tools should only fall back when kexec_file_load() is not
>> implemented or does not have a matching loader -- not when something
>> goes wrong during load.
>>
>> The fix on the kexec-tools side is to remove EINVAL from the fallback
>> set, but that requires the kernel to be clean first -- probe functions
>> must return -ENOEXEC when they do not recognize an image format, not -EINVAL.
> 
> Okay, the idea makes sense. Though I am curious if in practice there are
> images that kexec_file_load() can't load but kexec-tools can.
> 
> But then I went and looked at the code. The only caller of the probe
> functions I can see is kexec_image_probe_default(). Looking at its code:
> 
>   int kexec_image_probe_default(struct kimage *image, void *buf,
>   			      unsigned long buf_len)
>   {
>   	const struct kexec_file_ops * const *fops;
>   	int ret = -ENOEXEC;
>   
>   	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
>   		ret = (*fops)->probe(buf, buf_len);
>   		if (!ret) {
>   			image->fops = *fops;
>   			return ret;
>   		}
>   	}
>   
>   	return ret;
>   }
> 
> It defaults ret to -ENOEXEC, which makes sense, but then lets it be
> over-written by each loader. So in practice, it returns what the _last_
> loader returned. _This_ makes no sense. Why should the last loader be
> any special?
Right, the last loader overwriting ret, the commit message describes
this as well. It makes no sense for the return value to depend on
whichever loader happens to be last in the array.

> 
> From reading the code, I think what the author of this wanted to do is
> to try all loaders, and return -ENOEXEC if none succeeded. But the code
> of course strays from that and ends up returning the last loader's
> value.IMHO the function should only try the next loader when a probe returns
-ENOEXEC, not for any other error like -ENOMEM, which is a real failure
and should be propagated immediately, not silently discarded.

> 
> So how about the below diff instead? (** only compile tested **)
> 
> --- 8< ---
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 2bfbb2d144e6..cfb2b8cd5679 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -67,17 +67,16 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>  			      unsigned long buf_len)
>  {
>  	const struct kexec_file_ops * const *fops;
> -	int ret = -ENOEXEC;
>  
>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
> -		ret = (*fops)->probe(buf, buf_len);
> -		if (!ret) {
> +		if (!(*fops)->probe(buf, buf_len)) {
>  			image->fops = *fops;
> -			return ret;
> +			return 0;
>  		}
>  	}
>  
> -	return ret;
> +	/* No loader found. */
> +	return -ENOEXEC;
>  }
Nice catch, Pratyush but this discards all non-zero return values from
probe functions, which means real errors get swallowed. For example,
kexec_elf_probe() can return -ENOMEM when kzalloc() fails in
elf_read_phdrs(). With this diff, that -ENOMEM becomes -ENOEXEC, which
tells userspace "no loader found" when the actual problem was a memory
allocation failure.

>  
>  static void *kexec_image_load_default(struct kimage *image)
> 
How about the following instead? It keeps the probe return value and
distinguishes -ENOEXEC (format not recognized, try next loader) from any
other error (real failure, propagate immediately):
﻿
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..ceb5c97cedac 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image,
void *buf,
 			      unsigned long buf_len)
 {
 	const struct kexec_file_ops * const *fops;
-	int ret = -ENOEXEC;
+	int ret;

 	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
 		ret = (*fops)->probe(buf, buf_len);
-		if (!ret) {
+		if (ret == 0) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (ret != -ENOEXEC)
+			return ret;
 	}

-	return ret;
+	return -ENOEXEC;
 }

 static void *kexec_image_load_default(struct kimage *image)


This requires probe functions to return -ENOEXEC from fixes in patch 1.
I will add this as a separate patch on top in v2.

Does this looks good to you ?

--
Regards,
Mukesh Pilaniya


