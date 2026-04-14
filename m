Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEC3F9D0D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs3FTaDVrhGRqFvZSZtkN7YawmSROR8+0cRgAi/+3fA=; b=owONKjV02DGbnr2gvp87EtyBdk
	BKcsXjNQijjTSXsLw8Bq9/bih+DU/YmBpsx20WNS27dGREjtPDCwufNUnN+Gl/NAYoqOsSv7doGkP
	Iv99G6EYyeBurumqbkN6DO2oxD3QI+LkhlhOvyi2Mmkz9OmXybp6LUqswDwC0qMUKyBu053SAR9UY
	DrbogmSFxFq2jr0dna24gTcm25GmKWWzNCslTrQJ8VtlTG+XAAX94Zag4wj8sjMqtvTtSNoLRxMMe
	XFnJDHP0NZbZtYAFP2tEyFiZTQHVqAfrnRbbZCltf/djUrFbvvgcfpxMq5UKx015CPtu+Eq6nXb/M
	8un7c+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCf3s-0000000HTYZ-3v69;
	Tue, 14 Apr 2026 14:48:20 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCf3q-0000000HTXn-4Bna
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:48:20 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso58958905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776178096; x=1776782896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qs3FTaDVrhGRqFvZSZtkN7YawmSROR8+0cRgAi/+3fA=;
        b=P/guCwW1CNI+Pq4EAXGUXmgnny9G72rcLIgBpcR9RkmXa03voWUsT+A/x5yfFsAQtO
         2pMelcdjw8dtXemFP4+yylrfNGCGUVubkO36IwS+kriRpfDqU4G8BAVtWmDnALR65EBa
         rw4yglkAUmSx3X/8hApgSponRaxlvXpUxtPasW29v5RijNgAkVYlZYjvpTjqrJ4+/Ov1
         zlUYrwXhbw8xqgSlWugNdrdqfy9RUvxIjxn4CMt4T/WHWXwEnf65phKxxyXMZA+5Inm+
         ao33BJA6YfG5bkoKJt6dC/kZRZMO95wD64dGaXuW5TQjfgbrnIiOksQbjjObXPN0A3rI
         gcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178096; x=1776782896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs3FTaDVrhGRqFvZSZtkN7YawmSROR8+0cRgAi/+3fA=;
        b=L34MLMh4xzpzg/rPj9Yks5Y+As0+IW8T0dbut5fAemghrUJI9vFsi6fl9bznW7KNE9
         5DowJERSQsRuzXSmEpspYCcMTU2S7AxlUT5MVV9qdsAyyZE8RYhPHx+uK4Bc1jDM6K3S
         8BAyWkHU+J4DhjGxmYuwLKlHHJUIern9AtitKe3tE0I+Ys5CnbzR7C0qFxkPWcJsmsGr
         vBdj+Mgssjh9bpt4Y0iyxQkjOtf5PR/g3aX+oU9MFtFLiU8nyEWbAq5VkeRmulEqcEOt
         v0jJ5yzSzF6hIADMbK6NlmJtWdVCxJCujofgmxe5I6i3AIg3ZAQQa1M/IWFuor7qnFMs
         26AQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HCegXr8DR2eNPGTf8i1h81XIYM+XJVZPNkW0IxL27yMwBUpzu4WEXQIYx1G370g9Bh020vO4e4rw4LTp+MNMT@lists.infradead.org
X-Gm-Message-State: AOJu0YwLL61np2l+/QuoLq3CZMTiSGQ8RQRXyFjoLgJeAMm/Nyw4xn2T
	LpKg0Ha5t7WIaQznitlk7R0BBpkPYUXFW4O6LSveoWiYZG7/ZTqyhaq2
X-Gm-Gg: AeBDievye24dzgPNz7nKwrmjlhIXMJtrBDCjyzfyYd3zT4NGOgdkGLeO0GOoodFU9KT
	IgTcsbCilHLL1E7yasVWfzxCm8AQaFK0FqDUGo7b1ojvI/gwkuLo5Z4S6uT6daV8/sfx5SdFEYA
	zLvhGxZkFlqKIRbp7rZO6vSUfEV/2G+q2+jzhSCX4J3Dpu54HkNLzMdV0mkq8mGxaCQIHKVBbZR
	c6hC9pItDGXVusR60+1wGorPGMnHETWpDYJK2GbxijIZMWbSxAf1VlIgsI0btsWvLEn2Dt01Sa7
	Jy27AL7yrrqrGbDR+Y5utd0Q0WQpeWaMvEW69Pv3Uq84491VgGg33MbVlUshncE8rnonKvazkY5
	WOL+DC2NFOOAU2k8V5zBsF7wFIOlQmvDWSlDU4w8ZXts9fQENX1DldL6nZ3N3wYYWuwtpR80LAT
	zxU2ggS8wZfV235BjRf6P8xhCBwoGpTaomQLsGdOdF4V5nbjvX/WXW9L9BOPpF68Aht73oi/95Q
	uKZoQJbTL4RK9DVoc8lQNcQ4mzed94//V8+pXCx98nl6Eo6wOIiYHfAUDSWtVmqbzEJg4O9nkXZ
	z1m7NoSNQwnaynj5RqZGEqH6WxZtEC4solVYBiB2vK9YNxQgOGEYmA==
X-Received: by 2002:a05:600c:19cd:b0:488:c239:d498 with SMTP id 5b1f17b1804b1-488d68712d5mr246717425e9.8.1776178096002;
        Tue, 14 Apr 2026 07:48:16 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e002e3feaf8ac5b1b0d.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:2e3f:eaf8:ac5b:1b0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d768afsm183992125e9.2.2026.04.14.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:48:13 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:48:12 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/2] bpf, riscv: Remove redundant
 bpf_flush_icache() after pack allocator finalize
Message-ID: <ad5TrE-wIiw4rHvg@mail.gmail.com>
References: <20260413191111.3426023-1-puranjay@kernel.org>
 <20260413191111.3426023-3-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413191111.3426023-3-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_074819_044001_EFEE356F 
X-CRM114-Status: GOOD (  12.58  )
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

On Mon, Apr 13, 2026 at 12:11:09PM -0700, Puranjay Mohan wrote:
> bpf_flush_icache() calls flush_icache_range() to clean the data cache
> and invalidate the instruction cache for the JITed code region. However,
> since commit 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the
> BPF JIT"), this flush is redundant.
> 
> bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
> region via bpf_arch_text_copy() -> patch_text_nosync(), and
> patch_text_nosync() already calls flush_icache_range() on the written
> range. The subsequent bpf_flush_icache() repeats the same cache
> maintenance on an overlapping range.
> 
> Remove the redundant bpf_flush_icache() call and its now-unused
> definition.
> 
> Fixes: 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the BPF JIT")
> Acked-by: Song Liu <song@kernel.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Tested-by: Paul Chaignon <paul.chaignon@gmail.com>

[...]


