Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D4CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYwpi82W7VIihj8uBfuL+qMQaHX4FplKNy0RIRsXcCU=; b=wqRdgNedBJHZgzIDW56UqrWIGs
	xk5UJ844CW56CsgkKd7I6aEeD2ihSc4rZSskfaAQa55kxj0G5SGtKvpzrF69Wk2e1+QmLtkr7W4xw
	I4Hd//NaoJJXowg1Q6JOqN77IkvyJCk0aQLQcUdud4wqtowzIZNX/aEo8h7vAVSBP76Nj5Oit/v+e
	YYE2FWAlaGmMrdrOjO27SCafM7bLvs+7XbDdUsL1hi2w4qLqYNwJh9YsiLcS/jO5M3PIWXFAW/33w
	2RSr2u8aaK5TTLpfp8zgOYulFUv/jNZbXOnPYvjy3oATpSVshKs/kAiJgjMi1YjLvLfPrNfjMoFzz
	Y2A0r1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7zD-0000000DOlS-0USt;
	Mon, 01 Sep 2025 17:06:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4kD-0000000CiGI-2R4H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756733928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WYwpi82W7VIihj8uBfuL+qMQaHX4FplKNy0RIRsXcCU=;
	b=YRG/ThSg+vf5ZEJ0hj2j8TYCJ4er4FkTLnR1/gq83+s3TxcBZqDhnQySUgR9xO7vhHDhmn
	AbEZAOz+jBQGdZPcNm63wz97VnaIYBcnnpqiseo6iNrP2L37bjQm+cU2EoXTCjAktb+2t8
	l5LNVEYzkIPyOgP7qjr6/Xdz8/W0Js4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-0Q1jGun2NliKwuDjEvOm9w-1; Mon, 01 Sep 2025 09:38:47 -0400
X-MC-Unique: 0Q1jGun2NliKwuDjEvOm9w-1
X-Mimecast-MFC-AGG-ID: 0Q1jGun2NliKwuDjEvOm9w_1756733926
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ccfd90630aso1871853f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 06:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733926; x=1757338726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYwpi82W7VIihj8uBfuL+qMQaHX4FplKNy0RIRsXcCU=;
        b=RTogrVxiJyKvkElY5jmCnDX6KCI1BnCceuY/GNM5BUk+c3ePmuHi3PoMCMU/Oz+QVK
         e629pGJ9qacShq4HxwWgCKZywTn99my5UE6dwZAxa+gFyzCXX+XQV7vRprhhvI5SXOfq
         g4I5ReAq7Jvahgj1631WB/H1ZJxQGqkN5rijv4A+BlaAajIv4phlUyZP2FAwAxNkdb+m
         H4aMf+UvtskB8M8BUbhBAk3U4PrRaCErFY3/cjpDduADVafKFCvcUr8eE7RdKvbCfD9/
         jTSfLJGtvgPFFzxp7JompIWMMIRC8cOErC5HP6xkkrECWggAc4fYbP9BKIJLsGwmD1lQ
         3O+g==
X-Forwarded-Encrypted: i=1; AJvYcCUbhLnhiEModwyh/UJsnMK+LWTXZapvUNtOPHbbIInFsZMhP4RWRzQRIp3OKetdbUr/Fkp4yL1VNY4qriN8OEkW@lists.infradead.org
X-Gm-Message-State: AOJu0YwUeLbEBh0n4rN86ZrP1CmCxfD30ma6S77MjznTC0HsGRP210Jb
	x3cysIvfOgMaMV8OBRu2DG6xIhoLXqiu+ypTG8iF9kz6WG+cUYS9Kjh2auvTkXRfKaxxjFSXZB7
	GI82sDOX5H1uypA2Zy0rPeWtkb6s2zZ8hCb2dm2tOpJKc33FHT5LRYnFIibL3JsG2y69xBNX6h6
	C7
X-Gm-Gg: ASbGncsHscGdqZKvTfdHTGf8ecmnzae4ib/UoESXljZc9Juz5BNbkcYRHyJ+mEdwnZU
	WUwxPOCJNIeBNRUL0nDcA1tUxI/Uwf+nROPSRI7ZI0YoejoGQP+cv8g3MlhaOXcxGe6y2wGTwa6
	4COHfpytCXZue7IG8LPe2no6EOOSPLTJlDof69fblnTSKv00jPMdGclNcdI9oAflYzmOX5GUhFO
	KfpTzhDiC47VHyv3XiPp2IB/dw8q/DuJOushXhMZ2EVyP2BtaGogj7/3T+4Zk+FJsiVTCRdtpb/
	opFGUTeHdXLosV0Tx/XdYSD83Gelj13xREYLBsKmIrwvB1CLVEHXZ55OoyFwD2dOyBujfnlecA0
	pgqXyXJHzZvXVQu+7C4EEj8QpHkxypdWVe/MCUNW5F8TFICs3vKSztQJwy1EAWF2x+RY=
X-Received: by 2002:a05:6000:2102:b0:3d3:8711:d934 with SMTP id ffacd0b85a97d-3d38711dcc7mr3315123f8f.14.1756733926003;
        Mon, 01 Sep 2025 06:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3DliMw41VU4hxaIWHMLNG+OBiPKQ08qUXWAlqHFXtcpv953/vrh5P5rTJMXfl1jn2z2RQzw==
X-Received: by 2002:a05:6000:2102:b0:3d3:8711:d934 with SMTP id ffacd0b85a97d-3d38711dcc7mr3315078f8f.14.1756733925456;
        Mon, 01 Sep 2025 06:38:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d21a80c723sm10359081f8f.9.2025.09.01.06.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 06:38:45 -0700 (PDT)
Message-ID: <48ee3dd0-9af3-4513-aef2-25e185cce349@redhat.com>
Date: Mon, 1 Sep 2025 15:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] copy_process: pass clone_flags as u64 across
 calltree
To: schuster.simon@siemens-energy.com, Dinh Nguyen <dinguyen@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-2-53fcf5577d57@siemens-energy.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901-nios2-implement-clone3-v2-2-53fcf5577d57@siemens-energy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xBhYz5td3lt9aUZwjsKst4EQpQlmxQRc5B4CotM5DIw_1756733926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_063849_704910_ABF5D48D 
X-CRM114-Status: GOOD (  18.38  )
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

On 01.09.25 15:09, Simon Schuster via B4 Relay wrote:
> From: Simon Schuster <schuster.simon@siemens-energy.com>
> 
> With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> clone3") the effective bit width of clone_flags on all architectures was
> increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> However, for most consumers of clone_flags the interface was not
> changed from the previous type of unsigned long.
> 
> While this works fine as long as none of the new 64-bit flag bits
> (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is still
> undesirable in terms of the principle of least surprise.
> 
> Thus, this commit fixes all relevant interfaces of callees to
> sys_clone3/copy_process (excluding the architecture-specific
> copy_thread) to consistently pass clone_flags as u64, so that
> no truncation to 32-bit integers occurs on 32-bit architectures.
> 
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   block/blk-ioc.c                | 2 +-
>   fs/namespace.c                 | 2 +-
>   include/linux/cgroup.h         | 4 ++--
>   include/linux/cred.h           | 2 +-
>   include/linux/iocontext.h      | 6 +++---
>   include/linux/ipc_namespace.h  | 4 ++--
>   include/linux/lsm_hook_defs.h  | 2 +-
>   include/linux/mnt_namespace.h  | 2 +-
>   include/linux/nsproxy.h        | 2 +-
>   include/linux/pid_namespace.h  | 4 ++--
>   include/linux/rseq.h           | 4 ++--
>   include/linux/sched/task.h     | 2 +-
>   include/linux/security.h       | 4 ++--
>   include/linux/sem.h            | 4 ++--
>   include/linux/time_namespace.h | 4 ++--
>   include/linux/uprobes.h        | 4 ++--
>   include/linux/user_events.h    | 4 ++--
>   include/linux/utsname.h        | 4 ++--
>   include/net/net_namespace.h    | 4 ++--
>   include/trace/events/task.h    | 6 +++---
>   ipc/namespace.c                | 2 +-
>   ipc/sem.c                      | 2 +-
>   kernel/cgroup/namespace.c      | 2 +-
>   kernel/cred.c                  | 2 +-
>   kernel/events/uprobes.c        | 2 +-
>   kernel/fork.c                  | 8 ++++----
>   kernel/nsproxy.c               | 4 ++--
>   kernel/pid_namespace.c         | 2 +-
>   kernel/sched/core.c            | 4 ++--
>   kernel/sched/fair.c            | 2 +-
>   kernel/sched/sched.h           | 4 ++--
>   kernel/time/namespace.c        | 2 +-
>   kernel/utsname.c               | 2 +-
>   net/core/net_namespace.c       | 2 +-
>   security/apparmor/lsm.c        | 2 +-
>   security/security.c            | 2 +-
>   security/selinux/hooks.c       | 2 +-
>   security/tomoyo/tomoyo.c       | 2 +-
>   38 files changed, 59 insertions(+), 59 deletions(-)
> 
> diff --git a/block/blk-ioc.c b/block/blk-ioc.c
> index 9fda3906e5f5..d15918d7fabb 100644
> --- a/block/blk-ioc.c

(adjust To: list)

Hopefully we caught most of them. The ones not called "clone_flags" are 
a bit nasty.

We could have split of some changes (e.g., trace event), but likely not 
worth  it.

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


