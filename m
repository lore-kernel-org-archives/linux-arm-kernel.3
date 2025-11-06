Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE790CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 21:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5xVpAr9ZbKaVO0bAtNOEOCLIRQmDJLc8ZfpgxCZQug=; b=P2QMbR40ylxQQtKt0UtZpf/gS4
	HeFWRduMmkCxXfQRErcakEbCFviUEGaPZiG8hdCQhYnk0bErLX4TrGpDdl3Qediqhfvj/W/C4slvs
	+jrIjpqRi1Ir6+kZFYVnjEneS+8h6KiAO40no1fFIWNaA3ChTy9sUEtO4O+l5sBX3aYHcLcPCHxTN
	w2OpXYlI83A5IaxwmUI4zt+xIGMlv6PcEtBXnBHNk8QiuYOp8uq6HUrgssldt4r5e3XipbqUEKSq3
	nso4XP60Ur1LEYZbyUXRC6hSEE2Y3hIRVwwwb981YkvrXa+URJD9uR6ZGa96StQfXr4btwULjJDzH
	r0KradiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH7DQ-0000000GGQs-08cX;
	Thu, 06 Nov 2025 21:08:20 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH7DN-0000000GGQU-3Mnr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 21:08:19 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-477563e28a3so414705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 13:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762463296; x=1763068096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5xVpAr9ZbKaVO0bAtNOEOCLIRQmDJLc8ZfpgxCZQug=;
        b=ZZLLqEd0y/+/O1vT9+2aKNFH+vgypsdjUgQt9/bsr3bUkBq8KYWLwQ7KzkdYQCiVNH
         +nOKYs1PaYMtqRI2Ofd8izRM4SUV6LrQjnAaPGB5DyqCFCXfARxI+KZ/uXPB6Jumz24k
         p48VyvqD5Pvqwe64HKijfP+OsnzKzIaWKh+RjBsyYjOifsX5czyayE/MOnlMcMNhUIYA
         loHNnjuv3Rm/WR0J6afl5jRACctVCeYN/Ej3LMOly2yA+03U8UdiryY7VcTP5CuKlVnJ
         zCA9LZ8HG0yIat4O87cEtOqrEeT9vewQFdZNBhcSnxs6zzRtefr45oA3VNztNzB8SOp3
         7pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762463296; x=1763068096;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5xVpAr9ZbKaVO0bAtNOEOCLIRQmDJLc8ZfpgxCZQug=;
        b=mywLuYeMXO73g4rtik6kggGSa+J2kVNMaGJy1V5NIxkJO2bpqHmBH5t8ZjMLkl3PCy
         3sh3/hyvsnNuHPM5u1V28yr7I2Q8LC4wcbQjSlrYpTCg4glPnz4aqaPhi/RljfJTgQx0
         x0D+4VNEQqGQi3UyqCcXMZzCPblPl8PDK2vu7Qy/diKTY5OmorWRTS0gRVhW8Sm/9Xdu
         4c6ao59HfknlITXVYb9Xl5KosGxPVBqXU9pVzz3rehnwER+hZTTFJYAA+aSGla8zTqUC
         RpZS0gFUHZEksKFMQwSDJ6JQ41T+25PXZXL3PfbEk3dTe26ljMskjLWuQomYUpeTyBB2
         jJMg==
X-Gm-Message-State: AOJu0YwZQGTi81fi5IVxI0vTq0OHCycU5eVSL8PLTlEky9FZbNL4kTLv
	kQDDwkyoQx+4BHmM+K4t3na9eQkZ5VzWEYk/R3+aHVEh5v8swtX8tpDJ
X-Gm-Gg: ASbGnct0i0qM5izNNo+9C4ndUMnW7wqsaCuNUV+hkwTgot7KXE1nGhCZtOuanjpyPTB
	EqVUeBv3TrZITO50MBHV+RtOjRuWURWxiplVtEud+KJFhNLJNr3R9Olv59YIyEZ1ufJ92sqC33X
	OM3igBiuFBLR94buf/dZXxUQD2GPUPLWLdjRJMVYfzE2EKrDSIcIEJ/UFQ6cLr2ENTVtaFpCSic
	++MNbfXwaKy57se/5fUaqEJu5qnkMgzp2RT0zA9tmYUcSvi7uNkhwrtAYaShtfNOSRsvv23cP52
	OeGf26RDINjx9nvVketP98Og2X3pppJj9iUoTlCkiWn4WQQgaBa9659+A3BAWtaZ5IkGvOuH/gX
	DCRBOZMlzNV8+CKh3Aknh0PlarUKiW4hOQH8u7GlIRXSFYdSebQ+6LaCHerLKrDIW4W241cJJWE
	Ht18pbbnHgripnjpPcuCSh5sVOEIFHF3Pk4axHbVI=
X-Google-Smtp-Source: AGHT+IHlju2rSLGApcUhNyvklc08dTRWO1IjCiDhqZ7qoZQsGLq1uvql05prWWXeOTbmMu/aHY+nIw==
X-Received: by 2002:a05:600c:4ec6:b0:471:665:e688 with SMTP id 5b1f17b1804b1-4776baa5b9emr9690255e9.17.1762463295905;
        Thu, 06 Nov 2025 13:08:15 -0800 (PST)
Received: from [192.168.3.141] (p4ff1feb5.dip0.t-ipconnect.de. [79.241.254.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm1300220f8f.41.2025.11.06.13.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 13:08:15 -0800 (PST)
Message-ID: <de2f65f0-8b5d-4d64-a918-4f0c91ee3e59@gmail.com>
Date: Thu, 6 Nov 2025 22:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Don't sleep in
 split_kernel_leaf_mapping() when in atomic context
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, yang@os.amperecomputing.com, ardb@kernel.org,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@google.com>
References: <20251106160945.3182799-1-ryan.roberts@arm.com>
 <20251106160945.3182799-2-ryan.roberts@arm.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20251106160945.3182799-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_130817_882475_3DB28B9C 
X-CRM114-Status: GOOD (  18.36  )
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

On 06.11.25 17:09, Ryan Roberts wrote:
> It has been reported that split_kernel_leaf_mapping() is trying to sleep
> in non-sleepable context. It does this when acquiring the
> pgtable_split_lock mutex, when either CONFIG_DEBUG_PAGEALLOC or
> CONFIG_KFENCE are enabled, which change linear map permissions within
> softirq context during memory allocation and/or freeing. All other paths
> into this function are called from sleepable context and so are safe.
> 
> But it turns out that the memory for which these 2 features may attempt
> to modify the permissions is always mapped by pte, so there is no need
> to attempt to split the mapping. So let's exit early in these cases and
> avoid attempting to take the mutex.
> 
> There is one wrinkle to this approach; late-initialized kfence allocates
> it's pool from the buddy which may be block mapped. So we must hook that
> allocation and convert it to pte-mappings up front. Previously this was
> done as a side-effect of kfence protecting all the individual pages in
> its pool at init-time, but this no longer works due to the added early
> exit path in split_kernel_leaf_mapping().
> 
> So instead, do this via the existing arch_kfence_init_pool() arch hook,
> and reuse the existing linear_map_split_to_ptes() infrastructure.
> 
> Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net/
> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> Tested-by: Guenter Roeck <groeck@google.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---

Reviewed-by: David Hildenbrand (Red Hat) <david@kernel.org>

