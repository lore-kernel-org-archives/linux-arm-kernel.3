Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF91C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=; b=yZMOzN+H0GhXoAlk2Bl7B61m5S
	VaBDbXhWhVLoIZyHw+oXzykW9zZkoX+G2phq0eDsWgBZlqY+Fk5uLn94+xDaCiiT/JHdJnesTd0rj
	ZzvrXph74breZwXEQmsvm0aFVDnodBVSbfBmOjTw1EdVKtGMP1gonhX9brOMWpAVaAsZAm3XHe8FM
	3M6HVnpalJ50gABGw4y3kEkvPYcQziYn0aDiA7vFhqfswdF4yD/+1uPnCCN8z4rQGf5o6Pssbx6wv
	zLxDjumIvwoEvobbPOGfU6u/aTNkInUKOgo3X1VF80ztfAuVKX/wubodqKdWSNXO8YoU/4RG5944/
	w7p5aDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFuK-00000002h7A-2JWF;
	Wed, 26 Aug 2026 15:51:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFuF-00000002h5d-25Mh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787759474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
	b=ee9UIb8XO1dW5K57SBDY0GyRGQziMsa9gt499jcBA4kpQhzPVK7ByFaDlg6+KlJmKDvQ2A
	db/QpH2WxN7dftyCcpuvuHlrxjN7XYACaa6PTAvVp2MgKkVqBVil8b2GZI/UQnC3s2R5SZ
	s2BzGBb3wY7ySfM+ksPYoJUk3iTFCJk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-7k3VEDj_Pq6OSM06-CXhUA-1; Wed, 26 Aug 2026 11:51:12 -0400
X-MC-Unique: 7k3VEDj_Pq6OSM06-CXhUA-1
X-Mimecast-MFC-AGG-ID: 7k3VEDj_Pq6OSM06-CXhUA_1787759471
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso22400645ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 08:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759471; x=1788364271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
        b=YYlvGkolYYbuYaNakHKJ6eOfLdSDy22BjdbXOwkQiqFXXFNSiqHxnN56wpXTugdcmb
         zQjmf713H6egWTr1zyZx9xjTjBEd5Xud5s5jVR2xAmZfdEiS8uHWIXcAPU0gXLBL1ES7
         EVMDdAqas8Xw0N5/5HTqKlGbl+Wm1fTviyRG9VxEqIQP7IoNSAY0wIxC1vwJTgjriOem
         js31XgUFjFZ3/gCEUoG6ELsD85roP37SBgv5qDpievawOYXwq7cLl0UJFLwVou04K8cR
         DIG+0W+BgF6eOfOEhf+Qj0CNVYsnhoZMlrWgxIMo8jJlXLtxKkXFOUPYIZLclGqCxrM9
         nFUg==
X-Forwarded-Encrypted: i=1; AHgh+RqZviQJU6hwcOLksMl/NEm8XfGXyAPU7ErWUGgseR2gR2cOoVBhgpwtJTD5ofQHvdr11KikCOiBzd3A09yJof+e@lists.infradead.org
X-Gm-Message-State: AFuF++moz7lx4VD9+nQGpoJuweYB1zk1aclodzsI63tbD2MtqV0BPvxD
	QVydKfHVw4H2Bx7OQSBWQ8E1Yi6q/R5HBEapWEiaOwIla71+MkfdQt74WS8wfonBnjfodtVxprp
	/vLQOv7+gC846TkkhomB9mVolrRFMHQs06iI5m0utCmuQC6ZIVimgeD7ymcUqYDiU+T4cE+1zto
	1y
X-Gm-Gg: AR+sD11/MzQ3KKIQ8+HcEaADn/1zcijCN4p1W5w4F2YVYYNiBkIPmUfQMEk/zj1Z1y9
	xozYlo9a5VL6mvpkpiTIO8AETxFK9nFCbp6jzKso0ouiQXjlp7opVnaKZbiL43sKHcwSF90jolb
	gV87QWrPLbGpK349yqOZgo2Qv0WHKDHOp+f/UMcUOnK/Z+0Qn/1XFbAwLIwSB6CJKE1S0e/uNZs
	J8U/PwTyyte9Ou5y5AThmqNWzwLO5Rf4M3HrDSSD050dUep+5tB2nR/7fU/5zNZ6GvLXLc1/i1k
	o2a1CLMm57yz1YyPUrrdk4/ybEytF1u46IcjtdVbJ4qnk6hZ0deoSp1RK4DIjlFDJZzHtkva61E
	v9IbThZMeXkCPwi3G
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155457465ad.2.1787759470992;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155456345ad.2.1787759470546;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bf8978sm9118965ad.57.2026.08.26.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:51:09 -0700 (PDT)
Message-ID: <ac453410-67c6-47b4-ae79-fa682780fe49@redhat.com>
Date: Wed, 26 Aug 2026 21:21:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Bradley Morgan <include@grrlz.net>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
 <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
 <aoxQFxuzZ1AHmM8d@willie-the-truck>
 <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
 <ao2xc027TNYTwBA1@willie-the-truck>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <ao2xc027TNYTwBA1@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NgIVVsgSHS-SVcpWd9slanyvi3swbE5HmVb_aa3-5ko_1787759471
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_085115_615410_30355CF8 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Will,

On 25/08/26 8:44 pm, Will Deacon wrote:
> On Tue, Aug 25, 2026 at 10:43:48AM +0530, Mukesh Pilaniya wrote:
>> On 24/08/26 7:37 pm, Will Deacon wrote:
>>> On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
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
>>>>
>>>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>>>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
>>>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>>>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>>>> ---
>>>>  arch/arm64/kernel/kexec_image.c   | 4 ++--
>>>>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>>>  arch/riscv/kernel/kexec_image.c   | 4 ++--
>>>>  kernel/kexec_elf.c                | 4 ++--
>>>>  4 files changed, 8 insertions(+), 8 deletions(-)
>>>
>>> Hmm, so after this patch, are there actually any implementations of .probe()
>>> that return anything other than 0 or -ENOEXEC? I couldn't spot any after
>>> a quick look.
>>>
>>> Willkexec_elf_probe() can return -ENOMEM if memory allocation (kzalloc())
>> fails inside elf_read_phdrs(). This behavior was previously discussed in
>> the first patch of this series [1].
> 
> Fair enough, but I'd have thought it would be easier to special-case the
> one -ENOMEM path instead of changing all the backends to return
> -ENOEXEC all over the place (and hoping people don't start returning
> -EINVAL again in future).
> 
> Will

Returning -EINVAL from a probe on format mismatch is semantically wrong
on its own — independent of how kexec_image_probe_default() handles
the return value.  x86 bzImage64_probe() and s390 s390_elf_probe()
already return -ENOEXEC correctly; this patch just brings the remaining
backends in line.

Also IMHO, checking for err != -ENOEXEC in kexec_image_probe_default()
is more robust than special-casing err == -ENOMEM.

-- 
Regards,
Mukesh Pilaniya


