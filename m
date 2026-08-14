Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8264EC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALhGJdbaDFJ0vhwNsd55hO+rgDN52tftmXEPKqTi+XU=; b=lOebRLSBvPHSmPL20LZnM1q5x2
	j54fIY5d9sx3kNbSv+13LrjwmkgKt8S3goQ0ZI5iFrd6Ief5PaZgeblaoQB/6Hyk0rJ+g7YpmGD1Z
	3rav5pvVqcbpo/vK/xSTSi8mxKWl60sBrHM2uU7FOZay0B3PXn/KkEuDMjGzI1sO3T7RdMmurC2a7
	bLaa6wNmzWxP/LiQau16wmj3MUODdoYOHp3aQVYDLMzPorh8AM55jnanjayAwUfvJKUxk504gKPmt
	hMi13h4vYiD5Z0hjAN2eIOU3pK72NUuolKGfi2/Qm/6YMcQbJR8JzoQVfBeNcEbQlOxPgBJUSLI14
	U0grlUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvh9-00000002zN5-3j9j;
	Fri, 14 Aug 2026 17:27:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvh6-00000002zLv-3Vy7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786728467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALhGJdbaDFJ0vhwNsd55hO+rgDN52tftmXEPKqTi+XU=;
	b=KGjyFqK2FsUXyVbx33uyyXM542P2RHujeIDJEH6aLwUbeaI4X2rLUJzDh7gAMz1RBqvyNv
	UW1xQvjobleCl5Ppc+SZqISZ1uOkVhtmkJmJ1HS0l5xXf2VmAetvEP47EJfw7A1YsEV4q+
	es0hHhyxPPDsAZPcCiKiRkIA7/xPEM0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-GzV4I3WMO8-wVKj03Q5HGQ-1; Fri, 14 Aug 2026 13:27:45 -0400
X-MC-Unique: GzV4I3WMO8-wVKj03Q5HGQ-1
X-Mimecast-MFC-AGG-ID: GzV4I3WMO8-wVKj03Q5HGQ_1786728465
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso2133156a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 10:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728465; x=1787333265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALhGJdbaDFJ0vhwNsd55hO+rgDN52tftmXEPKqTi+XU=;
        b=IVMYWZndl72vuSIRoUUGhLy9Nh593DWyCyosTgB4Hw0Aje3XhqyrYgLdnlHoNaKLA5
         Jl24/DAPx9TziecyYYAKetJTc4r7Mld28jDkwU+rE5+AeuDqZRVMclXei96PK3DX0f2Y
         aZYXS7EjRqUjC6UUohwWF0U+qc7JNtepAPXyPTOiE8QoWH2B5zt9suICx4eEzi4yf7Rt
         dFb5cjDKPuPzk/RIMudQvoQwGdalTQ/tCnDHU51ZIJJ2mtawZ2+VYH0fINniA/AcNTYr
         URE8N7TNgFexBfOnUPu9d8sccxZapZvLA9N4FC42wVTp1usDJR322yqcsOKCJlXN/VBe
         IivQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwwF2j4b3F8EuGTbDlNl9OkkR93tPV1YpMR74zdu9PlFWqsnBBIbk9tnOZRvrcp7buslSebjQLLS2/+U0xhawg@lists.infradead.org
X-Gm-Message-State: AOJu0YzzxVWP3GQlw3DycA3dAZ0RiyFFG/JHhOiCM9ARWjjdIsOqeUHr
	PU12c213GsYSPLyLhBpDOnTyJNnGPyStveDJw4u+sxyl6NghEbETDZXOXy38+0NMYcoOVvK0lEb
	MWijwA/ie7tzKDJJZyzEgAuva4PhCYaHcu3I0b0w/d8gbDycByEiKN0utExqK86rKy5l28NKeRB
	cI
X-Gm-Gg: AR+sD12Jb74Ykd9LZ6Gd59Eq9mGu5lI5efn9GjIeT+6KORT/gjxRdzFCtpiHjDkrpue
	aKih0jRf/I2Y+KhczAXJPx2h5wo7emyyPd7951UVobcBdpJFnRkx6fshx+liM2wEnJF7PWrnuRz
	HO4E0qB5RJ1arcu+YshSu9GWiM6D1W0RIVyjbV+NjyBCgoI+634UNFoVurwTF2Wd5wx5K0DxkB9
	w+HLZZkV5O5+e680SLwH9Z9l2C1YcEehRRGftIQsO9hDzo7XsUdxMtPP+iHhQxbRxVP7toBGOho
	jyAMpXt+r7XW1lKJc9NffipoDQigSj9QFH4VxG2BPyI+CXEU+es7qSQ9+YaqXBuZ5942aTGFJs/
	v52JDlSElsZI2ZPJ//g==
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr9535905a91.4.1786728464568;
        Fri, 14 Aug 2026 10:27:44 -0700 (PDT)
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr9535821a91.4.1786728463979;
        Fri, 14 Aug 2026 10:27:43 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebbcbb78sm3512184a91.13.2026.08.14.10.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:27:43 -0700 (PDT)
Message-ID: <9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
Date: Fri, 14 Aug 2026 22:57:36 +0530
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
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzv79c23j6.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5YJgr6GJXng8IdK5ueNm5qLZlDAOCfGib1rE3ddydqw_1786728465
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_102748_963916_582E9C26 
X-CRM114-Status: GOOD (  21.89  )
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
On 14/08/26 7:43 pm, Pratyush Yadav wrote:
> On Thu, Aug 13 2026, Mukesh Pilaniya wrote:
> 
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
> 
> Sounds fine in principle but can you please also share what the real
> problem you face is and how changing these return codes helps? These
> error codes are uAPI and while we _can_ change them as long as we don't
> break something, there should be a clear motivation for doing so.
> 
> [...]
> 
While debugging a misleading error on s390x where kexec -s reported
"syscall kexec_file_load not available" instead of the actual EINVAL
from a kernel command line that exceeded the architecture limit, we
traced the problem to the kexec-tools userspace utility treating
EINVAL the same as ENOSYS and ENOEXEC -- as a signal to silently fall
back to kexec_load().

kexec-tools supports two syscalls: kexec_file_load() and the older
kexec_load(). With -a (the default), it tries kexec_file_load()
first and falls back to kexec_load() when the syscall is not
implemented (ENOSYS) or the kernel does not have a loader for the
image format. With -s, it uses kexec_file_load() only with no
fallback.

When the kernel returns -EINVAL it means something went wrong while
loading the image, not that the syscall is missing or the image
format is unrecognized. kexec-tools should not fall back to the
older syscall in that case. However, some kernel probe functions
currently return -EINVAL when the image header does not match,
instead of returning -ENOEXEC. Keeping EINVAL in the fallback set
to accommodate these probes has the side effect of also hiding
genuine loading errors like an oversized command line.

kexec-tools should only fall back when kexec_file_load() is not
implemented or does not have a matching loader -- not when something
goes wrong during load.

The fix on the kexec-tools side is to remove EINVAL from the fallback
set, but that requires the kernel to be clean first -- probe functions
must return -ENOEXEC when they do not recognize an image format, not -EINVAL.

kexec-tools patch:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

A review of all kexec_file_ops.probe implementations found that arm64
image_probe(), riscv image_probe(), and loongarch efi_kexec_probe()
return -EINVAL where they should return -ENOEXEC. x86 bzImage64_probe()
and s390 s390_elf_probe() already use -ENOEXEC correctly.


