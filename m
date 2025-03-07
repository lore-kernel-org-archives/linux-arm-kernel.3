Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R840fbpOCY97ygCHkbEX+Ner86gAnwGHvg1aopa7qhQ=; b=DJiEl27Sy2TI8GzL2nAFSWbwPQ
	0WAnvBsuTKe788h8K/AfTgSly2YfOMa2ZFI7Rx536xv36jz+ayIeTqqTyzcr+iQCjgQ1mL0optKEE
	ob/VeQ0JPqx+qlNK4PC2UiLna/TBLygtGdSIu88lOtbEvGXR0bji86Tc6R/SDR9m4FAJzigMHWb/M
	dx2suXjEbVlsZANdleir1om2/3FqdsQ9zdQl6VCXhqQATJQ2h8baL1FS3Bsy+KGpk0JC9tPDJdWuO
	dpCWA3YI7fLFSsxVO9DqU4RWMTCoitGpGPVmMOV9eoWr6+EyNMTwmTfeC7lvdBVLPN7HiBRTQfGfE
	PzB5geeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUAA-0000000Dk9g-1Rpf;
	Fri, 07 Mar 2025 09:38:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqU60-0000000DjFY-18Oy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 09:34:21 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bc1aa0673so6902425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 01:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741340057; x=1741944857; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R840fbpOCY97ygCHkbEX+Ner86gAnwGHvg1aopa7qhQ=;
        b=T+xUV7sINNsWxU5v5k1L0pqEoDPxiSrtcplFI5JQAtNqndKFUPe+l2xK7lhK27xPI6
         H/lN+YUCIYUF1EpP0jhW+5HALitYutIl0ZEal/2HgIZ8bDclHf2bh2/3ZLkGwUmRHp3v
         CFdSqTP0h0/FFZMexdSjGtzRfP2wdgAqvVUMpJvFhFYJaDOyzJbneJ7uzkW+e3jTx5IM
         JAoTn9cNsSlZvqO5ZIblNxiW0YqyZ7A+wL/eXKo0qPAhEQB+aVOFbzytMeK2jRuSAGY7
         SWihemkPJ4MdBwFHpi5ApLCer7btAwL+dEjGTeMNOCXHV055OaFmJ5sFAaYc/wukR39t
         wXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741340057; x=1741944857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R840fbpOCY97ygCHkbEX+Ner86gAnwGHvg1aopa7qhQ=;
        b=I3X0UqIcVyab0vGTjlgp9mMT7XWBdp6ph6X+BracCdEH9oapnBZ9M1HHeuqOfgd+x1
         qUCdIWCKiW91FeeOMldbOITYG3sIya0LFKCNNubdjLZZSnePqXNKLxfmKHJKm1W/TjSI
         fNte8KK63dj45LMDgiRRqhWnJKOw06OZ5TDK6MoWc9mb4c3CQa/XuUUKvCGzoEvElqda
         yu+F1A8AbDUe/wkoCcQUCLdPZrzzM3EINtVdJ4nqE8I1zNXRCZoSb27/O7g/ePmGlb2F
         1uXu1AlLX3nWlj1VhzBQpQEYOdeXzCyjjw8e4v2YA1jU8z43RZRLo1wGsHZqltpy/PZ2
         t3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/RHA5X612ElzLuyKbLsqOKNUzj9xlYQC/knUAF90a9hw2QgpfU4+xu3vZEIXT9MrUii6hTiBxvMhpmjyBmFu3@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ/p+9WsdbSZ+1MnYD+4fW9KqxNphcVeHkEUb+Wf9iccer+2e1
	FWjnTxghVqkuH6fzxYaJ9AnEvoBW+pzZ2XJyd6HjU/n1fUmCaDj+olQfrSQZXSp9y2tyH05eOzv
	oHuCxt9wYkeRv/A==
X-Google-Smtp-Source: AGHT+IFY1Xk8hcEAqu7olINreEmrik4Yk5IQrPDjwNCaSq6h11n3n3dB0r47iG1PlbW7axsMkqZodWf0on/+u8o=
X-Received: from wmbfl19.prod.google.com ([2002:a05:600c:b93:b0:43b:cfc3:aabb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8b:b0:43b:d12a:40e1 with SMTP id 5b1f17b1804b1-43c5a611738mr17712685e9.18.1741340057664;
 Fri, 07 Mar 2025 01:34:17 -0800 (PST)
Date: Fri, 7 Mar 2025 09:34:15 +0000
In-Reply-To: <20250306185447.2039336-1-cristian.marussi@arm.com>
Mime-Version: 1.0
References: <20250306185447.2039336-1-cristian.marussi@arm.com>
Message-ID: <Z8q9l0vDTLpbo8UR@google.com>
Subject: Re: [PATCH] firmware: arm_scmi: Balance device refcount when
 destroying devices
From: Alice Ryhl <aliceryhl@google.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_013420_306956_9D89188A 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, Mar 06, 2025 at 06:54:47PM +0000, Cristian Marussi wrote:
> Using device_find_child() to lookup the proper SCMI device to destroy
> causes an unbalance in device refcount, since device_find_child() calls an
> implicit get_device(): this, in turns, inhibits the call of the provided
> release methods upon devices destruction.
> 
> As a consequence, one of the structures that is not freed properly upon
> destruction is the internal struct device_private dev->p populated by the
> drivers subsystem core.
> 
> KMemleak detects this situation since loading/unloding some SCMI driver
> causes related devices to be created/destroyed without calling any
> device_release method.
> 
> unreferenced object 0xffff00000f583800 (size 512):
>   comm "insmod", pid 227, jiffies 4294912190
>   hex dump (first 32 bytes):
>     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>     ff ff ff ff ff ff ff ff 60 36 1d 8a 00 80 ff ff  ........`6......
>   backtrace (crc 114e2eed):
>     kmemleak_alloc+0xbc/0xd8
>     __kmalloc_cache_noprof+0x2dc/0x398
>     device_add+0x954/0x12d0
>     device_register+0x28/0x40
>     __scmi_device_create.part.0+0x1bc/0x380
>     scmi_device_create+0x2d0/0x390
>     scmi_create_protocol_devices+0x74/0xf8
>     scmi_device_request_notifier+0x1f8/0x2a8
>     notifier_call_chain+0x110/0x3b0
>     blocking_notifier_call_chain+0x70/0xb0
>     scmi_driver_register+0x350/0x7f0
>     0xffff80000a3b3038
>     do_one_initcall+0x12c/0x730
>     do_init_module+0x1dc/0x640
>     load_module+0x4b20/0x5b70
>     init_module_from_file+0xec/0x158
> 
> $ ./scripts/faddr2line ./vmlinux device_add+0x954/0x12d0
> device_add+0x954/0x12d0:
> kmalloc_noprof at include/linux/slab.h:901
> (inlined by) kzalloc_noprof at include/linux/slab.h:1037
> (inlined by) device_private_init at drivers/base/core.c:3510
> (inlined by) device_add at drivers/base/core.c:3561
> 
> Balance device refcount by issuing a put_device() on devices found via
> device_find_child().
> 
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/Z8nK3uFkspy61yjP@arm.com/T/#mc1f73a0ea5e41014fa145147b7b839fc988ada8f
> CC: Sudeep Holla <sudeep.holla@arm.com>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: d4f9dddd21f3 ("firmware: arm_scmi: Add dynamic scmi devices creation")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

I was not able to reproduce the memory leak after applying this patch.

Tested-by: Alice Ryhl <aliceryhl@google.com>

