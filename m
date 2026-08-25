Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AA4C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 05:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9OwnSzTLO9oC5dFpcmND+TzPw2bMH6k9WMlDpSF/Bk=; b=LLD6p+Dvogf5kNzFPG/7qCAhOa
	LXM7Eljx3TWD5aicczVs5YtQkJ3fxuSGDBdNqh4SCs4Fk6NWdfFhAMEJ0rrH6Zi4hwZtO1JOVT/bw
	/PvAgmdaveKBaIgGXk0GyenEhrrfTpp8drLo+zFNukxg43/MMhmqHecNnWrM8WAklA6Bmbcl87juq
	3q9CRd981kSZqp5guFgWwJY2bIohYgubhmjY4vtKdK69Qy1Ih5uSkeR7dJPfKTZg6s/1qt2QA5jsJ
	b93/ZFMebNRUtxaPLqe/LGuip972NcdQKWOklwwLBextALJPZroZew2NgaBeEhqTv1Fk4OWMi0wFG
	ik27Jzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjU7-00000000AEv-2C29;
	Tue, 25 Aug 2026 05:14:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjU2-00000000ADR-2aoU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 05:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787634841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9OwnSzTLO9oC5dFpcmND+TzPw2bMH6k9WMlDpSF/Bk=;
	b=D/DfWQ1ojVexHfaX+44I0hDGOLd5IdoSKLR71/TQzVpNJ8h1Hw/d5nbwBSlx3hg1EvMDJE
	rb6fBJf7zpO/MAUbD2HNMRXA+ZMbvJPJNWUTF+vXqSBF+6fowabNf+Dxfx0fe9ToxpCTvy
	jTXI7uM4Qe1jCkWdBxDvdTzm17yJab0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-B8PM04uVOcSB3mFSPq5lYw-1; Tue, 25 Aug 2026 01:13:59 -0400
X-MC-Unique: B8PM04uVOcSB3mFSPq5lYw-1
X-Mimecast-MFC-AGG-ID: B8PM04uVOcSB3mFSPq5lYw_1787634838
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4647683a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 22:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634838; x=1788239638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9OwnSzTLO9oC5dFpcmND+TzPw2bMH6k9WMlDpSF/Bk=;
        b=RkNIFaXkYgO2ypuDZj15AIKekCRmvI151zsRA324CSkys1NHP6DpFad78SJuFXy7ls
         GhBBFJPFW+QKM4hhfKpQHE5weLqLTGUDBV2SMHusG84JriOrrPNJn7jqjD364m05YOEU
         oy0k55uHVwHHCKrzGCs4G8MD0J1SK7ge8M+aq18J2BlKnhKfMX97tkjBXNhpmImq7rBm
         02+egQtFG19/PHc4MMK/d2z0uptAs4LXIsBnqykubwck0HoUDxl44B6hQHmPo5ZOdhRZ
         1x2Dgkaa/1Jndqk+c+iePv3DwiLNgcLiSvas6I6+f0ZhlCVZRXaTVmXlGQB/CyzCSoxH
         DqFA==
X-Forwarded-Encrypted: i=1; AHgh+Rq82aHIoZpGsIQinEG4o0t6Mxb/ZAO8xesOKn9GOANo9BtW6o5dmotDPJHEsRqVXOfnuy1+GGGTSZ5ZHxjiKY0Z@lists.infradead.org
X-Gm-Message-State: AFuF++lpXKA322KTDAgdGuly1dpkLvFGceJ1zvfC8Vweigf77ndTphl9
	XArNetHyj/7Kiw9cP4LMscEKIWF2e5WV+Sc6ZurZ5mLqn65V7fYL7B0JfdIGX1UKU3fDAiKam0V
	8XZ+tDDWbA1rOT5q6iVNCrH+qE5c7Ob/+NvLB3am8xq+NHEkwY3WWihw7xp38EewBF8VbHVjKVK
	bc
X-Gm-Gg: AR+sD13eZ5yabhodCf00gpzL9f9CRNADRgTsi25J7i3kUjdsb0Hynwj6IUhtvIVUSaU
	SKMC4RNCdYZ0VSgYoq2//kP1f2S5KA7XrhRredLYu+AuNbTinqmmbDE7uzQE+LuvJtj70H4cxsy
	k2o6gmpo8fNwgU4KJQTOP8DpbGFeYs8tR/UAUMNDVbYb+iGAXIK0htTEwAVyREbA2nBfJDeEb2c
	7GfNmJKDR2ohm5tFq7FNwLN0/5olNS+zYeoTR9LsXlWuCfBMfbqDxaxSk+YQYIUZJK4y8GN+P9/
	rKRtPMYmUeViYC6HadsNsWkmYCcLOsLnRPnf6Y+okZK34uQxUVezYcuMvnM0SytWy0e10vuCaej
	5YFLhFawub8fXNHfkuw==
X-Received: by 2002:a17:90b:184f:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-3964603084fmr8668917a91.0.1787634837958;
        Mon, 24 Aug 2026 22:13:57 -0700 (PDT)
X-Received: by 2002:a17:90b:184f:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-3964603084fmr8668825a91.0.1787634837463;
        Mon, 24 Aug 2026 22:13:57 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645da08desm2156603a91.17.2026.08.24.22.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 22:13:56 -0700 (PDT)
Message-ID: <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
Date: Tue, 25 Aug 2026 10:43:48 +0530
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
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <aoxQFxuzZ1AHmM8d@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NUFvXPKXpAj6yYDKd-QRZdJL8-FACMtDzAcwwv6SduQ_1787634838
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_221402_745592_C359FBE9 
X-CRM114-Status: GOOD (  17.75  )
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

On 24/08/26 7:37 pm, Will Deacon wrote:
> On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
>> Several kexec_file_load() image probe functions return -EINVAL when
>> they do not recognize the image format.  A probe function that rejects
>> an image should return -ENOEXEC to indicate that the image is not a
>> recognized executable format.  -EINVAL implies a problem with the
>> syscall parameters, not with image recognition.
>>
>> kexec_image_probe_default() iterates through registered loaders and
>> returns the last probe's error code to the caller.  That error
>> propagates as the kexec_file_load() return value to userspace.
>> Returning -EINVAL from a probe when no loader matches is semantically
>> incorrect and misleads userspace about the nature of the failure.
>>
>> Return -ENOEXEC from all probe functions and their helpers when the
>> image format is not recognized.
>>
>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>> ---
>>  arch/arm64/kernel/kexec_image.c   | 4 ++--
>>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>  arch/riscv/kernel/kexec_image.c   | 4 ++--
>>  kernel/kexec_elf.c                | 4 ++--
>>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> Hmm, so after this patch, are there actually any implementations of .probe()
> that return anything other than 0 or -ENOEXEC? I couldn't spot any after
> a quick look.
> 
> Willkexec_elf_probe() can return -ENOMEM if memory allocation (kzalloc())
fails inside elf_read_phdrs(). This behavior was previously discussed in
the first patch of this series [1].

[1]
https://lore.kernel.org/all/0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com/#t


-- 
Regards,
Mukesh Pilaniya


